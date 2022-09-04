//=============================================================================
// KFWeap_HRG_Nailgun
//=============================================================================
// A makeshift SMG that shoots nails
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFWeap_HRG_Nailgun extends KFWeap_Shotgun_Nailgun;

var(Animations) const editconst	name		AltFireLoopAnim;
var(Animations) const editconst	name		AltFireLoopSightedAnim;
var(Animations) const editconst	name		AltFireLoopStartAnim;
var(Animations) const editconst	name		AltFireLoopStartSightedAnim;
var(Animations) const editconst	name		AltFireLoopEndAnim;
var(Animations) const editconst	name		AltFireLoopEndSightedAnim;


/** Get name of the animation to play for PlayFireEffects */
simulated function name GetLoopingFireAnim(byte FireModeNum)
{
	if (FireModeNum == ALTFIRE_FIREMODE)
	{
		if (bUsingSights)
		{
			return AltFireLoopSightedAnim;
		}

		return AltFireLoopAnim;
	}

	return super.GetLoopingFireAnim(FireModeNum);
}

/** Get name of the animation to play for PlayFireEffects */
simulated function name GetLoopStartFireAnim(byte FireModeNum)
{
	if (FireModeNum == ALTFIRE_FIREMODE)
	{
		if (bUsingSights)
		{
			return AltFireLoopStartSightedAnim;
		}

		return AltFireLoopStartAnim;
	}


	return super.GetLoopStartFireAnim(FireModeNum);
}


/** Get name of the animation to play for PlayFireEffects */
simulated function name GetLoopEndFireAnim(byte FireModeNum)
{
	if (FireModeNum == ALTFIRE_FIREMODE)
	{
		if (bUsingSights)
		{
			return AltFireLoopEndSightedAnim;
		}
		else
		{
			return AltFireLoopEndAnim;
		}
	}

	return super.GetLoopEndFireAnim(FireModeNum);
}

simulated function ConsumeAmmo(byte FireModeNum)
{
	local KFPerk InstigatorPerk;








	InstigatorPerk = GetPerk();
	if (InstigatorPerk != none && InstigatorPerk.GetIsUberAmmoActive(self))
	{
		return;
	}

	super.ConsumeAmmo(FireModeNum);
}

/*********************************************************************************************
 * State WeaponAltFiringAuto
 *
 *********************************************************************************************/

simulated state WeaponAltFiringAuto extends WeaponFiring
{
    /** Overrideen to include the DoubleFireRecoilModifier*/
    simulated function ModifyRecoil(out float CurrentRecoilModifier)
	{
		super.ModifyRecoil(CurrentRecoilModifier);
	    CurrentRecoilModifier *= AltFireRecoilModifier;
	}

	/** Initialize the weapon as being active and ready to go. */
	simulated function BeginState(Name PreviousStateName)
	{
        super.BeginState(PreviousStateName);

		// Initialize recoil blend out settings
		if (RecoilRate > 0 && RecoilBlendOutRatio > 0)
		{
			RecoilYawBlendOutRate = ((maxRecoilYaw*AltFireRecoilModifier)/RecoilRate) * RecoilBlendOutRatio;
			RecoilPitchBlendOutRate = ((maxRecoilPitch*AltFireRecoilModifier)/RecoilRate) * RecoilBlendOutRatio;
		}
    }
}

defaultproperties
{
   AltFireLoopAnim="HRG_Alt_ShootLoop"
   AltFireLoopSightedAnim="HRG_Alt_ShootLoop_Iron"
   AltFireLoopStartAnim="HRG_Alt_ShootLoop_Start"
   AltFireLoopStartSightedAnim="HRG_Alt_ShootLoop_Iron_Start"
   AltFireLoopEndAnim="HRG_Alt_ShootLoop_End"
   AltFireLoopEndSightedAnim="HRG_Alt_ShootLoop_Iron_End"
   AltFireRecoilModifier=3.500000
   PackageKey="HRG_Nailgun_PDW"
   FirstPersonMeshName="WEP_1P_HRG_Nailgun_PDW_MESH.Wep_1stP_HRG_Nailgun_PDW_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_HRG_Nailgun_PDW_ANIM.Wep_1stP_HRG_Nailgun_PDW_Anim"
   PickupMeshName="WEP_3P_HRG_Nailgun_PDW_MESH.Wep_HRG_Nailgun_PDW_Pickup"
   AttachmentArchetypeName="WEP_HRG_Nailgun_PDW_ARCH.Wep_HRG_Nailgun_PDW_3P"
   MuzzleFlashTemplateName="WEP_HRG_Nailgun_PDW_ARCH.Wep_HRG_Nailgun_PDW_MuzzleFlash"
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Nail'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_NailsBurst'
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'WEP_UI_HRG_Nailgun_PDW_TEX.UI_WeaponSelect_HRG_Nailgun_PDW'
   InitialSpareMags(0)=2
   bLoopingFireAnim(0)=True
   bLoopingFireAnim(1)=True
   FireLoopAnim="HRG_ShootLoop"
   FireLoopSightedAnim="HRG_ShootLoop_Iron"
   FireLoopStartAnim="HRG_ShootLoop_Start"
   FireLoopStartSightedAnim="HRG_ShootLoop_Iron_Start"
   FireLoopEndAnim="HRG_ShootLoop_End"
   FireLoopEndSightedAnim="HRG_ShootLoop_Iron_End"
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Shotgun_Nailgun:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Shotgun_Nailgun:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_HRG_Nailgun:MeleeHelper_0'
   NumPellets(0)=1
   NumPellets(1)=3
   NumPellets(2)=()
   NumPellets(3)=()
   NumPellets(4)=()
   NumPellets(5)=()
   NumPellets(6)=()
   maxRecoilPitch=80
   minRecoilPitch=65
   maxRecoilYaw=60
   minRecoilYaw=-60
   RecoilRate=0.045000
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=100
   RecoilISMinYawLimit=65435
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   JoggingRecoilModifier=1.200000
   WalkingRecoilModifier=1.100000
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_SWAT'
   WeaponUpgrades(0)=(Stats=)
   WeaponUpgrades(1)=(Stats=((Scale=1.150000),(Scale=1.150000),))
   WeaponUpgrades(2)=()
   FiringStatesArray(0)="WeaponFiring"
   FiringStatesArray(1)="WeaponAltFiringAuto"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Nail_HRGNailgun'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Nail_HRGNailgun'
   FireInterval(0)=0.070000
   FireInterval(1)=0.120000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.025000
   Spread(1)=0.150000
   InstantHitDamage(0)=40.000000
   InstantHitDamage(1)=40.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HRGNailgun'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_HRGNailgun'
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HRGNailgun'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Shotgun_Nailgun:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Shotgun_Nailgun:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HRG Nailgun"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Shotgun_Nailgun:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Shotgun_Nailgun:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_HRG_Nailgun"
   ObjectArchetype=KFWeap_Shotgun_Nailgun'kfgamecontent.Default__KFWeap_Shotgun_Nailgun'
}
