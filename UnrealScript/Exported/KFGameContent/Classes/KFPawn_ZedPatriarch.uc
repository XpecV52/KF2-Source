//=============================================================================
// KFPawn_ZedPatriarch
//=============================================================================
// Patriarch Boss Pawn Class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedPatriarch extends KFPawn_MonsterBoss;

struct Patriarch_MortarTarget
{
	var KFPawn TargetPawn;
	var vector TargetVelocity;
};

/*********************************************************************************************
* Content
**********************************************************************************************/

/** Events for looping ambient breathing like Darth Vader */
var AkEvent AmbientBreathingEvent;
var AkEvent LowHealthAmbientBreathingEvent;

/** Gameplay-driven Ak objects, instanced at runtime */
var AkBaseSoundObject CloakedLoop;
var AkBaseSoundObject CloakedLoopEnd;

/** Materials used for cloaking/visible states */
var MaterialInstanceConstant BodyMaterial;
var MaterialInstanceConstant BodyAltMaterial;
var MaterialInstanceConstant SpottedMaterial;
var MaterialInstanceConstant CloakedBodyMaterial;
var MaterialInstanceConstant CloakedBodyAltMaterial;

/** Secondary body material, used in the same way BodyMIC is */
var MaterialInstanceConstant BodyAltMIC;

/** Skel control for spinning the minigun barrel */
var KFSkelControl_SpinBone BarrelSpinSkelCtrl;

/** Skel control for gun arm tracking */
var SkelControlLookAt GunTrackingSkelCtrl;

/** Healing syringes */
var array<StaticMeshComponent> HealingSyringeMeshes;
var array<MaterialInstanceConstant> HealingSyringeMICs;
var int CurrentSyringeMeshNum;
var int ActiveSyringe;
var float SyringeInjectTimeDuration;
var float SyringeInjectTimeRemaining;

/** Mech colors for each phase */
var LinearColor MechColors[4];

/** Mech color when dead */
var LinearColor DeadMechColor;

/** Boil colors for each phase */
var LinearColor BoilColors[4];

/** Boil color when dead */
var LinearColor DeadBoilColor;

/** Enables or disables boil and boil light pulsing */
var bool bPulseBoils;

/** The rate at which the boils pulse */
var float BoilPulseRate;

/** The current boil pulse brightness */
var float BoilPulseAccum;

/** Light above the boils on the arm to cast around it */
var float BoilLightBrightness[4];
var name BoilLightSocketName;
var transient PointLightComponent BoilLightComponent;

/** Effect played upon cloaking/uncloaking */
var ParticleSystem CloakFX;
var Name CloakFXSocketName;

/** Cloak damage shimmer */
var float CloakShimmerAmount;
var float LastCloakShimmerTime;

/** Battle phase damage FX */
var name BattleDamageFXSocketName_LeftHip;
var name BattleDamageFXSocketName_LeftKnee;
var name BattleDamageFXSocketName_LeftFoot;
var name BattleDamageFXSocketName_LeftArm;
var name BattleDamageFXSocketName_Weapon;
var name BattleDamageFXSocketName_LowerSpike;
var name BattleDamageFXSocketName_UpperSpike;
var name BattleDamageFXSocketName_BackSpike;

var ParticleSystemComponent BattleDamagePSC_LeftHip;
var ParticleSystemComponent BattleDamagePSC_LeftKnee;
var ParticleSystemComponent BattleDamagePSC_LeftFoot;
var ParticleSystemComponent BattleDamagePSC_LeftArm;
var ParticleSystemComponent BattleDamagePSC_Weapon;
var ParticleSystemComponent BattleDamagePSC_LowerSpike;
var ParticleSystemComponent BattleDamagePSC_UpperSpike;
var ParticleSystemComponent BattleDamagePSC_BackSpike;

var ParticleSystem BattleDamageFX_Sparks_LowDmg;
var ParticleSystem BattleDamageFX_Sparks_MidDmg;
var ParticleSystem BattleDamageFX_Sparks_HighDmg;
var ParticleSystem BattleDamageFX_Tentacle_LowDmg;
var ParticleSystem BattleDamageFX_Tentacle_MidDmg;
var ParticleSystem BattleDamageFX_Tentacle_HighDmg;
var ParticleSystem BattleDamageFX_Smoke_HighDmg;

/*********************************************************************************************
* General Gameplay
**********************************************************************************************/

/** Info for patriarch battle phases */
struct PatriarchBattlePhaseInfo
{
    /** Whether or not to desire sprinting behavior this battle phase */
    var             bool            bAllowedToSprint;
    /** How long to wait before each sprinting attack */
    var 			float  			SprintCooldownTime;
    /** Whether or not we can do the tentacle grab attack this battle phase */
    var             bool            bCanTentacleGrab;
    /**	Cooldown time before the next attempt to do a tentacle grab */
    var 			float 			TentacleGrabCooldownTime;
    /** Whether or not we can use our missile launcher attack this battle phase */
    var             bool			bCanUseMissiles;
    /** Cooldown time before the next attempt to do a missile attack */
    var 			float 			MissileAttackCooldownTime;
    /** Whether or not we can use our mortar attack this battle phase */
    var             bool			bCanUseMortar;
    /** Cooldown time before the next attempt to do a mortar attack */
    var 			float 			MortarAttackCooldownTime;
    /** Whether or not we can do a mortar barrage attack this battle phase */
    var 			bool 			bCanDoMortarBarrage;
    /** Whether or not we can do a charge attack this battle phase */
    var 			bool 			bCanChargeAttack;
    /** Cooldown time before the next attempt to do a charge attack */
    var 			float 			ChargeAttackCooldownTime;
	/** Maximum number of attacks to do before ending rage mode */
	var 			int 			MaxRageAttacks;
	/** Damage done by tentacle attack this battle phase */
	var 			int 			TentacleDamage;
    /** How much time since the last successful melee attack before activating minigun this battle phase */
    var 			float 			MinigunAttackCooldownTime;
    /** Whether or not we can summon minions this battle phase */
    var 			bool 			bCanSummonMinions;
    /** Heal amount (MaxHealth x HealAmount) per difficulty level */
    var 			array<float> 	HealAmounts;

	structdefaultproperties
	{
		bAllowedToSprint=false
	}
};

/** Previous battle phase, for turning FX on/off */
var int LastFXBattlePhase;

/** Configuration for the Patriarch battle phases */
var array<PatriarchBattlePhaseInfo> BattlePhases;

/** Cooldown time before the next attempt to sprint */
var float SprintCooldownTime;

/**	Cooldown time before the next attempt to do a tentacle grab */
var float TentacleGrabCooldownTime;

/** Cooldown time before the next attempt to do a missile attack */
var float MissileAttackCooldownTime;

/** Cooldown time before the next attempt to do a mortar attack */
var float MortarAttackCooldownTime;

/** Cooldown time before the next attempt to do a charge attack */
var float ChargeAttackCooldownTime;

/** How much time since the last successful melee attack before activating minigun this battle phase */
var float MinigunAttackCooldownTime;

/** Maximum number of attacks to do before ending rage mode */
var int MaxRageAttacks;

/** Damage done by tentacle attack this battle phase */
var int TentacleDamage;

/** Damagetype used for tentacle attacks */
var class<KFDamageType> TentacleDamageType;

/** Damagetype used when bumping other zeds */
var class<KFDamageType> HeavyBumpDamageType;

/** Used for the minigun's fan fire attack */
var bool bSprayingFire;

/** Turns barrel spin skel controller on and off */
var bool bSpinBarrels;

/** Minigun barrel spin rotation rate */
var float BarrelSpinSpeed;

/** Allows gun tracking on the server if server aim precision is necessary (player-controlled, etc) */
var protected const bool bUseServerSideGunTracking;

/** Turns gun tracking on and off */
var bool bGunTracking;

/** The target to use for tracking */
var repnotify Actor GunTarget;

/** The projectile class used for the missile attack */
var class<KFProj_Missile_Patriarch> MissileProjectileClass;

/** The projectile class used for the mortar attack */
var class<KFProj_Missile_Patriarch> MortarProjectileClass;

/** Targets chosen for mortar attack */
var array<Patriarch_MortarTarget> MortarTargets;

/** Mortar distance values */
var float MinMortarRangeSQ;
var float MaxMortarRangeSQ;

/*********************************************************************************************
* Flee and heal mode
**********************************************************************************************/

/** Modifier to scale up sprint speed if fleeing */
var float FleeSprintSpeedModifier;

/** Percent cloaked [0-1.0] */
var float CloakPercent;

/** Cloak speeds */
var float CloakSpeed;
var float DeCloakSpeed;

/** Fleeing and attempting to heal */
var repnotify bool bInFleeAndHealMode;

/** Whether we've healed this battle phase or not */
var bool bHealedThisPhase;

replication
{
    if( bNetDirty )
        bInFleeAndHealMode, GunTarget;
}

/**
* Check on various replicated data and act accordingly.
*/
simulated event ReplicatedEvent( name VarName )
{
	switch( VarName )
	{
		case nameOf(bIsCloakingSpottedByTeam):
			SetGameplayMICParams();
			break;

		case nameOf(bIsCloaking):
			ClientCloakingStateUpdated();
			break;

		case nameOf(GunTarget):
			SetGunTracking( GunTarget != none );
			break;
	}

	Super.ReplicatedEvent( VarName );
}

simulated event PostBeginPlay()
{
    Super.PostBeginPlay();

    // Give Patriarch his weapon
    AddDefaultInventory();

    // Set weapon state to active
    if( Weapon != none )
    {
    	Weapon.GotoState('Active');
    }

    // Set fire anim blend rates
    if( WeaponAttachment != none )
    {
    	WeaponAttachment.ShootBlendInTime = 0.f;
    	WeaponAttachment.ShootBlendOutTime = 0.01f;
    }

    // PostBeginPlay is called before we do our first audio update, so we need to set a valid initial position so the ambient sound works right
    AmbientAkComponent.CachedObjectPosition = Location;
    SetPawnAmbientSound( AmbientBreathingEvent );
}

