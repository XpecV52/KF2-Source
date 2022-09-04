//=============================================================================
// KFWeap_Edged_IonThruster
//=============================================================================
// Basic ion beam melee weapon
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Edged_IonThruster extends KFWeap_MeleeBase;

/** The current amount of charge/heat this weapon has */
var repnotify float UltimateCharge;
/** The highest amount of charge/heat this weapon can have*/
var float MaxUltimateCharge;
/** How often the DecayAmount is removed from a non-fully charged weapon */
var float DecayInterval;
/** How much charge to remove every <DecayInterval> seconds*/
var float DecayAmount;

/** How much charge to gain when hitting with each Firemode */
var array<float> UltimateChargePerHit;
/** How much charge to gain with a successful block */
var float UltimateChargePerBlock;
/** How much charge to gain with a successful parry */
var float UltimateChargePerParry;

/** Name of the special anim used for the ultimate attack */
var name UltimateAttackAnim;

/** Hitbox for the normal attack */
var array<MeleeHitBoxInfo> DefaultHitboxChain;
/** Hitbox for the ultimate attack */
var array<MeleeHitBoxInfo> UltimateHitboxChain;

/** Hit range for the default attack */
var int DefaultMaxHitRange;
/** Hit range for the ultimate attack, generated from DefaultMaxHitrange and UltimateRangeScale*/
var int UltimateMaxHitRange;
/** Relative length of the ultimate hitbox compared to the default hitbox*/
var float UltimateRangeScale;
/** Width of the ultimate hotbox */
var float UltimateWidthScale;
/** Extent of the default hitbox, defaults to 0*/
var vector DefaultHitboxExtent;
/** Extent of the Ultimate Hitbox*/
var vector UltimateHitboxExtent;

/** Particle system that plays constantly on the weapon */
var transient KFParticleSystemComponent PersistentBasePSC;
var const ParticleSystem PersistentBaseEffect;

var int PanelCount;
var KFParticleSystemComponent PersistentPanelPSC[12]; // Size here should equal PanelCount
var const ParticleSystem PersistentPanelEffect;

/** Particle system that plays when the weapon is fully charged */
var transient KFParticleSystemComponent ChargedPSC;
var const ParticleSystem ChargedEffect;

/** Sound loop to play when the weapon is not fully charged */
var AkEvent IdleSoundLoop;
var AkEvent IdleSoundStop;
/** Sound loop to play when the weapon is fully charged */
var AkEvent ChargedSoundLoop;
var AkEvent ChargedSoundStop;

/* Light that is applied to the blade and the bone to attach to*/
var PointLightComponent BladeLight;
var Name LightAttachBone;

replication
{
	if (bNetDirty)
		UltimateCharge;
}

simulated event ReplicatedEvent(name VarName)
{
	switch (VarName)
	{
	case nameof(UltimateCharge):
		AdjustChargeFX();
		break;
	default:
		super.ReplicatedEvent(VarName);
	};
}

simulated event PreBeginPlay()
{
	Super.PreBeginPlay();

	SetupHitboxes();
	//Decay time removed due to feedback
	//SetTimer(DecayInterval, true, nameof(TimeR_UltimateChargeDecay));
}

/** Create box the default and ultimate hitboxes */
simulated function SetupHitboxes()
{
	SetupChain(DefaultHitboxChain, DefaultMaxHitRange, DefaultHitboxExtent);
	UltimateMaxHitRange = UltimateRangeScale * DefaultMaxHitRange;
	UltimateHitboxExtent.X = UltimateWidthScale;
	UltimateHitboxExtent.Y = UltimateWidthScale;
	UltimateHitboxExtent.Z = UltimateWidthScale;
	SetupChain(UltimateHitboxChain, UltimateMaxHitRange, UltimateHitboxExtent);

	// set the default hitbox as the active hitbox
	MeleeAttackHelper.HitboxExtent = DefaultHitboxExtent;
	MeleeAttackHelper.SetHitboxChain(DefaultHitboxChain);
	MeleeAttackHelper.SetMeleeRange(DefaultMaxHitRange);
}

