//=============================================================================
// KFWeap_Rifle_HRGIncision
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Rifle_HRGIncision extends KFWeap_Rifle_RailGun;

const ShootDartAnim	= 'Shoot_Dart_HI';
const ShootDartIronAnim = 'Shoot_Dart_Iron_HI';

/** Icon textures for lock on drawing */
var Texture2D LockedTeammateHitZoneIcon;
var Texture2D DefaultTeammateHitZoneIcon;
var LinearColor GreenIconColor;

/** Override for 1st person healing dart anims */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	if (FireModeNum == ALTFIRE_FIREMODE)
	{
		return (bUsingSights) ? ShootDartIronAnim : ShootDartAnim;
	}

	return Super.GetWeaponFireAnim(FireModeNum);
}

/** Instead of switch fire mode use as immediate alt fire */
simulated function AltFireMode()
{
	if (!Instigator.IsLocallyControlled())
	{
		return;
	}

	// StartFire - StopFire called from KFPlayerInput
	StartFire(ALTFIRE_FIREMODE);
}

simulated function StartFire(byte FireModeNum)
{
	// Skip KFWeap_Rifle_RailGun::StartFire because of some irrelevant cheat detection there
	super(KFWeap_ScopedBase).StartFire(FireModeNum);
}

simulated function vector GetInstantFireAimLocation()
{
	return TargetingComp.LockedAimLocation[CurrentFireMode];
}

/*********************************************************************************************
 * @name Targeting HUD
 **********************************************************************************************/

/** Handle drawing items on the scope ScriptedTexture */
simulated function OnRender(Canvas C)
{
    local int i;

	super.OnRender(C);

    if (!bUsingSights)
    {
       return;
    }

	// Draw the targeting locations on the scope
	for (i = 0; i < TargetingComp.TargetVulnerableLocations_Player.Length; i++)
    {
        if (!IsZero(TargetingComp.TargetVulnerableLocations_Player[i]))
        {
            DrawTargetingTeammateIcon( C, i );
        }
    }

    CanvasTexture.bNeedsUpdate = true;
}

/**
 * @brief Draws an icon when human players are hidden but in the field of view
 *
 * @param PRI Player's PlayerReplicationInfo
 * @param IconWorldLocation The "player's" location in the world
 */
simulated function DrawTargetingTeammateIcon( Canvas Canvas, int index )
{
    local vector WorldPos;
    local float IconSize, IconScale;
    local vector2d ScreenPos;

    // Project world pos to canvas
	WorldPos = TargetingComp.TargetVulnerableLocations_Player[index];
    ScreenPos = WorldToCanvas(Canvas, WorldPos);

    // calculate scale based on resolution and distance
    IconScale = FMin(float(Canvas.SizeX) / 1024.f, 1.f);
	// Scale down up to 40 meters away, with a clamp at 20% size
    IconScale *= FClamp(1.f - VSize(WorldPos - Instigator.Location) / 4000.f, 0.2f, 1.f);

    // Apply size scale
    IconSize = 300.f * IconScale;
    ScreenPos.X -= IconSize / 2.f;
    ScreenPos.Y -= IconSize / 2.f;

    // Off-screen check
    if (ScreenPos.X < 0 || ScreenPos.X > Canvas.SizeX || ScreenPos.Y < 0 || ScreenPos.Y > Canvas.SizeY)
    {
        return;
    }

    Canvas.SetPos( ScreenPos.X, ScreenPos.Y );

	// Pick the color of the targeting box to draw
	if (TargetingComp.LockedHitZone[1] >= 0 && index == TargetingComp.LockedHitZone[1])
    {
        Canvas.DrawTile(LockedTeammateHitZoneIcon, IconSize, IconSize, 0, 0,
			LockedTeammateHitZoneIcon.SizeX, LockedTeammateHitZoneIcon.SizeY, GreenIconColor);
    }
    else if (TargetingComp.PendingHitZone[1] >= 0 && index == TargetingComp.PendingHitZone[1])
    {
        Canvas.DrawTile(LockedTeammateHitZoneIcon, IconSize, IconSize, 0, 0,
			LockedTeammateHitZoneIcon.SizeX, LockedTeammateHitZoneIcon.SizeY, YellowIconColor);
    }
    else
    {
        Canvas.DrawTile(DefaultTeammateHitZoneIcon, IconSize, IconSize, 0, 0,
			DefaultTeammateHitZoneIcon.SizeX, DefaultTeammateHitZoneIcon.SizeY, BlueIconColor);
    }
}

