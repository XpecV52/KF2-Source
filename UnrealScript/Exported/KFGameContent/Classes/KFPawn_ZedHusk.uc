//=============================================================================
// KFPawn_ZedHusk
//=============================================================================
// Husk
// Attack Sequences:
//	Atk_Combo1_V1
//	Atk_Flame_V1
//	Atk_Shoot_V1
//	Atk_Shoot_V2
//	Atk_Suicide_V1
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedHusk extends KFPawn_Monster;

/** Struct containing difficulty-based settings for the fireball */
struct sHuskFireballSettings
{
	/** Whether the explosion should trigger a secondary ground fire explosion */
	var bool bSpawnGroundFire;

	/** How much momentum to apply to the fireball */
	var float ExplosionMomentum;
};

/** Fireball projectile attack */
var protected const class<KFProj_Husk_Fireball> FireballClass;

/** Fireball settings, set per difficulty */
var transient sHuskFireballSettings FireballSettings;

/** Player-controlled offset for firing fireballs. */
var protected vector PlayerFireOffset;

/** HitZoneIndex of backpack zone */
const BackpackZoneIndex = 3;

/** Explosion template for backpack/suicide */
var protected KFGameExplosion ExplosionTemplate;

/** Set when husk blows up to make sure it only happens once */
var protected transient bool bHasExploded;
var protected transient bool bHasSuicideExploded;

/** Chest light */
var protected PointLightComponent ChestLightComponent;
var protected const name ChestLightSocketName;
var protected const float FireballChargeLightRadius;
var protected const float AmbientLightRadiusInterpSpeed;
var protected const float FireballLightRadiusInterpSpeed;
var protected const float FireballLightMinBrightness;
var protected const float FireballLightMaxBrightness;
var protected bool bUseFireballLightRadius;

/** Called from Possessed event when this controller has taken control of a Pawn */
function PossessedBy( Controller C, bool bVehicleTransition )
{
	local KFGameReplicationInfo KFGRI;

	super.PossessedBy( C, bVehicleTransition );

	// Set our difficulty-based settings
	if( !bVersusZed )
	{
		KFGRI = KFGameReplicationInfo( WorldInfo.GRI );
		if( KFGRI != none )
		{
			FireballSettings = class<KFDifficulty_Husk>(DifficultySettings).static.GetFireballSettings( self, KFGRI );
		}
	}
}

/** Initialize our light */
simulated function SetCharacterArch( KFCharacterInfoBase Info, optional bool bForce )
{
	super.SetCharacterArch( Info, bForce );

	if( WorldInfo.NetMode != NM_DedicatedServer && !ChestLightComponent.bAttached && WorldInfo.GetDetailMode() > DM_Low )
	{
		Mesh.AttachComponentToSocket( ChestLightComponent, ChestLightSocketName );
		ChestLightComponent.SetEnabled( true );
		KFLightPool(WorldInfo.MyLightPool).RegisterPointLight( ChestLightComponent, LPP_GameplayUsed );
	}
}

/*********************************************************************************************
* Flamethrower attack handling
**********************************************************************************************/

/** Turns medium range flamethrower effect on */
simulated function ANIMNOTIFY_FlameThrowerOn()
{
    if( IsDoingSpecialMove(SM_HoseWeaponAttack) )
	{
		KFSM_Husk_FlameThrowerAttack(SpecialMoves[SpecialMove]).TurnOnFlamethrower();
	}
}

/** Turns medium range flamethrower effect off */
simulated function ANIMNOTIFY_FlameThrowerOff()
{
    if( IsDoingSpecialMove(SM_HoseWeaponAttack) )
	{
		KFSM_Husk_FlameThrowerAttack(SpecialMoves[SpecialMove]).TurnOffFlamethrower();
	}
}

/** Called from melee special move when it's interrupted */
function NotifyAnimInterrupt( optional AnimNodeSequence SeqNode )
{
	if( MyKFAIC != none && (IsImpaired() || IsHeadless()) && !MyKFAIC.GetActiveCommand().IsA('AICommand_HeadlessWander') )
	{
		class'AICommand_HeadlessWander'.Static.HeadlessWander( MyKFAIC );
	}
}

/*********************************************************************************************
* Fireball projectile attack handling
**********************************************************************************************/

