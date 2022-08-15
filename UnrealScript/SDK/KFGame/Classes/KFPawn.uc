//=============================================================================
// KFPawn
//=============================================================================
// Base Pawn for KFGame
//=============================================================================
// Killing Floor 2
// Copyright (C) 2012 Tripwire Interactive LLC
//=============================================================================

class KFPawn extends BaseAIPawn
	abstract
	nativereplication
	native(Pawn)
	dependson(KFPhysicalMaterialProperty,KFPawnVoiceGroup);

`include(KFGame\KFGameAnalytics.uci);
`include(KFGame\KFMatchStats.uci);

/*********************************************************************************************
 * @name	Character Info
 ********************************************************************************************* */

/** This pawn's current family/class info **/
var KFCharacterInfoBase		CharacterArch;

/** This pawn's sound group archetype based on character info */
var KFPawnSoundGroup		SoundGroupArch;
/** This pawn's dialog group class based on character info */
var class<KFPawnVoiceGroup>	VoiceGroupArch;
/** This pawn's anim info archetype based on character info */
var KFPawnAnimInfo			PawnAnimInfo;

/*********************************************************************************************
 * @name	Pawn meshes and mesh components
********************************************************************************************* */

/** The lighting channel used by the pawn's meshes including the weapon and weapon attachments */
var transient LightingChannelContainer PawnLightingChannel;

/** Third person head component. Used by customizable characters only */
var SkeletalMeshComponent ThirdPersonHeadMeshComponent;

/** Third person cosmetic attachments. Used by customizable characters only */
var int ThirdPersonAttachmentBitMask;
var name ThirdPersonAttachmentSocketNames[`MAX_COSMETIC_ATTACHMENTS];
var MeshComponent ThirdPersonAttachments[`MAX_COSMETIC_ATTACHMENTS];

/** For customizable characters this is the outfit MIC, otherwise it is the MIC for the whole body */
var MaterialInstanceConstant BodyMIC;
/** Alternate body MIC used for blood and gore (only used by KFPawn_Monster for now) */
var MaterialInstanceConstant GoreMIC;
/** For customizable characters this is the head MIC, otherwise it is empty */
var MaterialInstanceConstant HeadMIC;
/** For customizable characters this is the first person arms MIC, otherwise it is empty */
//var MaterialInstanceConstant ArmMIC;

/** Whether to allow always on physics such as jiggly parts, cloth, etc */
var globalconfig bool bAllowAlwaysOnPhysics;

/*********************************************************************************************
 * @name	Damage & Hit Zones
 ********************************************************************************************* */

/** Abstracted body parts that can be associated with multiple zones */
enum EHitZoneBodyPart
{
	BP_None,
	BP_Head,
	BP_Torso,
	BP_LeftArm,
	BP_RightArm,
	BP_LeftLeg,
	BP_RightLeg,
	BP_Special,
};

/** All pawns share a common head index.  Use enum to access from any class */
enum EHitZoneIndex
{
	HZI_HEAD,
};

struct native HitZoneInfo
{
	var() name         		ZoneName;           // The name of this hitzone
	var() name		   		BoneName;			// Name of the bone that corresponds to this hitzone
	var() int          		GoreHealth;			// The amount of health this zone has left (Not Replicated)
	var() float		    	DmgScale;			// Damage Multiplier
	var() EHitZoneBodyPart	Limb;				// Group zones together for hit reactions
	var() byte				SkinID;				// ID used for impact effects

	var transient  bool		bPlayedInjury; 		// When this hit zone was dismembered from the body

	//var	  delegate<OnHitZoneInjury> OnInjury;	 // Called when zone Health reaches 0

	structdefaultproperties
	{
		GoreHealth=50
		DmgScale=1.f
	}
};

var() array<HitZoneInfo> HitZones;

/** Tracks when the Pawn died */
var transient float TimeOfDeath;

/** Set only while inside TakeRadiusDamage */
var transient bool bTakingRadiusDamage;

/** How much resistance this pawn has to penetration. Whenever a projectile or
 * weapon traces passes through this pawn and damages it, that projectile
 * or weapon trace's PenetrationPower will be reduced by this amount.
 * Additionally a weapon trace or projectile won't penetrate this pawn if the
 * PenetrationPower is not greater than this resistance.
 */
var() float PenetrationResistance;

/** Used to track damage over time */
struct native DamageOverTimeInfo
{
    /** How much damage to apply at the Interval */
    var transient int  		 Damage;
    /** The type of damage to apply at the Interval */
    var transient class<KFDamageType>   DamageType;
    /** The type of damage to apply at the Interval */
    var transient byte  				DoT_Type;
    /** How long to keep applying damage over time */
    var transient float		 Duration;
    /** How often to apply the DoT_Damage */
    var transient float		 Interval;
    /** Countdown timer for next damage interval */
    var transient float		 TimeUntilNextDamage;
    /** The controller that caused this damage */
    var transient Controller InstigatedBy;
};

/** Array of damage that must be applied over time */
var array<DamageOverTimeInfo> DamageOverTimeArray;

/** Track explosives which deal reduced damage when stacked */
struct native ExplosiveStackInfo
{
	var GameExplosionActor Explosion;
	var float LastHitTime;
};

/** List of active explosives that deal reduced damage when stacked */
var array<ExplosiveStackInfo> RecentExplosiveStacks;

/*********************************************************************************************
 * @name	HitFX & Gore
 ********************************************************************************************* */

/** replicated information on a hit we've taken */
struct native KFHitFxInfo
{
	/** the location of the hit - Do not use this directly */
	var vector				HitLocation;
	/** Momentum is only replicated as a normalized HitDir.  Momentum transfer is handled server-side */
	var vector				EncodedHitDirection;
	/** the damage type we were hit with */
	var class<KFDamageType>	DamageType;
	/** the zone that was hit on our Mesh (if any) */
	var byte				HitBoneIndex;
	/** Whether the pawn dealt radial damage */
	var bool				bRadialDamage;
	/** Whether the pawn was obliterated */
	var bool 				bObliterated;
};

/** Additional replicated data if bRadialDamage = true */
struct native KFRadialHitFxInfo
{
	/** Radius damage scale (falloff) used for ragdoll impulses */
	var byte				RadiusDamageScale;
	/** Radius damage hurt origin used for ragdoll impulses.  Will be heavily compressed (11 bits?) when it's 0 */
	var vector				RadiusHurtOrigin;
};

/** replicated information on a hit we've taken */
var repnotify KFHitFxInfo 	HitFxInfo;
/** replicated information radial information */
var KFRadialHitFxInfo 		HitFxRadialInfo;
/** the weapon that shot us */
var Pawn					HitFxInstigator;

/** Replicate additionational hit locations for blood fx for certain weapons (ex. Shotguns) */
const 				MAX_ADDED_HITFX = 7;
/** Store the additional hit locations in local space to replicate easier */
var vector			HitFxAddedRelativeLocs[MAX_ADDED_HITFX];
/** The number of hits this pawn has taken in a frame */
var byte  			HitFxAddedHitCount;

/** Set to true when we want to update HitFx at the end of the tick */
var bool            bNeedsProcessHitFx;

/** stop considering HitFxInfo for replication when world time passes this (so we don't replicate out-of-date hits when pawns become relevant) */
var float	 		LastTakeHitTimeout;

/** record value from TakeRadiusDamage to be used later this frame for PlayHit, these are not replicated */
var byte			LastRadiusDamageScale;
var vector			LastRadiusHurtOrigin;

/** The max number of times we should try to grab a parent bone if no bone is found on our ragdoll */
const 				MAX_GET_RBBONE_CHECKS = 3;

// Gore Materials
var array<MaterialInstance>	BloodSplatterDecalMaterials;
var array<MaterialInstance>	BloodPoolDecalMaterials;

// For ambient battle blood
var const name BattleBloodParamName;
var const float MinBattleBloodValue;
var const float BattleBloodRangeSq;
var transient float	BattleBloodParamValue;

// Default values for material based damage effects on death
var const name DeathMaterialEffectParamName;
var const float DeathMaterialEffectDuration;

// Book keeping variables for material based damage effects.
// Note: Although multiple effects can coexist, only single effect interpolation is supported at any given time.
// This works as long as the interp time is not too long. Consider making this an array if that does not hold true.
var transient float MaterialEffectDuration;
var transient float MaterialEffectTimeRemaining;
var transient name MaterialEffectParamName;

/** Names for specific bones in the skeleton */
var name	LeftFootBoneName;
var name	RightFootBoneName;
var name    LeftHandBoneName;
var name    RightHandBoneName;
var name	HeadBoneName;
var name	TorsoBoneName;
var name	PelvisBoneName;

/** If TRUE we broke at least one constraints off the Gore mesh. */
var bool bHasBrokenConstraints;

/** Setting to control whether we allow ragdoll and dismemberment on dead bodies */
var globalconfig bool bAllowRagdollAndGoreOnDeadBodies;

/** The time when a gib last collided with something in the world (relative to WorldInfo.TimeSeconds) */
var transient float LastGibCollisionTime;

/*********************************************************************************************
 * @name	Status Effects
 ********************************************************************************************* */

var instanced KFPawnAfflictions AfflictionHandler;

/** Bit-flags 0:Alive 1:Dead.  Up to (first) 32 hit zones */
var repnotify int InjuredHitZones;

/** This pawn is currently under the influense of the EMP distruption effect */
var repnotify bool bEmpDisrupted;
/** This pawn is currently Panicked by the EMP effect */
var repnotify bool bEmpPanicked;

/** This pawn is currently Panicked by the EMP effect */
var repnotify bool bFirePanicked;
/** Replicated the remaining StackedPower for fire on death so the zed keeps burning */
var repnotify byte DeathFireStackedPower;
/** How burned is this zed currently? Replicated version */
var repnotify byte RepFireBurnedAmount;

/** The last time a damage-type specific impact effect was spawned */
var float LastImpactParticleEffectTime;
var float LastImpactSoundTime;

/*********************************************************************************************
 * @name	Rigid Body Hit reactions
 ********************************************************************************************* */

struct native KnockdownImpulseInfo
{
	/** Linear velocity to apply to entire rigid body. */
	var vector LinearVelocity;
	/** Angular velocity to apply to entire rigid body. */
	var vector AngularVelocity;

	/** Dual purpose: Point Impulse Position | Radial Impulse Origin */
	var vector ImpulsePosition;
	/** Dual purpose: Point Impulse | Radial (X=Radius, Y=Strength) */
	var vector ImpulseStrength;

	/** Bone that receives point impulse. */
	//var Name PointImpulseBoneName;
	/** Use hit zone id instead for net bandwidth */
	var byte PointImpulseHitZone;

	/** Should Impulse Pos/Str be applied as point or radial */
	var bool bIsRadialImpulse;
};

var KnockdownImpulseInfo KnockdownImpulse;

/** Struct used to replicated root body position when knocked down (not dead) */
struct native ReplicatedRootPosInfo
{
	var vector	Position;
	var bool	bNewData;
};

var	ReplicatedRootPosInfo ReplicatedRootBodyPos;

/** If Pawn can or cannot play physics hit reactions. */
var(Physics) bool		bCanPlayPhysicsHitReactions;
/** Scale impulses by this amount for Physics Hit Reactions. */
var(Physics) float		PhysicsHitReactionImpulseScale;
/** List of RB bone names which should be UnFixed when playing a Physics Body Impact. */
var(Physics) editinline	Array<Name>		PhysicsBodyImpactBoneList;
/** List of RidigBodies where a spring should be attached to animation. */
var(Physics) editinline	Array<Name>		PhysicsImpactSpringList;
/** Time it takes to blend back to animations after being turned into physics. */
var(Physics) float		PhysicsImpactBlendOutTime;
/** Time left to play this physics impact */
var	float PhysicsImpactBlendTimeToGo;

/** Artifically scale impulses, to counter mass, for ragdoll hit reactions. */
var(Physics) float PhysRagdollImpulseScale;
/** As above, but applied to living (aka knockdown) impulse */
var(Physics) float KnockdownImpulseScale;

/** Ragdoll insomnia detection */
var const byte		RagdollWarningLevel;
var const float		NextRagdollFailsafeTime;
var const vector	LastRootRigidBodyTestLoc;

/*********************************************************************************************
 * @name	Movement & Physics
 ********************************************************************************************* */

/** pct. of movement speed while sprinting */
//var float SprintingPct;
var	float SprintSpeed;

/** currently sprinting */
var bool bIsSprinting;

/** MaxSpeedModifier is scaled by this value if player is moving backwards */
var float BackPedalSpeedMod;

/** Replicated Floor property, used to set Floor on the client (for anims), currently used by Crawler */
var repnotify vector ReplicatedFloor;

/** Collision property for KFGameInfo's bDisableTeamCollision */
var bool bIgnoreTeamCollision;
/** Reduces the collision radius between pawns on the same team */
var float TeammateCollisionRadiusPercent;

/** If set, counter the World's TimeDilation using this Pawn's CustomTimeDilation */
var bool bUnaffectedByZedTime;

/*********************************************************************************************
 * @name	Camera
 ********************************************************************************************* */

/** Base crouched eye height from bottom of the collision cylinder. */
var(Camera) float BaseCrouchEyeHeight;

/** If true enable weapon view bob */
var	const bool bWeaponBob;

/** view bob properties */
var	const	float	Bob<ClampMin=-0.05 | ClampMax=0.05>;

/** if true, UpdateEyeheight() will get called every tick */
var	bool bUpdateEyeheight;

/** Old Z Location - used for eyeheight smoothing */
var float OldZ;

var					float	LandBob;
var					float	JumpBob;
var					float	AppliedBob;
var					float	BobTime;
var					vector	WalkBob;

var bool		bJustLanded;			/** used by eyeheight adjustment.  True if pawn recently landed from a fall */
var bool		bLandRecovery;			/** used by eyeheight adjustment. True if pawn recovering (eyeheight increasing) after lowering from a landing */

/*********************************************************************************************
 * @name	Weapon
 ********************************************************************************************* */

/** Default inventory added via AddDefaultInventory() */
var() array< class<Inventory> > DefaultInventory;
var() array<Inventory>			DefaultInventoryArchetypes;

/** Holds the class type of the current weapon attachment.  Replicated to all clients. */
var	repnotify	KFWeaponAttachment			WeaponAttachmentTemplate;
/** This holds the local copy of the current attachment.  This "attachment" actor will exist independantly on all clients */
var				KFWeaponAttachment			WeaponAttachment;
/** client side flag indicating whether attachment should be visible - primarily used when spawning the initial weapon attachment
 * as events that change its visibility might have happened before we received a WeaponAttachmentTemplate
 * to spawn and call the visibility functions on
 */
var bool bWeaponAttachmentVisible;

/** First person view left and right arm meshes */
var KFSkeletalMeshComponent ArmsMesh;

/** Name of the socket used for attaching third person weapons to this pawn. */
var name WeaponAttachmentSocket;

/** Reference to Weapon carried by Pawn. Set in PlayWeaponSwitch() when a new weapon is set. */
var KFWeapon MyKFWeapon;

/** Last time WeaponFired() was called, used by animation */
var float LastWeaponFireTime;

/*********************************************************************************************
 * @name	Animation
 ********************************************************************************************* */

/* 2d division of space around this pawn */
enum EPawnOctant
{
	DIR_Forward,
	DIR_Backward,
	DIR_Left,
	DIR_Right,
	DIR_ForwardLeft,
	DIR_ForwardRight,
	DIR_BackwardLeft,
	DIR_BackwardRight,
	DIR_None,
};

enum EAnimSlotStance
{
	EAS_FullBody,
	EAS_UpperBody,
	EAS_LowerBody,
	EAS_Additive,
	EAS_CH_UpperBody,
	EAS_CH_LowerBody,
	EAS_Face
};

/** Cache nodes for convenience */
var		transient	Array<AnimNodeAimOffset>	AimOffsetNodes;
var()	transient	Array<AnimNodeSlot>		    BodyStanceNodes;

/** List of RB bone names which should be UnFixed when playing a Physics Body Impact. */
var(Animation) editinline	Array<Name>	ArmPhysicsBoneList;

/**
 * 2d vector, representing a rotation offset percentage from actor's rotation. Used by Aim anim nodes.
 * Range used (-1,-1) to (+1,+1) (angle equivalent : (-90d,-90d) to (+90d,+90d))
 */
var() vector2d	AimOffsetPct;
var	  bool		bEnableAimOffset;

/**
 * This is the replicated version of AimOffsetPct that other clients will interpolate to.
 * Using FRotator compression with roll forced to 0
 */
var rotator		ReplicatedAimOffsetPct;

/** If set, turns off KFAnim_TurnInPlace (and related) nodes */
var(Animation) bool bDisableTurnInPlace;

/** Time when AnimGroup can play a new hit reaction */
var float NextHitReactionAnim_ActorTime;
/** Timer for swipe damage tick notify */
var const transient float LastMeleeNotify_ActorTime;

/*********************************************************************************************
 * @name	Skeletal Controls
 ********************************************************************************************* */

var transient Array<GameSkelCtrl_Recoil>	RecoilNodes;

struct native LookAtInfo
{
	/** The actor that our head tracking should be looking at */
	var Actor	LookAtTarget;
	/** Whether or not to use the spine to look at our target */
	var bool	bUseSpine;
	/** Blend in/out values for the skeletal controls */
	var float	BlendIn;
	var float	BlendOut;
	/** Offset from our target's location to look at */
	var vector	TargetOffset;
	/** Pct to look at the target */
	var float	LookAtPct;
};

/** Skeletal controller for head bone */
var transient SkelControlLookAt	    	IK_Look_Head;
/** Skeletal controller for spine bone */
var transient SkelControlLookAt	    	IK_Look_Spine;
/** Current look at information (make repnotify?) */
var transient LookAtInfo                MyLookAtInfo;
/** Whether or not this pawn is capable of head tracking */
var bool                                bCanHeadTrack;
/** Whether or not this pawn's head tracking mode is on or off */
var bool                                bIsHeadTrackingActive;

/** IK Controller for feet bones */
var transient KFSkelControl_FootPlacement	IKFootLeft, IKFootRight;

/*********************************************************************************************
 * @name	Special Moves
 ********************************************************************************************* */

/** Defines the current move the player is doing */
enum ESpecialMove
{
	SM_None,

	/** ZED standard attacks */
	SM_MeleeAttack,
	SM_MeleeAttackDoor,
	SM_Grab,
	SM_GrabAttack,

	/** ZED Hit Reactions */
	SM_Stumble,
	SM_RecoverFromRagdoll,
	SM_Knockdown,
	SM_DeathAnim,
	SM_Stunned,

	/** ZED Misc */
	SM_Emerge,
	SM_Taunt,
	SM_WalkingTaunt,
	SM_Evade,
	SM_Evade_Fear,
	SM_Heal,

	/** ZED special attacks */
	SM_SonicAttack,
	SM_StandAndShotAttack,
	SM_HoseWeaponAttack,
	SM_Suicide,

	/** Human Moves */
	SM_GrappleVictim,
	SM_HansGrappleVictim,

	/** Boss special attacks */
	SM_BossTheatrics,
	SM_ChangeStance,
	SM_Hans_ThrowGrenade,
	SM_Hans_GrenadeHalfBarrage,
	SM_Hans_GrenadeBarrage,

	/** Custom entries for extendability */
	SM_Custom1,
	SM_Custom2,
	SM_Custom3,
	SM_Custom4,
	SM_Custom5,

