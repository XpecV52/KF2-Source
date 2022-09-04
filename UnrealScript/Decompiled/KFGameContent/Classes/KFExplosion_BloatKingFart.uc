/*******************************************************************************
 * KFExplosion_BloatKingFart generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFExplosion_BloatKingFart extends KFExplosionActorLingering
    config(Weapon)
    hidecategories(Navigation);

defaultproperties
{
    interval=1
    maxTime=5
    bDoFullDamage=true
    LoopStartEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Play_WEP_EXP_Grenade_Medic_Smoke_Loop'
    LoopStopEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Stop_WEP_EXP_Grenade_Medic_Smoke_Loop'
    DamageScalePerStack=0
}