//=============================================================================
// KFWeap_AssaultRifle_HRGIncendiaryRifle
//=============================================================================
// An M16 M203 Incendiary Assault Rifle
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFWeap_AssaultRifle_HRGIncendiaryRifle extends KFWeap_AssaultRifle_M16M203;

static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Rifle;
}

static simulated event EFilterTypeUI GetAltTraderFilter()
{
	return FT_Flame;
}

simulated function ModifyMagSizeAndNumber(out byte InMagazineCapacity, optional int FireMode = DEFAULT_FIREMODE, optional int UpgradeIndex = INDEX_NONE, optional KFPerk CurrentPerk)
{
	local KFPerk_Firebug FirebugPerk;

	if (CurrentPerk == none)
	{
		CurrentPerk = GetPerk();
	}

	if (FireMode == ALTFIRE_FIREMODE)
	{
		FirebugPerk = KFPerk_Firebug (CurrentPerk);

		/* KFII-48630: Do not apply the High Capacity Fuel Tank Perk Skill on the Grenade Launcher */
		if (FirebugPerk != none && FirebugPerk.IsHighCapFuelTankActive ())
		{
			return;
		}
	}

	super.ModifyMagSizeAndNumber (InMagazineCapacity, FireMode, UpgradeIndex, CurrentPerk);
}

defaultproperties
{
   PackageKey="HRG_IncendiaryRifle"
   FirstPersonMeshName="WEP_1P_HRG_IncendiaryRifle_MESH.WEP_1stP_HRG_IncendiaryRifle_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_HRG_IncendiaryRifle_ANIM.Wep_1stP_HRG_IncendiaryRifle_Anim"
   PickupMeshName="WEP_3P_HRG_IncendiaryRifle_MESH.Wep_HRG_IncendiaryRifle_Pickup"
   AttachmentArchetypeName="WEP_HRG_IncendiaryRifle_ARCH.Wep_HRG_IncendiaryRifle_3P_new"
   MuzzleFlashTemplateName="WEP_HRG_IncendiaryRifle_ARCH.Wep_HRG_IncendiaryRifle_MuzzleFlash"
   WeaponSelectTexture=Texture2D'WEP_UI_HRG_IncendiaryRifle_TEX.UI_WeaponSelect_HRG_IncendiaryRifle'
   SpareAmmoCapacity(1)=9
   InitialSpareMags(1)=2
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_HRG_IncendiaryRifle.Play_M16_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_HRG_IncendiaryRifle.Play_M16_Fire_1P_Loop')
   WeaponFireSnd(1)=()
   WeaponFireSnd(2)=(DefaultCue=AkEvent'WW_WEP_HRG_IncendiaryRifle.Play_M16_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_HRG_IncendiaryRifle.Play_M16_Fire_1P_Single')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_HRG_IncendiaryRifle.Play_M16_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_HRG_IncendiaryRifle.Play_M16_Fire_1P_EndLoop')
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_M16M203:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_M16M203:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_HRGIncendiaryRifle:MeleeHelper_0'
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Firebug'
   WeaponUpgrades(2)=(Stats=(,,(Add=1)))
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_HRGIncendiaryRifle'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Grenade_HRGIncendiaryRifle'
   InstantHitDamage(0)=30.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HRGIncendiaryRifle'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_HRGIncendiaryRifleGrenadeImpact'
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HRGIncendiaryRifle'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_AssaultRifle_M16M203:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_AssaultRifle_M16M203:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HRG Incendiary Rifle"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_AssaultRifle_M16M203:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_AssaultRifle_M16M203:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AssaultRifle_HRGIncendiaryRifle"
   ObjectArchetype=KFWeap_AssaultRifle_M16M203'kfgamecontent.Default__KFWeap_AssaultRifle_M16M203'
}
