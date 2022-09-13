//=============================================================================
// KFWeap_Pistol_DualBladed
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Pistol_DualBladed extends KFWeap_DualBase;

/*
 *
 * BROUGHT FROM MELEE WEAPON TO SUPPORT PARRYING
 *
 */

/** These override the base firemodes of the same ID (for readability) */
const BLOCK_FIREMODE = 1; // ALTFIRE_FIREMODE

/*********************************************************************************************
 * @name Defensive Abilities
 *********************************************************************************************/

struct native BlockEffectInfo
{
	var class<DamageType> DmgType;

	/** If != None, overrides the class default FX */
	var AkEvent 		BlockSound;
	var AkEvent			ParrySound;
	var ParticleSystem	BlockParticleSys;
	var ParticleSystem  ParryParticleSys;
};

var array<BlockEffectInfo> BlockTypes;

/** Damage while blocking will be mitigated by this percentage */
var() float BlockDamageMitigation;

/** Parry damage will be mitigated by this percentage */
var() float ParryDamageMitigationPercent;
/** Hit reaction strength to bypass pawn's ParryStumbleResist */
var() byte ParryStrength;

/** If true, owning pawn moves at a slower (iron sight) walking speed */
var bool bMoveAtWalkingSpeed;

/** Time between block hit reaction anims */
var() protected float BlockHitAnimCooldownTime;

/** The last time we played a block hit reaction anim */
var transient protected float LastBlockHitAnimTime;

/** Animations played on successful block */
var array<name> MeleeBlockHitAnims;

/*********************************************************************************************
 * @name	Effects
 ********************************************************************************************* */
/** Block / Parry */
var AkBaseSoundObject BlockSound;
var AKBaseSoundObject ParrySound;
var ParticleSystem	  BlockParticleSystem;
var ParticleSystem	  ParryParticleSystem;
var name			  BlockEffectsSocketName;

/** Defensive stance animation names */
const MeleeBlockStartAnim = 'Brace_in';
const MeleeBlockLoopAnim  = 'Brace_loop';
const MeleeBlockEndAnim   = 'Brace_out';

var array<name> BonesToLockOnEmpty_Override;

simulated function NotifyAttackParried();
simulated function NotifyAttackBlocked();

// Global declarations for blocking state
simulated function BlockLoopTimer();
simulated function ParryCheckTimer();

/** Called on the server when successfully block/parry an attack */
unreliable client function ClientPlayBlockEffects(optional byte BlockTypeIndex=255)
{
	local AkBaseSoundObject Sound;
	local ParticleSystem PSTemplate;

	GetBlockEffects(BlockTypeIndex, Sound, PSTemplate);
	PlayLocalBlockEffects(Sound, PSTemplate);
}

/** Called on the server when successfully block/parry an attack */
reliable client function ClientPlayParryEffects(optional byte BlockTypeIndex=255)
{
	local AkBaseSoundObject Sound;
	local ParticleSystem PSTemplate;
	local KFPerk InstigatorPerk;

	InstigatorPerk = GetPerk();
	if( InstigatorPerk != none )
	{
		InstigatorPerk.SetSuccessfullParry();
	}

	GetParryEffects(BlockTypeIndex, Sound, PSTemplate);
	PlayLocalBlockEffects(Sound, PSTemplate);
}

