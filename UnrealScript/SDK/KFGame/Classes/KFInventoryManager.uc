//=============================================================================
// KFInventoryManager
//=============================================================================
// Interface to control and interact with the Pawn's inventory
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFInventoryManager extends InventoryManager
	native;

`include(KFGame\KFGameAnalytics.uci);

/** Weapon we had equipped before the current one. */
var transient Weapon PreviousEquippedWeapon;

/** reference to the currently equipped healer weapon */
var transient KFWeap_HealerBase HealerWeapon;

/** The number of grenades the character is carrying */
var byte GrenadeCount;

/** The carrying capacity (or blocks) available */
var byte CurrentCarryBlocks;
var byte MaxCarryBlocks;

var byte SelectedGroup;
var byte SelectedIndex;

/** Ignore our carrying capacity if this is set to true */
var bool bInfiniteWeight;

/** (Server) Whether or not this player has the trader menu open */
var bool bServerTraderMenuOpen;

/** Sound to play when we receive ammo from an already owned weapon */
var() AkEvent AmmoPickupSound;
/** Sound to play when a new weapon is picked up */
var() AkEvent ItemPickupSound;
/** Sound to play when we pick up armor */
var() AkEvent ArmorPickupSound;
/** Sound to play when toggling fire modes */
var AkEvent SwitchFireModeEvent;

/** If set, attempt to turn on flashlight of the next equipped weapon */
var bool bPendingFlashlight;
/** The time at which we were last given a weapon */
var float LastCreatedWeaponTime;
/** This stores any GFxMoviePlayers that are inventory may be using */
var array<GFxMoviePlayer> OpticsUIMovies;

/** Whether or not to turn on a weapon's flashlight upon equip (used when resuming from quick heal) */
var bool bToggleFlashlightOnEquip;

var bool bAutoswitchWeapon;

var const float StartedWithWeaponPriceModifier;	// The selling price reduction for a weapon that we were given at the start of the game
var const float SellPriceModifier;	// Multiplied by the original price to get the sell cost

/** An item that will be given once we've finished using the trader */
struct native TransactionItem
{
	var string DLOString;
	var name ClassName;
	var int AddedAmmo[2];
};

/** Keeps track of the items we are planning on buying, while in the trader */
var array<TransactionItem> TransactionItems;

//
// Network replication.
//
replication
{
	if( bNetDirty && bNetOwner )
		GrenadeCount, CurrentCarryBlocks, MaxCarryBlocks;

	if( bNetDirty && bNetOwner && bNetInitial )
		HealerWeapon;
}

native function bool AddWeaponToGroup( out KFWeapon AddedWeapon );

/** Create a GFxMoviePlayer for weapon optics if it doesn't exist, otherwise grab the existing GFxMoviePlayer */
simulated function GFxMoviePlayer GetOpticsUIMovie(class<GFxMoviePlayer> OpticsClass)
{
	local byte OpticsIndex;

	for (OpticsIndex = 0; OpticsIndex < OpticsUIMovies.Length; OpticsIndex++)
	{
		if (OpticsUIMovies[OpticsIndex].class == OpticsClass)
		{
			return OpticsUIMovies[OpticsIndex];
		}
	}

	// Create the screen's UI piece
	OpticsUIMovies.AddItem(new( self ) OpticsClass);

	// Initialize the new movie
	OpticsIndex = OpticsUIMovies.length - 1;
	OpticsUIMovies[OpticsIndex].Init();
	OpticsUIMovies[OpticsIndex].Start();

	return OpticsUIMovies[OpticsIndex];
}

/** Create a GFxMoviePlayer for weapon optics if it doesn't exist, otherwise grab the existing GFxMoviePlayer */
simulated function RemoveOpticsUIMovie(class<KFGFxWorld_MedicOptics> OpticsClass)
{
	local byte OpticsIndex;

	for (OpticsIndex = 0; OpticsIndex < OpticsUIMovies.Length; OpticsIndex++)
	{
		if (OpticsUIMovies[OpticsIndex].class == OpticsClass)
		{
			OpticsUIMovies[OpticsIndex].Close();
			OpticsUIMovies.Remove(OpticsIndex, 1);
		}
	}
}

/**
 * InitFOV. Handle setting FOV values for inventory when the resolution changes
 *
 * @param SizeX the X resolution of the screen
 * @param SizeY the Y resolution of the screen
 */
simulated function InitFOV(float SizeX, float SizeY, float DefaultPlayerFOV)
{
	local KFWeapon KFWP;

	if( InventoryChain == None )
	{
		return;
	}

	// Have each weapon initialize its FOV settings
	foreach InventoryActors(class'KFWeapon', KFWP)
	{
		KFWP.InitFOV(SizeX, SizeY, DefaultPlayerFOV);
	}
}

simulated function bool AddInventory(Inventory NewItem, optional bool bDoNotActivate)
{
	local KFWeapon KFW;
	KFW = KFWeapon(NewItem);
	if ( KFW != none )
	{
		if ( Role == Role_Authority )
		{
			AddWeaponToGroup(KFW);
		}
		NewItem.SetOwner( Instigator );
		NewItem.Instigator = Instigator;
		NewItem.InvManager = Self;
		NewItem.GivenTo( Instigator, bDoNotActivate);

		CombineWeaponsOnAdd( KFW );

		// Trigger inventory event
		Instigator.TriggerEventClass(class'SeqEvent_GetInventory', NewItem);

		return true;
	}
	else
	{
		return super.AddInventory(NewItem, bDoNotActivate);
	}
}

/** Same as InventoryManager.CreateInventory, but accepts a Archtype(template) instance */
simulated function Inventory CreateInventoryArchetype(Inventory NewInventoryTemplate, optional bool bDoNotActivate)
{
	local Inventory	Inv;

	if( NewInventoryTemplate != None )
	{
		inv = Spawn(NewInventoryTemplate.Class, Owner,,,, NewInventoryTemplate);
		if( inv != None )
		{
			if( !AddInventory(Inv, bDoNotActivate) )
			{
				`warn("InventoryManager::CreateInventory - Couldn't Add newly created inventory" @ Inv);
				Inv.Destroy();
				Inv = None;
			}
		}
		else
		{
			`warn("InventoryManager::CreateInventory - Couldn't spawn inventory" @ NewInventoryTemplate);
		}
	}

	return Inv;
}

/** Overridden to check carrying capacity and pop the weapon switch when a new weapon is given */
simulated function Inventory CreateInventory(class<Inventory> NewInventoryItemClass, optional bool bDoNotActivate)
{
	local KFWeapon KFWeap;
	local class<KFWeapon> KFWeapClass;

	KFWeapClass = class<KFWeapon>(NewInventoryItemClass);
	if (KFWeapClass != none)
	{
		if (CanCarryWeapon(KFWeapClass))
		{
			KFWeap = KFWeapon( super.CreateInventory(NewInventoryItemClass, bDoNotActivate) );
			//may want to do a flicker here for the weapon to show selected
			UpdateHUD();

			// Only play sounds and send messages after we've spawned
			if (`TimeSince(CreationTime) > 1)
			{
				PlayerController(Instigator.Owner).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_PickedupItem,,, KFWeap );
				if (`TimeSince(LastCreatedWeaponTime) > 1)
				{
					PlayGiveInventorySound( ItemPickupSound );
					LastCreatedWeaponTime = WorldInfo.TimeSeconds;
				}
			}

			return KFWeap;
		}
		else
		{
			PlayerController(Instigator.Owner).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_TooMuchWeight );
			return none;
		}
	}

	return super.CreateInventory(NewInventoryItemClass, bDoNotActivate);
}

simulated function RemoveFromInventory(Inventory ItemToRemove)
{
	local Inventory Item;
	local bool		bFound;

	if( ItemToRemove == none )
	{
		return;
	}

	if ( PreviousEquippedWeapon == ItemToRemove )
	{
		PreviousEquippedWeapon = none;
	}

	if ( PendingWeapon == ItemToRemove )
	{
	    PendingWeapon = none;
	}

	if( Instigator.Weapon == ItemToRemove )
	{
		Instigator.Weapon = None;
	}

	if( InventoryChain == ItemToRemove )
	{
		bFound = TRUE;
		InventoryChain = ItemToRemove.Inventory;
	}
	else
	{
		// If this item is in our inventory chain, unlink it.
		for(Item = InventoryChain; Item != None; Item = Item.Inventory)
		{
			if( Item.Inventory == ItemToRemove )
			{
				bFound = TRUE;
				Item.Inventory = ItemToRemove.Inventory;
				break;
			}
		}
	}

	if( bFound )
	{
		ItemToRemove.ItemRemovedFromInvManager();
		ItemToRemove.SetOwner(None);
		ItemToRemove.Inventory = None;
	}

	if (Instigator.Health > 0 && Instigator.Controller != none)
	{
		if ( WorldInfo.NetMode == NM_DedicatedServer || (WorldInfo.NetMode == NM_ListenServer && !Instigator.IsLocallyControlled()) )
		{
			ClientRemoveFromInventory(ItemToRemove);
		}
		else if( Instigator.Weapon == None )
		{
			if (PendingWeapon != None && PendingWeapon != ItemToRemove)
			{
				`LogInv("Removed current weapon while changing weapons, call ChangedWeapon");
				ChangedWeapon();
			}
			else if(Instigator.Controller != None)
			{
				`LogInv("Calling SwitchToBestWeapon to make sure a weapon is brought up");
				Instigator.Controller.SwitchToBestWeapon(TRUE);
			}
		}
	}
}

reliable server final function ServerRemoveFromInventory(Inventory ItemToRemove)
{
   	if (Role == ROLE_Authority)
    {
		RemoveFromInventory(ItemToRemove);

		/* __TW_ Analytics */
		`RecordTraderTransactions(`StatId(SELL_WEAP), Instigator.Controller, ItemToRemove.class );
		`BalanceLog(class'KFGameInfo'.const.GBE_Sell, Instigator.PlayerReplicationInfo, ItemToRemove.Class);
	}
}

