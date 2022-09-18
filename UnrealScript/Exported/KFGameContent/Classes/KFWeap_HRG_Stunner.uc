//=============================================================================
// KFWeap_HRG_Stunner
//=============================================================================
// HRG Stunner Weapon Class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFWeap_HRG_Stunner extends KFWeap_ShotgunBase;

const SecondaryFireAnim      = 'Shoot_Secondary';
const SecondaryFireIronAnim  = 'Shoot_Secondary_Iron';

/** How much recoil the altfire should do */
var protected const float AltFireRecoilScale;

simulated function ModifyRecoil( out float CurrentRecoilModifier )
{
	if( CurrentFireMode == ALTFIRE_FIREMODE )
	{
		CurrentRecoilModifier *= AltFireRecoilScale;
	}

	super.ModifyRecoil( CurrentRecoilModifier );
}

simulated function StartFire(byte FireModeNum)
{
	if (FireModeNum == DEFAULT_FIREMODE && bUseAltFireMode)
	{
		if (AmmoCount[FireModeNum] < AmmoCost[ALTFIRE_FIREMODE] && SpareAmmoCount[FireModeNum] > 0)
		{
			BeginFire(RELOAD_FIREMODE);
			return;
		}
	}

	super.StartFire(FireModeNum);
}

simulated function AltFireMode()
{
	StartFire(ALTFIRE_FIREMODE);
}

simulated function NotifyAltFireUsage()
{
	local KFPawn_Human KFPH;

	// Notify 3P to change material.
	KFPH = KFPawn_Human(Instigator);
	if (KFPH != none)
	{
		KFPH.SetUsingAltFireMode(bUseAltFireMode, true);
		KFPH.bNetDirty = true;
	}
}

simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	if (FireModeNum == ALTFIRE_FIREMODE)
	{
		return bUsingSights ? SecondaryFireIronAnim : SecondaryFireAnim;
	}
	return super.GetWeaponFireAnim(FireModeNum);
}

defaultproperties
{
   AltFireRecoilScale=3.000000
   PackageKey="HRG_Stunner"
   FirstPersonMeshName="Wep_1P_HRG_Stunner_MESH.Wep_1stP_HRG_Stunner_Rig"
   FirstPersonAnimSetNames(0)="Wep_1P_HRG_Stunner_ANIM.Wep_1stP_HRG_Stunner_Anim"
   PickupMeshName="WEP_3P_HRG_Stunner_MESH.Wep_HRG_Stunner_Pickup"
   AttachmentArchetypeName="WEP_HRG_Stunner_ARCH.Wep_AA12_3P"
   MuzzleFlashTemplateName="WEP_HRG_Stunner_ARCH.Wep_AA12_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=False
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   InventorySize=7
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=()
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=8.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=85.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'wep_ui_hrg_stunner_tex.UI_Weapon_Select_HRG_Stunner'
   MagazineCapacity(0)=25
   AmmoCost(1)=5
   SpareAmmoCapacity(0)=225
   InitialSpareMags(0)=1
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_HRG_Stunner.Play_WEP_HRG_Stunner_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_HRG_Stunner.Play_WEP_HRG_Stunner_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_HRG_Stunner.Play_WEP_HRG_Stunner_Alt_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_HRG_Stunner.Play_WEP_HRG_Stunner_Alt_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_HRG_Stunner.Play_WEP_HRG_Stunner_Dry_Fire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_HRG_Stunner.Play_WEP_HRG_Stunner_Dry_Fire'
   PlayerViewOffset=(X=15.000000,Y=8.500000,Z=0.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_HRG_Stunner:MeleeHelper_0'
   NumPellets(0)=1
   NumPellets(1)=1
   NumPellets(2)=()
   NumPellets(3)=()
   NumPellets(4)=()
   NumPellets(5)=()
   NumPellets(6)=()
   maxRecoilPitch=150
   minRecoilPitch=125
   maxRecoilYaw=75
   minRecoilYaw=-75
   RecoilRate=0.075000
   RecoilBlendOutRatio=0.250000
   RecoilViewRotationScale=0.700000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=64785
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   FallingRecoilModifier=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_SWAT'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Stat=EWUS_Damage1,Scale=1.150000),(Add=1)))
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_HRG_Stunner'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_HRG_Stunner_Alt'
   FireInterval(0)=0.150000
   FireInterval(1)=0.500000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.005000
   Spread(1)=0.025000
   InstantHitDamage(0)=60.000000
   InstantHitDamage(1)=20.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HRG_Stunner'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_HRG_Stunner_Alt'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HRG_Stunner'
   FireOffset=(X=30.000000,Y=5.000000,Z=-4.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ShotgunBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ShotgunBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HRG Stunner"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_HRG_Stunner"
   ObjectArchetype=KFWeap_ShotgunBase'KFGame.Default__KFWeap_ShotgunBase'
}
