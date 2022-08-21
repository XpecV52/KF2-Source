/*******************************************************************************
 * KFWeap_AssaultRifle_AK12 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_AssaultRifle_AK12 extends KFWeap_RifleBase
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
        if((Instigator != none) && Instigator.IsFirstPerson())
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
    BurstFireRecoilRate=0.05
    BurstFireRecoilModifier=0.8
    BurstFire2RdAnim=Shoot_Burst2
    BurstFire3RdAnim=Shoot_Burst
    BurstFire2RdSightedAnim=Shoot_Burst2_Iron
    BurstFire3RdSightedAnim=Shoot_Burst_Iron
    WeaponFire2RdSnd=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_2RdBurst_M',FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_2RdBurst_S')
    WeaponFire3RdSnd=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Burst_M',FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Burst_S')
    FireModeIconPaths=/* Array type was not detected. */
    SingleFireMode=1
    BurstAmount=3
    InventorySize=6
    MagazineCapacity=30
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    MeshFOV=75
    MeshIronSightFOV=33
    PlayerIronSightFOV=70
    GroupPriority=75
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_AK12'
    MaxSpareAmmo=330
    InitialSpareMags=3
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=2,Y=8,Z=-3)
    AttachmentArchetype=KFWeaponAttachment'WEP_AK12_ARCH.Wep_AK12_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_AssaultRifle_AK12.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_AK12_ARCH.Wep_AK12_MuzzleFlash'
    maxRecoilPitch=200
    minRecoilPitch=150
    maxRecoilYaw=175
    minRecoilYaw=-125
    RecoilRate=0.085
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=75
    RecoilISMinYawLimit=65460
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    IronSightMeshFOVCompensationScale=2.5
    AssociatedPerkClass=Class'KFGame.KFPerk_Commando'
    FiringStatesArray=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=32,Y=4,Z=-5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_AK12_MESH.Wep_1stP_AK12_Rig'
        AnimSets(0)=AnimSet'WEP_1P_AK12_ANIM.Wep_1st_AK12_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_AssaultRifle_AK12.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Kalashnikov AK-12"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_AK12_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_AK12.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_AK12_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_AK12.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}