/** Overloaded to support loading the alternate body mic */
simulated function SetCharacterArch( KFCharacterInfoBase Info, optional bool bForce )
{
	local int i;

	super.SetCharacterArch( Info );

    // Set our secondary material, attach our healing syringes
	if( WorldInfo.NetMode != NM_DedicatedServer && Mesh != None )
	{
		BodyAltMIC = Mesh.CreateAndSetMaterialInstanceConstant( 1 );

		// Attach healing syringes
		for( i = 0; i < 3; ++i )
		{
			HealingSyringeMICs[i] = HealingSyringeMeshes[i].CreateAndSetMaterialInstanceConstant( 0 );
			HealingSyringeMeshes[i].SetShadowParent( Mesh );
			Mesh.AttachComponent( HealingSyringeMeshes[i], Name("SyringeAttach0"$i+1) );
		}

		// Attach boil light
		Mesh.AttachComponentToSocket( BoilLightComponent, BoilLightSocketName );
		UpdateBattlePhaseLights();
		BoilLightComponent.SetEnabled( true );
	}
}

/** Cache skel controls */
simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	Super.PostInitAnimTree(SkelComp);

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		BarrelSpinSkelCtrl = KFSkelControl_SpinBone(SkelComp.FindSkelControl('BarrelSpin'));
		BarrelSpinSkelCtrl.SetSkelControlActive( false );
	}

	if( WorldInfo.NetMode != NM_DedicatedServer || bUseServerSideGunTracking )
	{
		GunTrackingSkelCtrl = SkelControlLookAt(SkelComp.FindSkelControl('GunTracking'));
		GunTrackingSkelCtrl.SetSkelControlActive( false );
	}
}

/** Called from Possessed event when this controller has taken control of a Pawn */
function PossessedBy( Controller C, bool bVehicleTransition )
{
    Super.PossessedBy( C, bVehicleTransition );

    SetPhaseCooldowns( 0 );
}

/** Damagetype to use when bumping other zeds */
function class<KFDamageType> GetBumpAttackDamageType()
{
    return HeavyBumpDamageType;
}

/**
 * Turn on or off flee and heal mode
 * Network: ALL
 */
simulated function SetFleeAndHealMode( bool bNewFleeAndHealStatus )
{
    bInFleeAndHealMode = bNewFleeAndHealStatus;

    if( Role == ROLE_Authority )
    {
        if( bNewFleeAndHealStatus )
        {
			SprintSpeed = default.SprintSpeed * FleeSprintSpeedModifier;
            SetTimer(0.25f, true, nameof(FleeAndHealBump));
        }
        else
        {
			SprintSpeed = default.SprintSpeed;
            ClearTimer(nameof(FleeAndHealBump));
        }

        bForceNetUpdate = true;
    }

    if( !bNewFleeAndHealStatus )
    {
        bHealedThisPhase = false;
    }
}

/** Summon some children */
function SummonChildren()
{
    local KFAIWaveInfo MinionWave;
    local KFGameInfo MyKFGameInfo;

	MyKFGameInfo = KFGameInfo(WorldInfo.Game);

    // Force frustration mode on
    MyKFGameInfo.GetAIDirector().bForceFrustration = true;

    // Select the correct batch of zeds to spawn during this battle phase
    if( CurrentBattlePhase == 1 )
    {
        MinionWave = SummonWaves[MyKFGameInfo.GameDifficulty].PhaseOneWave;
    }
    else if( CurrentBattlePhase == 2 )
    {
        MinionWave = SummonWaves[MyKFGameInfo.GameDifficulty].PhaseTwoWave;
    }
    else if( CurrentBattlePhase == 3 )
    {
        MinionWave = SummonWaves[MyKFGameInfo.GameDifficulty].PhaseThreeWave;
    }

    if( MinionWave != none )
    {
		if( MyKFGameInfo.SpawnManager != none )
		{
			MyKFGameInfo.SpawnManager.LeftoverSpawnSquad.Length = 0;
		 	MyKFGameInfo.SpawnManager.SummonBossMinions( MinionWave.Squads, NumMinionsToSpawn );
		}
	}
}


/** Heal animnotify to move the syringe */
simulated function ANIMNOTIFY_GrabSyringe()
{
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		CurrentSyringeMeshNum = CurrentBattlePhase-2;
		Mesh.DetachComponent( HealingSyringeMeshes[CurrentSyringeMeshNum] );
		Mesh.AttachComponent( HealingSyringeMeshes[CurrentSyringeMeshNum], 'Syringe' );
	}
}

/** Syringe spawn notification */
simulated function ANIMNOTIFY_SpawnedKActor( KFKActorSpawnable NewKActor, AnimNodeSequence AnimSeqInstigator )
{
	local MaterialInstanceConstant SyringeMIC;

	// Make sure we have a valid current syringe
	if( CurrentSyringeMeshNum < 0 )
	{
		return;
	}

	SyringeMIC = NewKActor.StaticMeshComponent.CreateAndSetMaterialInstanceConstant( 0 );
	SyringeMIC.SetScalarParameterValue( 'Scalar_GlowIntensity', 0.02f + fClamp(0.98f*SyringeInjectTimeRemaining/SyringeInjectTimeDuration, 0.f, 0.98f) );
	NewKActor.StaticMeshComponent.SetLightingChannels(HealingSyringeMeshes[CurrentSyringeMeshNum].LightingChannels);
	NewKActor.StaticMeshComponent.bCastDynamicShadow = true;
	NewKActor.StaticMeshComponent.bAllowPerObjectShadows = true;
	NewKActor.StaticMeshComponent.PerObjectShadowCullDistance = 4000;

	// Remove the mesh from the hand and clear all references
	Mesh.DetachComponent( HealingSyringeMeshes[CurrentSyringeMeshNum] );
	HealingSyringeMeshes[CurrentSyringeMeshNum] = none;
	HealingSyringeMICs[CurrentSyringeMeshNum] = none;
	CurrentSyringeMeshNum = -1;
}

/** Spawns a KActor and deletes the syringe mesh, called on death */
simulated function BreakOffSyringe( int SyringeNum )
{
	local KFKActorSpawnable NewKActor;
	local vector BoneLoc, LinearVel, AngularVel;
	local quat BoneQuat;
	local rotator BoneRot;
	local Name SyringeBoneName;

	SyringeBoneName = Name( "SyringeAttach0"$SyringeNum+1 );
	BoneLoc = Mesh.GetBoneLocation( SyringeBoneName );
	BoneQuat = Mesh.GetBoneQuaternion( SyringeBoneName );
	BoneRot = QuatToRotator( BoneQuat );

	NewKActor = Spawn( class'KFKActorSpawnable', self,, BoneLoc, BoneRot + HealingSyringeMeshes[SyringeNum].Rotation );
	if ( NewKActor != None )
	{
		NewKActor.StaticMeshComponent.SetStaticMesh( HealingSyringeMeshes[SyringeNum].StaticMesh );
		NewKActor.LifeSpan = 30.f * fClamp( WorldInfo.DestructionLifetimeScale, 0.1f, 2.f );

		// Set initial linear velocity
		LinearVel.X = RandRange( -300, -100 );
		LinearVel.Y = RandRange( -300, -100 );
		NewKActor.StaticMeshComponent.SetRBLinearVelocity( Velocity + QuatRotateVector(BoneQuat, LinearVel) );

		// Set initial angular velocity
		AngularVel.X = RandRange( 3000, 6000 );
		AngularVel.Y = RandRange( 3000, 6000 );
		AngularVel.Z = RandRange( 3000, 6000 );
		NewKActor.StaticMeshComponent.SetRBAngularVelocity( QuatRotateVector(BoneQuat, AngularVel) );
		NewKActor.StaticMeshComponent.WakeRigidBody();

		// Copy display settings from attachment mesh
		NewKActor.StaticMeshComponent.SetLightingChannels( HealingSyringeMeshes[SyringeNum].LightingChannels );
		NewKActor.StaticMeshComponent.bCastDynamicShadow = true;
		NewKActor.StaticMeshComponent.bAllowPerObjectShadows = true;
		NewKActor.StaticMeshComponent.PerObjectShadowCullDistance = 4000;
	}

	// Remove the mesh from the hand and clear all references
	Mesh.DetachComponent( HealingSyringeMeshes[SyringeNum] );
	HealingSyringeMeshes[SyringeNum] = none;
	HealingSyringeMICs[SyringeNum] = none;
}

/** When fleeing, plow through any other zeds */
function FleeAndHealBump()
{
    local KFPawn KFP;
    local vector ClosestPoint;
    local float ClosestDist;
    local KFAIController_ZedPatriarch KFAICP;

    if( MyKFAIC == none || MyKFAIC.Enemy == none || MyKFAIC.RouteGoal == none || IsDoingSpecialMove(SM_Heal) )
    {
        return;
    }

	KFAICP = KFAIController_ZedPatriarch(MyKFAIC);
    foreach WorldInfo.AllPawns( class'KFPawn', KFP, Location, 300.f )
    {
        // Heavy bump guys that are between us and our prey!
        if( KFP != self && KFP.IsAliveAndWell() )
        {
            ClosestDist = PointDistToSegment( KFP.Location, Location, KFAICP.RouteGoal.Location, ClosestPoint );

            if( ClosestDist < GetCollisionRadius() * 1.5 )
            {
                KFAICP.DoHeavyBump( KFP, Normal(KFP.Location - Location) );
            }
        }
    }
}

/** If true Patriarch will favor sprinting in this phase. Even if it's false he may sprint under certain circumstances,
    but when it's true he'll try and sprint almost all the time */
function bool DesireSprintingInThisPhase()
{
    return BattlePhases[CurrentBattlePhase - 1].bAllowedToSprint;
}

/** Increment Patriarch to the next battle phase */
function IncrementBattlePhase()
{
    CurrentBattlePhase++;
    bHealedThisPhase = true;

    SetPhaseCooldowns( CurrentBattlePhase - 1 );
    OnBattlePhaseChanged();

    bForceNetUpdate = true;
}

/** Sets various material scalars and FX based on the phase of battle */
simulated function OnBattlePhaseChanged()
{
    if( WorldInfo.NetMode == NM_DedicatedServer || Health <= 0 )
    {
        return;
    }

	UpdateBattlePhaseLights();
	UpdateBattlePhaseMaterials();
	UpdateBattlePhaseFX();
}

