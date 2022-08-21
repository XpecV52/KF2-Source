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

/** Player-controlled offset for firing fireballs. */
var vector PlayerFireOffset;

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
		    TraceEnd = PC.PlayerCamera.CameraCache.POV.Location + vector(PC.PlayerCamera.CameraCache.POV.Rotation)*100000;

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
				HitMonster.MyKFAIC.ReceiveLocationalWarning(DangerPoint);
			}
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
	local Controller DamageInstigator, OldController;

	// Only living husks can explode... and only once
	if ( !bHasExploded && !bPlayedDeath )
	{
		OldController = Controller;

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

				ExploActor.Explode(ExplosionTemplate, vect(0,0,1));
			}

			// Make sure we're dead!
			if( !bPlayedDeath )
			{
				TakeRadiusDamage(DamageInstigator, 10000, ExplosionTemplate.DamageRadius, ExplosionTemplate.MyDamageType, ExplosionTemplate.MomentumTransferScale, Location, true, self);
			}
		}

		OnExploded( OldController );

	    bHasExploded = true;
	}
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

DefaultProperties
{
	// ---------------------------------------------
	// Stats
	XPValues(0)=15
	XPValues(1)=20
	XPValues(2)=27
	XPValues(3)=31

	// ---------------------------------------------
	// Content
	CharacterMonsterArch = KFCharacterInfo_Monster'zed_husk_arch.ZED_Husk_Archetype'
	FireballClass		 = class'KFGameContent.KFProj_Husk_Fireball'

	// Explosion light
	Begin Object Class=PointLightComponent Name=ExplosionPointLight
	    LightColor=(R=245,G=190,B=140,A=255)
	End Object

	// Backpack/Suicide Explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=190
		DamageRadius=500
		DamageFalloffExponent=0.5f
		DamageDelay=0.f
		bFullDamageToAttachee=true

		// Damage Effects
		MyDamageType=class'KFDT_Explosive_HuskSuicide'
		FractureMeshRadius=200.0
		FracturePartVel=500.0
		ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.HuskSuicide_Explosion'
		ExplosionSound=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Suicide_Explode'
		MomentumTransferScale=1.f

		// Dynamic Light
        ExploLight=ExplosionPointLight
        ExploLightStartFadeOutTime=0.0
        ExploLightFadeOutTime=0.5

		// Camera Shake
		CamShake=CameraShake'FX_CameraShake_Arch.Misc_Explosions.HuskSuicide'
		CamShakeInnerRadius=450
		CamShakeOuterRadius=900
		CamShakeFalloff=1.f
		bOrientCameraShakeTowardsEpicenter=true
	End Object
	ExplosionTemplate=ExploTemplate0

	// ---------------------------------------------
	// Special Moves
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_Taunt)		 = class'KFGame.KFSM_Zed_Taunt'
		SpecialMoveClasses(SM_Suicide)		 = class'KFSM_Husk_Suicide'
		SpecialMoveClasses(SM_Evade)		 = class'KFSM_Evade'
		SpecialMoveClasses(SM_Evade_Fear)	 = class'KFSM_Evade_Fear'
		SpecialMoveClasses(SM_StandAndShootAttack)= class'KFSM_Husk_FireBallAttack'
		SpecialMoveClasses(SM_HoseWeaponAttack)= class'KFSM_Husk_FlameThrowerAttack'
	End Object

	// for reference: Vulnerability=(      default, head, legs, arms, special)
	IncapSettings(AF_Stun)=		(Vulnerability=(0.5, 2.0, 0.5, 0.5, 2.0), Cooldown=5.0, Duration=1.5)
	IncapSettings(AF_Knockdown)=(Vulnerability=(0.4),                     Cooldown=3)
	IncapSettings(AF_Stumble)=	(Vulnerability=(0.4),                     Cooldown=1.0)
	IncapSettings(AF_GunHit)=	(Vulnerability=(0.5, 0.5, 0.2, 0.2, 0.5), Cooldown=0.2)
	IncapSettings(AF_MeleeHit)=	(Vulnerability=(1.0),                     Cooldown=0.75)
	IncapSettings(AF_FirePanic)=(Vulnerability=(0.0),                     Cooldown=5.0, Duration=2.0)
	IncapSettings(AF_EMP)=		(Vulnerability=(2.5),                     Cooldown=5.0, Duration=3.0)
	IncapSettings(AF_Poison)=	(Vulnerability=(0.15),	                  Cooldown=20.5, Duration=5.0)
	IncapSettings(AF_Microwave)=(Vulnerability=(3),                       Cooldown=8.5, Duration=4.0)
	IncapSettings(AF_Freeze)=	(Vulnerability=(1.0),                     Cooldown=1.5, Duration=1.2)

	Begin Object Name=Afflictions_0
		FireFullyCharredDuration=5
		AfflictionClasses(AF_EMP)=class'KFAffliction_EMPDisrupt'
	End Object

	ParryResistance=2

	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Submachinegun', 	DamageScale=(0.5)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AssaultRifle', 	DamageScale=(0.5)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Shotgun', 	        DamageScale=(1.0)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Handgun', 	        DamageScale=(0.4)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rifle', 	        DamageScale=(0.7))) //1
    DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing', 	                DamageScale=(0.45)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Bludgeon', 	                DamageScale=(0.45)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Fire', 	                    DamageScale=(0.00)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Microwave', 	                DamageScale=(1.15)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Explosive', 				    DamageScale=(0.75)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing', 	                DamageScale=(0.5)))	
	DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic', 	                    DamageScale=(0.25)))


	// ---------------------------------------------
	// Movement / Physics
	GroundSpeed=170.0f
	SprintSpeed=450.0f

	RotationRate=(Pitch=50000,Yaw=66000,Roll=50000)

	// ---------------------------------------------
	// AI / Navigation
	ControllerClass=class'KFAIController_ZedHusk'
	DamageRecoveryTimeHeavy=0.75f
	DamageRecoveryTimeMedium=1.0f
	
	KnockdownImpulseScale=1.0f

	// ---------------------------------------------
	// Gameplay
	Begin Object Name=MeleeHelper_0
		BaseDamage=15.f
		MaxHitRange=180.f
		MomentumTransfer=25000.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
	End Object

	Health=462 // KF1=600
	DoshValue=17
	Mass=65.f

	//DamageTypeModifiers.Add((DamageType=class'KFDT_Fire', DamageScale=(0.5f)))

	// Penetration
    PenetrationResistance=2.0

	// Custom Hit Zones (HeadHealth, SkinTypes, etc...)
	HeadlessBleedOutTime=5.f
    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=200, DmgScale=1.001, SkinID=1)  // KF1=200     //154
	HitZones[3]       =(ZoneName=heart,	   BoneName=Spine2,		  Limb=BP_Special,  GoreHealth=75, DmgScale=1.5, SkinID=2)    //0.5
	HitZones[8]		  =(ZoneName=rforearm, BoneName=RightForearm, Limb=BP_RightArm, GoreHealth=20,  DmgScale=0.5, SkinID=3)

	WeakSpotSocketNames.Add(WeakPointSocket1) // Backpack

	bDisableTurnInPlace=false

`if(`notdefined(ShippingPC))
	DebugRadarTexture=Texture2D'UI_ZEDRadar_TEX.MapIcon_Husk';
`endif

    // ---------------------------------------------
	// Spawning
    MinSpawnSquadSizeType=EST_Medium
 }