/** Programmatically generate the hitbox chain */
simulated function SetupChain(out array<MeleeHitBoxInfo> OutputChain, int InputHitRange, vector HitboxExtent)
{
	local vector BoneAxis;
	local float Dist;
	local MeleeHitBoxInfo TempHitBoxInfo;

	BoneAxis = vect(0, 0, 1);
	for (Dist = InputHitRange; Dist > 0; Dist -= MeleeAttackHelper.HitboxSpacing)
	{
		TempHitBoxInfo.BoneOffset = (Dist - HitboxExtent.X) * BoneAxis;
		OutputChain.AddItem(TempHitBoxInfo);
	}
}

/** Lose charge over time */
simulated function Timer_UltimateChargeDecay()
{
	// as long as not already fully charged
	if (UltimateCharge != MaxUltimateCharge)
	{
		AdjustUltimateCharge(DecayAmount * -1);
	}
}

simulated function string GetSpecialAmmoForHUD()
{
	return int(UltimateCharge)$"%";
}

/** When this weapon hits with an attack */
simulated function NotifyMeleeCollision(Actor HitActor, optional vector HitLocation)
{
	local KFPawn_Monster Victim;

	if (HitActor.bWorldGeometry)
	{
		return;
	}

	Victim = KFPawn_Monster(HitActor);
	if ( Victim == None || (Victim.bPlayedDeath && (WorldInfo.TimeSeconds - Victim.TimeOfDeath) > 0.f) )
	{
		return;
	}

	if(Victim != none)
	{
		// hit something with a melee attack so gain charge
		AdjustUltimateCharge(UltimateChargePerHit[CurrentFireMode]);
	}
}

/** When this weapon parries an attack */
simulated function NotifyAttackParried()
{
	AdjustUltimateCharge(UltimateChargePerParry);
}

/** When this weapon blocks an attack */
simulated function NotifyAttackBlocked()
{
	AdjustUltimateCharge(UltimateChargePerBlock);
}

/** Whether the weapon is fully charged */
simulated function bool IsFullyCharged()
{
	return UltimateCharge >= MaxUltimateCharge;
}

/** Increase or decrease ultimate charge as long as not already fully charged*/
simulated function AdjustUltimateCharge(float AdjustAmount)
{
	if (!IsFullyCharged())
	{
		UltimateCharge = FClamp(UltimateCharge + AdjustAmount, 0.f, MaxUltimateCharge);
		AdjustChargeFX();
	}
}

simulated function AdjustChargeFX()
{
	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		KFPawn(Instigator).SetWeaponComponentRTPCValue("Weapon_Charge", UltimateCharge / MaxUltimateCharge);
		Instigator.SetRTPCValue('Weapon_Charge', UltimateCharge / MaxUltimateCharge);

		if (IsFullyCharged())
		{
			ActivatePSC(ChargedPSC, ChargedEffect, 'Hand_FX_Start_R');
			AdjustLoopingWeaponSound(true);
		}
	}
}

/** Determine which looping idle/charged sound to play */
simulated function AdjustLoopingWeaponSound(bool bShouldPlay)
{
	local KFPawn InstigatorPawn;

	if (Instigator != none)
	{
		InstigatorPawn = KFPawn(Instigator);
		if (InstigatorPawn != none)
		{
			if (bShouldPlay)
			{
				if (IsFullyCharged())
				{
					InstigatorPawn.PlayWeaponSoundEvent(IdleSoundStop);
					InstigatorPawn.PlayWeaponSoundEvent(ChargedSoundLoop);
				}
				else
				{
					InstigatorPawn.PlayWeaponSoundEvent(ChargedSoundStop);
					InstigatorPawn.PlayWeaponSoundEvent(IdleSoundLoop);
				}
			}
			else
			{
				InstigatorPawn.PlayWeaponSoundEvent(IdleSoundStop);
				InstigatorPawn.PlayWeaponSoundEvent(ChargedSoundStop);
			}
		}
	}
}

