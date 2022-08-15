/*******************************************************************************
 * KFExplosion_HansSmokeGrenade generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFExplosion_HansSmokeGrenade extends KFExplosionActor
    config(Weapon)
    hidecategories(Navigation);

var() float MaxSmokeTime;
var AkEvent SmokeLoopStartEvent;
var AkEvent SmokeLoopStopEvent;

simulated function Explode(GameExplosion NewExplosionTemplate, optional Vector Direction)
{
    super.Explode(NewExplosionTemplate, Direction);
    LifeSpan = MaxSmokeTime;
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        PlaySoundBase(SmokeLoopStartEvent, true);
    }
}

event Destroyed()
{
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        PlaySoundBase(SmokeLoopStopEvent, true);
    }
    super(Actor).Destroyed();
}

protected simulated function bool DoExplosionDamage(bool bCauseDamage, bool bCauseEffects)
{
    return false;
}

function float GetEffectCheckRadius(bool bCauseDamage, bool bCauseFractureEffects, bool bCauseEffects)
{
    local float CheckRadius;

    CheckRadius = super(GameExplosionActor).GetEffectCheckRadius(bCauseDamage, bCauseFractureEffects, bCauseEffects);
    if(bCauseEffects)
    {
        CheckRadius = FMax(CheckRadius, ExplosionTemplate.DamageRadius);
    }
    return CheckRadius;
}

defaultproperties
{
    MaxSmokeTime=8
    SmokeLoopStartEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Play_WEP_EXP_Grenade_Medic_Smoke_Loop'
    SmokeLoopStopEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Stop_WEP_EXP_Grenade_Medic_Smoke_Loop'
    bExplodeMoreThanOnce=true
}