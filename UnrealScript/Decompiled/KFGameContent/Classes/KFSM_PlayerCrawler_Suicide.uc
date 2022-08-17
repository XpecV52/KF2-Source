/*******************************************************************************
 * KFSM_PlayerCrawler_Suicide generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_PlayerCrawler_Suicide extends KFSM_PlaySingleAnim;

var KFGameExplosion SuicideGasExplosionTemplate;
var class<KFDamageType> SuicideDamageType;

protected function bool InternalCanDoSpecialMove()
{
    if(KFPOwner.WorldInfo.GRI.bMatchIsOver)
    {
        return false;
    }
    if(KFPOwner.IsHumanControlled())
    {
        return KFPOwner.IsAliveAndWell();
    }
    return true;
}

simulated function SpecialMoveEnded(name PrevMove, name NextMove)
{
    TriggerExplosion(KFPOwner);
    super.SpecialMoveEnded(PrevMove, NextMove);
}

static function TriggerExplosion(KFPawn CrawlerOwner, optional bool bForceExplosion)
{
    local KFExplosion_PlayerCrawlerSuicide ExploActor;

    if(!CrawlerOwner.bPlayedDeath || bForceExplosion)
    {
        KFPawn_ZedCrawler_Versus(CrawlerOwner).OldController = CrawlerOwner.Controller;
        ExploActor = CrawlerOwner.Spawn(Class'KFExplosion_PlayerCrawlerSuicide', CrawlerOwner,, CrawlerOwner.Location, rotator(vect(0, 0, 1)));
        if(ExploActor != none)
        {
            ExploActor.Explode(default.SuicideGasExplosionTemplate);
        }
        if(((CrawlerOwner.Role == ROLE_Authority) && !CrawlerOwner.bPlayedDeath) && !bForceExplosion)
        {
            CrawlerOwner.TakeRadiusDamage(none, 10000, default.SuicideGasExplosionTemplate.DamageRadius, default.SuicideDamageType, 1, CrawlerOwner.Location, true, none);
        }
    }
}

defaultproperties
{
    begin object name=ExploTemplate1 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'ZED_Crawler_ARCH.ToxicGasAoE_Explosion'
        Damage=10
        DamageRadius=600
        DamageFalloffExponent=0
        MyDamageType=Class'KFDT_Toxic_PlayerCrawlerSuicide'
        KnockDownStrength=0
        MomentumTransferScale=100
        ExplosionSound=AkEvent'WW_WEP_EXP_Dynamite.Play_WEP_EXP_Dynamite_Explosion'
        ExploLight=PointLightComponent'Default__KFSM_PlayerCrawler_Suicide.ExplosionPointLight'
        ExploLightFadeOutTime=1
        ExploLightStartFadeOutTime=7
        ExploLightFlickerIntensity=5
        ExploLightFlickerInterpSpeed=15
        FractureMeshRadius=0
        FracturePartVel=0
        CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
    object end
    // Reference: KFGameExplosion'Default__KFSM_PlayerCrawler_Suicide.ExploTemplate1'
    SuicideGasExplosionTemplate=ExploTemplate1
    SuicideDamageType=Class'KFDT_Explosive_CrawlerSuicide'
    AnimName=Player_Suicide
    bUseRootMotion=true
    bPawnRotationLocked=true
    Handle=KFSM_PlayerCrawler_Suicide
}