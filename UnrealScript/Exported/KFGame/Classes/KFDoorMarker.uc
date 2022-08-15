//=============================================================================
// KFDoorMarker
//=============================================================================
// Base KF2 NavigationPoint used to mark door locations
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFDoorMarker extends DoorMarker
	native(Waypoint)
	hidecategories(DoorMarker);

var(KF2) KFDoorActor	MyKFDoor;
/** Optionally override the distance at which my door will be considered reached by NPCs */
var(KF2) float			AdjustedReachThreshold;
/** Optionally override the extra cost for Zeds to want to path through this door if it's closed & welded */
var(KF2) int			ExtraCostWhenWelded;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

event bool SuggestMovePreparation( Pawn Other )
{
	local KFPawn_Monster KFPM;
	local int count;

	if( KFPawn(Other).MyKFAIC!= None ) { KFPawn(Other).MyKFAIC.AILog_Internal(GetFuncName()$"() "$self$" called for "$Other$" Dist: "$VSize(Location - Other.Location),'Doors'); };

	if( MyKFDoor != none && !MyKFDoor.IsCompletelyOpen() && MyKFDoor.WeldIntegrity > 0 )
	{
		// @Todo We might want to make this check from the position of the marker without the visible check
		foreach VisibleCollidingActors( class'KFPawn_Monster', KFPM, 220.f, Other.Location,,, true  )
		{
			// Stop trying to attack the door if another zed's attacking it, as this event call was probably from adjust around code caused by bumping into the door
			if( KFPM != Other && KFPM.IsAliveAndWell() && VSizeSq2D(KFPM.Location - Location) < VSizeSq2D(Other.Location - Location) &&
				KFPM.MyKFAIC.DoorEnemy != none && KFPM.MyKFAIC.DoorEnemy == MyKFDoor )
			{
				Count++;
			}
		}
		if( Count > 3 )
		{
			if( KFPawn(Other).MyKFAIC!= None ) { KFPawn(Other).MyKFAIC.AILog_Internal(GetFuncName()$"() "$self$" - telling "$Other$" to wait for "$MyKFDoor$" to open",'Doors'); };
			Other.ZeroMovementVariables();
			//DrawDebugSphere( Other.Location, 32, 8, 255, 0, 0, true );
			KFPawn_Monster(Other).MyKFAIC.WaitForDoor( MyKFDoor );
			return true;
		}
	}

	return false;

	if( MyKFDoor == None || MyKFDoor.IsCompletelyOpen() )
	{
		return false;
	}

		if( KFPawn(Other) != none && !KFPawn(Other).IsHumanControlled() )
		{
			if( KFPawn(Other).MyKFAIC!= None ) { KFPawn(Other).MyKFAIC.AILog_Internal(GetFuncName()$" "$self$" by "$KFPawn(Other).MyKFAIC$" Dist: "$VSize(Location-Other.Location),'Doors'); };
		}

	if( VSize(Location - Other.Location) < 72.f || (Other.Controller != none && Other.Controller.ActorReachable(self)) )
	{
		// Door is welded shut
		if( MyKFDoor.WeldIntegrity > 0 )
		{

			if( KFPawn(Other) != none && !KFPawn(Other).IsHumanControlled() )
			{
				if( KFPawn(Other).MyKFAIC!= None ) { KFPawn(Other).MyKFAIC.AILog_Internal(GetFuncName()$" "$self$" by "$KFPawn(Other).MyKFAIC$" calling WaitForDoor and NotifyAttacKDoor",'Doors'); };
			}

			KFAIController( Other.Controller ).WaitForDoor( MyKFDoor );
			KFAIController( Other.Controller ).NotifyAttackDoor( MyKFDoor );
			return true;
		}
		else
		{

			if( KFPawn(Other) != none && !KFPawn(Other).IsHumanControlled() )
			{
				if( KFPawn(Other).MyKFAIC!= None ) { KFPawn(Other).MyKFAIC.AILog_Internal(GetFuncName()$" "$self$" by "$KFPawn(Other).MyKFAIC$" calling WaitForDoor and UseDoor",'Doors'); };
			}

			KFAIController( Other.Controller ).WaitForDoor( MyKFDoor );
			MyKFDoor.UseDoor( Other );
			return true;
		}
	}
	else
	{
		return false;
	}
}

