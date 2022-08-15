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
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedHusk extends KFPawn_Monster;

/** Fireball projectile attack */
var const class<KFProjectile>		FireballClass;

/** HitZoneIndex of backpack zone */
const BackpackZoneIndex = 3;

/** Explosion template for backpack/suicide */
var KFGameExplosion	ExplosionTemplate;

/** Set when husk blows up to make sure it only happens once */
var transient bool bHasExploded;

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
	if( MyKFAIC != none && IsImpaired() && !MyKFAIC.GetActiveCommand().IsA('AICommand_HeadlessWander') )
	{
		class'AICommand_HeadlessWander'.Static.HeadlessWander( MyKFAIC );
	}
}

/*********************************************************************************************
* Fireball projectile attack handling
**********************************************************************************************/

function ANIMNOTIFY_WarnZedsOfFireball()
{
	local KFPawn_Monster HitMonster;
	local vector HitLocation, HitNormal;
	local vector DangerPoint, AimDirection;

	AimDirection = MyKFAIC.Enemy.Location - Location;

	foreach TraceActors(class'KFPawn_Monster', HitMonster, HitLocation, HitNormal, MyKFAIC.Enemy.Location, Location, vect(50,50,50))
	{
		// Get the closest point from the hit monster to the line trace to determine which way it should evade
		PointDistToLine(HitMonster.Location, AimDirection, Location, DangerPoint);

		if( HitMonster.MyKFAIC != none )
		{
			// Tell the zed to evade away from the DangerPoint
			HitMonster.MyKFAIC.ReceiveLocationalWarning(DangerPoint);
		}
	}
}

/** AnimNotify which launches the fireball projectile */
function ANIMNOTIFY_HuskFireballAttack()
{
	local KFAIController_ZedHusk HuskAIC;

	if( MyKFAIC != none )
	{
		HuskAIC = KFAIController_ZedHusk(MyKFAIC);
		if( HuskAIC != none )
		{
			HuskAIC.ShootFireball(FireballClass);
		}
	}
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

	super.TerminateEffectsOnDeath();
}

/*********************************************************************************************
* Explode / Suicide
**********************************************************************************************/

/** Initialize GoreHealth (Server only) */
function ApplySpecialZoneHealthMod(float HealthMod)
{
	Super.ApplySpecialZoneHealthMod(HealthMod);

	HitZones[BackpackZoneIndex].GoreHealth = default.HitZones[BackpackZoneIndex].GoreHealth * HealthMod;
}

/** Override for Husk's backpack explosion */
function bool CanInjureHitZone(class<DamageType> DamageType, int HitZoneIdx)
{
	if( HitZoneIdx == BackpackZoneIndex && !bPlayedDeath )
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
	local Controller DamageInstigator;

	// Only living husks can explode... and only once
	if ( !bHasExploded && !bPlayedDeath )
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

			ExploActor.Explode(ExplosionTemplate, vect(0,0,1));
		}

		// Make sure we're dead!
		if( !bPlayedDeath )
		{
			TakeRadiusDamage(DamageInstigator, 10000, ExplosionTemplate.DamageRadius, ExplosionTemplate.MyDamageType, ExplosionTemplate.MomentumTransferScale, Location, true, self);
		}

	    bHasExploded = true;
	}
}

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
		if( IsDoingSpecialMove(SM_StandAndShotAttack) || IsDoingSpecialMove(SM_HoseWeaponAttack) )
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
   FireballClass=Class'KFGameContent.KFProj_Husk_Fireball'
   ExplosionTemplate=KFGameExplosion'KFGameContent.Default__KFPawn_ZedHusk:ExploTemplate0'
   CharacterMonsterArch=KFCharacterInfo_Monster'zed_husk_arch.ZED_Husk_Archetype'
   ParryResistance=2
   MinSpawnSquadSizeType=EST_Medium
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
      BaseDamage=15.000000
      MaxHitRange=180.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'KFGameContent.Default__KFPawn_ZedHusk:MeleeHelper_0'
   DoshValue=17
   XPValues(0)=15.000000
   XPValues(1)=20.000000
   XPValues(2)=27.000000
   XPValues(3)=31.000000
   ResistantDamageTypes(0)=(DamageType=Class'KFGame.KFDT_Fire')
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bDisableTurnInPlace=True
   HitZones(0)=(GoreHealth=154)
   HitZones(1)=()
   HitZones(2)=()
   HitZones(3)=(GoreHealth=75,DmgScale=0.500000,SkinID=2)
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
   Begin Object Class=KFPawnAfflictions Name=Afflictions_0 Archetype=KFPawnAfflictions'KFGame.Default__KFPawn_Monster:Afflictions_0'
      InstantAffl(0)=(head=50,Torso=80,Leg=80,Arm=80,Special=50,LowHealthBonus=10,Cooldown=10.000000)
      InstantAffl(1)=(head=44,Torso=80,Leg=80,Arm=80,LowHealthBonus=10,Cooldown=3.000000)
      InstantAffl(2)=(head=44,Torso=50,Arm=50,Special=43,LowHealthBonus=10)
      InstantAffl(3)=(Leg=44,LowHealthBonus=10)
      InstantAffl(4)=(head=23,Torso=29,Leg=29,Arm=29,LowHealthBonus=10,Cooldown=0.350000)
      InstantAffl(5)=(head=110,Torso=110,Leg=110,Arm=110,LowHealthBonus=10,Cooldown=0.500000)
      StackingAffl(0)=(Threshhold=1.500000,Cooldown=5.000000,DissipationRate=0.500000)
      StackingAffl(1)=(Threshhold=12.000000,Duration=2.000000,Cooldown=5.000000)
      StackingAffl(2)=(Threshhold=3.000000,Duration=4.000000,Cooldown=8.500000)
      StackingAffl(3)=(Threshhold=3.000000,Duration=4.000000,Cooldown=8.500000)
      StackingAffl(4)=(Threshhold=0.000000,Cooldown=5.000000)
      FireFullyCharredDuration=5.000000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFPawnAfflictions'KFGame.Default__KFPawn_Monster:Afflictions_0'
   End Object
   AfflictionHandler=KFPawnAfflictions'KFGameContent.Default__KFPawn_ZedHusk:Afflictions_0'
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
      SpecialMoveClasses(3)=None
      SpecialMoveClasses(4)=Class'KFGame.KFSM_GrappleAttack'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(10)=None
      SpecialMoveClasses(11)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(12)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Evade'
      SpecialMoveClasses(14)=Class'KFGameContent.KFSM_Evade_Fear'
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=Class'KFGameContent.KFSM_Husk_FireBallAttack'
      SpecialMoveClasses(17)=Class'KFGameContent.KFSM_Husk_FlameThrowerAttack'
      SpecialMoveClasses(18)=Class'KFGameContent.KFSM_Husk_Suicide'
      SpecialMoveClasses(19)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(20)=Class'KFGame.KFSM_HansGrappleVictim'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'KFGameContent.Default__KFPawn_ZedHusk:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_1'
      BoneName="Spine1"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_0'
      BoneName="RW_Weapon"
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
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'KFGameContent.Default__KFPawn_ZedHusk:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_Monster:FootstepAkSoundComponent'
      BoneName="Root"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_Monster:DialogAkSoundComponent'
      BoneName="head"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   DamageRecoveryTimeHeavy=0.200000
   GroundSpeed=170.000000
   Health=462
   ControllerClass=Class'KFGameContent.KFAIController_ZedHusk'
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
