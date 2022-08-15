//=============================================================================
// KFPickupFactory_Item
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 1/22/2014
//=============================================================================

class KFPickupFactory_Item extends KFPickupFactory
	placeable
	native
	nativereplication;

struct native ItemPickup
{
	/** A list of all possible weapon pickups. These classes are used to
		populate the path names but will not actually load the weapon class*/
	var() class<Inventory> 	ItemClass;

    /** Chance relative to other valid attacks (Works like AnimNodeRandom) */
	var() const float 					Priority<ClampMin=0.0>;

	structdefaultproperties
	{
		Priority=1.f
	}
};

/** The list of possible pickups that could spawn from this factory */
var() array<ItemPickup> ItemPickups;

/** The name of the class we're using for armor */
var name ArmorClassName;

/** The index of the pickup we want to spawn */
var repnotify byte	PickupIndex;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	// Things the server should send to the client.
	if ( bNetDirty && (Role == ROLE_Authority) )
		PickupIndex;
}

simulated event ReplicatedEvent(name VarName)
{
	super.ReplicatedEvent( VarName );
	if ( VarName == nameof(PickupIndex) )
	{
		SetPickupMesh();
	}
}

/** Overloaded to add this pickup to its proper list in the gameinfo */
simulated function InitializePickup()
{
	local KFGameInfo KFGI;

	KFGI = KFGameInfo( WorldInfo.Game );
	if ( KFGI != none )
	{
     	KFGI.ItemPickups.AddItem( self );
	}
}

simulated event SetInitialState()
{
	bScriptInitialized = true;
}

/** Pick a weapon from 'ItemPickups' and enable it in the world */
function Reset()
{
	super.Reset();
	PickupIndex = ChooseWeaponPickup();
	bNetDirty = true;
	SetPickupMesh();
}

/** Chooses a weighted item pickup */
function int ChooseWeaponPickup()
{
	local int i, DesiredItemIdx;
	local float Weight, TotalWeight, RandomWeight;
	local array<int> IndexList;

	// Add up the total weight for all valid attacks
	for(i = 0; i < ItemPickups.Length; i++)
	{
		if ( ItemPickups[i].Priority > 0.f )
		{
			TotalWeight += ItemPickups[i].Priority;
			IndexList.AddItem(i);
		}
	}

	// If we have valid pickup to choose from
	if ( IndexList.Length > 0 && TotalWeight > 0.f )
	{
		RandomWeight = FRand();
		DesiredItemIdx = IndexList[0];

		// select a random attack based on Priority
		for(i = 0; i < (IndexList.Length - 1); i++)
		{
			Weight = ItemPickups[IndexList[i]].Priority / TotalWeight;

			if ( RandomWeight <= Weight )
			{
				break;	// finished
			}
			else
			{
				RandomWeight -= Weight;
				DesiredItemIdx = IndexList[i+1];
			}
		}
	}

	return DesiredItemIdx;
}

/** Use the pickups static mesh for this factory */
simulated function SetPickupMesh()
{
	local StaticMeshComponent FactoryPickupMesh;
	local StaticMeshComponent NewMeshComponent;

	FactoryPickupMesh = StaticMeshComponent( PickupMesh );
	NewMeshComponent= StaticMeshComponent( ItemPickups[ PickupIndex ].ItemClass.default.PickupFactoryMesh );

	FactoryPickupMesh.SetStaticMesh( NewMeshComponent.StaticMesh );
	// Reset the cull distance for the new mesh
	FactoryPickupMesh.SetCullDistance( 3500 );
}

/** Give the pickup or its ammo to the player */
function GiveTo( Pawn P )
{
	if ( ItemPickups[ PickupIndex ].ItemClass.Name == ArmorClassName )
	{
    	GiveArmor( P );
	}
	else
	{
     	GiveWeapon( P );
	}
}

