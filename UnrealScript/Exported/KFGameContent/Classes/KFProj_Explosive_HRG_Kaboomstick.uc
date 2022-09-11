//=============================================================================
// KFProj_Explosive_HRG_Kaboomstick
//=============================================================================
// Shotgun explosive pellet class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
// Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFProj_Explosive_HRG_Kaboomstick extends KFProj_BallisticExplosive
	hidedropdown;

/** Cached reference to owner weapon */
var protected KFWeapon OwnerWeapon;

/** Initialize the projectile */
function Init( vector Direction )
{
	super.Init( Direction );

	OwnerWeapon = KFWeapon( Owner );
	if( OwnerWeapon != none )
	{
		OwnerWeapon.LastPelletFireTime = WorldInfo.TimeSeconds;
	}
}

/** Don't allow more than one pellet projectile to perform this check in a single frame */
function bool ShouldWarnAIWhenFired()
{
	return super.ShouldWarnAIWhenFired() && OwnerWeapon != none && OwnerWeapon.LastPelletFireTime < WorldInfo.TimeSeconds;
}

/**
 * Force the fire not to burn the instigator, since setting it in the default props is not working for some reason - Ramm
 */
simulated protected function PrepareExplosionTemplate()
{
	local KFPawn KFP;
	local KFPerk CurrentPerk;
	
	ExplosionTemplate.bIgnoreInstigator = true;

    super.PrepareExplosionTemplate();

    if( ExplosionActorClass == class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass() )
    {
		KFP = KFPawn( Instigator );
		if( KFP != none )
		{
			CurrentPerk = KFP.GetPerk();
			if( CurrentPerk != none )
			{
				CurrentPerk.SetLastHX25NukeTime( WorldInfo.TimeSeconds );
			}
		}
	}
}

simulated event HitWall(vector HitNormal, actor Wall, PrimitiveComponent WallComp)
{
    // For some reason on clients up close shots with this projectile
    // get HitWall calls instead of Touch calls. This little hack fixes
    // the problem. TODO: Investigate why this happens - Ramm
    // If we hit a pawn with a HitWall call on a client, do touch instead
    if( WorldInfo.NetMode == NM_Client && Pawn(Wall) != none )
    {
        Touch( Wall, WallComp, Location, HitNormal );
        return;
    }

    Super.HitWall(HitNormal, Wall, WallComp);
}

/** Only allow this projectile to cause a nuke if there hasn't been another nuke very recently */
simulated function bool AllowNuke()
{
	local KFPawn KFP;
	local KFPerk CurrentPerk;

	KFP = KFPawn( Instigator );
	if( KFP != none )
	{
		CurrentPerk = KFP.GetPerk();
		if( CurrentPerk != none && (WorldInfo.TimeSeconds - CurrentPerk.GetLastHX25NukeTime()) < 0.25f )
		{
			return false;
		}
	}

	return super.AllowNuke();
}

defaultproperties
{
   bWarnAIWhenFired=True
   TossZ=150.000000
   TerminalVelocity=7000.000000
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_HRG_Kaboomstick_ARCH.WEP_HRG_Kaboomstick_Explosion'
      Damage=38.000000
      DamageRadius=200.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_HRG_Kaboomstick'
      KnockDownStrength=0.000000
      MomentumTransferScale=22500.000000
      ExplosionSound=AkEvent'ww_wep_hrg_kaboomstick.WEP_HRG_Kaboomstick_Projectile_Explo'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Explosive_HRG_Kaboomstick:ExplosionPointLight'
      ExploLightFadeOutTime=0.300000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
      CamShakeInnerRadius=0.000000
      CamShakeOuterRadius=300.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Explosive_HRG_Kaboomstick:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   AltExploEffects=KFImpactEffectInfo'WEP_HRG_Kaboomstick_ARCH.WEP_HRG_Kaboomstick_Explosion_Concussive_Force'
   ProjFlightTemplate=ParticleSystem'WEP_HRG_Kaboomstick_EMIT.FX_HRG_Kaboomstick_Projectile'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_HRG_Kaboomstick_EMIT.FX_HRG_Kaboomstick_Projectile_ZEDTIME'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   AssociatedPerkClass=Class'KFGame.KFPerk_Demolitionist'
   Speed=7000.000000
   MaxSpeed=7000.000000
   MomentumTransfer=50000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
      CollisionHeight=5.000000
      CollisionRadius=5.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   Physics=PHYS_Falling
   bBounce=False
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Explosive_HRG_Kaboomstick"
   ObjectArchetype=KFProj_BallisticExplosive'KFGame.Default__KFProj_BallisticExplosive'
}
