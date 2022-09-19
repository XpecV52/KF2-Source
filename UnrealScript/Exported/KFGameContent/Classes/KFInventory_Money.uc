//=============================================================================
// KFInventory_Money
//=============================================================================
// The KFInventory_Money is used to spawn dosh pickups
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFInventory_Money extends Inventory
	hidedropdown;

var float 		NextDropCashMessageTime;
var float		DropCashMessageDelay;

/**
 * Drop this item out in to the world
 *
 * @param	StartLocation 		- The World Location to drop this item from
 * @param	StartVelocity		- The initial velocity for the item when dropped
 */

function DropFrom(vector StartLocation, vector StartVelocity)
{
	local KFDroppedPickup_Cash KFDP;
	local PlayerReplicationInfo PRI;
	local int Amount;
	local KFGameReplicationInfo KFGRI;
	
	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	// if cannot spawn a pickup, then destroy and quit
	if( DroppedPickupClass == None || DroppedPickupMesh == None || (KFGRI != none && KFGRI.bIsWeeklyMode && KFGRI.CurrentWeeklyIndex == 16))
	{
		return;
	}

	// Get score (cash value) from PRI
	PRI = Instigator.PlayerReplicationInfo;
	if ( PRI != none && PRI.Score > 0 )
	{
		Amount = Min(50, int(PRI.Score));
	}
	if ( Amount <= 0 )
	{
		return;
	}

	// Offset spawn closer to eye location
	StartLocation.Z += Instigator.BaseEyeHeight / 2;

	// the last bool param is to prevent collision from preventing spawns
	KFDP = KFDroppedPickup_Cash(Spawn(DroppedPickupClass,PlayerController(Instigator.Controller),, StartLocation,,,true));
	if( KFDP == None )
	{
		PlayerController(Instigator.Controller).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_FailedDropInventory );
		return;
	}

	KFDP.SetPhysics(PHYS_Falling);
	KFDP.Inventory	= self;
	KFDP.InventoryClass = class;
	KFDP.Velocity = StartVelocity * 1.6;
	KFDP.Instigator = Instigator;
	KFDP.SetPickupMesh(DroppedPickupMesh);
	KFDP.SetPickupParticles(DroppedPickupParticles);

	KFDP.CashAmount = Amount;
	KFDP.TosserPRI = PRI;
	if( KFPlayerReplicationInfo(PRI) != none )
	{
		KFPlayerReplicationInfo(PRI).AddDosh( -Amount );
	}

	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayDoshTossDialog( KFPawn(Instigator) );
}

/** DenyPickupQuery
	Function which lets existing items in a pawn's inventory
	prevent the pawn from picking something up.
 * @param ItemClass Class of Inventory our Owner is trying to pick up
 * @param Pickup the Actor containing that item (this may be a PickupFactory or it may be a DroppedPickup)
 * @return true to abort pickup or if item handles pickup
 */
function bool DenyPickupQuery(class<Inventory> ItemClass, Actor Pickup)
{
	return false;
}

defaultproperties
{
   DropCashMessageDelay=5.000000
   DroppedPickupClass=Class'KFGame.KFDroppedPickup_Cash'
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh0
      SkeletalMesh=SkeletalMesh'GP_Mesh.dosh_SM'
      PhysicsAsset=PhysicsAsset'GP_Mesh.dosh_SM_Physics'
      ReplacementPrimitive=None
      CastShadow=False
      Name="PickupMesh0"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
   End Object
   DroppedPickupMesh=PickupMesh0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Inventory:Sprite'
      SpriteCategoryName="Inventory"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Inventory:Sprite'
   End Object
   Components(0)=Sprite
   Name="Default__KFInventory_Money"
   ObjectArchetype=Inventory'Engine.Default__Inventory'
}