simulated function ANIMNOTIFY_WarnZedsOfFireball()
{
	local Actor HitActor;
	local PlayerController PC;
	local KFPawn_Monster HitMonster;
	local vector FireLocation;
	local vector TraceStart, TraceEnd, HitLocation, HitNormal;
	local vector DangerPoint, AimDirection;

	if( Role == ROLE_Authority )
	{
		if( IsHumanControlled() )
		{
			PC = PlayerController( Controller );
			if( PC == none )
			{
				return;
			}

		    FireLocation = GetPawnViewLocation() + (PlayerFireOffset >> GetViewRotation());

		    TraceStart = PC.PlayerCamera.CameraCache.POV.Location;
		    TraceEnd = PC.PlayerCamera.CameraCache.POV.Location + vector(PC.PlayerCamera.CameraCache.POV.Rotation)*5000.f;

		    HitActor = Trace( HitLocation, HitNormal, TraceEnd, TraceStart, TRUE,,,TRACEFLAG_Bullet );

		    if( HitActor != none )
		    {
		        AimDirection = HitLocation - FireLocation;
		        TraceEnd = HitLocation;
		    }
		    else
		    {
			   AimDirection = TraceEnd - FireLocation;
			}		
		}
		else
		{
			AimDirection = MyKFAIC.Enemy.Location - Location;
			FireLocation = MyKFAIC.Enemy.Location;
		}

		foreach TraceActors(class'KFPawn_Monster', HitMonster, HitLocation, HitNormal, FireLocation, Location, vect(50,50,50))
		{
			if( HitMonster.MyKFAIC != none )
			{
				// Get the closest point from the hit monster to the line trace to determine which way it should evade
				PointDistToLine(HitMonster.Location, AimDirection, Location, DangerPoint);

				// Tell the zed to evade away from the DangerPoint
				HitMonster.MyKFAIC.ReceiveLocationalWarning( DangerPoint, Location );
			}
		}
	}

	SetFireLightEnabled( bVersusZed ? false : true );
}

simulated function SetFireLightEnabled( bool bEnable )
{
	if( WorldInfo.NetMode == NM_DedicatedServer || bPlayedDeath || ChestLightComponent == none || !ChestLightComponent.bAttached )
	{
		return;
	}

	bUseFireballLightRadius = bEnable && !WorldInfo.bDropDetail && (WorldInfo.TimeSeconds - ChestLightComponent.LastRenderTime) < 0.25f;

	if( bEnable )
	{
		ChestLightComponent.MinBrightness = FireballLightMinBrightness;
		ChestLightComponent.MaxBrightness = FireballLightMaxBrightness;
	}
	else
	{
		ChestLightComponent.MinBrightness = default.ChestLightComponent.MinBrightness;
		ChestLightComponent.MaxBrightness = default.ChestLightComponent.MaxBrightness;
	}
}

simulated event Tick( float DeltaTime )
{
	super.Tick( DeltaTime );

	if( WorldInfo.NetMode == NM_DedicatedServer || bPlayedDeath || ChestLightComponent == none || !ChestLightComponent.bAttached )
	{
		return;
	}

	if( bUseFireballLightRadius )
	{
		if( ChestLightComponent.Radius < FireballChargeLightRadius )
		{
			ChestLightComponent.SetRadius( FInterpConstantTo(ChestLightComponent.Radius, FireballChargeLightRadius, DeltaTime, FireballLightRadiusInterpSpeed) );
		}
	}
	else if( ChestLightComponent.Radius > default.ChestLightComponent.Radius )
	{
		ChestLightComponent.SetRadius( FInterpConstantTo(ChestLightComponent.Radius, default.ChestLightComponent.Radius, DeltaTime, AmbientLightRadiusInterpSpeed) );			
	}
}

/** AnimNotify which launches the fireball projectile */
simulated function ANIMNOTIFY_HuskFireballAttack()
{
	local KFAIController_ZedHusk HuskAIC;
	local KFSM_Husk_FireballAttack FireballSM;

	if( MyKFAIC != none )
	{
		FireballSM = KFSM_Husk_FireBallAttack( SpecialMoves[SpecialMove] );
		if( FireballSM != none )
		{
			FireballSM.NotifyFireballFired();
		}

		HuskAIC = KFAIController_ZedHusk(MyKFAIC);
		if( HuskAIC != none )
		{
			HuskAIC.ShootFireball( FireballClass, FireballSM.GetFireOffset() );
		}
	}

	SetFireLightEnabled( false );
}

/** Overridden for updating spray collision */
simulated event vector GetWeaponStartTraceLocation( optional weapon CurrentWeapon )
{
	local vector Loc;
	local rotator Rot;
	local KFAIController_ZedHusk HuskAIC;

	if( MyKFAIC != none )
	{
		HuskAIC = KFAIController_ZedHusk(MyKFAIC);
		if( HuskAIC != none )
		{
			Mesh.GetSocketWorldLocationAndRotation( HuskAIC.FireballSocketName, Loc, Rot );
			return Loc;
		}
	}

	return super.GetWeaponStartTraceLocation();
}

