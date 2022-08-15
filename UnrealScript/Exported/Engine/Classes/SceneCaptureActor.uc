/**
 * SceneCaptureActor
 *
 * Base class for actors that want to capture the scene
 * using a scene capture component 
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SceneCaptureActor extends Actor
	native
	abstract;

/** component that renders the scene to a texture */
var() const SceneCaptureComponent SceneCapture;

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
// (cpptext)
// (cpptext)
// (cpptext)

/**
  *  Toggling enables or disables the scene capture.
  */
simulated function OnToggle(SeqAct_Toggle action)
{
	local bool bEnable;

	if( SceneCapture == None )
		return;

	// Turn ON
	if (action.InputLinks[0].bHasImpulse)
	{
		bEnable = TRUE;
	}
	// Turn OFF
	else if (action.InputLinks[1].bHasImpulse)
	{
		bEnable = FALSE;
	}
	// Toggle
	else if (action.InputLinks[2].bHasImpulse)
	{
		bEnable = !SceneCapture.bEnabled;
	}

	SceneCapture.SetEnabled(bEnable);
}

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite
      SpriteCategoryName="SceneCapture"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_CustomDefault
   bNoDelete=True
   Name="Default__SceneCaptureActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