simulated state MeleeBlocking
{
	ignores ForceReload, ShouldAutoReload;

	simulated function bool AllowIronSights() { return false; }

	simulated function byte GetWeaponStateId()
	{
		return WEP_MeleeBlock;
	}

	simulated function BeginState(name PreviousStateName)
    {
    	local float ParryDuration;

   		ParryDuration = PlayBlockStart();

		// Set the duration of the window to parry incoming attacks
		if ( ParryDuration > 0.f )
		{
			SetTimer( ParryDuration, false, nameof(ParryCheckTimer) );
		}

		NotifyBeginState();
	}

	simulated function EndState(Name NextStateName)
	{
		if ( Instigator.IsLocallyControlled() )
		{
			PlayAnimation(MeleeBlockEndAnim);
		}

		//SetSlowMovement(false);
		NotifyEndState();
	}

	/** Return to active state if we're done blocking */
	simulated function EndFire(byte FireModeNum)
	{
		Global.EndFire(FireModeNum);

		// Wait until parry is finished, then check PendingFire to stop blocking
		if ( !StillFiring(CurrentFireMode) && !IsTimerActive(nameof(ParryCheckTimer)) )
		{
			GotoState('BlockingCooldown');
		}
	}

	/** After the parry window is finished, check PendingFire to see if we're still blocking */
	simulated function ParryCheckTimer()
	{
		// Check PendingFire to stop blocking
		if ( !StillFiring(CurrentFireMode) )
		{
			GotoState('BlockingCooldown');
		}
	}

	/** Grab/Grapple attacks can be parried */
	function bool IsGrappleBlocked(Pawn InstigatedBy)
	{
		local float FacingDot;
		local vector Dir2d;

		// zero Z to give us a 2d dot product
		Dir2d = Normal2d(InstigatedBy.Location - Instigator.Location);
		FacingDot = vector(Instigator.Rotation) dot (Dir2d);

		// Cos(85)
		if ( FacingDot > 0.087f )
		{
			if ( IsTimerActive(nameof(ParryCheckTimer)) )
			{
				KFPawn(InstigatedBy).NotifyAttackParried(Instigator, 255);
				ClientPlayParryEffects();
				NotifyAttackParried();
			}
			else
			{
				ClientPlayBlockEffects();
				NotifyAttackBlocked();
			}

			return TRUE;
		}
		return FALSE;
	}

	/** While holding a melee weapon reduce some incoming damage */
	function AdjustDamage(out int InDamage, class<DamageType> DamageType, Actor DamageCauser)
	{
		local float FacingDot;
		local vector Dir2d;
		local KFPerk InstigatorPerk;
		local byte BlockTypeIndex;

		// don't apply block/parry effects for teammates
		if (Instigator.IsSameTeam(DamageCauser.Instigator))
		{
			return;
		}

		// zero Z to give us a 2d dot product
		Dir2d = Normal2d(DamageCauser.Location - Instigator.Location);
		FacingDot = vector(Instigator.Rotation) dot (Dir2d);

		// Cos(85)
		if ( FacingDot > 0.087f && CanBlockDamageType(DamageType, BlockTypeIndex) )
		{
			InstigatorPerk = GetPerk();

			if ( IsTimerActive(nameof(ParryCheckTimer)) )
			{
				InDamage *= GetUpgradedParryDamageMitigation(CurrentWeaponUpgradeIndex);
				// Notify attacking pawn for effects / animations
				if ( KFPawn(DamageCauser) != None )
				{
					KFPawn(DamageCauser).NotifyAttackParried(Instigator, ParryStrength);
				}

				// @NOTE: This is now always true per discussion with AndrewL on KFII-29686. Since we always
				// do the damage mitigation, we should always play the effect regardless of whether the
				// zed was stumbled or knocked down. -MattF
				ClientPlayParryEffects(BlockTypeIndex);

				NotifyAttackParried();

				if( InstigatorPerk != none )
				{
					InstigatorPerk.SetSuccessfullParry();
				}
			}
			else
			{
				InDamage *= GetUpgradedBlockDamageMitigation(CurrentWeaponUpgradeIndex);
				ClientPlayBlockEffects(BlockTypeIndex);

				NotifyAttackBlocked();

				if( InstigatorPerk != none )
				{
					InstigatorPerk.SetSuccessfullBlock();
				}
			}
		}
	}

	simulated function BlockLoopTimer()
	{
		if( Instigator.IsLocallyControlled() )
		{
			PlayAnimation(MeleeBlockLoopAnim, , true);
		}
	}

	/** State override for Block_Hit animations */
	unreliable client function ClientPlayBlockEffects(optional byte BlockTypeIndex=255)
	{
		local int AnimIdx;
		local float Duration;
		local KFPerk InstigatorPerk;

		Global.ClientPlayBlockEffects(BlockTypeIndex);

		InstigatorPerk = GetPerk();
		if( InstigatorPerk != none )
		{
			InstigatorPerk.SetSuccessfullBlock();
		}

		if( MeleeBlockHitAnims.Length > 0 && (WorldInfo.TimeSeconds - LastBlockHitAnimTime) > BlockHitAnimCooldownTime && !IsTimerActive(nameof(ParryCheckTimer)) )
		{
			AnimIdx = Rand(MeleeBlockHitAnims.Length);
			Duration = MySkelMesh.GetAnimLength(MeleeBlockHitAnims[AnimIdx]);

			if ( Duration > 0 )
			{
				LastBlockHitAnimTime = WorldInfo.TimeSeconds;
				PlayAnimation(MeleeBlockHitAnims[AnimIdx]);
				SetTimer(Duration, false, nameof(BlockLoopTimer));
			}
		}
	}
}