/** Set the correct phase based cooldown for this battle phase */
function SetPhaseCooldowns( int BattlePhase )
{
    SprintCooldownTime = BattlePhases[BattlePhase].SprintCooldownTime;
    TentacleGrabCooldownTime = BattlePhases[BattlePhase].TentacleGrabCooldownTime;
    MinigunAttackCooldownTime = BattlePhases[BattlePhase].MinigunAttackCooldownTime;
    MissileAttackCooldownTime = BattlePhases[BattlePhase].MissileAttackCooldownTime;
	ChargeAttackCooldownTime = BattlePhases[BattlePhase].ChargeAttackCooldownTime;
	TentacleDamage = BattlePhases[BattlePhase].TentacleDamage;
	MaxRageAttacks = BattlePhases[BattlePhase].MaxRageAttacks;
}

/** Starts the weapon cooldown time */
function StartWeaponCooldown()
{
	if( Controller != none && KFAIController_ZedPatriarch(Controller) != none )
	{
		KFAIController_ZedPatriarch(Controller).LastSuccessfulAttackTime = WorldInfo.TimeSeconds;
	}
}

/** Used by AI to determine if we can charge attack this phase */
function bool CanChargeAttack()
{
	return !bIsCloaking && BattlePhases[CurrentBattlePhase-1].bCanChargeAttack;
}

/** Used by AI to determine if we can tentacle grab this phase */
function bool CanTentacleGrab()
{
	return BattlePhases[CurrentBattlePhase-1].bCanTentacleGrab;
}

/** Used by AI to determine if we can missile attack this phase */
function bool CanMissileAttack()
{
	return BattlePhases[CurrentBattlePhase-1].bCanUseMissiles;
}

/** Used by AI to determine if we can mortar attack this phase */
function bool CanMortarAttack()
{
	return BattlePhases[CurrentBattlePhase-1].bCanUseMortar;
}

function bool CanDoMortarBarrage()
{
	return BattlePhases[CurrentBattlePhase-1].bCanDoMortarBarrage;
}

/** Toggles barrel spinning on and off */
simulated function SpinMinigunBarrels( bool bEnableSpin )
{
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		bSpinBarrels = bEnableSpin;

		if( bEnableSpin && BarrelSpinSkelCtrl != none )
		{
			BarrelSpinSkelCtrl.SetSkelControlActive( true );
		}
	}
}

/** Toggles gun tracking on and off */
simulated function SetGunTracking( bool bEnableTracking )
{
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		bGunTracking = bEnableTracking;
		GunTrackingSkelCtrl.SetSkelControlActive( bEnableTracking );
	}

	if( Role == ROLE_Authority )
	{
		if( bEnableTracking && Controller != None && Controller.Enemy != none )
		{
			GunTarget = Controller.Enemy;
		}
		else
		{
			GunTarget = none;
		}
	}

	bForceNetUpdate = true;
}

/** Overloaded to use the minigun muzzle location */
simulated event Vector GetWeaponStartTraceLocation(optional Weapon CurrentWeapon)
{
	local vector SocketLoc;

	Mesh.GetSocketWorldLocationAndRotation( 'LeftMuzzleFlash', SocketLoc );
	return SocketLoc;
}

/** Overloaded to support spray fire for minigun */
simulated function Rotator GetAdjustedAimFor( Weapon W, vector StartFireLoc )
{
	local vector SocketLoc, EndTrace;
	local rotator ActualAimRot, SocketRot;

	// If spraying, use the rotation of the muzzle flash bone
	if( bSprayingFire )
	{
		Mesh.GetSocketWorldLocationAndRotation( 'LeftMuzzleFlash', SocketLoc, SocketRot );
		return SocketRot;
	}

	ActualAimRot = super.GetAdjustedAimFor( W, StartFireLoc );
	EndTrace = StartFireLoc + vector(ActualAimRot) * W.GetTraceRange();

	Mesh.GetSocketWorldLocationAndRotation( 'LeftMuzzleFlash', SocketLoc, SocketRot );

	// If the rotation of the barrel is not close enough to believably make the shot, use its rotation instead
	if( vector(SocketRot) dot Normal(EndTrace - StartFireLoc) < 0.96f )
	{
		return SocketRot;
	}

	return ActualAimRot;
}

/** Retrieves the projectile class used for the missile attack. Called from SpecialMove */
function class<KFProj_Missile_Patriarch> GetMissileClass()
{
	return MissileProjectileClass;
}

/** Retrieves the aim direction and target location for each missile. Called from SpecialMove */
function GetMissileAimDirAndTargetLoc( int MissileNum, vector MissileLoc, rotator MissileRot, out vector AimDir, out vector TargetLoc )
{
	local vector X,Y,Z;
	local Pawn EnemyPawn;
	local int EnemyIndex;
	local KFAIController_ZedPatriarch MyPatController;

	// Get the best location to aim at
	EnemyPawn = Controller.Enemy;
	MyPatController = KFAIController_ZedPatriarch( Controller );
	if( MyPatController != none && !MyPatController.CanSee(EnemyPawn) )
	{
		EnemyIndex = MyPatController.RecentlySeenEnemyList.Find( 'TrackedEnemy', KFPawn(EnemyPawn) );
		if( EnemyIndex != INDEX_NONE )
		{
			TargetLoc = MyPatController.RecentlySeenEnemyList[EnemyIndex].LastVisibleLocation;
		}
		else
		{
			EnemyIndex = MyPatController.HiddenEnemies.Find( 'TrackedEnemy', KFPawn(EnemyPawn) );
			if( EnemyIndex != INDEX_NONE )
			{
				TargetLoc = MyPatController.HiddenEnemies[EnemyIndex].LastVisibleLocation;
			}
			else
			{
				TargetLoc = EnemyPawn.Location;
			}
		}
	}
	else
	{
		TargetLoc = EnemyPawn.Location;
	}

	// Try to aim somewhat for the feet
	TargetLoc += (vect(0,0,-1) * (EnemyPawn.GetCollisionHeight() * 0.25f));

	// If no LOS, aim higher
	if( !FastTrace(TargetLoc, MissileLoc,, true) )
	{
		TargetLoc = EnemyPawn.Location + (vect(0,0,1) * EnemyPawn.BaseEyeHeight);
	}

	// Nudge the spread a tiny bit to make the missiles less concentrated on a single point
	GetAxes( MissileRot, X,Y,Z );
	AimDir = Normal( (TargetLoc - MissileLoc) + (Z*6.f) );
}

/** Retrieves the projectile class used for the mortar attack. Called from SpecialMove */
function class<KFProj_Missile_Patriarch> GetMortarClass()
{
	return MortarProjectileClass;
}

/** Tries to set our mortar targets */
function bool CollectMortarTargets( optional bool bInitialTarget, optional bool bForceInitialTarget )
{
	local int NumTargets, i;
	local KFPawn KFP;
	local float TargetDistSQ;
	local vector MortarVelocity, MortarStartLoc, TargetLoc, TargetProjection;
	local KFAIController_ZedPatriarch MyPatController;

	MyPatController = KFAIController_ZedPatriarch( Controller );
   	MortarStartLoc = Location + vect(0,0,1)*GetCollisionHeight();
    NumTargets = bInitialTarget ? 0 : 1;
	for( i = 0; i < MyPatController.HiddenEnemies.Length; ++i )
	{
		KFP = MyPatController.HiddenEnemies[i].TrackedEnemy;
		if( !KFP.IsAliveAndWell() || MortarTargets.Find('TargetPawn', KFP) != INDEX_NONE )
		{
			continue;
		}

		// Make sure target is in range
		TargetLoc = KFP.Location + (vect(0,0,-1)*(KFP.GetCollisionHeight()*0.8f));
		TargetProjection = MortarStartLoc - TargetLoc;
		TargetDistSQ = VSizeSQ( TargetProjection );
		if( TargetDistSQ > MinMortarRangeSQ && TargetDistSQ < MaxMortarRangeSQ )
		{
			TargetLoc += Normal(TargetProjection)*KFP.GetCollisionRadius();
			if( SuggestTossVelocity(MortarVelocity, TargetLoc, MortarStartLoc, MortarProjectileClass.default.Speed, 500.f, 1.f, vect(0,0,0),, GetGravityZ()*0.8f) )
			{
				// Make sure upward arc path is clear
				if( !FastTrace(MortarStartLoc + (Normal(vect(0,0,1) + (Normal(TargetLoc - MortarStartLoc)*0.9f))*fMax(VSize(MortarVelocity)*0.55f, 800.f)), MortarStartLoc,, true) )
				{
					continue;
				}

				MortarTargets.Insert( NumTargets, 1 );
				MortarTargets[NumTargets].TargetPawn = KFP;
				MortarTargets[NumTargets].TargetVelocity = MortarVelocity;

				if( bInitialTarget || NumTargets == 2 )
				{
					return true;
				}

				NumTargets++;
			}
		}
	}

	// Fall back on visible enemies
	if( (bForceInitialTarget || !bInitialTarget) && NumTargets < 2 && MyPatController.RecentlySeenEnemyList.Length > 0 )
	{
		for( i = 0; i < MyPatController.RecentlySeenEnemyList.Length && NumTargets < 3; ++i )
		{
			KFP = MyPatController.RecentlySeenEnemyList[i].TrackedEnemy;
			if( !KFP.IsAliveAndWell() || MortarTargets.Find('TargetPawn', KFP) != INDEX_NONE )
			{
				continue;
			}

			// Make sure target is in range
			TargetLoc = KFP.Location + (vect(0,0,-1)*(KFP.GetCollisionHeight()*0.8f));
			TargetProjection = MortarStartLoc - TargetLoc;
			TargetDistSQ = VSizeSQ( TargetProjection );
			if( TargetDistSQ > MinMortarRangeSQ && TargetDistSQ < MaxMortarRangeSQ )
			{
				TargetLoc += Normal(TargetProjection)*KFP.GetCollisionRadius();
				if( SuggestTossVelocity(MortarVelocity, TargetLoc, MortarStartLoc, MortarProjectileClass.default.Speed, 500.f, 1.f, vect(0,0,0),, GetGravityZ()*0.8f) )
				{
					// Make sure upward arc path is clear
					if( !FastTrace(MortarStartLoc + (Normal(vect(0,0,1) + (Normal(TargetLoc - MortarStartLoc)*0.9f))*fMax(VSize(MortarVelocity)*0.55f, 800.f)), MortarStartLoc,, true) )
					{
						continue;
					}

					MortarTargets.Insert( NumTargets, 1 );
					MortarTargets[NumTargets].TargetPawn = KFP;
					MortarTargets[NumTargets].TargetVelocity = MortarVelocity;

					if( bInitialTarget )
					{
						return true;
					}

					NumTargets++;
				}
			}
		}
	}

	return false;
}

