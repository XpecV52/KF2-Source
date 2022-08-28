//=============================================================================
// KFWeap_Rifle_Hemogoblin
//=============================================================================
// Weapon code for bleeder.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Rifle_Hemogoblin extends KFWeap_MedicBase;

/** Returns trader filter index based on weapon type (copied from riflebase) */
static simulated event EFilterTypeUI GetTraderFilter()
{
    if (default.FiringStatesArray[DEFAULT_FIREMODE] == 'WeaponFiring' || default.FiringStatesArray[DEFAULT_FIREMODE] == 'WeaponBurstFiring')
    {
        return FT_Assault;
    }
    else // if( FiringStatesArray[DEFAULT_FIREMODE] == 'WeaponSingleFiring')
    {
        return FT_Rifle;
    }
}

/**
* See Pawn.ProcessInstantHit
* @param DamageReduction: Custom KF parameter to handle penetration damage reduction
*/
simulated function ProcessInstantHitEx(byte FiringMode, ImpactInfo Impact, optional int NumHits, optional out float out_PenetrationVal, optional int ImpactNum)
{
    local KFPerk InstigatorPerk;

    InstigatorPerk = GetPerk();
    if (InstigatorPerk != none)
    {
        InstigatorPerk.UpdatePerkHeadShots(Impact, InstantHitDamageTypes[FiringMode], ImpactNum);
    }

    super.ProcessInstantHitEx(FiringMode, Impact, NumHits, out_PenetrationVal, ImpactNum);
}

defaultproperties
{
   HealFullRechargeSeconds=12.000000
   PackageKey="Bleeder"
   FirstPersonMeshName="WEP_1P_Bleeder_MESH.WEP_1stP_Bleeder_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Bleeder_ANIM.Wep_1stP_Bleeder_Anim"
   PickupMeshName="wep_3p_bleeder_mesh.Wep_3rdP_Bleeder_Pickup"
   AttachmentArchetypeName="WEP_Bleeder_ARCH.Wep_Bleeder_3P"
   MuzzleFlashTemplateName="WEP_Bleeder_ARCH.Wep_Bleeder_MuzzleFlash"
   bHasIronSights=True
   bWarnAIWhenAiming=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   InventorySize=8
   MagazineCapacity(0)=7
   MeshFOV=70.000000
   MeshIronSightFOV=27.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=30.000000,Y=0.000000,Z=0.000000)
   DOF_BlendInSpeed=3.000000
   DOF_FG_FocalRadius=0.000000
   DOF_FG_MaxNearBlurSize=3.500000
   AimWarningDelay=(X=0.400000,Y=0.800000)
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Bleeder_TEX.UI_WeaponSelect_Bleeder'
   SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
   AmmoCost(1)=40
   SpareAmmoCapacity(0)=91
   InitialSpareMags(0)=3
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_Bleeder.Play_WEP_Bleeder_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_Bleeder.Play_WEP_Bleeder_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_EBR.Play_WEP_SA_EBR_Handling_DryFire'
   PlayerViewOffset=(X=20.000000,Y=11.000000,Z=-2.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_MedicBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_MedicBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Rifle_Hemogoblin:MeleeHelper_0'
   LaserSightTemplate=KFLaserSightAttachment'FX_LaserSight_ARCH.LaserSight_WithAttachment_1P'
   maxRecoilPitch=225
   minRecoilPitch=200
   maxRecoilYaw=200
   minRecoilYaw=-200
   RecoilRate=0.080000
   RecoilViewRotationScale=0.600000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=150
   RecoilISMinYawLimit=65385
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_FieldMedic'
   WeaponUpgrades(1)=(IncrementDamage=1.400000,IncrementHealFullRecharge=0.800000)
   WeaponUpgrades(2)=(IncrementWeight=2,IncrementDamage=1.800000,IncrementHealFullRecharge=0.600000)
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)=()
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_Hemogoblin'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.250000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.006000
   Spread(1)=()
   InstantHitDamage(0)=50.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=27.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_Hemogoblin'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Hemogoblin'
   FireOffset=(X=30.000000,Y=3.000000,Z=-2.500000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_MedicBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_MedicBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Hemogoblin"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_MedicBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_MedicBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Rifle_Hemogoblin"
   ObjectArchetype=KFWeap_MedicBase'kfgamecontent.Default__KFWeap_MedicBase'
}