reliable client function ClientRemoveFromInventory(Inventory ItemToRemove)
{
	RemoveFromInventory(ItemToRemove);
}

/** checks whether requested item is actually in inventory */
function bool ItemIsInInventory( Inventory Item )
{
	local Inventory Inv;

	for( Inv = InventoryChain; Inv != None; Inv = Inv.Inventory)
	{
		if( Inv == Item )
		{
			return true;
		}
	}

	return false;
}

/** checks whether instance of requested class is actually in inventory */
function bool ClassIsInInventory( class<Inventory> ItemClass )
{
	local Inventory Inv;

	for( Inv = InventoryChain; Inv != None; Inv = Inv.Inventory)
	{
		if( Inv.Class == ItemClass )
		{
			return true;
		}
	}

	return false;
}

/**
 * Switches to Previous weapon
 * Network: Client
 */
simulated function AutoSwitchLastWeapon()
{
	local Weapon CurrentWeapon;

	if (PreviousEquippedWeapon == none)
	{
		return;
	}

	// Check to see if we are in the process of switching to a new weapon during this move
	CurrentWeapon = (PendingWeapon != none) ? PendingWeapon : Instigator.Weapon;
	bAutoswitchWeapon = true;
	//ShowAllHUDGroups();
	SetCurrentWeapon(PreviousEquippedWeapon);

	PreviousEquippedWeapon = CurrentWeapon;

	bPendingFlashlight = bToggleFlashlightOnEquip;
	bToggleFlashlightOnEquip = false;
	bAutoswitchWeapon = false;
}

/** Switch to the highest priority flashlight weapon */
simulated function SwitchToPrimaryFlashLightWeapon()
{
	local KFWeapon NewWeapon, PriorityWeapon, EmptyPriorityWeapon;
	local float HighestPriority;

	/** Inventory list is already sorted by weapon group (Primary, secondary, etc..) and priority.
	* try to get the highest priority weapon with ammo, if none exist,
	* give us the highest priority weapon with no ammo */
	foreach InventoryActors( class'KFWeapon', NewWeapon )
	{
		if( NewWeapon.bHasFlashlight )
		{
			bPendingFlashlight = true;
			if( NewWeapon.HasAnyAmmo() )
			{
				PriorityWeapon = NewWeapon;
				break;
			}
			else if( NewWeapon.GroupPriority >= HighestPriority )
			{
				EmptyPriorityWeapon = NewWeapon;
			}
			HighestPriority = NewWeapon.GroupPriority;
		}
	}

	if( PriorityWeapon != none )
	{
		SetCurrentWeapon(PriorityWeapon);
	}
	else if( EmptyPriorityWeapon != none )
	{
		SetCurrentWeapon(EmptyPriorityWeapon);
	}
}

/** Handle bPendingFlashlight */
simulated function ChangedWeapon()
{
	Super.ChangedWeapon();

	if ( bPendingFlashlight )
	{
		KFPawn_Human(Instigator).ToggleFlashlight();
		bPendingFlashlight = false;
	}
}

