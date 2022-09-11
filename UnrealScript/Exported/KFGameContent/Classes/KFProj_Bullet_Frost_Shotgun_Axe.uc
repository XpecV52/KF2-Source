//=============================================================================
// KFProj_Bullet_Frost_Shotgun_Axe
//=============================================================================
// Bullet class for the Frost_Shotgun_Axe
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_Frost_Shotgun_Axe extends KFProj_Bullet_Pellet
	hidedropdown;

var AkEvent oFrozenSound;

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	local KFPawn p;
	p = KFPawn(Other);
	super.ProcessTouch(Other, HitLocation, HitNormal);
	if(p != none)
	{
		if(KFPawn_Monster(p).IsDoingSpecialMove(SM_Frozen))
		{
			p.PlayAkEvent(oFrozenSound);
		}
	}
}

defaultproperties
{
   oFrozenSound=AkEvent'WW_WEP_SA_CompoundBow.Play_Arrow_Impact_Cryo'
   ProjFlightTemplate=ParticleSystem'WEP_Frost_Shotgun_Axe_EMIT.FX_FrostFang_Tracer_01'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_Frost_Shotgun_Axe_EMIT.FX_FrostFang_Tracer_Zedtime_01'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_Bullet_Pellet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_Bullet_Pellet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_Frost_Shotgun_Axe_ARCH.WEP_FrostFang_Projectile_Impact'
   AssociatedPerkClass=Class'KFGame.KFPerk_Support'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_Bullet_Pellet:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_Bullet_Pellet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Bullet_Frost_Shotgun_Axe"
   ObjectArchetype=KFProj_Bullet_Pellet'kfgamecontent.Default__KFProj_Bullet_Pellet'
}
