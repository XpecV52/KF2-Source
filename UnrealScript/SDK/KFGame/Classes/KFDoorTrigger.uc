//=============================================================================
// KFDoorTrigger
//=============================================================================
// Simple trigger used for doors to bypass kismet
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFDoorTrigger extends KFTrigger_ChokePoint
	placeable
	native
	implements(KFInterface_Usable);

/** reference to actor to play open/close animations */
var() KFDoorActor	DoorActor;

cpptext
{
#if WITH_EDITOR
	virtual void CheckForErrors();	// Skip 'Trigger is not referenced' warning
#endif
}

simulated event PostBeginPlay()
{
	/** Set our door actors trigger reference to be us */
	if( DoorActor != none )
	{
		DoorActor.DoorTrigger = self;
	}
}

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	Super.Touch(Other, OtherComp, HitLocation, HitNormal);
	if( Role == ROLE_Authority )
	{
		class'KFPlayerController'.static.UpdateInteractionMessages( Other );
	}
}

simulated event UnTouch(Actor Other)
{
	super.UnTouch( Other );
	if( Role == ROLE_Authority )
	{
		class'KFPlayerController'.static.UpdateInteractionMessages( Other );
	}
}

simulated function bool GetIsUsable( Pawn User )
{
	if ( DoorActor != None && !DoorActor.bIsDestroyed )
	{
		return true;
	}
	return false;
}

function int GetInteractionIndex()
{
	if( DoorActor.WeldIntegrity > 0 )
	{
		return IMT_UseDoorWelded;
	}
	else
	{
		return IMT_UseDoor;
	}
}

function bool UsedBy(Pawn User)
{
	if ( GetIsUsable( User ) )
	{
		DoorActor.UseDoor(User);
		return true;
	}
	return false;
}

simulated function bool CanRestoreChokeCollision(KFPawn_Monster KFPM)
{
	// If the door is closed, restore our collision
	if( !DoorActor.IsCompletelyOpen() )
	{
		return true;
	}
	return super.CanRestoreChokeCollision(KFPM);
}

simulated function bool CanReduceTeammateCollision()
{
    return bReduceTeammateCollision && DoorActor.IsCompletelyOpen();
}

simulated function bool PartialReduceTeammateCollision()
{
    return bReduceTeammateCollision && DoorActor.WeldIntegrity > 0 && DoorActor.Health > 0;
}

DefaultProperties
{
	Begin Object NAME=CollisionCylinder LegacyClassName=Trigger_TriggerCylinderComponent_Class
		CollisionRadius=+00200.000000
		CollisionHeight=+00100.000000
	End Object

	bProjTarget=false
}