/** Allows pawn to do any pre-mortar attack prep */
function PreMortarAttack();

/** Clears mortar targets */
function ClearMortarTargets()
{
	MortarTargets.Length = 0;
}

/** Returns the mortar target for the associated projectile number */
function Patriarch_MortarTarget GetMortarTarget( int MortarNum )
{
	if( MortarNum >= MortarTargets.Length )
	{
		return MortarTargets[Rand(MortarTargets.Length)];
	}

	return MortarTargets[MortarNum];
}

/** Retrieves the aim direction and target location for each mortar. Called from SpecialMove */
function GetMortarAimDirAndTargetLoc( int MissileNum, vector MissileLoc, rotator MissileRot, out vector AimDir, out vector TargetLoc, out float MissileSpeed )
{
	local Patriarch_MortarTarget MissileTarget;
	local vector X,Y,Z;

	GetAxes( MissileRot, X,Y,Z );

	// Each missile can possibly target a separate player
	MissileTarget = GetMortarTarget(MissileNum);
	
	// Aim at the feet
	TargetLoc = MissileTarget.TargetPawn.Location + (vect(0,0,-1)*MissileTarget.TargetPawn.GetCollisionHeight());

	// Nudge the spread a tiny bit to make the missiles less concentrated on a single point
	AimDir = Normal( vect(0,0,1) + Normal(MissileTarget.TargetVelocity) );

	// Set the missile speed
	MissileSpeed = VSize( MissileTarget.TargetVelocity );
}

/** Update our barrel spin skel control */
simulated event Tick( float DeltaTime )
{
	local float MinCloakPct;
	local float Intensity, BoilPulseSin;
	local LinearColor ActualBoilColor;

	super.Tick( DeltaTime );

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		// Spin the minigun barrels
		if( BarrelSpinSkelCtrl != none )
		{
			if( bSpinBarrels )
			{
				if( BarrelSpinSpeed < 300000.f )
				{
					BarrelSpinSpeed = fMin(BarrelSpinSpeed + (DeltaTime * 200000.f), 500000.f);
					BarrelSpinSkelCtrl.RotationRate.Roll = BarrelSpinSpeed;
				}
			}
			else if( BarrelSpinSpeed > 0.f )
			{
				BarrelSpinSpeed = fMax(BarrelSpinSpeed - (DeltaTime * 150000.f), 0.f);
				BarrelSpinSkelCtrl.RotationRate.Roll = BarrelSpinSpeed;

				if( BarrelSpinSpeed == 0.f )
				{
					BarrelSpinSkelCtrl.SetSkelControlActive( false );
				}
			}
		}

		// Update syringe material scalars
		if( ActiveSyringe > -1 && HealingSyringeMICs[ActiveSyringe] != none && SyringeInjectTimeRemaining > 0.f )
		{
			SyringeInjectTimeRemaining -= DeltaTime;
			Intensity = fClamp( SyringeInjectTimeRemaining/SyringeInjectTimeDuration, 0.f, 1.f );
			HealingSyringeMICs[ActiveSyringe].SetScalarParameterValue( 'Scalar_GlowIntensity', Intensity );
		}
		else
		{
			ActiveSyringe = -1;
		}

		if( bPulseBoils && !bIsCloaking )
		{
			if( BoilPulseAccum > 1.f )
			{
				BoilPulseAccum = -1.f;
			}
			BoilPulseSin = Abs( BoilPulseAccum );
			ActualBoilColor = BoilColors[3] * BoilPulseSin;
			BodyAltMIC.SetVectorParameterValue( 'Vector_GlowColor', ActualBoilColor );
			BoilPulseAccum += DeltaTime * BoilPulseRate;
		}
		else
		{
			BoilPulseSin = 1.f;
		}

		if( BodyMIC.Parent != SpottedMaterial )
		{
			MinCloakPct = GetMinCloakPct();

			if( !bIsCloaking )
			{
				if( CloakPercent < 1.0f )
				{
					CloakPercent = fMin( CloakPercent + DeltaTime*DeCloakSpeed, 1.f );

					if( CloakPercent == 1.0f )
					{
						SetGameplayMICParams();
					}
					else
					{
						BodyMIC.SetScalarParameterValue( 'Transparency', CloakPercent );
						BodyAltMIC.SetScalarParameterValue( 'Transparency', CloakPercent );
					}

					if( bPulseBoils )
					{
						BoilLightComponent.SetLightProperties( (BoilLightBrightness[CurrentBattlePhase-1] * BoilPulseSin) * CloakPercent );
					}

					UpdateHealingSyringeTransparency();
				}
				else if( bPulseBoils )
				{
					BoilLightComponent.SetLightProperties( BoilLightBrightness[CurrentBattlePhase-1] * BoilPulseSin );
				}
			}
			else if( CloakPercent > MinCloakPct )
			{
				CloakPercent = fMax( CloakPercent - DeltaTime*CloakSpeed, MinCloakPct );
				BodyMIC.SetScalarParameterValue( 'Transparency', CloakPercent );
				BodyAltMIC.SetScalarParameterValue( 'Transparency', CloakPercent );

				if( BoilLightComponent.bEnabled )
				{
					BoilLightComponent.SetLightProperties( BoilLightBrightness[CurrentBattlePhase-1] * CloakPercent );
				}

				UpdateHealingSyringeTransparency();

				if( CloakPercent == 0.f && BoilLightComponent.bEnabled )
				{
					BoilLightComponent.SetEnabled( false );
					Mesh.DetachComponent( BoilLightComponent );
				}
			}
		}
	}

	// Update our gun tracking skeletal controller
	UpdateGunTrackingSkelCtrl( DeltaTime );	
}

/** Updates our gun tracking skeletal control */
simulated function UpdateGunTrackingSkelCtrl( float DeltaTime )
{
	// Track the player with the gun arm
	if( GunTrackingSkelCtrl != none )
	{
		if( bGunTracking && GunTarget != None )
		{
			GunTrackingSkelCtrl.DesiredTargetLocation = GunTarget.Location;
			GunTrackingSkelCtrl.InterpolateTargetLocation( DeltaTime );
		}
		else
		{
			GunTrackingSkelCtrl.SetSkelControlActive( false );
		}
	}	
}

/** Gets the minimum cloaked amount based on the viewer */
simulated protected function float GetMinCloakPct()
{
	return 0.f;
}

/** Updates healing syringe transparency based on cloak settings */
simulated function UpdateHealingSyringeTransparency()
{
	// Avoid arrays since this is called from ::Tick()
	if( HealingSyringeMICs[0] != none )
	{
		HealingSyringeMICs[0].SetScalarParameterValue( 'Transparency', CloakPercent );
	}
	if( HealingSyringeMICs[1] != none )
	{
		HealingSyringeMICs[1].SetScalarParameterValue( 'Transparency', CloakPercent );
	}
	if( HealingSyringeMICs[2] != none )
	{
		HealingSyringeMICs[2].SetScalarParameterValue( 'Transparency', CloakPercent );
	}
}

/*********************************************************************************************
* Cloaking
**********************************************************************************************/

simulated event NotifyGoreMeshActive()
{
    // Set our secondary MIC
	if( WorldInfo.NetMode != NM_DedicatedServer && Mesh != None )
	{
		BodyMIC = Mesh.CreateAndSetMaterialInstanceConstant( 0 );
		BodyAltMIC = Mesh.CreateAndSetMaterialInstanceConstant( 1 );

		Super.NotifyGoreMeshActive();
	}
}

/** Toggle cloaking material */
function SetCloaked(bool bNewCloaking)
{
	if( bCanCloak && bNewCloaking != bIsCloaking )
	{
		if( IsImpaired() && bNewCloaking )
		{
			return;
		}

		if( MaxHeadChunkGoreWhileAlive == 0 && bIsCloaking != bNewCloaking && IsAliveAndWell() )
		{
			if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlaySpotCloakDialog( self, bNewCloaking );
		}

		bIsCloaking = bNewCloaking;

		// Initial spotted callout should be slightly delayed
		if( bIsCloaking )
		{
			bIsCloakingSpottedByLP = false;
			bIsCloakingSpottedByTeam = false;
			LastSpottedStatusUpdate = WorldInfo.TimeSeconds - 0.2f;
		}

		if( WorldInfo.NetMode != NM_DedicatedServer )
		{
			if( bIsCloaking || bIsCloakingSpottedByLP || bIsCloakingSpottedByTeam )
			{
				SetGameplayMICParams();
			}
		}

		super.SetCloaked( bNewCloaking );
	}
}

/**
 * bIsCloaking replicated state changed
 * Network: Local and Remote Clients
 */
simulated function ClientCloakingStateUpdated()
{
	if( bIsCloaking )
	{
		ClearBloodDecals();
		SetGameplayMICParams();

		// Initial spotted callout should be slightly delayed
		bIsCloakingSpottedByLP = false;
		bIsCloakingSpottedByTeam = false;
		LastSpottedStatusUpdate = WorldInfo.TimeSeconds - 0.2f;
	}
	else if( bIsCloakingSpottedByLP || bIsCloakingSpottedByTeam )
	{
		SetGameplayMICParams();
	}
}

/** Interrupt cloaking when bEmpDisrupted is set */
function OnStackingAfflictionChanged(byte Id)
{
	local KFAIController_ZedPatriarch KFAICZP;

	Super.OnStackingAfflictionChanged(Id);

	if( Role == ROLE_Authority && IsAliveAndWell() )
	{
		if ( Id == SAF_EMPPanic || Id == SAF_EMPDisrupt )
		{
			if( !IsHumanControlled() )
			{
				// Interrupt charge and set it on full cooldown
				KFAICZP = KFAIController_ZedPatriarch( Controller );
				KFAICZP.bWantsToCharge = false;
				KFAICZP.bSprintUntilAttack = false;
				KFAICZP.LastChargeAttackTime = WorldInfo.TimeSeconds;
				KFAICZP.CachedChargeTarget = none;
				KFAICZP.LastSprintTime = WorldInfo.TimeSeconds;
			}

			// Decloak if we're cloaking
			if( bIsCloaking )
			{
				SetCloaked( false );
			}
		}
	}
}

/**
 * Called every 0.5f seconds to check if a cloaked zed has been spotted
 * Network: All but dedicated server
 */