simulated function float PlayBlockStart()
{
	local float AnimDuration;

	if( Instigator.IsLocallyControlled() )
	{
		PlayAnimation(MeleeBlockStartAnim);
	}

	// set when to start playing the looping anim
	AnimDuration = MySkelMesh.GetAnimLength(MeleeBlockStartAnim);
	if ( AnimDuration > 0.f )
	{
		SetTimer(AnimDuration, false, nameof(BlockLoopTimer));
	}
	else
	{
		BlockLoopTimer();
	}

	// set the parry duration to the same as the block start anim
	return AnimDuration;
}

/** Called on the client when successfully block/parry an attack */
simulated function PlayLocalBlockEffects(AKBaseSoundObject Sound, ParticleSystem PSTemplate)
{
	local vector Loc;
	local rotator Rot;
	local ParticleSystemComponent PSC;

	if ( Sound != None )
	{
		PlaySoundBase(Sound, true);
	}

	if ( PSTemplate != None )
	{
		if ( MySkelMesh.GetSocketWorldLocationAndRotation(BlockEffectsSocketName, Loc, Rot) )
		{
			PSC = WorldInfo.MyEmitterPool.SpawnEmitter(PSTemplate, Loc,  Rot);
			PSC.SetDepthPriorityGroup(SDPG_Foreground);
		}
		else
		{
			LogInternal(self@GetFuncName()@"missing BlockEffects Socket!");
		}
	}
}

/** If true, this damage type can be blocked by the MeleeBlocking state */
function bool CanBlockDamageType(class<DamageType> DamageType, optional out byte out_Idx)
{
	local int Idx;

	// Check if this damage should be ignored completely
	for (Idx = 0; Idx < BlockTypes.length; ++Idx)
	{
		if ( ClassIsChildOf(DamageType, BlockTypes[Idx].DmgType) )
		{
			out_Idx = Idx;
			return true;
		}
	}

	out_Idx = INDEX_NONE;
	return false;
}

/** Returns sound and particle system overrides using index into BlockTypes array */
simulated function GetBlockEffects(byte BlockIndex, out AKBaseSoundObject outSound, out ParticleSystem outParticleSys)
{
	outSound = BlockSound;
	outParticleSys = BlockParticleSystem;

	if ( BlockIndex != 255 )
	{
		if ( BlockTypes[BlockIndex].BlockSound != None )
		{
			outSound = BlockTypes[BlockIndex].BlockSound;
		}
		if ( BlockTypes[BlockIndex].BlockParticleSys != None )
		{
			outParticleSys = BlockTypes[BlockIndex].BlockParticleSys;
		}
	}
}

/** Returns sound and particle system overrides using index into BlockTypes array */
simulated function GetParryEffects(byte BlockIndex, out AKBaseSoundObject outSound, out ParticleSystem outParticleSys)
{
	outSound = ParrySound;
	outParticleSys = ParryParticleSystem;

	if ( BlockIndex != 255 )
	{
		if ( BlockTypes[BlockIndex].ParrySound != None )
		{
			outSound = BlockTypes[BlockIndex].ParrySound;
		}
		if ( BlockTypes[BlockIndex].ParryParticleSys != None )
		{
			outParticleSys = BlockTypes[BlockIndex].ParryParticleSys;
		}
	}
}

