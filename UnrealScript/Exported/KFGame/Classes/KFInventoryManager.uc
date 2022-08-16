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







	







	 



		
		
	







 
















 
































































































































































































































#linenumber 70;

#linenumber 14;

/** Weapon we had equipped before the current one. */
var transient Weapon PreviousEquippedWeapon;

/** reference to the currently equipped healer weapon */
var transient KFWeap_HealerBase HealerWeapon;

/** Localized message for quick heal */
var localized string FullHealthMsg;

/** The number of grenades the character is carrying */
var byte GrenadeCount;

/** The carrying capacity (or blocks) available */
var byte CurrentCarryBlocks;
var byte MaxCarryBlocks;

var byte SelectedGroup;
var byte SelectedIndex;

/** Ignore our carrying capacity if this is set to true */
var bool bInfiniteWeight;

/** Suppress pickup messages if this is set to true */
var bool bSuppressPickupMessages;

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

/** The time at which we were last given a weapon */
var float LastCreatedWeaponTime;
/** This stores any GFxMoviePlayers that are inventory may be using */
var array<GFxMoviePlayer> OpticsUIMovies;

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

/** returns full concatenated string for analytics logging */
simulated function string DumpInventory()
{
	local Inventory InventoryItem;
	local KFWeapon Weapon;
	local string InventoryLabel;

	InventoryItem = InventoryChain;
	while( InventoryItem != none )
	{
		Weapon = KFWeapon( InventoryItem );
		if ( Weapon != none )
		{
			InventoryLabel $= Weapon.Class.Name $":"$ string(Weapon.GetTotalAmmoAmount(0)) $ ",";
		}

		InventoryItem = InventoryItem.Inventory;
	}

	// drop the trailing comma
	if ( Len(InventoryLabel) > 0 )
	{
		InventoryLabel = Left( InventoryLabel, Len(InventoryLabel) - 1 );
	}

	return InventoryLabel;
}

/** Get what percentage of ammo is left for the primary weapons */
simulated function float GetPrimaryAmmoPercentage()
{
	local Inventory InventoryItem;
	local KFWeapon Weapon;
	local float TotalAmmo, MaxAmmo;

	InventoryItem = InventoryChain;
	while( InventoryItem != none )
	{
		Weapon = KFWeapon( InventoryItem );
		if ( Weapon != none && !Weapon.bIsBackupWeapon /*&& Weapon.InventoryGroup != IG_None*/
            && Weapon.InventoryGroup != IG_Equipment )
		{
        	// For weapons that have no primary ammo such as melee weapons, just return 1/1.
        	// That basically means they are "full" since they don't run out of ammo
            if( Weapon.MaxSpareAmmo[Weapon.GetAmmoType(0)] == 0 )
        	{
        		TotalAmmo += 1.0;
        		MaxAmmo += 1.0;
        	}
        	else
        	{
        	   TotalAmmo += Weapon.GetTotalAmmoAmount(0);
        	   MaxAmmo += Weapon.GetMaxAmmoAmount(0);
        	}
		}

		InventoryItem = InventoryItem.Inventory;
	}

    if( MaxAmmo > 0 )
    {
        return TotalAmmo / MaxAmmo;
    }
    else
    {
        return 0;
    }
}

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
				WarnInternal("InventoryManager::CreateInventory - Couldn't Add newly created inventory" @ Inv);
				Inv.Destroy();
				Inv = None;
			}
		}
		else
		{
			WarnInternal("InventoryManager::CreateInventory - Couldn't spawn inventory" @ NewInventoryTemplate);
		}
	}

	return Inv;
}