	/** Dummy entry to avoid SM_MAX native collision */
	ESpecialMove_Blank,
};

/** Container for all special move properties (optimized for net bandwidth) */
struct native KFSpecialMoveStruct
{
	/** Special Move Enum being performed. */
	var ESpecialMove	SpecialMove;
	/** Interaction Pawn */
	var Pawn			InteractionPawn;
	/** Additional Replicated Flags */
	var byte			Flags;
};

/** Special move currently performed by Pawn. SM_None, when doing none. */
var	ESpecialMove					SpecialMove;
/** Pawn ref used for Pawn to Pawn Interactions */
var	KFPawn							InteractionPawn;
/** Pack any additional data into special moves, and get it replicated so it's consistent across network. */
var	byte							SpecialMoveFlags;

/** Array of instanced special moves */
var(SpecialMoves) editinline editconst transient Array<KFSpecialMove> SpecialMoves;

/** Replicated information about the current SpecialMove */
var	repretry repnotify KFSpecialMoveStruct	ReplicatedSpecialMove;

/** Helper object (within pawn) that implements special moves */
var(SpecialMoves) instanced KFSpecialMoveHandler SpecialMoveHandler;

/** If this is greater than zero, we can't be grabbed by clots or other weak zeds until this time is hit */
var(Grab)   Float   WeakZedGrabCooldown;

/** If this pawn does zed grabs, they are weak zed grabs */
var(Grab)   bool    bWeakZedGrab;

/*********************************************************************************************
 * @name	Mesh Translation / Smoothing (Based on UDKPawn)
 ********************************************************************************************* */

/** Additional translation for mesh */
var float BaseTranslationOffset;

/** Mesh Translation Offset (MTO) is used to modify Mesh.Translation value**/
/** MeshLocSmootherOffset:
 *  This variable is used to compensate mesh's translation
 *  when steps/inclines/bulky geometry causing cylinder to move up/downs rapidly
 *  To make it smooth this interpolates and creates smoother location transition **/
var const vector   MTO_PhysSmoothOffset;
/** SpecialMoveOffset:
 *  This doesn't have to be used by SpecialMove but it's in-game usable mesh offset
 *  SpecialMoveInterp is interpolation variable to reach target SpecialMoveOffset
 *  SpecialMoveSpeed is interpolate speed to reach target SpecialMoveOffset per second
  */
var vector         MTO_SpecialMoveOffset;
var vector         MTO_SpecialMoveInterp;
var float          MTO_SpecialMoveSpeed;

/** Mesh translation calculated by UpdateFloorConform */
var const vector   MTO_IKFloorConform;

/** Floor up vector used by floor conforming */
var const vector   MeshFloorConformNormal;
/** If set, interp the MeshFloorConformNormal */
var const bool	   bDoFloorConformBlend;
/** Track last Pawn rotation, to make any updates if necessary */
var const Rotator  FloorConformLastPawnRotation;
/** If set, floor conforming assumes this creature is a quadruped.  See also GetFloorConformNormal() */
var const bool	   bUseQuadrupedFloorConform;

/** if TRUE, disable mesh offset steps smoothing */
var() bool	bDisableMeshSmoothing;

/*********************************************************************************************
 * @name	Audio
 ********************************************************************************************* */

/** pawn ambient sound (for powerups and such) - Access via SetPawnAmbientSound() / GetPawnAmbientSound() */
var repnotify AkEvent 		AmbientSound;
var protected AkComponent 	AmbientAkComponent;

/** separate replicated ambient sound for weapon firing - access via SetWeaponAmbientSound() / GetWeaponAmbientSound() */
var repnotify AkEvent WeaponAmbientSound;
var protected AkComponent WeaponAkComponent;
var instanced KFWeaponAmbientEchoHandler WeaponAmbientEchoHandler;

var protected AkComponent FootstepAkComponent;
var protected AkComponent DialogAkComponent;

/** Whether foostep sounds are allowed. Always allow sounds for local player */
var globalconfig bool bAllowFootstepSounds;

/*********************************************************************************************
 * @name	Network
 ********************************************************************************************* */
var float LastReplicateTime;

/*********************************************************************************************
 * @name	AI
 ********************************************************************************************* */

var KFAIController		MyKFAIC;
/** Extra path cost applied to each navigation point added to RouteCache to diversify paths */
var const float		ExtraCostForPath;
/** Whether Pawn is using faster movement speed to catch up to player(s) */
var	const bool			bUseHiddenSpeed;
/** Whether Pawn can use faster movement speed to catch up to player(s) */
var	bool			    bCanUseHiddenSpeed;
/** Whether or not to allow acceleration smoothing using TurningRadius parameters below */
var bool				bAllowAccelSmoothing;
/** Maximum turning radius of this pawn when accel smoothing is on */
var float				MaxTurningRadius;
/** Current turning radius we are using (based on TurningRadisu above, and scaled depending on how close to the goal we are) */
var transient float		CurrentTurningRadius;
/** Acceleration smoothing will be ramped down within this distance from goal */
var float				AccelConvergeFalloffDistance;
/** Pawn acceleration from previous frame */
var transient vector	OldAcceleration;
var float				DamageRecoveryTimeHeavy;
var float				DamageRecoveryTimeMedium;
var	float				HiddenGroundSpeed;
/** AI Zeds won't target this pawn if this is true */
var bool                bAIZedsIgnoreMe;
/** If other than none other AI should not target this pawn  */
var Controller          ExclusiveTargetingController;
/** If set to something other than zero, AI will ignore this pawn until the worldinfo timeseconds passes this value  */
var float               AIIgnoreEndTime;
/** Whether this AI pawn can cloak or not */
var bool 				bCanCloak;
/** Whether this AI pawn is cloaking or not */
var	repnotify	bool	bIsCloaking;

/** KF1 legacy value for zed AIControl */
const AIAirControl = 0.35;

/*********************************************************************************************
 * @name	Dialog
 ********************************************************************************************* */
var transient int	CurrDialogEventID;
var transient byte	CurrDialogPriority;

/*********************************************************************************************
 * @name	Debug
 ********************************************************************************************* */

// `log() conditions.  Much more efficient than using log tags, because the msg is not evaluated.
var bool bLogTakeDamage;
var bool bLogPhysicsBodyImpact;
var bool bLogSpecialMove;
var bool bLogCustomAnim;

var Texture2D DebugRadarTexture;

replication
{
    // Replicated to ALL
	if ( bNetDirty )
		AmbientSound, WeaponAttachmentTemplate, bIsSprinting, InjuredHitZones,
		KnockdownImpulse, ReplicatedSpecialMove, bEmpDisrupted, bEmpPanicked, bFirePanicked,
        RepFireBurnedAmount, bUnaffectedByZedTime;
	if ( bNetDirty && WorldInfo.TimeSeconds < LastTakeHitTimeout )
		HitFxInfo, HitFxRadialInfo, HitFxInstigator, HitFxAddedRelativeLocs, HitFxAddedHitCount;
	if ( Physics == PHYS_RigidBody && !bTearOff )
		ReplicatedRootBodyPos;
	if ( Physics == PHYS_Spider )
		ReplicatedFloor;
	if( bNetDirty && bTearOff ) // on death/tearoff
		DeathFireStackedPower;

	// Replicated to owning client
	if ( bNetDirty && bNetOwner )
		SprintSpeed;
	if ( bNetDirty && bNetOwner && bNetInitial )
		bIgnoreTeamCollision;

	// Replicated to all but the owning client
	if ( bNetDirty && (!bNetOwner || bDemoRecording) )
		WeaponAmbientSound;
	if ( bEnableAimOffset && (!bNetOwner || bDemoRecording) )
		ReplicatedAimOffsetPct;
    if ( bNetDirty && bCanCloak )
    	bIsCloaking;
}

cpptext
{
	// actor
	virtual void PostBeginPlay();
	virtual void TickSpecial(FLOAT DeltaSeconds);
	virtual void TickSimulated(FLOAT DeltaSeconds);
	virtual void BeginTouch(AActor *Other, UPrimitiveComponent* OtherComp, const FVector &HitLocation, const FVector &HitNormal, UPrimitiveComponent* MyComp=NULL);

	// network
	INT* GetOptimizedRepList( BYTE* InDefault, FPropertyRetirement* Retire, INT* Ptr, UPackageMap* Map, UActorChannel* Channel );
	virtual UBOOL IsNetRelevantFor(APlayerController* RealViewer, AActor* Viewer, const FVector& SrcLocation);
	virtual UBOOL ShouldDoSimpleNetRelevancy(APlayerController* RealViewer, const FVector& SrcLocation);

    // sound
	virtual void ReplicateSound(class UAkBaseSoundObject* InSoundCue, UBOOL bNotReplicated = FALSE, UBOOL bNoRepToOwner = FALSE, UBOOL bStopWhenOwnerDestroyed = FALSE, FVector* SoundLocation = NULL, UBOOL bNoRepToRelevant = FALSE, FRotator* SoundRotation = NULL );
    virtual UBOOL HasAudibleAmbientSound(const FVector& SrcLocation);

	// collision / physics
	virtual void performPhysics(FLOAT DeltaSeconds);
	virtual void PostProcessPhysics( FLOAT DeltaSeconds, const FVector& OldVelocity );
	virtual void physFalling(FLOAT deltaTime, INT Iterations);
	virtual void physRigidBody(FLOAT DeltaTime);
	virtual void Crouch(INT bClientSimulation=0);
	virtual FLOAT MaxSpeedModifier();
	virtual void UpdateTimeDilation();
	virtual void UpdateEyeHeight(FLOAT DeltaSeconds);
	virtual void SyncActorToRBPhysics();
	virtual void physicsRotation(FLOAT deltaTime, FVector OldVelocity);
	virtual UBOOL ShouldBypassSimulatedClientPhysics();
	virtual UBOOL IgnoreBlockingBy( const AActor *Other) const;
	void MoveToFloor();
	void TickKnockdownCorrection(FLOAT DeltaSeconds);
	void TickPhysicsBodyImpact(FLOAT DeltaSeconds);

	// ragdoll violations
	UBOOL CheckRigidBodyLinearConstraintViolations();
	UBOOL IsRigidBodyInterpenetratingWorld(FName& BoneName);
	void SetRagdollSleepThreshold(FLOAT Threshold);
	void TickRagdollSleepFailsafe(FLOAT DeltaSeconds);

	// Mesh translation offset
	void SmoothCorrection(const FVector& OldLocation);
	void PerformStepsSmoothing(const FVector& OldLocation, FLOAT DeltaSeconds);
	void TickMeshTranslationOffset(FLOAT DeltaSeconds);

	// Floor conforming (IK, mesh translation/rotation, etc..)
	UBOOL UpdateFloorConform(FLOAT DeltaSeconds);
	void physicsRotationCrawler(FLOAT deltaTime, FRotator deltaRot, FRotator& NewRotation);
	FVector GetFloorConformNormal(FLOAT& out_HeightAdjust);
	FRotator FindSlopeMeshRotation(const FVector& FloorNormal);

	// AI related
	virtual void PrePhysicsAISteering();
	virtual void physWalking( FLOAT deltaTime, INT Iterations );
	virtual UBOOL IsValidAnchor( ANavigationPoint* AnchorCandidate );
	// Never try to jump over a wall (for now)
	virtual UBOOL TryJumpUp(FVector Dir, FVector Destination, DWORD TraceFlags, UBOOL bNoVisibility);
	// Additional falling checks
	virtual UBOOL TestWalkFall(FVector GravDir, FVector &CurrentPosition, FVector CollisionExtent, FCheckResult& Hit, AActor* GoalActor, const FVector StartLocation);
	// Disable serpentine movement (for now)
	virtual void HandleSerpentineMovement(FVector& out_Direction, FLOAT Distance, const FVector& Dest ) { }
	virtual void HandleAccelerationSmoothing(FLOAT DeltaSeconds);
	UBOOL moveToward(const FVector &Dest, AActor *GoalActor );
	// Override of Pawn native function because that version considers the pawn to be dead if hidden. This version
	// bypasses the hidden check to support ToggleDebugCamera so you can watch NPCs attacking your detached mesh.
	virtual UBOOL IsAliveAndWell() const;
	virtual UBOOL ReachedDestination(const FVector &Start, const FVector &Dest, AActor* GoalActor, UBOOL bCheckHandle=FALSE);

	// animation
	virtual void UpdateHeadTracking(FLOAT DeltaTime);
	void TickAimOffset(FLOAT DeltaSeconds);
}

native final simulated function bool FitCollision();

/*********************************************************************************************
 * @name	Constructors, Destructors, and Loading
********************************************************************************************* */

/** This will determine and then return the CharacterInfo for this pawn **/
native simulated function KFCharacterInfoBase GetCharacterInfo();

/** Queries the PRI and returns our current Perk */
native simulated function KFPerk GetPerk();

/** Whether the world can cast shadows on first person arms and weapon */
native function bool AllowFirstPersonPreshadows();

/** Removes all blood decals from pawn mesh */
native function ClearBloodDecals();

// Called immediately before gameplay begins.
simulated event PreBeginPlay()
{
	local MapInfo MapInfo;

	// Set the mesh to the proper offset
	BaseTranslationOffset = Mesh.default.Translation.Z;

	// If the pawn hasn't registered any touch/untouch events from a ligthing volume
	// set it to the correct default lighting channel based on the map
	if( LightingVolumeEnterCount == 0 )
	{
		MapInfo = WorldInfo.GetMapInfo();
		if(MapInfo != None && MapInfo.bDefaultPawnsToOutdoor)
		{
			PawnLightingChannel.Indoor = false;
			PawnLightingChannel.Outdoor = true;
			PawnLightingChannel.bInitialized = true;
		}
		else
		{
			PawnLightingChannel.Indoor = true;
			PawnLightingChannel.Outdoor = false;
			PawnLightingChannel.bInitialized = true;
		}
		SetMeshLightingChannels(PawnLightingChannel);
	}

	InitRBSettings();

	Super.PreBeginPlay();
}

event PostBeginPlay()
{
	Super.PostBeginPlay();

	SoundGroupArch.PlayEntranceSound( self );

	// On the server only update the skelcomp when it needs to (see bTickDuringPausedAnims)
	if ( WorldInfo.NetMode == NM_DedicatedServer )
	{
		Mesh.bPauseAnims = true;
	}
}

/** End any active special moves when pawn is destroyed (rather than killed
from incoming damage) - this can happen when using a cheat like "killpawns"
*/
simulated event Destroyed()
{
	// If we're currently doing a special move when we're being destroyed
	if( SpecialMove != SM_None && SpecialMoves[SpecialMove] != None )
	{
		EndSpecialMove();
	}

	TerminateEffectsOnDeath();
	super.Destroyed();
}

/**
 * Check on various replicated data and act accordingly.
 */
