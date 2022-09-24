/*******************************************************************************
 * KFWeap_HRG_EMP_ArcGenerator generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_HRG_EMP_ArcGenerator extends KFWeap_FlameBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

struct BeamAttachedToActor
{
    var export editinline ParticleSystemComponent oBeam;
    var KFPawn_Monster oAttachedZed;

    structdefaultproperties
    {
        oBeam=none
        oAttachedZed=none
    }
};

/** Shoot animation to play when shooting secondary fire */
var(Animations) const editconst name FireHeavyAnim;
/** Shoot animation to play when shooting secondary fire last shot */
var(Animations) const editconst name FireLastHeavyAnim;
/** Shoot animation to play when shooting secondary fire last shot when aiming */
var(Animations) const editconst name FireLastHeavySightedAnim;
/** Alt-fire explosion template */
var() GameExplosion ExplosionTemplate;
var array<DamagedActorInfo> vRecentlyZappedActors;
var array<DamagedActorInfo> vAuxDeletionArrayChainedActors;
var array<BeamAttachedToActor> vActiveBeamEffects;
var array<BeamAttachedToActor> vAuxDeletionArray;
var repnotify KFPawn_Monster oZedCurrentlyBeingSprayed;
var ParticleSystem BeamPSCTemplate;
var string EmitterPoolClassPath;
var EmitterPool vBeamEffects;
var int MaxNumberOfZedsZapped;
var int MaxDistanceToBeZapped;
var float ZapInterval;
var int ChainDamage;

replication
{
     if((Role == ROLE_Authority) && bNetDirty)
        ChainDamage, MaxDistanceToBeZapped, 
        MaxNumberOfZedsZapped, ZapInterval, 
        oZedCurrentlyBeingSprayed;
}

simulated function name GetWeaponFireAnim(byte FireModeNum)
{
    local bool bPlayFireLast;

    bPlayFireLast = ShouldPlayFireLast(FireModeNum);
    if(bUsingSights)
    {
        if(bPlayFireLast)
        {
            if(FireModeNum == 1)
            {
                return FireLastHeavySightedAnim;                
            }
            else
            {
                return FireLastSightedAnim;
            }            
        }
        else
        {
            return FireSightedAnims[FireModeNum];
        }        
    }
    else
    {
        if(bPlayFireLast)
        {
            if(FireModeNum == 1)
            {
                return FireLastHeavyAnim;                
            }
            else
            {
                return FireLastAnim;
            }            
        }
        else
        {
            if(FireModeNum == 1)
            {
                return FireHeavyAnim;                
            }
            else
            {
                return FireAnim;
            }
        }
    }
}

simulated function AltFireMode()
{
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    StartFire(1);
}

simulated function bool ShouldAutoReload(byte FireModeNum)
{
    local bool bRequestReload;

    bRequestReload = super(KFWeapon).ShouldAutoReload(FireModeNum);
    if((FireModeNum == 1) && AmmoCount[0] > 0)
    {
        bPendingAutoSwitchOnDryFire = false;
        return false;
    }
    return bRequestReload;
}

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetTraderFilter()
{
    return 5;
}

simulated function StartPilotSound()
{
    if(((Instigator != none) && Instigator.IsLocallyControlled()) && Instigator.IsFirstPerson())
    {
    }
}

simulated function StopPilotSound();

simulated function ReplicatedEvent(name VarName)
{
    if(VarName == 'oZedCurrentlyBeingSprayed')
    {
        if(((Role != ROLE_Authority) || WorldInfo.NetMode == NM_ListenServer) || WorldInfo.NetMode == NM_Standalone)
        {
            if(oZedCurrentlyBeingSprayed == none)
            {
                SprayEnded();
            }
        }
    }
}

simulated function ChangeMaterial();

protected simulated function TurnOnPilot()
{
    super.TurnOnPilot();
    if(FlamePool[0] != none)
    {
        KFSprayActor_ArcGenerator(FlamePool[0]).OwnerWeapon = self;
        MaxNumberOfZedsZapped = KFSprayActor_ArcGenerator(FlamePool[0]).MaxNumberOfZedsZapped;
        MaxDistanceToBeZapped = KFSprayActor_ArcGenerator(FlamePool[0]).MaxDistanceToBeZapped;
        ZapInterval = KFSprayActor_ArcGenerator(FlamePool[0]).ZapInterval;
        ChainDamage = KFSprayActor_ArcGenerator(FlamePool[0]).ChainDamage;
    }
    if(FlamePool[1] != none)
    {
        KFSprayActor_ArcGenerator(FlamePool[1]).OwnerWeapon = self;
    }
}