simulated event UpdateSpottedStatus()
{
	local bool bOldSpottedByLP;
	local KFPlayerController LocalPC;
	local KFPerk LocalPerk;
	local float DistanceSq, Range;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	bOldSpottedByLP = bIsCloakingSpottedByLP;
	bIsCloakingSpottedByLP = false;

	LocalPC = KFPlayerController(GetALocalPlayerController());
	if( LocalPC != none )
	{
		LocalPerk = LocalPC.GetPerk();
	}

	if ( LocalPC != none && LocalPC.Pawn != None && LocalPC.Pawn.IsAliveAndWell() && LocalPerk != none &&
		 LocalPerk.bCanSeeCloakedZeds && (WorldInfo.TimeSeconds - LastRenderTime) < 1.f )
	{
		DistanceSq = VSizeSq(LocalPC.Pawn.Location - Location);
		Range = LocalPerk.GetCloakDetectionRange();

		if ( DistanceSq < Square(Range) )
		{
			bIsCloakingSpottedByLP = true;
			if ( LocalPerk.IsCallOutActive() )
			{
				// Beware of server spam.  This RPC is marked unreliable and UpdateSpottedStatus has it's own cooldown timer
				LocalPC.ServerCallOutPawnCloaking(self);
			}
		}
	}

	// If spotted by team already, there is no point in trying to update the MIC here
	if ( !bIsCloakingSpottedByTeam )
	{
		if ( bIsCloakingSpottedByLP != bOldSpottedByLP )
		{
			SetGameplayMICParams();
		}
	}
}

/** notification from player with CallOut ability */
function CallOutCloaking( optional KFPlayerController CallOutController )
{
	bIsCloakingSpottedByTeam = true;
	SetGameplayMICParams();
	SetTimer(2.f, false, nameof(CallOutCloakingExpired));
}

/** Call-out cloaking ability has timed out */
function CallOutCloakingExpired()
{
	bIsCloakingSpottedByTeam = false;
	SetGameplayMICParams();
}

/**
 * Update any material effects
 * Overridden to support second body material
 */
function UpdateMaterialEffect(float DeltaTime)
{
	local float Intensity;

	if( MaterialEffectTimeRemaining > 0.f )
	{
		if( MaterialEffectTimeRemaining > DeltaTime )
		{
			MaterialEffectTimeRemaining -= DeltaTime;
			Intensity = 1.f - fClamp(MaterialEffectTimeRemaining/MaterialEffectDuration, 0.f, 1.f);
		}
		else
		{
			MaterialEffectTimeRemaining = 0.f;
			Intensity = 1.f;
		}

		// Update the materials
		if( BodyMIC != none )
		{
   			BodyMIC.SetScalarParameterValue(MaterialEffectParamName, Intensity);
   		}

   		if( BodyAltMIC != none )
   		{
   			BodyAltMIC.SetScalarParameterValue(MaterialEffectParamName, Intensity);
   		}

		if( HeadMIC != none )
		{
   			HeadMIC.SetScalarParameterValue(MaterialEffectParamName, Intensity);
   		}
	}
}

/** Handle cloaking materials */
simulated function SetGameplayMICParams()
{
	local int i;
	local bool bIsSpotted;
	local bool bWasCloaked;

	super.SetGameplayMICParams();

	// Cannot cloak after patriarch has been gored
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		// visible by local player or team (must go after ServerCallOutCloaking)
		bIsSpotted = ( bIsCloakingSpottedByLP || bIsCloakingSpottedByTeam );

		if( (!bIsCloaking || IsImpaired()) && BodyMIC.Parent != BodyMaterial )
		{
			bWasCloaked = BodyMIC.Parent == SpottedMaterial || BodyMIC.Parent == CloakedBodyMaterial;

			BodyMIC.SetParent( BodyMaterial );
			BodyAltMIC.SetParent( BodyAltMaterial );
	   		for( i = 0; i < HealingSyringeMICs.Length; ++i )
	   		{
	   			if( HealingSyringeMICs[i] != none )
	   			{
	   				HealingSyringeMICs[i].SetParent( default.HealingSyringeMeshes[i].Materials[0] );
	   			}
	   		}

			Mesh.AttachComponentToSocket( BoilLightComponent, BoilLightSocketName );
			BoilLightComponent.SetEnabled( true );
			Mesh.CastShadow = true;
			Mesh.SetPerObjectShadows( true );

			// Needed to avoid effects occurring on gore mesh swap
	   		if( bWasCloaked )
	   		{
				SetDamageFXActive( true );
				PlayStealthSoundLoopEnd();
				DoCloakFX();
			}
		}
		else if ( bIsCloaking && bIsSpotted && BodyMIC.Parent != SpottedMaterial )
		{
			CloakPercent = 1.0f;
			BodyMIC.SetParent( SpottedMaterial );
			BodyAltMIC.SetParent( SpottedMaterial );
	   		for( i = 0; i < HealingSyringeMICs.Length; ++i )
	   		{
	   			if( HealingSyringeMICs[i] != none )
	   			{
	   				HealingSyringeMICs[i].SetParent( SpottedMaterial );
	   			}
	   		}
			Mesh.CastShadow = false;
			Mesh.SetPerObjectShadows( false );
			SetDamageFXActive( false );
		}
		else if( bIsCloaking && !bIsSpotted && BodyMIC.Parent != CloakedBodyMaterial )
		{
			BodyMIC.SetParent( CloakedBodyMaterial );
			BodyAltMIC.SetParent( CloakedBodyAltMaterial );
	   		for( i = 0; i < HealingSyringeMICs.Length; ++i )
	   		{
	   			if( HealingSyringeMICs[i] != none )
	   			{
	   				HealingSyringeMICs[i].SetParent( CloakedBodyAltMaterial );
	   			}
	   		}
			PlayStealthSoundLoop();
			DoCloakFX();
			Mesh.CastShadow = false;
			Mesh.SetPerObjectShadows( false );
			SetDamageFXActive( false );
		}
	}
}

simulated function DoCloakFX()
{
	local ParticleSystemComponent CloakPSC;

    CloakPSC = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( CloakFX, Mesh, CloakFXSocketName, true );
    CloakPSC.SetAbsolute( false, true, false );
}

/** Updates battle damage on material instance based on battle phase */
simulated function UpdateBattlePhaseMaterials()
{
	// No adjustments to spotted materials
	if( BodyMIC == none || BodyAltMIC == none || bIsCloakingSpottedByLP || bIsCloakingSpottedByTeam )
	{
		return;
	}

    switch( CurrentBattlePhase )
    {
    case 1:
        BodyMIC.SetScalarParameterValue( 'Scalar_BattleGrime', 0.f );
        BodyMIC.SetScalarParameterValue( 'Scalar_GlowFlashing', 0.f );
		BodyMIC.SetVectorParameterValue( 'Vector_GlowColor', MechColors[0] );
        BodyAltMIC.SetScalarParameterValue( 'Scalar_BattleGrime', 0.f );
        BodyAltMIC.SetScalarParameterValue( 'Scalar_Damage_Blood_Contrast', 0.f );
        BodyAltMIC.SetScalarParameterValue( 'Scalar_GlowFlashing', 0.f );
        BodyAltMIC.SetVectorParameterValue( 'Vector_GlowColor', BoilColors[0] );
        break;

    case 2:
        BodyMIC.SetScalarParameterValue( 'Scalar_BattleGrime', 0.3f );
        BodyMIC.SetScalarParameterValue( 'Scalar_GlowFlashing', 0.25f );
		BodyMIC.SetVectorParameterValue( 'Vector_GlowColor', MechColors[1] );
        BodyAltMIC.SetScalarParameterValue( 'Scalar_BattleGrime', 0.25f );
        BodyAltMIC.SetScalarParameterValue( 'Scalar_Damage_Blood_Contrast', 1.f );
        BodyAltMIC.SetScalarParameterValue( 'Scalar_GlowFlashing', 0.f );
        BodyAltMIC.SetVectorParameterValue( 'Vector_GlowColor', BoilColors[1] );
        break;

    case 3:
        BodyMIC.SetScalarParameterValue( 'Scalar_BattleGrime', 0.7f );
        BodyMIC.SetScalarParameterValue( 'Scalar_GlowFlashing', 0.5f );
		BodyMIC.SetVectorParameterValue( 'Vector_GlowColor', MechColors[2] );
        BodyAltMIC.SetScalarParameterValue( 'Scalar_BattleGrime', 0.5f );
        BodyAltMIC.SetScalarParameterValue( 'Scalar_Damage_Blood_Contrast', 1.2f );
        BodyAltMIC.SetScalarParameterValue( 'Scalar_GlowFlashing', 0.f );
        BodyAltMIC.SetVectorParameterValue( 'Vector_GlowColor', BoilColors[2] );
        break;

    case 4:
        BodyMIC.SetScalarParameterValue( 'Scalar_BattleGrime', 1.1f );
        BodyMIC.SetScalarParameterValue( 'Scalar_GlowFlashing', 0.75f );
		BodyMIC.SetVectorParameterValue( 'Vector_GlowColor', MechColors[3] );
        BodyAltMIC.SetScalarParameterValue( 'Scalar_BattleGrime', 0.75f );
        BodyAltMIC.SetScalarParameterValue( 'Scalar_Damage_Blood_Contrast', 1.3f );
        BodyAltMIC.SetScalarParameterValue( 'Scalar_GlowFlashing', 0.f );
        BodyAltMIC.SetVectorParameterValue( 'Vector_GlowColor', BoilColors[3] );
        bPulseBoils = true;
        break;
    };
}

/** Updates dynamic lights based on battle phase */
simulated function UpdateBattlePhaseLights()
{
	local LinearColor LinearBoilColor;
	local color BoilColor;
	local byte BattlePhaseArrayNum;

	if( Health <= 0 )
	{
		return;
	}

	BattlePhaseArrayNum = CurrentBattlePhase-1;
	LinearBoilColor = BoilColors[BattlePhaseArrayNum] * 0.6f;

	BoilColor.R = 255.f * LinearBoilColor.R;
	BoilColor.G = 255.f * LinearBoilColor.G;
	BoilColor.B = 255.f * LinearBoilColor.B;
	BoilColor.A = 255;

	BoilLightComponent.SetLightProperties( BoilLightBrightness[BattlePhaseArrayNum], BoilColor );
}

