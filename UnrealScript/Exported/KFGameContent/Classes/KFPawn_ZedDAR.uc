//=============================================================================
// KFPawn_ZedDAR
//=============================================================================
// Base pawn for evil DAR robots.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedDAR extends KFPawn_Monster
	abstract;

var protected KFAIController_ZedDAR MyDARController;

var class<KFProjectile> RangedProjectileClass;

var const name FiringSocketLName;
var const name FiringSocketRName;
var name FiringSocketName;

var protected transient bool bHasExploded;
/** Explosion template for backpack/suicide */
var protected KFGameExplosion ExplosionTemplate;

/** HitZoneIndex of backpack zone */
const ChestBombZoneIndex = 3;

function PossessedBy(Controller C, bool bVehicleTransition)
{
	Super.PossessedBy(C, bVehicleTransition);

	MyDARController = KFAIController_ZedDAR(C);
}

simulated function StartRangedAttack()
{
	local KFSM_RangedAttack RangedSM;

	if(MyDARController != none)
	{
		RangedSM = KFSM_RangedAttack(SpecialMoves[SpecialMove]);
		MyDARController.FireRangedAttack(RangedProjectileClass, RangedSM.GetFireOffset());
	}
}

function OnStackingAfflictionChanged(byte Id)
{
	Super.OnStackingAfflictionChanged(Id);

	if (MyKFAIC == none || !IsAliveAndWell())
	{
		return;
	}

	if (bEMPDisrupted)
	{
		if (IsDoingSpecialMove(SM_StandAndShootAttack))
		{
			EndSpecialMove();
		}
	}
}

function PlayHit(float Damage, Controller InstigatedBy, vector HitLocation, class<DamageType> damageType, vector Momentum, TraceHitInfo HitInfo)
{
	if (Damage == 0)
	{
		HitInfo.BoneName = 'KBArmor';

		//Passing 1 damage to minimize need to rewrite for a single pawn
		super.PlayHit(1, InstigatedBy, HitLocation, damageType, Momentum, HitInfo);
	}
	else
	{
		super.PlayHit(Damage, InstigatedBy, HitLocation, damageType, Momentum, HitInfo);
	}
}

function int GetHitZoneIndex(name BoneName)
{
	if (BoneName == 'KBArmor')
	{
		//Known arbitrary, hacking some things in place
		return OverrideArmorFXIndex;
	}

	return super.GetHitZoneIndex(BoneName);
}

simulated function KFSkinTypeEffects GetHitZoneSkinTypeEffects(int HitZoneIdx)
{
	if (HitZoneIdx == OverrideArmorFXIndex)
	{
		return CharacterArch.ImpactSkins[3];
	}
	return super.GetHitZoneSkinTypeEffects(HitZoneIdx);
}

function CauseHeadTrauma(float BleedOutTime = 5.f)
{
	// DAR doesn't bleed out from losing its head.
}

function ZedExplodeArmor(int ArmorZoneIdx, name ArmorZoneName)
{
	super.ZedExplodeArmor(ArmorZoneIdx, ArmorZoneName);
	if (MyDARController != none)
	{
		MyDARController.OnArmorLoss(ArmorZoneName);
	}
}

function SetSprinting(bool bNewSprintStatus)
{
	if (bNewSprintStatus)
	{
		if(CanDoSpecialMove(SM_SprintStart))
		{
			DoSpecialMove(SM_SprintStart, true,, SpecialMoves[SM_SprintStart].PackFlagsBase(self));
		}
	}
	else
	{
		super.SetSprinting(bNewSprintStatus);
	}
}

simulated function NotifySpecialMoveEnded(KFSpecialMove FinishedMove, ESpecialMove SMHandle)
{
	super.NotifySpecialMoveEnded(FinishedMove, SMHandle);

	if (SMHandle == SM_SprintStart)
	{
		// Finish sprinting setup
		super.SetSprinting(true);
	}
}

