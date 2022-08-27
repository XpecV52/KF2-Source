/*******************************************************************************
 * KFWeap_SMG_HK_UMP generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_SMG_HK_UMP extends KFWeap_SMGBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

/** RecoilRate when firing in burst fire. */
var(Recoil) float BurstFireRecoilRate;
/** How much to scale recoil when firing in burst fire. */
var(Recoil) float BurstFireRecoilModifier;
/** Animation to play when the weapon is fired  in burst mode with 2 rounds left */
var(Animations) const editconst name BurstFire2RdAnim;
/** Animation to play when the weapon is fired in burst fire mode for 3 rounds */
var(Animations) const editconst name BurstFire3RdAnim;
/** Animation to play when the weapon is fired in burst mode with 2 rounds left */
var(Animations) const editconst name BurstFire2RdSightedAnim;
/** Animation to play when the weapon is fired in burst fire mode for 3 rounds */
var(Animations) const editconst name BurstFire3RdSightedAnim;
/** Sound to play when the weapon is fired in burst mode with 2 rounds left */
var(Sounds) WeaponFireSndInfo WeaponFire2RdSnd;
/** Sound to play when the weapon is fired in burst fire mode for 3 rounds */
var(Sounds) WeaponFireSndInfo WeaponFire3RdSnd;
var bool bBurstPlayedFireEffects;

simulated state WeaponBurstFiring
{
    simulated function BeginState(name PrevStateName)
    {
        RecoilRate = BurstFireRecoilRate;
        if((RecoilRate > float(0)) && RecoilBlendOutRatio > float(0))
        {
            RecoilYawBlendOutRate = int((float(maxRecoilYaw) / RecoilRate) * RecoilBlendOutRatio);
            RecoilPitchBlendOutRate = int((float(maxRecoilPitch) / RecoilRate) * RecoilBlendOutRatio);
        }
        bBurstPlayedFireEffects = false;
        super.BeginState(PrevStateName);
    }

    simulated function PlayFireEffects(byte FireModeNum, optional Vector HitLocation)
    {
        local name WeaponFireAnimName;

        if((FireModeNum != 1) || (FireModeNum == 1) && !bBurstPlayedFireEffects || self.WorldInfo.TimeDilation < 1)
        {
            PlayFiringSound(CurrentFireMode);
        }
        if(Instigator != none)
        {
            UpdateWeaponAttachmentAnimRate(GetThirdPersonAnimRate());
            if(Instigator.IsFirstPerson())
            {
                if(!bPlayingLoopingFireAnim && (FireModeNum != 1) || (FireModeNum == 1) && !bBurstPlayedFireEffects)
                {
                    WeaponFireAnimName = GetWeaponFireAnim(FireModeNum);
                    if(WeaponFireAnimName != 'None')
                    {
                        PlayAnimation(WeaponFireAnimName, MySkelMesh.GetAnimLength(WeaponFireAnimName),, FireTweenTime);
                    }
                }
                HandleRecoil();
                ShakeView();
                CauseMuzzleFlash(FireModeNum);
            }
        }
        bBurstPlayedFireEffects = true;
    }

    simulated function ModifyRecoil(out float CurrentRecoilModifier)
    {
        super(KFWeapon).ModifyRecoil(CurrentRecoilModifier);
        CurrentRecoilModifier *= BurstFireRecoilModifier;
    }

    simulated function name GetWeaponFireAnim(byte FireModeNum)
    {
        if(BurstAmount == 3)
        {
            if(bUsingSights)
            {
                return BurstFire3RdSightedAnim;
            }
            return BurstFire3RdAnim;            
        }
        else
        {
            if(BurstAmount == 2)
            {
                if(bUsingSights)
                {
                    return BurstFire2RdSightedAnim;
                }
                return BurstFire2RdAnim;                
            }
            else
            {
                return super(KFWeapon).GetWeaponFireAnim(FireModeNum);
            }
        }
    }

    simulated function PlayFiringSound(byte FireModeNum)
    {
        if((!bPlayingLoopingFireSnd && BurstAmount > 1) && !self.WorldInfo.TimeDilation < 1)
        {
            MakeNoise(1, 'PlayerFiring');
            if(BurstAmount == 3)
            {
                WeaponPlayFireSound(WeaponFire3RdSnd.DefaultCue, WeaponFire3RdSnd.FirstPersonCue);                
            }
            else
            {
                if(BurstAmount == 2)
                {
                    WeaponPlayFireSound(WeaponFire2RdSnd.DefaultCue, WeaponFire2RdSnd.FirstPersonCue);
                }
            }            
        }
        else
        {
            super(KFWeapon).PlayFiringSound(FireModeNum);
        }
    }

    simulated event EndState(name NextStateName)
    {
        RecoilRate = default.RecoilRate;
        if((RecoilRate > float(0)) && RecoilBlendOutRatio > float(0))
        {
            RecoilYawBlendOutRate = int((float(maxRecoilYaw) / RecoilRate) * RecoilBlendOutRatio);
            RecoilPitchBlendOutRate = int((float(maxRecoilPitch) / RecoilRate) * RecoilBlendOutRatio);
        }
        super.EndState(NextStateName);
    }
    stop;    
}

defaultproperties
{
    BurstFireRecoilRate=0.085
    BurstFireRecoilModifier=1
    BurstFire2RdAnim=Shoot_Burst2
    BurstFire3RdAnim=Shoot_Burst
    BurstFire2RdSightedAnim=Shoot_Burst2_Iron
    BurstFire3RdSightedAnim=Shoot_Burst_Iron
    WeaponFire2RdSnd=(DefaultCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_3P_2Round',FirstPersonCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_1P_2Round')
    WeaponFire3RdSnd=(DefaultCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_3P_3Round',FirstPersonCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_1P_3Round')
    FireModeIconPaths=/* Array type was not detected. */
    SingleFireSoundIndex=1
    BurstAmount=3
    InventorySize=5
    MagazineCapacity=30
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    MeshIronSightFOV=50
    GroupPriority=90
    WeaponSelectTexture=Texture2D'WEP_UI_HK_UMP_TEX.UI_WeaponSelect_UMP'
    SpareAmmoCapacity=290
    InitialSpareMags=2
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=3,Y=10,Z=-2)
    AttachmentArchetype=KFWeaponAttachment'WEP_HK_UMP_ARCH.Wep_HK_UMP_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_SMG_HK_UMP.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_HK_UMP_ARCH.Wep_HK_UMP_MuzzleFlash'
    maxRecoilPitch=120
    minRecoilPitch=92
    maxRecoilYaw=101
    minRecoilYaw=-101
    RecoilRate=0.085
    RecoilViewRotationScale=0.25
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=75
    RecoilISMinYawLimit=65460
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    HippedRecoilModifier=1.4
    IronSightMeshFOVCompensationScale=1.5
    AssociatedPerkClasses=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=4.5,Z=-5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_HK_UMP_MESH.Wep_1stP_HK_UMP_Rig'
        AnimSets(0)=AnimSet'WEP_1P_HK_UMP_ANIM.WEP_1stP_HK_UMP_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_SMG_HK_UMP.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Heckler & Koch UMP"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_HK_UMP_MESH.Wep_3rdP_HK_UMP_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_SMG_HK_UMP.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_HK_UMP_MESH.Wep_3rdP_HK_UMP_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_SMG_HK_UMP.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}