/** Updates battle damage emitters based on battle phase */
simulated function UpdateBattlePhaseFX()
{
	if( Health <= 0 || WorldInfo.MyEmitterPool == none || CurrentBattlePhase == 1 || LastFXBattlePhase == CurrentBattlePhase )
	{
		return;
	}

	switch( CurrentBattlePhase )
	{
		case 2:
			BattleDamagePSC_LeftFoot = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BattleDamageFX_Sparks_LowDmg, Mesh, BattleDamageFXSocketName_LeftFoot, true );
			BattleDamagePSC_LeftArm = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BattleDamageFX_Sparks_MidDmg, Mesh, BattleDamageFXSocketName_LeftArm, true );
			BattleDamagePSC_UpperSpike = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BattleDamageFX_Tentacle_LowDmg, Mesh, BattleDamageFXSocketName_UpperSpike, true );
			break;

		case 3:
			DetachEmitter( BattleDamagePSC_LeftFoot );
			DetachEmitter( BattleDamagePSC_LeftArm );
			DetachEmitter( BattleDamagePSC_UpperSpike );
			BattleDamagePSC_LeftFoot = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BattleDamageFX_Sparks_HighDmg, Mesh, BattleDamageFXSocketName_LeftFoot, true );
			BattleDamagePSC_LeftHip = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BattleDamageFX_Sparks_HighDmg, Mesh, BattleDamageFXSocketName_LeftHip, true );
			BattleDamagePSC_LeftArm = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BattleDamageFX_Sparks_MidDmg, Mesh, BattleDamageFXSocketName_LeftArm, true );
			BattleDamagePSC_Weapon = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BattleDamageFX_Sparks_LowDmg, Mesh, BattleDamageFXSocketName_Weapon, true );
			BattleDamagePSC_UpperSpike = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BattleDamageFX_Tentacle_MidDmg, Mesh, BattleDamageFXSocketName_UpperSpike, true );
			BattleDamagePSC_BackSpike = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BattleDamageFX_Tentacle_MidDmg, Mesh, BattleDamageFXSocketName_BackSpike, true );
			break;

		case 4:
			DetachEmitter( BattleDamagePSC_Weapon );
			DetachEmitter( BattleDamagePSC_LeftArm );
			DetachEmitter( BattleDamagePSC_UpperSpike );
			DetachEmitter( BattleDamagePSC_BackSpike );
			BattleDamagePSC_LeftKnee = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BattleDamageFX_Sparks_HighDmg, Mesh, BattleDamageFXSocketName_LeftKnee, true );
			BattleDamagePSC_LeftArm = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BattleDamageFX_Smoke_HighDmg, Mesh, BattleDamageFXSocketName_LeftArm, true );
			BattleDamagePSC_Weapon = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BattleDamageFX_Smoke_HighDmg, Mesh, BattleDamageFXSocketName_Weapon, true );
			BattleDamagePSC_LowerSpike = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BattleDamageFX_Tentacle_MidDmg, Mesh, BattleDamageFXSocketName_LowerSpike, true );
			BattleDamagePSC_UpperSpike = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BattleDamageFX_Tentacle_HighDmg, Mesh, BattleDamageFXSocketName_UpperSpike, true );
			BattleDamagePSC_BackSpike = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BattleDamageFX_Tentacle_MidDmg, Mesh, BattleDamageFXSocketName_BackSpike, true );
			break;
	}

	if( bIsCloaking )
	{
		SetDamageFXActive( false );
	}

	LastFXBattlePhase = CurrentBattlePhase;
}

/** Disables or enables battle phase FX components */
simulated function SetDamageFXActive( bool bEnable )
{
	// Just turn off particle systems upon death, let them self-destroy
	if( Health <= 0 )
	{
		if( BattleDamagePSC_LeftFoot != none )
		{
			BattleDamagePSC_LeftFoot.SetActive( false );
		}
		if( BattleDamagePSC_LeftKnee != none )
		{
			BattleDamagePSC_LeftKnee.SetActive( false );
		}
		if( BattleDamagePSC_LeftHip != none )
		{
			BattleDamagePSC_LeftHip.SetActive( false );
		}
		if( BattleDamagePSC_LeftArm != none )
		{
			BattleDamagePSC_LeftArm.SetActive( false );
		}
		if( BattleDamagePSC_Weapon != none )
		{
			BattleDamagePSC_Weapon.SetActive( false );
		}
		if( BattleDamagePSC_LowerSpike != none )
		{
			BattleDamagePSC_LowerSpike.SetActive( false );
		}
		if( BattleDamagePSC_UpperSpike != none )
		{
			BattleDamagePSC_UpperSpike.SetActive( false );
		}
		if( BattleDamagePSC_BackSpike != none )
		{
			BattleDamagePSC_BackSpike.SetActive( false );
		}
		return;
	}

	if( BattleDamagePSC_LeftFoot != none )
	{
		BattleDamagePSC_LeftFoot.SetHidden( !bEnable );
	}
	if( BattleDamagePSC_LeftKnee != none )
	{
		BattleDamagePSC_LeftKnee.SetHidden( !bEnable );
	}
	if( BattleDamagePSC_LeftHip != none )
	{
		BattleDamagePSC_LeftHip.SetHidden( !bEnable );
	}
	if( BattleDamagePSC_LeftArm != none )
	{
		BattleDamagePSC_LeftArm.SetHidden( !bEnable );
	}
	if( BattleDamagePSC_Weapon != none )
	{
		BattleDamagePSC_Weapon.SetHidden( !bEnable );
	}
	if( BattleDamagePSC_LowerSpike != none )
	{
		BattleDamagePSC_LowerSpike.SetHidden( !bEnable );
	}
	if( BattleDamagePSC_UpperSpike != none )
	{
		BattleDamagePSC_UpperSpike.SetHidden( !bEnable );
	}
	if( BattleDamagePSC_BackSpike != none )
	{
		BattleDamagePSC_BackSpike.SetHidden( !bEnable );
	}
}

/** Overridden to cause shimmer when taking damage */
simulated function PlayTakeHitEffects( vector HitDirection, vector HitLocation )
{
	super.PlayTakeHitEffects( HitDirection, HitLocation );

	if( !bIsCloaking || BodyMIC.Parent == SpottedMaterial || CloakPercent > CloakShimmerAmount || (WorldInfo.TimeSeconds - LastCloakShimmerTime) < 0.1f )
	{
		return;
	}

	LastCloakShimmerTime = WorldInfo.TimeSeconds;
	CloakPercent = fClamp( CloakPercent + CloakShimmerAmount, 0.f, 0.8f );
}

/** Allows us to spawn a custom cloaked impact effect */
simulated function KFSkinTypeEffects GetHitZoneSkinTypeEffects( int HitZoneIdx )
{
	if( bIsCloaking )
	{
		return CharacterArch.ImpactSkins[5]; // 5 = Patriarch_Cloaked
	}

	return super.GetHitZoneSkinTypeEffects( HitZoneIdx );
}

/** Overridden so that patty doesn't attempt dismemberment while he's alive */
function bool CanInjureHitZone(class<DamageType> DamageType, int HitZoneIdx)
{
	local class<KFDamageType> KFDmgType;
	local name HitZoneName;

    if ( bPlayedDeath )
	{
		KFDmgType = class<KFDamageType>(DamageType);
		HitZoneName = HitZones[HitZoneIdx].ZoneName;
		if ( KFDmgType != none && KFDmgType.static.CanDismemberHitZone( HitZoneName ) )
		{
			return true;
		}
	}

	return false;
}

/* PlayDying() is called on server/standalone game when killed
and also on net client when pawn gets bTearOff set to true (and bPlayedDeath is false)
*/
simulated function PlayDying( class<DamageType> DamageType, vector HitLoc )
{
	local int i;

	// Stop barrel spinning, gun tracking
	bSpinBarrels = false;
	SetGunTracking( false );

	// Uncloak on death
	SetCloaked( false );
	bCanCloak = false;

	// Break off syringes, if we have any still attached
	if( WorldInfo.NetMode != NM_DedicatedServer && CurrentBattlePhase < 4 )
	{
		for( i = CurrentBattlePhase - 1; i < HealingSyringeMeshes.Length; i++ )
		{
			// If patty is holding a syringe, the notify will pop and toss it
			if( i == CurrentSyringeMeshNum )
			{
				continue;
			}

			// Ignore if mesh has already been detached
			if( HealingSyringeMeshes[i] == none )
			{
				continue;
			}

			BreakOffSyringe( i );
		}
	}

	Super.PlayDying(DamageType, HitLoc);

	// Empty mortar targets array
	ClearMortarTargets();

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		SetDamageFXActive( false );
	}

	// Hide the syringe bone
	Mesh.HideBoneByName( 'Syringe', PBO_None );
}

 /** Clean up function to terminate any effects on death */
 simulated function TerminateEffectsOnDeath()
 {
	// Stop pulsing boils
	bPulseBoils = false;

 	// Turn off damage FX
	if( BodyMIC != none )
	{
		BodyMIC.SetVectorParameterValue( 'Vector_GlowColor', DeadMechColor );
		BodyMIC.SetScalarParameterValue( 'Scalar_GlowFlashing', 0.f );
	}
	if( BodyAltMIC != none )
	{
		BodyAltMIC.SetVectorParameterValue( 'Vector_GlowColor', DeadBoilColor );
		BodyAltMIC.SetScalarParameterValue( 'Scalar_GlowFlashing', 0.f );
	}
	BoilLightComponent.SetEnabled( false );
	DetachComponent( BoilLightComponent );

	super.TerminateEffectsOnDeath();
}

/** Disable cloaking when crippled/headless */
function CauseHeadTrauma( float BleedOutTime=5.f )
{
	Super.CauseHeadTrauma( BleedOutTime );

	if( bIsHeadless && IsAliveAndWell() && !IsDoingSpecialMove() )
	{
		SetCloaked( false );
	}
}

/*********************************************************************************************
* Audio
**********************************************************************************************/

/** Overloaded to take care of victory state */
simulated function SetWeaponAmbientSound(AkEvent NewAmbientSound, optional AkEvent FirstPersonAmbientSound)
{
	if( Controller != none && Controller.IsInState('ZedVictory') )
	{
		NewAmbientSound = none;
		FirstPersonAmbientSound = none;
	}

	super.SetWeaponAmbientSound( NewAmbientSound, FirstPersonAmbientSound );
}

