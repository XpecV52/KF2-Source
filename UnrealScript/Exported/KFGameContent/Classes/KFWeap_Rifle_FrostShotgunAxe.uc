//=============================================================================
// KFWeap_Rifle_FrostShotgunAxe
//=============================================================================
// A Rifle with an axe that freezes enemies
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Rifle_FrostShotgunAxe extends KFWeap_MeleeBase;

var float LastFireInterval;
var int iInstantHitDamageOnEnemyFrozen;
var int iNormalInstantHitDamage;

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Rifle;
}

simulated event PreBeginPlay()
{
	super.PreBeginPlay();
	iNormalInstantHitDamage = InstantHitDamage[BASH_FIREMODE];
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

/** process local player impact for clientside hit detection */
event RecieveClientImpact(byte FiringMode, const out ImpactInfo Impact, optional out float PenetrationValue, optional int ImpactNum)
{
	// skip KFWeap_MeleeBase because it does melee stuff
	super(KFWeapon).RecieveClientImpact(FiringMode, Impact, PenetrationValue, ImpactNum);
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

/** Save off the start time for the bash to determine whether this will be a normal stab or a bullet stab */
simulated function StartFire(byte FireModeNum)
{
	// copying over auto reload functionality since MeleeBase overrides this by default
	if (FireModeNum == DEFAULT_FIREMODE && ShouldAutoReload(FireModeNum))
	{
		FireModeNum = RELOAD_FIREMODE;
	}

	if (FireModeNum == RELOAD_FIREMODE)
	{
		// Skip Super/ ServerStartFire and let server wait for ServerSendToReload to force state synchronization
		BeginFire(FireModeNum);
		return;
	}
	if( FireModeNum == BASH_FIREMODE && WeaponFireTypes[FireModeNum] == EWFT_Custom )
	{
		super.StartMeleeFire(FireModeNum, MeleeAttackHelper.ChooseAttackDir(), ATK_Normal);
		return;
	}
	super.StartFire(FireModeNum);
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
	simulated function BeginState(name PreviousStateName)
	{
		super.BeginState(PreviousStateName);
		if (bUsingSights)
		{
			SetIronSights(false);
		}
	}
	simulated function bool AllowIronSights() { return false; }
}

simulated function float GetFireInterval(byte FireModeNum)
{
	if (FireModeNum == DEFAULT_FIREMODE && AmmoCount[FireModeNum] == 0)
	{
		return LastFireInterval;
	}

	return super.GetFireInterval(FireModeNum);
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

/** returns the damage amount for this attack */
simulated function int GetMeleeDamage(byte FireModeNum, optional vector RayDir)
{
	local KFMeleeHelperWeaponFrostShotgunAxe oHelper;
	local int Damage;
	oHelper = KFMeleeHelperWeaponFrostShotgunAxe(MeleeAttackHelper);
	if(oHelper.IsEnemyIced())
	{
		InstantHitDamage[FireModeNum] = iInstantHitDamageOnEnemyFrozen;
	}
	else
	{
		InstantHitDamage[FireModeNum] = iNormalInstantHitDamage;
	}
	Damage = Super.GetMeleeDamage(FireModeNum, RayDir);
	return Damage;
}



simulated function int GetModifiedDamage(byte FireModeNum, optional vector RayDir)
{
	switch(FireModeNum)
	{
		case DEFAULT_FIREMODE:
			return GetUpgradedStatValue(InstantHitDamage[FireModeNum], EWUS_Damage0 , CurrentWeaponUpgradeIndex);
		break;
		case ALTFIRE_FIREMODE:
			return GetUpgradedStatValue(InstantHitDamage[FireModeNum], EWUS_Damage1 , CurrentWeaponUpgradeIndex);
		break;
		case BASH_FIREMODE:
			return GetUpgradedStatValue(InstantHitDamage[FireModeNum], EWUS_Damage2 , CurrentWeaponUpgradeIndex);
		break;
	}
	return GetUpgradedStatValue(InstantHitDamage[FireModeNum], EWUS_Damage0 , CurrentWeaponUpgradeIndex);
}

/** Allows weapon to calculate its own damage for display in trader */
static simulated function float CalculateTraderWeaponStatDamage()
{
	local float BaseDamage, DoTDamage;
	local class<KFDamageType> DamageType;

	BaseDamage = default.InstantHitDamage[DEFAULT_FIREMODE];

	DamageType = class<KFDamageType>(default.InstantHitDamageTypes[DEFAULT_FIREMODE]);
	if (DamageType != none && DamageType.default.DoT_Type != DOT_None)
	{
		DoTDamage = (DamageType.default.DoT_Duration / DamageType.default.DoT_Interval) * (BaseDamage * DamageType.default.DoT_DamageScale);
	}

	return BaseDamage * default.NumPellets[DEFAULT_FIREMODE] + DoTDamage;
}

/** Allows weapon to calculate its own fire rate for display in trader */
static simulated function float CalculateTraderWeaponStatFireRate()
{
	return 60.f / default.FireInterval[DEFAULT_FIREMODE]; // attacks per minute
}

/** Spawn projectile is called once for each shot pellet fired */
simulated function KFProjectile SpawnAllProjectiles(class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir)
{
	local KFPerk InstigatorPerk;

	if (CurrentFireMode == GRENADE_FIREMODE)
	{
		return Super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
	}

	InstigatorPerk = GetPerk();
	if (InstigatorPerk != none)
	{
		Spread[CurrentFireMode] = default.Spread[CurrentFireMode] * InstigatorPerk.GetTightChokeModifier();
	}

	return super.SpawnAllProjectiles(KFProjClass, RealStartLoc, AimDir);
}

/** Plays a 'settle' animation after a melee attack is finished */
simulated function PlayMeleeSettleAnim()
{
	PlayAnimation(MeleeAttackSettleAnims[0], 0.0, false, 0.1);
}

defaultproperties
{
   LastFireInterval=0.500000
   iInstantHitDamageOnEnemyFrozen=185
   BlockDamageMitigation=0.600000
   ParryDamageMitigationPercent=0.500000
   BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Hammer'
   ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Wood'
   PackageKey="Frost_Shotgun_Axe"
   FirstPersonMeshName="WEP_1P_Frost_Shotgun_Axe_MESH.Wep_1stP_Frost_Shotgun_Axe_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Frost_Shotgun_Axe_ANIM.WEP_1stP_Frost_Shotgun_Axe"
   PickupMeshName="WEP_3P_Frost_Shotgun_Axe_MESH.Wep_3rdP_Frost_Shotgun_Pickup"
   AttachmentArchetypeName="WEP_Frost_Shotgun_Axe_ARCH.Wep_Frost_Shotgun_Axe_3P"
   MuzzleFlashTemplateName="WEP_Frost_Shotgun_Axe_ARCH.Wep_Frost_Shotgun_Axe_MuzzleFlash"
   bHasIronSights=True
   bWarnAIWhenAiming=True
   bCanBeReloaded=True
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   FireModeIconPaths(1)=()
   FireModeIconPaths(2)=()
   FireModeIconPaths(3)=()
   FireModeIconPaths(4)=()
   FireModeIconPaths(5)=()
   InventoryGroup=IG_Primary
   InventorySize=7
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=()
   AimCorrectionSize=40.000000
   MeshFOV=65.000000
   MeshIronSightFOV=45.000000
   PlayerIronSightFOV=65.000000
   DOF_FG_MaxNearBlurSize=3.500000
   AimWarningDelay=(X=0.400000,Y=0.800000)
   GroupPriority=80.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Frost_Shotgun_Axe_TEX.UI_WeaponSelect_FrostGun'
   MagazineCapacity(0)=6
   AmmoCost(0)=1
   AmmoCost(1)=()
   AmmoCost(2)=()
   AmmoCost(3)=()
   AmmoCost(4)=()
   AmmoCost(5)=()
   SpareAmmoCapacity(0)=66
   InitialSpareMags(0)=4
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'
   BonesToLockOnEmpty(0)="RW_Bolt_Back"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_FrostFang.Play_FrostFang_Shoot_3P',FirstPersonCue=AkEvent'WW_WEP_FrostFang.Play_FrostFang_Shoot_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_FrostFang.Play_FrostFang_DryFire'
   PlayerViewOffset=(X=8.000000,Y=7.000000,Z=-3.500000)
   Begin Object Class=KFMeleeHelperWeaponFrostShotgunAxe Name=MeleeHelper_0
      bUseDirectionalMelee=True
      bHasChainAttacks=True
      MeleeImpactCamShakeScale=0.030000
      MaxHitRange=250.000000
      HitboxChain(0)=(BoneOffset=(X=3.000000,Y=0.000000,Z=-190.000000))
      HitboxChain(1)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=-170.000000))
      HitboxChain(2)=(BoneOffset=(X=3.000000,Y=0.000000,Z=-150.000000))
      HitboxChain(3)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=-130.000000))
      HitboxChain(4)=(BoneOffset=(X=3.000000,Y=0.000000,Z=-110.000000))
      HitboxChain(5)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=-90.000000))
      HitboxChain(6)=(BoneOffset=(X=3.000000,Y=0.000000,Z=-70.000000))
      HitboxChain(7)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=-50.000000))
      HitboxChain(8)=(BoneOffset=(X=3.000000,Y=0.000000,Z=-30.000000))
      HitboxChain(9)=(BoneOffset=(X=0.000000,Y=0.000000,Z=10.000000))
      WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeaponFrostShotgunAxe'KFGame.Default__KFMeleeHelperWeaponFrostShotgunAxe'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeaponFrostShotgunAxe'kfgamecontent.Default__KFWeap_Rifle_FrostShotgunAxe:MeleeHelper_0'
   EjectedShellForegroundDuration=1.500000
   NumPellets(0)=7
   NumPellets(1)=()
   NumPellets(2)=()
   NumPellets(3)=()
   NumPellets(4)=()
   NumPellets(5)=()
   NumPellets(6)=()
   maxRecoilPitch=1050
   minRecoilPitch=900
   maxRecoilYaw=350
   minRecoilYaw=-350
   RecoilRate=0.075000
   RecoilViewRotationScale=0.600000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=64785
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   HippedRecoilModifier=1.300000
   FallingRecoilModifier=1.500000
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Support'
   AssociatedPerkClasses(1)=Class'KFGame.KFPerk_Berserker'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.125000),(Stat=EWUS_Damage1,Scale=1.125000),(Stat=EWUS_Damage2,Scale=1.100000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.250000),(Stat=EWUS_Damage1,Scale=1.250000),(Stat=EWUS_Damage2,Scale=1.200000),(Add=2)))
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)=()
   FiringStatesArray(2)="Reloading"
   FiringStatesArray(3)="MeleeChainAttacking"
   FiringStatesArray(4)=()
   FiringStatesArray(5)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponFireTypes(5)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_Frost_Shotgun_Axe'
   FireInterval(0)=0.500000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.130000
   InstantHitDamage(0)=30.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=75.000000
   InstantHitDamage(4)=()
   InstantHitDamage(5)=()
   InstantHitMomentum(3)=10000.000000
   InstantHitMomentum(4)=()
   InstantHitMomentum(5)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_Frost_Shotgun_Axe'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Slashing_Frost_Shotgun_Axe'
   InstantHitDamageTypes(4)=()
   InstantHitDamageTypes(5)=()
   FireOffset=(X=25.000000,Y=3.000000,Z=-2.500000)
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
   ItemName="Frost Fang"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Rifle_FrostShotgunAxe"
   ObjectArchetype=KFWeap_MeleeBase'KFGame.Default__KFWeap_MeleeBase'
}
