//=============================================================================
// KFTrigger_BloatKingGorge
//=============================================================================
// Spawned during gorge attack, triggers pawn to start checking on attached
//      pawns for whether or not they're are pullable.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFTrigger_BloatKingGorge extends Trigger;

var KFPawn_ZedBloatKing Bloat;

event BaseChange()
{
    Super.BaseChange();

    Bloat = KFPawn_ZedBloatKing(Base);
}

event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
    super.Touch(Other, OtherComp, HitLocation, HitNormal);
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Trigger:CollisionCylinder'
      CollisionHeight=120.000000
      CollisionRadius=700.000000
      bAlwaysRenderIfSelected=True
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__Trigger:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Trigger:Sprite'
      Sprite=Texture2D'EditorResources.S_Trigger'
      SpriteCategoryName="Triggers"
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Trigger:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   bNoDelete=False
   bProjTarget=False
   CollisionComponent=CollisionCylinder
   Name="Default__KFTrigger_BloatKingGorge"
   ObjectArchetype=Trigger'Engine.Default__Trigger'
}
