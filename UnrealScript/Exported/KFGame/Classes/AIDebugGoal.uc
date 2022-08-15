//=============================================================================
// AIDebugGoal.uc
//=============================================================================
// Actor that can be used to test AI pathing. Place one in a level and
// use the AIPathTo <goalname> cheat
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class AIDebugGoal extends Actor
	placeable;

/** This is the name you input when using the AIPathTo cheat (i.e, "AIPathTo GoalName") - use something easy to remember. */
var() name  GoalName;

defaultproperties
{
   GoalName="GoalName"
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'ENG_EditorResources_TEX.AI.KF_StorySquads_Ico'
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.200000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   CollisionType=COLLIDE_CustomDefault
   Name="Default__AIDebugGoal"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