/** Overridden to check carrying capacity and pop the weapon switch when a new weapon is given */
simulated function Inventory CreateInventory(class<Inventory> NewInventoryItemClass, optional bool bDoNotActivate)
{
	local KFWeapon KFWeap;
	local class<KFWeapon> KFWeapClass;

	if( bPendingDelete )
	{
		return none;
	}

	KFWeapClass = class<KFWeapon>(NewInventoryItemClass);
	if (KFWeapClass != none)
	{
		if (CanCarryWeapon(KFWeapClass))
		{
			KFWeap = KFWeapon( super.CreateInventory(NewInventoryItemClass, bDoNotActivate) );
			//may want to do a flicker here for the weapon to show selected
			UpdateHUD();

			// Only play sounds and send messages after we've spawned
			if (!bSuppressPickupMessages && (WorldInfo.TimeSeconds - CreationTime) > 1)
			{
				PlayerController(Instigator.Owner).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_PickedupItem,,, KFWeap );
				if ((WorldInfo.TimeSeconds - LastCreatedWeaponTime) > 1)
				{
					PlayGiveInventorySound( ItemPickupSound );
					LastCreatedWeaponTime = WorldInfo.TimeSeconds;
				}
			}

			return KFWeap;
		}
		else
		{
			if( !bSuppressPickupMessages )
			{
				PlayerController(Instigator.Owner).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_TooMuchWeight );
			}
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

	if( Instigator != none && Instigator.Weapon == ItemToRemove )
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

	if (Instigator != none && Instigator.Health > 0 && Instigator.Controller != none)
	{
		if ( WorldInfo.NetMode == NM_DedicatedServer || (WorldInfo.NetMode == NM_ListenServer && !Instigator.IsLocallyControlled()) )
		{
			ClientRemoveFromInventory(ItemToRemove);
		}
		else if( Instigator.Weapon == None )
		{
			if (PendingWeapon != None && PendingWeapon != ItemToRemove)
			{
				LogInternal(WorldInfo.TimeSeconds @ "Self:" @ Self @ "Instigator:" @ Instigator @ GetStateName() $ "::" $ GetFuncName() @ "Removed current weapon while changing weapons, call ChangedWeapon",'Inventory');
				ChangedWeapon();
			}
			else if(Instigator.Controller != None)
			{
				LogInternal(WorldInfo.TimeSeconds @ "Self:" @ Self @ "Instigator:" @ Instigator @ GetStateName() $ "::" $ GetFuncName() @ "Calling SwitchToBestWeapon to make sure a weapon is brought up",'Inventory');
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
		if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(class'KFGameInfo'.const.GBE_Sell$","$Instigator.PlayerReplicationInfo.PlayerName$","$ItemToRemove.Class);
		if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("sell", Instigator.PlayerReplicationInfo, ItemToRemove.Class);
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
simulated function SwitchToLastWeapon()
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
	bAutoSwitchWeapon = false;
}

/**
 * @brief Picks the best next available and per weapon with ammo
 * 
 * @param PerkClass Currently selected perk 
 * @param bBackupIfEmpty Return the backup pistol if no perk weapon available
 * @return Next best weapon with ammo
 */
simulated function KFWeapon GetBestPerkWeaponWithAmmo( class<KFPerk> PerkClass, optional bool bBackupIfEmpty=false )
{
	local KFWeapon PerkWeapon, NextWeapon, BackupWeapon;

	if( InventoryChain == none )
	{
		return none;
	}

	foreach InventoryActors( class'KFWeapon', NextWeapon )
	{
		if( NextWeapon.AssociatedPerkClass == PerkClass && NextWeapon.HasAmmo( 0 ) && !NextWeapon.IsMeleeWeapon() )
		{
			PerkWeapon = NextWeapon;
			break;
		}
		else if( NextWeapon.bIsBackupWeapon && !NextWeapon.IsMeleeWeapon() && NextWeapon.HasAmmo( 0 ) )
		{
			BackupWeapon = NextWeapon;
		}
	}


	return PerkWeapon != none ? PerkWeapon : BackupWeapon;
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

simulated function GamePadNextWeapon()
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
			if(!ShouldSkipGamePadNextWeapon(W))
			{
				CandidateWeapon = W;
				break;
			}
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
			if(!ShouldSkipGamePadNextWeapon(W))
			{
				CandidateWeapon = W;
				break;
			}
		}
	}

	// If same weapon, do not change
	if( CandidateWeapon == Instigator.Weapon )
	{
		return;
	}

	SetCurrentWeapon(CandidateWeapon);
}

function bool ShouldSkipGamePadNextWeapon(Weapon CandidateWeapon)
{
	local KFWeapon KFW;

	KFW = KFWeapon(CandidateWeapon);
	if(KFW != none)
	{
			if(KFW.InventoryGroup == IG_Equipment)
			{
				return true;
			}

			if(!KFW.HasAnyAmmo())
			{
				return true;
			}
		}
	//out of ammo or equipment
	return false;
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
		LogInternal(WorldInfo.TimeSeconds @ "Self:" @ Self @ "Instigator:" @ Instigator @ GetStateName() $ "::" $ GetFuncName() @ DesiredWeapon$" is not in inventory!",'Inventory');
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

		// Cache previously equipped weapon for SwitchToLastWeapon
		if ( DesiredKFW.InventoryGroup != IG_Equipment || PreviousEquippedWeapon == None )
		{
			PreviousEquippedWeapon = CurrentWeapon;
		}

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
	local KFPlayerController KFPC;

	// Do not heal if we have full health
	if ( Instigator.Health >= Instigator.HealthMax )
	{
		KFPC = KFPlayerController(Instigator.Owner);
		if ( KFPC != None && KFPC.MyGFxHUD != None )
		{
			KFPC.MyGFxHUD.ShowNonCriticalMessage(FullHealthMsg);
		}
	 	return;
	}

	// if the healer is equipped already just fire it
	if ( KFWeap_HealerBase(Instigator.Weapon) != None && !Instigator.Weapon.IsFiring() )
	{
		Instigator.Weapon.StartFire(1);
		return;
	}

	// otherwise try to equip one
	ForEach InventoryActors( class'KFWeap_HealerBase', W )
	{
		if ( W != Instigator.Weapon && W.HasAmmo(1) )
		{
			PreviousEquippedWeapon = Instigator.Weapon;
			W.bQuickHealMode = true;
			SetCurrentWeapon(W);
			//ShowAllHUDGroups();
		}
	}
}

/** Equip the welder immediately */
simulated function bool QuickWeld()
{
	local KFWeapon KFW;
	local KFInterface_Usable UsableTrigger;
	local KFDoorTrigger DoorTrigger;
	local KFPlayerController KFPC;

	if( Instigator == none || Instigator.Owner == none )
	{
		return false;
	}

	// make sure player is actually allowed to switch weapons
	KFW = KFWeapon( Instigator.Weapon );
	if( KFW != none && !KFW.CanSwitchWeapons() )
	{
		return false;
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

				// return success if we already have the welder
				if ( Instigator.Weapon != None && Instigator.Weapon.IsA('KFWeap_Welder') )
				{
					return true; 
				}

				// attempt to equip the welder from our inventory
				foreach InventoryActors( class'KFWeapon', KFW )
				{
					if( KFW.IsA('KFWeap_Welder') )
					{
						SetCurrentWeapon(KFW);
						ShowAllHUDGroups();
						return true;
					}
				}
			}
		}
	}

	return false;
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
function bool AddGrenades(int AmountToAdd)
{
	if( KFPawn(Instigator) != none )
	{
		if( GrenadeCount < KFPawn(Instigator).GetPerk().MaxGrenadeCount )
		{
			GrenadeCount = Min(KFPawn(Instigator).GetPerk().MaxGrenadeCount, GrenadeCount + AmountToAdd);
			return true;
		}
	}

	return false;
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
	local class<KFWeap_DualBase> DualWeaponClass;

	// If the trader menu is open, check if this weapon is already part of our weapon transactions
	if( bServerTraderMenuOpen && IsTransactionWeapon(WeaponClass.Name) )
	{
		return false;
	}

	// if trying to add a second single, make sure player can carry dual (minus weight of first single
	if( WeaponClass.default.DualClass != none && ClassIsInInventory(WeaponClass) )
	{
		// check weight of dual minus weight of single because we remove single when adding dual
		if( ((CurrentCarryBlocks + WeaponClass.default.DualClass.default.InventorySize - WeaponClass.default.InventorySize) <= MaxCarryBlocks) || bInfiniteWeight)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	// if trying to add a dual, make sure player can carry it (minus weight of owned single)
	DualWeaponClass = class<KFWeap_DualBase>(WeaponClass);
	if( DualWeaponClass != none && DualWeaponClass.default.SingleClass != none && ClassIsInInventory(DualWeaponClass.default.SingleClass) )
	{
		// check weight of dual minus weight of single because we remove single when adding dual
		if( ((CurrentCarryBlocks + DualWeaponClass.default.InventorySize - DualWeaponClass.default.SingleClass.default.InventorySize) <= MaxCarryBlocks) || bInfiniteWeight)
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

	if( KFW.AddAmmo(Max(KFW.AmmoPickupScale[0] * KFW.MagazineCapacity[0], 1)) > 0 )
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
		if( AddGrenades(1) )
		{
			bAddedAmmo = true;
		}
	}

	if( bAddedAmmo )
	{
		PlayerController( Instigator.Owner ).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_Ammo );
		PlayGiveInventorySound( AmmoPickupSound );
	}
	/*else
	{
		PlayerController( Instigator.Owner ).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_AmmoIsFull );	
	}*/

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
			AddCurrentCarryBlocks( -KFWClass.default.InventorySize );
			KFWeap = KFWeapon(CreateInventory(KFWClass));
			if( KFWeap != none )
			{
				KFWeap.AddTransactionAmmo( TransactionItems[i].AddedAmmo[0], TransactionItems[i].AddedAmmo[1] );
			}

	    	/* __TW_ Analytics */
			if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(class'KFGameInfo'.const.GBE_Buy$","$Instigator.PlayerReplicationInfo.PlayerName$","$KFWClass);
			if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("buy", Instigator.PlayerReplicationInfo, KFWClass);
		}

		TransactionItems.Remove(i, 1);
	}
}