function GiveArmor( Pawn P )
{
	local KFInventoryManager KFIM;
	KFIM = KFInventoryManager( P.InvManager );
	if (KFIM != none && KFIM.AddArmorFromPickup())
	{
  		ActivateNewPickup(P);
  
  		if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(class'KFGameInfo'.const.GBE_Pickup$","$P.PlayerReplicationInfo.PlayerName$","$"Armor");
	}
}

function GiveWeapon( Pawn P )
{
	local KFWeapon KFW;
	local class<Inventory> InventoryClass;
	local class<KFWeapon> KFWeaponClass;
	local KFInventoryManager KFIM;
	local Inventory Inv;

	// Check if we have the weapon
	KFIM = KFInventoryManager( P.InvManager );
	foreach KFIM.InventoryActors( class'KFWeapon', KFW )
	{
		KFWeaponClass = class<KFWeapon>( ItemPickups[PickupIndex].ItemClass );
		if ( KFW.class == ItemPickups[ PickupIndex ].ItemClass )
		{
			// if this isn't a dual-wield class, then we can't carry another
			if( KFW.DualClass == none )
			{
				PlayerController(P.Owner).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_AlreadyCarryingWeapon );
				return;
			}
		}
		// if we already have the dual version of this single, then we can't carry another
		else if( KFWeaponClass != none && KFW.Class == KFWeaponClass.default.DualClass )
		{
			PlayerController(P.Owner).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_AlreadyCarryingWeapon );
			return;
		}
	}

	// Give us the weapon if we do not have it
	InventoryClass = ItemPickups[ PickupIndex ].ItemClass;
	Inv = KFIM.CreateInventory(InventoryClass, true);

	if( Inv != none )
	{
        KFW = KFWeapon(Inv);
        if( KFW != none )
        {
            KFW.bGivenAtStart = true;
		}
        ActivateNewPickup(P);

		if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(class'KFGameInfo'.const.GBE_Pickup$","$P.PlayerReplicationInfo.PlayerName$","$InventoryClass);
	}
}

/** Activate a different pickup after the 'RespawnDelay' has finished */
function ActivateNewPickup(Pawn P)
{
	local KFGameInfo KFGI;

	KFGI = KFGameInfo( WorldInfo.Game );
	if ( KFGI != none )
	{
		KFGI.EnableNewPickup( KFGI.ItemPickups, KFGI.DifficultyInfo.GetWeaponPickupInterval(KFGI.GetLivingPlayerCount()), self );
	}
}

/** Determine what kind of pickup is visible. Used for dialog. */
function bool CurrentPickupIsWeapon()
{
	if( ItemPickups.Length == 0 )
	{
		return false;
	}

	return ItemPickups[ PickupIndex ].ItemClass.name != ArmorClassName;
}

function bool CurrentPickupIsArmor()
{
	if( ItemPickups.Length == 0 )
	{
		return false;
	}

	return ItemPickups[ PickupIndex ].ItemClass.name == ArmorClassName;
}

defaultproperties
{
   ArmorClassName="KFInventory_Armor"
   PickupIndex=255
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_AR15_Pickup'
      ReplacementPrimitive=None
      bCastDynamicShadow=False
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   PickupMesh=StaticMeshComponent0
   bNotBased=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPickupFactory:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=100.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPickupFactory:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPickupFactory:Sprite'
      Sprite=Texture2D'EditorResources.S_Weapon'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPickupFactory:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'KFGame.Default__KFPickupFactory:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPickupFactory:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPickupFactory:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPickupFactory:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'KFGame.Default__KFPickupFactory:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'KFGame.Default__KFPickupFactory:PathRenderer'
   End Object
   Components(4)=PathRenderer
   Components(5)=StaticMeshComponent0
   CollisionComponent=CollisionCylinder
   Name="Default__KFPickupFactory_Item"
   ObjectArchetype=KFPickupFactory'KFGame.Default__KFPickupFactory'
}
