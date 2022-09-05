//=============================================================================
// KFWeap_SMG_G18
//=============================================================================
// full auto pistol with riot shield
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFWeap_SMG_G18 extends KFWeap_SMGBase;

// default fx
var AkBaseSoundObject BlockSound;
var ParticleSystem BlockParticleSystem;
var name BlockEffectsSocketName;

var array<BlockEffectInfo> BlockTypes;
var float BlockDamageMitigation;

var const name IdleToIronSightAnim;
var const name IronSightToIdleAnim;

var float BlockAngle;
var transient float BlockAngleCos;

/** Explosion actor class to spawn */
var class<KFExplosionActor> ExplosionActorClass;
var() KFGameExplosion ExplosionTemplate;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	BlockAngleCos = cos((BlockAngle / 2.f) * DegToRad);
}

/*********************************************************************************************
 * State Active
 * A Weapon this is being held by a pawn should be in the active state.  In this state,
 * a weapon should loop any number of idle animations, as well as check the PendingFire flags
 * to see if a shot has been fired.
 *********************************************************************************************/
simulated state Active
{
	simulated function ZoomIn(bool bAnimateTransition, float ZoomTimeToGo)
	{
		GotoState('ActiveIronSights');
	}
}

/*********************************************************************************************
 * State ActiveIronSights
 * Plays an animation when transitioning to or from iron sights, but this animation
 * should only be played in the "Active" state. This state allows us to encapsulate this
 * functionality.
 *********************************************************************************************/
simulated state ActiveIronSights extends Active
{
	simulated function BeginState(Name PreviousStateName)
	{
		local float ZoomTimeToGo;
		ZoomTimeToGo = MySkelMesh.GetAnimLength(IdleToIronSightAnim);

		Global.ZoomIn(true, ZoomTimeToGo);

		PlayAnimation(IdleToIronSightAnim, ZoomTime, false);
	}

	simulated function ZoomOut(bool bAnimateTransition, float ZoomTimeToGo)
	{
		ZoomTimeToGo = MySkelMesh.GetAnimLength(IronSightToIdleAnim);

		Global.ZoomOut(true, ZoomTimeToGo);

		PlayAnimation(IronSightToIdleAnim, ZoomTime, false);

		GotoState('Active');
	}
}

/*********************************************************************************************
 * State MeleeAttackBasic
 * This is a basic melee state that's used as a base for other more advanced states
 *********************************************************************************************/

simulated state MeleeAttackBasic
{
	simulated function NotifyMeleeCollision(Actor HitActor, optional vector HitLocation)
	{
		local KFPawn Victim;

		if (Role == ROLE_Authority)
		{
			if (HitActor.bWorldGeometry)
			{
				return;
			}

			Victim = KFPawn(HitActor);
			if (Victim == None ||
			   (Victim.GetTeamNum() == Instigator.GetTeamNum()) ||
			   (Victim.bPlayedDeath && (WorldInfo.TimeSeconds - Victim.TimeOfDeath) > 0.f))
			{
				return;
			}

			// need to delay one frame, since this is called from AnimNotify
			SetTimer(0.001f, false, nameof(DoBashImpulse));
		}
	}
}

simulated function DoBashImpulse()
{
	local KFExplosionActor ExploActor;
	local vector SpawnLoc;
	local rotator SpawnRot;

	if (Instigator.Role < ROLE_Authority)
	{
		return;
	}

	SpawnLoc = Instigator.Location;
	SpawnRot = Instigator.Rotation;

	// nudge backwards to give a wider code near the player
	SpawnLoc += vector(SpawnRot);

	// explode using the given template
	ExploActor = Spawn(ExplosionActorClass, self,, SpawnLoc, SpawnRot,, true);
	if (ExploActor != None)
	{
		ExploActor.InstigatorController = Instigator.Controller;
		ExploActor.Instigator = Instigator;
		ExploActor.bReplicateInstigator = true;
		ExploActor.Explode(ExplosionTemplate, vector(SpawnRot));
	}
}

/**
 * State Reloading
 * State the weapon is in when it is being reloaded (current magazine replaced with a new one, related animations and effects played).
 */
simulated state Reloading
{
	/** Cancel reload when going into ironsights */
	simulated function ZoomIn(bool bAnimateTransition, float ZoomTimeToGo)
	{
		GotoState('ActiveIronSights');
		AbortReload();
	}
}