/** Find out what type of ammo we are buying and ask the server for it */
simulated function final BuyAmmo( int AmountPurchased, EItemType ItemType, optional byte ItemIndex, optional bool bSecondaryAmmo )
{
	if ( ItemType == IT_Weapon )
			{
		ServerBuyAmmo(AmountPurchased, ItemIndex, bSecondaryAmmo);
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
reliable server final private function ServerBuyAmmo(int AmountPurchased, byte ItemIndex, bool bSecondaryAmmo)
{
	local STraderItem WeaponItem;
	local KFWeapon KFW;

	if( Role == ROLE_Authority && bServerTraderMenuOpen )
	{
		if( GetTraderItemFromWeaponLists(WeaponItem, ItemIndex) )
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
					if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(class'KFGameInfo'.const.GBE_Buy$","$Instigator.PlayerReplicationInfo.PlayerName$","$"S.Ammo,"@KFW.class$","@AmountPurchased);
					if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("buy", Instigator.PlayerReplicationInfo, "S.ammo", KFW.class, "#"$AmountPurchased);
				}
				else
				{
		    		KFW.AddAmmo( AmountPurchased );

		    		/* __TW_ Analytics */
					if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(class'KFGameInfo'.const.GBE_Buy$","$Instigator.PlayerReplicationInfo.PlayerName$","$"Ammo,"@KFW.class$","@AmountPurchased);
					if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("buy", Instigator.PlayerReplicationInfo, "ammo", KFW.class, "#"$AmountPurchased);
		    	}
			}
			else
			{
				// Buying ammo for weapon that is pending purchase
				ServerAddTransactionAmmo(AmountPurchased, ItemIndex, bSecondaryAmmo);
			}
		}
	}
}

