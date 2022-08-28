/*******************************************************************************
 * KFWeap_Rifle_Hemogoblin generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Rifle_Hemogoblin extends KFWeap_MedicBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetTraderFilter()
{
    if((default.FiringStatesArray[0] == 'WeaponFiring') || default.FiringStatesArray[0] == 'WeaponBurstFiring')
    {
        return 7;        
    }
    else
    {
        return 2;
    }
}

simulated function ProcessInstantHitEx(byte FiringMode, ImpactInfo Impact, optional int NumHits, optional out float out_PenetrationVal, optional int ImpactNum)
{
    local KFPerk InstigatorPerk;

    InstigatorPerk = GetPerk();
    if(InstigatorPerk != none)
    {
        InstigatorPerk.UpdatePerkHeadShots(Impact, InstantHitDamageTypes[FiringMode], ImpactNum);
    }
    super.ProcessInstantHitEx(FiringMode, Impact, NumHits, out_PenetrationVal, ImpactNum);
}

defaultproperties
{
    PackageKey="Bleeder"
    FirstPersonMeshName="WEP_1P_Bleeder_MESH.WEP_1stP_Bleeder_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="wep_3p_bleeder_mesh.Wep_3rdP_Bleeder_Pickup"
    AttachmentArchetypeName="WEP_Bleeder_ARCH.Wep_Bleeder_3P"
    MuzzleFlashTemplateName="WEP_Bleeder_ARCH.Wep_Bleeder_MuzzleFlash"
    bHasIronSights=true
    bWarnAIWhenAiming=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    InventorySize=8
    MagazineCapacity=7
    MeshFOV=70
    MeshIronSightFOV=27
    PlayerIronSightFOV=70
    IronSightPosition=(X=30,Y=0,Z=0)
    DOF_BlendInSpeed=3
    DOF_FG_FocalRadius=0
    DOF_FG_MaxNearBlurSize=3.5
    AimWarningDelay=(X=0.4,Y=0.8)
    GroupPriority=75
    WeaponSelectTexture=Texture2D'WEP_UI_Bleeder_TEX.UI_WeaponSelect_Bleeder'
    SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
    AmmoCost=/* Array type was not detected. */
    SpareAmmoCapacity=77
    InitialSpareMags=3
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'
    FireSightedAnims=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=20,Y=11,Z=-2)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Rifle_Hemogoblin.MeleeHelper'
    LaserSightTemplate=KFLaserSightAttachment'FX_LaserSight_ARCH.LaserSight_WithAttachment_1P'
    maxRecoilPitch=225
    minRecoilPitch=200
    maxRecoilYaw=200
    minRecoilYaw=-200
    RecoilRate=0.08
    RecoilViewRotationScale=0.6
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=150
    RecoilISMinYawLimit=65385
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=3,Z=-2.5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Rifle_Hemogoblin.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Hemogoblin"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Rifle_Hemogoblin.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Rifle_Hemogoblin.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}