// OLD WAY (heavyfire firemode)
//simulated state MeleeHeavyAttacking
//{
//	simulated event BeginState(Name PreviousStateName)
//	{
//		Super.BeginState(PreviousStateName);
//
//		if (IsFullyCharged())
//		{
//			// perform ultimate
//			SendToFiringState(CUSTOM_FIREMODE);
//		}
//	}
//}

// NEW WAY (reload firemode)
simulated function StartFire(byte FireModeNum)
{
	if (FireModeNum == RELOAD_FIREMODE && IsFullyCharged())
	{
		FireModeNum = CUSTOM_FIREMODE;
	}

	super.StartFire(FireModeNum);
}

/** State for the fully charged Ultimate attack */
simulated state UltimateAttackState extends MeleeHeavyAttacking
{
	simulated function bool TryPutDown() { return false; }

	simulated event BeginState(Name PreviousStateName)
	{
		super.BeginState(PreviousStateName);

		// stop the player from interrupting the super attack with another attack
		StartFireDisabled = true;

		// swap to the larger ultimate hitbox
		MeleeAttackHelper.HitboxExtent = UltimateHitboxExtent;
		MeleeAttackHelper.SetHitboxChain(UltimateHitboxChain);
		MeleeAttackHelper.SetMeleeRange(UltimateMaxHitRange);
		MeleeAttackHelper.bUseDirectionalMelee = false;
		MeleeAttackHelper.bHasChainAttacks = false;
	}

	simulated function name GetMeleeAnimName(EPawnOctant AtkDir, EMeleeAttackType AtkType)
	{
		// use the special attack anim
		return UltimateAttackAnim;
	}

	simulated event EndState(Name NextStateName)
	{
		super.EndState(NextStateName);

		// consume charge
		UltimateCharge = 0;
		AdjustLoopingWeaponSound(true);
		KFPawn(Instigator).SetWeaponComponentRTPCValue("Weapon_Charge", 0.0f);
		Instigator.SetRTPCValue('Weapon_Charge', 0.0f);

		// disable "charged" vfx
		if (ChargedPSC != none)
		{
			ChargedPSC.DeactivateSystem();
		}

		// player can now interrupt attacks with other attacks again
		StartFireDisabled = false;

		// swap back to the default hitbox
		MeleeAttackHelper.HitboxExtent = DefaultHitboxExtent;
		MeleeAttackHelper.SetHitboxChain(DefaultHitboxChain);
		MeleeAttackHelper.SetMeleeRange(DefaultMaxHitRange);
		MeleeAttackHelper.bUseDirectionalMelee = true;
		MeleeAttackHelper.bHasChainAttacks = true;
	}
}

simulated function ActivatePSC(out KFParticleSystemComponent OutPSC, ParticleSystem ParticleEffect, name SocketName)
{
	if (MySkelMesh != none)
	{
		MySkelMesh.AttachComponentToSocket(OutPSC, SocketName);
		OutPSC.SetFOV(MySkelMesh.FOV);
	}
	else
	{
		AttachComponent(OutPSC);
	}

	OutPSC.ActivateSystem();

	if (OutPSC != none)
	{
		OutPSC.SetTemplate(ParticleEffect);
		OutPSC.SetDepthPriorityGroup(SDPG_Foreground);
	}
}

simulated state WeaponEquipping
{
	// when picked up, start the persistent sound and particles
	simulated event BeginState(Name PreviousStateName)
	{
		local int i;
		local name PSCSocketName;

		super.BeginState(PreviousStateName);
		ActivatePSC(PersistentBasePSC, PersistentBaseEffect, 'Hand_FX_Start_R');

		for (i = 0; i < PanelCount; i++)
		{
			PSCSocketName = 'RW_HeatShield';
			if (i+1 < 10)
			{
				PSCSocketName = Name(PSCSocketName$'0');
			}
			PSCSocketName = Name(PSCSocketName$(i+1));

			ActivatePSC(PersistentPanelPSC[i], PersistentPanelEffect, PSCSocketName);
		}

		AdjustLoopingWeaponSound(true);

		if (MySkelMesh != none)
		{
			MySkelMesh.AttachComponentToSocket(BladeLight, LightAttachBone);
			BladeLight.SetEnabled(true);
		}
	}
}

