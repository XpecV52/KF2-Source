//=============================================================================
// KFProj_MedicGrenade_Mini
//=============================================================================
// Alt-ammo class for KFWeap_AssaultRifle_MedicGrenadeLauncher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFProj_MedicGrenade_Mini extends KFProj_MedicGrenade;

simulated event HitWall(vector HitNormal, actor Wall, PrimitiveComponent WallComp)
{
	local TraceHitInfo HitInfo;

	super.HitWall(HitNormal, Wall, WallComp);

	// Damage some destructibles...
	if (Pawn(Wall) == none && !Wall.bStatic && Wall.bCanBeDamaged)
	{
		HitInfo.HitComponent = WallComp;
		HitInfo.Item = INDEX_None;
		Wall.TakeDamage(Damage, InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType, HitInfo, self);
	}
}

/** Adjusts movement/physics of projectile.
  * Returns true if projectile actually bounced / was allowed to bounce */
simulated function bool Bounce( vector HitNormal, Actor BouncedOff )
{
	SetLocation(Location + HitNormal);
	super.Bounce(HitNormal, BouncedOff);

	// stop and drop
	Disable( 'Touch' );
	Velocity = vect(0,0,0);
	return true;
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	// ... Damage other destructibles?
    if (Other != Instigator && !Other.bStatic)
    {
		if (!CheckRepeatingTouch(Other) && Other.GetTeamNum() != GetTeamNum())
		{
			ProcessBulletTouch(Other, HitLocation, HitNormal);
		}
    }

	Disable( 'Touch' );
	Velocity = Vect(0,0,0);
}

defaultproperties
{
   FuseTime=0.010000
   bSyncToOriginalLocation=True
   bSyncToThirdPersonMuzzleLocation=True
   bDamageDestructiblesOnTouch=True
   bWarnAIWhenFired=True
   TossZ=150.000000
   GravityScale=0.500000
   TerminalVelocity=4000.000000
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_MedicGrenadeMini'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.MedicGrenade_Explosion'
      Damage=60.000000
      DamageFalloffExponent=0.000000
      MyDamageType=Class'KFGame.KFDT_Toxic_MedicGrenadeLauncher'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExplosionSound=AkEvent'WW_WEP_Medic_GrenadeLauncher.Play_WEP_Medic_GrenadeLauncher_Grenade_Explosion'
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=None
      CamShakeInnerRadius=0.000000
      CamShakeOuterRadius=0.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_MedicGrenade_Mini:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'WEP_Medic_GrenadeLauncher_EMIT.FX_Medic_GrenadeLauncher_Projectile'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_Medic_GrenadeLauncher_EMIT.FX_Medic_GrenadeLauncher_Projectile_ZEDTIME'
   Speed=4000.000000
   MaxSpeed=4000.000000
   Damage=50.000000
   MyDamageType=Class'kfgamecontent.KFDT_Ballistic_MedicRifleGrenadeLauncherImpact'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_MedicGrenade:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_MedicGrenade:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   bUpdateSimulatedPosition=True
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_MedicGrenade_Mini"
   ObjectArchetype=KFProj_MedicGrenade'kfgamecontent.Default__KFProj_MedicGrenade'
}