/** Plays hit effects on dead zeds, this includes dismemberment and obliteration */
simulated function PlayDeadHitEffects(vector HitLocation, vector HitDirection, int HitZoneIndex, name HitZoneName, name HitBoneName, class<KFDamageType> DmgType, optional bool bUseHitImpulse)
{
	local class<KFProj_PinningBullet> PinProjectileClass;
	local KFPawn DeadPawn;
	local KFGoreManager GoreManager;
	local bool bIsDismemberingHit;
	local bool bWasObliterated;

	// If ragdoll and gore is not allowed for dead bodies, check the time of death
	// to see when the pawn died, and skip if he has been dead for a while
	if (bAllowRagdollAndGoreOnDeadBodies || (WorldInfo.TimeSeconds - TimeOfDeath) <= 3.f )
	{
	// If this zone is 'injured' try to dismember it
	if ((InjuredHitZones & (1 << HitZoneIndex)) > 0 && !HitZones[HitZoneIndex].bPlayedInjury)
	{
		bIsDismemberingHit = PlayDismemberment(HitZoneIndex, DmgType, HitDirection);

		// If there was no dismemberment, explode head instead
		if (!bIsDismemberingHit && (InjuredHitZones & (1 << HZI_Head)) > 0)
		{
			PlayHeadAsplode();
			// Set bIsDismemberingHit to true to add an impulse to the neck
			bIsDismemberingHit = true;
		}
	}

	GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);
	// If the gore manager doesn't allow mutilation, then we don't allow anything other than basic effects.
	if (GoreManager.AllowMutilation() && (HitFxInfo.bObliterated || HitZoneIndex == 3) && (WorldInfo.TimeSeconds - TimeOfDeath) < 0.25f && !bUseDamageInflation)
	{
		bWasObliterated = true;
		bIsDismemberingHit = true;
		HandlePartialGoreAndGibs(DmgType, HitLocation, HitDirection, HitBoneName, true);

		GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);
		GoreManager.SpawnObliterationBloodEffect(self);
	}
	else
	{
		// Handle damage types from projectiles that can pin zeds to walls
		PinProjectileClass = DmgType.static.GetPinProjectileClass();
		if (PinProjectileClass != none)
		{
			DeadPawn = self;
			PinProjectileClass.static.CreatePin(DeadPawn, HitLocation, HitDirection, HitBoneName);
		}

		HandlePartialGoreAndGibs(DmgType, HitLocation, HitDirection, HitBoneName, false);
	}

	// Apply an impulse to attached limbs and ragdoll
	HandleRagdollImpulseEffects(HitLocation, HitDirection, HitZoneName, HitBoneName, DmgType, bIsDismemberingHit, bUseHitImpulse);
	}

	// Play blood effects. Apply more blood if this was a dismembering hit
	ApplyBloodDecals(HitZoneIndex, HitLocation, HitDirection, HitZoneName, HitBoneName, DmgType, bIsDismemberingHit, bWasObliterated);
}

function bool CanInjureHitZone(class<DamageType> DamageType, int HitZoneIdx)
{
	if (HitZoneIdx == ChestBombZoneIndex && (!bPlayedDeath || WorldInfo.TimeSeconds == TimeOfDeath))
	{
		return true;
	}

	return super.CanInjureHitZone(DamageType, HitZoneIdx);
}

/** Reliably play any gore effects related to a zone/limb being dismembered */
simulated function HitZoneInjured(optional int HitZoneIdx = INDEX_None)
{
	Super.HitZoneInjured(HitZoneIdx);

	// Server only since we use a replicated explosion actor
	if (Role == ROLE_Authority && HitZoneIdx == ChestBombZoneIndex)
	{
		TriggerExplosion(true);
	}
}