simulated event ReplicatedEvent(name VarName)
{
	switch( VarName )
	{
	case nameof(WeaponAttachmentTemplate):
		WeaponAttachmentChanged();
		break;

	case nameof(AmbientSound):
		SetPawnAmbientSound(AmbientSound);
		break;

	case nameof(WeaponAmbientSound):
		SetWeaponAmbientSound(WeaponAmbientSound);
		break;

	case nameof(HitFxInfo):
		bNeedsProcessHitFx = true;
		break;

	case nameof(InjuredHitZones):
		HitZoneInjured();
		break;
	case nameof(ReplicatedSpecialMove):
		`log("Received replicated special move:"@ReplicatedSpecialMove.SpecialMove, bLogSpecialMove);
		DoSpecialMove(ReplicatedSpecialMove.SpecialMove, TRUE, ReplicatedSpecialMove.InteractionPawn, ReplicatedSpecialMove.Flags);
		break;
	case nameof(ReplicatedFloor):
		Floor = ReplicatedFloor;
		break;

	case nameof(bEmpDisrupted):
		AfflictionHandler.SetEMPDisrupted(bEmpDisrupted);
		break;

	case nameof(bEmpPanicked):
		AfflictionHandler.SetEMPPanicked(bEmpPanicked);
		break;

	case nameof(bFirePanicked):
		AfflictionHandler.SetFirePanicked(bFirePanicked);
		break;

	case nameof(RepFireBurnedAmount):
		AfflictionHandler.SetBurnedParameter(ByteToFloat(RepFireBurnedAmount), true);
		break;

	case nameof(DeathFireStackedPower):
		AfflictionHandler.TearOffFirePanic(DeathFireStackedPower);
		break;
	}

	Super.ReplicatedEvent(VarName);
}

/** Pawn is possessed by Controller */
function PossessedBy(Controller C, bool bVehicleTransition)
{
	Super.PossessedBy(C, bVehicleTransition);

	// By default, NotifyTeamChanged is only called on the client
	NotifyTeamChanged();
}

/** Pawn is unpossessed by Controller */
function UnPossessed()
{
	Super.UnPossessed();
	bUnaffectedByZedTime = false;
}

/** Returns true of pawns are on the same team, false otherwise */
simulated event bool IsSameTeam( Pawn Other )
{
    // Added a check in case the pawn isn't on a team. By default they
    // will still have a team num (255). This can be used to identify
    // if a pawn is on the human team (0) or the zed team
    if( Other != none && Other.GetTeamNum() == GetTeamNum() )
    {
        return true;
    }

    return Super.IsSameTeam(Other);
}

/** one time init of physics related options */
simulated function InitRBSettings()
{
	// If PhysAsset is set in the defaults
	if ( Mesh != none && Mesh.PhysicsAssetInstance != None )
	{
		// Fix bodies so they update from animation until ragdoll
		if ( Physics != PHYS_RigidBody )
		{
			Mesh.PhysicsAssetInstance.SetAllBodiesFixed(TRUE);
			Mesh.PhysicsAssetInstance.SetFullAnimWeightBonesFixed(FALSE, Mesh);
		}
	}

	// don't allow non-animating bones to collide with rigid bodies
	// (the proper RB channel will be set upon ragdolling)
	if( !Mesh.bUpdateKinematicBonesFromAnimation )
	{
		Mesh.SetRBChannel(RBCC_Nothing);
		Mesh.SetRBCollidesWithChannel(RBCC_Pawn, FALSE);
	}

	UpdateMeshForFleXCollision();
}

/*********************************************************************************************
 * @name	Character Info Methods
********************************************************************************************* */

/** Set various basic properties for this KFPawn based on the character class metadata */
simulated function SetCharacterArch( KFCharacterInfoBase Info )
{
	local KFPlayerReplicationInfo KFPRI;

    KFPRI = KFPlayerReplicationInfo( PlayerReplicationInfo );
	if (Info != CharacterArch)
	{
		// Set Family Info
		CharacterArch = Info;
		CharacterArch.SetCharacterFromArch( self, KFPRI );
		CharacterArch.SetCharacterMeshFromArch( self, KFPRI );
		CharacterArch.SetFirstPersonArmsFromArch( self, KFPRI );

		SetCharacterAnimationInfo();

		// Sounds
		SoundGroupArch = Info.SoundGroupArch;

		if (WorldInfo.NetMode != NM_DedicatedServer)
		{
			// refresh weapon attachment (attachment bone may have changed)
			if (WeaponAttachmentTemplate != None)
			{
				WeaponAttachmentChanged(true);
			}
		}

		// Give a warning if any of these bones are invalid. They are needed for
        // explosive damage calcs.
        if(Mesh.MatchRefBone(HeadBoneName) == INDEX_NONE)
        {
            `Warn("CharacterInfo HeadBone is invalid for" @ Self);
            ClientMessage("CharacterInfo HeadBone is invalid for" @ Self);
        }
        if(Mesh.MatchRefBone(LeftFootBoneName) == INDEX_NONE)
        {
            `Warn("CharacterInfo LeftFootBone is invalid for" @ Self);
            ClientMessage("CharacterInfo LeftFootBone is invalid for" @ Self);
        }
        if(Mesh.MatchRefBone(RightFootBoneName) == INDEX_NONE)
        {
            `Warn("CharacterInfo RightFootBone is invalid for" @ Self);
            ClientMessage("CharacterInfo RightFootBone is invalid for" @ Self);
        }
        if(Mesh.MatchRefBone(TorsoBoneName) == INDEX_NONE)
        {
            `Warn("CharacterInfo TorsoBone is invalid for" @ Self);
            ClientMessage("CharacterInfo TorsoBone is invalid for" @ Self);
        }
	}

	if( CharacterArch != none )
	{
		if( CharacterArch.VoiceGroupArchName != "" )
		{
			VoiceGroupArch = class<KFPawnVoiceGroup>(DynamicLoadObject(CharacterArch.VoiceGroupArchName, class'Class'));
		}
	}
}

/** Setup animation and ragdoll here */
simulated function SetCharacterAnimationInfo()
{
	// Physics
	if ( CharacterArch.PhysAsset != Mesh.PhysicsAsset )
	{
		// Reinitialized in SetPhysicsAsset only if it needs to be Enabled (PhysicsAsset has flappy bits)
		Mesh.bEnableFullAnimWeightBodies = FALSE;

		// Force it to reinitialize if the skeletal mesh has changed (might be flappy bones etc).
		Mesh.SetPhysicsAsset(CharacterArch.PhysAsset);

		// Fix bodies so they update from animation until ragdoll
		if ( Physics != PHYS_RigidBody )
		{
			Mesh.PhysicsAssetInstance.SetAllBodiesFixed(TRUE);

			if( bAllowAlwaysOnPhysics )
			{
				Mesh.PhysicsAssetInstance.SetFullAnimWeightBonesFixed(FALSE, Mesh);
			}
		}
	}

	// Character Animation
    Mesh.AnimSets = CharacterArch.AnimSets;
	if ( Mesh.AnimTreeTemplate != CharacterArch.AnimTreeTemplate )
	{
		Mesh.SetAnimTreeTemplate(CharacterArch.AnimTreeTemplate);
	}

	if ( CharacterArch.AnimArchetype != None )
	{
		PawnAnimInfo = CharacterArch.AnimArchetype;
	}
}

/** Set gameplay related MIC params on the active body MIC */
simulated function SetGameplayMICParams()
{
    if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
        AfflictionHandler.SetEMPEffects(bEmpDisrupted, bEmpPanicked);
        AfflictionHandler.SetBurnedParameter(ByteToFloat(RepFireBurnedAmount));
    }
}

/** Called when SwitchToGoreLOD is successful */
simulated event NotifyGoreLODActive()
{
    // Need to reset material params since our BodyMIC could have changed
	SetGameplayMICParams();
}

/*********************************************************************************************
 * @name	Camera Methods
********************************************************************************************* */

/**
 *	Calculate camera view point, when viewing this pawn.
 *
 * @param	fDeltaTime	delta time seconds since last update
 * @param	out_CamLoc	Camera Location
 * @param	out_CamRot	Camera Rotation
 * @param	out_FOV		Field of View
 *
 * @return	true if Pawn should provide the camera point of view.
 */
simulated function bool CalcCamera( float fDeltaTime, out vector out_CamLoc, out rotator out_CamRot, out float out_FOV )
{
	// since we've added a first-person camera class (KFFirstPersonCamera),
	// we don't need this to do anything at the moment, and we don't want to
	// call the super because Gears doesn't because it does traces
	return false;
}

event BaseChange()
{
	super.BaseChange();

    // Push the pawn if it tries to stand on top of a door
	if( KFDoorActor(Base) != none )
	{
		Velocity = KFDoorActor(Base).GetPushDirection( Location );
		SetPhysics( PHYS_Falling );
	}
}

/** Set BaseEyeheight/CameraLoc using a relative offset from the CylinderComponent center */
simulated function SetBaseEyeheight()
{
	if ( !bIsCrouched )
		BaseEyeheight = Default.BaseEyeheight;
	else
		BaseEyeheight = Default.BaseCrouchEyeHeight;

	//`log(self@"Absolute BaseEyeheight="$BaseEyeheight + CylinderComponent.CollisionHeight);
}

/* UpdateEyeHeight()
* Update player eye position, based on smoothing view while moving up and down stairs, and adding view bobs for landing and taking steps.
* Called every tick only if bUpdateEyeHeight==true.
*/
event UpdateEyeHeight( float DeltaTime )
{
	local float MaxEyeHeight;
	local Actor HitActor;
	local vector HitLocation,HitNormal;

	if ( bTearOff )
	{
		// no eyeheight updates if dead
		EyeHeight = BaseEyeheight;
		bUpdateEyeHeight = false;
		return;
	}

	if ( abs(Location.Z - OldZ) > 15 )
	{
		// if position difference too great, don't do smooth land recovery
		bJustLanded = false;
		bLandRecovery = false;
	}

	SmoothEyeHeight(DeltaTime);
	UpdateWalkBob(DeltaTime);

	if ( (CylinderComponent.CollisionHeight - Eyeheight < 12) && IsFirstPerson() )
	{
		// desired eye position is above collision box
		// check to make sure that viewpoint doesn't penetrate another actor
		// min clip distance 12
		if (bCollideWorld)
		{
			HitActor = trace(HitLocation,HitNormal, Location + WalkBob + (MaxStepHeight + CylinderComponent.CollisionHeight) * vect(0,0,1),
						  Location + WalkBob, true, vect(12,12,12),, TRACEFLAG_Blocking);
			MaxEyeHeight = (HitActor == None) ? CylinderComponent.CollisionHeight + MaxStepHeight : HitLocation.Z - Location.Z;
			Eyeheight = FMin(Eyeheight, MaxEyeHeight);
		}
	}
}

/* @see UpdateEyeHeight() */
private function SmoothEyeHeight( float DeltaTime )
{
	local float smooth, OldEyeHeight;

	if ( !bJustLanded )
	{
		// normal walking around
		// smooth eye position changes while going up/down stairs
		smooth = FMin(0.9, 10.0 * DeltaTime/CustomTimeDilation);
		LandBob *= (1 - smooth);
		if( Physics == PHYS_Walking || Physics==PHYS_Spider || Controller.IsInState('PlayerSwimming') )
		{
			OldEyeHeight = EyeHeight;
			EyeHeight = FMax((EyeHeight - Location.Z + OldZ) * (1 - smooth) + BaseEyeHeight * smooth,
								-0.5 * CylinderComponent.CollisionHeight);
		}
		else
		{
			EyeHeight = EyeHeight * ( 1 - smooth) + BaseEyeHeight * smooth;
		}
	}
	else if ( bLandRecovery )
	{
		// return eyeheight back up to full height
		smooth = FMin(0.9, 9.0 * DeltaTime);
		OldEyeHeight = EyeHeight;
		LandBob *= (1 - smooth);
		// linear interpolation at end
		if ( Eyeheight > 0.9 * BaseEyeHeight )
		{
			Eyeheight = Eyeheight + 0.15*BaseEyeheight*Smooth;  // 0.15 = (1-0.75)*0.6
		}
		else
			EyeHeight = EyeHeight * (1 - 0.6*smooth) + BaseEyeHeight*0.6*smooth;
		if ( Eyeheight >= BaseEyeheight)
		{
			bJustLanded = false;
			bLandRecovery = false;
			Eyeheight = BaseEyeheight;
		}
	}
	else
	{
		// drop eyeheight a bit on landing
		smooth = FMin(0.65, 8.0 * DeltaTime);
		OldEyeHeight = EyeHeight;
		EyeHeight = EyeHeight * (1 - 1.5*smooth);
		LandBob += 0.08 * (OldEyeHeight - Eyeheight);
		if ( (Eyeheight < 0.25 * BaseEyeheight + 1) || (LandBob > 2.4)  )
		{
			bLandRecovery = true;
			Eyeheight = 0.25 * BaseEyeheight + 1;
		}
	}

	// moved from PerformPhysics so that it works right on client
	OldZ = Location.Z;
}

/* @see UpdateEyeHeight() */
private function UpdateWalkBob( float DeltaTime )
{
	local float Speed2D, OldBobTime;
	local vector X, Y, Z;
	local int m,n;

	// don't bob if disabled, or just landed
	if( bJustLanded || !bUpdateEyeheight )
	{
		BobTime = 0;
		WalkBob = Vect(0,0,0);
	}
	else
	{
		// add some weapon bob based on jumping
		if ( Velocity.Z > 0 )
		{
			JumpBob = FMax(-1.5, JumpBob - 0.03 * DeltaTime * FMin(Velocity.Z,300));
		}
		else
		{
			JumpBob *= (1 -  FMin(1.0, 8.0 * DeltaTime));
		}

		// Add walk bob to movement
		OldBobTime = BobTime;

		if (Physics == PHYS_Walking )
		{
			GetAxes(Rotation,X,Y,Z);
			Speed2D = VSize(Velocity);
			if ( Speed2D < 10 )
				BobTime += 0.2 * DeltaTime;
			else
				BobTime += DeltaTime * (0.3 + 0.7 * Speed2D/GroundSpeed);

			WalkBob = Y * Bob * Speed2D * sin(8 * BobTime);
			AppliedBob = AppliedBob * (1 - FMin(1, 16 * deltatime));
			WalkBob.Z = AppliedBob;
			if ( Speed2D > 10 )
				WalkBob.Z = WalkBob.Z + 0.75 * Bob * Speed2D * sin(16 * BobTime);
		}
		else if ( Physics == PHYS_Swimming )
		{
			GetAxes(Rotation,X,Y,Z);
			BobTime += DeltaTime;
			Speed2D = Sqrt(Velocity.X * Velocity.X + Velocity.Y * Velocity.Y);
			WalkBob = Y * Bob *  0.5 * Speed2D * sin(4.0 * BobTime);
			WalkBob.Z = Bob * 1.5 * Speed2D * sin(8.0 * BobTime);
		}
		else
		{
			BobTime = 0;
			WalkBob = WalkBob * (1 - FMin(1, 8 * deltatime));
		}

		// Match footsteps sounds with walkbob
		if ( (Physics == PHYS_Walking) && (VSizeSq(Velocity) > 100) && IsFirstPerson() )
		{
			m = int(0.5 * Pi + 9.0 * OldBobTime/Pi);
			n = int(0.5 * Pi + 9.0 * BobTime/Pi);

			if ( (m != n) && !bIsWalking && !bIsCrouched )
			{
				// @TODO: turn back on footstep sounds
				//ActuallyPlayFootStepSound(0);
			}
		}
	}
}

/* GetPawnViewLocation()
Called by PlayerController to determine camera position in first person view.  Returns
the location at which to place the camera
*/
simulated function Vector GetPawnViewLocation()
{
	if ( bUpdateEyeHeight )
		return Location + EyeHeight * vect(0,0,1) + WalkBob;
	else
		return Location + BaseEyeHeight * vect(0,0,1);
}

simulated function float GetEyeHeight()
{
	if ( !IsLocallyControlled() )
		return BaseEyeHeight;
	else
		return EyeHeight;
}

/* BecomeViewTarget - Called by Camera when this actor becomes its ViewTarget */
simulated event BecomeViewTarget( PlayerController PC )
{
	Super.BecomeViewTarget(PC);

	if (LocalPlayer(PC.Player) != None)
	{
		// Toggle preshadows before attaching component (depending on graphics settings)
		if( AllowFirstPersonPreshadows() )
		{
			ArmsMesh.bAllowPerObjectShadows = true;
		}
		else
		{
			ArmsMesh.bAllowPerObjectShadows = false;
		}

		SetMeshVisibility(!PC.UsingFirstPersonCamera());
		bUpdateEyeHeight = true;
	}
}

/* EndViewTarget - Called by Camera when this actor becomes its ViewTarget */
simulated event EndViewTarget( PlayerController PC )
{
	if (LocalPlayer(PC.Player) != None)
	{
		SetMeshVisibility(true);
	}
}

/**
 * Event called from native code when Pawn stops crouching.
 * Called on non owned Pawns through bIsCrouched replication.
 * Network: ALL
 *
 * @param	HeightAdjust	height difference in unreal units between default collision height, and actual crouched cylinder height.
 */
simulated event EndCrouch(float HeightAdjust)
{
	Super.EndCrouch(HeightAdjust);

	OldZ += HeightAdjust;

	// offset mesh by height adjustment
	if( Mesh != None )
	{
		BaseTranslationOffset -= HeightAdjust;
		Mesh.SetTranslation(Mesh.Translation - Vect(0,0,1)*HeightAdjust);
	}
}

/**
 * Event called from native code when Pawn starts crouching.
 * Called on non owned Pawns through bIsCrouched replication.
 * Network: ALL
 *
 * @param	HeightAdjust	height difference in unreal units between default collision height, and actual crouched cylinder height.
 */
simulated event StartCrouch(float HeightAdjust)
{
	// Calculate our own HeightAdjust to fix engine off-by-one error for SimulatedProxies
	// see PostNetRecieveLocation [aladenberger 4/11/2014]
	HeightAdjust = default.CylinderComponent.CollisionHeight - CrouchHeight;

	Super.StartCrouch(HeightAdjust);

	OldZ -= HeightAdjust;

	// offset mesh by height adjustment
	if( Mesh != None )
	{
		BaseTranslationOffset += HeightAdjust;
		Mesh.SetTranslation(Mesh.Translation + Vect(0,0,1)*HeightAdjust);
	}
}

/*********************************************************************************************
 * @name	Weapon Methods
********************************************************************************************* */

/** sets whether or not the third person weapon of this pawn is visible */
native function SetWeaponAttachmentVisibility(bool bAttachmentVisible);
/** Returns TRUE if this pawn is currently performing a Special Melee Attack Move. */
native function bool IsDoingMeleeAttack() const;

/** Notification called from Pawn animation, by KFAnimNotify_MeleeImpact. */
simulated function MeleeImpactNotify(KFAnimNotify_MeleeImpact Notify);
/** Called when a pawn's weapon changes state. */
simulated function WeaponStateChanged(byte NewState, optional bool bViaReplication);

/** Reset/Update ground speed based on perk/weapon selection (Net: Server) */
function UpdateGroundSpeed();

/** Server - Called when a new weapon is added or removed from inventory */
function NotifyInventoryWeightChanged()
{
	UpdateGroundSpeed();
}

/**
 * Player just changed weapon. Called from InventoryManager::ChangedWeapon().
 * Network: Local Player and Server.
 *
 * @param	OldWeapon	Old weapon held by Pawn.
 * @param	NewWeapon	New weapon held by Pawn.
 */
simulated function PlayWeaponSwitch(Weapon OldWeapon, Weapon NewWeapon)
{
	// Save a reference to carried Weapon, so we don't cast all over the place.
	MyKFWeapon = KFWeapon(Weapon);
}

/**
 * Overridden to iterate through the DefaultInventory array and
 * give each item to this Pawn.
 *
 * @see			GameInfo.AddDefaultInventory
 */
function AddDefaultInventory()
{
	local KFInventoryManager KFIM;
	local class<Inventory> InvClass;
	local Inventory Inv;

	foreach DefaultInventory(InvClass)
	{
		// Ensure we don't give duplicate items
		Inv = FindInventoryType(InvClass);

		// if item not found
		if( Inv == None )
		{
			// Create it and add to inventory chain, only activate if we don't have a weapon currently selected
			Inv = CreateInventory(InvClass, Weapon != None);

			if ( KFWeapon( Inv ) != none )
			{
             	KFWeapon( Inv ).bGivenAtStart = true;
			}
		}
	}

	KFIM = KFInventoryManager(InvManager);
	foreach DefaultInventoryArchetypes(Inv)
	{
		// Create it and add to inventory chain, only activate if we don't have a weapon currently selected
		KFIM.CreateInventoryArchetype(Inv, Weapon != None);
	}

	if(Role == ROLE_Authority)
	{
		KFIM.ShowAllHUDGroups();
	}
}

/** First person weapon visility */
simulated function SetFirstPersonVisibility(bool bWeaponVisible)
{
	// Added Instigator check to catch out of date cached weapon, can happen on death
	if ( MyKFWeapon != None && MyKFWeapon.Instigator == self )
	{
		MyKFWeapon.ChangeVisibility(bWeaponVisible);
	}
	else if ( ArmsMesh != None )
	{
		ArmsMesh.SetHidden(!bWeaponVisible);
	}
}

/**
 * Called when there is a need to change the weapon attachment (either via
 * replication or locally if controlled.
 */
simulated function WeaponAttachmentChanged(optional bool bForceReattach)
{
	if (WorldInfo.NetMode == NM_DedicatedServer)
	{
		return;
	}

	// Detach/Destroy the current attachment if we have one
	if (WeaponAttachment != None)
	{
		if (WeaponAttachment.ObjectArchetype != WeaponAttachmentTemplate || bForceReattach)
		{
			WeaponAttachment.DetachFrom(self);
			WeaponAttachment.Destroy();
			WeaponAttachment = None;
		}
	}

	// Create the new Attachment.
	if (WeaponAttachment == None)
	{
		if (Mesh.SkeletalMesh != None && WeaponAttachmentTemplate != None)
		{
			WeaponAttachment = Spawn(WeaponAttachmentTemplate.Class, self,,,, WeaponAttachmentTemplate);
			if (WeaponAttachment != None)
			{
				WeaponAttachment.Instigator = self;
				WeaponAttachment.AttachTo(self);
				WeaponAttachment.ChangeVisibility(bWeaponAttachmentVisible);
				WeaponAttachment.SetMeshLightingChannels(PawnLightingChannel);
			}
		}
	}
}

/**
 * Called when a pawn's weapon has fired and is responsibile for
 * delegating the creation off all of the different effects.
 *
 * bViaReplication denotes if this call in as the result of the
 * flashcount/flashlocation being replicated.  It's used filter out
 * when to make the effects.
 */
simulated function WeaponFired(Weapon InWeapon, bool bViaReplication, optional vector HitLocation)
{
	local KFWeapon KFW;
	local class< KFProjectile > KFProj;
	local KFImpactEffectInfo ImpactFX;

	// skip replication for owning client.  This is done clientside for immediate
	// player feedback (see 'InstantFireClient')
	if ( Role == ROLE_AutonomousProxy && bViaReplication )
	{
		return;
	}

	LastWeaponFireTime = WorldInfo.TimeSeconds;

	if ( IsFirstPerson() )
	{
		// most first person FX are done in Weapon.PlayFireEffects, but this allows us
		// to reuse some code that is implemented in the weapon attachment (e.g. tracers)
		if (WeaponAttachment != None)
		{
            WeaponAttachment.FirstPersonFireEffects(Weapon, HitLocation);
		}
	}
	else
	{
		if (WeaponAttachment != None)
		{
			WeaponAttachment.ThirdPersonFireEffects(HitLocation, self);
		}
	}

	// Play 1stP & 3rdP Impact Effects for FireType == EWFT_InstantHit
	if ( HitLocation != Vect(0,0,0) && WorldInfo.NetMode != NM_DedicatedServer )
	{
		if ( WorldInfo.MyImpactEffectManager != None )
		{
			// try to use custom impact info from projectile class
			KFW = KFWeapon( InWeapon );
			if( KFW != none )
			{
				KFProj = KFW.GetKFProjectileClass();
				if( KFProj != none )
				{
					ImpactFX = KFProj.default.ImpactEffects;
				}
			}

			// no custom impact info, use ImpactEffectManager default
			`ImpactEffectManager.PlayImpactEffects(HitLocation, self,, ImpactFX);
		}
	}

	if ( Role == ROLE_Authority && bUnaffectedByZedTime && WorldInfo.TimeDilation < 1.f )
	{
		StopPartialZedTime();
	}
}

simulated function WeaponStoppedFiring(Weapon InWeapon, bool bViaReplication)
{
	if (WeaponAttachment != None)
	{
		// always call function for both viewpoints, as during the delay between calling EndFire() on the weapon
		// and it actually stopping, we might have switched viewpoints (e.g. this commonly happens when entering a vehicle)
		WeaponAttachment.StopThirdPersonFireEffects();
		WeaponAttachment.StopFirstPersonFireEffects(Weapon);
	}
}

simulated function vector WeaponBob( float BobDamping, float JumpDamping )
{
	local Vector V;
	local KFPerk OwnerPerk;

	OwnerPerk = GetPerk();
	if( OwnerPerk != none && MyKFWeapon != none && MyKFWeapon.bUsingSights )
	{
		OwnerPerk.ModifyWeaponBopDamping( BobDamping, MyKFWeapon );
	}

	V = BobDamping * WalkBob;
	V.Z = (0.45 + 0.55 * BobDamping)*WalkBob.Z;
	if ( !bWeaponBob )
	{
		//V *= 2.5; // legacy? --- Instead, match WalkBob
		V = WalkBob;
	}
	V.Z += JumpDamping *(LandBob - JumpBob);
	return V;
}

/** Can Pawn reload his weapon? */
final simulated function bool CanReloadWeapon()
{
	if( Physics == PHYS_RigidBody )
	{
		return FALSE;
	}

	return TRUE;
}

/**
 * Returns location to use when testing if this pawn was hit by a melee attack.  Useful to override, e.g., for
 * small creatures close to the ground.
 */
simulated function vector GetMeleeHitTestLocation()
{
	return Location;
}

/** Called by KFPawnAnimInfo when determining whether an attack can be performed */
function bool ShouldPlayHeadlessMeleeAnims();
/** Called by KFPawnAnimInfo when determining whether an attack can be performed */
function bool ShouldPlaySpecialMeleeAnims();

/** Called during zed time when this actor should become fully affected */
function StopPartialZedTime()
{
	bUnaffectedByZedTime = false;
}

/** Enables/disables the light for night vision (humans only) */
simulated function SetNightVisionLight(bool bEnabled);

/** called from third person skel mesh */
simulated function ANIMNOTIFY_ShellEject()
{
	if ( WeaponAttachment != None )
	{
		WeaponAttachment.ANIMNOTIFY_ShellEject();
	}
}

/** called from ANIMNOTIFY_SpawnKActor -- allows access to the KActor after spawn */
simulated function ANIMNOTIFY_SpawnedKActor( KFKActorSpawnable NewKActor, AnimNodeSequence AnimSeqInstigator );

/**
 * Allow Controller.GetAdjustedAimFor() on clients
 */
simulated function Rotator GetAdjustedAimFor( Weapon W, vector StartFireLoc )
{
	// If controller doesn't exist or we're a client, get the where the Pawn is aiming at
	if ( Controller == None /*|| Role < Role_Authority*/ )
	{
		return GetBaseAimRotation();
	}

	// otherwise, give a chance to controller to adjust this Aim Rotation
	return Controller.GetAdjustedAimFor( W, StartFireLoc );
}

/*********************************************************************************************
 * @name	Aim Assist
********************************************************************************************* */

/** Returns bone names to use for ironsight lock-on targeting */
simulated function bool GetAutoTargetBones(out array<name> WeakBones, out array<name> NormalBones)
{
	if ( !IsHeadless() )
	{
		WeakBones.AddItem(HeadBoneName);
	}
	NormalBones.AddItem(TorsoBoneName);
	NormalBones.AddItem(PelvisBoneName);
	return true;
}

/** For a given camera location give the best auto target location on this character */
simulated function vector GetAutoLookAtLocation(vector CamLoc, Pawn InstigatingPawn)
{
	local vector			HitLocation, HitNormal;
	local Actor				HitActor;
	local TraceHitInfo		HitInfo;
	local vector            HeadLocation, TorsoLocation, PelvisLocation;    

    // Check to see if we can hit the head
	HeadLocation = Mesh.GetBoneLocation(HeadBoneName);
	HitActor = InstigatingPawn.Trace(HitLocation, HitNormal, HeadLocation, CamLoc, TRUE, vect(0,0,0), HitInfo, TRACEFLAG_Bullet);
	if( HitActor == none || HitActor == Self )
	{
		//`log("Autotarget - found head");
		return HeadLocation + (vect(0,0,-10.0));
	}
   
	// Try for the torso
    TorsoLocation = Mesh.GetBoneLocation(TorsoBoneName);
    HitActor = InstigatingPawn.Trace(HitLocation, HitNormal, TorsoLocation, CamLoc, TRUE, vect(0,0,0), HitInfo, TRACEFLAG_Bullet);
    if( HitActor == none || HitActor == Self)
    {
        //`log("Autotarget - found torso");
        return TorsoLocation;
    }

	// Try for the pelvis
    PelvisLocation = Mesh.GetBoneLocation(PelvisBoneName);
    HitActor = InstigatingPawn.Trace(HitLocation, HitNormal, PelvisLocation, CamLoc, TRUE, vect(0,0,0), HitInfo, TRACEFLAG_Bullet);
    if( HitActor == none || HitActor == Self)
    {
        //`log("Autotarget - found pelvis");
        return PelvisLocation;
    }

    //`log("Autotarget - found noting - returning location");
    return Location + BaseEyeHeight * vect(0,0,0.5f);
}
/*********************************************************************************************
 * @name	Movement Methods
********************************************************************************************* */

/** Is this pawn using super speed? */
native final function bool IsUsingSuperSpeed() const;
native function bool IsPawnMovingAwayFromMe( Pawn CheckPawn, optional float MinSpeed );
native function bool IsPawnMovingTowardMe( Pawn CheckPawn, optional float MinSpeed );

/** returns true if this pawn is surrounded by other pawns */
native function bool IsSurrounded(bool bOnlyEnemies, optional int MinNearbyPawns=2, optional float Radius=200);

/** Called from KFAIController::MoveToward, a good time to update sprinting status right before a move. */
event UpdateSprinting( Actor Goal );

function SetSprinting(bool bNewSprintStatus)
{
	if ( bNewSprintStatus )
	{
		// Wait for uncrouch; see CheckJumpOrDuck
		if ( bIsCrouched )
		{
			bNewSprintStatus = false;
		}
		else if ( MyKFWeapon != None && !MyKFWeapon.AllowSprinting() )
		{
			bNewSprintStatus = false;
		}
	}

	bIsSprinting = bNewSprintStatus;

	if ( MyKFWeapon != None )
	{
		MyKFWeapon.SetWeaponSprint(bNewSprintStatus);
	}
}

/** Perform jump if bJumpCapable=TRUE */
function bool DoJump( bool bUpdating )
{
	if ( Super.DoJump(bUpdating) )
	{
		// cancel ironsights
		if ( MyKFWeapon != None && MyKFWeapon.bUsingSights )
		{
			MyKFWeapon.PerformZoom(false);
		}

		return true;
	}

	return false;
}

/** Local Player - Short jump delay while waiting on Uncrouch */
function bool CannotJumpNow()
{
	local PlayerController PC;
	local KFPlayerInput Input;

	if ( bIsCrouched )
	{
		PC = PlayerController(Controller);
		if ( PC != None && PC.bDuck == 0 )
		{
			Input = KFPlayerInput(PC.PlayerInput);
			if ( Input != None && `TimeSince(Input.PressedJumpTime) < 0.05f )
			{
				return true;
			}
		}
	}

	return false;
}

/** Overridden for CanBecomeDynamic actors */
simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	local StaticMeshComponent OtherSMC;

	// Check for CanBecomeDynamic - When BlockActors=TRUE MakeDynamic is handled through physics
	// code, otherwise use the touch event to activate. Generally, we want BlockActors=FALSE
	// because these are clientside actors that can be in different positions on client and server.
	if ( Other.bWorldGeometry && !OtherComp.BlockActors && Physics != PHYS_Spider )
	{
		// since we allow this on remote clients, do EffectIsRelevant check
		if ( !WorldInfo.bDropDetail && WorldInfo.GetDetailMode() > DM_Low && ActorEffectIsRelevant(self, false) )
		{
			OtherSMC = StaticMeshComponent(OtherComp);
			if ( OtherSMC != None && OtherSMC.CanBecomeDynamic() )
			{
				class'KActorFromStatic'.Static.MakeDynamic(OtherSMC);
			}
		}
	}
}

/**
 * Are we allowing this Pawn to be based on us?
 * Allow Interaction Pawns to be based, since we do a lot of attachment stuff there.
 */
simulated function bool CanBeBaseForPawn(Pawn APawn)
{
	return bCanBeBaseForPawns || (InteractionPawn == APawn);
}

/** Modified with increased X/Y and decreased Z */
function JumpOffPawn()
{
	local float Theta;

	// 2d version of vrand
	Theta = 2.f * PI * FRand();
	SetPhysics(PHYS_Falling);

	if ( Controller != None && !IsHumanControlled() )
	{
		// push AI more aggresively
		Velocity.X += Cos(Theta) * (750 + CylinderComponent.CollisionRadius);
		Velocity.Y += Sin(Theta) * (750 + CylinderComponent.CollisionRadius);
		if ( VSize2D(Velocity) > 2.0 * FMax(500.0, GroundSpeed) )
		{
			Velocity = 2.0 * FMax(500.0, GroundSpeed) * Normal(Velocity);
		}
		Velocity.Z = 400;
		// counteract the AI's high AirControl
		AirControl = 0.05f;
		SetTimer(1.0, false, nameof(RestoreAirControlTimer));
	}
	else
	{
		Velocity.X += Cos(Theta) * (150 + CylinderComponent.CollisionRadius);
		Velocity.Y += Sin(Theta) * (150 + CylinderComponent.CollisionRadius);
		if ( VSize2D(Velocity) > FMax(500.0, GroundSpeed) )
		{
			Velocity = FMax(500.0, GroundSpeed) * Normal(Velocity);
		}
		Velocity.Z = 200;
	}
}

/** Called from JumpOffPawn */
function RestoreAirControlTimer()
{
	// temp until we investigate why it's set in PossessedBy
	if ( Controller != None && !IsHumanControlled() )
	{
		AirControl = AIAirControl;
		return;
	}

	AirControl = default.AirControl;
}

/*********************************************************************************************
 * @name	Rendering Methods
********************************************************************************************* */

/** sets whether or not the owner of this pawn can see it */
simulated function SetMeshVisibility(bool bVisible)
{
	// Handle the main player mesh
	if (Mesh != None)
	{
		Mesh.SetOwnerNoSee(!bVisible);
		Mesh.CastShadow = bVisible;
	}

	// Head Mesh
	HideHead( !bVisible );

	// Handle weapon attachment
	SetWeaponAttachmentVisibility(bVisible);

	// Handle any weapons they might have
	SetFirstPersonVisibility(!bVisible);

	// FleX collision is off while in 1st person
	SetEnableFleXCollision(bVisible);
}

/** Set the lighting channels on all the appropriate pawn meshes */
simulated function SetMeshLightingChannels(LightingChannelContainer NewLightingChannels)
{
	local int AttachmentIdx;

	// When this function gets called during PostBeginPlay(), the pawn does not have
	// a weapon or a weapon attachment. So, cache the current lighting channel here.
	// This is set on the weapon and weapon attachment when they are assigned to the
	// pawn in KFWeapon::AttachWeaponTo() and KFPawn::WeaponAttachmentChanged() respectively.
	PawnLightingChannel = NewLightingChannels;

	// Third Person
	if( mesh != none )
	{
		Mesh.SetLightingChannels(NewLightingChannels);
	}
	if( ThirdPersonHeadMeshComponent != none )
	{
		ThirdPersonHeadMeshComponent.SetLightingChannels(NewLightingChannels);
	}

	for( AttachmentIdx=0; AttachmentIdx < `MAX_COSMETIC_ATTACHMENTS; AttachmentIdx++ )
	{
		if( ThirdPersonAttachments[AttachmentIdx] != none )
		{
			ThirdPersonAttachments[AttachmentIdx].SetLightingChannels(NewLightingChannels);
		}
	}

	// First Person
	if( ArmsMesh != none )
	{
		ArmsMesh.SetLightingChannels(NewLightingChannels);
	}

	// Weapon Attachment
	if( WeaponAttachment != none)
	{
		WeaponAttachment.SetMeshLightingChannels(NewLightingChannels);
	}

	// Weapon
	if( Weapon != none )
	{
		Weapon.SetMeshLightingChannels(NewLightingChannels);
	}
}

simulated function HideHead( bool bHide )
{
	// Head Mesh
	if( ThirdPersonHeadMeshComponent != none )
	{
		ThirdPersonHeadMeshComponent.SetOwnerNoSee(bHide);
	}

	// @fixme Assuming cosmetic attachment is part of head mesh for now
	SetThirdPersonAttachmentVisibility( !bHide );
}

simulated function SetThirdPersonAttachmentVisibility( bool bVisible )
{
	local int AttachmentIdx;

	for( AttachmentIdx=0; AttachmentIdx < `MAX_COSMETIC_ATTACHMENTS; AttachmentIdx++ )
	{
		if( ThirdPersonAttachments[AttachmentIdx] != none )
		{
			ThirdPersonAttachments[AttachmentIdx].SetOwnerNoSee(!bVisible);
		}
	}
}

/*********************************************************************************************
 * @name	Damage/Death Methods
********************************************************************************************* */

/** If returns true, this monster is vulnerable to this damage type damage */
function bool IsVulnerableTo(class<DamageType> DT, optional out float DamageMod);
/** If returns true, this monster is vulnerable to this damage type damage */
function bool IsResistantTo(class<DamageType> DT, optional out float DamageMod);

simulated final function float GetHealthPercentage()
{
	return float(Health) / float(HealthMax);
}

/**
 * Applies a push-back velocity on taking damage
 * @note: Momentum is actually velocity!  For some reason it's been processed and divided by mass (see TakeDamage)
 */
function HandleMomentum( vector Momentum, Vector HitLocation, class<DamageType> DamageType, optional TraceHitInfo HitInfo )
{
	// Does our current special move allow momentum pushback?
	if ( SpecialMove != SM_None && !SpecialMoves[SpecialMove].bAllowMomentumPush )
	{
		return;
	}

	// Don't transfer momentum unless it's large enough to be useful. This will prevent rapid PHYS_Walking<->PHYS_Falling
	if ( VSizeSq(Momentum) > Square(200) )
	{
		AddVelocity( Momentum, HitLocation, DamageType, HitInfo );
	}
}

event bool HealDamage(int Amount, Controller Healer, class<DamageType> DamageType, optional bool bRepairArmor=true, optional bool bMessageHealer=true)
{
    local int i;

    // Reduce burn duration and damage in half if you heal while burning
    for( i=0; i<DamageOverTimeArray.Length; ++i )
	{
        if( DamageOverTimeArray[i].DoT_Type == DOT_Fire )
        {
            DamageOverTimeArray[i].Duration *= 0.5;
            DamageOverTimeArray[i].Damage *= 0.5;
            break;
        }
	}

	return Super.HealDamage(Amount, Healer, DamageType);
}

/** Overloaded to use a custom damagetype */
function TakeFallingDamage()
{
	local float EffectiveSpeed;

	if (Velocity.Z < -0.5 * MaxFallSpeed)
	{
		if ( Role == ROLE_Authority )
		{
			MakeNoise(1.0);
			if (Velocity.Z < -1 * MaxFallSpeed)
			{
				EffectiveSpeed = Velocity.Z;
				if (TouchingWaterVolume())
				{
					EffectiveSpeed += 100;
				}
				if (EffectiveSpeed < -1 * MaxFallSpeed)
				{
					TakeDamage(-100 * (EffectiveSpeed + MaxFallSpeed)/MaxFallSpeed, None, Location, vect(0,0,0), class'KFDT_Falling');
				}
			}
		}
	}
	else if (Velocity.Z < -1.4 * JumpZ)
		MakeNoise(0.5);
	else if ( Velocity.Z < -0.8 * JumpZ )
		MakeNoise(0.2);
}

/** Radius damage (e.g. explosives) */
simulated function TakeRadiusDamage
(
	Controller			InstigatedBy,
	float				BaseDamage,
	float				DamageRadius,
	class<DamageType>	DamageType,
	float				Momentum,
	vector				HurtOrigin,
	bool				bFullDamage,
	Actor				DamageCauser,
	optional float      DamageFalloffExponent=1.f
)
{
	bTakingRadiusDamage = true;
	Super.TakeRadiusDamage(InstigatedBy, BaseDamage, DamageRadius, DamageType, Momentum, HurtOrigin, bFullDamage, DamageCauser, DamageFalloffExponent);
	bTakingRadiusDamage = false;
}

/** apply some amount of damage to this actor */
event TakeDamage(int Damage, Controller InstigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local int OldHealth;
	local class<KFDamageType> KFDT;

	// NVCHANGE_BEGIN - RLS - Debugging Effects
`if(`notdefined(ShippingPC))
	if( WorldInfo.Game != none && KFGameInfo(WorldInfo.Game).bNVAlwaysHeadshot )
	{
		HitFxInfo.HitBoneIndex = HZI_HEAD;
	}
`endif
	// NVCHANGE_BEGIN - RLS - Debugging Effects

	OldHealth = Health;
	Super.TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);

	// Handle DamageOverTime.  Must be done in TakeDamage for access to original unmodified
	// damage.  Requires valid DamageCauser, 'None' for DoT, to prevent recursion
	if ( Health < OldHealth && DamageCauser != None )
	{
		KFDT = class<KFDamageType>(DamageType);
        if ( KFDT != None && KFDT.static.CanApplyDamageOverTime(Damage, KFDT, InstigatedBy) )
		{
			ApplyDamageOverTime(Damage, InstigatedBy, KFDT);
		}
	}

	// Notify game info of a headshot kill.  Done here instead of Died() so we have an accurate HitInfo/HitZone
	if ( bPlayedDeath && OldHealth > 0 && HitFxInfo.HitBoneIndex == HZI_HEAD && WorldInfo.Game != None )
	{
		KFGameInfo(WorldInfo.Game).NotifyHeadshotKill(InstigatedBy, self);
	}
}

/** Adjust damage based on inventory, other attributes */
function AdjustDamage(out int InDamage, out vector Momentum, Controller InstigatedBy, vector HitLocation, class<DamageType> DamageType, TraceHitInfo HitInfo, Actor DamageCauser)
{
	local int HitZoneIdx;

	`log(self@GetFuncName()@"Starting Damage="$InDamage@"Momentum="$Momentum@"Zone="$HitInfo.BoneName@"DamageType="$DamageType, bLogTakeDamage);

	// Allow current weapon state to reduce damage
	if ( MyKFWeapon != None )
	{
		MyKFWeapon.AdjustDamage(InDamage, DamageType, DamageCauser);
	}

	// Increase AI damage by AI Damage modifiers
    if( InDamage > 0 && InstigatedBy != none && !InstigatedBy.bIsPlayer
        && KFAIController_Monster(InstigatedBy) != none )
	{
		`log(self@GetFuncName()@" Difficulty Damage Mod ="$KFAIController_Monster(InstigatedBy).DifficultyDamageMod, bLogTakeDamage);
        InDamage = Max(InDamage * KFAIController_Monster(InstigatedBy).DifficultyDamageMod, 1);
	}

	// apply zone specific vulnerability/resistance
	HitZoneIdx = HitZones.Find('ZoneName', HitInfo.BoneName);
	if( HitZoneIdx != INDEX_NONE )
	{
		InDamage *= HitZones[HitZoneIdx].DmgScale;
	}

    `log(self@GetFuncName()@" After KFPawn adjustment Damage="$InDamage@"Momentum="$Momentum@"Zone="$HitInfo.BoneName@"DamageType="$DamageType, bLogTakeDamage);
}


/** Adjusts RadiusDamage (called just before AdjustDamage) */
function AdjustRadiusDamage(out float InBaseDamage, float DamageScale, vector HurtOrigin)
{
	// Reduce the damage by the amount of exposuse this pawn has to the explosion
    InBaseDamage *= GetExposureTo(HurtOrigin);

	// Replicated value for clientside ragdoll momentum
	LastRadiusDamageScale = FloatToByte(DamageScale);
	LastRadiusHurtOrigin = HurtOrigin;

	// NVCHANGE_BEGIN - RLS - Debugging Effects
`if(`notdefined(ShippingPC))
	if( WorldInfo.Game != none && KFGameInfo(WorldInfo.Game).bNVDebugDamage)
	{
	    FlushPersistentDebugLines();
		DrawDebugSphere( LastRadiusHurtOrigin, LastRadiusDamageScale, 10, 255, 255, 0, true );
	}
`endif	
	// NVCHANGE_BEGIN - RLS - Debugging Effects
}

/**
 * returns how exposed this pawn is to a location
 */
function float GetExposureTo(vector TraceStart)
{
	local float PercentExposed;

//    DrawDebugLine(Mesh.GetBoneLocation(HeadBoneName), TraceStart, 255, 0, 0, TRUE);
//    DrawDebugLine(Mesh.GetBoneLocation(LeftFootBoneName), TraceStart, 255, 0, 0, TRUE);
//    DrawDebugLine(Mesh.GetBoneLocation(RightFootBoneName), TraceStart, 255, 0, 0, TRUE);
//    DrawDebugLine(Location, TraceStart, 255, 0, 0, TRUE);

	
	if( FastTrace(Mesh.GetBoneLocation(HeadBoneName), TraceStart,, true) )
	{
		PercentExposed += 0.4;
	}

	// A trace to location is already done by GameExplosionActor.uc, so we always have
	// a base exposure of 0.3
    //if ( FastTrace(Location, TraceStart,, true) )
	//{
	//	PercentExposed += 0.3;
	//}
	PercentExposed += 0.3f;

	if( FastTrace(Mesh.GetBoneLocation(LeftFootBoneName), TraceStart,, true) )
	{
		PercentExposed += 0.15;
	}

	if( FastTrace(Mesh.GetBoneLocation(RightFootBoneName), TraceStart,, true) )
	{
		PercentExposed += 0.15;
	}

	return PercentExposed;
}

/** Called before InitRagdoll() to make sure kinematic update is active */
simulated function PrepareRagdoll()
{
	// Turn off hit reactions
	if( PhysicsImpactBlendTimeToGo > 0.f )
	{
		StopPhysicsBodyImpact();
	}

	// Ensure we are always updating kinematic
	Mesh.MinDistFactorForKinematicUpdate = 0.0;

	// Force update mesh when ragdoll starts
	Mesh.bUpdateSkelWhenNotRendered = true;

	// If we had stopped updating kinematic bodies on this character due to distance from camera, force an update of bones now.
	// Also ensure rigid body collision is on.
	if( Mesh.bNotUpdatingKinematicDueToDistance )
	{
		Mesh.ForceSkelUpdate();
		Mesh.UpdateRBBonesFromSpaceBases(TRUE, TRUE);
		Mesh.SetBlockRigidBody(TRUE);
	}
	else if ( !Mesh.bUpdateKinematicBonesFromAnimation )
	{
		Mesh.UpdateRBBonesFromSpaceBases(TRUE, TRUE);
	}
	else if ( !bPlayedDeath && Role < ROLE_Authority )
	{
		// @hack: fix a bug with character stuck in ground after knockdown
		// This is probably happening because SyncActorToRBPhysics is called before InitRigidBody()
		Mesh.UpdateRBBonesFromSpaceBases(TRUE, TRUE);
	}
}

/** Plays damagetype specific material effects */
simulated function PlayDamageMaterialEffects(name DamageMICParamName, float Duration)
{
	MaterialEffectTimeRemaining = Duration;
	MaterialEffectDuration = Duration;
	MaterialEffectParamName = DamageMICParamName;
}

/* PlayDying() is called on server/standalone game when killed
and also on net client when pawn gets bTearOff set to true (and bPlayedDeath is false)
*/
simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
	// Clean up and terminate any currently playing effects
	TerminateEffectsOnDeath();

	// Abort current special move
	if( IsDoingSpecialMove() )
	{
		SpecialMoveHandler.EndSpecialMove();
	}

	if( bCanHeadTrack && bIsHeadTrackingActive && MyLookAtInfo.LookAtTarget != none )
	{
		ClearHeadTrackTarget( MyLookAtInfo.LookAtTarget );
	}

	// If possible, initialize a ragdoll death
	if( ShouldRagdollOnDeath() )
	{
		PlayRagdollDeath(DamageType, HitLoc);
	}
	else
	{
		HideMeshOnDeath();
	}

	// no need for cylinder to block anymore
	CylinderComponent.SetTraceBlocking(FALSE, FALSE);

	// Track start time for gore effects (see Gears)
	if (TimeOfDeath == 0.0f)
	{
		TimeOfDeath	= WorldInfo.TimeSeconds;
	}

	Super.PlayDying(DamageType, HitLoc);

	// Undo the addtional velocity from super().  This causes problems for ApplyRagdollImpulse
	Velocity -= TearOffMomentum;
}

/** Returns true if this pawn should call PlayRagdollDeath */
simulated function bool ShouldRagdollOnDeath()
{
	if ( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return false;
	}

	// When DropDetail is set, cull non-visible deaths
	if ( (WorldInfo.bDropDetail || WorldInfo.GetDetailMode() == DM_Low ) &&
		!ActorEffectIsRelevant((LastHitBy != None) ? LastHitBy.Pawn : None, false, 50000) )
	{
		return false;
	}

	return true;
}

/* PlayDying() is called on server/standalone game when killed
and also on net client when pawn gets bTearOff set to true (and bPlayedDeath is false)
*/
simulated function PlayRagdollDeath(class<DamageType> DamageType, vector HitLoc)
{
	local TraceHitInfo HitInfo;
	local vector HitDirection;

	PrepareRagdoll();

	if ( InitRagdoll() )
	{
		// Switch to a good RigidBody TickGroup to fix projectiles passing through the mesh
		// https://udn.unrealengine.com/questions/190581/projectile-touch-not-called.html
		//Mesh.SetTickGroup(TG_PostAsyncWork);
		SetTickGroup(TG_PostAsyncWork);

		// Allow all ragdoll bodies to collide with all physics objects (ie allow collision with things marked RigidBodyIgnorePawns)
		Mesh.SetRBChannel(RBCC_DeadPawn);
		Mesh.SetRBCollidesWithChannel(RBCC_DeadPawn, ShouldCorpseCollideWithDead());
		// ignore blocking volumes, this is important for volumes that don't always block (e.g. PawnBlockingVolume)
		Mesh.SetRBCollidesWithChannel(RBCC_BlockingVolume, FALSE);

		// Call CheckHitInfo to give us a valid BoneName
		HitDirection = Normal(TearOffMomentum);
    	CheckHitInfo(HitInfo, Mesh, HitDirection, HitLoc);

		// Play ragdoll death animation (bSkipReplication=TRUE)
		if( CanDoSpecialMove(SM_DeathAnim) && ClassIsChildOf(DamageType, class'KFDamageType') )
		{
			DoSpecialMove(SM_DeathAnim, TRUE,,,TRUE);
			KFSM_DeathAnim(SpecialMoves[SM_DeathAnim]).PlayDeathAnimation(DamageType, HitDirection, HitInfo.BoneName);
		}
		else
		{
			StopAllAnimations(); // stops non-RBbones from animating (fingers)
		}
	}
}

/** Called when ShouldRagdollOnDeath returns FALSE (server or client) */
simulated event HideMeshOnDeath()
{
	if ( !Mesh.HiddenGame )
	{
		// Hide Meshes.  Can't use Actor.SetHidden because it will replicate
		Mesh.SetHidden(true);
		ThirdPersonHeadMeshComponent.SetHidden(true);

		// turn off skeletal anims
		StopAllAnimations();

		// Abuse SetOnlyOwnerSee/bOverrideAttachmentOwnerVisibility to hide attached FX (e.g. blood jets)
		Mesh.SetOnlyOwnerSee(true);

		// destroy soon after TearOff
		LifeSpan = 2.f;
	}
}

/** Changed to simulated so we don't have to replicate the sound */
simulated function PlayDyingSound()
{
	SoundGroupArch.PlayDyingSound( self );
}

/** This pawn has died. */
function bool Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
	if (Super.Died(Killer, DamageType, HitLocation))
	{
		// Other pathing NPCs will stop considering me as a potential path blocker.
		bBlocksNavigation = false;

		// Replicate in params to other clients.  These are from Pawn.uc, but never get set.
		HitDamageType		= damageType;
		TakeHitLocation		= HitLocation;
		return true;
	}

	return false;
}

/** We do not want to be encroached. (Important for Knockdown) */
event EncroachedBy( actor Other )
{
}

/** Called when a melee attack has been parried by another pawn */
function bool NotifyAttackParried(Pawn InstigatedBy, byte InParryStrength)
{
	local KFSM_MeleeAttack Move;
	local KFPawn InstigatorPawn;
	local KFPerk InstigatorPerk;

	if ( SpecialMove == SM_MeleeAttack || SpecialMove == SM_Grab )
	{
		if ( CanDoSpecialMove(SM_Stumble) || CanDoSpecialMove(SM_KnockDown) )
		{
			if ( SpecialMove == SM_MeleeAttack )
			{
				Move = KFSM_MeleeAttack(SpecialMoves[SpecialMove]);
				if ( Move != None && Move.bCannotBeParried )
				{
					return FALSE;
				}
			}

			InstigatorPawn = KFPawn(InstigatedBy);
			if( InstigatorPawn != none )
			{
				InstigatorPerk = InstigatorPawn.GetPerk();
			}

			if( CanDoSpecialMove(SM_KnockDown) && InstigatorPerk != none && InstigatorPerk.ShouldKnockdown() )
			{
				Knockdown(, vect(1,1,20),,,, 1000 * Normal(Location - InstigatorPawn.Location ), Location);
			}
			else
			{
				DoSpecialMove(SM_Stumble,,, class'KFSM_Stumble'.static.PackParrySMFlags(self, Location - InstigatedBy.Location));
			}

			return TRUE;
		}
	}

	return FALSE;
}

/** Clean up function to terminate any effects on death */
simulated function TerminateEffectsOnDeath()
{
	// Destroy our weapon attachment
	if( WeaponAttachment != None && !WeaponAttachment.bPendingDelete )
	{
		WeaponAttachment.DetachFrom(self);
 		WeaponAttachment.Destroy();
	}

	// stop dialog and looping sounds
	SetWeaponAmbientSound(None);
	SetPawnAmbientSound(None);
	WeaponAmbientEchoHandler.StopAllEchoes(bPendingDelete); // force if called from Destroy
	DialogAkComponent.StopEvents();

	AfflictionHandler.Shutdown();
}

/*********************************************************************************************
 * @name	Gore / Hit Reactions
********************************************************************************************* */

/**
 * Helper function to get a hexagon around the character
 * @param	R	Orientation.  Either pawn rotation or camera.
 * @param	V	Incident vector
 */
native static function EPawnOctant CalcOctagonRegion(rotator R, vector V);
native static function EPawnOctant CalcQuadRegion(rotator R, vector V);

/* returns all hit zones where HitZoneInjuries is set */
native final iterator function DamagedHitZones( out int Idx );

/** Partial-ragdoll hit reactions */
native simulated function PlayPhysicsBodyImpact(vector HitLocation, vector Momentum, class<DamageType> DamageType, name HitBoneName);
native simulated function StartPhysicsBodyImpact(Name HitBoneName, bool bUseMotors, class<DamageType> DamageType);
native simulated function StopPhysicsBodyImpact();
native simulated function vector GetImpactPhysicsImpulse(class<DamageType> DamageType, vector HitLoc, vector Momentum, Name HitBoneName);

/** Enables partial ragdoll updates for physics effects while still alive */
native simulated function InitPartialKinematics();

/** (Network: All) Play any gore effects related to a zone/limb being damaged */
simulated function HitZoneInjured(optional int HitZoneIdx=INDEX_None);

/** Called before, and in addition to, NotifyTakeHit() to processes melee specifically (Network: Server) */
function NotifyMeleeTakeHit(Controller InstigatedBy, vector HitLocation);

/**
 * Very small momentum values get truncated during replication. So, we need to scale the
 * momentum vector during replication. This needs to match the function DecodeUnitVector()
 */
function vector EncodeUnitVector(vector V)
{
	return Normal(V) * 256.f;
}

simulated function vector DecodeUnitVector(vector V)
{
	return Normal(V / 256.f);
}

static function bool IsLargeZed()
{
	return false;
}

function PlayHit(float Damage, Controller InstigatedBy, vector HitLocation, class<DamageType> damageType, vector Momentum, TraceHitInfo HitInfo)
{
	local int HitZoneIdx;
	local bool bHasNewHitEffect;
	local class<KFDamageType> KFDT;

	if( Damage <= 0 || (Controller != none && Controller.bGodMode) )
	{
		return;
	}

	// Cached hit params
	HitZoneIdx = HitZones.Find('ZoneName', HitInfo.BoneName);
	KFDT = class<KFDamageType>(damageType);
	bHasNewHitEffect = true;

	// NVCHANGE_BEGIN - RLS - Debugging Effects
`if(`notdefined(ShippingPC))	
	if( WorldInfo.Game != none && KFGameInfo(WorldInfo.Game).bNVAlwaysHeadshot )
	{
		HitZoneIdx = HZI_HEAD;
	}
`endif
	// NVCHANGE_BEGIN - RLS - Debugging Effects

	// handle multiple hits occuring in the same tick
	if ( LastPainTime == WorldInfo.TimeSeconds )
	{
		if ( InstigatedBy != none && InstigatedBy.Pawn == HitFxInstigator && KFDT == HitFXInfo.DamageType )
		{
			// Add any additional hits to a separate repliated array
			if( HitFxAddedHitCount < MAX_ADDED_HITFX )
			{
				// Replicate any additional hits separately from the HitFxInfo struct and pass them as relative location to replicate easier
				HitFxAddedRelativeLocs[HitFxAddedHitCount] = HitLocation - HitFxInfo.HitLocation;
				HitFxAddedHitCount++;
			}
			bHasNewHitEffect = false;
		}
		else if ( !bTakingRadiusDamage && HitFxInfo.bRadialDamage )
		{
			// if we have to choose (rare), prioritize radius damage
			bHasNewHitEffect = false;
		}
	}

	// This is the first (and usually only) hit that occured this frame
	if ( bHasNewHitEffect )
	{
		HitFxInstigator = InstigatedBy != None ? InstigatedBy.Pawn : None;

		HitFxInfo.HitLocation = HitLocation;
		HitFxInfo.EncodedHitDirection = EncodeUnitVector(Normal(Momentum));
		HitFxInfo.HitBoneIndex = HitZoneIdx;
		HitFxInfo.bRadialDamage = bTakingRadiusDamage;
		HitFxInfo.DamageType = KFDT; 	// If we do not have a damagetype, replicate none
		LastTakeHitTimeout = WorldInfo.TimeSeconds + (0.5f);

		if ( bTakingRadiusDamage && !IsZero(LastRadiusHurtOrigin) )
		{
			HitFxRadialInfo.RadiusDamageScale = LastRadiusDamageScale;
			LastRadiusDamageScale = 255;

			HitFxRadialInfo.RadiusHurtOrigin = LastRadiusHurtOrigin;
			LastRadiusHurtOrigin = vect(0,0,0);

			// Nudge HitLoc a bit for edge-case where Victim and Explosive are stationary (NEQ fails)
			HitFxInfo.HitLocation.Z += FRand();
		}

		if ( bPlayedDeath && KFDT != none && KFDT.default.bCanObliterate )
		{
			HitFxInfo.bObliterated = KFDT.static.CheckObliterate(self, Damage);
		}

		HitFxAddedHitCount = 0;
	}

 	// Damage hit zones for replicated gore effects
	if ( HitZoneIdx != INDEX_None )
	{
		if( InstigatedBy != none )
		{
			TakeHitZoneDamage(Damage, HitFxInfo.DamageType, HitZoneIdx, InstigatedBy.Pawn.Location);
		}
		else
		{
			// after tear-off, on a simulated proxy, InstigatedBy is none
			TakeHitZoneDamage(Damage, HitFxInfo.DamageType, HitZoneIdx, vect(0,0,0));
		}
	}

	if ( AfflictionHandler != None )
	{
		AfflictionHandler.NotifyTakeHit(InstigatedBy, Normal(Momentum), HitFxInfo.DamageType);
	}

	bNeedsProcessHitFx = true;
	LastPainTime = WorldInfo.TimeSeconds;

	/** __TW_ANALYTICS_ */
	`RecordKFDamage(`StatID(DAMAGE_GENERIC), InstigatedBy, self, HitZoneIdx, Damage, DamageType)
	//Record weapon Damage for AAR
	`RecordWeaponDamage(InstigatedBy, KFDT, Damage, Self, HitZoneIdx);
}

/** Plays and replicates heal effects
  * parallels PlayHit
  */
function PlayHeal( class<KFDamageType> DamageType, optional TraceHitInfo HitInfo )
{
	HitFxInfo.HitLocation = Location;
	HitFxInfo.HitLocation.Z += FRand();
	HitFxInfo.DamageType = DamageType;
	HitFxInfo.HitBoneIndex = HitZones.Find('ZoneName', HitInfo.BoneName);

	LastTakeHitTimeout = WorldInfo.TimeSeconds + (0.5f);

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		PlayHealEffects(DamageType);
	}
}

/** Apply damage to a specific zone (useful for gore effects) */
function TakeHitZoneDamage(float Damage, class<DamageType> DamageType, int HitZoneIdx, vector InstigatorLocation)
{
	local float GoreDamage;
	local class<KFDamageType> DmgType;

	// Start with tha actual damage
	GoreDamage = Damage;

	// Scale the gore damage by the damage scale specified in the damage type.
	// This allows us to customize the gore effects independently of the actual damage
	// and also allow the damage type to attenuate the damage based on distance
    DmgType = class<KFDamageType>(DamageType);
    if( DmgType != none )
    {
    	if( !IsZero(InstigatorLocation) )
    	{
    		GoreDamage *= DmgType.static.GetGoreDamageScale(Location, InstigatorLocation);
    	}

	    if ( bPlayedDeath && TimeOfDeath == WorldInfo.TimeSeconds )
        {
			GoreDamage *= DmgType.static.GetOnDeathGoreScale();
		}
	}

	HitZones[HitZoneIdx].GoreHealth -= GoreDamage;
}

/** Called on the server when GoreHealth reaches zero */
function bool CanInjureHitZone(class<DamageType> DamageType, int HitZoneIdx)
{
	local class<KFDamageType> KFDmgType;
	local name HitZoneName;

	// Added TimeOfDeath check, so if we've just died always do head gore
	if( (!bPlayedDeath || WorldInfo.TimeSeconds == TimeOfDeath) && HitZoneIdx == HZI_HEAD )
	{
		return true;
	}

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

/** Plays clientside hit effects using the data in HitFxInfo */
simulated function PlayTakeHitEffects( vector HitDirection, vector HitLocation )
{
	local KFPawn InstigatedBy;

	// NVCHANGE_BEGIN - RLS - Debugging Effects
`if(`notdefined(ShippingPC))	
	if( WorldInfo.Game != none && KFGameInfo(WorldInfo.Game).bNVAlwaysHeadshot )
	{
		HitFxInfo.HitBoneIndex = HZI_HEAD;
	}
`endif	
	// NVCHANGE_BEGIN - RLS - Debugging Effects

	if ( HitFxInfo.DamageType != None )
	{
		HitFxInfo.DamageType.static.PlayImpactHitEffects(self, HitLocation, HitDirection, HitFxInfo.HitBoneIndex, HitFxInstigator);
	}

	// Finally, notify the damage instigator (if net relevant) to play it's own hit effects
	if ( HitFxInstigator != None )
	{
		InstigatedBy = KFPawn(HitFxInstigator);
		InstigatedBy.PlayDamageInstigatorHitEffects(self);
	}

	LastPainTime = WorldInfo.TimeSeconds;
}

/** Plays clientside heal effects using the data in HitFxInfo (which is set in PlayHeal)
  * parallels PlayTakeHitEffects
  */
simulated function PlayHealEffects(class<KFDamageType> DamageType)
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(Controller);
	if( KFPC != none )
	{
		KFPC.PlayScreenHitFX(DamageType, false);
	}

	if ( DamageType != None )
	{
		DamageType.static.PlayImpactHitEffects(self, Location, vect(0,0,1), HitFxInfo.HitBoneIndex, HitFxInstigator);
	}
}

/** Called clientside by PlayTakeHitEffects on the Instigating Pawn */
simulated function PlayDamageInstigatorHitEffects(KFPawn Victim)
{
	// Implemented in KFPawn_Human
}

/** Applies the contents of HitFxInfo.  Called from PlayTakeHitEffects() */
simulated function ApplyRagdollImpulse(class<KFDamageType> DamageType, vector HitLoc, vector HitDirection, Name HitBoneName, optional float GoreImpulseScale=1.f)
{
	local vector Impulse;
	local vector LinearVelocity;

	// Skip if no damage type
	if( DamageType == None || Mesh.PhysicsWeight == 0.f )
	{
		return;
	}

	// Skip if impulse is scaled down to 0
	if( GoreImpulseScale == 0.f )
	{
		return;
	}

	// Handle linear velocity
	if ( !bHasBrokenConstraints && DamageType.default.KDeathVel > 0 )
	{
		LinearVelocity += HitDirection * DamageType.default.KDeathVel;

		if ( !IsZero(LinearVelocity) )
		{
			`log("ApplyRagdollImpulse RBLinearVelocity:" @ VSize(LinearVelocity) @ "KDeathVel:" @ DamageType.default.KDeathVel, bLogPhysicsBodyImpact );
			Mesh.SetRBLinearVelocity(LinearVelocity, TRUE);
		}
	}

	// Add up PointImpulse from damage type
	if ( DamageType.default.KDamageImpulse > 0.f )
	{
		Impulse += HitDirection * DamageType.default.KDamageImpulse;
	}
	if ( DamageType.default.KDeathUpKick > 0 )
	{
		Impulse += Vect(0,0,1) * DamageType.default.KDeathUpKick;
	}

	// Add RadialImpulse (e.g. Explosives)
	if ( DamageType.default.RadialDamageImpulse > 0.f )
	{
		Impulse += HitDirection * DamageType.default.RadialDamageImpulse;
		if ( HitFxInfo.bRadialDamage && HitFxRadialInfo.RadiusDamageScale < 255 )
		{
			// Calculate falloff
			Impulse *= ByteToFloat(HitFxRadialInfo.RadiusDamageScale);
		}

		// AddRadialImpulse applies impulse to the root RB, however using the Torso gives better results.  If
		// we want this to truly function like AddRadialImpulse both HitBoneName and HitLoc should be zeroed
		//if( HitBoneName == '' )
		//{
		//	HitBoneName = TorsoBoneName;
		//}
		// HitLoc = vect(0,0,0);
	}

	// Reduce impulse if the gore system has dismembered this bone already
	if ( bHasBrokenConstraints && Mesh.IsBrokenConstraint( HitBoneName ) )
	{
		GoreImpulseScale *= class'KFGoreManager'.static.GetGibImpulseScale();
	}

	// Lastly, multiply scaling factors and apply impulse
	Impulse *= PhysRagdollImpulseScale * GoreImpulseScale;

	if ( !IsZero(Impulse) )
	{
		`log("ApplyRagdollImpulse Impulse:"@VSize(Impulse)@"Bone:"$HitBoneName@"KDamageImpulse:"$DamageType.default.KDamageImpulse
			@"RadialDamageImpulse:"$DamageType.default.RadialDamageImpulse, bLogPhysicsBodyImpact );
		Mesh.AddImpulse(Impulse, HitLoc, HitBoneName);
	}
}

/**
 * Given a skeletal bone, returns the next rigid body bone in the heirarchy.  This is useful
 * if we hit a bone that doesn't have an RB (like Spine2) and we want to apply an impulse
 */
simulated function name GetRBBoneFromBoneName(Name BoneName)
{
	local int BodyIndex;
	local byte RBBoneCheckCount;
	local name OriginalBoneName;

	OriginalBoneName = BoneName;
	// If our hit bone does not exist in the physics asset, use the hitbones parent
	BodyIndex = mesh.PhysicsAsset.FindBodyIndex(BoneName);
	while(BodyIndex == INDEX_NONE)
	{
		BoneName = mesh.GetParentBone(BoneName);
		if( BoneName == '' )
		{
			return ''; // no more parents (root bone)
		}

		BodyIndex =  mesh.PhysicsAsset.FindBodyIndex(BoneName);
		if( (++RBBoneCheckCount) >= MAX_GET_RBBONE_CHECKS)
		{
			`log(Self @ GetFuncName() @"Rigidbody bone " @OriginalBoneName @" not found after" @MAX_GET_RBBONE_CHECKS @"Checks");
			return ''; // exhausted tries
		}
	}

	return BoneName;
}

