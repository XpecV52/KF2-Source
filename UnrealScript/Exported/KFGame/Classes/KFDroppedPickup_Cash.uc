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
	local KFPawn_Human KFPH;
	local KFPlayerReplicationInfo KFPRI;

	if ( P.PlayerReplicationInfo != none )
	{
		KFPH = KFPawn_Human(P);
		KFPRI = KFPlayerReplicationInfo(P.PlayerReplicationInfo);
		// @todo (?): for now, play "catch dosh" dialog whenever you pick some up
		if( KFPRI != none && KFPRI != TosserPRI && KFPH != none )
		{
			KFPH.UpdateDoshCaught( CashAmount, TosserPRI );
			AddDoshForBenefector( TosserPRI );
		}

		if( KFPRI != none )
		{
			KFPRI.AddDosh( CashAmount );
			if(WorldInfo.GRI != none && WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("dosh_picked_up", KFPRI, "#"$CashAmount);
		}

		bForceNetUpdate = true;
		P.PlaySoundBase(PickUpSound);
	}

	PickedUpBy(P);
}

protected function AddDoshForBenefector( PlayerReplicationInfo MyTosserPRI )
{
	local KFPlayerController KFPC;

	if( MyTosserPRI != none )
	{
		KFPC = KFPlayerController(MyTosserPRI.Owner);
		if( KFPC != none )
		{
			KFPC.UpdateBenefactor( CashAmount );
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

/*********************************************************************************************
 * Minigame Support
 *
 * Kind of a best worst case fix here.  One of our minigames is client-authority for win
 *      condition.  Using the thrown cash's owner (thrower PC) to notify the server that the 
 *      game is complete for victory condition.
 ********************************************************************************************/
simulated function NotifyMinigameHit(KFInterface_MinigameTarget MinigameTarget)
{
    if (MinigameTarget.IsAlive())
    {
        ServerNotifyMinigameHit(Actor(MinigameTarget));
    }
}

reliable private server function ServerNotifyMinigameHit(Actor MinigameTarget)
{
    if (KFInterface_MinigameTarget(MinigameTarget) != none)
    {
        KFInterface_MinigameTarget(MinigameTarget).ValidHit(Controller(Owner), self);
    }
}

/*********************************************************************************************
 * State Pickup
 * Pickup is active
 *********************************************************************************************/

auto state Pickup
{
	/** Allow instigator to pick up dosh thrown at feet */
	event OnSleepRBPhysics()
	{
		local Pawn P;

		Global.OnSleepRBPhysics();

		foreach TouchingActors(class'Pawn', P)
		{
			if ( P == Instigator )
			{
				Touch( P, None, Location, vect(0,0,1) );
			}
		}
	}
}

defaultproperties
{
   PickupSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Dosh'
   bUseLowHealthDelay=False
   PickupDelay=0.200000
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