/*********************************************************************************************
 * State BlockingCooldown
  * A short cooldown state to prevent spamming block while still allowing pendingfire to be set
 *********************************************************************************************/

// Global declarations for this state
simulated function BlockCooldownTimer();

simulated state BlockingCooldown extends Active
{
	ignores AllowSprinting;

	/** Set cooldown duration */
	simulated function BeginState( Name PreviousStateName )
	{
		SetTimer(0.5, false, nameof(BlockCooldownTimer));
		Super.BeginState(PreviousStateName);
	}

	// prevent going to block/parry state
	simulated function bool HasAmmo( byte FireModeNum, optional int Amount )
	{
		if ( FireModeNum == BLOCK_FIREMODE )
		{
			return false;
		}

		return Global.HasAmmo(FireModeNum, Amount);
	}

	// prevent HasAmmo (above) from causing an auto reload
	simulated function bool ShouldAutoReload(byte FireModeNum)
	{
		if ( FireModeNum == BLOCK_FIREMODE )
		{
			return false;
		}

		return Global.ShouldAutoReload(FireModeNum);
	}

	simulated function BlockCooldownTimer()
	{
		GotoState('Active');
	}
}

/*
 *
 * END of parrying code.
 *
 */


/**
 * Toggle between DEFAULT and ALTFIRE
 */
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

	Super(KFWeapon).StartFire(BLOCK_FIREMODE);
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

/*********************************************************************************************
 * Upgrades
 ********************************************************************************************/

static simulated function float GetUpgradedBlockDamageMitigation(int UpgradeIndex)
{
	return GetUpgradedStatValue(default.BlockDamageMitigation, EWUS_BlockDmgMitigation, UpgradeIndex);
}

static simulated function float GetUpgradedParryDamageMitigation(int UpgradeIndex)
{
	return GetUpgradedStatValue(default.ParryDamageMitigationPercent, EWUS_ParryDmgMitigation, UpgradeIndex);
}

simulated function int GetModifiedDamage(byte FireModeNum, optional vector RayDir)
{
	if (FireModeNum == BASH_FIREMODE)
	{
		return GetUpgradedStatValue(InstantHitDamage[FireModeNum], EWUS_Damage2, CurrentWeaponUpgradeIndex);
	}

	return super.GetModifiedDamage(FireModeNum, RayDir);
}

/** Check AmmoCount and update anim tree nodes if needed */
simulated function UpdateOutOfAmmoEffects(float BlendTime)
{
	if ( WorldInfo.NetMode == NM_DedicatedServer )
		return;

	if( EmptyMagBlendNode != None )
	{
		// Differentiate Left/Right
		if ( bAllowClientAmmoTracking && AmmoCount[0] <= 1 )
		{
			EmptyMagBlendNode.SetBlendTarget(1, 0);
			if ( AmmoCount[0] == 0 )
			{

				EmptyMagBlendNode = AnimNodeBlendPerBone(SkeletalMeshComponent(Mesh).FindAnimNode('EmptyMagBlend'));
				BuildEmptyMagNodeWeightList( EmptyMagBlendNode, BonesToLockOnEmpty_Override );
				
				EmptyMagBlendNode.SetBlendTarget(1,0);

				LogInternal("blending left");
				EmptyMagBlendNode_L.SetBlendTarget(1,0);
			}
		}
	}
}

/** Unlocks the bolt bone (Called by animnotify) */
simulated function ANIMNOTIFY_UnLockBolt()
{
	super.ANIMNOTIFY_UnLockBolt();
	EmptyMagBlendNode_L.SetBlendTarget(0, 0);

	EmptyMagBlendNode = AnimNodeBlendPerBone(SkeletalMeshComponent(Mesh).FindAnimNode('EmptyMagBlend'));
	BuildEmptyMagNodeWeightList( EmptyMagBlendNode, BonesToLockOnEmpty);
}