/** On Injury ragdoll the arm */
simulated function RagdollArm(bool bUseMotors)
{
	// Turn off hit reactions
	if( PhysicsImpactBlendTimeToGo > 0.f )
	{
		StopPhysicsBodyImpact();
		// For now disable physics hit reactions until they can be properly handled
		bCanPlayPhysicsHitReactions = false;
	}

	// Unfix bones that should be affected by physics, fix others (Kinematic)
	Mesh.PhysicsAssetInstance.SetNamedBodiesFixed(FALSE, ArmPhysicsBoneList, Mesh, FALSE, TRUE);

	if ( Mesh.PhysicsWeight < 1.f )
	{
		InitPartialKinematics();
	}
}

/** Called when a specific contraint is stretched further than it should be */
event OnRigidBodyLinearConstraintViolated(name StretchedBoneName)
{
	// @todo: use the gore system to gib the closest valid bone
	//mesh.HideBoneByName(StretchedBoneName, PBO_Term);
	`log("Linear constraint violated, hiding bone " @ StretchedBoneName);
}

/** Called when all attempts fail to make this corpse go to sleep. */
event OnRigidBodyRefusedToSleep()
{
	local KFGoreManager GM;

	GM = `GoreManager;
	if ( GM != None )
	{
		GM.RemoveAndDeleteCorpse(GM.CorpsePool.Find(self));
		//GM.CauseObliteration(self, Location, None);
	}
}

