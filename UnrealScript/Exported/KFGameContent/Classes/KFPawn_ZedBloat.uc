//=============================================================================
// KFPawn_ZedBloat
//=============================================================================
// Bloat
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedBloat extends KFPawn_Monster;

/** Socket used to attach puke effect */
var protected const name PukeSocketName;

/** How far away the bloat's vomit can damage enemies */
var protected const float VomitRange;

/** At a base level how much damage this zed's vomit will do */
var protected const int VomitDamage;

/** Any pawn in this range will take damage when the bloat explodes */
var protected const float ExplodeRange;

/** Set to TRUE when bloat has exploded */
var protected bool bHasExploded;

/** Projectile to spawn for puke mine attack */
var protected const class<KFProjectile> PukeMineProjectileClass;

/** Rotation offsets to use when spawning our 3 puke mins on death */
var protected array<rotator> DeathPukeMineRotations;

/** Number of puke mines to spawn when bloat is killed, as long as it wasn't obliterated */
var protected byte NumPukeMinesToSpawnOnDeath;

/** Pre-death location and rotation */
var protected vector OldLocation;
var protected rotator OldRotation;

/** Set to TRUE when a non-explosive hitzone was injured */
var transient protected bool bWasDismembered;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();

	// Set the number of puke mines we're allowed to spawn on death
	if( WorldInfo.Game != none )
	{
		NumPukeMinesToSpawnOnDeath = class<KFDifficulty_Bloat>(DifficultySettings).static.GetPukeMinesToSpawnOnDeath( self, WorldInfo.Game );
	}
}

/** Script AnimNotify which makes the Bloat begin to discharge vomit */
function ANIMNOTIFY_PukeAttack()
{
	Puke();
}

/** Guess */
function Puke()
{
	local Pawn P;
	local Vector PukeLocation, PukeDirection;
	local Rotator PukeRotation;
	local vector HitLocation, HitNormal, EndTrace, Momentum;
	local Actor HitActor;

	Mesh.GetSocketWorldLocationAndRotation( 'PukeSocket', PukeLocation, PukeRotation );

	PukeDirection  = Vector(Rotation);
	PukeDirection.Z = 0.f;
	foreach WorldInfo.AllPawns(class'Pawn', P, PukeLocation, VomitRange)
	{
		if( CanPukeOnTarget(P, PukeLocation, PukeDirection) )
		{
        	DealPukeDamage( P, PukeLocation );
		}
	}

	// Extra handling for fracture mesh actors, etc
	EndTrace = PukeLocation + PukeDirection*VomitRange;
	HitActor = Trace( HitLocation, HitNormal, EndTrace, PukeLocation, true, vect(10,10,10) );
	if( HitActor != none && HitActor.bCanBeDamaged && Pawn(HitActor) == none )
	{
		Momentum = EndTrace - PukeLocation;
		Momentum.Z = 0.f;
		Momentum = Normal(Momentum);
		HitActor.TakeDamage( VomitDamage, Controller, HitLocation, Momentum, class'KFDT_BloatPuke',, self );
	}
}

function DealPukeDamage( Pawn Victim, Vector Origin )
{
	local Vector VectToEnemy;

	VectToEnemy = Victim.Location - Origin;
	VectToEnemy.Z = 0.f;
	VectToEnemy = Normal( VectToEnemy );

	Victim.TakeDamage( GetRallyBoostDamage(VomitDamage), Controller, Victim.Location, VectToEnemy, class'KFDT_BloatPuke',, self );
}

function bool CanPukeOnTarget( Pawn PukeTarget, Vector PukeLocation, Vector PukeDirection)
{
	local Vector VectToEnemy;
	local Box ActorBox;

	if( PukeTarget != none )
	{
		VectToEnemy = PukeTarget.Location - PukeLocation;
		VectToEnemy.Z = 0.f;
		VectToEnemy = Normal( VectToEnemy );

		PukeTarget.GetComponentsBoundingBox( ActorBox );

		if( ( !PukeTarget.bWorldGeometry || PukeTarget.bCanBeDamaged ) &&
			ActorBox.Min.Z < PukeLocation.Z && VectToEnemy dot PukeDirection > 0.5f )  // (0.5 = vomitarc)
		{
			// use the bounding box for the world trace to account for meshes with way off center origins
			if( PukeTarget.FastTrace( (ActorBox.Min + ActorBox.Max) * 0.5, PukeLocation,, true) )
			{
				return true;
			}
		}
	}

	return false;
}

