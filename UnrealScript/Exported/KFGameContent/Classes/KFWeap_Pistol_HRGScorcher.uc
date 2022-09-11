//=============================================================================
// KFWeap_Pistol_HRGScorcher
//=============================================================================
// A Horzine experimental flare gun (Scorcher)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
// Roberto Moreno (Saber Interactive)
//=============================================================================

class KFWeap_Pistol_HRGScorcher extends KFWeap_GrenadeLauncher_Base;

var protected const array<vector2D> PelletSpread;

/** Last time a submunition projectile was fired from this weapon */
var float LastSubmunitionFireTime;



/** We avoid alternating between firemodes and directly altfire */
simulated function AltFireMode()
{
	if ( !Instigator.IsLocallyControlled() )
	{
		return;
	}

	StartFire(ALTFIRE_FIREMODE);
}

static simulated event EFilterTypeUI GetAltTraderFilter()
{
	return FT_Pistol;
}

defaultproperties
{
   PackageKey="HRGScorcher_Pistol"
   FirstPersonMeshName="WEP_1P_HRGScorcher_Pistol_MESH.Wep_1stP_HRGScorcher_Pistol_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_HRGScorcher_Pistol_ANIM.Wep_1stP_HRGScorcher_Pistol_Anim"
   PickupMeshName="wep_3p_HRGScorcher_Pistol_mesh.WEP_HRGScorcher_Pickup"
   AttachmentArchetypeName="WEP_HRGScorcher_Pistol_ARCH.Wep_HRGScorcher_Pistol_3P"
   MuzzleFlashTemplateName="WEP_HRGScorcher_Pistol_ARCH.Wep_HRGScorcher_Pistol_MuzzleFlash"
   bHasIronSights=True
   bNoMagazine=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
   InventoryGroup=IG_Secondary
   InventorySize=4
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=73.000000
   FastZoomOutTime=0.200000
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'WEP_UI_HRGScorcher_Pistol_TEX.UI_WeaponSelect_HRGScorcher'
   MagazineCapacity(0)=1
   SpareAmmoCapacity(0)=28
   InitialSpareMags(0)=12
   AmmoPickupScale(0)=4.000000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_HRG_Scorcher.Play_WEP_HRG_Scorcher_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_HRG_Scorcher.Play_WEP_HRG_Scorcher_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_HRG_Scorcher.Play_WEP_HRG_Scorcher_AltFire_3P',FirstPersonCue=AkEvent'WW_WEP_HRG_Scorcher.Play_WEP_HRG_Scorcher_AltFire_1P')
   WeaponDryFireSnd(0)=None
   PlayerViewOffset=(X=13.000000,Y=13.000000,Z=-4.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_GrenadeLauncher_Base:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_GrenadeLauncher_Base:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_HRGScorcher:MeleeHelper_0'
   maxRecoilPitch=900
   minRecoilPitch=775
   maxRecoilYaw=500
   minRecoilYaw=-500
   RecoilRate=0.040000
   RecoilBlendOutRatio=0.350000
   RecoilViewRotationScale=0.800000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMinPitchLimit=64785
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   HippedRecoilModifier=1.250000
   FallingRecoilModifier=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Firebug'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.200000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.400000),(Add=2)))
   FiringStatesArray(1)="WeaponSingleFireAndReload"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_LightingFlare_HRGScorcher'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_BrokenFlare_HRGScorcher'
   FireInterval(0)=0.250000
   FireInterval(1)=0.250000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.050000
   Spread(1)=0.100000
   InstantHitDamage(0)=185.000000
   InstantHitDamage(1)=70.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HRGScorcherLightingImpact'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_HRGScorcherBrokenImpact'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HRGScorcher'
   FireOffset=(X=23.000000,Y=4.000000,Z=-3.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HRG Scorcher"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_HRGScorcher"
   ObjectArchetype=KFWeap_GrenadeLauncher_Base'KFGame.Default__KFWeap_GrenadeLauncher_Base'
}
