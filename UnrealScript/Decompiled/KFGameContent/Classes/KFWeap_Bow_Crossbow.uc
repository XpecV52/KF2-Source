/*******************************************************************************
 * KFWeap_Bow_Crossbow generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Bow_Crossbow extends KFWeap_ScopedBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
    if(SpareAmmoCount[GetAmmoType(FireModeNum)] == 0)
    {
        return true;
    }
    return false;
}

simulated function name GetReloadAnimName(bool bTacticalReload)
{
    if(AmmoCount[0] > 0)
    {
        WarnInternal("Grenade launcher reloading with non-empty mag");
    }
    return ((bTacticalReload) ? 'Reload_Empty_Elite' : 'Reload_Empty');
}

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetTraderFilter()
{
    return 3;
}

defaultproperties
{
    begin object name=SceneCapture2DComponent0 class=TWSceneCapture2DDPGComponent
        TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
        FieldOfView=18.5
    object end
    // Reference: TWSceneCapture2DDPGComponent'Default__KFWeap_Bow_Crossbow.SceneCapture2DComponent0'
    SceneCapture=SceneCapture2DComponent0
    ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_Crossbow_MAT.WEP_1P_Crossbow_Scope_MAT'
    ScopedSensitivityMod=12
    PackageKey="Crossbow"
    FirstPersonMeshName="WEP_1P_Crossbow_MESH.Wep_1stP_Crossbow_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_Crossbow_MESH.Wep_Crossbow_Pickup"
    AttachmentArchetypeName="WEP_Crossbow_ARCH.Wep_Crossbow_3P"
    MuzzleFlashTemplateName="WEP_Crossbow_ARCH.Wep_Crossbow_MuzzleFlash"
    bHasIronSights=true
    bWarnAIWhenAiming=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    InventorySize=6
    MagazineCapacity=1
    PenetrationPower=/* Array type was not detected. */
    MeshFOV=70
    MeshIronSightFOV=52
    PlayerIronSightFOV=70
    IronSightPosition=(X=-13,Y=0,Z=0)
    DOF_BlendInSpeed=3
    DOF_FG_FocalRadius=0
    DOF_FG_MaxNearBlurSize=3.5
    MaxAIWarningDistSQ=4000000
    AimWarningDelay=(X=0.4,Y=0.8)
    GroupPriority=50
    WeaponSelectTexture=Texture2D'WEP_UI_Crossbow_TEX.UI_WeaponSelect_Crossbow'
    SpareAmmoCapacity=34
    InitialSpareMags=13
    AmmoPickupScale=3
    FireSightedAnims=/* Array type was not detected. */
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=1,Y=8,Z=-5)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Bow_Crossbow.MeleeHelper'
    maxRecoilPitch=200
    minRecoilPitch=150
    maxRecoilYaw=100
    minRecoilYaw=-100
    RecoilRate=0.06
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=64785
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=25,Y=3,Z=-4)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Bow_Crossbow.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Crossbow"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Bow_Crossbow.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Bow_Crossbow.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
    begin object name=SceneCapture2DComponent0 class=TWSceneCapture2DDPGComponent
        TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
        FieldOfView=18.5
    object end
    // Reference: TWSceneCapture2DDPGComponent'Default__KFWeap_Bow_Crossbow.SceneCapture2DComponent0'
    Components(0)=SceneCapture2DComponent0
}