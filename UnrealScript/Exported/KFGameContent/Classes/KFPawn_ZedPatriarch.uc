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
var AkComponent CloakedAkComponent;
var AkEvent CloakedLoop;
var AkEvent CloakedLoopEnd;

/** Materials used for cloaking/visible states */
var MaterialInstanceConstant BodyMaterial;
var MaterialInstanceConstant BodyAltMaterial;
var MaterialInstanceConstant SpottedMaterial;
var MaterialInstanceConstant CloakedBodyMaterial;
var MaterialInstanceConstant CloakedBodyAltMaterial;

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

/** Interval between dialog play attempts */
var float TickDialogInterval;

/** Footstep camera shake */
var protected const float FootstepCameraShakePitchAmplitude;
var protected const float FootstepCameraShakeRollAmplitude;

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
    /** Per-phase, per-difficulty flag that when set to TRUE allows the Patriarch to move with his minigun */
    var 			array<bool> 	bCanMoveWhenMinigunning;
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

/** Number of times we've bumped into enemies when trying to heal */
var int NumFleeAndHealEnemyBumps;

/** Last time we bumped into an enemy */
var float LastFleeAndHealEnemyBumpTime;

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
			UpdateGameplayMICParams();
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

    // Start the dialog timer
    if( WorldInfo.NetMode != NM_Client )
    {
        SetTimer( 2.f, false, nameOf(Timer_TickPatriarchDialog) );
    }
}

