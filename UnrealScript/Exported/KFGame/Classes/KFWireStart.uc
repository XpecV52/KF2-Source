//=============================================================================
// KFWireStart
//=============================================================================
// Beam emitter wire system along with KFWireConnector
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//============================================================================
class KFWireStart extends Keypoint
	placeable
	native(Effect);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Keypoint:Sprite'
      Sprite=Texture2D'FX_Environmental_TEX.WireTool.KF_WireTool_Icon'
      SpriteCategoryName="Keypoints"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Keypoint:Sprite'
   End Object
   SpriteComp=Sprite
   Components(0)=Sprite
   CollisionType=COLLIDE_CustomDefault
   Name="Default__KFWireStart"
   ObjectArchetype=Keypoint'Engine.Default__Keypoint'
}
