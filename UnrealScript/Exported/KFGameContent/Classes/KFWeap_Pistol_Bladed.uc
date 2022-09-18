//=============================================================================
// KFWeap_Pistol_Bladed
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Pistol_Bladed extends KFWeap_MeleeBase;

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Pistol;
}

/** Override melee SetIronSights (which sends to heavy attack) so that this weapon ironsights normally*/
simulated function SetIronSights(bool bNewIronSights)
{
	super(KFWeapon).SetIronSights(bNewIronSights);
}

/** Override melee ShouldOwnerWalk which doesn't account for walking when in ironsights */
simulated function bool ShouldOwnerWalk()
{
	return super(KFWeapon).ShouldOwnerWalk();
}


/** Override to drop the player out of ironsights first */
simulated function AltFireMode()
{
	if (!Instigator.IsLocallyControlled())
	{
		return;
	}

	// break out of ironsights when starting to block
	if (bUsingSights)
	{
		SetIronSights(false);
	}

	StartFire(BLOCK_FIREMODE);
}

simulated state MeleeBlocking
{
	simulated function bool AllowIronSights() { return false; }
}

/** Called during reload state */
simulated function bool CanOverrideMagReload(byte FireModeNum)
{
	if (FireModeNum == BLOCK_FIREMODE)
	{
		return true;
	}

	return super.CanOverrideMagReload(FireModeNum);
}

simulated function StartFire(byte FireModeNum)
{
	if( FireModeNum == DEFAULT_FIREMODE )
	{
		if ( ShouldAutoReload(FireModeNum) )
		{
			BeginFire(RELOAD_FIREMODE);
			return;
		}
	}

	super(KFWeapon).StartFire(FireModeNum);
}

/*********************************************************************************************
 * @name	Firing / Projectile
********************************************************************************************* */
/**
 * See Pawn.ProcessInstantHit
 * @param DamageReduction: Custom KF parameter to handle penetration damage reduction
 */
simulated function ProcessInstantHitEx(byte FiringMode, ImpactInfo Impact, optional int NumHits, optional out float out_PenetrationVal, optional int ImpactNum )
{
	local KFPerk InstigatorPerk;

	InstigatorPerk = GetPerk();
	if( InstigatorPerk != none )
	{
		InstigatorPerk.UpdatePerkHeadShots( Impact, InstantHitDamageTypes[FiringMode], ImpactNum );
	}

	super.ProcessInstantHitEx( FiringMode, Impact, NumHits, out_PenetrationVal, ImpactNum );
}

/** process local player impact for clientside hit detection */
event RecieveClientImpact(byte FiringMode, const out ImpactInfo Impact, optional out float PenetrationValue, optional int ImpactNum)
{
	// skip KFWeap_MeleeBase because it does melee stuff
	super(KFWeapon).RecieveClientImpact(FiringMode, Impact, PenetrationValue, ImpactNum);
}

defaultproperties
{
   ParryStrength=3
   BlockTypes(2)=(dmgType=Class'KFGame.KFDT_Bludgeon')
   BlockTypes(3)=(dmgType=Class'KFGame.KFDT_Slashing')
   BlockDamageMitigation=0.700000
   ParryDamageMitigationPercent=0.600000
   BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Crovel'
   ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
   PackageKey="BladedPistol"
   FirstPersonMeshName="WEP_1P_BladedPistol_MESH.WEP_1stP_BladedPistol_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_BladedPistol_ANIM.WEP_1stP_BladedPistol_Anim"
   PickupMeshName="WEP_3P_BladedPistol_MESH.Wep_BladedPistol_Pickup"
   AttachmentArchetypeName="WEP_BladedPistol_ARCH.Wep_BladedPistol_3P"
   MuzzleFlashTemplateName="WEP_BladedPistol_ARCH.Wep_BladedPistol_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Sawblade'
   FireModeIconPaths(1)=()
   FireModeIconPaths(2)=()
   FireModeIconPaths(3)=()
   FireModeIconPaths(4)=()
   FireModeIconPaths(5)=()
   InventoryGroup=IG_Secondary
   InventorySize=3
   PenetrationPower(0)=3.000000
   PenetrationPower(1)=()
   MeshFOV=96.000000
   MeshIronSightFOV=77.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=0.000000,Y=0.050000,Z=-1.200000)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=25.000000
   WeaponSelectTexture=Texture2D'WEP_UI_BladedPistol_TEX.UI_WeaponSelect_BladedPistol'
   DualClass=Class'kfgamecontent.KFWeap_Pistol_DualBladed'
   MagazineCapacity(0)=6
   AmmoCost(0)=1
   AmmoCost(1)=()
   AmmoCost(2)=()
   AmmoCost(3)=()
   AmmoCost(4)=()
   AmmoCost(5)=()
   SpareAmmoCapacity(0)=66
   InitialSpareMags(0)=2
   BonesToLockOnEmpty(0)="RW_FrontPivot"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_BladedPistol.Play_WEP_BladedPistol_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_BladedPistol.Play_WEP_BladedPistol_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_BladedPistol.Play_WEP_BladedPistol_Handling_DryFire'
   PlayerViewOffset=(X=-15.000000,Y=12.000000,Z=-6.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
      bUseDirectionalMelee=True
      bHasChainAttacks=True
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_Bladed:MeleeHelper_0'
   maxRecoilPitch=330
   minRecoilPitch=300
   maxRecoilYaw=90
   minRecoilYaw=-90
   RecoilRate=0.070000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=250
   RecoilISMinPitchLimit=65485
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Gunslinger'
   AssociatedPerkClasses(1)=Class'KFGame.KFPerk_Berserker'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Stat=EWUS_Damage1,Scale=1.150000),(Stat=EWUS_Damage2,Scale=1.150000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.300000),(Stat=EWUS_Damage1,Scale=1.300000),(Stat=EWUS_Damage2,Scale=1.300000),(Add=2)))
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)=()
   FiringStatesArray(2)="Reloading"
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   FiringStatesArray(5)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponFireTypes(5)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Blade_BladedPistol'
   FireInterval(0)=0.250000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.005000
   InstantHitDamage(0)=115.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=75.000000
   InstantHitDamage(4)=()
   InstantHitDamage(5)=()
   InstantHitMomentum(3)=10000.000000
   InstantHitMomentum(4)=()
   InstantHitMomentum(5)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Slashing_BladedPistol'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_BladedPistol'
   InstantHitDamageTypes(4)=()
   InstantHitDamageTypes(5)=()
   FireOffset=(X=30.000000,Y=5.000000,Z=-4.000000)
   bMeleeWeapon=False
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_MeleeBase:FirstPersonMesh'
      MinTickTimeStep=0.025000
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_MeleeBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Piranha Pistol"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_Bladed"
   ObjectArchetype=KFWeap_MeleeBase'KFGame.Default__KFWeap_MeleeBase'
}