/** Get the next weapon in the specified group */
simulated function KFWeapon GetNextGroupedWeapon( byte GroupID, optional bool bGetFirstWeapon )
{
	local KFWeapon EquippedWeapon, NewWeapon;
	local bool bFoundCurrentWeapon;

	if (Instigator == none)
	{
		return none;
	}

	// If we are in the process of changing weapons, switch to the next pending weapon before our current
	if ( PendingWeapon != none )
	{
		EquippedWeapon = KFWeapon( PendingWeapon );
	}
	else
	{
		EquippedWeapon = KFWeapon( Instigator.Weapon );
	}

	// If we are switching from a different group, we want to grab the first weapon in that group
	if ( EquippedWeapon == none || EquippedWeapon.InventoryGroup != GroupID )
	{
     	bGetFirstWeapon = true;
	}

	foreach InventoryActors( class'KFWeapon', NewWeapon )
	{
		if ( bGetFirstWeapon || bFoundCurrentWeapon )
		{
        	if ( GroupID == NewWeapon.InventoryGroup )
			{
				return NewWeapon;
			}
		}

		if ( EquippedWeapon == NewWeapon )
		{
		 	bFoundCurrentWeapon = true;
			continue;
		}
	}

	// If we are on the last weapon in this group, grab the first weapon in the group
	if ( !bGetFirstWeapon )
	{
	    return GetNextGroupedWeapon( GroupID, true );
    }
    return none;
}

/**
 * Switches to Previous weapon
 * Network: Client
 */
simulated function HighlightPrevWeapon()
{
	local Weapon	CandidateWeapon, StartWeapon, W;
	StartWeapon = Instigator.Weapon;
	if ( PendingWeapon != None )
	{
		StartWeapon = PendingWeapon;
	}

	// Get previous
	ForEach InventoryActors(class'Weapon', W)
	{
		if ( W == StartWeapon )
		{
			break;
		}
		CandidateWeapon = W;
	}

	// if none found, get last
	if ( CandidateWeapon == None )
	{
		ForEach InventoryActors(class'Weapon', W)
		{
			CandidateWeapon = W;
		}
	}
	HighlightWeapon(CandidateWeapon);
}


/**
 * Switches to Next weapon
 * Network: Client
 */
simulated function HighlightNextWeapon()
{
	local Weapon	StartWeapon, CandidateWeapon, W;
	local bool		bBreakNext;
	StartWeapon = Instigator.Weapon;
	if( PendingWeapon != None )
	{
		StartWeapon = PendingWeapon;
	}

	ForEach InventoryActors( class'Weapon', W )
	{
		if( bBreakNext || (StartWeapon == None) )
		{
			CandidateWeapon = W;
			break;
		}
		if( W == StartWeapon )
		{
			bBreakNext = true;
		}
	}

	if( CandidateWeapon == None )
	{
		ForEach InventoryActors( class'Weapon', W )
		{
			CandidateWeapon = W;
			break;
		}
	}

	HighlightWeapon( CandidateWeapon );
}

simulated function HighlightWeapon( Weapon CandidateWeapon )
{
	SetPendingWeapon(CandidateWeapon);
	ShowAllHUDGroups();
    UpdateHUD();
}

/**
 * ServerSetCurrentWeapon begins the Putdown sequence on the server.  This function makes
 * the assumption that if TryPutDown succeeded on the client, it will succeed on the server.
 * This function shouldn't be called from anywhere except SetCurrentWeapon
 *
 * Overridden to check if desired weapon is actually in inventory (possible client/server mismatch due to lag)
 *
 * Network: Dedicated Server
 */
