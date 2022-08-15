//=============================================================================
// KFTrigger_SirenProjectileShield
//=============================================================================
// Spawned during scream attack, disintegrates incoming projectiles
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFTrigger_SirenProjectileShield extends Trigger;

var KFPawn_Monster Siren;

event BaseChange()
{
	Super.BaseChange();

	Siren = KFPawn_Monster(Base);
}

event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	local KFProjectile KFProj;

	KFProj = KFProjectile(Other);
	if( KFProj != none && !KFProj.bDeleteMe && KFProj.bCanDisintegrate && !KFProj.bHasDisintegrated )
	{
		KFProj.Disintegrate( rotator(-Velocity) );
		return;
	}

	super.Touch( Other, OtherComp, HitLocation, HitNormal );
}

simulated function bool StopsProjectile(Projectile P)
{
	return !bDeleteMe && bBlockActors;
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Trigger:CollisionCylinder'
      CollisionHeight=120.000000
      CollisionRadius=120.000000
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
   CollisionComponent=CollisionCylinder
   Name="Default__KFTrigger_SirenProjectileShield"
   ObjectArchetype=Trigger'Engine.Default__Trigger'
}