/*********************************************************************************************
 @name Reload / recharge
********************************************************************************************* */

/** Healing charge doesn't count as ammo for purposes of inventory management (e.g. switching) */
simulated function bool HasAnyAmmo()
{
	if (HasSpareAmmo() || HasAmmo(DEFAULT_FIREMODE))
	{
		return true;
	}

	return false;
}

defaultproperties
{
   LockedTeammateHitZoneIcon=Texture2D'Wep_Scope_TEX.Wep_1stP_Yellow_Red_Target'
   DefaultTeammateHitZoneIcon=Texture2D'Wep_Scope_TEX.Wep_1stP_Blue_Target'
   GreenIconColor=(R=1.000000,G=255.000000,B=1.000000,A=1.000000)
   Begin Object Class=TWSceneCapture2DDPGComponent Name=SceneCapture2DComponent0 Archetype=TWSceneCapture2DDPGComponent'kfgamecontent.Default__KFWeap_Rifle_RailGun:SceneCapture2DComponent0'
      bRenderForegroundDPG=False
      FieldOfView=23.000000
      NearPlane=10.000000
      FarPlane=0.000000
      bUpdateMatrices=False
      bEnabled=False
      bEnableFog=True
      ViewMode=SceneCapView_Lit
      FrameRate=60.000000
      Name="SceneCapture2DComponent0"
      ObjectArchetype=TWSceneCapture2DDPGComponent'kfgamecontent.Default__KFWeap_Rifle_RailGun:SceneCapture2DComponent0'
   End Object
   SceneCapture=SceneCapture2DComponent0
   PackageKey="HRG_Incision"
   FirstPersonMeshName="WEP_1P_HRG_Incision_MESH.WEP_1stP_HRG_Incision"
   FirstPersonAnimSetNames(0)="wep_1p_hrg_incision_anim.wep_1p_hrg_incision_anim"
   PickupMeshName="wep_3p_HRG_Incision_MESH.Wep_3rdP_HRG_Incision_Pickup"
   AttachmentArchetypeName="wep_hrg_incision_arch.Wep_HRG_Incision_3P_Updated"
   MuzzleFlashTemplateName="wep_hrg_incision_arch.Wep_HRG_Incision_MuzzleFlash"
   bCanRefillSecondaryAmmo=False
   bNoMagazine=True
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_MedicDart'
   InventorySize=8
   WeaponSelectTexture=Texture2D'WEP_UI_HRG_Incision_Item_TEX.UI_WeaponSelect_HRG_Incision'
   SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
   MagazineCapacity(1)=100
   AmmoCost(1)=50
   SpareAmmoCapacity(0)=39
   InitialSpareMags(0)=12
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Rifle_RailGun:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Rifle_RailGun:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Rifle_HRGIncision:MeleeHelper_0'
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_FieldMedic'
   WeaponUpgrades(1)=(Stats=((Scale=1.200000),(Scale=1.200000),,(Stat=EWUS_HealFullRecharge,Scale=0.900000)))
   MedicCompClass=Class'kfgamecontent.KFMedicWeaponComponent_HRGIncision'
   TargetingCompClass=Class'kfgamecontent.KFTargetingWeaponComponent_HRGIncision'
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_HRGIncisionHurt'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_HRGIncisionHeal'
   FireInterval(1)=0.175000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   InstantHitDamage(0)=400.000000
   InstantHitDamage(1)=75.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitMomentum(1)=50000.000000
   InstantHitMomentum(2)=()
   InstantHitMomentum(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HRGIncisionHurt'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_HRGIncisionHeal'
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HRGIncision'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Rifle_RailGun:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Rifle_RailGun:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HRG Incision"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Rifle_RailGun:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Rifle_RailGun:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Components(0)=SceneCapture2DComponent0
   Name="Default__KFWeap_Rifle_HRGIncision"
   ObjectArchetype=KFWeap_Rifle_RailGun'kfgamecontent.Default__KFWeap_Rifle_RailGun'
}