/** Called when husk backpack is exploded or when husk suicides */
simulated function TriggerExplosion(optional bool bIgnoreHumans)
{
	local KFExplosionActorReplicated ExploActor;
	local Controller DamageInstigator, OldController;
	local bool bExplodeOnDeath;

	bExplodeOnDeath = WorldInfo.TimeSeconds == TimeOfDeath;


	// Only living husks can explode... and only once
	if (!bHasExploded)
	{
		OldController = Controller;
		bHasExploded = true;

		if (Role == ROLE_Authority)
		{
			// explode using the given template
			ExploActor = Spawn(class'KFExplosionActorReplicated', self);
			if (ExploActor != None)
			{
				DamageInstigator = (bIgnoreHumans && LastHitBy != none && KFPlayerController(LastHitBy) != none) ? LastHitBy : MyKFAIC;
				ExploActor.InstigatorController = DamageInstigator;
				ExploActor.Instigator = self;

				// Force ourselves to get hit.  These settings are not replicated,
				// but they only really make a difference on the server anyway.
				ExploActor.Attachee = self;
				if (bIgnoreHumans)
				{
					ExplosionTemplate.ActorClassToIgnoreForDamage = class'KFPawn_Human';
				}
				else
				{
					ExplosionTemplate.ActorClassToIgnoreForDamage = none;
				}

				ExploActor.Explode(ExplosionTemplate, vect(0, 0, 1));
			}

			// Make sure we're dead!
			if (!bPlayedDeath || bExplodeOnDeath)
			{
				TakeRadiusDamage(DamageInstigator, 10000, ExplosionTemplate.DamageRadius, ExplosionTemplate.MyDamageType, ExplosionTemplate.MomentumTransferScale, Location, true, self);
			}
		}

		OnExploded(OldController);
	}
}

/** Overriden in subclasses.  Determines if we should explode on death in specific game modes */
function bool WeeklyShouldExplodeOnDeath()
{
	return !bHasExploded;
}

/** Do any explosion death-related actions */
simulated function OnExploded(Controller SuicideController);

/**
 * Return true if this pawn is ok with having the input head bone be broken
 *
 * @param	BoneName	the head bone to check to see if we all it to break.
 */
simulated function bool ShouldAllowHeadBoneToBreak(name BoneName)
{
    return true;
}

