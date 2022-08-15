//=============================================================================
// KFDroppedPickup_Cash
//=============================================================================
// The KFDroppedPickup_Cash is used to throw dosh at other players
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFDroppedPickup_Cash extends KFDroppedPickup;

var		int 					CashAmount;		// How much?
var		PlayerReplicationInfo	TosserPRI;      // The giver
var 	AkEvent					PickupSound;

/** Instead of adding to inventory, apply score directly to PRI */
function GiveTo( Pawn P )
{
	if ( P.PlayerReplicationInfo != none )
	{
		// play dosh catch dialog
		// if( (Abs(Velocity.X) > 0 || Abs(Velocity.Y) > 0) && KFPawn_Human(P) != none )
		// {
		// 	KFPawn_Human(P).UpdateDoshCaught( CashAmount, TosserPRI );
		// }

		// @todo (?): for now, play "catch dosh" dialog whenever you pick some up
		if( P.PlayerReplicationInfo != TosserPRI )
		{
			KFPawn_Human(P).UpdateDoshCaught( CashAmount, TosserPRI );
		}

		if( KFPlayerReplicationInfo(P.PlayerReplicationInfo) != none )
		{
			KFPlayerReplicationInfo(P.PlayerReplicationInfo).AddDosh( CashAmount );
		}

		bForceNetUpdate = true;
		P.PlaySoundBase(PickUpSound);

		CheckForPayDayBonus(P);
	}

	PickedUpBy(P);
}

/** Check if we get some cash back in case the pay day objective is active */
function CheckForPayDayBonus(Pawn ReceiverPawn)
{
	local KFGameReplicationInfo MyKFGRI;
	local KFPawn_Human KFPH;

	if  ( ReceiverPawn.PlayerReplicationInfo == TosserPRI )
	{
		return;
	}

	MyKFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if ( MyKFGRI != none && MyKFGRI.CurrentObjective != none )
	{
   		KFPH = KFPawn_Human(ReceiverPawn);
		if ( KFPH != none && KFPH.bObjectivePlayer )
		{
			// return a 30% benefit for being nice when the pay day objective is active
			if( KFPlayerReplicationInfo(TosserPRI) != none )
			{
				KFPlayerReplicationInfo(TosserPRI).AddDosh(MyKFGRI.CurrentObjective.GetPayDayBonusDosh(CashAmount), true);
			}
		}
	}
}

/**
 * sets the pickups mesh and makes it the collision component so we can run rigid body physics on it
 */
simulated function SetPickupMesh(PrimitiveComponent NewPickupMesh)
{
	Super.SetPickupMesh(NewPickupMesh);

	// Collide with other dosh! (just while they are both awake)
	CollisionComponent.SetRBCollidesWithChannel(RBCC_Pickup, TRUE);
}

event Destroyed()
{
	// don't destroy the inventory item
	TosserPRI = none;
	Inventory = none;
}

defaultproperties
{
   PickupSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Dosh'
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFDroppedPickup:Sprite'
      Sprite=Texture2D'EditorResources.S_Inventory'
      SpriteCategoryName="Inventory"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFDroppedPickup:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFDroppedPickup:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=75.000000
      ReplacementPrimitive=None
      CollideActors=True
      Translation=(X=0.000000,Y=0.000000,Z=40.000000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFDroppedPickup:CollisionCylinder'
   End Object
   Components(1)=CollisionCylinder
   LifeSpan=120.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFDroppedPickup_Cash"
   ObjectArchetype=KFDroppedPickup'KFGame.Default__KFDroppedPickup'
}
