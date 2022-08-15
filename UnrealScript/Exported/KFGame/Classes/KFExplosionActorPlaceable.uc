//=============================================================================
// KFExplosionActorPlaceable
//=============================================================================
// Explosion actor that can be placed in the map
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFExplosionActorPlaceable extends KFExplosionActor
	placeable;

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   Begin Object Class=ArrowComponent Name=Arrow
      ArrowColor=(B=128,G=255,R=0,A=255)
      ArrowSize=1.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Components(1)=Arrow
   RemoteRole=ROLE_SimulatedProxy
   bNoDelete=True
   bGameRelevant=True
   Name="Default__KFExplosionActorPlaceable"
   ObjectArchetype=KFExplosionActor'KFGame.Default__KFExplosionActor'
}
