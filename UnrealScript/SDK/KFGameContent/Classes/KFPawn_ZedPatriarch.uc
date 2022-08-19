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
			`DialogManager.PlaySpotCloakDialog( self, bNewCloaking );
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
		 LocalPerk.bCanSeeCloakedZeds && `TimeSince( LastRenderTime ) < 1.f )
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

	if( !bIsCloaking || BodyMIC.Parent == SpottedMaterial || CloakPercent > CloakShimmerAmount || `TimeSince( LastCloakShimmerTime ) < 0.1f )
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
	`DialogManager.PlayPattyMinigunWarnDialog( self );
}

function PlayMinigunAttackDialog()
{
	`DialogManager.PlayPattyMinigunAttackDialog( self );
}

function PlayGrabbedPlayerDialog( KFPawn_Human Target )
{
	`DialogManager.PlayPattyTentaclePullDialog( self );
	`DialogManager.PlayPlayerGrabbedByPatriarchDialog( Target );
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
	// ---------------------------------------------
	// Stats
	XPValues(0)=1291
	XPValues(1)=1694
	XPValues(2)=1790
	XPValues(3)=1843

    // ---------------------------------------------
    // Content
	CloakedBodyMaterial=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_Mech_Cloak_M'
	CloakedBodyAltMaterial=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_Cloak_M'
	SpottedMaterial=MaterialInstanceConstant'ZED_Stalker_MAT.ZED_Stalker_Visible_MAT'
	BodyMaterial=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_Mech_M'
	BodyAltMaterial=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_M'
    CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Patriarch_ARCH.ZED_Patriarch_Archetype'
    PawnAnimInfo=KFPawnAnimInfo'ZED_Patriarch_ANIM.Patriarch_AnimGroup'
    HeavyBumpDamageType=class'KFGameContent.KFDT_HeavyZedBump'
    TentacleDamageType=class'KFDT_Slashing_PatTentacle'

    // FX
	CloakFX=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_Cloaking_01'
	CloakFXSocketName=CloakFXSocket

	BattleDamageFX_Sparks_LowDmg=ParticleSystem'ZED_Patriarch_EMIT.FX_Pat_Sparks_LowD_01'
	BattleDamageFX_Sparks_MidDmg=ParticleSystem'ZED_Patriarch_EMIT.FX_Pat_sparks_MidD_01'
	BattleDamageFX_Sparks_HighDmg=ParticleSystem'ZED_Patriarch_EMIT.FX_Pat_Sparks_HighD_01'
	BattleDamageFX_Tentacle_LowDmg=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_tentacle_LowD_01'
	BattleDamageFX_Tentacle_MidDmg=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_tentacle_MidD_01'
	BattleDamageFX_Tentacle_HighDmg=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_tentacle_HighD_01'
	BattleDamageFX_Smoke_HighDmg=ParticleSystem'ZED_Patriarch_EMIT.FX_Pat_smoke_HighD_01'
	BattleDamageFXSocketName_LeftHip=FX_LeftHip
	BattleDamageFXSocketName_LeftKnee=FX_LeftKnee
	BattleDamageFXSocketName_LeftFoot=FX_LeftFoot
	BattleDamageFXSocketName_LeftArm=FX_LeftArm
	BattleDamageFXSocketName_Weapon=MissileCenter
	BattleDamageFXSocketName_LowerSpike=FX_Right_Arm_Spike
	BattleDamageFXSocketName_UpperSpike=FX_Upper_Back_Spike
	BattleDamageFXSocketName_BackSpike=FX_Back_Spike

    MechColors[0]=(R=0.f,G=0.f,B=0.f)
    MechColors[1]=(R=0.19,G=0.12f,B=0.f)
    MechColors[2]=(R=0.48f,G=0.076f,B=0.f)
    MechColors[3]=(R=0.79f,G=0.f,B=0.f)
    DeadMechColor=(R=0.05,G=0.f,B=0.f)

    BoilColors[0]=(R=0.f,G=0.28f,B=0.09f)
    BoilColors[1]=(R=0.72,G=0.73f,B=0.25f)
    BoilColors[2]=(R=0.54f,G=0.079f,B=0.f)
    BoilColors[3]=(R=0.85f,G=0.f,B=0.003f)
    DeadBoilColor=(R=0.05,G=0.f,B=0.f)
    BoilLightBrightness[0]=2.6f
    BoilLightBrightness[1]=2.7f
    BoilLightBrightness[2]=2.8f
    BoilLightBrightness[3]=2.9f
    BoilPulseRate=2.5f
    BoilPulseAccum=0.f

    Begin Object Class=PointLightComponent Name=BoilLightComponent0
        FalloffExponent=10.f
        Brightness=2.f
        Radius=190.f
        LightColor=(R=50,G=200,B=50,A=255)
        CastShadows=false
        bEnabled=false
        LightingChannels=(Indoor=true,Outdoor=true,bInitialized=true)
    End Object
    BoilLightComponent=BoilLightComponent0
    BoilLightSocketName=BoilLightSocket

    TheatricCameraSocketName=TheatricCameraRootSocket

    Begin Object Name=KFPawnSkeletalMeshComponent
		// Enabling kinematic for physics interaction while alive.  (see also MinDistFactorForKinematicUpdate)
		bUpdateKinematicBonesFromAnimation=true
	End Object

	Begin Object Class=StaticMeshComponent Name=KFSyringeStaticMeshComponent1
	    StaticMesh=StaticMesh'ZED_Patriarch_MESH.CHR_Patriarch_Syringe'
	    Materials(0)=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_M'
	    Rotation=(Pitch=16384)
	    BlockRigidBody=false
		CastShadow=true
		bUseOnePassLightingOnTranslucency=true
		bCastDynamicShadow=true
		bAllowPerObjectShadows=true
		PerObjectShadowCullDistance=4000 //40m
`if(`__TW_PER_OBJECT_SHADOW_BATCHING_)
		bAllowPerObjectShadowBatching=true
`endif
		CollideActors=false
		AlwaysLoadOnClient=true
		AlwaysLoadOnServer=false
		MaxDrawDistance=4000
		bAcceptsDynamicDecals=FALSE
		// Default to outdoor. If indoor, this will be set when TWIndoorLightingVolume::Touch() event is received at spawn.
		LightingChannels=(Outdoor=TRUE,bInitialized=TRUE)
	End Object
	HealingSyringeMeshes.Add(KFSyringeStaticMeshComponent1)

	Begin Object Class=StaticMeshComponent Name=KFSyringeStaticMeshComponent2
	    StaticMesh=StaticMesh'ZED_Patriarch_MESH.CHR_Patriarch_Syringe'
	    Materials(0)=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_M'
	    Rotation=(Pitch=16384)
	    BlockRigidBody=false
		CastShadow=true
		bUseOnePassLightingOnTranslucency=true
		bCastDynamicShadow=true
		bAllowPerObjectShadows=true
		PerObjectShadowCullDistance=4000 //40m
`if(`__TW_PER_OBJECT_SHADOW_BATCHING_)
		bAllowPerObjectShadowBatching=true
`endif
		CollideActors=false
		AlwaysLoadOnClient=true
		AlwaysLoadOnServer=false
		MaxDrawDistance=4000
		bAcceptsDynamicDecals=FALSE
		// Default to outdoor. If indoor, this will be set when TWIndoorLightingVolume::Touch() event is received at spawn.
		LightingChannels=(Outdoor=TRUE,bInitialized=TRUE)
	End Object
	HealingSyringeMeshes.Add(KFSyringeStaticMeshComponent2)

	Begin Object Class=StaticMeshComponent Name=KFSyringeStaticMeshComponent3
	    StaticMesh=StaticMesh'ZED_Patriarch_MESH.CHR_Patriarch_Syringe'
	    Materials(0)=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_M'
	    Rotation=(Pitch=16384)
	    BlockRigidBody=false
		CastShadow=true
		bUseOnePassLightingOnTranslucency=true
		bCastDynamicShadow=true
		bAllowPerObjectShadows=true
		PerObjectShadowCullDistance=4000 //40m
`if(`__TW_PER_OBJECT_SHADOW_BATCHING_)
		bAllowPerObjectShadowBatching=true
`endif
		CollideActors=false
		AlwaysLoadOnClient=true
		AlwaysLoadOnServer=false
		MaxDrawDistance=4000
		bAcceptsDynamicDecals=FALSE
		// Default to outdoor. If indoor, this will be set when TWIndoorLightingVolume::Touch() event is received at spawn.
		LightingChannels=(Outdoor=TRUE,bInitialized=TRUE)
	End Object
	HealingSyringeMeshes.Add(KFSyringeStaticMeshComponent3)

    // ---------------------------------------------
    // Audio
	CloakedLoop=AkEvent'WW_ZED_Patriarch.Play_Patriarch_Cloak'
	CloakedLoopEnd=AkEvent'WW_ZED_Patriarch.Stop_Patriarch_Cloak'

    // ---------------------------------------------
    // Effects
	Begin Object Class=CameraShake Name=FootstepCameraShake0
		bSingleInstance=true
		OscillationDuration=0.3f
		RotOscillation={(Pitch=(Amplitude=140.f,Frequency=60.f),
		Roll=(Amplitude=60.f,Frequency=40.f))}
	End Object
	FootstepCameraShake=FootstepCameraShake0
	FootstepCameraShakeInnerRadius=200
	FootstepCameraShakeOuterRadius=900

	// ---------------------------------------------
	// Special Moves
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_Taunt)=class'KFSM_Patriarch_Taunt'
		SpecialMoveClasses(SM_Heal)=class'KFSM_Patriarch_Heal'
		SpecialMoveClasses(SM_HoseWeaponAttack)=class'KFSM_Patriarch_MinigunBarrage'
        SpecialMoveClasses(SM_GrabAttack)=class'KFSM_Patriarch_Grapple'
		SpecialMoveClasses(SM_StandAndShootAttack)=class'KFSM_Patriarch_MissileAttack'
		SpecialMoveClasses(SM_SonicAttack)=class'KFSM_Patriarch_MortarAttack'
	End Object

    InstantIncaps(IAF_Stun)=(Head=85,Torso=120,Arm=120,Special=85,LowHealthBonus=10,Cooldown=10.0)
    InstantIncaps(IAF_Knockdown)=(Head=65,Torso=150,Leg=150,Special=65,LowHealthBonus=10,Cooldown=40.0)
    InstantIncaps(IAF_Stumble)=(Head=79,Torso=130,Arm=130,Special=20,LowHealthBonus=10,Cooldown=8.0)
    InstantIncaps(IAF_LegStumble)=(Leg=130,LowHealthBonus=10,Cooldown=8.0)
    InstantIncaps(IAF_GunHit)=(Head=29,Torso=29,Leg=29,Arm=29,LowHealthBonus=10,Cooldown=10.0)
    InstantIncaps(IAF_MeleeHit)=(Head=29,Torso=35,Leg=35,Arm=35,LowHealthBonus=10,Cooldown=3.0)
    StackingIncaps(SAF_Poison)=(Threshhold=5000.0,Duration=5.0,Cooldown=5.0,DissipationRate=1.00)
    StackingIncaps(SAF_Microwave)=(Threshhold=40.0,Duration=3.0,Cooldown=10.0,DissipationRate=1.00)
    StackingIncaps(SAF_FirePanic)=(Threshhold=15,Duration=1.2,Cooldown=15.0,DissipationRate=1.0)
    StackingIncaps(SAF_EMPPanic)=(Threshhold=1.15,Duration=2.25,Cooldown=12.0,DissipationRate=0.5)
	StackingIncaps(SAF_EMPDisrupt)=(Threshhold=1.0,Duration=2.0,Cooldown=12.0,DissipationRate=0.5)

	Begin Object Class=KFPawnAfflictions_Patriarch Name=Afflictions_0
		FireFullyCharredDuration=50.f
   	 	FireCharPercentThreshhold=0.35f
    End Object
	AfflictionHandler=Afflictions_0

	MissileProjectileClass=class'KFProj_Missile_Patriarch'
	MortarProjectileClass=class'KFProj_Mortar_Patriarch'
	MinMortarRangeSQ=160000.f
	MaxMortarRangeSQ=6000000.f

	ParryResistance=4

	// ---------------------------------------------
	// Gameplay
    bLargeZed=true
    bCanCloak=true
	bCanGrabAttack=true
	bEnableAimOffset=true
	bUseServerSideGunTracking=true

	ActiveSyringe=-1
	CurrentSyringeMeshNum=-1
	SyringeInjectTimeDuration=0.16f

	Begin Object Name=MeleeHelper_0
		BaseDamage=55.f
		MaxHitRange=375.f
		MomentumTransfer=40000.f
		MyDamageType=class'KFDT_Bludgeon_Patriarch'
	End Object

	Health=3750
	DoshValue=500
	Mass=175.f

	CloakPercent=1.0f
	DeCloakSpeed=4.5f
	CloakSpeed=3.f
	CloakShimmerAmount=0.6f

	FleeSprintSpeedModifier=1.25f

	// Resistant damage types
    ResistantDamageTypes.Add((DamageType=class'KFDT_Explosive', DamageScale=0.6f))
    ResistantDamageTypes.Add((DamageType=class'KFDT_Toxic', 	DamageScale=0.5f))
	ResistantDamageTypes.Add((DamageType=class'KFDT_Fire', 		DamageScale=0.5f))
    ResistantDamageTypes.Add((DamageType=class'KFDT_Slashing', 	DamageScale=0.5f))
    ResistantDamageTypes.Add((DamageType=class'KFDT_Bludgeon', 	DamageScale=0.4f))
    ResistantDamageTypes.Add((DamageType=class'KFDT_Piercing', 	DamageScale=0.8f))
    ResistantDamageTypes.Add((DamageType=class'KFDT_Ballistic', DamageScale=0.7f))
    ResistantDamageTypes.Add((DamageType=class'KFDT_Healing', 	DamageScale=0.6f))

    // Vulnerable damagetypes
	VulnerableDamageTypes.Add((DamageType=class'KFDT_EMP',		DamageScale=1.5f))
    VulnerableDamageTypes.Add((DamageType=class'KFDT_Microwave',DamageScale=1.25f))

	// Penetration
    PenetrationResistance=4.0

	// Custom Hit Zones (HeadHealth, SkinTypes, etc...)
	HeadlessBleedOutTime=6.f
    HitZones[HZI_HEAD]=(ZoneName=head, 		BoneName=head, 			Limb=BP_Head, 		GoreHealth=100,		DmgScale=1.0,	SkinID=1)
	HitZones[1]       =(ZoneName=jaw,		BoneName=Jaw,			Limb=BP_Head,		GoreHealth=MaxInt,	DmgScale=1.0,	SkinID=1)
	HitZones[2]       =(ZoneName=chest, 	BoneName=Spine1,		Limb=BP_Torso,		GoreHealth=150, 	DmgScale=0.8,	SkinID=1)
	HitZones[3]       =(ZoneName=heart,	    BoneName=FrontTentacle7, Limb=BP_Special,	GoreHealth=MaxInt,	DmgScale=1.5,	SkinID=1)
	HitZones[4]		  =(ZoneName=lupperarm,	BoneName=LeftArm,		Limb=BP_LeftArm,	GoreHealth=50, 		DmgScale=0.33,	SkinID=3)
	HitZones[5]		  =(ZoneName=lforearm, 	BoneName=LeftForearm,	Limb=BP_LeftArm,	GoreHealth=20,		DmgScale=0.33,	SkinID=3)
	HitZones[7]		  =(ZoneName=rupperarm,	BoneName=RightArm,		Limb=BP_RightArm,	GoreHealth=50,		DmgScale=1.1,	SkinID=4)
	HitZones[8]		  =(ZoneName=rforearm, 	BoneName=RightForearm, 	Limb=BP_RightArm,	GoreHealth=20,		DmgScale=1.1,	SkinID=4)
	HitZones[9]		  =(ZoneName=rhand, 	BoneName=RightHand, 	Limb=BP_RightArm,	GoreHealth=10,		DmgScale=0.5,	SkinID=1)
	HitZones[10]	  =(ZoneName=stomach, 	BoneName=Spine, 		Limb=BP_Torso,		GoreHealth=MaxInt,	DmgScale=0.8,	SkinID=1)
	HitZones[12]	  =(ZoneName=lthigh,	BoneName=LeftUpLeg,		Limb=BP_LeftLeg,	GoreHealth=100,		DmgScale=0.33,	SkinID=3)
	HitZones[13]	  =(ZoneName=lcalf,	    BoneName=LeftLeg,		Limb=BP_LeftLeg,	GoreHealth=MaxInt,	DmgScale=0.33,	SkinID=3)
	HitZones[14]	  =(ZoneName=lfoot,	    BoneName=LeftFoot,		Limb=BP_LeftLeg,	GoreHealth=10,		DmgScale=0.33,	SkinID=3)
	HitZones[15]	  =(ZoneName=rthigh,	BoneName=RightUpLeg,	Limb=BP_RightLeg,	GoreHealth=75,		DmgScale=0.8,	SkinID=1)
	HitZones[16]	  =(ZoneName=rcalf,     BoneName=RightLeg,		Limb=BP_RightLeg,	GoreHealth=25,		DmgScale=0.8,	SkinID=1)

	// Tentacle gore
	HitZones.Add((ZoneName=tentacle,	    BoneName=FrontTentacle1, Limb=BP_Torso,  GoreHealth=50,  DmgScale=0.8, SkinID=1))

	// Mech toes
	HitZones.Add((ZoneName=ltoeindex,	    BoneName=LeftFootIndex1, 	Limb=BP_LeftLeg,  GoreHealth=MaxInt,  DmgScale=0.25, SkinID=3))
	HitZones.Add((ZoneName=ltoemiddle, 		BoneName=LeftFootMiddle1, 	Limb=BP_LeftLeg,  GoreHealth=MaxInt,  DmgScale=0.25, SkinID=3))
	HitZones.Add((ZoneName=ltoering,	    BoneName=LeftFootRing1,	 	Limb=BP_LeftLeg,  GoreHealth=MaxInt,  DmgScale=0.25, SkinID=3))

	// ---------------------------------------------
	// Movement / Physics
	Begin Object Name=CollisionCylinder
		CollisionRadius=+0055.000000
	End Object

    RotationRate=(Pitch=50000,Yaw=50000,Roll=50000)

	GroundSpeed=260.f
	SprintSpeed=650.f
	ReachedEnemyThresholdScale=1.f
	KnockdownImpulseScale=1.0f

	// ---------------------------------------------
	// AI / Navigation
	ControllerClass=class'KFGameContent.KFAIController_ZedPatriarch'
	BumpDamageType=class'KFDT_NPCBump_Large'
	DamageRecoveryTimeHeavy=0.1f
	DamageRecoveryTimeMedium=0.09f

	DefaultInventory(0)=class'KFWeap_Minigun_Patriarch'

	// Summon squads by difficulty
	SummonWaves(0)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Normal_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Normal_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Normal_Three')
	SummonWaves(1)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Hard_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Hard_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Hard_Three')
	SummonWaves(2)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Suicidal_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Suicidal_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Suicidal_Three')
	SummonWaves(3)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_HOE_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_HOE_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_HOE_Three')
	NumMinionsToSpawn=10

	BattlePhases(0)={(bAllowedToSprint=true,
					  SprintCooldownTime=3.f,
					  bCanTentacleGrab=false,
					  bCanUseMissiles=true,
					  MissileAttackCooldownTime=10.f,
					  bCanUseMortar=false,
					  bCanChargeAttack=false,
					  bCanChargeAttack=true,
					  ChargeAttackCooldownTime=14.f,
					  MinigunAttackCooldownTime=2.25f,
					  HealAmounts={(0.75f, 1.0f, 1.0f, 1.0f)}, // Normal,Hard,Suicidal,HoE
					  bCanSummonMinions=true)}
	BattlePhases(1)={(bAllowedToSprint=true,
					  SprintCooldownTime=2.5f,
					  bCanTentacleGrab=true,
					  TentacleGrabCooldownTime=10.f,
					  TentacleDamage=10,
					  bCanUseMissiles=true,
					  MissileAttackCooldownTime=8.f,
					  bCanUseMortar=true,
					  MortarAttackCooldownTime=10.f,
					  bCanChargeAttack=true,
					  ChargeAttackCooldownTime=10.f,
					  MinigunAttackCooldownTime=2.0f,
					  HealAmounts={(0.65f, 1.0f, 1.0f, 1.0f)}, // Normal,Hard,Suicidal,HoE
					  MaxRageAttacks=4,
					  bCanSummonMinions=true)}
	BattlePhases(2)={(bAllowedToSprint=true,
					  SprintCooldownTime=2.f,
					  bCanTentacleGrab=true,
					  TentacleGrabCooldownTime=9.f,
					  TentacleDamage=10,
					  bCanUseMissiles=true,
					  MissileAttackCooldownTime=7.f,
					  bCanUseMortar=true,
					  MortarAttackCooldownTime=9.f,
					  bCanDoMortarBarrage=true,
					  bCanChargeAttack=true,
					  ChargeAttackCooldownTime=9.f,
					  MinigunAttackCooldownTime=1.75f,
					  HealAmounts={(0.6f, 0.8f, 0.8f, 0.9f)}, // Normal,Hard,Suicidal,HoE
					  MaxRageAttacks=5,
					  bCanSummonMinions=true)}
	BattlePhases(3)={(bAllowedToSprint=true,
					  SprintCooldownTime=1.5f,
					  bCanTentacleGrab=true,
					  TentacleGrabCooldownTime=7.f,
					  TentacleDamage=10,
					  bCanUseMissiles=true,
					  MissileAttackCooldownTime=5.f,
					  bCanUseMortar=true,
					  MortarAttackCooldownTime=7.f,
					  bCanDoMortarBarrage=true,
					  bCanChargeAttack=true,
					  ChargeAttackCooldownTime=7.f,
					  MinigunAttackCooldownTime=1.25f,
					  MaxRageAttacks=6,
					  bCanSummonMinions=true)}

	// ---------------------------------------------
	// Spawning
    MinSpawnSquadSizeType=EST_Boss
	LastFXBattlePhase=1
	CurrentBattlePhase=1
}