/**
 *  Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class NavMeshObstacle extends Actor
	native(AI)
	implements(Interface_NavMeshPathObstacle)
	placeable;

var() bool bEnabled;
var() bool bPreserveInternalGeo;

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

struct CheckpointRecord
{
	var bool bEnabled;
};

/**
 * script accessible function that builds the bounding shape for the navmesh obstacle 
 * Note: needs to return a CW wound convex shape!
 * @param shape - array of verts for cutting shape
 * @return TRUE if the shape creation was a success
 */
event bool GetObstacleBoudingShape(out array<vector> Shape)
{
	local float Scale;
	local vector Offset;
	Scale = 200.f * DrawScale;

	// Clockwise!
	// top right corner
	Offset.X = Scale * DrawScale3D.X;
	Offset.Y = Scale * DrawScale3D.Y;	
	Shape.AddItem(Location + (Offset >> Rotation));
	// bottom right corner
	Offset.X = -Scale * DrawScale3D.X;
	Offset.Y = Scale * DrawScale3D.Y;
	Shape.AddItem(Location + (Offset >> Rotation) );
	// bottom left corner
	Offset.X = -Scale * DrawScale3D.X;
	Offset.Y = -Scale * DrawScale3D.Y;
	Shape.AddItem(Location + (Offset >> Rotation) );
	// top left corner
	Offset.X = Scale * DrawScale3D.X;
	Offset.Y = -Scale * DrawScale3D.Y;
	Shape.AddItem(Location + (Offset >> Rotation) );
	
	return TRUE;
}

native function RegisterObstacle();
native function UnRegisterObstacle();

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	if(bEnabled)
	{
		RegisterObstacle();
	}	
}

simulated function OnToggle(SeqAct_Toggle Action)
{
	// Turn ON
	if (Action.InputLinks[0].bHasImpulse)
	{
		bEnabled=true;
	}
	// Turn OFF
	else if (Action.InputLinks[1].bHasImpulse)
	{
		bEnabled=false;
	}
	// Toggle
	else if (Action.InputLinks[2].bHasImpulse)
	{
		bEnabled = !bEnabled;
	}

	SetEnabled(bEnabled);
}

function SetEnabled(bool bInEnabled)
{
	if(bInEnabled)
	{
		RegisterObstacle();
	}
	else
	{
		UnRegisterObstacle();
	}
}

function CreateCheckpointRecord(out CheckpointRecord Record)
{
	Record.bEnabled = bEnabled;
}

function ApplyCheckpointRecord(const out CheckpointRecord Record)
{
	SetEnabled(Record.bEnabled);
}

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_Keypoint'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   Begin Object Class=DrawBoxComponent Name=DrawBox0
      BoxColor=(B=255,G=70,R=64,A=255)
      ReplacementPrimitive=None
      Name="DrawBox0"
      ObjectArchetype=DrawBoxComponent'Engine.Default__DrawBoxComponent'
   End Object
   Components(1)=DrawBox0
   CollisionType=COLLIDE_CustomDefault
   Name="Default__NavMeshObstacle"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