defaultproperties
{
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedDAR:ExploTemplate0'
   MinSpawnSquadSizeType=EST_Medium
   RepArmorPct(0)=255
   RepArmorPct(1)=255
   ArmorZoneStatus=3
   PreviousArmorZoneStatus=3
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
      BaseDamage=10.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_ZedWeak'
      MomentumTransfer=25000.000000
      MaxHitRange=180.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedDAR:MeleeHelper_0'
   DoshValue=17
   XPValues(0)=15.000000
   XPValues(1)=20.000000
   XPValues(2)=27.000000
   XPValues(3)=31.000000
   DamageTypeModifiers(0)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(1.050000))
   DamageTypeModifiers(1)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle',DamageScale=(1.050000))
   DamageTypeModifiers(2)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun',DamageScale=(1.200000))
   DamageTypeModifiers(3)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun')
   DamageTypeModifiers(4)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle')
   DamageTypeModifiers(5)=(DamageType=Class'KFGame.KFDT_Slashing',DamageScale=(1.250000))
   DamageTypeModifiers(6)=(DamageType=Class'KFGame.KFDT_Bludgeon',DamageScale=(1.250000))
   DamageTypeModifiers(7)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(1.500000))
   DamageTypeModifiers(8)=(DamageType=Class'kfgamecontent.KFDT_Microwave',DamageScale=(3.250000))
   DamageTypeModifiers(9)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=(2.500000))
   DamageTypeModifiers(10)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=(0.850000))
   DamageTypeModifiers(11)=(DamageType=Class'KFGame.KFDT_Toxic',DamageScale=(0.050000))
   Begin Object Class=AkComponent Name=SprintAkComponent0 Archetype=AkComponent'KFGame.Default__KFPawn_Monster:SprintAkComponent0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="SprintAkComponent0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:SprintAkComponent0'
   End Object
   SprintAkComponent=SprintAkComponent0
   Begin Object Class=AkComponent Name=HeadshotAkComponent0 Archetype=AkComponent'KFGame.Default__KFPawn_Monster:HeadshotAkComponent0'
      BoneName="head"
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="HeadshotAkComponent0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:HeadshotAkComponent0'
   End Object
   HeadShotAkComponent=HeadshotAkComponent0
   StartSprintingSound=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Thruster_Start'
   SprintLoopingSound=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Thruster_LP'
   StopSprintingSound=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Thruster_Stop'
   ArmorInfoClass=Class'kfgamecontent.KFZedArmorInfo_EvilDAR'
   OverrideArmorFXIndex=200
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bEnableAimOffset=True
   HitZones(0)=(GoreHealth=350,DmgScale=1.001000)
   HitZones(1)=()
   HitZones(2)=()
   HitZones(3)=(BoneName="Spine1",DmgScale=3.500000,SkinID=2)
   HitZones(4)=()
   HitZones(5)=()
   HitZones(6)=()
   HitZones(7)=()
   HitZones(8)=()
   HitZones(9)=()
   HitZones(10)=()
   HitZones(11)=()
   HitZones(12)=()
   HitZones(13)=()
   HitZones(14)=()
   HitZones(15)=()
   HitZones(16)=()
   HitZones(17)=()
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'KFGame.Default__KFPawn_Monster:Afflictions_0'
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'KFGame.Default__KFPawn_Monster:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedDAR:Afflictions_0'
   IncapSettings(0)=(Vulnerability=(2.500000))
   IncapSettings(1)=(Cooldown=6.000000,Vulnerability=(0.500000))
   IncapSettings(2)=(Vulnerability=(1.000000))
   IncapSettings(3)=(Cooldown=0.200000,Vulnerability=(0.900000))
   IncapSettings(4)=(Cooldown=1.000000,Vulnerability=(1.000000))
   IncapSettings(5)=(Duration=1.500000,Cooldown=5.000000,Vulnerability=(0.500000,2.000000,0.500000,0.500000,2.000000))
   IncapSettings(6)=(Cooldown=20.500000,Vulnerability=(0.050000))
   IncapSettings(7)=(Duration=3.000000,Cooldown=5.500000,Vulnerability=(1.000000,1.000000,2.000000,1.000000,1.000000))
   IncapSettings(8)=(Cooldown=1.000000,Vulnerability=(1.000000))
   IncapSettings(9)=(Duration=4.200000,Cooldown=1.000000,Vulnerability=(0.900000))
   IncapSettings(10)=(Duration=4.000000,Cooldown=6.500000,Vulnerability=(3.000000))
   IncapSettings(11)=(Vulnerability=(0.010000))
   SprintSpeed=600.000000
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=Class'KFGame.KFSM_MeleeAttack'
      SpecialMoveClasses(2)=Class'KFGame.KFSM_DoorMeleeAttack'
      SpecialMoveClasses(3)=Class'KFGame.KFSM_GrappleCombined'
      SpecialMoveClasses(4)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(10)=None
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=None
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=Class'KFGame.KFSM_StartSprintAnim'
      SpecialMoveClasses(21)=None
      SpecialMoveClasses(22)=None
      SpecialMoveClasses(23)=None
      SpecialMoveClasses(24)=None
      SpecialMoveClasses(25)=None
      SpecialMoveClasses(26)=None
      SpecialMoveClasses(27)=None
      SpecialMoveClasses(28)=None
      SpecialMoveClasses(29)=None
      SpecialMoveClasses(30)=None
      SpecialMoveClasses(31)=None
      SpecialMoveClasses(32)=None
      SpecialMoveClasses(33)=None
      SpecialMoveClasses(34)=None
      SpecialMoveClasses(35)=None
      SpecialMoveClasses(36)=None
      SpecialMoveClasses(37)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedDAR:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_Monster:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_Monster:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedDAR:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_Monster:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_Monster:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   Mass=85.000000
   GroundSpeed=170.000000
   Health=775
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:KFPawnSkeletalMeshComponent'
      WireframeColor=(B=0,G=255,R=255,A=255)
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bUpdateKinematicBonesFromAnimation=False
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      bChartDistanceFactor=True
      ReplacementPrimitive=None
      RBChannel=RBCC_Pawn
      RBDominanceGroup=20
      bOwnerNoSee=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      CollideActors=True
      BlockZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,Pawn=True,Vehicle=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-86.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=2500.000000
      bAllowPerObjectShadows=True
      TickGroup=TG_DuringAsyncWork
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPawn_Monster:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=36.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPawn_Monster:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPawn_Monster:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPawn_Monster:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPawn_Monster:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPawn_Monster:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   Components(8)=SprintAkComponent0
   Components(9)=HeadshotAkComponent0
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=50000,Yaw=66000,Roll=50000)
   Name="Default__KFPawn_ZedDAR"
   ObjectArchetype=KFPawn_Monster'KFGame.Default__KFPawn_Monster'
}
