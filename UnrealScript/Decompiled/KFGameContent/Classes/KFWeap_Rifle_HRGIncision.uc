/*******************************************************************************
 * KFWeap_Rifle_HRGIncision generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Rifle_HRGIncision extends KFWeap_Rifle_RailGun
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

const ShootDartAnim = 'Shoot_Dart_HI';
const ShootDartIronAnim = 'Shoot_Dart_Iron_HI';

var Texture2D LockedTeammateHitZoneIcon;
var Texture2D DefaultTeammateHitZoneIcon;
var LinearColor GreenIconColor;

simulated function name GetWeaponFireAnim(byte FireModeNum)
{
    if(FireModeNum == 1)
    {
        return ((bUsingSights) ? 'Shoot_Dart_Iron_HI' : 'Shoot_Dart_HI');
    }
    return super(KFWeapon).GetWeaponFireAnim(FireModeNum);
}

simulated function AltFireMode()
{
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    StartFire(1);
}

simulated function StartFire(byte FireModeNum)
{
    super(KFWeapon).StartFire(FireModeNum);
}

simulated function Vector GetInstantFireAimLocation()
{
    return TargetingComp.LockedAimLocation[CurrentFireMode];
}

simulated function OnRender(Canvas C)
{
    local int I;

    super.OnRender(C);
    if(!bUsingSights)
    {
        return;
    }
    I = 0;
    J0x2F:

    if(I < TargetingComp.TargetVulnerableLocations_Player.Length)
    {
        if(!IsZero(TargetingComp.TargetVulnerableLocations_Player[I]))
        {
            DrawTargetingTeammateIcon(C, I);
        }
        ++ I;
        goto J0x2F;
    }
    CanvasTexture.bNeedsUpdate = true;
}

simulated function DrawTargetingTeammateIcon(Canvas Canvas, int Index)
{
    local Vector WorldPos;
    local float IconSize, IconScale;
    local Vector2D ScreenPos;

    WorldPos = TargetingComp.TargetVulnerableLocations_Player[Index];
    ScreenPos = WorldToCanvas(Canvas, WorldPos);
    IconScale = FMin(float(Canvas.SizeX) / 1024, 1);
    IconScale *= FClamp(1 - (VSize(WorldPos - Instigator.Location) / 4000), 0.2, 1);
    IconSize = 300 * IconScale;
    ScreenPos.X -= (IconSize / 2);
    ScreenPos.Y -= (IconSize / 2);
    if((((ScreenPos.X < float(0)) || ScreenPos.X > float(Canvas.SizeX)) || ScreenPos.Y < float(0)) || ScreenPos.Y > float(Canvas.SizeY))
    {
        return;
    }
    Canvas.SetPos(ScreenPos.X, ScreenPos.Y);
    if((TargetingComp.LockedHitZone[1] >= 0) && Index == TargetingComp.LockedHitZone[1])
    {
        Canvas.DrawTile(LockedTeammateHitZoneIcon, IconSize, IconSize, 0, 0, float(LockedTeammateHitZoneIcon.SizeX), float(LockedTeammateHitZoneIcon.SizeY), GreenIconColor);        
    }
    else
    {
        if((TargetingComp.PendingHitZone[1] >= 0) && Index == TargetingComp.PendingHitZone[1])
        {
            Canvas.DrawTile(LockedTeammateHitZoneIcon, IconSize, IconSize, 0, 0, float(LockedTeammateHitZoneIcon.SizeX), float(LockedTeammateHitZoneIcon.SizeY), YellowIconColor);            
        }
        else
        {
            Canvas.DrawTile(DefaultTeammateHitZoneIcon, IconSize, IconSize, 0, 0, float(DefaultTeammateHitZoneIcon.SizeX), float(DefaultTeammateHitZoneIcon.SizeY), BlueIconColor);
        }
    }
}

simulated function bool HasAnyAmmo()
{
    if((HasSpareAmmo()) || HasAmmo(0))
    {
        return true;
    }
    return false;
}

defaultproperties
{
    LockedTeammateHitZoneIcon=Texture2D'Wep_Scope_TEX.Wep_1stP_Yellow_Red_Target'
    DefaultTeammateHitZoneIcon=Texture2D'Wep_Scope_TEX.Wep_1stP_Blue_Target'
    GreenIconColor=(R=1,G=255,B=1,A=1)
    SceneCapture=TWSceneCapture2DDPGComponent'Default__KFWeap_Rifle_HRGIncision.SceneCapture2DComponent0'
    PackageKey="HRG_Incision"
    FirstPersonMeshName="WEP_1P_HRG_Incision_MESH.WEP_1stP_HRG_Incision"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="wep_3p_HRG_Incision_MESH.Wep_3rdP_HRG_Incision_Pickup"
    AttachmentArchetypeName="wep_hrg_incision_arch.Wep_HRG_Incision_3P_Updated"
    MuzzleFlashTemplateName="wep_hrg_incision_arch.Wep_HRG_Incision_MuzzleFlash"
    bCanRefillSecondaryAmmo=false
    bNoMagazine=true
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=8
    MagazineCapacity[1]=100
    WeaponSelectTexture=Texture2D'WEP_UI_HRG_Incision_Item_TEX.UI_WeaponSelect_HRG_Incision'
    SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
    AmmoCost=/* Array type was not detected. */
    SpareAmmoCapacity=39
    InitialSpareMags=12
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Rifle_HRGIncision.MeleeHelper'
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    MedicCompClass=Class'KFMedicWeaponComponent_HRGIncision'
    TargetingCompClass=Class'KFTargetingWeaponComponent_HRGIncision'
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitMomentum=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Rifle_HRGIncision.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="HRG Incision"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Rifle_HRGIncision.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Rifle_HRGIncision.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
    Components(0)=TWSceneCapture2DDPGComponent'Default__KFWeap_Rifle_HRGIncision.SceneCapture2DComponent0'
}