defaultproperties
{
   BlockTypes(0)=(dmgType=Class'KFGame.KFDT_Bludgeon')
   BlockTypes(1)=(dmgType=Class'KFGame.KFDT_Slashing')
   BlockDamageMitigation=0.600000
   ParryDamageMitigationPercent=0.500000
   ParryStrength=4
   BlockHitAnimCooldownTime=0.500000
   MeleeBlockHitAnims(0)="Block_Hit_V1"
   MeleeBlockHitAnims(1)="Block_Hit_V2"
   MeleeBlockHitAnims(2)="Block_Hit_V3"
   BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Crovel'
   ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
   BlockParticleSystem=ParticleSystem'FX_Impacts_EMIT.FX_Block_melee_01'
   ParryParticleSystem=ParticleSystem'FX_Impacts_EMIT.FX_Parry_melee_01'
   BlockEffectsSocketName="BlockEffect"
   BonesToLockOnEmpty_Override(0)="RW_FrontPivot"
   BonesToLockOnEmpty_Override(1)="LW_FrontPivot"
   LeftFireOffset=(X=30.000000,Y=-7.000000,Z=-5.000000)
   SingleClass=Class'kfgamecontent.KFWeap_Pistol_Bladed'
   BonesToLockOnEmpty_L(0)="LW_FrontPivot"
   PackageKey="Dual_BladedPistol"
   FirstPersonMeshName="WEP_1P_Dual_BladedPistol_MESH.WEP_1stP_DualBladedPistol_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Dual_BladedPistol_ANIM.Wep_1stP_Dual_BladedPistol_ANIM"
   PickupMeshName="WEP_3P_Dual_BladedPistol_MESH.Wep_Dual_BladedPistol_Pickup"
   AttachmentArchetypeName="WEP_Dual_BladedPistol_ARCH.Wep_Dual_BladedPistol_3P"
   MuzzleFlashTemplateName="WEP_Dual_BladedPistol_ARCH.Wep_Dual_BladedPistol_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Sawblade'
   FireModeIconPaths(1)=()
   InventorySize=6
   PenetrationPower(0)=3.000000
   PenetrationPower(1)=()
   MeshFOV=96.000000
   MeshIronSightFOV=77.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=-3.000000,Y=0.000000,Z=0.000000)
   QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=45.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Dual_BladedPistol_TEX.UI_WeaponSelect_Dual_BladedPistol'
   MagazineCapacity(0)=12
   AmmoCost(1)=0
   SpareAmmoCapacity(0)=72
   InitialSpareMags(0)=1
   AmmoPickupScale(0)=0.500000
   BonesToLockOnEmpty(0)="RW_FrontPivot"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_BladedPistol.Play_WEP_BladedPistol_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_BladedPistol.Play_WEP_BladedPistol_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_BladedPistol.Play_WEP_BladedPistol_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_BladedPistol.Play_WEP_BladedPistol_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_BladedPistol.Play_WEP_BladedPistol_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_BladedPistol.Play_WEP_BladedPistol_Handling_DryFire'
   PlayerViewOffset=(X=-15.000000,Y=0.000000,Z=0.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_DualBladed:MeleeHelper_0'
   maxRecoilPitch=330
   minRecoilPitch=300
   maxRecoilYaw=120
   minRecoilYaw=-120
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
   UpgradeFireModes(1)=0
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="MeleeBlocking"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_Custom
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Blade_BladedPistol'
   FireInterval(0)=0.190000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.005000
   InstantHitDamage(0)=115.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=75.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Slashing_BladedPistol'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_BladedPistol'
   FireOffset=(X=30.000000,Y=7.000000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_DualBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_DualBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Dual Piranha Pistols"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_DualBladed"
   ObjectArchetype=KFWeap_DualBase'KFGame.Default__KFWeap_DualBase'
}