/** Modifies ammo for a transaction item */
reliable server final private event ServerAddTransactionAmmo( int AmountAdded, byte ItemIndex, bool bSecondaryAmmo )
{
	local STraderItem WeaponItem;
	local byte AmmoTypeIndex;
	local int TransactionIndex;

	if( bServerTraderMenuOpen )
	{
		if( GetTraderItemFromWeaponLists(WeaponItem, ItemIndex) )
		{
			TransactionIndex = GetTransactionItemIndex(WeaponItem.ClassName);
			if( TransactionIndex != INDEX_NONE )
			{
				AmmoTypeIndex = byte(bSecondaryAmmo);
				TransactionItems[TransactionIndex].AddedAmmo[AmmoTypeIndex] += AmountAdded;

				if ( bSecondaryAmmo )
				{
					if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(class'KFGameInfo'.const.GBE_Buy$","$Instigator.PlayerReplicationInfo.PlayerName$","$"S.Ammo,"@WeaponItem.ClassName$","@AmountAdded);
					if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("buy", Instigator.PlayerReplicationInfo, "S.ammo", WeaponItem.ClassName, "#"$AmountAdded);
				}
				else
				{
					if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(class'KFGameInfo'.const.GBE_Buy$","$Instigator.PlayerReplicationInfo.PlayerName$","$"Ammo,"@WeaponItem.ClassName$","@AmountAdded);
					if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("buy", Instigator.PlayerReplicationInfo, "ammo", WeaponItem.ClassName, "#"$AmountAdded);
				}
			}
		}
	}
}