/** Returns (hardcoded) dialog event ID for when players spots this zed type */
function int GetSpotterDialogID()
{
	if( bIsCloaking && MaxHeadChunkGoreWhileAlive == 0 )
    {
        return 135;//SPOTZ_Cloaked
    }

	return 125;//SPOTZ_Generic
}

simulated function PlayStealthSoundLoop()
{
	PlaySoundBase( CloakedLoop, true );
}

simulated function PlayStealthSoundLoopEnd()
{
	PlaySoundBase( CloakedLoopEnd, true );
}

function PlayMinigunWarnDialog()
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayPattyMinigunWarnDialog( self );
}

function PlayMinigunAttackDialog()
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayPattyMinigunAttackDialog( self );
}

function PlayGrabbedPlayerDialog( KFPawn_Human Target )
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayPattyTentaclePullDialog( self );
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayPlayerGrabbedByPatriarchDialog( Target );
}

/** Play music for this boss (overridden for each boss) */
function PlayBossMusic()
{
	if( KFGameInfo(WorldInfo.Game) != none )
	{
		KFGameInfo(WorldInfo.Game).ForcePatriarchMusicTrack();
	}
}

defaultproperties
{
   CloakedLoop=AkEvent'WW_ZED_Patriarch.Play_Patriarch_Cloak'
   CloakedLoopEnd=AkEvent'WW_ZED_Patriarch.Stop_Patriarch_Cloak'
   BodyMaterial=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_Mech_M'
   BodyAltMaterial=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_M'
   SpottedMaterial=MaterialInstanceConstant'ZED_Stalker_MAT.ZED_Stalker_Visible_MAT'
   CloakedBodyMaterial=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_Mech_Cloak_M'
   CloakedBodyAltMaterial=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_Cloak_M'
   Begin Object Class=StaticMeshComponent Name=KFSyringeStaticMeshComponent1
      StaticMesh=StaticMesh'ZED_Patriarch_MESH.CHR_Patriarch_Syringe'
      Materials(0)=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_M'
      ReplacementPrimitive=None
      MaxDrawDistance=4000.000000
      CachedMaxDrawDistance=4000.000000
      bAcceptsDynamicDecals=False
      bUseOnePassLightingOnTranslucency=True
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnServer=False
      Rotation=(Pitch=16384,Yaw=0,Roll=0)
      PerObjectShadowCullDistance=4000.000000
      bAllowPerObjectShadows=True
      bAllowPerObjectShadowBatching=True
      Name="KFSyringeStaticMeshComponent1"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   HealingSyringeMeshes(0)=KFSyringeStaticMeshComponent1
   Begin Object Class=StaticMeshComponent Name=KFSyringeStaticMeshComponent2
      StaticMesh=StaticMesh'ZED_Patriarch_MESH.CHR_Patriarch_Syringe'
      Materials(0)=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_M'
      ReplacementPrimitive=None
      MaxDrawDistance=4000.000000
      CachedMaxDrawDistance=4000.000000
      bAcceptsDynamicDecals=False
      bUseOnePassLightingOnTranslucency=True
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnServer=False
      Rotation=(Pitch=16384,Yaw=0,Roll=0)
      PerObjectShadowCullDistance=4000.000000
      bAllowPerObjectShadows=True
      bAllowPerObjectShadowBatching=True
      Name="KFSyringeStaticMeshComponent2"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   HealingSyringeMeshes(1)=KFSyringeStaticMeshComponent2
   Begin Object Class=StaticMeshComponent Name=KFSyringeStaticMeshComponent3
      StaticMesh=StaticMesh'ZED_Patriarch_MESH.CHR_Patriarch_Syringe'
      Materials(0)=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_M'
      ReplacementPrimitive=None
      MaxDrawDistance=4000.000000
      CachedMaxDrawDistance=4000.000000
      bAcceptsDynamicDecals=False
      bUseOnePassLightingOnTranslucency=True
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnServer=False
      Rotation=(Pitch=16384,Yaw=0,Roll=0)
      PerObjectShadowCullDistance=4000.000000
      bAllowPerObjectShadows=True
      bAllowPerObjectShadowBatching=True
      Name="KFSyringeStaticMeshComponent3"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   HealingSyringeMeshes(2)=KFSyringeStaticMeshComponent3
   CurrentSyringeMeshNum=-1
   ActiveSyringe=-1
   SyringeInjectTimeDuration=0.160000
   MechColors(0)=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)
   MechColors(1)=(R=0.190000,G=0.120000,B=0.000000,A=1.000000)
   MechColors(2)=(R=0.480000,G=0.076000,B=0.000000,A=1.000000)
   MechColors(3)=(R=0.790000,G=0.000000,B=0.000000,A=1.000000)
   DeadMechColor=(R=0.050000,G=0.000000,B=0.000000,A=1.000000)
   BoilColors(0)=(R=0.000000,G=0.280000,B=0.090000,A=1.000000)
   BoilColors(1)=(R=0.720000,G=0.730000,B=0.250000,A=1.000000)
   BoilColors(2)=(R=0.540000,G=0.079000,B=0.000000,A=1.000000)
   BoilColors(3)=(R=0.850000,G=0.000000,B=0.003000,A=1.000000)
   DeadBoilColor=(R=0.050000,G=0.000000,B=0.000000,A=1.000000)
   bUseServerSideGunTracking=True
   BoilPulseRate=2.500000
   BoilLightBrightness(0)=2.600000
   BoilLightBrightness(1)=2.700000
   BoilLightBrightness(2)=2.800000
   BoilLightBrightness(3)=2.900000
   BoilLightSocketName="BoilLightSocket"
   CloakFX=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_Cloaking_01'
   CloakFXSocketName="CloakFXSocket"
   CloakShimmerAmount=0.600000
   BattleDamageFXSocketName_LeftHip="FX_LeftHip"
   BattleDamageFXSocketName_LeftKnee="FX_LeftKnee"
   BattleDamageFXSocketName_LeftFoot="FX_LeftFoot"
   BattleDamageFXSocketName_LeftArm="FX_LeftArm"
   BattleDamageFXSocketName_Weapon="MissileCenter"
   BattleDamageFXSocketName_LowerSpike="FX_Right_Arm_Spike"
   BattleDamageFXSocketName_UpperSpike="FX_Upper_Back_Spike"
   BattleDamageFXSocketName_BackSpike="FX_Back_Spike"
   BattleDamageFX_Sparks_LowDmg=ParticleSystem'ZED_Patriarch_EMIT.FX_Pat_Sparks_LowD_01'
   BattleDamageFX_Sparks_MidDmg=ParticleSystem'ZED_Patriarch_EMIT.FX_Pat_sparks_MidD_01'
   BattleDamageFX_Sparks_HighDmg=ParticleSystem'ZED_Patriarch_EMIT.FX_Pat_Sparks_HighD_01'
   BattleDamageFX_Tentacle_LowDmg=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_tentacle_LowD_01'
   BattleDamageFX_Tentacle_MidDmg=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_tentacle_MidD_01'
   BattleDamageFX_Tentacle_HighDmg=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_tentacle_HighD_01'
   BattleDamageFX_Smoke_HighDmg=ParticleSystem'ZED_Patriarch_EMIT.FX_Pat_smoke_HighD_01'
   LastFXBattlePhase=1
   BattlePhases(0)=(bAllowedToSprint=True,SprintCooldownTime=3.000000,bCanUseMissiles=True,MissileAttackCooldownTime=10.000000,bCanChargeAttack=True,ChargeAttackCooldownTime=14.000000,MinigunAttackCooldownTime=2.250000,bCanSummonMinions=True,HealAmounts=(0.750000,1.000000,1.000000,1.000000))
   BattlePhases(1)=(bAllowedToSprint=True,SprintCooldownTime=2.500000,bCanTentacleGrab=True,TentacleGrabCooldownTime=10.000000,bCanUseMissiles=True,MissileAttackCooldownTime=8.000000,bCanUseMortar=True,MortarAttackCooldownTime=10.000000,bCanChargeAttack=True,ChargeAttackCooldownTime=10.000000,MaxRageAttacks=4,TentacleDamage=10,MinigunAttackCooldownTime=2.000000,bCanSummonMinions=True,HealAmounts=(0.650000,1.000000,1.000000,1.000000))
   BattlePhases(2)=(bAllowedToSprint=True,SprintCooldownTime=2.000000,bCanTentacleGrab=True,TentacleGrabCooldownTime=9.000000,bCanUseMissiles=True,MissileAttackCooldownTime=7.000000,bCanUseMortar=True,MortarAttackCooldownTime=9.000000,bCanDoMortarBarrage=True,bCanChargeAttack=True,ChargeAttackCooldownTime=9.000000,MaxRageAttacks=5,TentacleDamage=10,MinigunAttackCooldownTime=1.750000,bCanSummonMinions=True,HealAmounts=(0.600000,0.800000,0.800000,0.900000))
   BattlePhases(3)=(bAllowedToSprint=True,SprintCooldownTime=1.500000,bCanTentacleGrab=True,TentacleGrabCooldownTime=7.000000,bCanUseMissiles=True,MissileAttackCooldownTime=5.000000,bCanUseMortar=True,MortarAttackCooldownTime=7.000000,bCanDoMortarBarrage=True,bCanChargeAttack=True,ChargeAttackCooldownTime=7.000000,MaxRageAttacks=6,TentacleDamage=10,MinigunAttackCooldownTime=1.250000,bCanSummonMinions=True)
   TentacleDamageType=Class'kfgamecontent.KFDT_Slashing_PatTentacle'
   HeavyBumpDamageType=Class'kfgamecontent.KFDT_HeavyZedBump'
   MissileProjectileClass=Class'kfgamecontent.KFProj_Missile_Patriarch'
   MortarProjectileClass=Class'kfgamecontent.KFProj_Mortar_Patriarch'
   MinMortarRangeSQ=160000.000000
   MaxMortarRangeSQ=6000000.000000
   FleeSprintSpeedModifier=1.250000
   CloakPercent=1.000000
   CloakSpeed=3.000000
   DeCloakSpeed=4.500000
   BossName="The Patriarch"
   BossCaptionStrings(0)="Kevin Clamely was once a brilliant scientist, until he became his own greatest creation."
   BossCaptionStrings(1)="The Patriarch is staggeringly arrogant - he is likely to tell you which attack he will use next."
   BossCaptionStrings(2)="Hiding behind even big objects won't help as much as you'd hope. The Patriarch has an answer for that!"
   BossCaptionStrings(3)="Running off on your own isn't an escape - it makes you easy prey he will target first."
   BossCaptionStrings(4)="Yes, the Patriarch can still cloak, go invisible, run off and heal himself. Some things don't change."
   BossCaptionStrings(5)="While you won't get much choice about it, killing The Patriarch's 'children' just makes him mad(der)."
   SummonWaves(0)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Normal_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Normal_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Normal_Three')
   SummonWaves(1)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Hard_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Hard_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Hard_Three')
   SummonWaves(2)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Suicidal_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Suicidal_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Suicidal_Three')
   SummonWaves(3)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_HOE_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_HOE_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_HOE_Three')
   NumMinionsToSpawn=10
   CurrentBattlePhase=1
   TheatricCameraSocketName="TheatricCameraRootSocket"
   bLargeZed=True
   bCanGrabAttack=True
   CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Patriarch_ARCH.ZED_Patriarch_Archetype'
   HeadlessBleedOutTime=6.000000
   ParryResistance=4
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_MonsterBoss:MeleeHelper_0'
      BaseDamage=55.000000
      MyDamageType=Class'kfgamecontent.KFDT_Bludgeon_Patriarch'
      MomentumTransfer=40000.000000
      MaxHitRange=375.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFPawn_MonsterBoss:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedPatriarch:MeleeHelper_0'
   DoshValue=500
   XPValues(0)=1291.000000
   XPValues(1)=1694.000000
   XPValues(2)=1790.000000
   XPValues(3)=1843.000000
   VulnerableDamageTypes(16)=(DamageType=Class'KFGame.KFDT_EMP',DamageScale=1.500000)
   VulnerableDamageTypes(17)=(DamageType=Class'kfgamecontent.KFDT_Microwave',DamageScale=1.250000)
   ResistantDamageTypes(16)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=0.600000)
   ResistantDamageTypes(17)=(DamageType=Class'KFGame.KFDT_Toxic')
   ResistantDamageTypes(18)=(DamageType=Class'KFGame.KFDT_Fire')
   ResistantDamageTypes(19)=(DamageType=Class'KFGame.KFDT_Slashing')
   ResistantDamageTypes(20)=(DamageType=Class'KFGame.KFDT_Bludgeon',DamageScale=0.400000)
   ResistantDamageTypes(21)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=0.800000)
   ResistantDamageTypes(22)=(DamageType=Class'KFGame.KFDT_Ballistic',DamageScale=0.700000)
   ResistantDamageTypes(23)=(DamageType=Class'KFGame.KFDT_Healing',DamageScale=0.600000)
   BumpDamageType=Class'KFGame.KFDT_NPCBump_Large'
   FootstepCameraShakeInnerRadius=200.000000
   FootstepCameraShakeOuterRadius=900.000000
   FootstepCameraShake=CameraShake'kfgamecontent.Default__KFPawn_ZedPatriarch:FootstepCameraShake0'
   PawnAnimInfo=KFPawnAnimInfo'ZED_Patriarch_ANIM.Patriarch_AnimGroup'
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_MonsterBoss:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_MonsterBoss:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bEnableAimOffset=True
   bCanCloak=True
   HitZones(0)=(GoreHealth=100,DmgScale=1.000000)
   HitZones(1)=(ZoneName="Jaw",BoneName="Jaw",GoreHealth=2147483647,SkinID=1)
   HitZones(2)=(BoneName="Spine1",DmgScale=0.800000,SkinID=1)
   HitZones(3)=(BoneName="FrontTentacle7",GoreHealth=2147483647,DmgScale=1.500000,SkinID=1)
   HitZones(4)=(DmgScale=0.330000,SkinID=3)
   HitZones(5)=(GoreHealth=20,DmgScale=0.330000,SkinID=3)
   HitZones(6)=()
   HitZones(7)=(DmgScale=1.100000,SkinID=4)
   HitZones(8)=(GoreHealth=20,DmgScale=1.100000,SkinID=4)
   HitZones(9)=(BoneName="RightHand",GoreHealth=10,DmgScale=0.500000,SkinID=1)
   HitZones(10)=(BoneName="Spine",GoreHealth=2147483647,DmgScale=0.800000,SkinID=1)
   HitZones(11)=()
   HitZones(12)=(GoreHealth=100,DmgScale=0.330000,SkinID=3)
   HitZones(13)=(GoreHealth=2147483647,DmgScale=0.330000,SkinID=3)
   HitZones(14)=(BoneName="LeftFoot",GoreHealth=10,DmgScale=0.330000,SkinID=3)
   HitZones(15)=(DmgScale=0.800000,SkinID=1)
   HitZones(16)=(DmgScale=0.800000,SkinID=1)
   HitZones(17)=()
   HitZones(18)=(ZoneName="tentacle",BoneName="FrontTentacle1",DmgScale=0.800000,Limb=BP_Torso,SkinID=1)
   HitZones(19)=(ZoneName="ltoeindex",BoneName="LeftFootIndex1",GoreHealth=2147483647,DmgScale=0.250000,Limb=BP_LeftLeg,SkinID=3)
   HitZones(20)=(ZoneName="ltoemiddle",BoneName="LeftFootMiddle1",GoreHealth=2147483647,DmgScale=0.250000,Limb=BP_LeftLeg,SkinID=3)
   HitZones(21)=(ZoneName="ltoering",BoneName="LeftFootRing1",GoreHealth=2147483647,DmgScale=0.250000,Limb=BP_LeftLeg,SkinID=3)
   PenetrationResistance=4.000000
   Begin Object Class=KFPawnAfflictions_Patriarch Name=Afflictions_0
      FireFullyCharredDuration=50.000000
      FireCharPercentThreshhold=0.350000
      Name="Afflictions_0"
      ObjectArchetype=KFPawnAfflictions_Patriarch'kfgamecontent.Default__KFPawnAfflictions_Patriarch'
   End Object
   AfflictionHandler=KFPawnAfflictions_Patriarch'kfgamecontent.Default__KFPawn_ZedPatriarch:Afflictions_0'
   InstantIncaps(0)=(head=65,Torso=150,Leg=150,Special=65,LowHealthBonus=10,Cooldown=40.000000)
   InstantIncaps(1)=(head=85,Torso=120,Arm=120,Special=85,LowHealthBonus=10,Cooldown=10.000000)
   InstantIncaps(2)=(head=79,Torso=130,Arm=130,Special=20,LowHealthBonus=10,Cooldown=8.000000)
   InstantIncaps(3)=(Leg=130,LowHealthBonus=10,Cooldown=8.000000)
   InstantIncaps(4)=(head=29,Torso=35,Leg=35,Arm=35,LowHealthBonus=10,Cooldown=3.000000)
   InstantIncaps(5)=(head=29,Torso=29,Leg=29,Arm=29,LowHealthBonus=10,Cooldown=10.000000)
   StackingIncaps(0)=(Threshhold=1.150000,Duration=2.250000,Cooldown=12.000000)
   StackingIncaps(1)=(Threshhold=15.000000,Duration=1.200000,Cooldown=15.000000)
   StackingIncaps(2)=(Threshhold=5000.000000)
   StackingIncaps(3)=(Threshhold=40.000000,Duration=3.000000,Cooldown=10.000000)
   StackingIncaps(4)=(Duration=2.000000,Cooldown=12.000000,DissipationRate=0.500000)
   StackingIncaps(5)=()
   KnockdownImpulseScale=1.000000
   SprintSpeed=650.000000
   DefaultInventory(0)=Class'kfgamecontent.KFWeap_Minigun_Patriarch'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_MonsterBoss:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_MonsterBoss:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_MonsterBoss:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=Class'KFGame.KFSM_MeleeAttack'
      SpecialMoveClasses(2)=Class'KFGame.KFSM_DoorMeleeAttack'
      SpecialMoveClasses(3)=None
      SpecialMoveClasses(4)=Class'KFGame.KFSM_Patriarch_Grapple'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(10)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=None
      SpecialMoveClasses(13)=Class'kfgamecontent.KFSM_Patriarch_Taunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=Class'kfgamecontent.KFSM_Patriarch_Heal'
      SpecialMoveClasses(18)=Class'kfgamecontent.KFSM_Patriarch_MortarAttack'
      SpecialMoveClasses(19)=Class'kfgamecontent.KFSM_Patriarch_MissileAttack'
      SpecialMoveClasses(20)=Class'kfgamecontent.KFSM_Patriarch_MinigunBarrage'
      SpecialMoveClasses(21)=None
      SpecialMoveClasses(22)=None
      SpecialMoveClasses(23)=None
      SpecialMoveClasses(24)=None
      SpecialMoveClasses(25)=None
      SpecialMoveClasses(26)=None
      SpecialMoveClasses(27)=None
      SpecialMoveClasses(28)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(29)=Class'KFGame.KFSM_HansGrappleVictim'
      SpecialMoveClasses(30)=None
      SpecialMoveClasses(31)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_MonsterBoss:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedPatriarch:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_MonsterBoss:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_MonsterBoss:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedPatriarch:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   DamageRecoveryTimeHeavy=0.100000
   DamageRecoveryTimeMedium=0.090000
   Mass=175.000000
   GroundSpeed=260.000000
   Health=3750
   ControllerClass=Class'kfgamecontent.KFAIController_ZedPatriarch'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_MonsterBoss:KFPawnSkeletalMeshComponent'
      WireframeColor=(B=0,G=255,R=255,A=255)
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      bChartDistanceFactor=True
      ReplacementPrimitive=None
      RBChannel=RBCC_Pawn
      RBDominanceGroup=20
      bOwnerNoSee=True
      bUseAsOccluder=False
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      CollideActors=True
      BlockZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,Pawn=True,Vehicle=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-86.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=4000.000000
      bAllowPerObjectShadows=True
      bAllowPerObjectShadowBatching=True
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_MonsterBoss:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPawn_MonsterBoss:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=55.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPawn_MonsterBoss:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPawn_MonsterBoss:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPawn_MonsterBoss:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPawn_MonsterBoss:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPawn_MonsterBoss:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=50000,Yaw=50000,Roll=50000)
   Name="Default__KFPawn_ZedPatriarch"
   ObjectArchetype=KFPawn_MonsterBoss'KFGame.Default__KFPawn_MonsterBoss'
}