/** Starts at 0 when pawn dies */
native function SetRagdollWarningLevel(byte WarningLevel);

/**
 * Send this pawn to ragdoll and apply the given forces.  All params are optional, to enable
 * any combination of forces (whole-body, radial, or point)
 *
 * @param RBLinearVelocity			Linear velocity to apply to entire rigid body.
 * @param RBAngularVelocity			Angular velocity to apply to entire rigid body.
 * @param RadialOrigin				World-space origin of radial impulse.
 * @param RadialRadius				Radius of radial impulse.  If 0.0, no radial impulse will be applied.
 * @param RadialStrength			Strength of radial impulse.  If 0.0, no radial impulse will be applied.
 * @param PointImpulse				Point impulse to apply.  if 0,0,0, no point impulse will be applied.
 * @param PointImpulsePosition		Position in world space at which PointImpulse should be applied.
 * @param PointImpulseBoneName		Bone that receives point impulse.
 */
function Knockdown( optional vector RBLinearVelocity, optional vector RBAngularVelocity, optional vector RadialOrigin,
			optional float RadialRadius, optional float RadialStrength, optional vector PointImpulse,
			optional vector PointImpulsePosition, optional byte HitZoneIdx=255 )
{
	if (Role < ROLE_Authority)
	{
`if(`notdefined(ShippingPC))
		`warn("Only allowed on server");
		ScriptTrace();
`endif
		return;
	}

	if (IsZero(RBLinearVelocity) && IsZero(RBAngularVelocity))
	{
		`Warn("No linear or angular velocity - one or the other must be set for replication to work");
		ScriptTrace();
		return;
	}

	// only one knockdown allowed at a time and not at all if dead or DBNO
	// don't knock them out if driving vehicle
	if (Physics == PHYS_RigidBody || bPlayedDeath || DrivenVehicle != None)
	{
		return;
	}

	if( CanDoSpecialMove(SM_Knockdown) )
	{
		StopFiring();

		// set the knockdown information for use in ApplyKnockdownImpulse()
		KnockdownImpulse.LinearVelocity = RBLinearVelocity;
		KnockdownImpulse.AngularVelocity = RBAngularVelocity;
		if ( RadialStrength > 0 )
		{
			KnockdownImpulse.ImpulsePosition = RadialOrigin;
			KnockdownImpulse.ImpulseStrength.X = RadialRadius;
			KnockdownImpulse.ImpulseStrength.Y = RadialStrength;
			KnockdownImpulse.ImpulseStrength.Z = 0;
			KnockdownImpulse.bIsRadialImpulse = true;
		}
		else
		{
			KnockdownImpulse.ImpulsePosition = PointImpulsePosition;
			KnockdownImpulse.ImpulseStrength = PointImpulse;
			//KnockdownImpulse.PointImpulseBoneName = PointImpulseBoneName;
			KnockdownImpulse.PointImpulseHitZone = HitZoneIdx;
			KnockdownImpulse.bIsRadialImpulse = false;
		}

		// transition to the KnockedDown state
		DoSpecialMove(SM_Knockdown, TRUE);
	}
}

/** Gets skin effects associated with hit zone (allows pawns to override) */
simulated function KFSkinTypeEffects GetHitZoneSkinTypeEffects( int HitZoneIdx )
{
	local int HitZoneSkinID;

	if( HitZoneIdx != 255 )
	{
		HitZoneSkinID = HitZones[HitZoneIdx].SkinID;
	}

	if ( HitZoneSkinID >= CharacterArch.ImpactSkins.Length )
	{
		return none;
	}

	return CharacterArch.ImpactSkins[HitZoneSkinID];
}

/*********************************************************************************************
 * @name	Damage over Time
********************************************************************************************* */

/** Add (or udpate existing) damage over time effect */
function ApplyDamageOverTime(int Damage, Controller InstigatedBy, class<KFDamageType> KFDT)
{
	local DamageOverTimeInfo DoTInfo;
	local int DoTIndex;
	local int NewDoTDamage, NewTotalDamage, RemainingTotalDamage;
	local float NewDoTDuration;

	// Check to see if we already have this type of damage in the array
	DoTIndex = DamageOverTimeArray.Find('DoT_Type', KFDT.default.DoT_Type);

    NewDoTDamage = Round( Damage * KFDT.default.DoT_DamageScale );
    NewDoTDuration = KFDT.default.DoT_Duration * GetPerkDoTScaler( InstigatedBy, KFDT );

	// If we aren't already doing this type of damage over time, add it to the DamageOverTimeArray to be processed
    if( DoTIndex < 0 )
	{
        // Only add more damage if its not zero
        if( NewDoTDamage > 0 )
        {
            DoTInfo.Damage = NewDoTDamage;
            DoTInfo.DamageType = KFDT;
            DoTInfo.DoT_Type = KFDT.default.DoT_Type;
            DoTInfo.Duration = NewDoTDuration;
            DoTInfo.Interval = KFDT.default.DoT_Interval;
            DoTInfo.InstigatedBy = InstigatedBy;
			DoTInfo.TimeUntilNextDamage = KFDT.default.DoT_Interval;

            DamageOverTimeArray[DamageOverTimeArray.Length] = DoTInfo;
        }
    }
    else
    {
    	RemainingTotalDamage = (DamageOverTimeArray[DoTIndex].Duration / DamageOverTimeArray[DoTIndex].Interval) * DamageOverTimeArray[DoTIndex].Damage;
    	NewTotalDamage = (NewDoTDuration / KFDT.default.DoT_Interval) * NewDoTDamage;

    	if( NewTotalDamage > RemainingTotalDamage )
    	{
    		DamageOverTimeArray[DoTIndex].Damage = NewDoTDamage;
    		DamageOverTimeArray[DoTIndex].Duration = NewDoTDuration;
			DamageOverTimeArray[DoTIndex].DamageType = KFDT;
    	}
    }
}

function float GetPerkDoTScaler( optional Controller InstigatedBy, optional class<KFDamageType> KFDT ){ return 1.f; }

/** Tick the damage over time system */
function TickDamageOverTime(float DeltaTime)
{
    local int i;

    // Nothing to do if there is no damage over time to apply
    if( DamageOverTimeArray.Length < 1 )
    {
        return;
    }

    for( i = DamageOverTimeArray.Length - 1; i >= 0; i-- )
    {
        DamageOverTimeArray[i].Duration -= DeltaTime;
		DamageOverTimeArray[i].TimeUntilNextDamage -= DeltaTime;

        // Do damage at each DoT interval
        if( DamageOverTimeArray[i].TimeUntilNextDamage <= 0.f )
        {
            DamageOverTimeArray[i].TimeUntilNextDamage = DamageOverTimeArray[i].Interval;
            TakeDamage(DamageOverTimeArray[i].Damage, DamageOverTimeArray[i].InstigatedBy, Location, vect(0,0,0), DamageOverTimeArray[i].DamageType);
        }

        // Remove damage over time elements from the array when they have timed out
        if( DamageOverTimeArray[i].Duration <= 0 || DamageOverTimeArray[i].Duration < DamageOverTimeArray[i].Interval )
        {
            DamageOverTimeArray.Remove(i,1);
            continue;
        }
    }
}

/*********************************************************************************************
 * @name	Animation
********************************************************************************************* */

/** Used by KFPawnAnimInfo and bosses/large Zeds that have different phases of combat */
simulated function int GetCurrentBattlePhase()
{
	return 0;
}

function AnimInterruptNotifyTimer();

/** Play a body stance animation on slots defined in the Pawn's AnimTree */
native function float PlayBodyAnim(name AnimName, EAnimSlotStance BodyStance,
	optional	float		Rate=1.f,
	optional	float		BlendInTime=0.2f,
	optional	float		BlendOutTime=0.2f,
	optional	bool		bLooping,
	optional	bool		bOverride=TRUE);

/** Stop playing body stance animation on slots defined in the Pawn's AnimTree */
native function StopBodyAnim(EAnimSlotStance BodyStance, optional float BlendOutTime);

/** Set new MeshTranslationOffset (world offset) **/
native simulated function bool UpdateMeshTranslationOffset(vector NewOffset, optional bool bForce);

/* Sets our head tracking target and turns on head tracking */
simulated native function SetHeadTrackTarget(Actor NewHeadTrackTarget, optional vector TargetOffset, optional float TargetTrackPct = 1.f, optional bool bUseSpine=false, optional float BlendIn=-1.f);
/* Clears our head tracking target and turns off head tracking */
simulated native function ClearHeadTrackTarget(Actor HeadTrackTargetToClear, optional float BlendOut=-1.f);

/** Save off commonly used nodes so the tree doesn't need to be iterated over often */
simulated native event CacheAnimNodes();

/** script version of CacheAnimNodes */
simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	BodyStanceNodes[EAS_FullBody] = AnimNodeSlot(SkelComp.FindAnimNode('Custom_FullBody'));
	BodyStanceNodes[EAS_UpperBody] = AnimNodeSlot(SkelComp.FindAnimNode('Custom_Upper'));
	BodyStanceNodes[EAS_LowerBody] = AnimNodeSlot(SkelComp.FindAnimNode('Custom_Lower'));
	if( BodyStanceNodes[EAS_LowerBody] != none )
	{
		// we don't want anims played on lower body to duplicate notifies triggered by anims on the upper body
		BodyStanceNodes[EAS_LowerBody].bNoNotifies = true;
	}
	// Optional additive node.  The fullbody node can also be used, but this allows additives during another fullbody.
	BodyStanceNodes[EAS_Additive] = AnimNodeSlot(SkelComp.FindAnimNode('Custom_Additive'));
	BodyStanceNodes[EAS_Face] = AnimNodeSlot(SkelComp.FindAnimNode('Custom_Face'));

	IKFootLeft = KFSkelControl_FootPlacement(SkelComp.FindSkelControl('FootIK_L'));
	IKFootRight = KFSkelControl_FootPlacement(SkelComp.FindSkelControl('FootIK_R'));

	// Always tick gameplay critical BodyStance nodes (anim notifies, etc...)
	if ( WorldInfo.NetMode == NM_DedicatedServer )
	{
	    BodyStanceNodes[EAS_FullBody].bTickDuringPausedAnims = true;
	    BodyStanceNodes[EAS_UpperBody].bTickDuringPausedAnims = true;
	}
}

/** Event called when an AnimNodeSequence reaches the end and stops. */
simulated event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
	if( SpecialMove != SM_None )
	{
		//`Log"SpecialMove ==" @ SpecialMove @ "calling AnimEndNotify()");
		SpecialMoves[SpecialMove].AnimEndNotify(SeqNode, PlayedTime, ExcessTime);
	}
}

