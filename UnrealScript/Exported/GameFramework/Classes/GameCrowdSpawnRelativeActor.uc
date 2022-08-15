/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class GameCrowdSpawnRelativeActor extends Actor
	native;

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_NavP'
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   Name="Default__GameCrowdSpawnRelativeActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