/** Override so you can always injure a bloats stomach and cause an explosion */
function bool CanInjureHitZone(class<DamageType> DamageType, int HitZoneIdx)
{
	if( HitExplosiveBone( HitZones[HitZoneIdx].BoneName ) )
	{
		return true;
	}

	if( super.CanInjureHitZone(DamageType, HitZoneIdx) )
	{
		bWasDismembered = true;
		return true;
	}

	return false;
}

/** Overridden to only return TRUE if a non-explosive bone was hit */
simulated function bool HasInjuredHitZones()
{
	return bWasDismembered || IsHeadless();
}

/** This pawn has died. */
function bool Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
	OldLocation = Location;
	OldRotation = Rotation;

	return super.Died( Killer, damageType, HitLocation );
}

// Override to deal explosive damage for the killing shot of an explosive bone
function TakeHitZoneDamage(float Damage, class<DamageType> DamageType, int HitZoneIdx, vector InstigatorLocation)
{
	local int HitZoneIndex;
	local name HitBoneName;

	super.TakeHitZoneDamage( Damage, DamageType, HitZoneIdx, InstigatorLocation );

	// Only deal explosive damage on the killing shot
	if( Role == ROLE_Authority && bPlayedDeath && !bHasExploded && TimeOfDeath == WorldInfo.TimeSeconds )
	{
		HitZoneIndex = HitFxInfo.HitBoneIndex;
		if ( HitZoneIndex != 255 && (InjuredHitZones & (1 << HitZoneIndex)) > 0 )	// INDEX_None -> 255 after byte conversion
		{
			HitBoneName = HitZones[HitZoneIndex].BoneName;
			if( HitExplosiveBone(HitBoneName) )
		    {
		    	DealExplosionDamage();
		    	bHasExploded = true;

		    	// Spawn some puke mines
		    	SpawnPukeMinesOnDeath();

		    	SoundGroupArch.PlayObliterationSound(self, false);
		    }
		}
	}
}

/** Check if the bone we hit can cause an explosion */
function bool HitExplosiveBone( name HitBoneName )
{
	local byte JointIndex;
	local KFCharacterInfo_Monster MonsterInfo;

    MonsterInfo = GetCharacterMonsterInfo();
	if ( MonsterInfo != none )
	{
		for( JointIndex = 0; JointIndex < MonsterInfo.GoreJointSettings.length; JointIndex++ )
		{
			if( MonsterInfo.GoreJointSettings[JointIndex].HitBoneName == HitBoneName &&
				MonsterInfo.GoreJointSettings[JointIndex].HitExplosionGore.length > 0 )
			{
				return true;
			}
		}
	}

	return false;
}

function DealExplosionDamage()
{
   	local Pawn P;
   	local vector HitLocation, HitNormal;
    local Actor HitActor;

	// @note - At low ranges CollidingActors (no VisibleCollidingActors) is okay,
	// but AllPawns is constant and much faster 99% of the time.
	foreach WorldInfo.AllPawns( class'Pawn', P, Location, ExplodeRange )
	{
		if ( P != Instigator )
		{
			// Trace to make sure there are no obstructions. ie acquiring someone through a wall
			HitActor = Instigator.Trace(HitLocation, HitNormal, P.Location, Location, true);
			if ( HitActor == none || HitActor == P )
			{
				DealPukeDamage(P, Location);
			}
		}
	}
}