/** Overloaded to support loading the alternate body mic */
simulated function SetCharacterArch( KFCharacterInfoBase Info, optional bool bForce )
{
	local int i;
    local KFCharacterInfo_Monster MonsterInfo;

	super.SetCharacterArch( Info );

    // Set our secondary material, attach our healing syringes
	if( WorldInfo.NetMode != NM_DedicatedServer && Mesh != None )
	{
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

        MonsterInfo = KFCharacterInfo_Monster(Info);
        if (MonsterInfo != none)
        {
            if (MaterialInstanceConstant(MonsterInfo.Skins[0]) != none)
            {
                BodyMaterial = MaterialInstanceConstant(MonsterInfo.Skins[0]);
            }
            if (MaterialInstanceConstant(MonsterInfo.Skins[1]) != none)
            {
                BodyAltMaterial = MaterialInstanceConstant(MonsterInfo.Skins[1]);
            }
        }
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

        // Initialize bump variables
		NumFleeAndHealEnemyBumps = 0;
		LastFleeAndHealEnemyBumpTime = WorldInfo.TimeSeconds;

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
    MinionWave = GetWaveInfo(CurrentBattlePhase, MyKFGameInfo.GameDifficulty);
    if( MinionWave != none )
    {
		if( MyKFGameInfo.SpawnManager != none )
		{
			MyKFGameInfo.SpawnManager.LeftoverSpawnSquad.Length = 0;
		 	MyKFGameInfo.SpawnManager.SummonBossMinions( MinionWave.Squads, GetNumMinionsToSpawn() );
		}
	}
}

/** Returns whether we are allowed to summon children or not */
function bool CanSummonChildren()
{
    return BattlePhases[CurrentBattlePhase-1].bCanSummonMinions;
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
	NewKActor.StaticMeshComponent.bCastDynamicShadow = false;

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

/** If the Patriarch repeatedly bumps into players during his flee and heal phase, just heal */
simulated event Bump( Actor Other, PrimitiveComponent OtherComp, Vector HitNormal )
{
    local KFPawn KFP;

    super.Bump( Other, OtherComp, HitNormal );

    if( Role == ROLE_Authority && bInFleeAndHealMode && MyKFAIC != none && !IsDoingSpecialMove() && Other.GetTeamNum() != GetTeamNum() )
    {
        KFP = KFPawn( Other );
        if( KFP != none )
        {
            if( (WorldInfo.TimeSeconds - LastFleeAndHealEnemyBumpTime) > 1.f )
            {
                ++NumFleeAndHealEnemyBumps;
                LastFleeAndHealEnemyBumpTime = WorldInfo.TimeSeconds;

                // If we've bumped into players enough times, just force a heal
                if( NumFleeAndHealEnemyBumps > 2 )
                {
                    NumFleeAndHealEnemyBumps = 0;
                    KFAIController_ZedPatriarch(MyKFAIC).ForceHeal();
                }
            }
        }
    }
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
    super.OnBattlePhaseChanged();
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

/** Used by AI to determine if we can mortar barrage this phase */
function bool CanDoMortarBarrage()
{
	return BattlePhases[CurrentBattlePhase-1].bCanDoMortarBarrage;
}

/** Only allow blocking when uncloaked/not fleeing */
function bool CanBlock()
{
	local KFAIController_ZedPatriarch MyPatController;

	if( bIsCloaking || bInFleeAndHealMode || !super.CanBlock() )
	{
		return false;
	}

	if( !IsHumanControlled() )
	{
		MyPatController = KFAIController_ZedPatriarch( Controller );
		if( MyPatController.bFleeing || MyPatController.bWantsToFlee )
		{
			return false;
		}
	}

	return true;
}

/** Only allow movement with the minigun if any conditions are met */
simulated function bool CanMoveWhenMinigunning()
{
	local KFGameReplicationInfo KFGRI;

	// See if this battle phase allows it
	KFGRI = KFGameReplicationInfo( WorldInfo.GRI );
	if( KFGRI != none && BattlePhases[CurrentBattlePhase-1].bCanMoveWhenMinigunning[KFGRI.GameDifficulty] )
	{
		return true;
	}

	// Allow moving when there's only one player left
	return LocalIsOnePlayerLeftInTeamGame();
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
	local int EnemyIndex;
	local KFAIController_ZedPatriarch MyPatController;
	local KFPawn EnemyPawn;

	MyPatController = KFAIController_ZedPatriarch( Controller );
	if( MyPatController == none )
	{
		return;
	}

	// Make sure we have an enemy!
	if( MyPatController.Enemy == none )
	{
		MyPatController.ForceSetEnemy( MyPatController.GetClosestEnemy() );
	}

	// Abort if still no enemy
	if( MyPatController.Enemy == none )
	{
		EndSpecialMove();
		return;
	}

	EnemyPawn = KFPawn( MyPatController.Enemy );

	// If this enemy isn't visible, fire at its last known location
	if( !MyPatController.CanSee(EnemyPawn) )
	{
		EnemyIndex = MyPatController.RecentlySeenEnemyList.Find( 'TrackedEnemy', EnemyPawn );
		if( EnemyIndex != INDEX_NONE )
		{
			TargetLoc = MyPatController.RecentlySeenEnemyList[EnemyIndex].LastVisibleLocation;
		}
		else
		{
			EnemyIndex = MyPatController.HiddenEnemies.Find( 'TrackedEnemy', EnemyPawn );
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
			CharacterMICs[1].SetVectorParameterValue( 'Vector_GlowColor', ActualBoilColor );
			BoilPulseAccum += DeltaTime * BoilPulseRate;
		}
		else
		{
			BoilPulseSin = 1.f;
		}

		if( CharacterMICs[0].Parent != SpottedMaterial )
		{
			MinCloakPct = GetMinCloakPct();

			if( !bIsCloaking )
			{
				if( CloakPercent < 1.0f )
				{
					CloakPercent = fMin( CloakPercent + DeltaTime*DeCloakSpeed, 1.f );

					if( CloakPercent == 1.0f )
					{
						UpdateGameplayMICParams();
					}
					else
					{
						CharacterMICs[0].SetScalarParameterValue( 'Transparency', CloakPercent );
						CharacterMICs[1].SetScalarParameterValue( 'Transparency', CloakPercent );
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
				CharacterMICs[0].SetScalarParameterValue( 'Transparency', CloakPercent );
				CharacterMICs[1].SetScalarParameterValue( 'Transparency', CloakPercent );

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
		CharacterMICs[0] = Mesh.CreateAndSetMaterialInstanceConstant( 0 );
		CharacterMICs[1] = Mesh.CreateAndSetMaterialInstanceConstant( 1 );

		Super.NotifyGoreMeshActive();
	}
}

/** Toggle cloaking material */
function SetCloaked(bool bNewCloaking)
{
	if( bCanCloak && bNewCloaking != bIsCloaking )
	{
		if( bNewCloaking && (IsImpaired() || IsIncapacitated()) )
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
				UpdateGameplayMICParams();
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
		UpdateGameplayMICParams();

		// Initial spotted callout should be slightly delayed
		bIsCloakingSpottedByLP = false;
		bIsCloakingSpottedByTeam = false;
		LastSpottedStatusUpdate = WorldInfo.TimeSeconds - 0.2f;
	}
	else if( bIsCloakingSpottedByLP || bIsCloakingSpottedByTeam )
	{
		UpdateGameplayMICParams();
	}
}

/** Interrupt cloaking when bEmpDisrupted is set */
function OnStackingAfflictionChanged(byte Id)
{
	local KFAIController_ZedPatriarch MyPatController;

	Super.OnStackingAfflictionChanged(Id);

	if( Role == ROLE_Authority && IsAliveAndWell() )
	{
		if ( Id == AF_EMP )
		{
			if( !bInFleeAndHealMode && !IsHumanControlled() )
			{
				// Interrupt charge and set it on full cooldown
				MyPatController = KFAIController_ZedPatriarch( Controller );
				if( !MyPatController.bWantsToFlee && !MyPatController.bFleeing )
				{
					MyPatController.bSprintUntilAttack = false;
					MyPatController.LastSprintTime = WorldInfo.TimeSeconds;
				}
				MyPatController.CachedChargeTarget = none;
				MyPatController.bWantsToCharge = false;
				MyPatController.LastChargeAttackTime = WorldInfo.TimeSeconds;
			}

			// Decloak if we're cloaking
			if( bIsCloaking )
			{
				SetCloaked( false );
			}
		}
	}
}

/** Called on server when pawn should do EMP Wandering */
function CausePanicWander()
{
	local KFAIController_ZedPatriarch MyPatController;

	if( bInFleeAndHealMode )
	{
		return;
	}

	// Don't allow panic wander when attempting to flee
	if( !IsHumanControlled() )
	{
		MyPatController = KFAIController_ZedPatriarch( Controller );
		if( MyPatController.bWantsToFlee || MyPatController.bFleeing )
		{
			return;
		}
	}

	super.CausePanicWander();
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
			UpdateGameplayMICParams();
		}
	}
}

/** notification from player with CallOut ability */
function CallOutCloaking( optional KFPlayerController CallOutController )
{
	bIsCloakingSpottedByTeam = true;
	UpdateGameplayMICParams();
	SetTimer(2.f, false, nameof(CallOutCloakingExpired));
}

/** Call-out cloaking ability has timed out */
function CallOutCloakingExpired()
{
	bIsCloakingSpottedByTeam = false;
	UpdateGameplayMICParams();
}

/** Handle cloaking materials */
simulated function UpdateGameplayMICParams()
{
	local int i;
	local bool bIsSpotted;
	local bool bWasCloaked;

	super.UpdateGameplayMICParams();

	// Cannot cloak after patriarch has been gored
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		// visible by local player or team (must go after ServerCallOutCloaking)
		bIsSpotted = ( bIsCloakingSpottedByLP || bIsCloakingSpottedByTeam );

		if( (!bIsCloaking || IsImpaired()) && CharacterMICs[0].Parent != BodyMaterial )
		{
			bWasCloaked = CharacterMICs[0].Parent == SpottedMaterial || CharacterMICs[0].Parent == CloakedBodyMaterial;

			CharacterMICs[0].SetParent( BodyMaterial );
			CharacterMICs[1].SetParent( BodyAltMaterial );
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

            //Update PAC meshes
            for (i = 0; i < 3; ++i)
            {
                if (ThirdPersonAttachments[i] != none)
                {
                    ThirdPersonAttachments[i].SetHidden(false);
                }
            }
		}
		else if ( bIsCloaking && bIsSpotted && CharacterMICs[0].Parent != SpottedMaterial )
		{
			CloakPercent = 1.0f;
			CharacterMICs[0].SetParent( SpottedMaterial );
			CharacterMICs[1].SetParent( SpottedMaterial );
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

            //Update PAC meshes
            for (i = 0; i < 3; ++i)
            {
                if (ThirdPersonAttachments[i] != none)
                {
                    ThirdPersonAttachments[i].SetHidden(true);
                }
            }
		}
		else if( bIsCloaking && !bIsSpotted && CharacterMICs[0].Parent != CloakedBodyMaterial )
		{
			CharacterMICs[0].SetParent( CloakedBodyMaterial );
			CharacterMICs[1].SetParent( CloakedBodyAltMaterial );
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

            //Update PAC meshes
            for (i = 0; i < 3; ++i)
            {
                if (ThirdPersonAttachments[i] != none)
                {
                    ThirdPersonAttachments[i].SetHidden(true);
                }
            }
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
	if( CharacterMICs[0] == none || CharacterMICs[1] == none || bIsCloakingSpottedByLP || bIsCloakingSpottedByTeam )
	{
		return;
	}

    switch( CurrentBattlePhase )
    {
    case 1:
        CharacterMICs[0].SetScalarParameterValue( 'Scalar_BattleGrime', 0.f );
        CharacterMICs[0].SetScalarParameterValue( 'Scalar_GlowFlashing', 0.f );
		CharacterMICs[0].SetVectorParameterValue( 'Vector_GlowColor', MechColors[0] );
        CharacterMICs[1].SetScalarParameterValue( 'Scalar_BattleGrime', 0.f );
        CharacterMICs[1].SetScalarParameterValue( 'Scalar_Damage_Blood_Contrast', 0.f );
        CharacterMICs[1].SetScalarParameterValue( 'Scalar_GlowFlashing', 0.f );
        CharacterMICs[1].SetVectorParameterValue( 'Vector_GlowColor', BoilColors[0] );
        break;

    case 2:
        CharacterMICs[0].SetScalarParameterValue( 'Scalar_BattleGrime', 0.3f );
        CharacterMICs[0].SetScalarParameterValue( 'Scalar_GlowFlashing', 0.25f );
		CharacterMICs[0].SetVectorParameterValue( 'Vector_GlowColor', MechColors[1] );
        CharacterMICs[1].SetScalarParameterValue( 'Scalar_BattleGrime', 0.25f );
        CharacterMICs[1].SetScalarParameterValue( 'Scalar_Damage_Blood_Contrast', 1.f );
        CharacterMICs[1].SetScalarParameterValue( 'Scalar_GlowFlashing', 0.f );
        CharacterMICs[1].SetVectorParameterValue( 'Vector_GlowColor', BoilColors[1] );
        break;

    case 3:
        CharacterMICs[0].SetScalarParameterValue( 'Scalar_BattleGrime', 0.7f );
        CharacterMICs[0].SetScalarParameterValue( 'Scalar_GlowFlashing', 0.5f );
		CharacterMICs[0].SetVectorParameterValue( 'Vector_GlowColor', MechColors[2] );
        CharacterMICs[1].SetScalarParameterValue( 'Scalar_BattleGrime', 0.5f );
        CharacterMICs[1].SetScalarParameterValue( 'Scalar_Damage_Blood_Contrast', 1.2f );
        CharacterMICs[1].SetScalarParameterValue( 'Scalar_GlowFlashing', 0.f );
        CharacterMICs[1].SetVectorParameterValue( 'Vector_GlowColor', BoilColors[2] );
        break;

    case 4:
        CharacterMICs[0].SetScalarParameterValue( 'Scalar_BattleGrime', 1.1f );
        CharacterMICs[0].SetScalarParameterValue( 'Scalar_GlowFlashing', 0.75f );
		CharacterMICs[0].SetVectorParameterValue( 'Vector_GlowColor', MechColors[3] );
        CharacterMICs[1].SetScalarParameterValue( 'Scalar_BattleGrime', 0.75f );
        CharacterMICs[1].SetScalarParameterValue( 'Scalar_Damage_Blood_Contrast', 1.3f );
        CharacterMICs[1].SetScalarParameterValue( 'Scalar_GlowFlashing', 0.f );
        CharacterMICs[1].SetVectorParameterValue( 'Vector_GlowColor', BoilColors[3] );
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
simulated function PlayTakeHitEffects( vector HitDirection, vector HitLocation, optional bool bUseHitImpulse = true )
{
	super.PlayTakeHitEffects( HitDirection, HitLocation, bUseHitImpulse );

	if( !bIsCloaking || CharacterMICs[0].Parent == SpottedMaterial || CloakPercent > CloakShimmerAmount || (WorldInfo.TimeSeconds - LastCloakShimmerTime) < 0.1f )
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
		return CharacterArch.ImpactSkins[4]; // 4 = Patriarch_Cloaked
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
	if( CharacterMICs.Length > 0 && CharacterMICs[0] != none )
	{
		CharacterMICs[0].SetVectorParameterValue( 'Vector_GlowColor', DeadMechColor );
		CharacterMICs[0].SetScalarParameterValue( 'Scalar_GlowFlashing', 0.f );
	}
	if( CharacterMICs.Length > 1 && CharacterMICs[1] != none )
	{
		CharacterMICs[1].SetVectorParameterValue( 'Vector_GlowColor', DeadBoilColor );
		CharacterMICs[1].SetScalarParameterValue( 'Scalar_GlowFlashing', 0.f );
	}
	BoilLightComponent.SetEnabled( false );
	DetachComponent( BoilLightComponent );

	PlayStealthSoundLoopEnd();

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

/** Overridden to cause slight camera shakes when walking. */
simulated event PlayFootStepSound(int FootDown)
{
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( IsHumanControlled() && IsLocallyControlled() )
		{
			FootstepCameraShake.RotOscillation.Pitch.Amplitude = 0;
			FootstepCameraShake.RotOscillation.Roll.Amplitude = 0;
		}
		else
		{
			FootstepCameraShake.RotOscillation.Pitch.Amplitude = FootstepCameraShakePitchAmplitude;
			FootstepCameraShake.RotOscillation.Roll.Amplitude = FootstepCameraShakeRollAmplitude;
			FootstepCameraShakeInnerRadius = default.FootstepCameraShakeInnerRadius;
			FootstepCameraShakeOuterRadius = default.FootstepCameraShakeOuterRadius;
			if( !bIsSprinting || VSizeSQ(Velocity) < 10000.f )
			{
				FootstepCameraShake.RotOscillation.Pitch.Amplitude *= 0.75f;
				FootstepCameraShake.RotOscillation.Roll.Amplitude *= 0.75f;
			}			
		}
	}

	super.PlayFootStepSound( FootDown );
}

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
	if( WorldInfo.NetMode != NM_DedicatedServer && !CloakedAkComponent.IsPlaying(CloakedLoop) )
	{
		CloakedAkComponent.PlayEvent( CloakedLoop, true, true );
	}
}

simulated function PlayStealthSoundLoopEnd()
{
	if( WorldInfo.NetMode != NM_DedicatedServer && CloakedAkComponent.IsPlaying(CloakedLoop) )
	{
		CloakedAkComponent.PlayEvent( CloakedLoopEnd, true, true );
	}
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

/** Players dialog such as taunts at regular intervals */
function Timer_TickPatriarchDialog()
{
	if( !IsAliveAndWell() )
	{
		return;
	}

    if( !IsDoingSpecialMove() )
    {
        if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayPatriarchTickDialog( self );
    }

    SetTimer( TickDialogInterval, false, nameOf(Timer_TickPatriarchDialog) );
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
   Begin Object Class=AkComponent Name=CloakedAkComponent0
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="CloakedAkComponent0"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   CloakedAkComponent=CloakedAkComponent0
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
   TickDialogInterval=0.500000
   FootstepCameraShakePitchAmplitude=120.000000
   FootstepCameraShakeRollAmplitude=60.000000
   LastFXBattlePhase=1
   BattlePhases(0)=(bAllowedToSprint=True,SprintCooldownTime=3.000000,bCanUseMissiles=True,MissileAttackCooldownTime=10.000000,bCanChargeAttack=True,ChargeAttackCooldownTime=14.000000,MinigunAttackCooldownTime=2.250000,bCanSummonMinions=True,bCanMoveWhenMinigunning=(False,False,False,False),HealAmounts=(0.750000,0.850000,0.950000,0.990000))
   BattlePhases(1)=(bAllowedToSprint=True,SprintCooldownTime=2.500000,bCanTentacleGrab=True,TentacleGrabCooldownTime=10.000000,bCanUseMissiles=True,MissileAttackCooldownTime=8.000000,bCanUseMortar=True,MortarAttackCooldownTime=10.000000,bCanChargeAttack=True,ChargeAttackCooldownTime=10.000000,MaxRageAttacks=4,TentacleDamage=10,MinigunAttackCooldownTime=2.000000,bCanSummonMinions=True,bCanMoveWhenMinigunning=(False,False,False,True),HealAmounts=(0.650000,0.750000,0.850000,0.950000))
   BattlePhases(2)=(bAllowedToSprint=True,SprintCooldownTime=2.000000,bCanTentacleGrab=True,TentacleGrabCooldownTime=9.000000,bCanUseMissiles=True,MissileAttackCooldownTime=7.000000,bCanUseMortar=True,MortarAttackCooldownTime=9.000000,bCanDoMortarBarrage=True,bCanChargeAttack=True,ChargeAttackCooldownTime=9.000000,MaxRageAttacks=5,TentacleDamage=10,MinigunAttackCooldownTime=1.750000,bCanSummonMinions=True,bCanMoveWhenMinigunning=(False,False,True,True),HealAmounts=(0.550000,0.650000,0.750000,0.850000))
   BattlePhases(3)=(bAllowedToSprint=True,SprintCooldownTime=1.500000,bCanTentacleGrab=True,TentacleGrabCooldownTime=7.000000,bCanUseMissiles=True,MissileAttackCooldownTime=5.000000,bCanUseMortar=True,MortarAttackCooldownTime=7.000000,bCanDoMortarBarrage=True,bCanChargeAttack=True,ChargeAttackCooldownTime=7.000000,MaxRageAttacks=6,TentacleDamage=10,MinigunAttackCooldownTime=1.250000,bCanMoveWhenMinigunning=(False,True,True,True))
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
   SummonWaves(0)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Normal_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Normal_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Normal_Three')
   SummonWaves(1)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Hard_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Hard_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Hard_Three')
   SummonWaves(2)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Suicidal_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Suicidal_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_Suicidal_Three')
   SummonWaves(3)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_HOE_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_HOE_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Pat_Minions_HOE_Three')
   NumMinionsToSpawn=(X=6.000000,Y=10.000000)
   CurrentBattlePhase=1
   BossCaptionStrings(0)="Kevin Clamely was once a brilliant scientist, until he became his own greatest creation."
   BossCaptionStrings(1)="The Patriarch is staggeringly arrogant - he is likely to tell you which attack he will use next."
   BossCaptionStrings(2)="Hiding behind even big objects won't help as much as you'd hope. The Patriarch has an answer for that!"
   BossCaptionStrings(3)="Running off on your own isn't an escape - it makes you easy prey he will target first."
   BossCaptionStrings(4)="Yes, the Patriarch can still cloak, go invisible, run off, and heal himself. Some things don't change."
   BossCaptionStrings(5)="While you won't get much choice about it, killing The Patriarch's 'children' just makes him mad(der)."
   bLargeZed=True
   bCanGrabAttack=True
   MonsterArchPath="ZED_ARCH.ZED_Patriarch_Archetype"
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
   WeakSpotSocketNames(0)="FX_Right_Arm_Spike"
   WeakSpotSocketNames(1)="FX_Front_Spike"
   DamageTypeModifiers(0)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(0.500000))
   DamageTypeModifiers(1)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle',DamageScale=(0.500000))
   DamageTypeModifiers(2)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun',DamageScale=(0.400000))
   DamageTypeModifiers(3)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun',DamageScale=(0.500000))
   DamageTypeModifiers(4)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle',DamageScale=(0.500000))
   DamageTypeModifiers(5)=(DamageType=Class'KFGame.KFDT_Slashing')
   DamageTypeModifiers(6)=(DamageType=Class'KFGame.KFDT_Bludgeon')
   DamageTypeModifiers(7)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(0.500000))
   DamageTypeModifiers(8)=(DamageType=Class'kfgamecontent.KFDT_Microwave',DamageScale=(0.900000))
   DamageTypeModifiers(9)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=(0.400000))
   DamageTypeModifiers(10)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=(0.500000))
   DamageTypeModifiers(11)=(DamageType=Class'KFGame.KFDT_Toxic',DamageScale=(0.050000))
   DifficultySettings=Class'kfgamecontent.KFDifficulty_Patriarch'
   BumpDamageType=Class'KFGame.KFDT_NPCBump_Large'
   FootstepCameraShakeInnerRadius=200.000000
   FootstepCameraShakeOuterRadius=1000.000000
   FootstepCameraShake=CameraShake'kfgamecontent.Default__KFPawn_ZedPatriarch:FootstepCameraShake0'
   OnDeathAchievementID=130
   PawnAnimInfo=KFPawnAnimInfo'ZED_Patriarch_ANIM.Patriarch_AnimGroup'
   LocalizationKey="KFPawn_ZedPatriarch"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_MonsterBoss:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_MonsterBoss:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bEnableAimOffset=True
   bCanCloak=True
   HitZones(0)=(GoreHealth=2147483647,DmgScale=1.000000)
   HitZones(1)=(ZoneName="Jaw",BoneName="Jaw",GoreHealth=2147483647,DmgScale=0.100000,SkinID=1)
   HitZones(2)=(BoneName="Spine1",DmgScale=0.800000,SkinID=1)
   HitZones(3)=(ZoneName="stomach",BoneName="Spine",GoreHealth=2147483647,DmgScale=0.800000,Limb=BP_Torso,SkinID=1)
   HitZones(4)=(DmgScale=0.100000,SkinID=2)
   HitZones(5)=(GoreHealth=20,DmgScale=0.100000,SkinID=2)
   HitZones(6)=()
   HitZones(7)=(DmgScale=1.300000,SkinID=3)
   HitZones(8)=(GoreHealth=20,SkinID=3)
   HitZones(9)=(BoneName="RightHand",GoreHealth=10,DmgScale=0.500000,SkinID=1)
   HitZones(10)=(BoneName="Spine",GoreHealth=2147483647,DmgScale=0.800000,SkinID=1)
   HitZones(11)=()
   HitZones(12)=(GoreHealth=100,DmgScale=0.100000,SkinID=2)
   HitZones(13)=(GoreHealth=2147483647,DmgScale=0.100000,SkinID=2)
   HitZones(14)=(BoneName="LeftFoot",GoreHealth=10,DmgScale=0.100000,SkinID=2)
   HitZones(15)=(DmgScale=0.800000,SkinID=1)
   HitZones(16)=(DmgScale=0.800000,SkinID=1)
   HitZones(17)=()
   HitZones(18)=(ZoneName="heart",BoneName="FrontTentacle2",DmgScale=1.300000,Limb=BP_Special,SkinID=3)
   HitZones(19)=(ZoneName="heart",BoneName="FrontTentacle3",DmgScale=1.300000,Limb=BP_Special,SkinID=3)
   HitZones(20)=(ZoneName="heart",BoneName="FrontTentacle4",DmgScale=1.300000,Limb=BP_Special,SkinID=3)
   HitZones(21)=(ZoneName="heart",BoneName="FrontTentacle5",DmgScale=1.300000,Limb=BP_Special,SkinID=3)
   HitZones(22)=(ZoneName="heart",BoneName="FrontTentacle6",DmgScale=1.300000,Limb=BP_Special,SkinID=3)
   HitZones(23)=(ZoneName="heart",BoneName="FrontTentacle7",DmgScale=1.500000,Limb=BP_Special,SkinID=3)
   PenetrationResistance=4.000000
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'KFGame.Default__KFPawn_MonsterBoss:Afflictions_0'
      AfflictionClasses(0)=Class'KFGame.KFAffliction_EMPDisrupt'
      AfflictionClasses(1)=Class'kfgamecontent.KFAffliction_Fire_Patriarch'
      AfflictionClasses(2)=()
      AfflictionClasses(3)=()
      AfflictionClasses(4)=()
      AfflictionClasses(5)=()
      AfflictionClasses(6)=()
      AfflictionClasses(7)=()
      AfflictionClasses(8)=()
      AfflictionClasses(9)=()
      AfflictionClasses(10)=()
      AfflictionClasses(11)=()
      FireFullyCharredDuration=50.000000
      FireCharPercentThreshhold=0.350000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'KFGame.Default__KFPawn_MonsterBoss:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedPatriarch:Afflictions_0'
   IncapSettings(0)=(Duration=2.200000,Cooldown=10.000000,Vulnerability=(0.950000))
   IncapSettings(1)=(Duration=1.200000,Cooldown=15.000000,Vulnerability=(0.650000))
   IncapSettings(2)=(Cooldown=2.000000,Vulnerability=(0.100000,0.950000,0.100000,0.100000,0.750000))
   IncapSettings(3)=(Cooldown=1.700000,Vulnerability=(0.100000,0.100000,0.100000,0.100000,0.500000))
   IncapSettings(4)=(Cooldown=10.000000,Vulnerability=(0.100000,0.300000,0.100000,0.100000,0.400000))
   IncapSettings(5)=(Duration=1.250000,Cooldown=17.000000,Vulnerability=(0.100000,0.550000,0.100000,0.100000,0.550000))
   IncapSettings(6)=(Vulnerability=(0.000000))
   IncapSettings(7)=(Duration=3.000000,Cooldown=10.500000,Vulnerability=(1.000000,1.000000,2.000000,1.000000,1.000000))
   IncapSettings(8)=(Cooldown=20.000000,Vulnerability=(0.100000,0.400000,0.100000,0.100000,0.250000))
   IncapSettings(9)=(Duration=1.000000,Cooldown=10.000000,Vulnerability=(0.500000))
   IncapSettings(10)=(Duration=3.000000,Cooldown=10.000000,Vulnerability=(0.080000))
   IncapSettings(11)=(Cooldown=10.000000,Vulnerability=(0.150000))
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
      SpecialMoveClasses(3)=Class'KFGame.KFSM_Patriarch_Grapple'
      SpecialMoveClasses(4)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(10)=None
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=None
      SpecialMoveClasses(13)=Class'kfgamecontent.KFSM_Patriarch_Taunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=Class'KFGame.KFSM_Block'
      SpecialMoveClasses(18)=Class'kfgamecontent.KFSM_Patriarch_Heal'
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=Class'kfgamecontent.KFSM_Patriarch_MortarAttack'
      SpecialMoveClasses(21)=Class'kfgamecontent.KFSM_Patriarch_MissileAttack'
      SpecialMoveClasses(22)=Class'kfgamecontent.KFSM_Patriarch_MinigunBarrage'
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
      SpecialMoveClasses(35)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
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
   DamageRecoveryTimeHeavy=0.650000
   DamageRecoveryTimeMedium=0.850000
   Mass=400.000000
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
   Components(8)=CloakedAkComponent0
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=50000,Yaw=50000,Roll=50000)
   Name="Default__KFPawn_ZedPatriarch"
   ObjectArchetype=KFPawn_MonsterBoss'KFGame.Default__KFPawn_MonsterBoss'
}