/** Stops all animations on character */
simulated function StopAllAnimations()
{
	Mesh.bPauseAnims = true;
	if (Physics == PHYS_RigidBody)
	{
		Mesh.PhysicsWeight = 1.0;
		Mesh.bUpdateKinematicBonesFromAnimation = false;
	}
}

/**
 * Set a new profile on all the AimOffset nodes.
 */
simulated final function SetAimOffsetNodesProfile(Name NewProfileName)
{
	local int i;

	for(i=0; i<AimOffsetNodes.Length; i++)
	{
		AimOffsetNodes[i].SetActiveProfileByName(NewProfileName);
	}
}

simulated function name GetSpecialMoveTag()
{
	local byte AtkIndex;

	if( IsDoingSpecialMove() && SpecialMoveFlags != 255 && PawnAnimInfo != none )
	{
		AtkIndex = SpecialMoveFlags & 15;
		return PawnAnimInfo.Attacks[AtkIndex].Tag;
	}

	return '';
}

/**
 * Configure mesh settings based on current FleX level.
 * @param bResetDefaults If set, when flex is off reset to mesh defaults
 */
simulated function UpdateMeshForFleXCollision()
{
	local GameEngine Engine;

	if ( bPlayedDeath || Physics == PHYS_RigidBody )
		return;

	Engine = GameEngine(Class'Engine'.static.GetEngine());

	// force update kinematic bones for flex collision, but still disable RBChannel iff
	// default.bUpdateKinematicBonesFromAnimation==FALSE so this pawn doesn't push around corpses, etc...
	if ( Mesh.RBCollideWithChannels.FlexAsset && class'Engine'.static.GetPhysXLevel() >= 2 && Engine.GetSystemSettingBool("FlexRigidBodiesCollisionAtHighLevel") )
	{
		// @note: also requires that scene query flag is set (see InstancePhysXGeom)
		Mesh.bUpdateKinematicBonesFromAnimation = true;
		Mesh.MinDistFactorForKinematicUpdate = 0.0;		
	}
}

