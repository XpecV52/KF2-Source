/*******************************************************************************
 * KFWeap_AssaultRifle_MKB42 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_AssaultRifle_MKB42 extends KFWeap_RifleBase
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
    PackageKey="MKB42"
    FirstPersonMeshName="wep_1p_mkb42_mesh.Wep_1stP_MKB42_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_MKB42_MESH.Wep_3rdP_MKB42_Pickup"
    AttachmentArchetypeName="WEP_MKB42_ARCH.Wep_MKB42_3P"
    MuzzleFlashTemplateName="WEP_MKB42_ARCH.Wep_MKB42_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    FireModeIconPaths=/* Array type was not detected. */
    SingleFireSoundIndex=1
    InventorySize=7
    MagazineCapacity=30
    MeshFOV=75
    MeshIronSightFOV=33
    PlayerIronSightFOV=70
    IronSightPosition=(X=15,Y=0,Z=0)
    GroupPriority=75
    WeaponSelectTexture=Texture2D'WEP_UI_MKB42_TEX.UI_WeaponSelect_MKB42'
    SpareAmmoCapacity=270
    InitialSpareMags=3
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=20,Y=8,Z=-2.5)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_AssaultRifle_MKB42.MeleeHelper'
    maxRecoilPitch=150
    minRecoilPitch=100
    maxRecoilYaw=224
    minRecoilYaw=-224
    RecoilRate=0.11
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=75
    RecoilISMinYawLimit=65460
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    IronSightMeshFOVCompensationScale=1.5
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=32,Y=4,Z=-5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_AssaultRifle_MKB42.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="MKb.42(H) Carbine Rifle"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_MKB42.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_MKB42.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}