/** Receive armor */
reliable server final private function ServerBuyArmor( int PercentPurchased )
{
	local KFPawn_Human KFP;
	local int AmountPurchased;
	local float MaxArmor;

    KFP = KFPawn_Human( Instigator );
	if( Role == ROLE_Authority && KFP != none && bServerTraderMenuOpen )
	{
		if( ProcessArmorDosh( PercentPurchased ) )
		{
			// We've passed the percent armor purchased into this function, now get the armor count
			MaxArmor = KFP.GetMaxArmor();
			AmountPurchased = FCeil( MaxArmor * (float(PercentPurchased) / 100.0) );

		    KFP.AddArmor( AmountPurchased );

		    /* __TW_ Analytics */
			if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(class'KFGameInfo'.const.GBE_Buy$","$Instigator.PlayerReplicationInfo.PlayerName$","$"Armor,"@PercentPurchased);
			// this is a bit spammy, since it buys armor in increments of '3'
			if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("buy", Instigator.PlayerReplicationInfo, "armor", "#"$PercentPurchased);
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
			if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(class'KFGameInfo'.const.GBE_Buy$","$Instigator.PlayerReplicationInfo.PlayerName$","$"Grenades(s),"$","@AmountPurchased);
			if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("buy", Instigator.PlayerReplicationInfo, "grenades", "#"$AmountPurchased);
    	}
    }
}

/** Receive our new weapon */
reliable server final function ServerBuyWeapon( byte ItemIndex )
{
	local STraderItem PurchasedItem;
	local int BlocksRequired;

	// Find the weapon in the servers TraderItemList
    if (Role == ROLE_Authority && bServerTraderMenuOpen)
    {
        // Get the purchased item info using the item indicies
		if( GetTraderItemFromWeaponLists(PurchasedItem, ItemIndex) )
		{
			BlocksRequired = GetDisplayedBlocksRequiredFor(PurchasedItem);
	    	if(CurrentCarryBlocks > CurrentCarryBlocks + BlocksRequired
	    		|| !ProcessWeaponDosh(PurchasedItem))
	    	{
	    		return;
	    	}

			AddTransactionItem( PurchasedItem );
		}
	}
}

/** Single location for adding/subtracting from current carry blocks */
function AddCurrentCarryBlocks( int AddAmount )
{
	CurrentCarryBlocks += AddAmount;
}

