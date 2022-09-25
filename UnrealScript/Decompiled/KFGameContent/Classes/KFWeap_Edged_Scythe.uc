/*******************************************************************************
 * KFWeap_Edged_Scythe generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Edged_Scythe extends KFWeap_MeleeBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

const BloodParticlesSocket = 'BlockEffect';

var const array<MeleeHitboxInfo> HitboxChainFolded;
var const array<MeleeHitboxInfo> HitboxChainUnfolded;
var const int MaxHitRangeFolded;
var const int MaxHitRangeUnfolded;
var const int FoldedDamage;
var const int FoldedDamageAlt;
var const int UnfoldedDamage;
var const int UnfoldedDamageAlt;
var const class<DamageType> FoldedDT;
var const class<DamageType> FoldedDTAlt;
var const class<DamageType> UnfoldedDT;
var const class<DamageType> UnfoldedDTAlt;
var const float UnfoldBlendingDuration;
var const float FoldedAttackAnimRate;
var const Vector PlayerViewOffsetUnfolded;
var transient Vector OriginalPlayerViewOffset;
var transient bool bIsFolded;
var AnimNodeBlendPerBone FoldBlendNode;
var const ParticleSystem BloodParticles;
var ParticleSystem FoldedTrailParticleSystem;
var ParticleSystem UnfoldedTrailParticleSystem;

simulated event PreBeginPlay()
{
    super(KFWeapon).PreBeginPlay();
    OriginalPlayerViewOffset = PlayerViewOffset;
}

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    ChangeMode(true, false);
    SetFoldedBladeBlendTarget(1, 0);
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    super(KFWeapon).PostInitAnimTree(SkelComp);
    FoldBlendNode = AnimNodeBlendPerBone(SkelComp.FindAnimNode('FoldBlendNode'));
    SetFoldedBladeBlendTarget(1, 0);
}

simulated function bool CanReload(optional byte FireModeNum)
{
    return true;
}

reliable server function ServerSwapComplete()
{
    GotoState('Active');
}

simulated function ChangeMode(bool IsFolded, optional bool bApplyBlend)
{
    bApplyBlend = true;
    if(MeleeAttackHelper == none)
    {
        return;
    }
    if(IsFolded)
    {
        MeleeAttackHelper.SetMeleeRange(float(MaxHitRangeFolded));
        MeleeAttackHelper.SetHitboxChain(HitboxChainFolded);
        InstantHitDamage[0] = float(FoldedDamage);
        InstantHitDamage[5] = float(FoldedDamageAlt);
        InstantHitDamageTypes[0] = FoldedDT;
        InstantHitDamageTypes[5] = FoldedDTAlt;
        PlayerViewOffset = OriginalPlayerViewOffset;
        InstantHitDamageTypes[3] = Class'KFDT_Piercing_ScytheStabFolded';
        InstantHitMomentum[3] = 100000;
        InstantHitDamage[3] = 40;        
    }
    else
    {
        MeleeAttackHelper.SetMeleeRange(float(MaxHitRangeUnfolded));
        MeleeAttackHelper.SetHitboxChain(HitboxChainUnfolded);
        InstantHitDamage[0] = float(UnfoldedDamage);
        InstantHitDamage[5] = float(UnfoldedDamageAlt);
        InstantHitDamageTypes[0] = UnfoldedDT;
        InstantHitDamageTypes[5] = UnfoldedDTAlt;
        PlayerViewOffset = PlayerViewOffsetUnfolded;
        InstantHitDamageTypes[3] = Class'KFDT_Piercing_ScytheStab';
        InstantHitMomentum[3] = 100000;
        InstantHitDamage[3] = 60;
    }
    NotifyServerMode(bIsFolded);
    if(bApplyBlend)
    {
        SetFoldedBladeBlendTarget(((bIsFolded) ? 1 : 0), UnfoldBlendingDuration);
    }
}

simulated function SetFoldedBladeBlendTarget(float Value, float BlendTime)
{
    if(FoldBlendNode != none)
    {
        FoldBlendNode.SetBlendTarget(Value, BlendTime);
    }
}

simulated function StartFire(byte FireModeNum)
{
    if(StartFireDisabled && FireModeNum == 1)
    {
        StartFireDisabled = false;
        return;
    }
    if((FireModeNum == 0) || FireModeNum == 5)
    {
        DistortTrailParticle = ((bIsFolded) ? FoldedTrailParticleSystem : UnfoldedTrailParticleSystem);        
    }
    else
    {
        if(FireModeNum == 3)
        {
            DistortTrailParticle = none;
        }
    }
    super.StartFire(FireModeNum);
}

static simulated function float CalculateTraderWeaponStatDamage()
{
    return float(default.UnfoldedDamage);
}

simulated function PlayAnimation(name Sequence, optional float fDesiredDuration, optional bool bLoop, optional float BlendInTime, optional float BlendOutTime)
{
    local string NewAnimName;

    BlendInTime = 0.1;
    BlendOutTime = 0;
    if((((Sequence == 'Idle') || Sequence == 'Guncheck_v1') || Sequence == 'Guncheck_v2') || Sequence == 'Guncheck_v3')
    {
        NewAnimName = string(Sequence);        
        NewAnimName $= ((bIsFolded) ? "_Folded" : "_Unfolded");
        super(KFWeapon).PlayAnimation(name(NewAnimName), fDesiredDuration, bLoop, BlendInTime, BlendOutTime);        
    }
    else
    {
        super(KFWeapon).PlayAnimation(Sequence, fDesiredDuration, bLoop, BlendInTime, BlendOutTime);
    }
}

simulated function ModifyMeleeAttackSpeed(out float InSpeed, optional int FireMode, optional int UpgradeIndex, optional KFPerk CurrentPerk)
{
    FireMode = 0;
    UpgradeIndex = -1;    
    super(KFWeapon).ModifyMeleeAttackSpeed(InSpeed, FireMode, UpgradeIndex, CurrentPerk);
    if(bIsFolded)
    {
        InSpeed *= FoldedAttackAnimRate;
    }
}

simulated function ANIMNOTIFY_LockBolt()
{
    bIsFolded = !bIsFolded;
    ChangeMode(bIsFolded);
}

simulated function ANIMNOTIFY_UnLockBolt();

simulated function ANIMNOTIFY_CleanBlood()
{
    if(!bIsBloody)
    {
        return;
    }
    if((WorldInfo.NetMode != NM_DedicatedServer) && BloodParticles != none)
    {
        WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BloodParticles, MySkelMesh, 'BlockEffect', true);
    }
    super.ANIMNOTIFY_CleanBlood();
}

simulated function NotifyInitialState(bool bFolded)
{
    local KFPawn KFP;

    if(WorldInfo.NetMode != NM_Client)
    {
        LogInternal("NotifyInitialState: " $ string(bFolded));
        KFP = KFPawn(Instigator);
        KFP.OnWeaponSpecialAction(((bFolded) ? 0 : 1));
    }
}

reliable server function NotifyServerMode(bool bFolded)
{
    bIsFolded = bFolded;
}

simulated state WeaponUpkeep
{
    ignores BeginFire;

    simulated function BeginState(name PreviousStateName)
    {
        local name AnimName;
        local float Duration;

        AnimName = 'Clean_NoBlood';
        Duration = MySkelMesh.GetAnimLength(AnimName);
        if(Duration > 0)
        {
            if(Instigator.IsFirstPerson())
            {
                PlayAnimation(AnimName);
                SetTimer(Duration, false, 'SwapComplete');
            }            
        }
        else
        {
            WarnInternal("Duration is zero!!!" @ string(AnimName));
            SetTimer(0.001, false, 'SwapComplete');
        }
        NotifyBeginState();
    }

    simulated event EndState(name NextStateName)
    {
        ClearTimer('SwapComplete');
        super.EndState(NextStateName);
        NotifyEndState();
    }

    simulated function SwapComplete()
    {
        if(Role == ROLE_Authority)
        {
            GotoState('Active');            
        }
        else
        {
            GotoState('Active');
            ServerSwapComplete();
        }
    }
    stop;    
}

simulated state WeaponEquipping
{
    simulated event BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        if(WorldInfo.NetMode != NM_Client)
        {
            NotifyInitialState(bIsFolded);
        }
    }
    stop;    
}

defaultproperties
{
    HitboxChainFolded(0)=(BoneOffset=(X=3,Y=0,Z=190),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainFolded(1)=(BoneOffset=(X=-3,Y=0,Z=170),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainFolded(2)=(BoneOffset=(X=3,Y=0,Z=150),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainFolded(3)=(BoneOffset=(X=-3,Y=0,Z=130),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainFolded(4)=(BoneOffset=(X=3,Y=0,Z=110),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainFolded(5)=(BoneOffset=(X=-3,Y=0,Z=90),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainFolded(6)=(BoneOffset=(X=3,Y=0,Z=70),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainFolded(7)=(BoneOffset=(X=-3,Y=0,Z=50),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainFolded(8)=(BoneOffset=(X=3,Y=0,Z=30),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainFolded(9)=(BoneOffset=(X=0,Y=0,Z=10),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainUnfolded(0)=(BoneOffset=(X=-3,Y=0,Z=290),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainUnfolded(1)=(BoneOffset=(X=-3,Y=0,Z=270),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainUnfolded(2)=(BoneOffset=(X=-3,Y=0,Z=250),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainUnfolded(3)=(BoneOffset=(X=3,Y=0,Z=230),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainUnfolded(4)=(BoneOffset=(X=-3,Y=0,Z=210),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainUnfolded(5)=(BoneOffset=(X=3,Y=0,Z=190),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainUnfolded(6)=(BoneOffset=(X=-3,Y=0,Z=170),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainUnfolded(7)=(BoneOffset=(X=3,Y=0,Z=150),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainUnfolded(8)=(BoneOffset=(X=-3,Y=0,Z=130),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainUnfolded(9)=(BoneOffset=(X=3,Y=0,Z=110),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainUnfolded(10)=(BoneOffset=(X=-3,Y=0,Z=90),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainUnfolded(11)=(BoneOffset=(X=3,Y=0,Z=70),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainUnfolded(12)=(BoneOffset=(X=-3,Y=0,Z=50),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainUnfolded(13)=(BoneOffset=(X=3,Y=0,Z=30),LastLoc=(X=0,Y=0,Z=0))
    HitboxChainUnfolded(14)=(BoneOffset=(X=0,Y=0,Z=10),LastLoc=(X=0,Y=0,Z=0))
    MaxHitRangeFolded=220
    MaxHitRangeUnfolded=300
    FoldedDamage=70
    FoldedDamageAlt=120
    UnfoldedDamage=140
    UnfoldedDamageAlt=190
    FoldedDT=Class'KFDT_Slashing_ScytheShort'
    FoldedDTAlt=Class'KFDT_Slashing_ScytheShortAlt'
    UnfoldedDT=Class'KFDT_Slashing_ScytheLong'
    UnfoldedDTAlt=Class'KFDT_Slashing_ScytheLongAlt'
    UnfoldBlendingDuration=0.05
    FoldedAttackAnimRate=0.65
    PlayerViewOffsetUnfolded=(X=12,Y=0,Z=-7)
    bIsFolded=true
    BloodParticles=ParticleSystem'WEP_1P_KATANA_EMIT.FX_katana_blood_flick_01'
    FoldedTrailParticleSystem=ParticleSystem'WEP_Scythe_EMIT.FX_Scythe_Custom_R_01'
    UnfoldedTrailParticleSystem=ParticleSystem'WEP_Scythe_EMIT.FX_Scythe_Custom_Unfold_01'
    ParryStrength=5
    ParryDamageMitigationPercent=0.4
    DistortTrailParticle=none
    WhiteTrailParticle=none
    BlueTrailParticle=none
    RedTrailParticle=none
    BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
    ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
    PackageKey="Scythe"
    FirstPersonMeshName="WEP_1P_Scythe_MESH.Wep_1stP_Scythe_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    FirstPersonAnimTree="WEP_1P_Scythe_ANIM.1P_Scythe_Animtree"
    PickupMeshName="wep_3p_scythe_mesh.Wep_3rdP_Scythe_Pickup"
    AttachmentArchetypeName="WEP_Scythe_ARCH.Wep_Scythe_3P"
    InventorySize=7
    GroupPriority=50
    WeaponSelectTexture=Texture2D'WEP_UI_Scythe_TEX.UI_WeaponSelect_Scythe'
    BonesToLockOnEmpty=none
    PlayerViewOffset=(X=10,Y=0,Z=-10)
    begin object name=MeleeHelper class=KFMeleeHelperWeapon
        ChainSequence_F=/* Array type was not detected. */
        ChainSequence_B=/* Array type was not detected. */
        ChainSequence_L=/* Array type was not detected. */
        MeleeImpactCamShakeScale=0.04
        WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
    object end
    // Reference: KFMeleeHelperWeapon'Default__KFWeap_Edged_Scythe.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    InstantHitMomentum=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Edged_Scythe.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Blood Sickle"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Edged_Scythe.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Edged_Scythe.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}