simulated state Inactive
{
	// when dropped, destroyed, etc, play the stop on the persistent sound
	simulated event BeginState(Name PreviousStateName)
	{
		local int i;

		super.BeginState(PreviousStateName);

		if (PersistentBasePSC != none)
		{
			PersistentBasePSC.DeactivateSystem();
		}

		for (i = 0; i < PanelCount; i++)
		{
			PersistentPanelPSC[i].DeactivateSystem();
		}

		AdjustLoopingWeaponSound(false);

		BladeLight.SetEnabled(false);
	}
}

simulated function DetachWeapon()
{
	AdjustLoopingWeaponSound(false);
	Super.DetachWeapon();
}

simulated state WeaponPuttingDown
{
	simulated event BeginState(Name PreviousStateName)
	{
		super.BeginState(PreviousStateName);
		AdjustLoopingWeaponSound(false);
	}
}

simulated state WeaponAbortEquip
{
	simulated event BeginState(Name PreviousStateName)
	{
		super.BeginState(PreviousStateName);
		AdjustLoopingWeaponSound(false);
	}
}

simulated event bool HasAmmo(byte FireModeNum, optional int Amount)
{
	if (FireModeNum == CUSTOM_FIREMODE)
	{
		return IsFullyCharged();
	}

	return super.HasAmmo(FireModeNum, Amount);
}

