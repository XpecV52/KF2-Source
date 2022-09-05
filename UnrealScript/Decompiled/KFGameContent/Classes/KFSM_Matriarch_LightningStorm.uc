/*******************************************************************************
 * KFSM_Matriarch_LightningStorm generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_Matriarch_LightningStorm extends KFSM_PlaySingleAnim;

var float MaxVictimDistance;
var name WindUpAnimName;
var name WindDownAnimName;
var KFGameExplosion ExplosionTemplate;

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    super.SpecialMoveStarted(bForced, PrevMove);
    PlayWindUpAnimation();
    KFPawn_ZedMatriarch(KFPOwner).PlayLightningStormDialog();
}

function PlayAnimation();

function PlayWindUpAnimation()
{
    KFPOwner.ZeroMovementVariables();
    PlaySpecialMoveAnim(WindUpAnimName, 0, BlendInTime, BlendOutTime, 1);
}

function PlayFireAnim()
{
    local KFExplosionActor ExplosionActor;

    PlaySpecialMoveAnim(AnimName, 0, 0.1, 0.2);
    KFPOwner.ZeroMovementVariables();
    ExplosionActor = KFPOwner.Spawn(Class'KFExplosionActor', KFPOwner,, KFPOwner.Mesh.GetBoneLocation('Root'), rotator(vect(0, 0, 1)));
    if(ExplosionActor != none)
    {
        ExplosionActor.Explode(ExplosionTemplate);
    }
}

function PlayWindDownAnim()
{
    KFPOwner.ZeroMovementVariables();
    PlaySpecialMoveAnim(WindDownAnimName, 0, BlendInTime, BlendOutTime, 1);
}

function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
    switch(DeferredSeqName)
    {
        case WindUpAnimName:
            PlayFireAnim();
            break;
        case AnimName:
            PlayWindDownAnim();
            break;
        case WindDownAnimName:
            KFPOwner.EndSpecialMove();
            break;
        default:
            break;
    }
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    super.SpecialMoveEnded(PrevMove, NextMove);
}

defaultproperties
{
    MaxVictimDistance=400
    WindUpAnimName=Lighting_Storm_In
    WindDownAnimName=Lighting_Storm_Out
    begin object name=ExploTemplate1 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'ZED_Matriarch_ARCH.Lightning_Storm_Explosion_Arch'
        Damage=65
        DamageRadius=800
        DamageFalloffExponent=0
        MyDamageType=Class'KFDT_EMP_MatriarchLightningStorm'
        KnockDownStrength=0
        MomentumTransferScale=0
        ExplosionSound=AkEvent'WW_ZED_Matriarch.Play_Matriarch_Storm_Attack_01'
        FractureMeshRadius=0
        FracturePartVel=0
        CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
    object end
    // Reference: KFGameExplosion'Default__KFSM_Matriarch_LightningStorm.ExploTemplate1'
    ExplosionTemplate=ExploTemplate1
    AnimName=Lighting_Storm_Loop
    bDisableMovement=true
    bDisableSteering=false
    bAllowFireAnims=true
    bShouldDeferToPostTick=true
    Handle=KFSM_Matriarch_LightningStorm
}