/** Called when flex collision should be toggled regardless of PhysXLevel */
simulated function SetEnableFleXCollision(bool bEnabled)
{
	if ( bPlayedDeath )
		return;

	if ( Mesh.RBCollideWithChannels.FlexAsset != bEnabled )
	{
		Mesh.SetRBCollidesWithChannel(RBCC_FlexAsset, bEnabled);

		// Settings may conflict with RB physics, so be careful of when this called!
		if ( Physics != PHYS_RigidBody )
		{
			if ( bEnabled )
			{
				UpdateMeshForFleXCollision();
			}
			else
			{
				// undo mesh changes made by UpdateMeshForFleXCollision()
				Mesh.bUpdateKinematicBonesFromAnimation = default.Mesh.bUpdateKinematicBonesFromAnimation;
				Mesh.MinDistFactorForKinematicUpdate = default.Mesh.MinDistFactorForKinematicUpdate;
			}
		}
	}
}

/*********************************************************************************************
 * @name	Audio
********************************************************************************************* */

/** returns the rotation to use when playing AKEvent sounds that
 * require a rotation
 */
native simulated function rotator GetAKRotation();

/** Same as PlaySound, but without playing it locally */
native noexport simulated function ReplicateSound(AkBaseSoundObject InSoundCue, optional bool bNotReplicated, optional bool bNoRepToOwner, optional bool bStopWhenOwnerDestroyed, optional vector SoundLocation, optional bool bNoRepToRelevant, optional rotator SoundRotation);

event Landed(vector HitNormal, actor FloorActor)
{
	Super.Landed(HitNormal, FloorActor);

	if ( Velocity.Z < -200 )
	{
		OldZ = Location.Z;
		bJustLanded = bUpdateEyeHeight && (Controller != None) && Controller.LandingShake();
	}

	if (Velocity.Z < -MaxFallSpeed)
	{
		SoundGroupArch.PlayFallingDamageLandSound(self);
	}
	else if( Velocity.Z < MaxFallSpeed * -0.35 )
	{
		SoundGroupArch.PlayLandSound(self);
	}

	SetBaseEyeheight();
}

/** Triggered by AnimNotify_Footstep to select and play a footstep sound */
simulated event PlayFootStepSound(int FootDown)
{
	local EMaterialTypes MaterialType;
	local AkBaseSoundObject Sound;
	local vector FootSoundLoc;

	if (/* Validate footsetps */
		Physics != PHYS_Walking || Base == None ||
		/* Check if foostep sounds are enabled. Always allow footstep sounds from local player */
		(!bAllowFootstepSounds && Controller != GetALocalPlayerController()) ||
		/* Skip if we're encountering low frame rates */
		WorldInfo.bDropDetail ||
		/* Is within audible range */
		!ActorEffectIsRelevant(self, false, 1500, 1500) )
	{
		return;
	}

	// Play the foot sound locational to where the foot actually is
	switch( FootDown )
	{
	case 0:
	   FootSoundLoc = Mesh.GetBoneLocation(LeftFootBoneName, 0);
	   break;

	case 1:
	   FootSoundLoc = Mesh.GetBoneLocation(RightFootBoneName, 0);
	   break;

	case 2:
	   FootSoundLoc = Mesh.GetBoneLocation(LeftHandBoneName, 0);
	   break;

	case 3:
	   FootSoundLoc = Mesh.GetBoneLocation(RightHandBoneName, 0);
	   break;
	};

	MaterialType = GetMaterialBelowFeet( FootSoundLoc );
	if( bIsSprinting )
	{
	    Sound = SoundGroupArch.GetSprintingFootstepSound(FootDown, MaterialType);
	}
	else
	{
	    Sound = SoundGroupArch.GetFootstepSound(FootDown, MaterialType);
	}

	if ( AkEvent(Sound) != none )
	{
	    FootstepAkComponent.PlayEvent( AkEvent(Sound), true );
	}
}

/**
 * Trace down and find the material type we are walking on
 */
simulated function EMaterialTypes GetMaterialBelowFeet( optional const vector FootSoundLoc )
{
	local vector HitLocation, HitNormal;
	local TraceHitInfo HitInfo;
	local KFPhysicalMaterialProperty PhysicalProperty;
	local float TraceDist;
	local vector TraceLoc;

	TraceDist = 1.5 * GetCollisionHeight();
	TraceLoc = IsZero( FootSoundLoc ) ? Location : FootSoundLoc;
	Trace(HitLocation, HitNormal, TraceLoc - TraceDist*vect(0,0,1), TraceLoc, false,, HitInfo);

	if ( HitInfo.PhysMaterial != None )
	{
		PhysicalProperty = KFPhysicalMaterialProperty(HitInfo.PhysMaterial.GetPhysicalMaterialProperty(class'KFPhysicalMaterialProperty'));
		if (PhysicalProperty != None)
		{
			return PhysicalProperty.MaterialType;
		}
	}
	return EMT_None;
}

/** starts playing the given sound via the AmbientAkComponent and sets AmbientSound for replicating to clients
 *  @param NewAmbientSound the new sound to play, or None to stop any ambient that was playing
 */
simulated function SetPawnAmbientSound(AkEvent NewAmbientSound)
{
	if ( NewAmbientSound == None )
    {
    	AmbientAkComponent.StopEvents();
    	AmbientSound = None;
    }
    else
	{
	    AmbientSound = NewAmbientSound;
        AmbientAkComponent.StopEvents();

	    if (NewAmbientSound != None)
		{
			// play sound spatialized if this is not a player or this player is not locally controlled
		    AmbientAkComponent.PlayEvent( AmbientSound, !IsPlayerPawn() || !IsLocallyControlled() );
		}
	}
}

/** starts playing the given sound via the WeaponAmbientSound AudioComponent and sets WeaponAmbientSoundCue for replicating to clients
 *  @param NewAmbientSound the new sound to play, or None to stop any ambient that was playing
 */
simulated function SetWeaponAmbientSound(AkEvent NewAmbientSound, optional AkEvent FirstPersonAmbientSound)
{
	if ( NewAmbientSound == None )
    {
    	WeaponAkComponent.StopEvents();

    	WeaponAmbientSound = None;
    	WeaponAmbientEchoHandler.HandleEchoes(none);
    }
    else if( !bPlayedDeath && !bPendingDelete && !bDeleteMe )
	{
	    WeaponAmbientSound = NewAmbientSound;
        WeaponAkComponent.StopEvents();

	    // Replicate 3rd person, but play 1st person
		if ( FirstPersonAmbientSound != None && IsFirstPerson() )
		{
			// don't check occlusion for first person sound
			WeaponAkComponent.OcclusionUpdateInterval = 0.f;

		    WeaponAkComponent.PlayEvent( FirstPersonAmbientSound );
		    if( FirstPersonAmbientSound.bUseAdvancedSoundFunctionality )
		    {
		   		WeaponAmbientEchoHandler.HandleEchoes( FirstPersonAmbientSound );
		   	}
		}
		else if (NewAmbientSound != None)
		{
			// check occlusion for third person sound
			WeaponAkComponent.OcclusionUpdateInterval = 0.2f;

		    WeaponAkComponent.PlayEvent( NewAmbientSound, false );
		    if( NewAmbientSound.bUseAdvancedSoundFunctionality )
		    {
		    	WeaponAmbientEchoHandler.HandleEchoes( NewAmbientSound );
		    }
		}
	}
}

/**
 * Set an RTPC value on the WeaponAKComponent
 */
function SetWeaponComponentRTPCValue( String InRTPC, float targetvalue )
{
    WeaponAkComponent.SetRTPCValue( InRTPC, targetvalue);
}

simulated event Tick( float DeltaTime )
{
    if( Role == ROLE_Authority )
    {
    	if( DamageOverTimeArray.Length > 0 )
   		{
        	TickDamageOverTime(DeltaTime);
    	}
    }

	if( WeaponAmbientEchoHandler.EchoSets.Length > 0 )
	{
    	WeaponAmbientEchoHandler.TickEchoes();
    }

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( bNeedsProcessHitFx )
		{
			ProcessHitFx();
		}

		if( MaterialEffectTimeRemaining > 0 )
		{
			UpdateMaterialEffect(DeltaTime);
		}
	}

	// always clear for server (client already clears in ProcessHitFx)
	bNeedsProcessHitFx = false;
}