defaultproperties
{
   MaxUltimateCharge=100.000000
   DecayInterval=1.000000
   DecayAmount=1.000000
   UltimateChargePerHit(0)=1.000000
   UltimateChargePerHit(1)=0.000000
   UltimateChargePerHit(2)=0.000000
   UltimateChargePerHit(3)=1.000000
   UltimateChargePerHit(4)=0.000000
   UltimateChargePerHit(5)=3.000000
   UltimateChargePerHit(6)=0.000000
   UltimateChargePerBlock=1.000000
   UltimateChargePerParry=5.000000
   UltimateAttackAnim="Super_Attack"
   DefaultMaxHitRange=240
   UltimateRangeScale=2.000000
   UltimateWidthScale=70.000000
   PersistentBaseEffect=ParticleSystem'WEP_Ion_Sword_EMIT.FX_ION_Idle_Heat_Base_01'
   PanelCount=12
   Begin Object Class=KFParticleSystemComponent Name=PanelPSC0
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="PanelPSC0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PersistentPanelPSC(0)=PanelPSC0
   Begin Object Class=KFParticleSystemComponent Name=PanelPSC1
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="PanelPSC1"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PersistentPanelPSC(1)=PanelPSC1
   Begin Object Class=KFParticleSystemComponent Name=PanelPSC2
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="PanelPSC2"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PersistentPanelPSC(2)=PanelPSC2
   Begin Object Class=KFParticleSystemComponent Name=PanelPSC3
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="PanelPSC3"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PersistentPanelPSC(3)=PanelPSC3
   Begin Object Class=KFParticleSystemComponent Name=PanelPSC4
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="PanelPSC4"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PersistentPanelPSC(4)=PanelPSC4
   Begin Object Class=KFParticleSystemComponent Name=PanelPSC5
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="PanelPSC5"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PersistentPanelPSC(5)=PanelPSC5
   Begin Object Class=KFParticleSystemComponent Name=PanelPSC6
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="PanelPSC6"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PersistentPanelPSC(6)=PanelPSC6
   Begin Object Class=KFParticleSystemComponent Name=PanelPSC7
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="PanelPSC7"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PersistentPanelPSC(7)=PanelPSC7
   Begin Object Class=KFParticleSystemComponent Name=PanelPSC8
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="PanelPSC8"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PersistentPanelPSC(8)=PanelPSC8
   Begin Object Class=KFParticleSystemComponent Name=PanelPSC9
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="PanelPSC9"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PersistentPanelPSC(9)=PanelPSC9
   Begin Object Class=KFParticleSystemComponent Name=PanelPSC10
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="PanelPSC10"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PersistentPanelPSC(10)=PanelPSC10
   Begin Object Class=KFParticleSystemComponent Name=PanelPSC11
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="PanelPSC11"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PersistentPanelPSC(11)=PanelPSC11
   PersistentPanelEffect=ParticleSystem'WEP_Ion_Sword_EMIT.FX_ION_Idle_Heat_Panel_01'
   ChargedEffect=ParticleSystem'WEP_Ion_Sword_EMIT.FX_ION_Charged_Ring_01'
   IdleSoundLoop=AkEvent'WW_WEP_MEL_IonThruster.Play_WEP_IonThruster_Handling_Idle_LP'
   IdleSoundStop=AkEvent'WW_WEP_MEL_IonThruster.Stop_WEP_IonThruster_Handling_Idle_LP'
   ChargedSoundLoop=AkEvent'WW_WEP_MEL_IonThruster.Play_WEP_IonThruster_Handling_Idle_Super_LP'
   ChargedSoundStop=AkEvent'WW_WEP_MEL_IonThruster.Stop_WEP_IonThruster_Handling_Idle_Super_LP'
   Begin Object Class=PointLightComponent Name=BladePointLight
      Radius=128.000000
      FalloffExponent=4.000000
      Brightness=0.125000
      LightColor=(B=85,G=150,R=250,A=255)
      CastShadows=False
      CastStaticShadows=False
      bCastPerObjectShadows=False
      LightingChannels=(Outdoor=True)
      Name="BladePointLight"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   BladeLight=BladePointLight
   LightAttachBone="Hand_FX_Start_R"
   ParryStrength=5
   ParryDamageMitigationPercent=0.400000
   BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
   ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
   PackageKey="Ion_Sword"
   FirstPersonMeshName="WEP_1P_Ion_Sword_MESH.Wep_1stP_Ion_Sword_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Ion_Sword_ANIM.Wep_1stP_Ion_Sword_Anim"
   PickupMeshName="WEP_3P_Ion_Sword_MESH.Wep_3rdP_Ion_Sword_Pickup"
   AttachmentArchetypeName="WEP_Ion_Sword_ARCH.Wep_Ion_Thruster_3P"
   InventorySize=8
   GroupPriority=125.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Ion_Sword_TEX.UI_WeaponSelect_IonSword'
   PlayerViewOffset=(X=2.000000,Y=0.000000,Z=0.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
      bUseDirectionalMelee=True
      bHasChainAttacks=True
      MeleeImpactCamShakeScale=0.030000
      WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Edged_IonThruster:MeleeHelper_0'
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Berserker'
   FiringStatesArray(6)="UltimateAttackState"
   WeaponFireTypes(6)=EWFT_Custom
   InstantHitDamage(0)=92.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=85.000000
   InstantHitDamage(4)=()
   InstantHitDamage(5)=152.000000
   InstantHitDamage(6)=400.000000
   InstantHitMomentum(6)=100000.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Slashing_IonThruster'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Piercing_IonThrusterStab'
   InstantHitDamageTypes(4)=()
   InstantHitDamageTypes(5)=Class'kfgamecontent.KFDT_Slashing_IonThrusterHeavy'
   InstantHitDamageTypes(6)=Class'kfgamecontent.KFDT_Slashing_IonThrusterSpecial'
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
   ItemName="Ion Thruster"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Edged_IonThruster"
   ObjectArchetype=KFWeap_MeleeBase'KFGame.Default__KFWeap_MeleeBase'
}