/** Spawns a puke mine at the specified location and rotation. Network: SERVER */
function SpawnPukeMine( vector SpawnLocation, rotator SpawnRotation )
{
	local KFProjectile PukeMine;

	PukeMine = Spawn( PukeMineProjectileClass, ,, SpawnLocation, SpawnRotation,, true );
	if( PukeMine != none )
	{
		PukeMine.Init( vector(SpawnRotation) );
	}
}

/** Spawns several puke mines when dying */
function SpawnPukeMinesOnDeath()
{
	local int i;

	// Spawn puke mines
	while( NumPukeMinesToSpawnOnDeath > 0 && DeathPukeMineRotations.Length > 0 )
	{
		i = Rand( DeathPukeMineRotations.Length );
		SpawnPukeMine( OldLocation, Normalize(OldRotation + DeathPukeMineRotations[i]) );
		DeathPukeMineRotations.Remove( i, 1 );

		--NumPukeMinesToSpawnOnDeath;
	}
}

/**
 * Dialog
 **/

/** Returns (hardcoded) dialog event ID for when trader gives advice to player who was killed by this zed type */
static function int GetTraderAdviceID()
{
	return 41;//TRAD_AdviceBloat
}

defaultproperties
{
   VomitRange=350.000000
   VomitDamage=12
   ExplodeRange=500.000000
   PukeMineProjectileClass=Class'kfgamecontent.KFProj_BloatPukeMine'
   DeathPukeMineRotations(0)=(Pitch=7000,Yaw=10480,Roll=0)
   DeathPukeMineRotations(1)=(Pitch=7000,Yaw=32767,Roll=0)
   DeathPukeMineRotations(2)=(Pitch=7000,Yaw=-10480,Roll=0)
   bIsBloatClass=True
   MonsterArchPath="ZED_ARCH.ZED_Bloat_Archetype"
   HeadlessBleedOutTime=6.000000
   ParryResistance=3
   MinSpawnSquadSizeType=EST_Large
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
      BaseDamage=14.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_ZedWeak'
      MomentumTransfer=25000.000000
      MaxHitRange=250.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedBloat:MeleeHelper_0'
   DoshValue=17
   XPValues(0)=17.000000
   XPValues(1)=22.000000
   XPValues(2)=30.000000
   XPValues(3)=34.000000
   DamageTypeModifiers(0)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(0.350000))
   DamageTypeModifiers(1)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle',DamageScale=(0.350000))
   DamageTypeModifiers(2)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun',DamageScale=(0.250000))
   DamageTypeModifiers(3)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun',DamageScale=(0.350000))
   DamageTypeModifiers(4)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle',DamageScale=(0.300000))
   DamageTypeModifiers(5)=(DamageType=Class'KFGame.KFDT_Slashing',DamageScale=(0.300000))
   DamageTypeModifiers(6)=(DamageType=Class'KFGame.KFDT_Bludgeon',DamageScale=(0.300000))
   DamageTypeModifiers(7)=(DamageType=Class'KFGame.KFDT_Fire')
   DamageTypeModifiers(8)=(DamageType=Class'KFGame.KFDT_Microwave',DamageScale=(0.800000))
   DamageTypeModifiers(9)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=(0.500000))
   DamageTypeModifiers(10)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=(0.250000))
   DamageTypeModifiers(11)=(DamageType=Class'KFGame.KFDT_Toxic',DamageScale=(0.250000))
   DamageTypeModifiers(12)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_9mm',DamageScale=(0.650000))
   DamageTypeModifiers(13)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AR15',DamageScale=(0.400000))
   DamageTypeModifiers(14)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_HRGTeslauncher',DamageScale=(0.580000))
   DifficultySettings=Class'kfgamecontent.KFDifficulty_Bloat'
   BumpDamageType=Class'KFGame.KFDT_NPCBump_Large'
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
      Name="HeadshotAkComponent0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:HeadshotAkComponent0'
   End Object
   HeadShotAkComponent=HeadshotAkComponent0
   ShrinkEffectModifier=0.250000
   PawnAnimInfo=KFPawnAnimInfo'ZED_Bloat_ANIM.Bloat_AnimGroup'
   LocalizationKey="KFPawn_ZedBloat"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   HitZones(0)=(GoreHealth=75,DmgScale=1.000100)
   HitZones(1)=()
   HitZones(2)=()
   HitZones(3)=()
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
   HitZones(18)=(ZoneName="rknife",BoneName="RightForearm",GoreHealth=20,DmgScale=0.200000,Limb=BP_RightArm,SkinID=2)
   HitZones(19)=(ZoneName="lknife",BoneName="LeftForearm",GoreHealth=20,DmgScale=0.200000,Limb=BP_LeftArm,SkinID=2)
   PenetrationResistance=3.000000
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'KFGame.Default__KFPawn_Monster:Afflictions_0'
      FireFullyCharredDuration=3.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'KFGame.Default__KFPawn_Monster:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedBloat:Afflictions_0'
   IncapSettings(0)=(Duration=3.000000,Vulnerability=(2.500000))
   IncapSettings(1)=(Duration=3.700000,Vulnerability=(1.000000))
   IncapSettings(2)=(Cooldown=0.300000,Vulnerability=(2.000000))
   IncapSettings(3)=(Cooldown=0.100000,Vulnerability=(0.350000))
   IncapSettings(4)=(Cooldown=1.000000,Vulnerability=(0.400000))
   IncapSettings(5)=(Duration=1.500000,Cooldown=5.000000,Vulnerability=(0.500000,1.000000,0.500000,0.500000,0.500000))
   IncapSettings(6)=(Cooldown=20.500000,Vulnerability=(0.150000))
   IncapSettings(7)=(Duration=3.000000,Cooldown=5.500000,Vulnerability=(1.000000,2.000000,1.000000,1.000000))
   IncapSettings(8)=(Cooldown=1.000000,Vulnerability=(1.000000))
   IncapSettings(9)=(Duration=2.000000,Cooldown=3.000000,Vulnerability=(1.000000))
   IncapSettings(10)=(Duration=8.000000,Vulnerability=(4.000000))
   IncapSettings(11)=(Vulnerability=(1.000000))
   IncapSettings(12)=()
   IncapSettings(13)=(Vulnerability=(1.000000))
   PhysRagdollImpulseScale=1.500000
   KnockdownImpulseScale=2.000000
   SprintSpeed=210.000000
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
      SpecialMoveClasses(15)=Class'KFGame.KFSM_Evade'
      SpecialMoveClasses(16)=Class'kfgamecontent.KFSM_Evade_Fear'
      SpecialMoveClasses(17)=Class'KFGame.KFSM_Block'
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=None
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
      SpecialMoveClasses(37)=None
      SpecialMoveClasses(38)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedBloat:SpecialMoveHandler_0'
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
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedBloat:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=SecondaryWeaponAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_Monster:SecondaryWeaponAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="SecondaryWeaponAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:SecondaryWeaponAkSoundComponent'
   End Object
   SecondaryWeaponAkComponent=SecondaryWeaponAkSoundComponent
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
   Begin Object Class=AkComponent Name=PowerUpAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_Monster:PowerUpAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="PowerUpAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:PowerUpAkSoundComponent'
   End Object
   PowerUpAkComponent=PowerUpAkSoundComponent
   DamageRecoveryTimeHeavy=0.850000
   Mass=130.000000
   GroundSpeed=150.000000
   Health=405
   ControllerClass=Class'kfgamecontent.KFAIController_ZedBloat'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:KFPawnSkeletalMeshComponent'
      WireframeColor=(B=0,G=255,R=255,A=255)
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
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
      CollisionRadius=55.000000
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
   Components(8)=PowerUpAkSoundComponent
   Components(9)=SecondaryWeaponAkSoundComponent
   Components(10)=SprintAkComponent0
   Components(11)=HeadshotAkComponent0
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=50000,Yaw=20000,Roll=50000)
   Name="Default__KFPawn_ZedBloat"
   ObjectArchetype=KFPawn_Monster'KFGame.Default__KFPawn_Monster'
}