/** Overriden to ensure flame thrower turns off on death or destruction */
simulated function TerminateEffectsOnDeath()
{
    if( IsDoingSpecialMove(SM_HoseWeaponAttack) )
	{
		SpecialMoveHandler.EndSpecialMove();
	}

 	if( ChestLightComponent != none && ChestLightComponent.bAttached )
 	{
		ChestLightComponent.DetachFromAny();
		ChestLightComponent = none;
	}

	super.TerminateEffectsOnDeath();
}

/*********************************************************************************************
* Explode / Suicide
**********************************************************************************************/

/** Called from SkeletalMeshComponent::PlayParticleEffect() */
simulated function OnAnimNotifyParticleSystemSpawned( const AnimNotify_PlayParticleEffect AnimNotifyData, ParticleSystemComponent PSC )
{
	// Since anim notify particle systems can spawn after the special move ends, we need to kill any latent suicide FX
	if( !IsDoingSpecialMove(GetSuicideSM()) && InStr(string(PSC.Template.Name), "suicide",, true) != INDEX_NONE )
	{
		PSC.SetActive( false );
		return;
	}

	super.OnAnimNotifyParticleSystemSpawned( AnimNotifyData, PSC );
}

simulated function ESpecialMove GetSuicideSM()
{
	return SM_Suicide;
}

/** Initialize GoreHealth (Server only) */
function ApplySpecialZoneHealthMod(float HealthMod)
{
	Super.ApplySpecialZoneHealthMod(HealthMod);

	HitZones[BackpackZoneIndex].GoreHealth = default.HitZones[BackpackZoneIndex].GoreHealth * HealthMod;
}

/** Override for Husk's backpack explosion */
function bool CanInjureHitZone(class<DamageType> DamageType, int HitZoneIdx)
{
	if( HitZoneIdx == BackpackZoneIndex && (!bPlayedDeath || WorldInfo.TimeSeconds == TimeOfDeath) )
	{
		return true;
	}

	return super.CanInjureHitZone(DamageType, HitZoneIdx);
}

/** Reliably play any gore effects related to a zone/limb being dismembered */
simulated function HitZoneInjured(optional int HitZoneIdx=INDEX_None)
{
	Super.HitZoneInjured(HitZoneIdx);

    // Server only since we use a replicated explosion actor
	if ( Role == ROLE_Authority && HitZoneIdx == BackpackZoneIndex )
	{
		TriggerExplosion( true );
	}
}

/** Called when husk backpack is exploded or when husk suicides */
function TriggerExplosion(optional bool bIgnoreHumans)
{
	local KFExplosionActorReplicated ExploActor;
	local Controller DamageInstigator, OldController;
	local bool bExplodeOnDeath;

	bExplodeOnDeath = WorldInfo.TimeSeconds == TimeOfDeath;

	// Only living husks can explode... and only once
	if( !bHasExploded && (!bPlayedDeath || bExplodeOnDeath) )
	{
		OldController = Controller;
        bHasExploded = true;
        bHasSuicideExploded = !bIgnoreHumans;

		if( Role == ROLE_Authority )
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
				if ( bIgnoreHumans )
				{
					ExplosionTemplate.ActorClassToIgnoreForDamage = class'KFPawn_Human';
				}
                else
                {
                    ExplosionTemplate.ActorClassToIgnoreForDamage = none;
                }

				ExploActor.Explode(ExplosionTemplate, vect(0,0,1));
			}

			// Make sure we're dead!
			if( !bPlayedDeath || bExplodeOnDeath )
			{
				TakeRadiusDamage(DamageInstigator, 10000, ExplosionTemplate.DamageRadius, ExplosionTemplate.MyDamageType, ExplosionTemplate.MomentumTransferScale, Location, true, self);
			}
		}

		OnExploded( OldController );
	}
}

/** Overriden in subclasses.  Determines if we should explode on death in specific game modes */
function bool WeeklyShouldExplodeOnDeath()
{
    return !bHasExploded || !bHasSuicideExploded;
}

/** Do any explosion death-related actions */
simulated function OnExploded( Controller SuicideController );

/*********************************************************************************************
* Damage handling
**********************************************************************************************/