function MoverOpened()
{
	bBlocked = (!bInitiallyClosed && bBlockedWhenClosed);
	bDoorOpen = bInitiallyClosed;
	WorldInfo.Game.NotifyNavigationChanged(self);
}

function MoverClosed()
{
	bBlocked = (bInitiallyClosed && bBlockedWhenClosed);
	bDoorOpen = !bInitiallyClosed;
	WorldInfo.Game.NotifyNavigationChanged(self);
}

function bool ProceedWithMove(Pawn Other)
{
	local KFAIController KFAIC;

	
		if( KFPawn(Other) != none && !KFPawn(Other).IsHumanControlled() )
		{
			if( KFPawn(Other).MyKFAIC!= None ) { KFPawn(Other).MyKFAIC.AILog_Internal(GetFuncName()$" "$self$" for "$Other,'Doors'); };
		}
	

	KFAIC = KFAIController( Other.Controller );

	if( KFAIC != none && KFAIC.PendingDoor != none && (bWaitUntilCompletelyOpened && KFAIC.PendingDoor.IsCompletelyOpen()) ||
        (!bWaitUntilCompletelyOpened && (KFAIC.PendingDoor.bIsDoorOpen || KFAIC.PendingDoor.bIsDestroyed)) )
	{
		return true;
	}

	if( MyKFDoor != none && (bWaitUntilCompletelyOpened && MyKFDoor.IsCompletelyOpen()) ||
        (!bWaitUntilCompletelyOpened && (MyKFDoor.bIsDoorOpen || MyKFDoor.bIsDestroyed)) )
	{
		return true;
	}

	if( Other.Controller != none && KFAIController( Other.Controller ) != none &&
        bWaitUntilCompletelyOpened && MyKFDoor != none )
	{
		KFAIController( Other.Controller ).WaitForDoor( MyKFDoor );
	}

	return false;
}

event Actor SpecialHandling( Pawn Other )
{
	if( KFPawn(Other).MyKFAIC!= None ) { KFPawn(Other).MyKFAIC.AILog_Internal(GetFuncName()$"() "$self$" SpecialHandling event called for "$Other,'Doors'); };
	if ( MyKFDoor == None || MyKFDoor.IsCompletelyOpen() /*|| VSize( Location - Other.Location ) > 200.f*/ )
	{
		return self;
	}

	if( KFPawn(Other) != none && !KFPawn(Other).IsHumanControlled() )
	{
		if( KFPawn(Other).MyKFAIC!= None ) { KFPawn(Other).MyKFAIC.AILog_Internal(GetFuncName()$" "$self$" calling for "$Other,'Doors'); };
	}

	return self; // Added 1.24.14

// Disabled 1.24.14, replaced with MoveToGoal command door handling (see ReachedIntermediateGoal)
// Door is welded shut
// 	if( MyKFDoor.WeldIntegrity > 0 )
// 	{
// 		KFAIController( Other.Controller ).WaitForDoor( MyKFDoor );
// 		KFAIController( Other.Controller ).NotifyAttackDoor( MyKFDoor );
// 		return self;
// 	}
// 	else
// 	{
// 		KFAIController( Other.Controller ).WaitForDoor( MyKFDoor );
// 		MyKFDoor.UseDoor( Other );
// 		return self;
// 	}
}

defaultproperties
{
   AdjustedReachThreshold=72.000000
   ExtraCostWhenWelded=3000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__DoorMarker:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__DoorMarker:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__DoorMarker:Sprite'
      Sprite=Texture2D'EditorResources.S_NavP'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__DoorMarker:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'Engine.Default__DoorMarker:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'Engine.Default__DoorMarker:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'Engine.Default__DoorMarker:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__DoorMarker:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'Engine.Default__DoorMarker:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'Engine.Default__DoorMarker:PathRenderer'
   End Object
   Components(4)=PathRenderer
   CollisionComponent=CollisionCylinder
   Name="Default__KFDoorMarker"
   ObjectArchetype=DoorMarker'Engine.Default__DoorMarker'
}
