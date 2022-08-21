/*******************************************************************************
 * KFProj_Bolt_Crossbow generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Bolt_Crossbow extends KFProj_RicochetStickBullet
    hidecategories(Navigation);

simulated function SyncOriginalLocation()
{
    LastLocation = OriginalLocation;
    super(KFProjectile).SyncOriginalLocation();
}

defaultproperties
{
    WeaponClass=Class'KFWeap_Bow_Crossbow'
    AmmoPickupSound=AkEvent'WW_WEP_SA_Crossbow.Play_Crossbow_Bolt_Pickup'
    ProjPickupTemplate=ParticleSystem'WEP_Crossbow_EMIT.FX_Crossbow_Projectile_Pickup'
    LifeSpanAfterStick=180
    BouncesLeft=0
    bCheckRackEmUp=true
    bNoReplicationToInstigator=false
    ProjFlightTemplate=ParticleSystem'WEP_Crossbow_EMIT.FX_Crossbow_Projectile'
    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_Crossbow.Play_Bolt_Fly_By'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_Crossbow.Stop_Bolt_Fly_By'
    AmbientComponent=AkComponent'Default__KFProj_Bolt_Crossbow.AmbientAkSoundComponent'
    ImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Crossbow_impact'
    Speed=15000
    MaxSpeed=15000
    bBlockedByInstigator=false
    bRotationFollowsVelocity=false
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bolt_Crossbow.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bolt_Crossbow.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Bolt_Crossbow.AmbientAkSoundComponent'
    bNetTemporary=false
    bNoEncroachCheck=true
    LifeSpan=8
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bolt_Crossbow.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}