/** Update any material effects */
function UpdateMaterialEffect(float DeltaTime)
{
	local float Intensity;

	if( MaterialEffectTimeRemaining > 0.f )
	{
		if( MaterialEffectTimeRemaining > DeltaTime )
		{
			MaterialEffectTimeRemaining -= DeltaTime;
			Intensity = 1.f - FClamp(MaterialEffectTimeRemaining/MaterialEffectDuration, 0.f, 1.f);
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

		if( HeadMIC != none )
		{
   			HeadMIC.SetScalarParameterValue(MaterialEffectParamName, Intensity);
   		}
	}
}

/** Process all hit effects that have occured this frame */
simulated function ProcessHitFx()
{
	local vector HitDirection;

	// Skip FX if HideMeshOnDeath was called
	if ( bPlayedDeath && Mesh.HiddenGame )
	{
		bNeedsProcessHitFx = false;
		return;
	}

	if( HitFxInfo.DamageType != none && HitFxInfo.DamageType.default.bNoPain )
	{
		PlayHealEffects(HitFxInfo.DamageType);
	}
	else
	{
		HitDirection = DecodeUnitVector( HitFxInfo.EncodedHitDirection );

		PlayTakeHitEffects( HitDirection, HitFxInfo.HitLocation );

		// If the pawns taken multiple hits from the same DamageType, process additional hit effects
		if( HitFxAddedHitCount > 0 )
		{
			ProcessAdditionalHitFx( HitDirection );
		}
	}

	bNeedsProcessHitFx = false;
}

// If our weapon supports multiple hits, process the additional hit effects
simulated function ProcessAdditionalHitFx( vector HitDirection )
{
	local byte i, MaxAddedHits;
	local int InjuredHitZone;
	local vector HitStartLoc, NewHitLocation, NewHitDir;

	MaxAddedHits = min( HitFxAddedHitCount, MAX_ADDED_HITFX );
	for( i = 0; i < MaxAddedHits; i++ )
	{
		// Put the relative hit locations in world space again
		NewHitLocation = HitFxAddedRelativeLocs[i] + HitFxInfo.HitLocation;

		// Calculate the direction of additional hits relative to the HitFxInstigator
		if( HitFxInstigator != none )
		{
			HitStartLoc = HitFxInfo.HitLocation - (HitDirection * VSize(HitFxInfo.HitLocation - HitFxInstigator.Location));
			NewHitDir = Normal(NewHitLocation - HitStartLoc);
		}
		else
		{
			NewHitDir = HitDirection;
		}

		PlayTakeHitEffects( NewHitDir, NewHitLocation );
	}

	if( bPlayedDeath )
	{
		foreach DamagedHitZones( InjuredHitZone )
		{
			if( !HitZones[InjuredHitZone].bPlayedInjury )
			{
				HitFxInfo.HitBoneIndex = InjuredHitZone;
				PlayTakeHitEffects( HitDirection, HitFxInfo.HitLocation );
			}
		}
	}
}

/** SERVER ONLY - Update any AI or animation behaviors based on state */
function OnStackingAfflictionChanged(byte Id);

/************************************************************************************
 * @name	Dialog
 ***********************************************************************************/

/**
 * param DialogEvent: event to be played; if none, will stop dialog
 */
native function PlayDialog( optional AkEvent DialogEvent, optional byte bCanBeMinimized );

function StopDialog()
{
	PlayDialog();
}

function bool IsSpeaking()
{
	return CurrDialogEventID >= 0;
}

function bool IsPlayingDialogEvent( int EventID )
{
	return IsSpeaking() && CurrDialogEventID == EventID;
}

simulated function PlayDialogEvent( AkEvent DialogEvent )
{
	if( VoiceGroupArch == none )
	{
		return;
	}

	DialogAkComponent.StopEvents();

	if( DialogEvent != none )
	{
		DialogAkComponent.PlayEvent( DialogEvent, Controller != GetALocalPlayerController() || !PlayerController(Controller).UsingFirstPersonCamera() );
	}
}

function HandleDialogResponse();

function bool HasValidVoiceEventData()
{
	return VoiceGroupArch != none && VoiceGroupArch.default.EventDataClass != none;
}

function class< KFPawnVoiceGroupEventData > GetVoiceGroupEventDataClass()
{
	if( HasValidVoiceEventData() )
	{
		return VoiceGroupArch.default.EventDataClass;
	}

	return none;
}

/** Used as SetTimer callback. Set by KFDialogManager::PlayDialogEvent. */
function EndOfDialogTimer()
{
	HandleDialogResponse();

	CurrDialogEventID = -1;
}

/************************************************************************************
 * @name	Special Moves
 ***********************************************************************************/

/* Is this KFPawn doing a special move? */
simulated final native function bool IsDoingSpecialMove( optional ESpecialMove AMove ) const;

/**
 * Start a special move.
 * @Note this doesn't handle replication to owning client if called from server.
 * See ServerDoSpecialMove() and LocalDoSpecialMove() for alternatives.
 * @network: local player and server
 */
simulated event DoSpecialMove(ESpecialMove NewMove, optional bool bForceMove, optional Pawn InInteractionPawn, optional INT InSpecialMoveFlags, optional bool bSkipReplication)
{
	// Debug warning since we now control initiation only on the server
	if ( !bForceMove && Role < ROLE_Authority )
	{
		`Warn(Self @ GetFuncName() @ "initiated from client!" @ NewMove);
	}

	if ( SpecialMoveHandler != None )
	{
		SpecialMoveHandler.DoSpecialMove(NewMove, bForceMove, InInteractionPawn, InSpecialMoveFlags, bSkipReplication);
	}
}

/**
 * Request to abort/stop current SpecialMove
 */
simulated final event EndSpecialMove(optional ESpecialMove SpecialMoveToEnd, optional bool bForceNetSync)
{
	if ( SpecialMoveHandler != None )
	{
		SpecialMoveHandler.EndSpecialMove(SpecialMoveToEnd, bForceNetSync);
	}
}

simulated event bool CanDoSpecialMove(ESpecialMove AMove, optional bool bForceCheck)
{
	return SpecialMoveHandler.CanDoSpecialMove( AMove, bForceCheck );
}

simulated event bool IsMovementDisabledDuringSpecialMove()
{
	if( IsDoingSpecialMove() )
	{
		return SpecialMoves[SpecialMove].bDisableMovement;
	}
	return false;
}

/** Can this pawn be grabbed by Zed performing grab special move (clots & Hans's energy drain) */
function bool CanBeGrabbed(KFPawn GrabbingPawn, optional bool bIgnoreFalling)
{
	if( Health <= 0 || (Physics == PHYS_Falling && !bIgnoreFalling) || IsSameTeam(GrabbingPawn) || IsDoingSpecialMove(SM_GrappleVictim) )
	{
		return false;
	}

	// Don't allow weak zed grabs if we're waiting for a cooldown
    if( GrabbingPawn.bWeakZedGrab && WeakZedGrabCooldown > 0
        && `TimeSince(WeakZedGrabCooldown) < 0 )
    {
        //`log("Can't be grabbed because cooldown "$`TimeSince(WeakZedGrabCooldown));
        return false;
    }

	return true;
}

/** Set the cooldown time for weak zed grab */
function SetWeakGrabCoolDown(float CooldownTime)
{
    WeakZedGrabCooldown = WorldInfo.TimeSeconds + CooldownTime;
}

/** Puts a pawn into the panic wander state */
function CausePanicWander();

/** Used to detect if we should currently be doing a wander special move */
simulated function bool ShouldBeWandering();

/** Used to detect if we should currently be doing a wander special move */
simulated function bool IsHeadless();

/*********************************************************************************************
 * @name	AI
 ********************************************************************************************* */

/** Return true if AI can target this pawn */
function bool CanAITargetThisPawn(Controller TargetingController)
{
    if( bAIZedsIgnoreMe )
    {
        return false;
    }

    if( ExclusiveTargetingController != none && ExclusiveTargetingController != TargetingController )
    {
        //`log(TargetingController$" FALSE trying to target "$self$" ExclusiveTargetingController = "$ExclusiveTargetingController);
        return false;
    }

    if( AIIgnoreEndTime > 0 && `TimeSince(AIIgnoreEndTime) < 0 )
    {
        //`log(TargetingController$" FALSE trying to target "$self$" AIIgnoreEndTime = "$AIIgnoreEndTime$" TimeSeconds: "$WorldInfo.TimeSeconds);
        return false;
    }

    //`log(TargetingController$" trying to target "$self$" ExclusiveTargetingController = "$ExclusiveTargetingController$" AIIgnoreEndTime = "$AIIgnoreEndTime$" TimeSeconds: "$WorldInfo.TimeSeconds);

    return true;
}

/*********************************************************************************************
 * @name	Debug
********************************************************************************************* */

/** Just like Pawn.MessagePlayer, but this version lets you override the message type, message
 *  lifetime, and checks !ShippingPC instead of Final_Release*/
final event KFMessagePlayer( coerce String Msg, optional name Type, optional float MsgLifeTime )
{
`if(`notdefined(ShippingPC))
	local PlayerController PC;

	foreach LocalPlayerControllers(class'PlayerController', PC)
	{
		PC.ClientMessage( Msg, Type, MsgLifeTime );
	}
`endif
}

/**
 * list important Pawn variables on canvas.	 HUD will call DisplayDebug() on the current ViewTarget when
 * the ShowDebug exec is used
 *
 * @param	HUD		- HUD with canvas to draw on
 * @input	out_YL		- Height of the current font
 * @input	out_YPos	- Y position on Canvas. out_YPos += out_YL, gives position to draw text for next debug line.
 */
simulated function DisplayDebug(HUD HUD, out float out_YL, out float out_YPos)
{
	local Canvas	Canvas;
	//local int 		i;
	//local KFPerk	CurrentPerk;

	Super.DisplayDebug(HUD, out_YL, out_YPos);

	Canvas = HUD.Canvas;

	if (HUD.ShouldDisplayDebug('camera'))
	{
        HUD.DrawDebugSphere( Instigator.GetPawnViewLocation(), 10, 10, 0, 255, 0 );
	}

	if (HUD.ShouldDisplayDebug('movement'))
	{
		Canvas.SetDrawColor(0,255,255);

        Canvas.SetPos(4,out_YPos);
		Canvas.DrawText("---------- KFPawn: movement ----------");
		out_YPos += out_YL;

		Canvas.DrawText("Velocity:" @ Velocity @ "Accel:" @ Acceleration, FALSE);
		out_YPos += out_YL;
		Canvas.SetPos(4,out_YPos);

		Canvas.DrawText("Physics:" @ Physics, FALSE);
		out_YPos += out_YL;
		Canvas.SetPos(4,out_YPos);

		Canvas.DrawText("Walking: "$bIsWalking$" Sprinting: "$bIsSprinting$" Crouched: "$bIsCrouched);
		out_YPos += out_YL;
		Canvas.SetPos(4,out_YPos);

		Canvas.DrawText("GroundSpeed:" @ GroundSpeed, FALSE);
		out_YPos += out_YL;
		Canvas.SetPos(4,out_YPos);

		Canvas.DrawText("Speed:" @ VSize(Velocity) @ "Speed2D:" @ VSize2D(Velocity), FALSE);
		out_YPos += out_YL;
		Canvas.SetPos(4,out_YPos);

		Canvas.DrawText("Pawn state:" @ GetStateName(), FALSE);
		out_YPos += out_YL;
		Canvas.SetPos(4,out_YPos);

		Canvas.DrawText("Controller state:" @ Controller.GetStateName(), FALSE);
		out_YPos += out_YL;
		Canvas.SetPos(4,out_YPos);
	}

	if( HUD.ShouldDisplayDebug('physics') )
	{
		Canvas.DrawText("Velocity:" @ VSize(Velocity)/100 @ "Meters Per Second");
		out_YPos += out_YL;
		Canvas.SetPos(4,out_YPos);
	}

	if (HUD.ShouldDisplayDebug('rendering'))
	{
		Canvas.SetDrawColor(0,255,0);

		Canvas.SetPos(4,out_YPos);
		Canvas.DrawText("---------- KFPawn: rendering ----------");
		out_YPos += out_YL;

		Canvas.DrawText("Lighting Channels:");
		out_YPos += out_YL;
		Canvas.SetPos(4,out_YPos);

		Canvas.DrawText("-----------------------------");
		out_YPos += out_YL;
		Canvas.SetPos(4,out_YPos);

		Canvas.DrawText("Mesh - " $ mesh.LightingChannels.Indoor ?
		(mesh.LightingChannels.Outdoor ? "Both Indoor and Outdoor" : "Indoor") : "Outdoor");
		out_YPos += out_YL;
		Canvas.SetPos(4,out_YPos);

		Canvas.DrawText("ThirdPersonHeadMeshComponent - " $ ThirdPersonHeadMeshComponent.LightingChannels.Indoor ?
		(ThirdPersonHeadMeshComponent.LightingChannels.Outdoor ? "Both Indoor and Outdoor" : "Indoor") : "Outdoor");
		out_YPos += out_YL;
		Canvas.SetPos(4,out_YPos);

		Canvas.DrawText("ArmsMesh0 - " $ ArmsMesh.LightingChannels.Indoor ?
		(ArmsMesh.LightingChannels.Outdoor ? "Both Indoor and Outdoor" : "Indoor") : "Outdoor");
		out_YPos += out_YL;
		Canvas.SetPos(4,out_YPos);

		if( WeaponAttachment != none )
		{
			Canvas.DrawText("WeaponAttachment - " $ WeaponAttachment.HasIndoorLighting() ?
			(WeaponAttachment.HasOutdoorLighting() ? "Both Indoor and Outdoor" : "Indoor") : "Outdoor");
			out_YPos += out_YL;
			Canvas.SetPos(4,out_YPos);
		}

		if( Weapon != none )
		{
			Canvas.DrawText("Weapon - " $ Weapon.Mesh.LightingChannels.Indoor ?
			(Weapon.Mesh.LightingChannels.Outdoor ? "Both Indoor and Outdoor" : "Indoor") : "Outdoor");
			out_YPos += out_YL;
			Canvas.SetPos(4,out_YPos);
		}
	}

	if( HUD.ShouldDisplayDebug('animation') )
	{
		if( Mesh != None && Mesh.Animations != None )
		{
			Canvas.DrawText("Left Hand IK:"@Mesh.FindSkelControl('HandIK_L').GetControlMetadataWeight());
			out_YPos += out_YL;
			Canvas.SetPos(4,out_YPos);
		}
	}

	if (HUD.ShouldDisplayDebug('perk'))
	{
//		CurrentPerk = GetPerk();
//
//		if ( CurrentPerk != none )
//		{
//			Canvas.SetDrawColor(0,255,127);
//			out_YPos += 30;
//			Canvas.SetPos(4,out_YPos);
//			Canvas.DrawText("Active perk:" @ CurrentPerk);
//  			out_YPos += out_YL;
//			Canvas.SetPos(4,out_YPos);
//			Canvas.DrawText("Current skilltree:");
//			out_YPos += out_YL;
//			Canvas.SetPos(4,out_YPos);
//			Canvas.DrawText("-----------------------------");
//			out_YPos += out_YL;
//			Canvas.SetPos(4,out_YPos);
//			Canvas.DrawText("PASSIVE NAME");
//			Canvas.SetPos(154,out_YPos);
//			Canvas.DrawText("PASSIVE POINTS (0-10)");
//			Canvas.SetPos(304,out_YPos);
//			Canvas.DrawText("PASSIVE INCREMENT(0-100%)");
//			Canvas.SetPos(474,out_YPos);
//			Canvas.DrawText("PASSIVE TOTAL");
//			out_YPos += out_YL;
//			for ( i = 0; i < 4; i++ )
//			{
//				Canvas.SetPos(4,out_YPos);
//				Canvas.DrawText(CurrentPerk.SkillNames[i]);
//				Canvas.SetPos(154,out_YPos);
//				Canvas.DrawText(CurrentPerk.Skilltree[i]);
//				Canvas.SetPos(304,out_YPos);
//				Canvas.DrawText(CurrentPerk.SkillIncrement[i] * 100);
//				Canvas.SetPos(474,out_YPos);
//        		Canvas.DrawText(CurrentPerk.Skilltree[i] * CurrentPerk.SkillIncrement[i] * 100 + 100);
//				out_YPos += out_YL;
//			}
//		}
	}
}

/*********************************************************************************************
 * @name	States
********************************************************************************************* */

/** System settings */
static native function bool ShouldCorpseCollideWithDead();
static native function bool ShouldCorpseCollideWithLiving();
static native function bool ShouldCorpseCollideWithDeadAfterSleep();
static native function bool ShouldCorpseCollideWithLivingAfterSleep();

State Dying
{
	ignores Bump, HitWall, HeadVolumeChange, PhysicsVolumeChange, Falling, BreathTimer, FellOutOfWorld;

	event Timer()
	{
		// destroy/lifespan is handled by the GoreEffectManager
	}

	/** RigidBody went to sleep after being awake - only valid if bCallRigidBodyWakeEvents==TRUE */
	event OnSleepRBPhysics()
	{
		`log(self@"took"@WorldInfo.TimeSeconds - Max(LastPainTime,TimeOfDeath)@"for RB sleep. WarningLevel="$RagdolLWarningLevel, bLogPhysicsBodyImpact);

		// Optimize out 'static' dead bodies.  Could also reduce the cost by using SetTickIsDisabled
		// or overriding the native Tick() function, but this solution should be good enough.
		Mesh.bNoSkeletonUpdate=true;

		if ( !ShouldCorpseCollideWithLivingAfterSleep() )
		{
			// Turn off collision with the living, unless their DeadPawn==TRUE
			Mesh.SetRBCollidesWithChannel(RBCC_Pawn, FALSE);
		}
	}

	/** RigidBody woke up after being stationary - only valid if bCallRigidBodyWakeEvents==TRUE */
	event OnWakeRBPhysics()
	{
		`log(self@"wake RB physics", bLogPhysicsBodyImpact);

		SetRagdollWarningLevel(0);
		Mesh.bNoSkeletonUpdate=false;

		// Wait until after the ragdoll is re-awakened and then turn off collision with dead
		if ( TimeOfDeath < WorldInfo.TimeSeconds && SpecialMove != SM_DeathAnim && !ShouldCorpseCollideWithDeadAfterSleep() )
		{
			Mesh.SetRBCollidesWithChannel(RBCC_DeadPawn, FALSE);
		}
	}

	event TakeDamage(int Damage, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
	{
		if ( damagetype == None )
		{
			// `warn("No damagetype for damage by "$instigatedby.pawn$" with weapon "$InstigatedBy.Pawn.Weapon);
			DamageType = class'DamageType';
		}

		Health -= Damage;
		Momentum = Momentum/Mass;

		// Play clientside hit effects (only plays on LocalPlayer & ListenServer because bTearOff=true)
		// Make sure any additional hits dealt during the time of the killing blow are also replicated to clients
		if (WorldInfo.NetMode != NM_DedicatedServer || TimeOfDeath == WorldInfo.TimeSeconds)
		{
			SetRagdollWarningLevel(0); // restart the ragdoll warning/failsafe
			PlayHit(Damage, EventInstigator, HitLocation, DamageType, Momentum, HitInfo);
		}

		// Notify the DeathAnim move that we were hit, since NotifyTakeHit is not called after death
		if( SpecialMove == SM_DeathAnim )
		{
			SpecialMoves[SpecialMove].NotifyOwnerTakeHit(class<KFDamageType>(damageType), HitLocation, Normal(TearOffMomentum), EventInstigator);
		}
	}

	/** simulated for clients (super will not be called).  This is necessary because in Pawn.PlayDying GotoState is called before TearOff */
	simulated event BeginState(Name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);

		// Add ragdolled corpse to the gore pool
		if ( WorldInfo.NetMode != NM_DedicatedServer && Physics == PHYS_RigidBody )
		{
			ClearTimer();
			bCallRigidBodyWakeEvents = true;

			if ( !WorldInfo.bDropDetail && WorldInfo.GetDetailMode() != DM_LOW )
			{
				// Enable rigid body collision events (impact sounds, etc...)
				Mesh.SetNotifyRigidBodyCollision(true);
			}

			if( WorldInfo.MyGoreEffectManager != none )
			{
				KFGoreManager(WorldInfo.MyGoreEffectManager).AddCorpse(self);
			}
		}
		// otherwise, hide and destroy
		else
		{
			HideMeshOnDeath();
		}
	}
}

/*********************************************************************************************
 * @name	Particle systems
 ********************************************************************************************* */
/** Shuts down provided emitter */
 simulated function DetachEmitter( out ParticleSystemComponent Emitter )
 {
 	if( Emitter != none )
    {
        Emitter.DeactivateSystem();
        DetachComponent(Emitter);
        WorldInfo.MyEmitterPool.OnParticleSystemFinished(Emitter);
        Emitter = None;
    }
 }

defaultproperties
{
	InventoryManagerClass=class'KFInventoryManager'

    // Third person body component
	Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent
		// Animation
		AnimTreeTemplate=None
		bIgnoreControllersWhenNotRendered=true
		Translation=(Z=-86)	// based on CollisionHeight
		// Physics
		CollideActors=true
		BlockZeroExtent=true
		BlockRigidBody=true
		RBChannel=RBCC_Pawn
		RBCollideWithChannels=(Default=TRUE,Pawn=TRUE,Vehicle=TRUE,BlockingVolume=TRUE)
		bHasPhysicsAssetInstance=true
		MinDistFactorForKinematicUpdate=0.2
		bUpdateKinematicBonesFromAnimation=false // perf
		bSkipAllUpdateWhenPhysicsAsleep=true
		RBDominanceGroup=20
		ScriptRigidBodyCollisionThreshold=200
		// Rendering
		bOwnerNoSee=true
		bOverrideAttachmentOwnerVisibility=true
		CastShadow=true
		bUseOnePassLightingOnTranslucency=true
		bPerBoneMotionBlur=true
		bCastDynamicShadow=true
		bAllowPerObjectShadows=true
		PerObjectShadowCullDistance=4000 //40m
`if(`__TW_PER_OBJECT_SHADOW_BATCHING_)
		bAllowPerObjectShadowBatching=true
`endif
		bAcceptsDynamicDecals=true
		bChartDistanceFactor=true
	End Object
	Mesh=KFPawnSkeletalMeshComponent
	Components.Add(KFPawnSkeletalMeshComponent)

	// Third person head component
	Begin Object class=SkeletalMeshComponent name=ThirdPersonHead0
		bAcceptsDynamicDecals=true
	End Object
	ThirdPersonHeadMeshComponent=ThirdPersonHead0

	// First person arms component
	Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms
		bIgnoreControllersWhenNotRendered=true
		// Rendering
		DepthPriorityGroup=SDPG_Foreground
		bOnlyOwnerSee=true
		bOverrideAttachmentOwnerVisibility=true
		bAcceptsDynamicDecals=false
		CastShadow=true
		bCastDynamicShadow=true
		bAllowPerObjectShadows=true
		bAllowBooleanPreshadows=false
	End Object
	ArmsMesh=FirstPersonArms

    Begin Object Class=AkComponent name=AmbientAkSoundComponent_0
        BoneName=RW_Weapon
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        // OcclusionUpdateInterval is set in SetWeaponAmbientSound based on first/third person
    End Object
    WeaponAkComponent=AmbientAkSoundComponent_0
    Components.Add(AmbientAkSoundComponent_0)

    Begin Object Class=AkComponent name=AmbientAkSoundComponent_1
    	BoneName=Spine1 // need bone name so it doesn't interfere with default PlaySoundBase functionality
    	bStopWhenOwnerDestroyed=true
    End Object
    AmbientAkComponent=AmbientAkSoundComponent_1
    Components.Add(AmbientAkSoundComponent_1)

    Begin Object Class=KFWeaponAmbientEchoHandler name=WeaponAmbientEchoHandler_0
    End Object
    WeaponAmbientEchoHandler=WeaponAmbientEchoHandler_0

    Begin Object Class=AkComponent name=FootstepAkSoundComponent
        BoneName=Root
        bForceOcclusionUpdateInterval=true
		OcclusionUpdateInterval=0.f // never update occlusion for footsteps
		bStopWhenOwnerDestroyed=true
    End Object
    FootstepAkComponent=FootstepAkSoundComponent
    Components.Add(FootstepAkSoundComponent)

    Begin Object Class=AkComponent name=DialogAkSoundComponent
    	BoneName=Head
    	//bForceOcclusionUpdateInterval=true
    	//OcclusionUpdateInterval=0.2f
    	bStopWhenOwnerDestroyed=true
    End Object
    DialogAkComponent=DialogAkSoundComponent
    Components.Add(DialogAkSoundComponent)
    CurrDialogEventID=-1

	PawnAnimInfo=KFPawnAnimInfo'ZED_Clot_Anim.AlphaClot_AnimGroup'
	SoundGroupArch=KFPawnSoundGroup'FX_Pawn_Sounds_ARCH.DefaultPawnSounds'

	// ---------------------------------------------
	// Special moves
	Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_GrappleVictim)=class'KFGame.KFSM_GrappleVictim'
		SpecialMoveClasses(SM_HansGrappleVictim)=class'KFGame.KFSM_HansGrappleVictim'
	End Object
	SpecialMoveHandler=SpecialMoveHandler_0

	// ---------------------------------------------
	// Gore
	PhysRagdollImpulseScale=1.f
	PhysicsHitReactionImpulseScale=1.f
	PhysicsImpactBlendOutTime=0.45f
	bRespondToExplosions=true

	// Blood splats
	BloodSplatterDecalMaterials[0]=MaterialInstanceConstant'FX_Gore_MAT.FX_CH_BloodSplatter_01_Mic'
	BloodSplatterDecalMaterials[1]=MaterialInstanceConstant'FX_Gore_MAT.FX_CH_BloodSplatter_05_Mic'

	// Blood pool
	BloodPoolDecalMaterials[0]=MaterialInstanceTimeVarying'FX_Mat_Lib.FX_CH_Bloodpool_DM_TINST'

	// Bone names
	LeftFootBoneName=LeftFoot
	RightFootBoneName=RightFoot
	LeftHandBoneName=LeftHand
	RightHandBoneName=RightHand
	HeadBoneName=head
	TorsoBoneName=Spine2
	PelvisBoneName=Spine

	// ---------------------------------------------
	// Camera
	BaseEyeHeight=+68
	BaseCrouchEyeHeight=+48

	// ---------------------------------------------
	// Collision
	CrouchHeight=+60.0
	CrouchRadius=+36.0

	Begin Object Name=CollisionCylinder
		CollisionRadius=+0036.000000
		CollisionHeight=+0086.000000
		BlockZeroExtent=false // blocked by mesh
	End Object
	CylinderComponent=CollisionCylinder

	// IgnoreBlockingBy ragdoll/knockdown pawns to avoid 'stepup' glitch.
	// Common with fleshpound rage.
	bIgnoreRigidBodyPawns=true

	// ---------------------------------------------
	// Movement & Physics (1uu = 1cm)
	bCanCrouch=true
	GroundSpeed=460.f
	AirSpeed=460.f
	SprintSpeed=460.f
	WalkingPct=0.40
	CrouchedPct=0.40
	BackPedalSpeedMod=1.0f//0.75f
	bWeaponBob=true
	Bob=0.010
	ExtraCostForPath=0
	// This is true in KF1, but adds a line of sight check for any additional damage
	bLOSHearing=false
	HearingThreshold=4000.0

	// PHYS_Walking
	MaxStepHeight=70.0
	WalkableFloorZ=0.7

	// PHYS_Falling
	JumpZ=650.f
	AirControl=+0.15

	bCanWalkOffLedges=true
	bCanJumpOverWalls=true
	bCanUseHiddenSpeed=true
	Mass=65.f // (in kilograms) Used by HandleMomentum()

	// ---------------------------------------------
	// Damage
	MaxFallSpeed=1325.0
	PenetrationResistance=1.0

	// ---------------------------------------------
	// Affictions
	Begin Object Class=KFPawnAfflictions Name=Afflictions_0
		StackingAffl(SAF_EMPPanic)=(Threshhold=1.0,Duration=5.0,Cooldown=5.0,DissipationRate=0.5)
		StackingAffl(SAF_FirePanic)=(Threshhold=10.0,Duration=5.0,Cooldown=5.0,DissipationRate=1.0)
		FireFullyCharredDuration=2.5
   	 	FireCharPercentThreshhold=0.25
	End Object
	AfflictionHandler=Afflictions_0

	// ---------------------------------------------
	// AI / Navigation
	DamageRecoveryTimeHeavy=1.f
	DamageRecoveryTimeMedium=1.f
	MaxJumpHeight=128.0
	bWeakZedGrab=true

	WeaponAttachmentSocket=RW_Weapon
	bWeaponAttachmentVisible=true

	TeammateCollisionRadiusPercent=0.80

	// ---------------------------------------------
	// Network
	bReplicateHealthToAll=true
	AlwaysRelevantDistanceSquared=1000000 // 10m (see KF1's CustomAmbientRelevancyScale)

`if(`notdefined(ShippingPC))
	DebugRadarTexture=Texture2D'UI_ZEDRadar_TEX.MapIcon_Player';
`endif
}
