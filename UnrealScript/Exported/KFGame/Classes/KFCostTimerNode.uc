//=============================================================================
// KFCostTimerNode
//=============================================================================
// Base KF NavigationPoint used to mark door locations
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFCostTimerNode extends KFPathnode
	native(Waypoint)
	placeable;

var() bool		bEnableCostTimer;
var() int		MinCost;
var() int		MaxCost;
var() float		TimerMin;
var() float		TimerMax;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

function PostBeginPlay()
{
	super.PostBeginPlay();

	LogInternal(self$" PostBeginPlay");
	if( bEnableCostTimer )
	{
	//	StartCostTimer(); // TEMP commented out 11/30
	}
}

function CostTimer()
{
	ExtraCost = RandRange( MinCost, MaxCost );
	LogInternal(self$" Extra cost now "$ExtraCost);
	StartCostTimer();
}

function StartCostTimer()
{
	SetTimer( RandRange( TimerMin, TimerMax ), false, nameof( CostTimer ) );
}

defaultproperties
{
   MinCost=150
   MaxCost=550
   TimerMin=2.000000
   TimerMax=15.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPathnode:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPathnode:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPathnode:Sprite'
      Sprite=Texture2D'EditorResources.S_Pickup'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPathnode:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'KFGame.Default__KFPathnode:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPathnode:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPathnode:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPathnode:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'KFGame.Default__KFPathnode:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'KFGame.Default__KFPathnode:PathRenderer'
   End Object
   Components(4)=PathRenderer
   CollisionType=COLLIDE_CustomDefault
   bStatic=False
   bNoDelete=False
   CollisionComponent=CollisionCylinder
   Name="Default__KFCostTimerNode"
   ObjectArchetype=KFPathnode'KFGame.Default__KFPathnode'
}
