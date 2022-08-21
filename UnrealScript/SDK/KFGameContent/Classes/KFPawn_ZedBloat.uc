//=============================================================================
// KFPawn_ZedBloat
//=============================================================================
// Bloat
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedBloat extends KFPawn_Monster;

var name  PukeSocketName;
/** How far away the bloat's vomit can damage enemies */
var float VomitRange;
/** At a base level how much damage this zed's vomit will do */
var int	  VomitDamage;
var bool bHasExploded;

/** Any pawn in this range will take damage when the bloat explodes */
var float ExplodeRange;

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
			if( PukeTarget.FastTrace( (ActorBox.Min + ActorBox.Max) * 0.5, PukeLocation) )
			{
				return true;
			}
		}
	}

	return false;
}

// Override so you can always injure a bloats stomach and cause an explosion
function bool CanInjureHitZone(class<DamageType> DamageType, int HitZoneIdx)
{
	if( HitExplosiveBone( HitZones[HitZoneIdx].BoneName ) )
	{
		return true;
	}
	return super.CanInjureHitZone(DamageType, HitZoneIdx);
}

// Override to deal explosive damage for the killing shot of an explosive bone
function TakeHitZoneDamage(float Damage, class<DamageType> DamageType, int HitZoneIdx, vector InstigatorLocation)
{
	local int HitZoneIndex;
	local name HitBoneName;

	super.TakeHitZoneDamage( Damage, DamageType, HitZoneIdx, InstigatorLocation );

	// Only deal explosive damage on the killing shot
	if( Role == ROLE_Authority && bPlayedDeath && TimeOfDeath == WorldInfo.TimeSeconds && !bHasExploded )
	{
		HitZoneIndex = HitFxInfo.HitBoneIndex;
		if ( HitZoneIndex != 255 && (InjuredHitZones & (1 << HitZoneIndex)) > 0 )	// INDEX_None -> 255 after byte conversion
		{
			HitBoneName = HitZones[HitZoneIndex].BoneName;
			if( HitExplosiveBone(HitBoneName) )
		    {
		    	DealExplosionDamage();
		    	bHasExploded = true;
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

/**
 * Dialog
 **/

/** Returns (hardcoded) dialog event ID for when trader gives advice to player who was killed by this zed type */
static function int GetTraderAdviceID()
{
	return 41;//TRAD_AdviceBloat
}

DefaultProperties
{
	Begin Object Name=KFPawnSkeletalMeshComponent
		// Enabling kinematic for physics interaction while alive.  (see also MinDistFactorForKinematicUpdate)
		bUpdateKinematicBonesFromAnimation=true
		bPerBoneMotionBlur=false
	End Object

	// ---------------------------------------------
	// Stats
	XPValues(0)=17
	XPValues(1)=22
	XPValues(2)=30
	XPValues(3)=34

	//BaseEyeHeight=1.f
	// ---------------------------------------------
	// Content
	CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Bloat_ARCH.ZED_Bloat_Archetype'
	PawnAnimInfo=KFPawnAnimInfo'ZED_Bloat_ANIM.Bloat_AnimGroup'

	// ---------------------------------------------
	// Special Moves
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_Evade)=class'KFSM_Evade'
		SpecialMoveClasses(SM_Evade_Fear)=class'KFSM_Evade_Fear'
	End Object

	// for reference: Vulnerability=(default, head, legs, arms, special)
	IncapSettings(AF_Stun)=		(Vulnerability=(0.5, 1.0, 0.5, 0.5, 0.5), Cooldown=5.0,  Duration=1.5)
	IncapSettings(AF_Knockdown)=(Vulnerability=(1.0),	                  Cooldown=1.0)
	IncapSettings(AF_Stumble)=	(Vulnerability=(0.4),	                  Cooldown=1.0)
	IncapSettings(AF_GunHit)=	(Vulnerability=(0.35),	                  Cooldown=0.1)
	IncapSettings(AF_MeleeHit)=	(Vulnerability=(2.0),	                  Cooldown=0.3)
	IncapSettings(AF_Poison)=	(Vulnerability=(0.15),	                  Cooldown=20.5, Duration=5.0)
	IncapSettings(AF_Microwave)=(Vulnerability=(4.0),	                  Cooldown=5.0, Duration=8.0)
	IncapSettings(AF_FirePanic)=(Vulnerability=(4),		                  Cooldown=5.0,	 Duration=8.0)
	IncapSettings(AF_EMP)=		(Vulnerability=(2.5),                     Cooldown=5.0,  Duration=3.0)
	IncapSettings(AF_Freeze)=	(Vulnerability=(1.0),                     Cooldown=3.0,  Duration=2.0)

	Begin Object Name=Afflictions_0
		FireFullyCharredDuration=3.5
	End Object

	ParryResistance=3

	// ---------------------------------------------
	// Gameplay
	VomitRange=350.f
	VomitDamage=12
	ExplodeRange=500.f
	Begin Object Name=MeleeHelper_0
		BaseDamage=14.f
		MaxHitRange=250.f
		MomentumTransfer=25000.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
	End Object

	Health=405
	HeadlessBleedOutTime=6.f
	// Override Head GoreHealth (aka HeadHealth)
    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=75, DmgScale=1.0001, SkinID=1)
    //HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=40, DmgScale=1.1, SkinID=1) orginal setting
	DoshValue=17
	Mass=130.f

	// Penetration
    PenetrationResistance=3.0

    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Submachinegun', 	DamageScale=(0.35)))  //0.25
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AssaultRifle', 	DamageScale=(0.35)))  //0.25
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Shotgun', 	        DamageScale=(0.25)))  
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Handgun', 	        DamageScale=(0.35)))  //0.2
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rifle', 	        DamageScale=(0.30)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing', 	                DamageScale=(0.3)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Bludgeon', 	                DamageScale=(0.3)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Fire', 	                    DamageScale=(1.6)))  //1.2
	DamageTypeModifiers.Add((DamageType=class'KFDT_Microwave', 	                DamageScale=(0.8)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Explosive', 	                DamageScale=(0.5)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing', 	                DamageScale=(0.25)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic', 		                DamageScale=(0.25)))


	//Special Case damage resistance
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_9mm',              DamageScale=(0.65))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AR15',             DamageScale=(0.40))

	// ---------------------------------------------
	// Movement / Physics
	Begin Object Name=CollisionCylinder
		CollisionRadius=+0055.000000 // Mesh is pulled back by 20 UU
	End Object

	RotationRate=(Pitch=50000,Yaw=20000,Roll=50000)
	GroundSpeed=150.0f
	SprintSpeed=210.0f   //260
	PhysRagdollImpulseScale=1.5f
	KnockdownImpulseScale=1.5f

	// ---------------------------------------------
	// AI / Navigation
	ControllerClass=class'KFAIController_ZedBloat'
	BumpDamageType=class'KFDT_NPCBump_Large'
	DamageRecoveryTimeHeavy=0.85f
	DamageRecoveryTimeMedium=1.0f

	// ---------------------------------------------

`if(`notdefined(ShippingPC))
	DebugRadarTexture=Texture2D'UI_ZEDRadar_TEX.MapIcon_Bloat';
`endif

	// ---------------------------------------------
	// Spawning
    MinSpawnSquadSizeType=EST_Large
}
