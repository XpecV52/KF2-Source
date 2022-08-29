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

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

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
	local KFPawn_Scripted ScriptedPawn;

	Super.Touch(Other, OtherComp, HitLocation, HitNormal);
	if( Role == ROLE_Authority )
	{
		class'KFPlayerController'.static.UpdateInteractionMessages( Other );

		// touched a scripted pawn
		ScriptedPawn = KFPawn_Scripted(Other);
		if (ScriptedPawn != none && DoorActor != none)
		{
			// disable closing the door while the scripted pawn is moving through
			DoorActor.bCanCloseDoor = false;

			// if the door is closed, tell the scripted pawn to wait until the door is opened
			if (!DoorActor.bIsDoorOpen)
			{
				ScriptedPawn.StartDoorWait(DoorActor);
			}
		}
	}
}

simulated event UnTouch(Actor Other)
{
	local KFPawn_Scripted ScriptedPawn;

	super.UnTouch( Other );
	if( Role == ROLE_Authority )
	{
		class'KFPlayerController'.static.UpdateInteractionMessages( Other );

		// stopped touched a scripted pawn
		ScriptedPawn = KFPawn_Scripted(Other);
		if (ScriptedPawn != none && DoorActor != none)
		{
			// tell the door that it can be closed again
			DoorActor.bCanCloseDoor = true;
		}
	}
}

/** Update interaction message (toggle between use and repair) */
function OnDestroyOrReset()
{
	local KFPawn_Human P;

	foreach TouchingActors(class'KFPawn_Human', P)
	{
		class'KFPlayerController'.static.UpdateInteractionMessages( P );
	}
}

simulated function bool GetIsUsable( Pawn User )
{
	local bool bCanRepairDoors;
	local KFPawn KFP;

	KFP = KFPawn( User );
	bCanRepairDoors = ( KFP != none && KFP.GetPerk() != none && KFP.GetPerk().CanRepairDoors() );
	if ( DoorActor != None && (bCanRepairDoors || !DoorActor.bIsDestroyed) )
	{
		return true;
	}

	return false;
}

function int GetInteractionIndex( Pawn User )
{
	if ( DoorActor.bIsDestroyed )
	{
		return IMT_RepairDoor;
	}
	else if( DoorActor.WeldIntegrity > 0 )
	{
		if( User.Weapon != none && User.Weapon.Class.Name == 'KFWeap_Welder' )
		{
			return INDEX_NONE;
		}

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

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFTrigger_ChokePoint:CollisionCylinder'
      CollisionHeight=100.000000
      CollisionRadius=200.000000
      bAlwaysRenderIfSelected=True
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFTrigger_ChokePoint:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFTrigger_ChokePoint:Sprite'
      Sprite=Texture2D'EditorResources.S_Trigger'
      SpriteCategoryName="Triggers"
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFTrigger_ChokePoint:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__KFDoorTrigger"
   ObjectArchetype=KFTrigger_ChokePoint'KFGame.Default__KFTrigger_ChokePoint'
}