simulated function float FlameHeatCalc()
{
    LastBarrelHeat = 1;
    return 1;
}

simulated event PostBeginPlay()
{
    local class<EmitterPool> PoolClass;

    super(Actor).PostBeginPlay();
    PoolClass = class<EmitterPool>(DynamicLoadObject(EmitterPoolClassPath, Class'Class'));
    if(PoolClass != none)
    {
        vBeamEffects = Spawn(PoolClass, self,, vect(0, 0, 0), rot(0, 0, 0));
    }
}

simulated function OnBeamEffectFinished(ParticleSystemComponent PSC)
{
    PSC.DeactivateSystem();
    EndPSC(PSC);
}

simulated function int SpawnBeam(Actor _OriginActor, Actor _DestinationActor)
{
    local editinline ParticleSystemComponent BeamPSC;
    local BeamAttachedToActor BeamAttachedInfo;
    local int I;

    I = 0;
    J0x0B:

    if(I < vActiveBeamEffects.Length)
    {
        if(vActiveBeamEffects[I].oAttachedZed == _DestinationActor)
        {
            return -1;
        }
        ++ I;
        goto J0x0B;
    }
    BeamPSC = vBeamEffects.SpawnEmitterCustomLifetime(BeamPSCTemplate);
    if(BeamPSC != none)
    {
        BeamPSC.SetBeamSourcePoint(0, _OriginActor.Location, 0);
        BeamPSC.SetBeamTargetPoint(0, _DestinationActor.Location, 0);
        BeamPSC.SetKillOnDeactivate(0, true);
        BeamPSC.SetAbsolute(false, false, false);
        BeamPSC.bUpdateComponentInTick = true;
        BeamAttachedInfo.oBeam = BeamPSC;
        BeamAttachedInfo.oAttachedZed = KFPawn_Monster(_DestinationActor);
        if(((Role != ROLE_Authority) || WorldInfo.NetMode == NM_ListenServer) || WorldInfo.NetMode == NM_Standalone)
        {
            BeamPSC.SetActive(true);
            AttachComponent(BeamPSC);
        }
        BeamAttachedInfo.oBeam.SetActive(true);
        vActiveBeamEffects.AddItem(BeamAttachedInfo;
        return vActiveBeamEffects.Length - 1;        
    }
    return -1;
}

simulated function MarkBeamToDeactivate(BeamAttachedToActor _BeamData)
{
    vAuxDeletionArray.AddItem(_BeamData;
}

simulated function MarkZedToUnchain(DamagedActorInfo _DamageActorInfo)
{
    vAuxDeletionArrayChainedActors.AddItem(_DamageActorInfo;
}

simulated function BeamAttachedToActor GetBeamFromActor(Actor _Actor)
{
    local int I;

    I = 0;
    J0x0B:

    if(I < vActiveBeamEffects.Length)
    {
        if(vActiveBeamEffects[I].oAttachedZed == _Actor)
        {
            return vActiveBeamEffects[I];
        }
        ++ I;
        goto J0x0B;
    }
}

simulated function DeactivateBeam(Actor _ChainedActor)
{
    local int I;

    I = 0;
    J0x0B:

    if(I < vActiveBeamEffects.Length)
    {
        if(vActiveBeamEffects[I].oAttachedZed == _ChainedActor)
        {
            OnBeamEffectFinished(vActiveBeamEffects[I].oBeam);
            vActiveBeamEffects.RemoveItem(vActiveBeamEffects[I];
            goto J0xB8;
        }
        ++ I;
        goto J0x0B;
    }
    J0xB8:

}

simulated function EndPSC(ParticleSystemComponent _Value)
{
    _Value.KillParticlesForced();
    vBeamEffects.OnParticleSystemFinished(_Value);
    DetachComponent(_Value);
}

simulated function SetCurrentSprayedZed(KFPawn_Monster _Monster)
{
    if(((Role == ROLE_Authority) || WorldInfo.NetMode == NM_ListenServer) || WorldInfo.NetMode == NM_Standalone)
    {
        oZedCurrentlyBeingSprayed = _Monster;
        bNetDirty = true;
    }
}

function bool ChainZed(Actor _ZedToChain)
{
    local DamagedActorInfo NewActorInfo;
    local int I;

    I = vRecentlyZappedActors.Length - 1;
    J0x17:

    if(I >= 0)
    {
        if(vRecentlyZappedActors[I].HitActor == _ZedToChain)
        {
            return false;
        }
        -- I;
        goto J0x17;
    }
    NewActorInfo.HitActor = _ZedToChain;
    NewActorInfo.HitTime = WorldInfo.TimeSeconds;
    vRecentlyZappedActors.AddItem(NewActorInfo;
    return true;
}

function UnchainZed(DamagedActorInfo _ZedToUnchain)
{
    vRecentlyZappedActors.RemoveItem(_ZedToUnchain;
}

function bool CheckRecentlyZapped(Actor _ActorToCheck)
{
    local int I;
    local bool bZapedRecently;

    bZapedRecently = false;
    I = vRecentlyZappedActors.Length - 1;
    J0x23:

    if(I >= 0)
    {
        if(vRecentlyZappedActors[I].HitActor == _ActorToCheck)
        {
            if((WorldInfo.TimeSeconds - vRecentlyZappedActors[I].HitTime) < ZapInterval)
            {
                bZapedRecently = true;
            }
            goto J0xD7;
        }
        -- I;
        goto J0x23;
    }
    J0xD7:

    return bZapedRecently;
}

function UpdateLastHitTimeForActor(Actor _ActorToCheck)
{
    local int I;

    I = vRecentlyZappedActors.Length - 1;
    J0x17:

    if(I >= 0)
    {
        if(vRecentlyZappedActors[I].HitActor == _ActorToCheck)
        {
            vRecentlyZappedActors[I].HitTime = WorldInfo.TimeSeconds;
            goto J0xB0;
        }
        -- I;
        goto J0x17;
    }
    J0xB0:

}

simulated function ChainNearZeds(Actor _TouchActor)
{
    local KFPawn_Monster oMonsterPawn;

    foreach WorldInfo.AllPawns(Class'KFPawn_Monster', oMonsterPawn)
    {
        if(oMonsterPawn.IsAliveAndWell() && oMonsterPawn != _TouchActor)
        {
            if(VSizeSq(oMonsterPawn.Location - _TouchActor.Location) < Square(float(MaxDistanceToBeZapped)))
            {
                if(vActiveBeamEffects.Length < MaxNumberOfZedsZapped)
                {
                    if(FastTrace(_TouchActor.Location, oMonsterPawn.Location, vect(0, 0, 0)) == false)
                    {
                        continue;                        
                    }
                    if(_TouchActor.IsA('KFPawn_Monster'))
                    {
                        if(((Role == ROLE_Authority) || WorldInfo.NetMode == NM_ListenServer) || WorldInfo.NetMode == NM_Standalone)
                        {
                            ChainZed(oMonsterPawn);
                        }
                        SpawnBeam(_TouchActor, oMonsterPawn);
                    }
                    continue;
                }
                break;
            }
        }        
    }    
}

simulated event Tick(float DeltaTime)
{
    local int I;
    local Vector BeamStartPoint, BeamEndPoint;

    super.Tick(DeltaTime);
    if(oZedCurrentlyBeingSprayed != none)
    {
        if((vActiveBeamEffects.Length < MaxNumberOfZedsZapped) && !CheckRecentlyZapped(oZedCurrentlyBeingSprayed))
        {
            ChainNearZeds(oZedCurrentlyBeingSprayed);
        }
        I = vActiveBeamEffects.Length - 1;
        J0x7E:

        if(I >= 0)
        {
            if(FastTrace(vActiveBeamEffects[I].oAttachedZed.Location, oZedCurrentlyBeingSprayed.Location, vect(0, 0, 0)) == false)
            {
                MarkBeamToDeactivate(GetBeamFromActor(vRecentlyZappedActors[I].HitActor));                
            }
            else
            {
                if(VSizeSq(vActiveBeamEffects[I].oAttachedZed.Location - oZedCurrentlyBeingSprayed.Location) < Square(float(MaxDistanceToBeZapped)))
                {
                    if(!CheckRecentlyZapped(vActiveBeamEffects[I].oAttachedZed))
                    {
                        if(vActiveBeamEffects[I].oAttachedZed.IsAliveAndWell())
                        {
                            if(((Role == ROLE_Authority) || WorldInfo.NetMode == NM_ListenServer) || WorldInfo.NetMode == NM_Standalone)
                            {
                                ChainedZapDamageFunction(vActiveBeamEffects[I].oAttachedZed, oZedCurrentlyBeingSprayed);
                                UpdateLastHitTimeForActor(vActiveBeamEffects[I].oAttachedZed);
                            }
                            if(((Role != ROLE_Authority) || WorldInfo.NetMode == NM_ListenServer) || WorldInfo.NetMode == NM_Standalone)
                            {
                                BeamStartPoint = oZedCurrentlyBeingSprayed.Mesh.GetBoneLocation('Spine1');
                                BeamEndPoint = vActiveBeamEffects[I].oAttachedZed.Mesh.GetBoneLocation('Spine1');
                                if(BeamStartPoint == vect(0, 0, 0))
                                {
                                    BeamStartPoint = oZedCurrentlyBeingSprayed.Location;
                                }
                                if(BeamEndPoint == vect(0, 0, 0))
                                {
                                    BeamEndPoint = vActiveBeamEffects[I].oAttachedZed.Location;
                                }
                                vActiveBeamEffects[I].oBeam.SetBeamSourcePoint(0, BeamStartPoint, 0);
                                vActiveBeamEffects[I].oBeam.SetBeamTargetPoint(0, BeamEndPoint, 0);
                            }
                            if(!vActiveBeamEffects[I].oAttachedZed.IsAliveAndWell())
                            {
                                MarkBeamToDeactivate(GetBeamFromActor(vActiveBeamEffects[I].oAttachedZed));
                            }
                        }
                    }                    
                }
                else
                {
                    if(((Role != ROLE_Authority) || WorldInfo.NetMode == NM_ListenServer) || WorldInfo.NetMode == NM_Standalone)
                    {
                        MarkBeamToDeactivate(GetBeamFromActor(vActiveBeamEffects[I].oAttachedZed));
                    }
                }
            }
            -- I;
            goto J0x7E;
        }
    }
    if((oZedCurrentlyBeingSprayed == none) && ((Role != ROLE_Authority) || WorldInfo.NetMode == NM_ListenServer) || WorldInfo.NetMode == NM_Standalone)
    {
        I = 0;
        J0x6EE:

        if(I < vActiveBeamEffects.Length)
        {
            OnBeamEffectFinished(vActiveBeamEffects[I].oBeam);
            ++ I;
            goto J0x6EE;
        }
        vActiveBeamEffects.Remove(0, vActiveBeamEffects.Length;        
    }
    else
    {
        if((oZedCurrentlyBeingSprayed != none) && ((Role != ROLE_Authority) || WorldInfo.NetMode == NM_ListenServer) || WorldInfo.NetMode == NM_Standalone)
        {
            LogInternal(string(vActiveBeamEffects.Length));
            I = 0;
            J0x7F2:

            if(I < vActiveBeamEffects.Length)
            {
                if(!vActiveBeamEffects[I].oAttachedZed.IsAliveAndWell())
                {
                    MarkBeamToDeactivate(GetBeamFromActor(vActiveBeamEffects[I].oAttachedZed));
                }
                ++ I;
                goto J0x7F2;
            }
            I = 0;
            J0x89E:

            if(I < vAuxDeletionArray.Length)
            {
                OnBeamEffectFinished(vAuxDeletionArray[I].oBeam);
                vAuxDeletionArray.RemoveItem(vAuxDeletionArray[I];
                ++ I;
                goto J0x89E;
            }
        }
    }
    if(((Role == ROLE_Authority) || WorldInfo.NetMode == NM_ListenServer) || WorldInfo.NetMode == NM_Standalone)
    {
        I = vRecentlyZappedActors.Length - 1;
        J0x995:

        if(I >= 0)
        {
            if(vRecentlyZappedActors[I].HitActor == none)
            {
                DeactivateBeam(vRecentlyZappedActors[I].HitActor);
                MarkZedToUnchain(vRecentlyZappedActors[I]);
            }
            if(!KFPawn_Monster(vRecentlyZappedActors[I].HitActor).IsAliveAndWell())
            {
                DeactivateBeam(vRecentlyZappedActors[I].HitActor);
                MarkZedToUnchain(vRecentlyZappedActors[I]);
            }
            if((WorldInfo.TimeSeconds - vRecentlyZappedActors[I].HitTime) > 1)
            {
                DeactivateBeam(vRecentlyZappedActors[I].HitActor);
                MarkZedToUnchain(vRecentlyZappedActors[I]);
            }
            -- I;
            goto J0x995;
        }
        I = 0;
        J0xB6A:

        if(I < vAuxDeletionArrayChainedActors.Length)
        {
            UnchainZed(vAuxDeletionArrayChainedActors[I]);
            ++ I;
            goto J0xB6A;
        }
        vAuxDeletionArrayChainedActors.Remove(0, vAuxDeletionArrayChainedActors.Length;
    }
}

event ProcessDirectImpact()
{
    if(KFPlayer != none)
    {
        KFPlayer.AddShotsHit(1);
    }
}

function ChainedZapDamageFunction(Actor _TouchActor, Actor _OriginActor)
{
    local Vector Momentum;
    local TraceHitInfo HitInfo;
    local Pawn TouchPawn;
    local int TotalDamage;

    if(_OriginActor != none)
    {
        Momentum = _TouchActor.Location - _OriginActor.Location;
    }
    if(ChainDamage > 0)
    {
        TouchPawn = Pawn(_TouchActor);
        if(TouchPawn != none)
        {
            ProcessDirectImpact();
        }
        TotalDamage = int(float(ChainDamage) * (GetUpgradeDamageMod()));
        _TouchActor.TakeDamage(TotalDamage, KFPlayer, _TouchActor.Location, Momentum, Class'KFDT_EMP_ArcGenerator_DefaultFiremodeZapDamage', HitInfo, self);
    }
}

simulated function SprayEnded()
{
    local int I;

    I = 0;
    J0x0B:

    if(I < vActiveBeamEffects.Length)
    {
        OnBeamEffectFinished(vActiveBeamEffects[I].oBeam);
        ++ I;
        goto J0x0B;
    }
    vActiveBeamEffects.Remove(0, vActiveBeamEffects.Length;
}

defaultproperties
{
    FireHeavyAnim=Shoot_Heavy
    FireLastHeavyAnim=Shoot_Heavy_Last
    FireLastHeavySightedAnim=Shoot_Heavy_Iron_Last
    BeamPSCTemplate=ParticleSystem'WEP_HRG_ArcGenerator_EMIT.FX_Beam_Test'
    EmitterPoolClassPath="Engine.EmitterPool"
    MaxNumberOfZedsZapped=3
    MaxDistanceToBeZapped=2500
    ZapInterval=0.07
    ChainDamage=5
    bWarnAIWhenFiring=true
    FlameSprayArchetype=KFSprayActor_ArcGenerator'WEP_HRG_ArcGenerator_ARCH.WEP_HRG_ArcGenerator_Spray'
    PilotLightPlayEvent=AkEvent'WW_WEP_HRG_ArcGenerator.Play_HRG_ArcGenerator_PilotLight_Loop'
    PilotLightStopEvent=AkEvent'WW_WEP_HRG_ArcGenerator.Stop_HRG_ArcGenerator_PilotLight_Loop'
    begin object name=PilotLight0 class=KFParticleSystemComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFParticleSystemComponent'Default__KFWeap_HRG_EMP_ArcGenerator.PilotLight0'
    PSC_PilotLight=PilotLight0
    begin object name=FlameEndSpray0 class=KFParticleSystemComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFParticleSystemComponent'Default__KFWeap_HRG_EMP_ArcGenerator.FlameEndSpray0'
    PSC_EndSpray=FlameEndSpray0
    MinAmmoConsumed=2
    PackageKey="HRG_ArcGenerator"
    FirstPersonMeshName="WEP_1P_HRG_ArcGenerator_MESH.Wep_1stP_HRG_ArcGenerator_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_HRG_ArcGenerator_MESH.Wep_HRG_ArcGenerator_Pickup"
    AttachmentArchetypeName="WEP_HRG_ArcGenerator_ARCH.HRG_ArcGenerator_3P"
    MuzzleFlashTemplateName="WEP_HRG_ArcGenerator_ARCH.Wep_HRG_ArcGenerator_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=9
    PenetrationPower=/* Array type was not detected. */
    MeshIronSightFOV=52
    PlayerIronSightFOV=80
    IronSightPosition=(X=3,Y=-0.032,Z=-0.03)
    DOF_FG_FocalRadius=150
    DOF_FG_MaxNearBlurSize=1
    MaxAIWarningDistSQ=2250000
    GroupPriority=100
    WeaponSelectTexture=Texture2D'WEP_UI_HRG_ArcGenerator_TEX.UI_WeaponSelect_HRG_ArcGenerator'
    MagazineCapacity=90
    AmmoCost=/* Array type was not detected. */
    SpareAmmoCapacity=450
    AmmoPickupScale=0.5
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    FireSightedAnims=/* Array type was not detected. */
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=5,Y=9,Z=-3)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_HRG_EMP_ArcGenerator.MeleeHelper'
    maxRecoilPitch=150
    minRecoilPitch=115
    maxRecoilYaw=115
    minRecoilYaw=-115
    RecoilRate=0.085
    RecoilViewRotationScale=0.25
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65034
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=75
    RecoilISMinYawLimit=65460
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    HippedRecoilModifier=1.5
    IronSightMeshFOVCompensationScale=1.5
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=4.5,Z=-5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_HRG_EMP_ArcGenerator.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="HRG Arc Generator"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_HRG_EMP_ArcGenerator.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_HRG_EMP_ArcGenerator.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
    bOnlyRelevantToOwner=false
    bAlwaysRelevant=true
}