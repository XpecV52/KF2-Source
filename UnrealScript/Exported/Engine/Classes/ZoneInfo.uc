/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ZoneInfo extends Info
	native;

var() float KillZ;		// any actor falling below this level gets destroyed
var() float SoftKill;   // units of grace until land
var() class<KillZDamageType> KillZDamageType<AllowAbstract>;    // damage type for KillZ
var() bool bSoftKillZ;	// enable SoftKill

defaultproperties
{
   KillZ=-262143.000000
   SoftKill=2500.000000
   KillZDamageType=Class'Engine.KillZDamageType'
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Info:Sprite'
      SpriteCategoryName="Info"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Info:Sprite'
   End Object
   Components(0)=Sprite
   bStatic=True
   bNoDelete=True
   bGameRelevant=True
   Name="Default__ZoneInfo"
   ObjectArchetype=Info'Engine.Default__Info'
}
