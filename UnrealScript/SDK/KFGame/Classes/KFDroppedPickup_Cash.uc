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

DefaultProperties
{
	LifeSpan=120
	PickupSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Dosh'
}