/** Creates a new transaction item based on a trader item and adds it to transaction list */
final function AddTransactionItem( const out STraderItem ItemToAdd )
{
	local TransactionItem NewTransactionItem;

	if( Role < ROLE_Authority || !bServerTraderMenuOpen )
	{
		return;
	}

	NewTransactionItem.ClassName = ItemToAdd.ClassName;
	NewTransactionItem.DLOString = ItemToAdd.WeaponDef.default.WeaponClassPath;
	NewTransactionItem.AddedAmmo[0] = 0;
	NewTransactionItem.AddedAmmo[1] = 0;

	TransactionItems.AddItem( NewTransactionItem );
	
	AddCurrentCarryBlocks( ItemToAdd.BlocksRequired );
}

/** Creates a new transaction item based on a trader item and adds it to transaction list */
reliable server final function ServerAddTransactionItem( byte ItemIndex )
{
	local STraderItem PurchasedItem;

	// Find the weapon in the servers TraderItemList
    if (Role == ROLE_Authority && bServerTraderMenuOpen)
    {
        // Get the purchased item info using the item indicies
		if( GetTraderItemFromWeaponLists(PurchasedItem, ItemIndex) )
		{
			AddTransactionItem( PurchasedItem );
		}
	}
}

/** Receive our new weapon */
reliable server final function ServerSellWeapon( byte ItemIndex )
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
		if( KFPRI != none && GetTraderItemFromWeaponLists(SoldItem, ItemIndex) )
		{
			GetWeaponFromClass(KFW, SoldItem.ClassName);
            // If the weapon is in our inventory, sell it immediately
	    	if( KFW != none )
	    	{
	    		SellPrice = GetAdjustedSellPriceFor( SoldItem, KFW );

				KFPRI.AddDosh(SellPrice);
		    	ServerRemoveFromInventory(KFW);
		    	KFW.Destroy();
	    	}
	    	else   // Otherwise it's a transaction item that needs to be removed
	    	{
				TransactionIndex = GetTransactionItemIndex(SoldItem.ClassName);
				if( TransactionIndex != INDEX_NONE )
				{
					SellPrice = GetAdjustedSellPriceFor( SoldItem );

					KFPRI.AddDosh(SellPrice);
					
					RemoveTransactionItem( SoldItem );
				}
	    	}
		}
	}
}

/** Removes an item from the transaction list */
final function RemoveTransactionItem( const out STraderItem ItemToRemove )
{
	local int TransactionIndex;

	if( Role < ROLE_Authority || !bServerTraderMenuOpen )
	{
		return;
	}

	TransactionIndex = GetTransactionItemIndex( ItemToRemove.ClassName );
	if( TransactionIndex != INDEX_NONE )
	{
		AddCurrentCarryBlocks( -ItemToRemove.BlocksRequired );
		TransactionItems.Remove( TransactionIndex, 1 );
	}
}

