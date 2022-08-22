/*******************************************************************************
 * KFProj_FreezeGrenade generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_FreezeGrenade extends KFProj_Grenade
    hidecategories(Navigation);

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    ClearTimer('ExplodeTimer');
}

simulated event GrenadeIsAtRest()
{
    super.GrenadeIsAtRest();
    if(Role == ROLE_Authority)
    {
        SetTimer(FuseTime, false, 'ExplodeTimer');
    }
}

defaultproperties
{
    FuseTime=0.5
    WeaponSelectTexture=Texture2D'WEP_UI_LN2_Grenade_TEX.UI_WeaponSelect_SharpshooterGrenade'
    ExplosionActorClass=Class'KFGame.KFExplosionActor'
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'WEP_Freeze_Grenade_Arch.FreezeGrenade_Explosion'
        Damage=25
        DamageRadius=900
        MyDamageType=Class'KFDT_Freeze_FreezeGrenade'
        MomentumTransferScale=1
        ExplosionSound=AkEvent'WW_WEP_Freeze_Grenade.Play_Freeze_Grenade_Explo'
        ExploLight=PointLightComponent'Default__KFProj_FreezeGrenade.ExplosionPointLight'
        ExploLightFadeOutTime=0.25
        ExploLightStartFadeOutTime=0.5
        ExploLightFlickerIntensity=5
        ExploLightFlickerInterpSpeed=15
        CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
        CamShakeInnerRadius=200
        CamShakeFalloff=1.5
    object end
    // Reference: KFGameExplosion'Default__KFProj_FreezeGrenade.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
    ProjFlightTemplate=ParticleSystem'WEP_Freeze_Grenade_EMIT.FX_Freeze_Grenade_Mesh'
    AssociatedPerkClass=Class'KFGame.KFPerk_Sharpshooter'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_FreezeGrenade.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_FreezeGrenade.CollisionCylinder'
    Components(0)=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_FreezeGrenade.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}