//=============================================================================
// KFChokePointTrigger
//=============================================================================
// A custom trigger used to mark bottleneck locations in the map for special
// special AI considerations.  KFDoorTriggers are also Chokepoints.
// DOES NOT currently support overlapping touch!
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFTrigger_ChokePoint extends Trigger_PawnsOnly
	placeable
	native(AI);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** If true, larger enemies will have reduced collision while going through this choke point */
var() bool bReduceCollisionRadius;
/** If true, collision between all zeds will be reduced while attempting to go through this choke point */
var() bool bReduceTeammateCollision;

/** The reduced size of a zed going through a chokepiont */
var const float MaxCollisionRadius;

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	local KFPawn_Monster KFPM;
	super.Touch(Other, OtherComp, HitLocation, HitNormal);

	if( bReduceCollisionRadius )
	{
		KFPM = KFPawn_Monster(Other);
		if( KFPM != none )
		{
			KFPM.CurrentChokePointTrigger = self;
			if( KFPM.CylinderComponent != none && KFPM.CylinderComponent.CollisionRadius > MaxCollisionRadius )
			{
				KFPM.ChokePointTimer();
			}
		}
	}
}

simulated event UnTouch(Actor Other)
{
	local KFPawn_Monster KFPM;
	super.UnTouch( Other );

	KFPM = KFPawn_Monster(Other);
	if( KFPM != none )
	{
		KFPM.CurrentChokePointTrigger = none;
	}
}

simulated function bool CanRestoreChokeCollision(KFPawn_Monster KFPM)
{
	local KFPawn_Human TouchingHuman;

	// If a human is in this volume, restore our collision size
	ForEach TouchingActors(class'KFPawn_Human',TouchingHuman)
	{
		return true;
	}
	return false;
}

simulated function bool CanReduceTeammateCollision()
{
    return bReduceTeammateCollision;
}

simulated function bool PartialReduceTeammateCollision()
{
    return false;
}

defaultproperties
{
   bReduceCollisionRadius=True
   bReduceTeammateCollision=True
   MaxCollisionRadius=36.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Trigger_PawnsOnly:CollisionCylinder'
      CollisionHeight=100.000000
      CollisionRadius=200.000000
      bAlwaysRenderIfSelected=True
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__Trigger_PawnsOnly:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Trigger_PawnsOnly:Sprite'
      Sprite=Texture2D'EditorResources.S_Trigger'
      SpriteCategoryName="Triggers"
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Trigger_PawnsOnly:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   bStatic=True
   bProjTarget=False
   CollisionComponent=CollisionCylinder
   Name="Default__KFTrigger_ChokePoint"
   ObjectArchetype=Trigger_PawnsOnly'Engine.Default__Trigger_PawnsOnly'
}