reliable server function ServerSetCurrentWeapon(Weapon DesiredWeapon)
{
	if( !ItemIsInInventory(DesiredWeapon) )
	{
		`LogInv(DesiredWeapon$" is not in inventory!");
		return;
	}

	super.ServerSetCurrentWeapon(DesiredWeapon);
}

/** Overridden to give a temporary equip message */
reliable client function SetCurrentWeapon(Weapon DesiredWeapon)
{
	local Weapon CurrentWeapon;
	local bool bCurrentWeaponUsingSights;
	local KFWeapon DesiredKFW;

	CurrentWeapon = Instigator.Weapon;
	if ( KFWeapon(CurrentWeapon) != none )
	{
		// Set the flag to switch to ironsights when the weapon is brought up
        bCurrentWeaponUsingSights = KFWeapon(CurrentWeapon).bUsingSights;
    }

	// Only change your weapon if it is different or we weant to equip the weapon we are currently putting down
	DesiredKFW = KFWeapon(DesiredWeapon);
	if( DesiredKFW != none &&
		(DesiredKFW != Instigator.Weapon || Instigator.Weapon.IsInState('WeaponPuttingDown')) )
	{
		if ( DesiredKFW.bHasIronSights )
		{
			DesiredKFW.bIronSightOnBringUp = (bCurrentWeaponUsingSights);
		}
		if(!bAutoswitchWeapon)
		{
			//Show and highlight this weapon on the hud
			//ShowOnlyHUDGroup( DesiredKFW.InventoryGroup );
		}

		PreviousEquippedWeapon = CurrentWeapon;
		super.SetCurrentWeapon(DesiredWeapon);
		UpdateHUD();
	}
}

/**
 * Weapon just given to a player, check if player should switch to this weapon
 * Network: LocalPlayer
 * Called from Weapon.ClientWeaponSet()
 */
simulated function ClientWeaponSet(Weapon NewWeapon, bool bOptionalSet, optional bool bDoNotActivate)
{
	local KFWeapon KFW;

	super.ClientWeaponSet(NewWeapon, bOptionalSet, bDoNotActivate);
	KFW = KFWeapon(NewWeapon);
	if ( Role != Role_Authority )
	{
		AddWeaponToGroup(KFW);
		UpdateHUD();
	}
}

simulated event ShowOnlyHUDGroup( byte GroupIndex )
{
	local KFGFxMoviePlayer_HUD KFGFxHUD;
	KFGFxHUD = KFPlayerController(Instigator.Controller).MyGFxHUD;
	if (KFGFxHUD != none && KFGFxHUD.WeaponSelectWidget != none)
	{
		KFGFxHUD.WeaponSelectWidget.ShowOnlyHUDGroup( GroupIndex );
	}
}

simulated function ShowAllHUDGroups()
{
	local KFGFxMoviePlayer_HUD KFGFxHUD;
	if( Instigator != none && Instigator.Controller != none )
	{
		KFGFxHUD = KFPlayerController(Instigator.Controller).MyGFxHUD;
		if (KFGFxHUD != none && KFGFxHUD.WeaponSelectWidget != none)
		{
			KFGFxHUD.WeaponSelectWidget.ShowAllHUDGroups();
		}
	}
}

/** Update the huds weapon select with our current weapon */
simulated function UpdateHUD()
{
	local KFGFxMoviePlayer_HUD KFGFxHUD;
	local KFWeapon KFW, KFPendingWeapon;
	local byte WeaponIndex;

	WeaponIndex = 0;
	if ( PendingWeapon != none )
	{
		KFPendingWeapon = KFWeapon( PendingWeapon );
	}
	else  // Use your starting weapon when spawning in
	{
		KFPendingWeapon = KFWeapon( Instigator.Weapon );
	}

	if (KFPendingWeapon == none)
	{
		return;
	}

	// Get the index of this weapon in its group
	ForEach InventoryActors( class'KFWeapon', KFW )
	{
		if ( KFW.InventoryGroup == KFPendingWeapon.InventoryGroup )
		{
			if ( KFW == KFPendingWeapon )
			{
				break;
			}

			WeaponIndex++;
		}
	}

    if( KFPlayerController(Instigator.Controller) != none )
    {
        KFGFxHUD = KFPlayerController(Instigator.Controller).MyGFxHUD;
	}
	if (KFGFxHUD != none && KFGFxHUD.WeaponSelectWidget != none)
	{
		// Update our pending weapons ammo
		if(!bAutoswitchWeapon && !(KFPendingWeapon == HealerWeapon && HealerWeapon.bQuickHealMode))
		{
			KFGFxHUD.WeaponSelectWidget.SetSelectedWeapon(KFPendingWeapon.InventoryGroup, WeaponIndex);
			KFGFxHUD.WeaponSelectWidget.RefreshWeaponSelect();
		}
	}
}

/** Set our current weapon based on its group and index in the inventory list */
function SelectCurrentWeapon( byte GroupIndex, byte WeaponIndex )
{
	local KFWeapon KFW;
	local byte CurrentWeaponIndex;

	ForEach InventoryActors( class'KFWeapon', KFW )
	{
		if ( KFW.InventoryGroup == GroupIndex )
		{
			if ( CurrentWeaponIndex == WeaponIndex )
			{
				break;
			}
			CurrentWeaponIndex++;
		}
	}

	if ( KFW != none )
	{
		SetCurrentWeapon( KFW );
	}
}

/**
 * Attempt to heal self using the quick heal key
 * Network: Local Player
 */
simulated function AttemptQuickHeal()
{
	local KFWeap_HealerBase W;
	local KFWeapon InstigatorKFWeapon;

	// Do not heal if we have full health
	if ( Instigator.Health >= Instigator.HealthMax )
	{
	 	return;
	}

	// if the healer is equipped already just fire it
	if ( KFWeap_HealerBase(Instigator.Weapon) != None && !Instigator.Weapon.IsFiring() )
	{
		Instigator.Weapon.StartFire(1);
		return;
	}

	InstigatorKFWeapon = KFWeapon(Instigator.Weapon);

	// otherwise try to equip one
	ForEach InventoryActors( class'KFWeap_HealerBase', W )
	{
		if ( W != Instigator.Weapon && W.HasAmmo(1) )
		{
			bToggleFlashlightOnEquip = (InstigatorKFWeapon != none && InstigatorKFWeapon.Flashlight != None && InstigatorKFWeapon.Flashlight.bEnabled);
			PreviousEquippedWeapon = Instigator.Weapon;
			W.bQuickHealMode = true;
			SetCurrentWeapon(W);
			//ShowAllHUDGroups();
		}
	}
}

/** Equip the welder immediately */
simulated function QuickWeld()
{
	local KFWeapon KFW;
	local KFInterface_Usable UsableTrigger;
	local KFDoorTrigger DoorTrigger;
	local KFPlayerController KFPC;

	if( Instigator == none || Instigator.Owner == none )
	{
		return;
	}

	// make sure player is actually allowed to switch weapons
	KFW = KFWeapon( Instigator.Weapon );
	if( KFW != none && !KFW.CanSwitchWeapons() )
	{
		return;
	}

	KFPC = KFPlayerController(Instigator.Owner);
	if( KFPC != none )
	{
		UsableTrigger = KFPC.GetCurrentUsableActor( Instigator );
		if( UsableTrigger != none )
		{
			DoorTrigger = KFDoorTrigger(UsableTrigger);
			if( DoorTrigger != none && DoorTrigger.DoorActor != none )
			{
				// Close the door if it's open already
				if( DoorTrigger.DoorActor.bIsDoorOpen && !DoorTrigger.DoorActor.bIsDestroyed )
				{
					KFPC.Use();
				}

				// Find and equip the welder if it isn't already equipped
				if(Instigator.Weapon == none || !Instigator.Weapon.IsA('KFWeap_Welder'))
				{
					foreach InventoryActors( class'KFWeapon', KFW )
					{
						if( KFW.IsA('KFWeap_Welder') )
						{
							SetCurrentWeapon(KFW);
							break;
						}
					}
				}
			}
		}
	}
}

/** Set the GrenadeCount to the starting amount. Returns true if any ammo was added */
function bool GiveInitialGrenadeCount()
{
    local byte OriginalGrenadeCount;

    OriginalGrenadeCount = GrenadeCount;

    if( KFPawn(Instigator) != none )
    {
        GrenadeCount = KFPawn(Instigator).GetPerk().InitialGrenadeCount;
    }

    return GrenadeCount > OriginalGrenadeCount;
}

/** Add grenades to the player's Inventory */
function AddGrenades(int AmountToAdd)
{
	if( KFPawn(Instigator) != none )
	{
		GrenadeCount = Min(KFPawn(Instigator).GetPerk().MaxGrenadeCount, GrenadeCount + AmountToAdd);
	}
}

/** Use/Consume/Remove grenades from the player's Inventory. Returns true if any ammo was removed */
function bool ConsumeGrenades(optional int AmountToSubtract=1)
{
    local byte OriginalGrenadeCount;

    OriginalGrenadeCount = GrenadeCount;
    GrenadeCount = Max(0, GrenadeCount - AmountToSubtract);

    return GrenadeCount < OriginalGrenadeCount;
}

/**
 * @see Weapon::HasAmmo
 */
simulated event bool HasGrenadeAmmo( optional int Amount=1 )
{
	// Assume we ask for at least 1 grenade to be there.
	if( Amount == 0 )
	{
		Amount = 1;
	}

	return (GrenadeCount - Amount) >= 0;
}

/* ThrowWeapon()
Throw out current weapon, and switch to a new weapon
*/
simulated function ThrowMoney()
{
	ServerThrowMoney();
}

reliable server function ServerThrowMoney()
{
	local Inventory Inv;
	local KFGameReplicationInfo MyKFGRI;

	if ( Instigator != none )
	{
		MyKFGRI = KFGameReplicationInfo(WorldInfo.GRI);

		// find the dosh.  Use DroppedPickupClass because KFInventory_Money is in KFGameContent
		foreach InventoryActors(class'Inventory', Inv)
		{
			if ( Inv.DroppedPickupClass == class'KFDroppedPickup_Cash' )
			{
				// Check if the player is receiving "discounted" money, remove his status if the players forwards his cheap money
				if ( MyKFGRI != none && MyKFGRI.CurrentObjective != none )
				{
					MyKFGRI.CurrentObjective.CheckForPayDayPawn(Instigator);
				}

				Instigator.TossInventory(Inv);
				return;
			}
		}
	}
}

/** Returns whether or not we have the carrying capacity to pickup this weapon */
simulated function bool CanCarryWeapon( class<KFWeapon> WeaponClass )
{
	// If the trader menu is open, check if this weapon is already part of our weapon transactions
	if( bServerTraderMenuOpen && IsTransactionWeapon(WeaponClass.Name) )
	{
		return false;
	}

	if( WeaponClass.default.DualClass != none && ClassIsInInventory(WeaponClass) )
	{
		// check weight of dual minus weight of single because we remove single when adding dual
		if( (CurrentCarryBlocks - WeaponClass.default.InventorySize + WeaponClass.default.DualClass.default.InventorySize <= MaxCarryBlocks) || bInfiniteWeight)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	if( WeaponClass.default.InventorySize <= 0 || CurrentCarryBlocks + WeaponClass.default.InventorySize <= MaxCarryBlocks || bInfiniteWeight)
	{
	 	return true;
	}

	return false;
}

/** Returns whether or not we are currently in the process of buying this weapon */
simulated function bool IsTransactionWeapon( name WeaponClassName )
{
	local int i;

	// If this was bought in a pending transaction, do not carry it
	for(i = TransactionItems.Length - 1; i >= 0; i--)
	{
		if( TransactionItems[i].ClassName == WeaponClassName )
		{
			return true;
		}
	}
	return false;
}

/** Directly removes item from transaction, bypassing cost, etc. */
function RemoveItemFromTransaction( name ClassName )
{
	local int Idx;

	Idx = GetTransactionItemIndex( ClassName );
	if( Idx != INDEX_NONE )
	{
		TransactionItems.Remove( Idx, 1 );
	}
}


/**
 * Finds out if player is carrying weapon, and adds ammunition if so.
 * Returns TRUE if successful
 */
function bool AddAmmoFromPickup(KFWeapon KFW, optional Inventory Pickup)
{
    if (GiveWeaponAmmo(KFW))
    {
		PlayerController(Instigator.Owner).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_PickedupWeaponAmmo, , , KFW.class );
		PlayGiveInventorySound( AmmoPickupSound );
		return true;
    }
	return false;
}

/** Gives a weapon a generic amount of both primary and secondary ammo */
function bool GiveWeaponAmmo(KFWeapon KFW)
{
	local bool bAddedAmmo;

	if ( KFW.AddAmmo(Max(KFW.AmmoPickupScale[0] * KFW.MagazineCapacity[0], 1)) > 0 )
	{
		bAddedAmmo = true;
	}

    if( KFW.CanRefillSecondaryAmmo() )
    {
    	if ( KFW.AddSecondaryAmmo(Max(KFW.AmmoPickupScale[1] * KFW.MagazineCapacity[1], 1)) > 0 )
    	{
    		bAddedAmmo = true;
    	}
    }

    return bAddedAmmo;
}

/** Gives all applicable weapons a generic amount of both primary and secondary ammo */
function bool GiveWeaponsAmmo( bool bIncludeGrenades )
{
	local KFWeapon W;
	local bool bAddedAmmo;

	foreach InventoryActors( class'KFWeapon', W )
	{
		if( !W.bInfiniteSpareAmmo && GiveWeaponAmmo(W) )
		{
			bAddedAmmo = true;
		}
	}

	if( bIncludeGrenades )
	{
		AddGrenades(1);
	}

	PlayerController( Instigator.Owner ).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_Ammo );
	PlayGiveInventorySound( AmmoPickupSound );

	return bAddedAmmo;
}

/**
 * Give the player a full set of armor
 * Returns TRUE if successful
 */
function bool AddArmorFromPickup()
{
	local KFPawn_Human KFPH;

	KFPH = KFPawn_Human(Instigator);
	if ( KFPH.Armor != KFPH.GetMaxArmor() )
	{
		PlayerController(Instigator.Owner).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_PickedupArmor );
		PlayGiveInventorySound( ArmorPickupSound );
  		KFPH.GiveMaxArmor();
  		return true;
	}
	else
	{
    	PlayerController( Instigator.Owner ).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_FullArmor);
    	return false;
	}
}

function PlayGiveInventorySound( AkEvent SoundEvent )
{
	Instigator.PlaySoundBase( SoundEvent );
}

/** Get GroundSpeed modifer (1.f - Penalty) based on current inventory size */
simulated function float GetEncumbranceSpeedMod()
{
	local float CarryPercent;
	CarryPercent = FMin(float(CurrentCarryBlocks) / MaxCarryBlocks, 1.f);
	return Lerp(1.f, 0.92, CarryPercent);
}

/** Called from AddInventory when adding a dual-able single or a dual.
  * Combines ammo and removes singles / creates dual as necessary. */
function CombineWeaponsOnAdd( KFWeapon AddedWeapon )
{
	local KFWeapon InvWeap;
	local KFWeap_DualBase AddedDual, NewDual;
	local int ExtraAmmo;
	local bool bEquipNewDual;

	AddedDual = KFWeap_DualBase( AddedWeapon );

	// if AddedWeapon is dual, remove singles
	if( AddedDual != none )
	{
		foreach InventoryActors( class'KFWeapon', InvWeap )
		{
			if( InvWeap.Class == AddedDual.SingleClass )
			{
				RemoveFromInventory( InvWeap );

				// add single ammo to dual
				AddedDual.AmmoCount[0] += InvWeap.AmmoCount[0];

				// remove ammo beyond capacity to add to spare ammo
				ExtraAmmo = Max( AddedDual.AmmoCount[0] - AddedDual.default.MagazineCapacity[0], 0 );
				AddedDual.AmmoCount[0] -= ExtraAmmo;

				AddedDual.AmmoCount[1] += InvWeap.AmmoCount[1];

				AddedDual.SpareAmmoCount[0] += InvWeap.SpareAmmoCount[0] + ExtraAmmo;

				// remove spare ammo beyond capacity
				AddedDual.SpareAmmoCount[0] = Min( AddedDual.SpareAmmoCount[0], AddedDual.default.MaxSpareAmmo[0] );

				AddedDual.ClientForceAmmoUpdate(AddedDual.AmmoCount[0],AddedDual.SpareAmmoCount[0]);
				AddedDual.ClientForceSecondaryAmmoUpdate(AddedDual.AmmoCount[1]);

				break;
			}
		}
	}
	else if( AddedWeapon.DualClass != none ) // AddedWeapon is single, combine with another single if possible to create dual
	{
		foreach InventoryActors( class'KFWeapon', InvWeap )
		{
			if( InvWeap != AddedWeapon && InvWeap.Class == AddedWeapon.Class )
			{
				// check instigator weapon before we remove it
				bEquipNewDual = Instigator.Weapon == InvWeap;

				// remove singles before creating dual, because this function will be called again from CreateInventory
				RemoveFromInventory( InvWeap );
				RemoveFromInventory( AddedWeapon );

				NewDual = KFWeap_DualBase( CreateInventory(AddedWeapon.DualClass, true) );
				if( NewDual != none )
				{
					// set dual ammo to combined ammo of singles
					NewDual.AmmoCount[0] = InvWeap.AmmoCount[0] + AddedWeapon.AmmoCount[0];

					// remove ammo beyond capacity to add to spare ammo
					ExtraAmmo = Max( NewDual.AmmoCount[0] - NewDual.default.MagazineCapacity[0], 0 );
					NewDual.AmmoCount[0] -= ExtraAmmo;

					NewDual.AmmoCount[1] = InvWeap.AmmoCount[1] + AddedWeapon.AmmoCount[1];

					NewDual.SpareAmmoCount[0] = Min( InvWeap.SpareAmmoCount[0] + AddedWeapon.SpareAmmoCount[0] + ExtraAmmo, NewDual.default.MaxSpareAmmo[0] );

					NewDual.ClientForceAmmoUpdate(NewDual.AmmoCount[0],NewDual.SpareAmmoCount[0]);
					NewDual.ClientForceSecondaryAmmoUpdate(NewDual.AmmoCount[1]);

					// if we've added a single and our current weapon is a similar single, then equip the dual
					if( bEquipNewDual )
					{
						SetCurrentWeapon( NewDual );
					}
				}

				break;
			}
		}
	}
}

/*********************************************************************************************
`* Trader
********************************************************************************************* */

// Tell the server we can no longer buy weapons
reliable server function ServerCloseTraderMenu()
{
	local int i;
	local KFWeapon KFWeap;
	local class<KFWeapon> KFWClass;

	bServerTraderMenuOpen = false;
	for(i = TransactionItems.Length - 1; i >= 0; i--)
	{
		KFWClass = class<KFWeapon>(DynamicLoadObject(TransactionItems[i].DLOString, class'Class'));
		if( KFWClass != none )
		{
			// Remove the transaction inventory blocks before trying to create the inventory
			CurrentCarryBlocks -= KFWClass.default.InventorySize;
			KFWeap = KFWeapon(CreateInventory(KFWClass));
			if( KFWeap != none )
			{
				KFWeap.AddAmmo(TransactionItems[i].AddedAmmo[0]);
				KFWeap.AddSecondaryAmmo(TransactionItems[i].AddedAmmo[1]);
			}

	    	/* __TW_ Analytics */
	    	`RecordTraderTransactions( `StatId(PURCHASE_WEAP), Instigator.Controller, KFWClass );
	    	`BalanceLog(class'KFGameInfo'.const.GBE_Buy, Instigator.PlayerReplicationInfo, KFWClass);
		}

		TransactionItems.Remove(i, 1);
	}
}

/** Find out what type of ammo we are buying and ask the server for it */
simulated function final BuyAmmo( int AmountPurchased, EItemType ItemType, optional byte ListIndex, optional byte ItemIndex, optional bool bSecondaryAmmo )
{
	if ( ItemType == IT_Weapon )
	{
		ServerBuyAmmo(AmountPurchased, ListIndex, ItemIndex, bSecondaryAmmo);
	}
 	else if ( ItemType == IT_Armor )
 	{
		ServerBuyArmor(AmountPurchased);
 	}
 	else if ( ItemType == IT_Grenade )
 	{
		ServerBuyGrenade(AmountPurchased);
 	}
}

/** Receive weapon ammo */
reliable server final private function ServerBuyAmmo(int AmountPurchased, byte ListIndex, byte ItemIndex, bool bSecondaryAmmo)
{
	local STraderItem WeaponItem;
	local KFWeapon KFW;
	local byte AmmoTypeIndex, TransactionIndex;

	if( Role == ROLE_Authority && bServerTraderMenuOpen )
	{
		if( GetTraderItemFromWeaponLists(WeaponItem, ListIndex, ItemIndex) )
		{
			if( !ProcessAmmoDosh(WeaponItem, AmountPurchased, bSecondaryAmmo) )
			{
				return;
			}

			GetWeaponFromClass(KFW, WeaponItem.ClassName);
			if( KFW != none )
			{
				if( bSecondaryAmmo )
				{
		    		KFW.AddSecondaryAmmo( AmountPurchased );
		    	
		    		/* __TW_ Analytics */
		    		`RecordTraderTransactions( `StatId(PURCHASE_AMMO), Instigator.Controller, KFW.class, AmountPurchased, bSecondaryAmmo );
					`BalanceLog(class'KFGameInfo'.const.GBE_Buy, Instigator.PlayerReplicationInfo, "Ammo,"@KFW.class$","@AmountPurchased);
				}
				else
				{
		    		KFW.AddAmmo( AmountPurchased );
		    		
		    		/* __TW_ Analytics */
		    		`RecordTraderTransactions( `StatId(PURCHASE_AMMO), Instigator.Controller, KFW.class, AmountPurchased, bSecondaryAmmo );
		    		`BalanceLog(class'KFGameInfo'.const.GBE_Buy, Instigator.PlayerReplicationInfo, "S.Ammo,"@KFW.class$","@AmountPurchased);
		    	}
			}
			else
			{
				ItemIndex = GetTransactionItemIndex(WeaponItem.ClassName);
				if( ItemIndex != INDEX_NONE )
				{
					TransactionIndex = GetTransactionItemIndex(WeaponItem.ClassName);
					if( TransactionIndex != INDEX_NONE )
					{
						AmmoTypeIndex = byte(bSecondaryAmmo);
						TransactionItems[TransactionIndex].AddedAmmo[AmmoTypeIndex] += AmountPurchased;
					}
				}
			}
		}
	}
}

/** Receive armor */
reliable server final private function ServerBuyArmor(int PercentPurchased)
{
	local KFPawn_Human KFP;
	local int AmountPurchased;
	local float MaxArmor;

    KFP = KFPawn_Human( Instigator );
	if (Role == ROLE_Authority && KFP != none && bServerTraderMenuOpen)
	{
		if(ProcessArmorDosh(PercentPurchased))
		{
			// We've passed the percent armor purchased into this function, now get the armor count
			MaxArmor = KFP.GetMaxArmor();
			AmountPurchased = FCeil(MaxArmor * (float(PercentPurchased) / 100.0));

		    KFP.AddArmor( AmountPurchased );

		    /* __TW_ Analytics */
		    `RecordArmorPurchase( `StatId(PURCHASE_ARMOR), Instigator.Controller, AmountPurchased );
			`BalanceLog(class'KFGameInfo'.const.GBE_Buy, Instigator.PlayerReplicationInfo, "Armor,"@PercentPurchased);
		}
	}
}

/** Receive grenades */
reliable server final private function ServerBuyGrenade( int AmountPurchased )
{
    if ( Role == ROLE_Authority && bServerTraderMenuOpen)
    {
		if(ProcessGrenadeDosh(AmountPurchased))
		{
	    	AddGrenades( AmountPurchased );
	    	
	    	/* __TW_ Analytics */
	    	`RecordTraderTransactions( `StatId(PURCHASE_WEAP), Instigator.Controller, KFPlayerController(Instigator.Controller).GetPerk().GetGrenadeClass(), AmountPurchased );
    		`BalanceLog(class'KFGameInfo'.const.GBE_Buy, Instigator.PlayerReplicationInfo, "Grenades(s),"$","@AmountPurchased);
    	}
    }
}

/** Receive our new weapon */
reliable server final function ServerBuyWeapon( byte ListIndex, byte ItemIndex )
{
	local STraderItem PurchasedItem;
	local TransactionItem NewTransactionItem;

	// Find the weapon in the servers TraderItemList
    if (Role == ROLE_Authority && bServerTraderMenuOpen)
    {
        // Get the purchased item info using the item indicies
		if( GetTraderItemFromWeaponLists(PurchasedItem, ListIndex, ItemIndex) )
		{
	    	if(CurrentCarryBlocks > CurrentCarryBlocks + PurchasedItem.BlocksRequired
	    		|| !ProcessWeaponDosh(PurchasedItem))
	    	{
	    		return;
	    	}

	    	// Set a new transaction item and add it to our array
			NewTransactionItem.ClassName = PurchasedItem.ClassName;
			NewTransactionItem.DLOString = string(PurchasedItem.PathName);
			NewTransactionItem.AddedAmmo[0] = 0;
			NewTransactionItem.AddedAmmo[1] = 0;

			TransactionItems.AddItem(NewTransactionItem);

			// remove single from transaction when adding dual to transaction
			// (selling dual adds single to transaction, so re-buying dual should remove it; occurs when same dual is sold and re-bought during same trader menu session)
			if( PurchasedItem.SingleClassName != '' && IsTransactionWeapon(PurchasedItem.SingleClassName) )
			{
				RemoveItemFromTransaction( PurchasedItem.SingleClassName );
			}
			
			CurrentCarryBlocks += PurchasedItem.BlocksRequired;
		}
	}
}

/** Receive our new weapon */
reliable server final function ServerSellWeapon( byte ListIndex, byte ItemIndex )
{
	local STraderItem SoldItem;
	local int SellPrice, TransactionIndex;
	local KFWeapon KFW;
	local KFPlayerReplicationInfo KFPRI;


	// Find the weapon in the servers TraderItemList
    if (Role == ROLE_Authority && bServerTraderMenuOpen)
    {
		KFPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
        // Get the Sold Item info using the Item indicies
		if( KFPRI != none && GetTraderItemFromWeaponLists(SoldItem, ListIndex, ItemIndex) )
		{
			GetWeaponFromClass(KFW, SoldItem.ClassName);
            // If the weapon is in our inventory, sell it immediately
	    	if( KFW != none )
	    	{
	    		SellPrice = GetAdjustedSellPriceFor( SoldItem, KFW );

				KFPRI.AddDosh(SellPrice);
		    	ServerRemoveFromInventory(KFW);
	    	}
	    	else   // Otherwise it's a transaction item that needs to be removed
	    	{
				TransactionIndex = GetTransactionItemIndex(SoldItem.ClassName);
				if( TransactionIndex != INDEX_NONE )
				{
					SellPrice = GetAdjustedSellPriceFor( SoldItem );

					KFPRI.AddDosh(SellPrice);
					CurrentCarryBlocks -= SoldItem.BlocksRequired;

					TransactionItems.Remove(TransactionIndex, 1);
				}
	    	}
		}
	}
}

/* Gets the index of the transaction item based on the class name */
final function int GetTransactionItemIndex(name ClassName)
{
	local int i;

	for(i = TransactionItems.Length - 1; i >= 0; i--)
	{
		if( TransactionItems[i].ClassName == ClassName )
		{
			return i;
		}
	}
	return -1;
}

/** Get a KFWeapon from our inventory using its weapon class */
final function GetWeaponFromClass( out KFWeapon KFW, name ClassName )
{
	local Inventory Item;
	// Skip if already in the inventory.
	for (Item = InventoryChain; Item != None; Item = Item.Inventory)
	{
		if( Item.class.name == ClassName )
		{
			KFW = KFWeapon(Item);
		}
	}
}

private final function bool ProcessWeaponDosh(out STraderItem PurchasedItem)
{
	local int BuyPrice;
	local KFPlayerReplicationInfo KFPRI;

	KFPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
	if( KFPRI != none )
	{
		BuyPrice = GetAdjustedBuyPriceFor( PurchasedItem );

		// Check if we can buy this weapon using the servers weapon pricing
		if(KFPRI.Score - BuyPrice >= 0)
		{
			// Deduct the purchase from our score
			KFPRI.AddDosh(-BuyPrice);
			return true;
		}
	}

	`log("Server failed to process " @PurchasedItem.ClassName);
	return false;
}

private final function bool ProcessAmmoDosh(out STraderItem PurchasedItem, int AdditionalAmmo, optional bool bSecondaryAmmo)
{
	local int BuyPrice;
    local float PricePerMag, MagSize;
	local KFPlayerReplicationInfo KFPRI;

	KFPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
	if( KFPRI != none )
	{
		if( bSecondaryAmmo )
		{
	    	PricePerMag = PurchasedItem.SecondaryAmmoMagPrice;
	    	MagSize = PurchasedItem.SecondaryAmmoMagSize;

			BuyPrice = FCeil((PricePerMag / MagSize) * float(AdditionalAmmo));
		}
		else
		{
	    	PricePerMag = PurchasedItem.AmmoPricePerMagazine;
	    	MagSize = PurchasedItem.MagazineCapacity;

			BuyPrice = FCeil((PricePerMag / MagSize) * float(AdditionalAmmo));
		}

		// Check if we can buy this weapon using the servers weapon pricing
		if( KFPRI.Score - BuyPrice >= 0 )
		{
			// Deduct the purchase from our score
			KFPRI.AddDosh(-BuyPrice);
			return true;
		}
	}

	`log("Server failed to process " @PurchasedItem.ClassName @"Ammo");
	return false;
}

private final function bool ProcessGrenadeDosh(int AmountPurchased)
{
	local int BuyPrice;
	local KFGFxObject_TraderItems TraderItems;
	local KFPlayerController KFPC;
	local KFPlayerReplicationInfo KFPRI;

	KFPC = KFPlayerController(Instigator.Owner);
	KFPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
	if( KFPC != none && KFPRI != none )
	{
		TraderItems = KFGameReplicationInfo( WorldInfo.GRI ).TraderItems;
		BuyPrice = TraderItems.GetGrenadeByPerk(KFPC.CurrentPerk.class).AmmoPricePerMagazine * AmountPurchased;
		if(BuyPrice <= KFPRI.Score)
		{
			KFPRI.AddDosh(-BuyPrice);
			return true;
		}
	}

	`log("Server failed to buy grenades");
	return false;
}

private final function bool ProcessArmorDosh(int PercentPurchased)
{
	local int BuyPrice;
	local KFGFxObject_TraderItems TraderItems;
	local KFPlayerController KFPC;
	local KFPerk CurrentPerk;
	local float ArmorPricePerPercent;
	local KFPlayerReplicationInfo KFPRI;

	KFPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
	if( KFPRI != none )
	{
		TraderItems = KFGameReplicationInfo( WorldInfo.GRI ).TraderItems;
		ArmorPricePerPercent = TraderItems.ArmorItem.AmmoPricePerMagazine;

		KFPC = KFPlayerController(Instigator.Owner);
		if( KFPC != none )
		{
			CurrentPerk = KFPC.GetPerk();
			if( CurrentPerk != none )
			{
				ArmorPricePerPercent *= CurrentPerk.GetArmorDiscountMod();
			}
		}

		BuyPrice = FCeil(ArmorPricePerPercent * PercentPurchased);
		if(BuyPrice <= KFPRI.Score)
		{
			KFPRI.AddDosh(-BuyPrice);
			return true;
		}
	}

	`log("Server failed to buy armor");
	return false;
}

private final function bool GetTraderItemFromWeaponLists(out STraderItem TraderItem, byte ListIndex, byte ItemIndex )
{
	local KFGFxObject_TraderItems TraderItemsObject;

	TraderItemsObject = KFGameReplicationInfo( WorldInfo.GRI ).TraderItems;
	if( ListIndex < TraderItemsObject.TraderItemList.Length )
	{
		TraderItem = TraderItemsObject.TraderItemList[ListIndex].ItemList[ItemIndex];
		return true;
	}
	else
	{
		TraderItem = TraderItemsObject.OffPerkItems[ItemIndex];
		return true;
	}
	return false;
}

/** Gets buy price for trader item, adjusted for whatever we want to adjust for */
simulated function int GetAdjustedBuyPriceFor( const out STraderItem ShopItem, optional const array<SItemInformation> TraderOwnedItems )
{
	local int AdjustedBuyPrice, i;

	AdjustedBuyPrice = ShopItem.BuyPrice;

	// if ShopItem is a dual and we own a single already, then reduce the dual by half
	if( ShopItem.SingleClassName != '' )
	{
		// checks inventory and transaction list
		if( GetIsOwned(ShopItem.SingleClassName) )
		{
			AdjustedBuyPrice *= 0.5;
		}
		// checks trader's owned item list (only used when called from trader)
		// example case: 9mm single could be in owned list but won't be in transaction list because it can't be purchased and might not be in inventory if it was removed when purchasing dual
		else if( TraderOwnedItems.Length > 0 )
		{
			for( i = 0; i < TraderOwnedItems.Length; ++i )
			{
				if( TraderOwnedItems[i].DefaultItem.ClassName == ShopItem.SingleClassName )
				{
					AdjustedBuyPrice *= 0.5;
					break;
				}
			}
		}
	}

	// add other adjustments here

	return AdjustedBuyPrice;
}

/** Gets sell price for trader item, adjusted for whatever we want to adjust for */
simulated function int GetAdjustedSellPriceFor( const out STraderItem OwnedItem, optional KFWeapon OwnedWeapon )
{
	local int AdjustedSellPrice;

	if( OwnedWeapon != none && OwnedWeapon.bGivenAtStart )
	{
	 	AdjustedSellPrice = OwnedItem.BuyPrice * StartedWithWeaponPriceModifier;
	}
	// otherwise modify its buy value by a modifier
	else
	{
		AdjustedSellPrice = OwnedItem.BuyPrice * SellPriceModifier;
	}

	// if OwnedItem is a dual, set sell price to that of a single (because we sell one single and keep one single)
	if( OwnedItem.SingleClassName != '' )
	{
		// @todo: revisit
		// assume price of single is half the price of dual. might be better to use the actual buy price of the single,
		// but 9mm doesn't have a buy price at the moment
		AdjustedSellPrice *= 0.5;
	}

	// add other adjustments here

	return AdjustedSellPrice;
}

/** Check if a given class is currently "owned" (in inventory or transaction list) */
simulated function bool GetIsOwned( name ClassName )
{
	local int i;
	local Inventory Inv;

	ForEach InventoryActors(class'Inventory', Inv)
	{
		if( Inv.Class.Name == ClassName )
		{
			return true;
		}
	}

	for( i = 0; i < TransactionItems.length; ++i )
	{
		if( TransactionItems[i].ClassName == ClassName )
		{
			return true;
		}
	}

	return false;
}

/*******************************************************************************************
 * Player death
 ******************************************************************************************/

/** Overrides super so that players only drop equipped weapon on death */
simulated event DiscardInventory()
{
	local Inventory Inv;

	ForEach InventoryActors(class'Inventory', Inv)
	{
		// only drop equipped weapon on death (if it's allowed to be dropped)
		if( Instigator.Weapon != Inv )
		{
			Inv.bDropOnDeath = false;
		}
	}

	super.DiscardInventory();
}

defaultproperties
{
	PendingFire(0)=0 // DEFAULT_FIREMOD
	PendingFire(1)=0 // ALTFIRE_FIREMODE / BLOCK_FIREMODE
	PendingFire(2)=0 // RELOAD_FIREMODE
	PendingFire(3)=0 // BASH_FIREMODE
	PendingFire(4)=0 // GRENADE_FIREMODE
	PendingFire(5)=0 // HEAVY_ATK_FIREMODE

	bMustHoldWeapon=true
	GrenadeCount=0
	MaxCarryBlocks=15

	SellPriceModifier=0.75f
	StartedWithWeaponPriceModifier=0.5f

	AmmoPickupSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Ammo'
    ItemPickupSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Weapon'
    ArmorPickupSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Armor'
	SwitchFireModeEvent=AkEvent'WW_UI_PlayerCharacter.Play_WEP_ModeSwitch'
}