/** Make sure damage to myself is enough to kill me when it's my suicide attack */
function AdjustDamage(out int InDamage, out vector Momentum, Controller InstigatedBy, vector HitLocation, class<DamageType> DamageType, TraceHitInfo HitInfo, Actor DamageCauser)
{
	Super.AdjustDamage( InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser );

	if( MyKFAIC != none && MyKFAIC.IsSuicidal() && InstigatedBy == MyKFAIC && IsDoingSpecialMove(SM_Suicide) )
	{
		InDamage = 10000;
	}
}

function NotifyTakeHit(Controller InstigatedBy, vector HitLocation, int Damage, class<DamageType> DamageType, vector Momentum, Actor DamageCauser)
{
	local KFAIDirector KFAID;
	local Pawn NewEnemy;

	// @todo: move to controller NotifyTakeHit
	if( Role == ROLE_Authority && MyKFAIC != none && MyKFAIC.IsSuicidal() && AICommand_Husk_Suicide(MyKFAIC.GetActiveCommand()) == none )
	{
		MyKFAIC.AIActionStatus = "Suicidal!";
		//TODO: Don't sprint if it's obvious that my initial suicide goal is a short distance from here
		bIsSprinting = true;  // Don't trust SetSprinting since the result might depend on game difficulty level

		if( FRand() < 0.4f || MyKFAIC.Enemy == none || MyKFAIC.Enemy.Health <= 0 )
		{
			KFAID = KFGameInfo(WorldInfo.Game).GetAIDirector();
			if( KFAID != none )
			{
				NewEnemy = Pawn( KFAID.FindEnemyFor( MyKFAIC, true ) );
				if( NewEnemy != none )
				{
					MyKFAIC.SetEnemy( NewEnemy );
				}
			}
		}
	}
	Super.NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum, DamageCauser);
}

function PlayHit( float Damage, Controller InstigatedBy, vector HitLocation, class<DamageType> damageType, vector Momentum, TraceHitInfo HitInfo )
{
 	super.PlayHit( Damage, InstigatedBy, HitLocation, damageType, Momentum, HitInfo );

	// This forces the husk to die immediately when hit by an emp during his suicide move
	if( bEmpDisrupted && IsDoingSpecialMove(SM_Suicide) )
	{
		Died(InstigatedBy, DamageType, HitLocation);
	}
}

/** Interrupt certain moves when bEmpDisrupted is set */
function OnStackingAfflictionChanged(byte Id)
{
	Super.OnStackingAfflictionChanged(Id);

	if( MyKFAIC == none || !IsAliveAndWell() )
	{
		return;
	}

	if ( bEMPDisrupted )
	{
		if( IsDoingSpecialMove(SM_StandAndShootAttack) || IsDoingSpecialMove(SM_HoseWeaponAttack) )
		{
		    EndSpecialMove();
		}
	}
}

/** Returns (hardcoded) dialog event ID for when trader gives advice to player who was killed by this zed type */
static function int GetTraderAdviceID()
{
	return 45;//TRAD_AdviceHusk
}