/** Removes an item from the transaction list */
reliable server final function ServerRemoveTransactionItem( int ItemIndex )
{
	local STraderItem ItemToRemove;
	local KFWeapon InvWeap;

	if( bServerTraderMenuOpen )
	{
		if( GetTraderItemFromWeaponLists(ItemToRemove, ItemIndex) )
		{
			RemoveTransactionItem( ItemToRemove );

			// remove from inventory if necessary (like after buying a dual when owning a single)
			GetWeaponFromClass( InvWeap, ItemToRemove.ClassName );
			if( InvWeap != none )
			{
				RemoveFromInventory( InvWeap );
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
	return INDEX_NONE;
}

/** Get a KFWeapon from our inventory using its weapon class */
final simulated function GetWeaponFromClass( out KFWeapon KFW, name ClassName )
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

	LogInternal("Server failed to process " @PurchasedItem.ClassName);
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
	    	PricePerMag = PurchasedItem.WeaponDef.default.SecondaryAmmoMagPrice;
	    	MagSize = PurchasedItem.WeaponDef.default.SecondaryAmmoMagSize;

			BuyPrice = FCeil((PricePerMag / MagSize) * float(AdditionalAmmo));
		}
		else
		{
	    	PricePerMag = PurchasedItem.WeaponDef.default.AmmoPricePerMag;
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

	LogInternal("Server failed to process " @PurchasedItem.ClassName @"Ammo");
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
		BuyPrice = TraderItems.GrenadePrice * AmountPurchased;
		if(BuyPrice <= KFPRI.Score)
		{
			KFPRI.AddDosh(-BuyPrice);
			return true;
		}
	}

	LogInternal("Server failed to buy grenades");
	return false;
}

private final function bool ProcessArmorDosh(int PercentPurchased)
{
	local int BuyPrice;
	local KFGFxObject_TraderItems TraderItems;
	local KFPlayerController KFPC;
	local KFPerk CurrentPerk;
	local int ArmorPricePerPercent;
	local KFPlayerReplicationInfo KFPRI;

	KFPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
	if( KFPRI != none )
	{
		TraderItems = KFGameReplicationInfo( WorldInfo.GRI ).TraderItems;
		ArmorPricePerPercent = TraderItems.ArmorPrice;

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

	LogInternal("Server failed to buy armor");
	return false;
}

private final function bool GetTraderItemFromWeaponLists(out STraderItem TraderItem, byte ItemIndex )
{
	local KFGFxObject_TraderItems TraderItemsObject;

	TraderItemsObject = KFGameReplicationInfo( WorldInfo.GRI ).TraderItems;
	if( ItemIndex < TraderItemsObject.SaleItems.Length )
	{
		TraderItem = TraderItemsObject.SaleItems[ItemIndex];
		return true;
	}

	return false;
}

/** Gets buy price for trader item, adjusted for whatever we want to adjust for */
simulated function int GetAdjustedBuyPriceFor( const out STraderItem ShopItem, optional const array<SItemInformation> TraderOwnedItems )
{
	local int AdjustedBuyPrice, i;

	AdjustedBuyPrice = ShopItem.WeaponDef.default.BuyPrice;

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
	 	AdjustedSellPrice = OwnedItem.WeaponDef.default.BuyPrice * StartedWithWeaponPriceModifier;
	}
	// otherwise modify its buy value by a modifier
	else
	{
		AdjustedSellPrice = OwnedItem.WeaponDef.default.BuyPrice * SellPriceModifier;
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

/** Modifies blocks required for the UI (e.g. in the case of dualies) */
simulated function int GetDisplayedBlocksRequiredFor( const out STraderItem ShopItem )
{
	// for now, only adjust blocks required for duals, except for dual 9mm since the single 9mm doesn't require any blocks
	if( ShopItem.SingleClassName == '' || ShopItem.SingleClassName == 'KFWeap_Pistol_9mm' )
	{
		return ShopItem.BlocksRequired;
	}
	
	// display half weight of dual if player owns single
	if( GetIsOwned(ShopItem.SingleClassName) )
	{
		return ShopItem.BlocksRequired / 2;
	}

	return ShopItem.BlocksRequired;
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
   FullHealthMsg="Health Full"
   MaxCarryBlocks=15
   AmmoPickupSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Ammo'
   ItemPickupSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Weapon'
   ArmorPickupSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Armor'
   SwitchFireModeEvent=AkEvent'WW_UI_PlayerCharacter.Play_WEP_ModeSwitch'
   StartedWithWeaponPriceModifier=0.500000
   SellPriceModifier=0.750000
   bMustHoldWeapon=True
   PendingFire(0)=0
   PendingFire(1)=0
   PendingFire(2)=0
   PendingFire(3)=0
   PendingFire(4)=0
   PendingFire(5)=0
   Name="Default__KFInventoryManager"
   ObjectArchetype=InventoryManager'Engine.Default__InventoryManager'
}