function AdjustDamage(out int InDamage, class<DamageType> DamageType, Actor DamageCauser)
{
	local KFPerk InstigatorPerk;
	local byte BlockTypeIndex;
	local float DmgCauserDot;

	if (!bUsingSights)
	{
		return;
	}

	// don't apply block effects for teammates
	if (Instigator.IsSameTeam(DamageCauser.Instigator))
	{
		return;
	}

	if (CanBlockDamageType(DamageType, BlockTypeIndex))
	{
		if (ClassIsChildOf(DamageCauser.class, class'Projectile'))
		{
			// Projectile might be beyond/behind player, resulting in bad dot
			// Projectile won't have a velocity to check against, either
			// Assume velocity is the vector between projectile and instigator
			DmgCauserDot = Normal(DamageCauser.Instigator.Location - DamageCauser.Location) dot vector(Instigator.Rotation);
		}
		else
		{
			DmgCauserDot = Normal(DamageCauser.Location - Instigator.Location) dot vector(Instigator.Rotation);
		}

		if (DmgCauserDot > BlockAngleCos)
		{
			InDamage *= GetUpgradedBlockDamageMitigation(CurrentWeaponUpgradeIndex);
			ClientPlayBlockEffects(BlockTypeIndex);

			InstigatorPerk = GetPerk();
			if (InstigatorPerk != none)
			{
				InstigatorPerk.SetSuccessfullBlock();
			}
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
		if (ClassIsChildOf(DamageType, BlockTypes[Idx].DmgType))
		{
			out_Idx = Idx;
			return true;
		}
	}

	out_Idx = INDEX_NONE;
	return false;
}

/** Called on the server when successfully block/parry an attack */
unreliable client function ClientPlayBlockEffects(optional byte BlockTypeIndex=255)
{
	local AkBaseSoundObject Sound;
	local ParticleSystem PSTemplate;

	GetBlockEffects(BlockTypeIndex, Sound, PSTemplate);
	PlayLocalBlockEffects(Sound, PSTemplate);
}

/** Returns sound and particle system overrides using index into BlockTypes array */
simulated function GetBlockEffects(byte BlockIndex, out AKBaseSoundObject outSound, out ParticleSystem outParticleSys)
{
	outSound = BlockSound;
	outParticleSys = BlockParticleSystem;

	if (BlockIndex != 255)
	{
		if (BlockTypes[BlockIndex].BlockSound != None)
		{
			outSound = BlockTypes[BlockIndex].BlockSound;
		}
		if (BlockTypes[BlockIndex].BlockParticleSys != None)
		{
			outParticleSys = BlockTypes[BlockIndex].BlockParticleSys;
		}
	}
}

/** Called on the client when successfully block/parry an attack */
simulated function PlayLocalBlockEffects(AKBaseSoundObject Sound, ParticleSystem PSTemplate)
{
	local vector Loc;
	local rotator Rot;
	local ParticleSystemComponent PSC;

	if (Sound != None)
	{
		PlaySoundBase(Sound, true);
	}

	if (PSTemplate != None)
	{
		if (MySkelMesh.GetSocketWorldLocationAndRotation(BlockEffectsSocketName, Loc, Rot))
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

/*********************************************************************************************
 * Upgrades
 ********************************************************************************************/

static simulated function float GetUpgradedBlockDamageMitigation(int UpgradeIndex)
{
	return GetUpgradedStatValue(default.BlockDamageMitigation, EWUS_BlockDmgMitigation, UpgradeIndex);
}

defaultproperties
{
   BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Hammer'
   BlockParticleSystem=ParticleSystem'FX_Impacts_EMIT.FX_Block_melee_01'
   BlockEffectsSocketName="BlockEffect"
   BlockTypes(0)=(dmgType=Class'KFGame.KFDT_Bludgeon',BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Bullet_Impact_Metal')
   BlockTypes(1)=(dmgType=Class'KFGame.KFDT_Slashing',BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Bullet_Impact_Metal')
   BlockTypes(2)=(dmgType=Class'kfgamecontent.KFDT_Fire_HuskFireball',BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Bullet_Impact_Metal')
   BlockTypes(3)=(dmgType=Class'kfgamecontent.KFDT_Fire_HuskFlamethrower')
   BlockTypes(4)=(dmgType=Class'kfgamecontent.KFDT_BloatPuke')
   BlockTypes(5)=(dmgType=Class'kfgamecontent.KFDT_EvilDAR_Rocket',BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Bullet_Impact_Metal')
   BlockTypes(6)=(dmgType=Class'kfgamecontent.KFDT_EvilDAR_Laser',BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Bullet_Impact_Metal')
   BlockTypes(7)=(dmgType=Class'kfgamecontent.KFDT_DAR_EMPBlast',BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Bullet_Impact_Metal')
   BlockTypes(8)=(dmgType=Class'kfgamecontent.KFDT_Ballistic_PatMinigun',BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Bullet_Impact_Metal')
   BlockTypes(9)=(dmgType=Class'kfgamecontent.KFDT_Explosive_PatMissile',BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Bullet_Impact_Metal')
   BlockTypes(10)=(dmgType=Class'kfgamecontent.KFDT_Ballistic_HansAK12',BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Bullet_Impact_Metal')
   BlockTypes(11)=(dmgType=Class'kfgamecontent.KFDT_EMP_MatriarchTeslaBlast',BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Bullet_Impact_Metal')
   BlockTypes(12)=(dmgType=Class'kfgamecontent.KFDT_EMP_MatriarchPlasmaCannon')
   BlockTypes(13)=(dmgType=Class'kfgamecontent.KFDT_FleshpoundKing_ChestBeam')
   BlockDamageMitigation=0.500000
   IdleToIronSightAnim="Iron_Shield_Up"
   IronSightToIdleAnim="Iron_Shield_Down"
   BlockAngle=170.000000
   ExplosionActorClass=Class'KFGame.KFExplosionActorReplicated'
   ExplosionTemplate=KFGameExplosion'WEP_RiotShield_ARCH.Wep_G18_Shield_Impulse'
   PackageKey="RiotShield"
   FirstPersonMeshName="WEP_1P_RiotShield_MESH.Wep_1P_RiotShield_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_RiotShield_ANIM.Wep_1stP_RiotShield_Anim"
   PickupMeshName="WEP_3P_RiotShield_MESH.Wep_3P_RiotShield_Pickup"
   AttachmentArchetypeName="WEP_RiotShield_ARCH.Wep_G18_3P"
   MuzzleFlashTemplateName="WEP_RiotShield_ARCH.Wep_G18_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
   SingleFireSoundIndex=1
   InventorySize=8
   MagazineCapacity(0)=33
   MeshFOV=96.000000
   PlayerIronSightFOV=64.000000
   QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'WEP_UI_RiotShield_TEX.UI_WeaponSelect_RiotShield'
   SpareAmmoCapacity(0)=462
   InitialSpareMags(0)=4
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   BonesToLockOnEmpty(1)="RW_Bullets1"
   BonesToLockOnEmpty(2)="RW_Bullets2"
   BonesToLockOnEmpty(3)="RW_Barrel"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_G18.Play_WEP_G18_Auto_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_G18.Play_WEP_G18_Auto_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_G18.Play_WEP_G18_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_G18.Play_WEP_G18_Fire_1P_Single')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_G18.Play_WEP_G18_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_G18.Play_WEP_G18_Fire_1P_EndLoop')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'
   PlayerViewOffset=(X=10.000000,Y=0.000000,Z=-7.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_SMGBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_SMGBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_SMG_G18:MeleeHelper_0'
   maxRecoilPitch=100
   minRecoilPitch=75
   maxRecoilYaw=85
   minRecoilYaw=-85
   RecoilRate=0.045000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=100
   RecoilISMinYawLimit=65435
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   JoggingRecoilModifier=1.200000
   WalkingRecoilModifier=1.100000
   IronSightMeshFOVCompensationScale=1.650000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_SWAT'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.200000),(Stat=EWUS_Damage1,Scale=1.200000),(Add=1)))
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_G18'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_G18'
   FireInterval(0)=0.054550
   FireInterval(1)=0.054550
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.060000
   Spread(1)=0.015000
   InstantHitDamage(0)=28.000000
   InstantHitDamage(1)=28.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=25.000000
   InstantHitMomentum(3)=10000.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_G18'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_G18'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_G18Shield'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_SMGBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_SMGBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Riot Shield & Glock 18"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_SMGBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_SMGBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_SMG_G18"
   ObjectArchetype=KFWeap_SMGBase'KFGame.Default__KFWeap_SMGBase'
}