defaultproperties
{
   FireballClass=Class'kfgamecontent.KFProj_Husk_Fireball'
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedHusk:ExploTemplate0'
   Begin Object Class=PointLightComponent Name=ChestLightComponent0
      Radius=160.000000
      Brightness=0.500000
      LightColor=(B=40,G=155,R=250,A=255)
      bEnabled=False
      CastShadows=False
      LightingChannels=(Outdoor=True)
      MaxBrightness=0.500000
      MinBrightness=0.400000
      AnimationType=1
      AnimationFrequency=2.000000
      Name="ChestLightComponent0"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   ChestLightComponent=ChestLightComponent0
   ChestLightSocketName="ChestLightSocket"
   FireballChargeLightRadius=256.000000
   AmbientLightRadiusInterpSpeed=300.000000
   FireballLightRadiusInterpSpeed=100.000000
   FireballLightMinBrightness=1.100000
   FireballLightMaxBrightness=1.250000
   MonsterArchPath="ZED_ARCH.ZED_Husk_Archetype"
   ParryResistance=2
   MinSpawnSquadSizeType=EST_Medium
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
      BaseDamage=15.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_ZedWeak'
      MomentumTransfer=25000.000000
      MaxHitRange=180.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedHusk:MeleeHelper_0'
   DoshValue=17
   XPValues(0)=15.000000
   XPValues(1)=20.000000
   XPValues(2)=27.000000
   XPValues(3)=31.000000
   WeakSpotSocketNames(1)="WeakPointSocket1"
   DamageTypeModifiers(0)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(0.750000))
   DamageTypeModifiers(1)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle',DamageScale=(0.650000))
   DamageTypeModifiers(2)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun')
   DamageTypeModifiers(3)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun',DamageScale=(0.850000))
   DamageTypeModifiers(4)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle',DamageScale=(0.700000))
   DamageTypeModifiers(5)=(DamageType=Class'KFGame.KFDT_Slashing',DamageScale=(0.750000))
   DamageTypeModifiers(6)=(DamageType=Class'KFGame.KFDT_Bludgeon',DamageScale=(0.850000))
   DamageTypeModifiers(7)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(0.500000))
   DamageTypeModifiers(8)=(DamageType=Class'kfgamecontent.KFDT_Microwave',DamageScale=(1.150000))
   DamageTypeModifiers(9)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=(0.750000))
   DamageTypeModifiers(10)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=(0.500000))
   DamageTypeModifiers(11)=(DamageType=Class'KFGame.KFDT_Toxic',DamageScale=(0.250000))
   DamageTypeModifiers(12)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_9mm')
   DamageTypeModifiers(13)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rem1858')
   DifficultySettings=Class'kfgamecontent.KFDifficulty_Husk'
   LocalizationKey="KFPawn_ZedHusk"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   HitZones(0)=(GoreHealth=200,DmgScale=1.001000)
   HitZones(1)=()
   HitZones(2)=()
   HitZones(3)=(GoreHealth=75,DmgScale=1.500000,SkinID=2)
   HitZones(4)=()
   HitZones(5)=()
   HitZones(6)=()
   HitZones(7)=()
   HitZones(8)=(GoreHealth=20,DmgScale=0.500000,SkinID=3)
   HitZones(9)=()
   HitZones(10)=()
   HitZones(11)=()
   HitZones(12)=()
   HitZones(13)=()
   HitZones(14)=()
   HitZones(15)=()
   HitZones(16)=()
   HitZones(17)=()
   PenetrationResistance=2.000000
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'KFGame.Default__KFPawn_Monster:Afflictions_0'
      AfflictionClasses(0)=Class'KFGame.KFAffliction_EMPDisrupt'
      AfflictionClasses(1)=()
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
      FireFullyCharredDuration=5.000000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'KFGame.Default__KFPawn_Monster:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedHusk:Afflictions_0'
   IncapSettings(0)=(Duration=3.000000,Vulnerability=(2.500000))
   IncapSettings(1)=(Duration=2.000000,Vulnerability=(0.000000))
   IncapSettings(2)=(Cooldown=0.750000,Vulnerability=(1.000000))
   IncapSettings(3)=(Cooldown=0.200000,Vulnerability=(0.500000,0.500000,0.200000,0.200000,0.500000))
   IncapSettings(4)=(Cooldown=1.000000,Vulnerability=(0.400000))
   IncapSettings(5)=(Duration=1.500000,Cooldown=5.000000,Vulnerability=(0.500000,2.000000,0.500000,0.500000,2.000000))
   IncapSettings(6)=(Cooldown=20.500000,Vulnerability=(0.150000))
   IncapSettings(7)=(Duration=3.000000,Cooldown=5.500000,Vulnerability=(1.000000,1.000000,2.000000,1.000000,1.000000))
   IncapSettings(8)=(Cooldown=3.000000,Vulnerability=(0.400000))
   IncapSettings(9)=(Duration=1.000000,Cooldown=1.500000,Vulnerability=(1.000000))
   IncapSettings(10)=(Duration=4.000000,Cooldown=8.500000,Vulnerability=(3.000000))
   IncapSettings(11)=(Vulnerability=(3.000000))
   KnockdownImpulseScale=1.000000
   SprintSpeed=450.000000
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
      SpecialMoveClasses(12)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Evade'
      SpecialMoveClasses(15)=Class'kfgamecontent.KFSM_Evade_Fear'
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=Class'kfgamecontent.KFSM_Husk_FireBallAttack'
      SpecialMoveClasses(21)=Class'kfgamecontent.KFSM_Husk_FlameThrowerAttack'
      SpecialMoveClasses(22)=Class'kfgamecontent.KFSM_Husk_Suicide'
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
      SpecialMoveClasses(34)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedHusk:SpecialMoveHandler_0'
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
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedHusk:WeaponAmbientEchoHandler_0'
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
   DamageRecoveryTimeHeavy=0.750000
   GroundSpeed=170.000000
   Health=462
   ControllerClass=Class'kfgamecontent.KFAIController_ZedHusk'
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
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=50000,Yaw=66000,Roll=50000)
   Name="Default__KFPawn_ZedHusk"
   ObjectArchetype=KFPawn_Monster'KFGame.Default__KFPawn_Monster'
}
