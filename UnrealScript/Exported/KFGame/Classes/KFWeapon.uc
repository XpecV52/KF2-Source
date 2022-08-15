//=============================================================================
// KFWeapon
//=============================================================================
// The base KF 2 weapon class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - John "Ramm-Jaeger" Gibson 9/27/2012
//=============================================================================
class KFWeapon extends Weapon
	abstract
	native
	nativereplication
	hidecategories(Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug)
	dependson(KFPlayerReplicationInfo, KFMeleeHelperWeapon);







	







	 



		
		
	







 
















 
































































































































































































































#linenumber 70;

#linenumber 17;

/** mesh for overlay - Each weapon will need to add its own overlay mesh in its default props */
var protected MeshComponent OverlayMesh;

/** Cached reference to KFSkeletalMeshComponent(Mesh) */
var KFSkeletalMeshComponent MySkelMesh;

/************************************************************************************
 * @name	Firing / Timing / States
 ***********************************************************************************/
/** Fire mode 0 is the default weapon firing. */
const DEFAULT_FIREMODE			= 0;
/** Fire mode 1 is the alternate weapon firing. */
const ALTFIRE_FIREMODE			= 1;
/** arbitrary firemode for reloading */
const RELOAD_FIREMODE			= 2;
/** Firing mode used when doing a melee attack */
const BASH_FIREMODE				= 3;
/** Firing mode used when doing a melee attack */
const GRENADE_FIREMODE			= 4;

/** Invalid firemode */
const FIREMODE_NONE				= 255;

var array<Texture2D>		FireModeIconPaths;

/** For weapons that have an automatic or burst fire mode, this stores the
  * single fire mode for use by the sound system when in zed time. If set
  * to 255 then the standard looping fire sound will still be played in
  * zed time */
var byte SingleFireMode;

/** Alt-fire mode is selected, all default fires will be converted */
var bool bUseAltFireMode;

/** Holds the min. amount of refire time that has to pass before you can switch */
var float MinFiringPutDownPct;

/** How much penetration power does this fire mode have */
var(Weapon) Array<float>		PenetrationPower;
/** How scale the penetration power this fire mode loses based on the percentage of penetration power left*/
var(Weapon) Array<InterpCurveFloat>	PenetrationDamageReductionCurve;
/** How much penetration power is remaining for this shot */
var transient float			PenetrationPowerRemaining;

/** If > 0, reduce the effect of zed time dilation on this weapon */
var const transient float ZedTimeResistance;

/** How long after we toss a grenade before a zed can grab us.
  * Prevents us from blowing ourselves up on grenades that we
  * were in the middle of tossing when we got grabbed */
var(Weapon) float   GrenadeTossWeakZedGrabCooldown;

/** Time after we are grabbed by a zed to prevent nade throwing so we don't blow ourselvs up */
var(Weapon) float   ZedGrabGrenadeTossCooldown;

/************************************************************************************
 * @name	Aim Assist
 ***********************************************************************************/

/** Target friction enabled? */
var() bool bTargetFrictionEnabled;

/** Min distance for friction */
var() float TargetFrictionDistanceMin;

/** Peak distance for friction */
var() float TargetFrictionDistancePeak;

/** Max distance allow for friction */
var() float TargetFrictionDistanceMax;

/** Interp curve that allows for piece wise functions for the TargetFrictionDistance amount at different ranges **/
var() InterpCurveFloat TargetFrictionDistanceCurve;

/** Min/Max friction multiplier applied when target acquired */
var() Vector2d TargetFrictionMultiplierRange;

/** Amount of additional radius/height given to target cylinder when at peak distance */
var() float TargetFrictionPeakRadiusScale;
var() float TargetFrictionPeakHeightScale;

/** Offset to apply to friction target location (aim for the chest, etc) */
var() vector TargetFrictionOffset;

/** Boost the Target Friction by this much when zoomed in **/
var() float TargetFrictionZoomedBoostValue;

var() bool bTargetAdhesionEnabled;

/** Max time to attempt adhesion to the friction target */
var() float TargetAdhesionTimeMax;

/** Max distance to allow adhesion to still kick in */
var() float TargetAdhesionDistanceMax;

/** Max distance from edge of cylinder for adhesion to be valid */
var() float TargetAdhesionAimDistY;
var() float TargetAdhesionAimDistZ;

/** Min/Max amount to scale for adhesive purposes */
var() Vector2d TargetAdhesionScaleRange;

/** Min amount to scale for adhesive purposes */
var() float TargetAdhesionScaleAmountMin;

/** Require the target to be moving for adhesion to kick in? */
var() float TargetAdhesionTargetVelocityMin;

/** Require the player to be moving for adhesion to kick in? */
var() float TargetAdhesionPlayerVelocityMin;

/** Boost the Target Adhesion by this much when zoomed in **/
var() float TargetAdhesionZoomedBoostValue;

/************************************************************************************
 * @name	Weapon positioning: Iron sights, hipped, etc
 ***********************************************************************************/

/** The weapon is using the sights to aim*/
var				bool	bUsingSights;
/** This weapon has sights to aim*/
var(IronSight)	bool	bHasIronSights;

/** The weapon wants to go to ironsights when the bring up happens (because someone was already in ironsights when they switched)*/
var         	bool	bIronSightOnBringUp;

/** Hide the weapon for screenshots, etc */
var bool bForceHidden;

/** special offset when using hidden weapons, as we need to still place the weapon for e.g. attached beams */
var vector HiddenWeaponsOffset;

/** The default FOV to use for this weapon when not in ironsights */
var(Camera)	float		MeshFOV;
/** The fov to use for this weapon when in ironsights */
var(Camera)	float		MeshIronSightFOV;
/** The fov to use for the player when in ironsights */
var(Camera)	float		PlayerIronSightFOV;
/** The fov to use while in the weapon sprinting state */
var(Camera)	float		PlayerSprintFOV;

/** The position of the weapon when in standard ironsights position */
var(Positioning)	vector		IronSightPosition;
/** We are transitioning to zoomed in. When set to true native code will attempt to interpolate to the zoomed in ironsight position */
var				bool		bZoomingIn;
/** We are transitioning to zoomed out. When set to true native code will attempt to interpolate to the zoomed out ironsight position */
var				bool		bZoomingOut;
/** Time remaining on the active transition to/from iron sights */
var				float		ZoomTime;
/** How long the transition to iron sights should take */
var(IronSight)	float		ZoomInTime;
/** How long the transition from iron sights should take */
var(IronSight)	float		ZoomOutTime;
/** Amount to rotate to when zooming in to give the feeling of an animation playing */
var(IronSight)	rotator		ZoomInRotation;
/** Doing a "quick down" zoom */
var(IronSight)	bool        bDoingQuickDownZoom;
/** Amount to rotate to when doing a quick weapon put down */
var(IronSight)	rotator		QuickWeaponDownRotation;
/** How long the transition to quick weapon down should take */
var(IronSight)	float		QuickWeaponDownTime;
/** How long the transition from quick weapon down should take */
var(IronSight)	float		QuickWeaponDownFinishTime;
/** Don't use the ZoomInRotation for this zoom */
var(IronSight)	bool		bSkipZoomInRotation;
/** Set by the native code when zooming in/out. This is the interpolated rotation over time of the value set in ZoomInRotation */
var				rotator		ZoomRotInterp;
/** When we start zooming what player view location is the first person weapon in. Used by the native code to calculate where to start zooming from */
var				vector		ZoomStartOffset;
/** We were zooming in and it was interrupted. Used by the native code to handle smooth interpolations between zoomed positions */
var				bool		bZoomInInterrupted;
/** We were zooming out and it was interrupted. Used by the native code to handle smooth interpolations between zoomed positions */
var				bool		bZoomOutInterrupted;
/** How much time we have to finish a partial zoom out. Used by the native code to handle smooth interpolations between zoomed positions */
var				float		ZoomPartialTime;
/** When we start zooming what rotation offset is the weapon. Used by the native code to handle smooth interpolations between zoomed positions */
var				rotator		ZoomRotStartOffset;
/** When we start zooming what WeaponFOV did we start with */
var             float       ZoomWeaponFOVStart;
/** The last time we zoomed out. */
var				float		LastZoomOutTime;
/** How long to take to zoom out when we're doing a fast zoom out (i.e. when an action like reloading interupts ironsights) */
var(IronSight)	float		FastZoomOutTime;
/** The weapon is doing a fast zoom out without animating, and won't get ZoomStart/End Notifies */
var             bool        bFastZoomOut;
/** The Target player view location for the first person weapon for this zoom */
var				vector		ZoomTargetOffset;
/** The weapon has a scope and should use the scope offset for zoomed in mode */
var 			bool		bHasScopePosition;
/** The position of the weapon when looking through the scope */
var(Positioning)	vector		ScopePosition;
/** Currently zoomed into the scope position */
var             bool        bUsingScopePosition;

var(DeptoOfField) bool DOF_bOverrideEnvironmentDOF;
var(DepthOfField) float DOF_SharpRadius;
var(DepthOfField) float DOF_FocalRadius;
var(DepthOfField) float DOF_MinBlurSize;
var(DepthOfField) float DOF_MaxNearBlurSize;
var(DepthOfField) float DOF_MaxFarBlurSize;
var(DepthOfField) float DOF_ExpFalloff;
var(DepthOfField) float DOF_MaxFocalDistance;

var(DepthOfField) float DOF_BlendInSpeed;
var(DepthOfField) float DOF_BlendOutSpeed;

var(DepthOfField) float DOF_FG_SharpRadius;
var(DepthOfField) float DOF_FG_FocalRadius;
var(DepthOfField) float DOF_FG_MinBlurSize;
var(DepthOfField) float DOF_FG_MaxNearBlurSize;
var(DepthOfField) float DOF_FG_ExpFalloff;

/** Holds an offest for spawning grenades. */
var(Positioning)			vector	GrenadeFireOffset;

/** The weapon is using the sights to aim*/
var(Positioning)    bool	bWeaponNeedsServerPosition;

/** If true, weapon position should follow camera anims played on the weapon AnimSeq */
var(Positioning)	bool	bFollowAnimSeqCamera;

/*********************************************************************************************
 * @name	Inventory Grouping/etc.
********************************************************************************************* */

enum EInventoryGroup
{
	IG_Primary,
	IG_Secondary,
	IG_Melee,
	IG_Equipment,
};

/** Determines which group a weapon falls into in weapon select */
var(Inventory) const EInventoryGroup	InventoryGroup;

enum EFilterTypeUI
{
	FT_Pistol,
	FT_Shotgun,
	FT_Rifle,
	FT_Projectile,
	FT_Flame,
	FT_Electric,
	FT_Explosive,
	FT_Assault,
	FT_Melee,
	FT_SMG
};

/** Determine which group a weapon will show up for the weapon type filter */
var(Inventory) const EFilterTypeUI	FilterTypeUI;

/** Inventory (In blocks) cost */
var(Inventory) byte	InventorySize;

/** Used to place this weapon in the inventory */
var(Inventory) float GroupPriority;
///** The UI image for this weapon */
var (Inventory) Texture2D UITexture;
/** The path that locates the image for this weapon */
var(Inventory) Texture2D SecondaryAmmoTexture;
/** The path that locates the image for this weapon */
var(Inventory) bool bCanRefillSecondaryAmmo;

/** used when aborting a weapon switch (state WeaponAbortEquip) */
var float EquipAbortTime;

/** True if we were given this weapon at spawn */
var bool bGivenAtStart;

/** class of the dual variant of this weapon, if applicable */
var class<KFWeap_DualBase> DualClass;

/*********************************************************************************************
 * @name	Ammo / Reload
********************************************************************************************* */

/** If set execute PerformReload on client only and synchronize at end of state */


const PRIMARY_AMMO		= 0;
const SECONDARY_AMMO	= 1;

// ---------------------------------------------
// Magazine - Primary and Secondary/alt

/** Ammo from current magazine */
var				byte	AmmoCount[2];
/** Size of the active weapon magazine */
var(Inventory)	int		MagazineCapacity[2];
/** Is this a no magazine/clip weapon e.g. the hunting shotgun? */
var(Inventory)	bool 	bNoMagazine;

// ---------------------------------------------
/// Spare ammo - Primary Only... for now

/** Spare ammo, contained in extra magazines (outside of what's currently in the weapon) */
var				int		SpareAmmoCount[2];
/** Maximum amount of amount that can be carried for this gun */
var(Inventory)	int		MaxSpareAmmo[2];
/** Number of magazines to start with */
var	int		InitialSpareMags[2];

/** What percentage of a full single magazine capacity to give when resupplying this weapon from an ammo pickup */
var(Inventory)	float   AmmoPickupScale[2];

enum EReloadStatus
{
	RS_None,
	RS_OpeningBolt,
	RS_Reloading,
	RS_ClosingBolt,
	RS_Complete
};

var EReloadStatus		ReloadStatus;
var(Inventory) bool		bCanBeReloaded;
var(Inventory) bool		bReloadFromMagazine;

/** Number of rounds to reload during the reload state */
var byte ReloadAmountLeft;

/** If set, this weapon can always reload */
var const bool bInfiniteSpareAmmo;

/** If set, this weapon won't consume any ammo */
var bool bInfiniteAmmo;

/** If FALSE, AmmoCount is server authoritative and should not be modified on the client */
var const bool bAllowClientAmmoTracking;

/*********************************************************************************************
 * @name  Fire Effects
 ******************************************************************************************* */

/** Camera anim to play when firing (for camera shakes) */
var array<CameraAnim> FireCameraAnim;

var(Camera) float   ShakeScaleSighted;      // How much to scale the FireCameraAnim when in ironsights
var(Camera) float   ShakeScaleStandard;     // How much to scale the FireCameraAnim by default (Hipped/Shouldered)

/** Controller rumble to play when firing. */
var ForceFeedbackWaveform WeaponFireWaveForm;

var	bool	bPlayingLoopingFireSnd;
var bool	bPlayingLoopingFireAnim;

/** This is the camera shake that we play when we hit a melee attack **/
var(Camera) const CameraShake MeleeImpactCamShake;

/*********************************************************************************************
 * @name	Animations (Using const anim names to reduce instanced data cost)
********************************************************************************************* */

/** Cached anim nodes */
var KFAnimSeq_Tween				WeaponAnimSeqNode;
var AnimNodeAdditiveBlending	IdleBobBlendNode;
var AnimNodeBlendPerBone		EmptyMagBlendNode;

// Loop settings per firemode
var(Animations)	array<bool>	bLoopingFireAnim;
var(Sounds)	array<bool>	bLoopingFireSnd;

/** How much tweening to use on fire animations */
var(Animations) float   FireTweenTime;
/** Use the animation sequence length to get equip times */
var(Animations) bool	bUseAnimLenEquipTime;

/** If set, this weapon has unique shoot anims for the last round */
var(Animations) bool	bHasFireLastAnims;

// Standard
/** Animations to play when the weapon is fired */
var(Animations) const editconst name    	FireAnim;
/** Animation to play when the weapon is fired and bLoopingFireAnim is true */
var(Animations) const editconst	name		FireLoopAnim;
/** Animation to play when the last shot if fired */
var(Animations) const editconst	name		FireLastAnim;
/** Animation to play when the weapon is Put Down */
var(Animations) const editconst name		PutDownAnim;
/** Animation to play when the weapon is Equipped */
var(Animations) const editconst name		EquipAnim;
/** Animation to play when the weapon is idle */
var(Animations) const editconst array<name> IdleAnims;

// Special idle anims
var(Animations)					bool		bUseAdditiveMoveAnim;
var(Animations) const editconst array<name>	IdleFidgetAnims;
var transient					float	 	LastIdleFidgetAnimTime;

// Iron Sights
/** Animation to play when the weapon is fired */
var(Animations) const editconst	array<name>	FireSightedAnims;
/** Animation to play when the weapon is fired and bLoopingFireAnim is true */
var(Animations) const editconst	name		FireLoopSightedAnim;
/** Animation to play when the last shot if fired */
var(Animations) const editconst	name		FireLastSightedAnim;
/** Animation to play when idling */
var(Animations) editconst	  array<name>	IdleSightedAnims;

// High RPM Firing
/** Animation to play at the end of a looping fire anim */
var(Animations) const editconst	name		FireLoopStartAnim;
/** Animation to play at the end of a looping fire anim */
var(Animations) const editconst	name		FireLoopStartSightedAnim;
/** Animation to play at the end of a looping fire anim */
var(Animations) const editconst	name		FireLoopEndAnim;
/** Animation to play at the end of a looping fire anim */
var(Animations) const editconst	name		FireLoopEndSightedAnim;

// Scoped Firing
/** Animation to play when the weapon is fired */
var(Animations) const editconst	name	FireScopedAnim;
/** Animation to play when the weapon is fired and bLoopingFireAnim is true */
var(Animations) const editconst	name	FireLoopScopedAnim;
/** Animation to play when the last shot if fired */
var(Animations) const editconst	name	FireLastScopedAnim;

/** Default melee attack animation names */
var array<name> MeleeAttackAnims;

// Reloading (const to reduce instanced data)
const ReloadEmptyMagAnim = 'Reload_Empty';
const ReloadNonEmptyMagAnim = 'Reload_Half';
const ReloadEmptyMagEliteAnim = 'Reload_Empty_Elite';
const ReloadNonEmptyMagEliteAnim = 'Reload_Half_Elite';

const ReloadOpenAnim = 'Reload_Open';
const ReloadSingleAnim = 'Reload_Insert';
const ReloadCloseAnim = 'Reload_Close';
const ReloadOpenEliteAnim = 'Reload_Open_Elite';
const ReloadSingleEliteAnim = 'Reload_Insert_Elite';
const ReloadCloseEliteAnim = 'Reload_Close_Elite';

// Grenades
/** Animation to play when a grenade is thrown */
const GrenadeThrowAnim = 'Nade_Throw';

// Sprinting
const SprintStartAnim = 'Sprint_In';
const SprintLoopAnim = 'Sprint_Loop';
const SprintEndAnim = 'Sprint_Out';

/** Camera anim played when sprinting */
var(Camera)		CameraAnim		SprintCameraAnim;
var	transient	CameraAnimInst	SprintCameraAnimInst;
var transient   float			SprintAnimRate;

// SkelControls
var bool bEnableTiltSkelControl;

/** Set from unlock notify to enable test for an aborted reload */
var transient bool bCheckBoltLockPostReload;

/*********************************************************************************************
 * @name	Sounds
********************************************************************************************* */

var(Sounds) bool bSuppressSounds;

struct native WeaponFireSndInfo
{
	var() AkEvent		DefaultCue;
	var() AkEvent		FirstPersonCue;
};

/** Sound to play when the weapon is fired */
var(Sounds)	array<WeaponFireSndInfo>	WeaponFireSnd;
/** sound to play when the weapon stops fired. Used for high ROF weapons that have a looping fire sound */
var(Sounds)	array<WeaponFireSndInfo>	WeaponFireLoopEndSnd;

/** sound to play when the weapon is dry fired */
var(Sounds)	array<AkBaseSoundObject>  WeaponDryFireSnd;
/** If set to true, attempting to reload will switch to best available weapon */
var() bool  bPendingAutoSwitchOnDryFire;

/*********************************************************************************************
 * @name	First person weapon view positioning and rendering
********************************************************************************************* */

/** How much to damp view bob */
var(Motion) float	BobDamping;

/** How much to damp jump and land bob */
var(Motion) float	JumpDamping;

/** Offset from view center */
var(Positioning) vector	PlayerViewOffset;

/** If true, will be un-hidden on the next setPosition call. */
var bool bPendingShow;

/** Used to display effects such as blood splatter and muzzle glow */
var MaterialInstanceConstant	WeaponMIC;
/** Defines how bloody the weapon looks */
var float						BloodParamValue;

const BloodParamName			= 'Scalar_Blood_Contrast';
const MinBloodParamValue		= 0.20f;

/*********************************************************************************************
 * @name	Weapon Lag System
********************************************************************************************* */

/** The weapon lag value to use to offset the weapon in first person. Calculated by ProcessWeaponLag in the native code*/
var             vector  WeaponLag;

// Basic Weapon Lag Variables
/** Horizontal Offset, in units from the weapon's resting position */
var				float	LagHorizontal;
/** Vertical Offset, in units from the weapon's resting position */
var				float	LagVertical;
var				float	LagVelocityHorizontal;
var				float	LagVelocityVertical;

// Weapon Lag calculations for when the pawn's accelleration changes, or the pawn turns. Affects spring LagTensionHorizontal and dampening.
var(Motion)		float	LagTensionHorizontal;
var(Motion)		float	LagVerticalTension;

// Weapon LagResistanceHorizontal/Vertical represents how much the gun does not want to move at all, affects dampening.
var(Motion)		float	LagResistanceHorizontal;
var(Motion)		float	LagResistanceVertical;

// Limitations and Conversions
/** the maximum offset/lag that the weapon should lag when moving around */
var(Motion)		float	LagLimit;
/** A constant that converts yaw velocity to linear velocity to be used in calculating weapon-lag */
var(Motion)		float 	LagYawCoefficient;

// Weapon Lag State Properties
// Dynamic Lag tension modifiers. Effectively, these Strength values
// are multiplied into the tension based on the pawn's state.
var(Motion)		float	LagStrengthIronSights;
var(Motion)		float	LagStrengthCrouch;
var(Motion)		float	LagStrengthWalk;
var(Motion)		float	LagStrengthJog;
var(Motion)		float	LagStrengthSprint;

// Strafe Lag - special lag for moving left and right
/** The horizontal offset from center when the pawn Strafes left/right. */
var				float 	StrafeLag;
var				float 	StrafeLagVelocity;
/** The maximum horizontal offset from center */
var(Motion)		float 	StrafeLagLimit;
/** Rate at which momentum changes should affect Strafe lagging */
var(Motion)		float 	StrafeLagRate;
/** Rate at which weapon should return to normal after straffing.*/
var(Motion)		float 	StrafeLagReturnRate;

/** How quickly the weapon is Yawing */
var int AimYawSpeed;
/** How quickly the weapon is Pitching */
var int AimPitchSpeed;

/*********************************************************************************************
 * @name	Attachments
********************************************************************************************* */

/** The class of the third person attachment to spawn */
var(Attachments) KFWeaponAttachment 	AttachmentArchetype;

/** Object within weapon that manages melee attacks */
var(Weapon) instanced KFMeleeHelperWeapon MeleeAttackHelper;

/** A muzzle flash instance */
var					   KFMuzzleFlash MuzzleFlash;
/** A reference to the muzzle flash template */
var(Attachments) const KFMuzzleFlash MuzzleFlashTemplate;

/** A flashlight flash instance */
var	transient		   KFFlashlightAttachment FlashLight;
/** A reference to the muzzle flash template */
var(Attachments) const KFFlashlightAttachment FlashLightTemplate;

var(Attachments)		bool			   bHasFlashlight;

/** A laser sight instance */
var	transient		   KFLaserSightAttachment LaserSight;
/** A reference to the laser sight template */
var(Attachments) const KFLaserSightAttachment LaserSightTemplate;
/** Whether the weapon supports laser sights or not */
var(Attachments)		bool			   bHasLaserSight;

/*********************************************************************************************
 * @name	Projectiles
********************************************************************************************* */

/** The max Dot Angle to allow for adjusting projectiles so they hit where the crosshair is aiming. This prevent wierd issues where you are firing on something really close, and the projectile spawning code makes the projectile's velocity (AimDir) go off in some really odd direction */
const MaxAimAdjust_Angle = 0.1f;	// Radians
const MaxAimAdjust_Cos = 0.995f;	// Cos(MaxAimAdjust)

/*********************************************************************************************
 * @name	Firing
********************************************************************************************* */

/** Amount to scale spread when moving and shooting. Set this to something greater than 1.0 if you want to have added spread while moving. KF1 did not have this */
var(Weapon)	float	MovingSpreadMod;
/** Amount to scale spread when using ironsights */
var(Weapon)	float	IronSightsSpreadMod;
/** Amount to scale spread when Crouched */
var(Weapon)	float	CrouchSpreadMod;

/*********************************************************************************************
 * @name	Recoil
 *
 * @note - recoil rotation is calculated randomly using the below values. The recoil pitch will be a random
 * amount between min and max Recoil Pitch. The recoil yaw will be a min and max value between min and max Recoil Yaw.
 * The weapon will recoil at for RecoilRate amount of seconds, and then when firing has ceased will blend back to zero at
 * the recoil rate multiplied by the RecoilBlendOutRatio. The weapon itself will move around independent of the camera
 * movement withing the RecoilMax limits. Suppression recoil is on top of standard recoil. It moves the player's
 * view around when bullets are whizzing by for example.
********************************************************************************************* */

/** max vertical units a weapon muzzle will climb from recoil */
var(Recoil)	int		maxRecoilPitch;
/** max vertical units a weapon muzzle will climb from recoil */
var(Recoil)	int 	minRecoilPitch;
/** max horizontal units a weapon muzzle will move from recoil */
var(Recoil)	int		maxRecoilYaw;
/** min horizontal units a weapon muzzle will move from recoil */
var(Recoil)	int		minRecoilYaw;
/** Time in seconds each recoil should take to be applied. Must be less than the fire rate or the full recoil wont be applied */
var(Recoil)	float	RecoilRate;
/** What percentage of the RecoilSpeed it will take to blend recoil out */
var(Recoil)	float	RecoilBlendOutRatio;
/** What percentage of recoil to apply to the view rotation when firing */
var(Recoil)	float	RecoilViewRotationScale;
/** Scales how much effect the players rotation input (from mouse/gamepad) has on reducing the total recoil (the first person weapon model's recoil) */
var(Recoil) float   RecoilCompensationScale;
/** At what percentage the weapon is recoiled torwards the Max or Min Pitch limit to start blending to full view rotation recoil */
var(Recoil)	float	FullRecoilPitchPct;
/** At what percentage the weapon is recoiled torwards the Max or Min Yaw limit to start blending to full view rotation recoil */
var(Recoil) float   FullRecoilYawPct;

// Normal Hipped Recoil
/** Maximum yaw rotation of the weapon from recoil before the player's view moves */
var(Recoil)	int		RecoilMaxYawLimit;
/** Minimum yaw rotation of the weapon from recoil before the player's view moves */
var(Recoil)	int		RecoilMinYawLimit;
/** Maximum pitch rotation of the weapon from recoil before the player's view moves */
var(Recoil)	int		RecoilMaxPitchLimit;
/** Minimum pitch rotation of the weapon from recoil before the player's view moves */
var(Recoil)	int		RecoilMinPitchLimit;

// Iron Sight Recoil
/** Maximum yaw rotation of the weapon from recoil before the player's view moves when using Iron sights */
var(Recoil)	int		RecoilISMaxYawLimit;
/** Minimum yaw rotation of the weapon from recoil before the player's view moves when using Iron sights */
var(Recoil)	int		RecoilISMinYawLimit;
/** Maximum pitch rotation of the weapon from recoil before the player's view moves when using Iron sights */
var(Recoil)	int		RecoilISMaxPitchLimit;
/** Minimum pitch rotation of the weapon from recoil before the player's view moves when using Iron sights */
var(Recoil)	int		RecoilISMinPitchLimit;

// Internal recoil vars used by the native code
/** Stores recoil when a weapon is fired */
var			rotator	RecoilRotator;
/** Stores the total recoil for this group of weapon firing */
var			rotator	TotalRecoilRotator;
/** How much time left to process this recoil */
var			float	RecoilTimeLeft;
/** The amount of time it will take to process this recoil */
var			float	RecoilSpeed;
/** Stores the calculated yaw blend out rate */
var			int		RecoilYawBlendOutRate;
/** Stores the calculated pitch blend out rate */
var			int		RecoilPitchBlendOutRate;

/** Used to track how close the recoil is to the edge of the buffer */
var float RecoilPitchPercentage;
/** Used to track how close the recoil is to the edge of the buffer */
var float RecoilYawPercentage;

// Internal recoil vars used by the native code
/** Stores recoil when suppression is recieved */
var			rotator	SuppressRecoilRotator;
/** Remaining time to process suppression recoil */
var			float	SuppressRecoilTimeLeft;

/** The amount of time it will take to process this suppression recoil */
var(Recoil)	float	SuppressRecoilSpeed;
/** The percentage of the suppression recoil to apply to the player's view */
var(Recoil)	float	SuppressRecoilViewRotationScale;

// Note on Recoil modifiers: Total recoil modifier will be the weapon posture modifier multiplied by the player stance modifier.
// Default recoil is based on a standing player in ironsights position (not moving), or bipod deployed position for weapons
// with bipods

/** Recoil modifier for when the player is holding the weapon in the hipped position */
var(Recoil)       float           HippedRecoilModifier;
/** Recoil modifier for when the player is jogging and shooting */
var(Recoil)       float           JoggingRecoilModifier;
/** Recoil modifier for when the player is walking and shooting */
var(Recoil)       float           WalkingRecoilModifier;
/** Recoil modifier for falling player stance */
var(Recoil)       float           FallingRecoilModifier;
/** Recoil modifier for crouched */
var(Recoil)       float           StanceCrouchedRecoilModifier;
/** Stores the last calculated recoil modifier */
var               float           LastRecoilModifier;

/** Used to compensate for weapons that have an ironsight mesh FOV that is different
 * Than the player's world FOV. When these mismatch, it causes the recoil
 * rotation to mismatch as well. Use this value to get them back in sync.
 *
 */
var(Recoil) float IronSightMeshFOVCompensationScale;

/*********************************************************************************************
 * @name	Clientside hit detection
 ********************************************************************************************* */

/** Compressed ImpactInfo more suitable for server function replication */
struct native ImpactRepInfo
{
	var	Actor		HitActor;
	var	vector		HitLocation;
	var	vector		RayDir;

	// BoneName --- Used by KFPawns for hit zone detection.  Each zone name must be
	// added to MAX_NETWORKED_HARDCODED_NAME otherwise it will be replicated as a string.
	var	name		HitInfo_BoneName;

	// HitComp --- Used for KActorFromStatic, but since the engine does not
	// replicate we only lose remote KActors playing on the listen server.
};

/*********************************************************************************************
 * @name	Perks
 ********************************************************************************************* */
/** Is this perk backup weapon? */
var bool bIsBackupWeapon;
var(Weapon) class<KFPerk> 		AssociatedPerkClass;

/*********************************************************************************************
 * @name	Trader
 ********************************************************************************************* */

/** The maximum range at which this weapon is effective. Unlike other trader stats, this isn't
  * programatically generated but rather set by design to a reasonable value based on judgment.
  * Range is 0-100.
  */
var() byte EffectiveRange;

/** Whether to use the hand-crafted EffectiveRange or a more deterministic value */
var bool bUseEffectiveRangeForTrader;

/** Id for shared unlock if applicable */
var private const ESharedContentUnlock SharedUnlockId;

/*********************************************************************************************
 * @name	Debug
 ********************************************************************************************* */

// `log conditions.  More efficient than using log tags, because the msg is not evaluated.
var config bool bLogAnimation;
var config bool	bLogStates;
/** If set, this weapon will pause with the PlayersOnly command */
var bool bPauseWithPlayersOnly;

/** If set, this weapon will pause with the PlayersOnly command */
var bool bDebugRecoilPosition;

/** temp ammo logging */
var config bool	bLogAmmo;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if (bNetDirty && (bNetInitial || !bAllowClientAmmoTracking) )
		AmmoCount;
	if (bNetDirty)
		SpareAmmoCount, MagazineCapacity, MaxSpareAmmo, bGivenAtStart;
}

/*********************************************************************************************
 * @name	Native helper functions
********************************************************************************************* */

/** Util that makes sure the overlay component is last in the AllComponents/Components array. */
native function EnsureWeaponOverlayComponentLast();

/**
 * Handles view rotation and weapon rotation changes for the weapon. Called in script by
 * the KFPlayerController holding this weapon. Currently handles free-aim and recoil.
 *
 * @param		PC				PlayerController whose pawn is holding this weapon
 * @param		DeltaTime		Amount of time that has passed since the last update
 * @param		DeltaRot		The view rotational delta the PC is attempting to perform
 */
native function WeaponProcessViewRotation(PlayerController PC, float DeltaTime, out Rotator DeltaRot);

/** Queries the pawn and returns our current Perk */
native function KFPerk GetPerk() const;

/** 0: Normal zed time, 1: Ignore zed time */
native function SetZedTimeResist(float ResistPct);
/** Zero out current zed time resitances */
native function ClearZedTimeResist();

/*********************************************************************************************
 * @name	Constructors, Destructors, and Loading
********************************************************************************************* */

/**
 * Called immediately before gameplay begins.
 */
simulated event PreBeginPlay()
{
	Super.PreBeginPlay();

	MySkelMesh = KFSkeletalMeshComponent(Mesh);
	if ( MySkelMesh == None )
	{
		WarnInternal("A Invalid KFSkeletalMeshComponent(Mesh) cast!!!");
	}

	// Cache AnimNodeSeq (no AnimTree version)
 	WeaponAnimSeqNode = KFAnimSeq_Tween( GetWeaponAnimNodeSeq() );

	InitializeAmmo();
	InitializeEquipTime();

	// Set up the recoil blend out parameters
	if( RecoilRate > 0 && RecoilBlendOutRatio > 0 )
	{
		RecoilYawBlendOutRate = maxRecoilYaw/RecoilRate * RecoilBlendOutRatio;
		RecoilPitchBlendOutRate = maxRecoilPitch/RecoilRate * RecoilBlendOutRatio;
	}

	if ( bHasFlashlight )
	{
		AttachFlashlight();
	}

	if( bHasLaserSight )
	{
		AttachLaserSight();
	}
}

/** Cache Anim Nodes from the tree
* 	@note: skipped on server because AttachComponent/AttachWeaponTo is not called
*/
simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	WeaponAnimSeqNode = KFAnimSeq_Tween(SkelComp.FindAnimNode('WeaponSeq'));
	// If we're not using a NodeName, try default anim node
	if ( WeaponAnimSeqNode == None )
	{
		WeaponAnimSeqNode = KFAnimSeq_Tween( GetWeaponAnimNodeSeq() );
	}

	IdleBobBlendNode = AnimNodeAdditiveBlending(SkelComp.FindAnimNode('IdleBobAdditiveBlend'));
	ToggleAdditiveBobAnim(false, 0.f);

	EmptyMagBlendNode = AnimNodeBlendPerBone(SkelComp.FindAnimNode('EmptyMagBlend'));
}

/** Setup the time it takes before the equip anim can be interrupted */
simulated function InitializeEquipTime()
{
	EquipTime = EquipTime>0 ? EquipTime : 0.01;
	PutDownTime = PutDownTime>0 ? PutDownTime : 0.01;

	if ( bUseAnimLenEquipTime )
	{
		EquipTime = MySkelMesh.GetAnimInterruptTime(EquipAnim);
		PutDownTime = MySkelMesh.GetAnimLength(PutDownAnim);
	}
}

/**
 * Initialize the FOV settings for this weapon, adjusting for aspect ratio
 * @param SizeX the X resolution of the screen
 * @param SizeY the Y resolution of the screen
 * @param DefaultPlayerFOV the default player FOV of the player holding this weapon
 * @param DefaultPlayerFOV the PlayerController of the player holding this weapon
 */
simulated function InitFOV(float SizeX, float SizeY, float DefaultPlayerFOV)
{
	MeshFOV = class'KFPlayerController'.static.CalcFOVForAspectRatio(default.MeshFOV, SizeX, SizeY);
	MeshIronSightFOV = class'KFPlayerController'.static.CalcFOVForAspectRatio(default.MeshIronSightFOV, SizeX, SizeY);
	PlayerIronSightFOV = class'KFPlayerController'.static.CalcFOVForAspectRatio(default.PlayerIronSightFOV, SizeX, SizeY);
	PlayerSprintFOV = class'KFPlayerController'.static.CalcFOVForAspectRatio(default.PlayerSprintFOV, SizeX, SizeY);

	if( DefaultPlayerFOV > PlayerSprintFOV )
	{
		PlayerSprintFOV = DefaultPlayerFOV;
	}

	if( bUsingSights )
	{
		SetFOV(MeshIronSightFOV);
	}
	else
	{
		SetFOV(MeshFOV);
	}

    if (bLogAnimation) LogInternal("PlayerIronSightFOV = "$PlayerIronSightFOV$" default POV = "$default.PlayerIronSightFOV);
    if (bLogAnimation) LogInternal("SprintFOV = "$PlayerSprintFOV$" default POV = "$default.PlayerSprintFOV);
}

simulated event Destroyed()
{
	if (Instigator != None && Instigator.IsHumanControlled() && Instigator.IsLocallyControlled())
	{
		PreloadTextures(false);
	}
	super.Destroyed();
}

/**
  * Force streamed textures to be loaded.  Used to get MIPS streamed in before weapon comes up
  * @PARAM bForcePreload if true causes streamed textures to be force loaded, if false, clears force loading
  */
simulated function PreloadTextures(bool bForcePreload)
{
	if ( MySkelMesh != None )
	{
		MySkelMesh.PreloadTextures(bForcePreload, WorldInfo.TimeSeconds + 2);
	}
}

/*********************************************************************************************
 * @name	Inventory & Weapon Switching
 *********************************************************************************************/

/**
 * This Inventory Item has just been given to this Pawn
 * (server only)
 */
function GivenTo( Pawn thisPawn, optional bool bDoNotActivate )
{
	Super.GivenTo(thisPawn, bDoNotActivate);

	KFInventoryManager(InvManager).CurrentCarryBlocks += InventorySize;

	KFPawn(Instigator).NotifyInventoryWeightChanged();
}

/**
 * A notification call when this weapon is removed from the Inventory of a pawn
 * @see Inventory::ItemRemovedFromInvManager
 */
function ItemRemovedFromInvManager()
{
	Super.ItemRemovedFromInvManager();

	KFInventoryManager(InvManager).CurrentCarryBlocks -= InventorySize;

	KFPawn(Instigator).NotifyInventoryWeightChanged();
}

reliable client function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
	local PlayerController PC;

	if ( Instigator != None )
	{
		PC = PlayerController(Instigator.Controller);
		if( Instigator.Controller != none && PC.myHUD != none )
		{
			InitFOV(PC.myHUD.SizeX, PC.myHUD.SizeY, PC.DefaultFOV);
		}
	}
	Super.ClientWeaponSet(bOptionalSet, bDoNotActivate);
}

 /**
 * Attach Weapon Mesh, Weapon MuzzleFlash and Muzzle Flash Dynamic Light to a SkeletalMesh
 *
 * @param	who is the pawn to attach to
 */
simulated function AttachWeaponTo( SkeletalMeshComponent MeshCpnt, optional Name SocketName )
{
	local KFPawn KFP;

	KFP = KFPawn(Instigator);
	if( KFP != none && KFP.ArmsMesh != none )
	{
		KFP.ArmsMesh.SetParentAnimComponent(MySkelMesh);
		KFP.ArmsMesh.SetFOV(MySkelMesh.FOV);
	}

	// Attach 1st Person Muzzle Flashes, etc,
	if ( Instigator.IsFirstPerson() )
	{
		// Toggle preshadows before attaching component (depending on graphics settings)
		if( KFP.AllowFirstPersonPreshadows() )
		{
			Mesh.bAllowPerObjectShadows = true;
		}
		else
		{
			Mesh.bAllowPerObjectShadows = false;
		}

		AttachComponent(Mesh);
		EnsureWeaponOverlayComponentLast();
		SetHidden(True);
		bPendingShow = TRUE;

		// Set the weapon to use the Instigator pawn's lighting channel
		if( KFP != none )
		{
			SetMeshLightingChannels(KFP.PawnLightingChannel);
			if( KFP.ArmsMesh != none )
			{
				Mesh.SetShadowParent(KFP.ArmsMesh);
				// Reattach our arms mesh at the same time as our weapon to avoid them ticking and popping on screen early
				AttachComponent(KFP.ArmsMesh);
			}
		}
	}
	// Attach the weapon on the server too, otherwise the hipped free-aim stuff won't work (recoil) and attaching flamethrower stuff messes up
	else if ( bWeaponNeedsServerPosition && (WorldInfo.NetMode == NM_DedicatedServer || (WorldInfo.NetMode == NM_ListenServer && !Instigator.IsLocallyControlled())) )
	{
		AttachComponent(Mesh);
		EnsureWeaponOverlayComponentLast();
		SetHidden(True);
		bPendingShow = TRUE;
	}
	else
	{
		SetHidden(True);
		if (KFP != None)
		{
			KFP.ArmsMesh.SetHidden(true);
		}
	}

	// Spawn the 3rd Person Attachment
	if (Role == ROLE_Authority && KFP != None)
	{
		KFP.WeaponAttachmentTemplate = AttachmentArchetype;
		if ( WorldInfo.NetMode != NM_DedicatedServer )
		{
			KFP.WeaponAttachmentChanged();
		}
	}
}

/**
 * Detach weapon from skeletal mesh
 *
 * @param	SkeletalMeshComponent weapon is attached to.
 */
simulated function DetachWeapon()
{
	local KFPawn KFP;

	DetachComponent( Mesh );
	if (OverlayMesh != None)
	{
		DetachComponent(OverlayMesh);
	}

	KFP = KFPawn(Instigator);
	if (Role == ROLE_Authority && KFP != None)
	{
		if ( KFP.WeaponAttachmentTemplate == AttachmentArchetype )
		{
			KFP.WeaponAttachmentTemplate = None;
			if ( WorldInfo.NetMode != NM_DedicatedServer )
			{
				KFP.WeaponAttachmentChanged();
			}
		}
	}

	if( KFP != none && KFP.ArmsMesh != none )
	{
		// Detach our arms mesh at the same time as our weapon to avoid them ticking and popping on screen early
		DetachComponent(KFP.ArmsMesh);
	}

	SetBase(None);
	SetHidden(True);
	DetachMuzzleFlash();
	DeactivateFlashlight();
}

/**
 * Remove/Detach the muzzle flash components
 */
simulated function DetachMuzzleFlash()
{
	if (MySkelMesh != none && MuzzleFlash != None)
	{
		MuzzleFlash.DetachMuzzleFlash(MySkelMesh);
		MuzzleFlash = None;
	}
}

simulated function AttachFlashlight()
{
	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
        return;
	}

	if ( MySkelMesh != none && Flashlight == None && bHasFlashlight )
	{
		Flashlight = new(self) Class'KFFlashlightAttachment' (FlashLightTemplate);
		Flashlight.AttachFlashlight(MySkelMesh);
	}
}

simulated function AttachLaserSight()
{
	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
        return;
	}

	if ( MySkelMesh != none && LaserSight == None && bHasLaserSight )
	{
		LaserSight = new(self) Class'KFLaserSightAttachment' (LaserSightTemplate);
		LaserSight.AttachLaserSight(MySkelMesh, true);
	}
}

/** Make sure flashlight is off when weapon is discarded, detached, etc... */
simulated function DeactivateFlashlight()
{
	if ( Flashlight != none && Flashlight.bEnabled && Instigator.IsLocallyControlled() )
	{
		KFPawn_Human(Instigator).SetFlashlight(false);
	}
}

/**
 * Drop this item out in to the world
 */
function DropFrom(vector StartLocation, vector StartVelocity)
{
	local DroppedPickup P;

	// Offset spawn closer to eye location
	StartLocation.Z += Instigator.BaseEyeHeight / 2;

	// for some reason, Inventory::DropFrom removes weapon from inventory whether it was able to spawn the pickup or not.
	// we only want the weapon removed from inventory if pickup was successfully spawned, so instead of calling the supers,
	// do all the super functionality here.

	if( !CanThrow() )
	{
		return;
	}

	if( DroppedPickupClass == None || DroppedPickupMesh == None )
	{
		Destroy();
		return;
	}

	// the last bool param is to prevent collision from preventing spawns
	P = Spawn(DroppedPickupClass,,, StartLocation,,,true);
	if( P == None )
	{
		// if we can't spawn the pickup (likely for collision reasons),
		// just return without removing from inventory or destroying, which removes from inventory
		PlayerController(Instigator.Controller).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_FailedDropInventory );
		return;
	}

	if( Instigator != None && Instigator.InvManager != None )
	{
		Instigator.InvManager.RemoveFromInventory(Self);

		if( Instigator.IsAliveAndWell() && !Instigator.InvManager.bPendingDelete )
		{
			if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayDropWeaponDialog( KFPawn(Instigator) );
		}
	}

	SetupDroppedPickup( P, StartVelocity );

	Instigator = None;
	GotoState('');

	AIController = None;
}

/** Sets up pickup. Allows subclasses to make adjustments (most notably dualbase) */
function SetupDroppedPickup( out DroppedPickup P, vector StartVelocity )
{
	P.SetPhysics(PHYS_Falling);
	P.Inventory	= self;
	P.InventoryClass = class;
	P.Velocity = StartVelocity;
	P.Instigator = Instigator;
	P.SetPickupMesh(DroppedPickupMesh);
	P.SetPickupParticles(DroppedPickupParticles);
}

/** Allows pickup to update weapon properties */
function SetOriginalValuesFromPickup( KFWeapon PickedUpWeapon )
{
	local byte i;
	local KFWeapon KFWInv;

	for (i = 0; i < 2; i++)
	{
		AmmoCount[i] = PickedUpWeapon.AmmoCount[i];
	}

	SpareAmmoCount[0] = PickedUpWeapon.SpareAmmoCount[0];

	// Duals are created when a dropped single is picked up. If this weapon is a single and we already have the dual version,
	// that means we just created the dual from the single. So, since the dual we just created has default ammo, subtract
	// whatever is missing from the single from the dual.
	if( DualClass != none )
	{
		foreach KFInventoryManager(InvManager).InventoryActors( class'KFWeapon', KFWInv )
		{
			if( KFWInv.Class == DualClass )
			{
				KFWInv.AmmoCount[0] -= default.MagazineCapacity[0] - AmmoCount[0];
				KFWInv.AmmoCount[1] -= default.MagazineCapacity[1] - AmmoCount[1];

				KFWInv.SpareAmmoCount[0] -= (default.InitialSpareMags[0] * default.MagazineCapacity[0]) - SpareAmmoCount[0];

				KFWInv.ClientForceAmmoUpdate(KFWInv.AmmoCount[0],KFWInv.SpareAmmoCount[0]);
				KFWInv.ClientForceSecondaryAmmoUpdate(KFWInv.AmmoCount[1]);

				KFWInv.bGivenAtStart = PickedUpWeapon.bGivenAtStart;

				return;
			}
		}
	}

	ClientForceAmmoUpdate( AmmoCount[0],SpareAmmoCount[0] );
	ClientForceSecondaryAmmoUpdate( AmmoCount[1] );

	bGivenAtStart = PickedUpWeapon.bGivenAtStart;
}

/**
 * When you pickup a weapon, the inventory system has a chance to restrict the pickup.
 */
function bool DenyPickupQuery(class<Inventory> ItemClass, Actor Pickup)
{
	if( ItemClass == class )
	{
		// Unless ammo is full, allow the pickup to handle giving ammo
		if( CanRefillSecondaryAmmo() )
		{
            return (SpareAmmoCount[0] >= MaxSpareAmmo[0] && AmmoCount[1] >= MagazineCapacity[1]);
		}
		else
		{
            return (SpareAmmoCount[0] >= MaxSpareAmmo[0]);
		}
	}

	return false;
}

simulated static function bool IsInventoryWeapon()
{
	return default.InventoryGroup == IG_Equipment;
}

simulated static function bool IsMeleeWeapon()
{
	return default.bMeleeWeapon;
}

/**
 * Returns a weight reflecting the desire to use the
 * given weapon, used for AI and player best weapon
 * selection.
 *
 * @return	weapon rating (range -1.f to 1.f)
 *
 * Overridden to use new GroupPriority
 */
simulated function float GetWeaponRating()
{
	if (!Instigator.IsHumanControlled() || !HasAnyAmmo())
	{
		return super.GetWeaponRating();
	}

	return GroupPriority;
}

/*********************************************************************************************
 * @name	Tick/Update
 *********************************************************************************************/

simulated event Tick( float DeltaTime )
{
	if( LaserSight != None )
	{
		LaserSight.Update(DeltaTime, self);
	}
}

/*********************************************************************************************
 * @name	Iron Sights / Zoom
 *********************************************************************************************/

/**
 * Adjust the FOV for the first person weapon and arms.
 */
simulated event SetFOV( float NewFOV )
{
	local KFPawn KFP;

	if ( MySkelMesh != none)
	{
		MySkelMesh.SetFOV(NewFOV);
	}

	if( MuzzleFlash != none )
	{
		MuzzleFlash.SetFOV(NewFOV);
	}

	// if the first person arms are attached to this gun update those too
	KFP = KFPawn(Instigator);
	if( KFP != none && KFP.ArmsMesh.ParentAnimComponent == MySkelMesh )
	{
		if( KFP.ArmsMesh != none )
		{
			KFP.ArmsMesh.SetFOV(NewFOV);
		}
	}

	if( Flashlight != none )
	{
		Flashlight.SetFOV(NewFOV);
	}
}

/**
 * Toggle iron sights aiming
 */
simulated function SetIronSights(bool bNewIronSights)
{
	if ( bUsingSights == bNewIronSights )
	{
		return;
	}

	if ( !Instigator.IsLocallyControlled()  )
	{
		return;
	}

	if( bUsingSights )
	{
		PerformZoom(false);
	}
	else if( AllowIronSights() )
	{
		PerformZoom(true);
	}
}

/**
 * Return true if the weapon can transition to iron sights. Overriden in
 * states where we want to prevent ironsight transitions
 */
simulated function bool AllowIronSights()
{
	if( !bHasIronSights )
	{
		return false;
	}

	return true;
}

/**
 * Enables or disables depth of field as part of the iron sights effect
 */
simulated function EnableIronSightsDoF(bool bEnableDoF)
{
	local KFPlayerController PC;

	// Toggle depth of field
	if(Instigator != none)
	{
		PC = KFPlayerController(Instigator.Controller);
		if(PC != none)
		{
			PC.EnableIronSights(bEnableDoF);
			PC.EnableDepthOfField(bEnableDoF);
		}
	}
}

/**
 * Enables or disables player zoom as part of the iron sights effect
 */
simulated function EnablePlayerZoom(bool bEnableZoom)
{
	local KFPlayerController PC;

	// Toggle depth of field
	if(Instigator != none)
	{
		PC = KFPlayerController(Instigator.Controller);
		if(PC != none)
		{
			if(bEnableZoom)
			{
				PC.StartAutoTargeting();
                PC.HandleTransitionFOV(PlayerIronSightFOV, ZoomTime);
			}
			else
			{
				PC.HandleTransitionFOV(PC.DefaultFOV, ZoomTime);
			}
		}
	}
}

/**
 * Handles the logic of which zoom functions to call based on if
 * we are a client or a server
 *
 * @param bZoomStatus which direction we are zooming
 * @param bAnimateTransition whether or not to blend/animate the ironsight transition
 */
simulated function PerformZoom(bool bZoomStatus, optional bool bAnimateTransition = true)
{
	if( bZoomStatus )
	{
		if( Instigator.Physics == PHYS_Falling )
			return;

		ZoomIn(bAnimateTransition, default.ZoomInTime);

		if( Role < ROLE_Authority)
			ServerZoomIn(bAnimateTransition);
	}
	else
	{
		ZoomOut(bAnimateTransition, default.ZoomOutTime);

		if( Role < ROLE_Authority)
			ServerZoomOut(bAnimateTransition);
	}
}

/**
 * Handles all the functionality for zooming in including
 * setting the parameters for the weapon, pawn, and playercontroller
 *
 * @param bAnimateTransition whether or not to animate this zoom transition
 * @param ZoomTimeToGo how much zoom time is left
 */
simulated function ZoomIn(bool bAnimateTransition, float ZoomTimeToGo)
{
	if( bAnimateTransition )
	{
		ZoomInTime=ZoomTimeToGo;

		// If the zoom out was interrupted, set the parameters for the native code to interpolate the zoom from the proper position
		if( bZoomingOut )
		{
			bZoomingOut=false;
			// Flag so the native code knows the zoom was interupted
			bZoomOutInterrupted=true;
			// Set the zoom time relative to how far along we were when zooming out
			ZoomTime=ZoomInTime - ZoomTime;
			// Let the native code know where/when the zoom was interrupted
			ZoomPartialTime=ZoomTime;
			ZoomStartOffset=PlayerViewOffset;
			ZoomRotStartOffset=ZoomRotInterp;
		}
		else
		{
			ZoomTime=ZoomInTime;
			ZoomStartOffset=PlayerViewOffset;
		}

		// Choose which zoom target to use. If we have a weapon with special sights customize here.
		if( bHasScopePosition && bUsingScopePosition )
		{
			ZoomTargetOffset=ScopePosition;
		}
		else
		{
			ZoomTargetOffset=IronSightPosition;
		}

		if( MySkelMesh != none )
		{
			ZoomWeaponFOVStart=MySkelMesh.FOV;
		}
		else
		{
			ZoomWeaponFOVStart=MeshFOV;
		}

		bZoomingIn=true;
	}

	if( WorldInfo.NetMode != NM_DedicatedServer && Instigator != none )
	{
        EnablePlayerZoom(true);
		EnableIronSightsDoF(true);
	}

	bUsingSights = true;

	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayIronsightsDialog( KFPawn(Instigator) );
}

/**
 * Handles calling the zoom in function on the server
 *
 * @param bAnimateTransition whether or not to animate this zoom transition
 */
reliable server private function ServerZoomIn(bool bAnimateTransition)
{
	ZoomIn(bAnimateTransition, default.ZoomInTime);
}

/**
 * Handles all the functionality for zooming out including
 * setting the parameters for the weapon, pawn, and playercontroller
 *
 * @param bAnimateTransition whether or not to animate this zoom transition
 * @param ZoomTimeToGo how much zoom time is left
 */
simulated function ZoomOut(bool bAnimateTransition, float ZoomTimeToGo)
{
	if( bAnimateTransition )
	{
		ZoomOutTime=ZoomTimeToGo;

		// If the zoom in was interrupted, set the parameters for the native code to interpolate the zoom from the proper position
		if( bZoomingIn )
		{
			bZoomingIn=false;
			// Flag so the native code knows the zoom was interupted
			bZoomInInterrupted=true;
			// Set the zoom time relative to how far along we were when zooming in
			ZoomTime=ZoomOutTime - ZoomTime;
			// Let the native code know where/when the zoom was interrupted
			ZoomPartialTime=ZoomTime;
			ZoomStartOffset=PlayerViewOffset;
			ZoomRotStartOffset=ZoomRotInterp;
		}
		else
		{
			ZoomTime=ZoomOutTime;
			ZoomStartOffset=PlayerViewOffset;
		}
		bZoomingOut=true;
	}
	else
	{
		// do a fast zoomout with no notifies
		bFastZoomOut = true;

		// If the zoom in was interrupted, set the parameters for the native code to interpolate the zoom from the proper position
		if( bZoomingIn )
		{
			bZoomingIn=false;
			// Flag so the native code knows the zoom was interupted
			bZoomInInterrupted=true;
			// Set the zoom time relative to how far along we were when zooming in
			ZoomTime=default.ZoomOutTime - ZoomTime;
			// Let the native code know where/when the zoom was interrupted
			ZoomPartialTime=ZoomTime;
			ZoomStartOffset=PlayerViewOffset;
			ZoomRotStartOffset=ZoomRotInterp;
		}
		else
		{
			ZoomTime=FastZoomOutTime;
			ZoomStartOffset=PlayerViewOffset;
		}
		bZoomingOut=true;

		LastZoomOutTime=WorldInfo.TimeSeconds+ZoomTime;
	}

	// Choose which zoom target to use. If we have a weapon with special sights customize here.
	ZoomTargetOffset=default.PlayerViewOffset;

	if( MySkelMesh != none )
	{
		ZoomWeaponFOVStart=MySkelMesh.FOV;
	}
	else
	{
		ZoomWeaponFOVStart=MeshIronSightFOV;
	}

	if( WorldInfo.NetMode != NM_DedicatedServer && Instigator != none )
	{
		EnableIronSightsDoF(false);
		EnablePlayerZoom(false);
	}

	bUsingSights = false;
}

/**
 * Handles calling the zoom out function on the server
 *
 * @param bAnimateTransition whether or not to animate this zoom transition
 */
reliable server private function ServerZoomOut(bool bAnimateTransition)
{
	ZoomOut(bAnimateTransition, default.ZoomOutTime);
}

/**
 * Called by the native code when the interpolation of the first person weapon to the zoomed position finishes
 */
simulated event OnZoomInFinished()
{
	// Manually trigger anim end event for idles (zooming is a procedural anim)
	OnAnimEnd(none,0.f,0.f);
}

/**
 * Called by the native code when the interpolation of the first person weapon from the zoomed position finishes
 */
simulated event OnZoomOutFinished()
{
	// Manually trigger anim end event for idles (zooming is a procedural anim)
	OnAnimEnd(none,0.f,0.f);
}


/*********************************************************************************************
 * @name	Instigator / movement
 ********************************************************************************************* */


/** If TRUE, Instigator/Owner moves at walking speed when this weapon is equipped */
simulated function bool ShouldOwnerWalk()
{
	return bUsingSights;
}

/** If TRUE, the owner of this weapon is susceptible to grapple attacks */
function bool IsGrappleBlocked(Pawn InstigatedBy)
{
	return FALSE;
}

simulated function SetWeaponSprint(bool bNewSprintStatus)
{
	if ( bNewSprintStatus )
	{
		if ( bUsingSights )
		{
			PerformZoom(false);
		}

		if ( CurrentFireMode < GetPendingFireLength() && PendingFire(CurrentFireMode) )
		{
			StopFire(CurrentFireMode);
		}

		GotoWeaponSprinting();
	}
}

simulated function StopPawnSprint(bool bClearPlayerInput)
{
	local KFPawn KFP;
	local PlayerController PC;
	local KFPlayerInput Input;

	KFP = KFPawn(Instigator);
	if ( KFP != None )
	{
		KFP.SetSprinting(false);

		if ( KFP.IsLocallyControlled() )
		{
			PC = PlayerController(Instigator.Controller);
			if ( PC != none && bClearPlayerInput )
			{
				PC.bRun = 0;
			}

			// always stop ExtendedSprint
			Input = KFPlayerInput(PC.PlayerInput);
			if ( Input != None && Input.bExtendedSprinting )
			{
				PC.bRun = 0;
				Input.bExtendedSprinting = false;
			}
		}
	}
}

simulated function bool AllowSprinting()
{
	return true;
}

simulated function GotoWeaponSprinting();

/** Called by Pawn AdjustDamage */
function AdjustDamage(out int InDamage, class<DamageType> DamageType, Actor DamageCauser);

/** Called by Pawn PlayTakeHitEffects */
simulated function PlayTakeHitEffects(vector HitLocation, Actor DamageCauser);

/*********************************************************************************************
 * @name	Animation
 ********************************************************************************************* */

/**
 * Play the same animation on both the weapon and the arms
 */
simulated function PlayAnimation(name Sequence, optional float fDesiredDuration, optional bool bLoop, optional float BlendInTime=0.1, optional float BlendOutTime=0.0)
{
	if ( Sequence == '' || Instigator == None )
	{
		return;
	}

	if (bLogAnimation) LogInternal("PlayAnimation Sequence="@Sequence@"Length="@fDesiredDuration@"bLoop="@bLoop);

	// Adjust tween node settings before setting the new animation
	if ( Instigator.IsFirstPerson() )
	{
        // Do the blends in the same length of real world time so that things don't
        // end up blending over really long periods of real time and looking wierd - Ramm
        BlendInTime *= WorldInfo.TimeDilation * CustomTimeDilation;
		WeaponAnimSeqNode.SetTweenTime(BlendInTime);
	}

	// Play animation on weapon and arms
	PlayWeaponAnimation(Sequence, fDesiredDuration, bLoop);

	// Go ahead and set up the OnAnimEnd callback in this global, and let the states handle it,
	// otherwise the Active state cuts off any animation that was trying to finish.
	if ( !bLoop )
	{
		if( fDesiredDuration > 0 )
		{
			SetTimer(fDesiredDuration - BlendOutTime,false,nameof(OnAnimEnd));
		}
		else
		{
			SetTimer((MySkelMesh.GetAnimLength(Sequence) * DefaultAnimSpeed) - BlendOutTime,false,nameof(OnAnimEnd));
		}
	}
	else
	{
		ClearTimer(nameof(OnAnimEnd));
	}
}

/** Overriden to use WeaponAnimSeqNode */
simulated function PlayWeaponAnimation(name Sequence, float fDesiredDuration, optional bool bLoop, optional SkeletalMeshComponent SkelMesh)
{
	local float DesiredRate;

	if ( Mesh != none && Instigator != none && WorldInfo.NetMode != NM_DedicatedServer )
	{
		if ( !Mesh.bAttached )
		{
			// The weapon is equipped, attach it to the mesh.
			AttachWeaponTo(Instigator.Mesh);
		}

		if ( WeaponAnimSeqNode != None )
		{
			if (WeaponAnimSeqNode.AnimSeq == None || WeaponAnimSeqNode.AnimSeq.SequenceName != Sequence)
			{
				WeaponAnimSeqNode.SetAnim(Sequence);
			}

			if(fDesiredDuration > 0.0)
			{
				DesiredRate = WeaponAnimSeqNode.AnimSeq.SequenceLength / (fDesiredDuration * WeaponAnimSeqNode.AnimSeq.RateScale);
				WeaponAnimSeqNode.PlayAnim(bLoop, DesiredRate);
			}
			else
			{
				WeaponAnimSeqNode.PlayAnim(bLoop, DefaultAnimSpeed);
			}
		}
	}
}

/** Overridden to look for cached WeaponAnimNodeSequence */
simulated function AnimNodeSequence GetWeaponAnimNodeSeq()
{
	if ( WeaponAnimSeqNode != None )
	{
		return WeaponAnimSeqNode;
	}

	return Super.GetWeaponAnimNodeSeq();
}

/**
 * returns true if this weapon is currently playing any animations
 * TODO: Should probably add checking the hands in here as well, to make sure
 * they don't get out of sync
 */
simulated function bool WeaponIsAnimating()
{
	// Check we have access to mesh and animations
	if( MySkelMesh == none || GetWeaponAnimNodeSeq() == none )
	{
		return false;
	}

	return WeaponAnimSeqNode.bPlaying;
}

/** @see PlayerController:ClientPlayCameraAnim */
function CameraAnimInst PlayCameraAnim( CameraAnim AnimToPlay, optional float Scale=1.f, optional float Rate=1.f,
						optional float BlendInTime, optional float BlendOutTime, optional bool bLoop,
						optional bool bRandomStartTime, optional ECameraAnimPlaySpace Space=CAPS_CameraLocal, optional rotator CustomPlaySpace )
{
	local PlayerController PC;
	local CameraAnimInst AnimInst;

	PC = PlayerController(Instigator.Controller);
	if (PC.PlayerCamera != None)
	{
		AnimInst = PC.PlayerCamera.PlayCameraAnim(AnimToPlay, Rate, Scale, BlendInTime, BlendOutTime, bLoop, bRandomStartTime);
		if (AnimInst != None && Space != CAPS_CameraLocal)
		{
			AnimInst.SetPlaySpace(Space, CustomPlaySpace);
		}
	}

	return AnimInst;
}

/** Return true if this weapon should play the fire last animation for this shoot animation */
simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
	if ( bHasFireLastAnims )
	{
		if( (!bAllowClientAmmoTracking && Role < ROLE_Authority && AmmoCount[GetAmmoType(FireModeNum)] <= 1)
			|| ((bAllowClientAmmoTracking || Role == ROLE_Authority) && AmmoCount[GetAmmoType(FireModeNum)] == 0) )
		{
			return true;
		}
	}

    return false;
}

/** Get name of the animation to play for PlayFireEffects */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	local bool bPlayFireLast;

    bPlayFireLast = ShouldPlayFireLast(FireModeNum);

	// scoped-sight anims
	if( bUsingScopePosition )
	{
		if( bPlayFireLast && FireLastScopedAnim != '' )
        {
            return FireLastScopedAnim;
        }
        else
        {
            return FireScopedAnim;
        }
	}
	// ironsights animations
	else if ( bUsingSights )
	{
		if( bPlayFireLast && FireLastSightedAnim != '' )
        {
            return FireLastSightedAnim;
        }
        else
        {
            return FireSightedAnims[Rand(FireSightedAnims.Length)];
        }
	}
	else
	{
		if( bPlayFireLast && FireLastAnim != '' )
        {
            return FireLastAnim;
        }
        else
        {
            return FireAnim;
        }
	}
}

/** Get name of the animation to play for PlayFireEffects */
simulated function name GetLoopingFireAnim(byte FireModeNum)
{
	// scoped-sight anims
	if( bUsingScopePosition )
	{
		return FireLoopScopedAnim;
	}
	// ironsights animations
	else if ( bUsingSights )
	{
		return FireLoopSightedAnim;
	}

	return FireLoopAnim;
}

/** Get name of the animation to play for PlayFireEffects */
simulated function name GetLoopStartFireAnim(byte FireModeNum)
{
	if ( bUsingSights )
	{
		return FireLoopStartSightedAnim;
	}

	return FireLoopStartAnim;
}

/** Get name of the animation to play for PlayFireEffects */
simulated function name GetLoopEndFireAnim(byte FireModeNum)
{
	if ( bUsingSights )
	{
		return FireLoopEndSightedAnim;
	}

	return FireLoopEndAnim;
}

/** Get name of the animation to play for PlayFireEffects */
simulated function name GetMeleeAnimName(EPawnOctant AtkDir, EMeleeAttackType AtkType)
{
	local int idx;

	if( MeleeAttackAnims.Length > 0 )
	{
		// These are randomely selected, so anim lengths should match!
		idx = Rand(MeleeAttackAnims.Length);
		return MeleeAttackAnims[idx];
	}
}

simulated function AnimNodeSequence GetArmAnimNodeSeq()
{
	local KFPawn P;

	P = KFPawn(Instigator);
	if (P != None && P.ArmsMesh != None)
	{
		return AnimNodeSequence(P.ArmsMesh.Animations);
	}

	return None;
}

/** Locks the bolt bone in place to the open position (Called by animnotify) */
simulated function ANIMNOTIFY_LockBolt()
{
	// only do this if we're out of ammo
	if ( bAllowClientAmmoTracking )
	{
		if ( AmmoCount[0] == 0 )
		{
			EmptyMagBlendNode.SetBlendTarget(1, 0);
		}
	}
	else
	{
		// 'approximately' out of ammo
		if( (Role < ROLE_Authority && AmmoCount[0] <= 1)
			|| (Role == ROLE_Authority && AmmoCount[0] == 0) )
		{
			EmptyMagBlendNode.SetBlendTarget(1, 0);
		}
	}
}

/** Unlocks the bolt bone (Called by animnotify) */
simulated function ANIMNOTIFY_UnLockBolt()
{
	bCheckBoltLockPostReload = true;
	EmptyMagBlendNode.SetBlendTarget(0, 0);
}

/** Turn on/off additive blend node used for movement */
simulated function ToggleAdditiveBobAnim(bool bOn, optional float BlendTime=0.1f)
{
	if ( IdleBobBlendNode != None )
	{
		IdleBobBlendNode.SetBlendTarget((bOn && bUseAdditiveMoveAnim) ? 1.f : 0.f, BlendTime);
	}
}

/** Check AmmoCount and update anim tree nodes if needed */
simulated function UpdateOutOfAmmoEffects(float BlendTime)
{
	if ( WorldInfo.NetMode == NM_DedicatedServer )
		return;

	if( EmptyMagBlendNode != None )
	{
		// For now just update the lock to fix edge case with newly picked up weapon until 
		// AnimNotify system is completely removed.  Only supported for client-side ammo
		if ( bAllowClientAmmoTracking && AmmoCount[0] == 0 )
		{
			EmptyMagBlendNode.SetBlendTarget(1, 0);
		}
	}
}

/*********************************************************************************************
 * @name	1st person positioning
********************************************************************************************* */

native final function bool GetAnimSeqCameraPosition(out vector OutPos, out rotator OutRot);

/**
 * This function aligns the gun model in the world
 */
simulated event SetPosition(KFPawn Holder)
{
	local vector DrawOffset, ViewOffset,  FinalLocation;
	local rotator NewRotation, FinalRotation, SpecRotation;
	local PlayerController PC;
	local vector SpecViewLoc;
	local Rotator DebugRotationOffset;
	local rotator UsedBufferRotation;
	local vector CamLoc;
	local rotator CamRot;

	if ( !Holder.IsFirstPerson() && !bWeaponNeedsServerPosition )
		return;

	// Hide the weapon if hidden
	if ( bForceHidden )
	{
		Mesh.SetHidden(True);
		Holder.ArmsMesh.SetHidden(true);
		NewRotation = Holder.GetViewRotation();
		SetLocation(Instigator.GetPawnViewLocation() + (HiddenWeaponsOffset >> NewRotation));
		SetRotation(NewRotation);
		SetBase(Instigator);
		return;
	}

	if(bPendingShow)
	{
		SetHidden(False);
		bPendingShow = FALSE;
	}

	Mesh.SetHidden(False);

	// Find the local player controller
	PC = GetALocalPlayerController();

	// Adjust for the current hand
	ViewOffset = PlayerViewOffset;

	// TODO: Ramm - look at this offset value and see if we like it
	if (class'Engine'.static.IsRealDStereoEnabled())
	{
		ViewOffset.X -= 30;
	}

	// Calculate the draw offset for Recorded Demo Specator
	if ( Holder.Controller == None && KFDemoRecSpectator(PC) != None)
	{
		PC.GetPlayerViewPoint(SpecViewLoc, SpecRotation);
		DrawOffset = ViewOffset >> SpecRotation;
		DrawOffset += Holder.WeaponBob(BobDamping, JumpDamping);
		FinalLocation = SpecViewLoc + DrawOffset;
		SetLocation(FinalLocation);
		SetBase(Holder);

		SetRotation(SpecRotation);
		return;
	}

	// Calculate weapon rotation
	NewRotation = (Holder.Controller == None) ? Holder.GetBaseAimRotation() : Holder.Controller.Rotation;

	// Add in any rotation from the zoom in rotation interpolation
	NewRotation += ZoomRotInterp;

	// Rotation local space offsets
	// Add in the free-aim rotation
	if ( KFPlayerController(Holder.Controller) != None )
	{
		if( bDebugRecoilPosition )
		{
			DebugRotationOffset.Pitch = RecoilISMaxPitchLimit;
			KFPlayerController(Holder.Controller).WeaponBufferRotation = DebugRotationOffset;
		}

		// Scale the rendered Buffer rotation by the FOV compensation scale
		if( KFPlayerController(Holder.Controller).WeaponBufferRotation.Pitch < 32768 )
		{
            UsedBufferRotation.Pitch = KFPlayerController(Holder.Controller).WeaponBufferRotation.Pitch/IronSightMeshFOVCompensationScale;
        }
        else
        {
            UsedBufferRotation.Pitch = 65535 - ((65535 - KFPlayerController(Holder.Controller).WeaponBufferRotation.Pitch)/IronSightMeshFOVCompensationScale);
        }

        if( KFPlayerController(Holder.Controller).WeaponBufferRotation.Yaw < 32768 )
        {
            UsedBufferRotation.Yaw = KFPlayerController(Holder.Controller).WeaponBufferRotation.Yaw/IronSightMeshFOVCompensationScale;
        }
        else
        {
            UsedBufferRotation.Yaw = 65535 - ((65535 - KFPlayerController(Holder.Controller).WeaponBufferRotation.Yaw) / IronSightMeshFOVCompensationScale);
        }

		NewRotation += UsedBufferRotation;
	}

	// Add in offset from camera animation
	if ( bFollowAnimSeqCamera && GetAnimSeqCameraPosition(CamLoc, CamRot) )
	{
		ViewOffset += CamLoc;
		NewRotation += CamRot;
	}

	FinalRotation = NewRotation;

	// Calculate the draw offset
	DrawOffset.Z += Holder.GetEyeHeight();
	DrawOffset += Holder.WeaponBob(BobDamping, JumpDamping);
	DrawOffset += (WeaponLag + ViewOffset) >> FinalRotation;

	// Adjust it in the world
	FinalLocation = Holder.Location + DrawOffset;

	SetLocation(FinalLocation);
	SetRotation(FinalRotation);
	SetBase(Holder);
}

/**
 * This function is called from the pawn when the visibility of the weapon changes
 */
simulated function ChangeVisibility(bool bIsVisible)
{
	local KFPawn KFP;
	local SkeletalMeshComponent SkelMesh;
	local PrimitiveComponent Primitive;

	if (Mesh != None)
	{
		if (bIsVisible && !Mesh.bAttached)
		{
			AttachComponent(Mesh);
			EnsureWeaponOverlayComponentLast();
			// if the mesh isn't attached, we skipped playing the idle anim so play it now
			PlayIdleAnim();
		}
		SetHidden(!bIsVisible);
		SkelMesh = SkeletalMeshComponent(Mesh);
		if (SkelMesh != None)
		{
			foreach SkelMesh.AttachedComponents(class'PrimitiveComponent', Primitive)
			{
				Primitive.SetHidden(!bIsVisible);
			}
		}
	}

	KFP = KFPawn(Instigator);
	if (KFP != None && KFP.ArmsMesh != None)
	{
		if( bIsVisible )
		{
			AttachComponent(KFP.ArmsMesh);
		}
		else
		{
			DetachComponent(KFP.ArmsMesh);
		}
		KFP.ArmsMesh.SetHidden(!bIsVisible);
	}

	if ( OverlayMesh != none )
	{
		OverlayMesh.SetHidden(!bIsVisible);
	}
}

/*********************************************************************************************
 * @name	Effects
********************************************************************************************* */

/**
 * PlayFireEffects Is the root function that handles all of the effects associated with
 * a weapon.  This function creates the 1st person effects.  It should only be called
 * on a locally controlled player.
 */
simulated function PlayFireEffects( byte FireModeNum, optional vector HitLocation )
{
	local name WeaponFireAnimName;

	// If we have stopped the looping fire sound to play single fire sounds for zed time
	// start the looping sound back up again when the time is back above zed time speed
	if( FireModeNum < bLoopingFireSnd.Length && bLoopingFireSnd[FireModeNum] && !bPlayingLoopingFireSnd )
    {
        StartLoopingFireSound(FireModeNum);
    }

	PlayFiringSound(CurrentFireMode);

	if( Instigator != none && Instigator.IsFirstPerson() )
	{
	    if ( !bPlayingLoopingFireAnim )
	    {
		    WeaponFireAnimName = GetWeaponFireAnim(FireModeNum);

		    if ( WeaponFireAnimName != '' )
		    {
			    PlayAnimation(WeaponFireAnimName, MySkelMesh.GetAnimLength(WeaponFireAnimName),,FireTweenTime);
		    }
	    }

		HandleRecoil();

	    ShakeView();

	    // Start muzzle flash effect
	    CauseMuzzleFlash(FireModeNum);
	}
}

simulated function StopFireEffects(byte FireModeNum)
{
	if (MuzzleFlash != None)
	{
        MuzzleFlash.StopMuzzleFlash();
	}
}

/**
 * Starts playing looping FireAnim and FireSnd
 */
simulated function StartLoopingFireEffects(byte FireModeNum, optional bool bForceAnim)
{
	local name WeaponFireAnimName;

	if ( bForceAnim || (FireModeNum < bLoopingFireAnim.Length && bLoopingFireAnim[FireModeNum]) )
	{
		// If available, try to play loop start anim
		WeaponFireAnimName = GetLoopStartFireAnim(FireModeNum);
		if ( WeaponFireAnimName != '' )
		{
			PlayAnimation(WeaponFireAnimName, MySkelMesh.GetAnimLength(WeaponFireAnimName), FALSE, FireTweenTime, 0.f);
		}
		// Otherwise go straight to the looping animation
		else
		{
			WeaponFireAnimName = GetLoopingFireAnim(FireModeNum);
			PlayAnimation(WeaponFireAnimName, MySkelMesh.GetAnimLength(WeaponFireAnimName), TRUE, FireTweenTime);
		}

		bPlayingLoopingFireAnim = true;
	}

	StartLoopingFireSound(FireModeNum);
}

/**
 * Stops playing looping FireAnim and FireSnd
 */
simulated function StopLoopingFireEffects(byte FireModeNum)
{
	local name LoopEndFireAnim;

	if ( bPlayingLoopingFireAnim )
	{
		LoopEndFireAnim = GetLoopEndFireAnim(FireModeNum);
		if ( LoopEndFireAnim != '' )
		{
			PlayAnimation(LoopEndFireAnim, MySkelMesh.GetAnimLength(LoopEndFireAnim));
		}
		else
		{
			ClearTimer(nameof(OnAnimEnd));	// needed for loopstart anim to return to idle
		}
		bPlayingLoopingFireAnim = false;
	}

	StopLoopingFireSound( FireModeNum );
}

/** True if we want to override the looping fire sounds with fire sounds from another firemode */
simulated function bool ShouldForceSingleFireSound()
{
	// If this weapon has a single-shot firemode, disable looping fire sounds during zedtime
	if ( (self.WorldInfo.TimeDilation < 1.f) && SingleFireMode != FIREMODE_None )
	{
		return true;
	}

	return false;
}

/**
 * Starts playing looping FireSnd only (used for switching sounds in Zedtime)
 */
simulated function StartLoopingFireSound(byte FireModeNum)
{
	if ( FireModeNum < bLoopingFireSnd.Length && bLoopingFireSnd[FireModeNum] && !ShouldForceSingleFireSound() )
	{
		bPlayingLoopingFireSnd = true;
		KFPawn(Instigator).SetWeaponAmbientSound(WeaponFireSnd[FireModeNum].DefaultCue, WeaponFireSnd[FireModeNum].FirstPersonCue);
	}
}

/**
 * Stops playing looping FireSnd only (used for switching sounds in Zedtime)
 */
simulated function StopLoopingFireSound(byte FireModeNum)
{
	if ( bPlayingLoopingFireSnd )
	{
		KFPawn(Instigator).SetWeaponAmbientSound(None);
		if ( FireModeNum < WeaponFireLoopEndSnd.Length )
		{
			WeaponPlayFireSound(WeaponFireLoopEndSnd[FireModeNum].DefaultCue, WeaponFireLoopEndSnd[FireModeNum].FirstPersonCue);
		}

		bPlayingLoopingFireSnd = false;
	}
}

/**
 * Tells the weapon to play a firing sound (uses CurrentFireMode)
 */
simulated function PlayFiringSound( byte FireModeNum )
{
    local byte UsedFireModeNum;

	MakeNoise(1.0,'PlayerFiring'); // AI

	if ( !bPlayingLoopingFireSnd )
	{
		UsedFireModeNum = FireModeNum;

		// Use the single fire sound if we're in zed time and want to play single fire sounds
		if( FireModeNum < bLoopingFireSnd.Length && bLoopingFireSnd[FireModeNum] && ShouldForceSingleFireSound() )
        {
            UsedFireModeNum = SingleFireMode;
        }

        if ( UsedFireModeNum < WeaponFireSnd.Length )
		{
			WeaponPlayFireSound(WeaponFireSnd[UsedFireModeNum].DefaultCue, WeaponFireSnd[UsedFireModeNum].FirstPersonCue);
		}
	}
}

/**
 * This function selects whether we should play a first person or third person sound
 */
simulated function WeaponPlayFireSound(AkBaseSoundObject DefaultSound, AkBaseSoundObject FirstPersonSound)
{
    // ReplicateSound needs an "out" vector
    local vector SoundLocation;

	if( Instigator != None && !bSuppressSounds  )
	{
		// With our WWise integration, SoundLocation can't be same as Instigator location (or whatever
        // object calls PlaySoundBase/ReplicateSound) otherwise it gets set to 0 in native in
        // APlayerController::HearSound and attaches the sound to the instigator and the sound will
        // follow the the actor around. For now sing the eye location to solve this issue.
        SoundLocation = Instigator.GetPawnViewLocation();

		if ( FirstPersonSound != None && Instigator.IsLocallyControlled() && Instigator.IsFirstPerson() )
		{
            Instigator.PlaySoundBase( FirstPersonSound, true, false, false );

            // Play first person, but replicate third person
			if ( WorldInfo.NetMode == NM_ListenServer )
			{
                KFPawn(Instigator).ReplicateSound(DefaultSound, false, false, false, SoundLocation);
			}
		}
		else if ( DefaultSound != None )
		{
            Instigator.PlaySoundBase( DefaultSound, false, true, false, SoundLocation );
		}
	}
}

/**
 * This function handles playing sounds for weapons.  How it plays the sound depends on the following:
 *
 * If we are a listen server, then this sound is played and replicated as normal
 * If we are a remote client, but locally controlled (ie: we are on the client) we play the sound and don't replicate it
 * If we are a dedicated server, play the sound and replicate it to everyone BUT the owner (he will play it locally).
 *
 *
 * @param	Sound	- The Source to play
 */
simulated function WeaponPlaySound(AkBaseSoundObject Sound, optional float NoiseLoudness)
{
	// if we are a listen server, just play the sound.  It will play locally
	// and be replicated to all other clients.
	if( Sound != None && Instigator != None && !bSuppressSounds  )
	{
	    Instigator.PlaySoundBase(Sound, false, true);
	}
}

/**
 * Causes the muzzle flash to turn on and setup a time to
 * turn it back off again.
 */
simulated function CauseMuzzleFlash(byte FireModeNum)
{
	if (MuzzleFlash == None)
	{
		AttachMuzzleFlash();
	}

	if (MuzzleFlash != None )
	{
		MuzzleFlash.CauseMuzzleFlash(FireModeNum);
		if ( MuzzleFlash.bAutoActivateShellEject )
		{
			MuzzleFlash.CauseShellEject();
		}
	}
}

/** notify to spawn a shell eject from the muzzle flash component */
simulated function ANIMNOTIFY_ShellEject()
{
	if (MuzzleFlash == None)
	{
		AttachMuzzleFlash();
	}

	if (MuzzleFlash != None )
	{
		MuzzleFlash.CauseShellEject();
	}
}

/**
 * Called on a client, this function Attaches the WeaponAttachment
 * to the Mesh.
 */
simulated function AttachMuzzleFlash()
{
	if ( MySkelMesh != none )
	{
		if (MuzzleFlashTemplate != None)
		{
			MuzzleFlash = new(self) Class'KFMuzzleFlash'(MuzzleFlashTemplate);
			MuzzleFlash.AttachMuzzleFlash(MySkelMesh);
		}
	}
}

/** plays view shake on the owning client only */
simulated function ShakeView()
{
	local PlayerController PC;
	local float ShakeViewScale;

	PC = PlayerController(Instigator.Controller);
	if( PC == None || LocalPlayer(PC.Player) == None )
	{
		return;
	}

	// Play camera shake/anim
	if (CurrentFireMode < FireCameraAnim.length && FireCameraAnim[CurrentFireMode] != None)
	{
		ShakeViewScale = ShakeScaleStandard;
		if( bUsingSights )
		{
			ShakeViewScale *= ShakeScaleSighted;
		}

		// Use a CameraAnim for now, but consider CameraShake with bRandomAnimSegment
		PC.ClientPlayCameraAnim(FireCameraAnim[CurrentFireMode], ShakeViewScale, 1.f, 0.0f, 0.1f);
	}

	// Play controller vibration
	PC.ClientPlayForceFeedbackWaveform( WeaponFireWaveForm );
}

/** Increment bloody material parameter */
simulated function AddBlood(float MinAmount, float MaxAmount)
{
	local float NewBlood;

	if ( WorldInfo.NetMode != NM_DedicatedServer && WeaponMIC != None )
	{
		NewBlood = RandRange(MinAmount, MaxAmount);
		BloodParamValue = FMax(BloodParamValue + NewBlood, MinBloodParamValue);
		WeaponMIC.SetScalarParameterValue(BloodParamName, BloodParamValue);
	}
}

/*********************************************************************************************
 * @name	Firing / Projectile
********************************************************************************************* */

/**
 * @see Weapon::StartFire
 */
simulated function StartFire(byte FireModeNum)
{
	// Attempt auto-reload
	if( FireModeNum == DEFAULT_FIREMODE || FireModeNum == ALTFIRE_FIREMODE )
	{
		if ( ShouldAutoReload(FireModeNum) )
		{
			FireModeNum = RELOAD_FIREMODE;
		}
	}

	// Convert to altfire if we have alt fire mode active
	if ( FireModeNum == DEFAULT_FIREMODE && bUseAltFireMode )
	{
		FireModeNum = ALTFIRE_FIREMODE;
	}

	if ( FireModeNum == RELOAD_FIREMODE )
	{
		// Skip Super/ ServerStartFire and let server wait for ServerSendToReload to force state synchronization
		BeginFire(FireModeNum);
		return;
	}

	Super.StartFire(FireModeNum);
}

/**
 * @see Weapon::StopFire
 */
simulated function StopFire(byte FireModeNum)
{
	// Convert to altfire if we have alt fire mode active
	if ( FireModeNum == DEFAULT_FIREMODE && bUseAltFireMode )
	{
		FireModeNum = ALTFIRE_FIREMODE;
	}

	Super.StopFire(FireModeNum);
}

/**
 * Toggle between DEFAULT and ALTFIRE
 */
simulated function AltFireMode()
{
	// LocalPlayer Only
	if ( !Instigator.IsLocallyControlled()  )
	{
		return;
	}

	// Needs a state name, and a valid fire type to switch to alt fire mode
	if( FiringStatesArray[1] == '' || WeaponFireTypes[1] == EWFT_None )
	{
		return;
	}

	if( bUseAltFireMode )
	{
		// Clear fire now since StopFire will now be converted to default fire
		StopFire(ALTFIRE_FIREMODE);
		bUseAltFireMode = false;
	}
	else
	{
		// Clear fire now since StopFire will now be converted to alt fire
		StopFire(DEFAULT_FIREMODE);
		bUseAltFireMode = true;
	}

	Instigator.PlaySoundBase( KFInventoryManager(InvManager).SwitchFireModeEvent );
}

/** Player released switch fire mode button */
simulated function AltFireModeRelease()
{
	// Weapons that call StartFire() in SwitchFireMode() need to also call StopFire()
	// For most weapons this is unnecessary, but harmless
	if ( PendingFire(ALTFIRE_FIREMODE) )
	{
		StopFire(ALTFIRE_FIREMODE);
	}
}

 /**
 * Send weapon to proper firing state
 * Also sets the CurrentFireMode.
 * Network: LocalPlayer and Server
 *
 * @param	FireModeNum Fire Mode.
 */
simulated function SendToFiringState(byte FireModeNum)
{
    if( FireModeNum == GRENADE_FIREMODE && !GetPerk().GetGrenadeClass().default.bAllowTossDuringZedGrabRotation )
    {
		// Don't let us toss a grenade right after being grabbed and spun
		// so we don't blow ourselves up.
        if( (WorldInfo.TimeSeconds - ZedGrabGrenadeTossCooldown) < 0 )
		{
            //`log("Can't toss a nade because just got grabbed!!! Cooldown: "$`TimeSince(ZedGrabGrenadeTossCooldown));
            return;
		}
    }

	// Custom reload handling for better ammo synchronization
	if ( FireModeNum == RELOAD_FIREMODE && Instigator.IsLocallyControlled() )
	{
		InitializeReload();
	}

    super.SendToFiringState(FireModeNum);
}

/**
 * This function returns the world location for spawning the visual effects
 * Overridden to only use the X portion of the offset when we are  in ironsights
 */
simulated event vector GetMuzzleLoc()
{
    local vector X, Y, Z;
    local Rotator ViewRotation;

	if( Instigator != none )
	{
        if( bUsingSights )
        {
            ViewRotation = Instigator.GetViewRotation();

        	// Add in the free-aim rotation
        	if ( KFPlayerController(Instigator.Controller) != None )
        	{
        		ViewRotation += KFPlayerController(Instigator.Controller).WeaponBufferRotation;
        	}

            GetAxes(ViewRotation, X, Y, Z);

            return Instigator.GetWeaponStartTraceLocation() + X * FireOffset.X;
		}
		else
		{
            ViewRotation = Instigator.GetViewRotation();

        	// Add in the free-aim rotation
        	if ( KFPlayerController(Instigator.Controller) != None )
        	{
        		ViewRotation += KFPlayerController(Instigator.Controller).WeaponBufferRotation;
        	}

            return Instigator.GetPawnViewLocation() + (FireOffset >> ViewRotation);
		}

	}

	return Location;
}

/** returns ID of muzzle to spawn projectile at / play effects at (overridden in dual) */
simulated function byte GetCurrentMuzzleID()
{
	return 0;
}

/**
 * FireAmmunition: Perform all logic associated with firing a shot
 * - Fires ammunition (instant hit or spawn projectile)
 * - Consumes ammunition
 * - Plays any associated effects (fire sound and whatnot)
 *
 * Network: LocalPlayer and Server
 */
simulated function FireAmmunition()
{
	// Handle the different fire types
	switch( WeaponFireTypes[CurrentFireMode] )
	{
		case EWFT_InstantHit:
            // Launch a projectile if we are in zed time, and this weapon has a projectile to launch for this mode
            if( (self.WorldInfo.TimeDilation < 1.f) && WeaponProjectiles[CurrentFireMode] != none )
            {
                ProjectileFire();
            }
            else
            {
                InstantFireClient();
            }
			break;

		case EWFT_Projectile:
			ProjectileFire();
			break;

		case EWFT_Custom:
			CustomFire();
			break;
	}

	// Decrement Ammo.  Called after Fire() for weapons that can fire a variable ammo amount (e.g. nail shotgun)
	ConsumeAmmo( CurrentFireMode );

	NotifyWeaponFired( CurrentFireMode );

	// Play fire effects now (don't wait for WeaponFired to replicate)
	PlayFireEffects(CurrentFireMode, vect(0,0,0));
}

/**
 * CalcWeaponFire: Simulate an instant hit shot.
 * This doesn't deal any damage nor trigger any effect. It just simulates a shot and returns
 * the hit information, to be post-processed later.
*/
simulated function ImpactInfo CalcWeaponFire(vector StartTrace, vector EndTrace, optional out array<ImpactInfo> ImpactList, optional vector Extent)
{
	local ImpactInfo CurrentImpact;

	CurrentImpact = Super.CalcWeaponFire(StartTrace, EndTrace, ImpactList, Extent);

	// When recursion is finished (CurrentImpact == ImpactList[0]) find hit zones
	if ( CurrentImpact.HitLocation == ImpactList[0].HitLocation )
	{
		TraceImpactHitZones(StartTrace, EndTrace, ImpactList);
		return ImpactList[0];
	}

	return CurrentImpact;
}

/** Replaces ImpactInfo entries with hit zone information */
simulated function TraceImpactHitZones(vector StartTrace, vector EndTrace, out array<ImpactInfo> ImpactList)
{
	local int i;
	local array<ImpactInfo> HitZoneImpactList;

	for (i = 0; i < ImpactList.Length; i++)
	{
		if ( ImpactList[i].HitActor != None && ImpactList[i].HitActor.IsA('KFPawn') )
		{
			// Getting the SkelMeshComp here requires (BlockZeroExtent && CollideActors && !Cylinder.BlockZeroExtent)
			TraceAllPhysicsAssetInteractions(SkeletalMeshComponent(ImpactList[i].HitInfo.HitComponent), EndTrace, StartTrace, HitZoneImpactList, vect(0,0,0), true);

			// replace impact entry with the first hitzone impact
			if ( HitZoneImpactList.Length > 0 )
			{
				HitZoneImpactList[0].RayDir = ImpactList[i].RayDir;
				ImpactList[i] = HitZoneImpactList[0];
			}
			else
			{
				// Hit the Mesh, but missed all hit zones.  Handle in KFPawn.AdjustDamage().
			}
		}
	}
}

/** handles pawn penetration (why was this function static?) */
simulated function bool PassThroughDamage(Actor HitActor)
{
    local KFPawn KFP;

    KFP = KFPawn(HitActor);
	if ( PenetrationPowerRemaining > 0 && KFP != none )
	{
		PenetrationPowerRemaining -= KFP.PenetrationResistance;
		return true;
	}

	return (!HitActor.bBlockActors && (HitActor.IsA('Trigger') || HitActor.IsA('TriggerVolume')))
		|| HitActor.IsA('InteractiveFoliageActor');
}

/**
 * Adds any fire spread offset to the passed in rotator
 * Overridden for KF Spread modifiers
 * @param Aim the base aim direction
 * @return the adjusted aim direction
 */
simulated function rotator AddSpread(rotator BaseAim)
{
	local vector X, Y, Z;
	local float CurrentSpread, RandY, RandZ;

	if ( CurrentFireMode >= Spread.Length )
	{
		return BaseAim;
	}

	CurrentSpread = Spread[CurrentFireMode];

	if( bUsingSights )
	{
		CurrentSpread *= IronSightsSpreadMod;
	}
	else if( MovingSpreadMod > 1.0 && VSizeSq(Instigator.Velocity) > 0 )
	{
		CurrentSpread *= MovingSpreadMod;
	}

	if( Instigator.bIsCrouched )
	{
		CurrentSpread *= CrouchSpreadMod;
	}

	if (CurrentSpread == 0)
	{
		return BaseAim;
	}
	else
	{
		// There might be a perk active that reduces the spread
		if ( GetPerk() != none )
		{
			GetPerk().ModifySpread(CurrentSpread);
		}

		// Add in any spread.
		GetAxes(BaseAim, X, Y, Z);
		RandY = FRand() - 0.5;
		RandZ = Sqrt(0.5 - Square(RandY)) * (FRand() - 0.5);
		return rotator(X + RandY * CurrentSpread * Y + RandZ * CurrentSpread * Z);
	}
}

// Overridden if we want to add recoild modifiers
simulated function ModifyRecoil( out float CurrentRecoilModifier )
{
	GetPerk().ModifyRecoil(CurrentRecoilModifier);
}

/**
 * Called on the client when the weapon is fired calculate the recoil parameters
 * Network: LocalPlayer
 */
simulated event HandleRecoil()
{
	local rotator NewRecoilRotation;
	local float CurrentRecoilModifier;

	local KFPawn KFP;

	if ( Instigator == none  || !Instigator.IsFirstPerson() )
	{
		return;
	}

	CurrentRecoilModifier = 1.0;

	NewRecoilRotation.Pitch = RandRange( minRecoilPitch, maxRecoilPitch );
	NewRecoilRotation.Yaw = RandRange( minRecoilYaw, maxRecoilYaw );

	if ( Instigator.Physics == PHYS_Falling )
	{
		CurrentRecoilModifier *= FallingRecoilModifier;
	}

	// Handle weapon posture recoil modifiers
	KFP = KFPawn(Instigator);
	if ( KFP != none  )
	{
		if( VSizeSq(Instigator.Velocity) > 50 )
		{
			if( Instigator.bIsWalking )
			{
				CurrentRecoilModifier *= WalkingRecoilModifier;
			}
			else
			{
				CurrentRecoilModifier *= JoggingRecoilModifier;
			}
		}
		if ( Instigator.bIsCrouched )
		{
			CurrentRecoilModifier *= StanceCrouchedRecoilModifier;
		}

		if( !bUsingSights )
		{
			CurrentRecoilModifier *= HippedRecoilModifier;
		}
	}

	// Add any additional recoil mods for children
	ModifyRecoil( CurrentRecoilModifier );

	NewRecoilRotation *= CurrentRecoilModifier;
    LastRecoilModifier = CurrentRecoilModifier;

	// Need to set this value per weapon
	SetRecoil(NewRecoilRotation,RecoilRate);
}

/**
 * Called on the client to set new recoil parameters to be processed
 * Network: LocalPlayer
 *
 * @param	NewRecoilRotation	The new recoil rotation to add
 * @param	NewRecoilSpeed		How long it should take to process this recoil
 */
simulated function SetRecoil(rotator NewRecoilRotation, float NewRecoilSpeed)
{
	local float UsedRecoilScale;

	// If we haven't process all the recoil from the previous fire, scale down the
	// recoil rotator by how much recoil is left before adding in new recoil
	if( RecoilTimeLeft > 0 )
	{
		UsedRecoilScale = RecoilTimeLeft/RecoilSpeed;
	}
	else
	{
		UsedRecoilScale = 0.0;
	}

	RecoilRotator *= UsedRecoilScale;
	RecoilRotator += NewRecoilRotation;

	RecoilSpeed = NewRecoilSpeed;
	RecoilTimeLeft = NewRecoilSpeed;
}

/**
 * Returns the type of projectile to spawn.  We use a function so subclasses can
 * override it if needed (case in point, homing rockets).
 * Overriden to be simulated so the client can get the projectile class
 */
simulated function class<KFProjectile> GetKFProjectileClass()
{
	if( CurrentFireMode == GRENADE_FIREMODE )
	{
		return GetPerk().GetGrenadeClass();
	}
	else
	{
		return (CurrentFireMode < WeaponProjectiles.length) ? class<KFProjectile>( WeaponProjectiles[CurrentFireMode] ) : None;
	}
}

/**
 * Fires a projectile.
 * Spawns the projectile, but also increment the flash count for remote client effects.
 * Network: Local Player and Server
 * Overriden to add maximum aim adjustment
 */
 simulated function Projectile ProjectileFire()
{
	local vector		StartTrace, EndTrace, RealStartLoc, AimDir;
	local ImpactInfo	TestImpact;
	local vector DirA, DirB;
	local Quat Q;
	local class<KFProjectile> MyProjectileClass;

	// tell remote clients that we fired, to trigger effects
	if ( ShouldIncrementFlashCountOnFire() )
	{
		IncrementFlashCount();
	}

    MyProjectileClass = GetKFProjectileClass();

	if( Role == ROLE_Authority || (MyProjectileClass.default.bUseClientSideHitDetection
        && MyProjectileClass.default.bNoReplicationToInstigator && Instigator != none
        && Instigator.IsLocallyControlled()) )
	{
		// This is where we would start an instant trace. (what CalcWeaponFire uses)
		StartTrace = GetSafeStartTraceLocation();
		AimDir = Vector(GetAdjustedAim( StartTrace ));

		// this is the location where the projectile is spawned.
		RealStartLoc = GetPhysicalFireStartLoc(AimDir);

		if( StartTrace != RealStartLoc )
		{
			// if projectile is spawned at different location of crosshair,
			// then simulate an instant trace where crosshair is aiming at, Get hit info.
			EndTrace = StartTrace + AimDir * GetTraceRange();
			TestImpact = CalcWeaponFire( StartTrace, EndTrace );
			// Store the original aim direction without correction
            DirB = AimDir;

			// Then we realign projectile aim direction to match where the crosshair did hit.
			AimDir = Normal(TestImpact.HitLocation - RealStartLoc);

            // Store the desired corrected aim direction
    		DirA = AimDir;

    		// Clamp the maximum aim adjustment for the AimDir so you don't get wierd
    		// cases where the projectiles velocity is going WAY off of where you
    		// are aiming. This can happen if you are really close to what you are
    		// shooting - Ramm
    		if ( (DirA dot DirB) < MaxAimAdjust_Cos )
    		{
    			Q = QuatFromAxisAndAngle(Normal(DirB cross DirA), MaxAimAdjust_Angle);
    			AimDir = QuatRotateVector(Q,DirB);
    		}
		}

		return SpawnProjectile(MyProjectileClass, RealStartLoc, AimDir);
	}

	return None;
}

/** Called from ProjectileFire() */
simulated function bool ShouldIncrementFlashCountOnFire()
{
	return CurrentFireMode != GRENADE_FIREMODE;
}

simulated function KFProjectile SpawnProjectile( class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir )
{
	local KFProjectile	SpawnedProjectile;
	local int ProjDamage;

	// Spawn projectile
	SpawnedProjectile = Spawn( KFProjClass, Self,, RealStartLoc);
	if( SpawnedProjectile != none && !SpawnedProjectile.bDeleteMe )
	{
		// Mirror damage and damage type from weapon. This is set on the server only and
		// these properties are replicated via TakeHitInfo
		if ( InstantHitDamage.Length > CurrentFireMode && InstantHitDamageTypes.Length > CurrentFireMode )
		{
            ProjDamage = InstantHitDamage[CurrentFireMode];
            SpawnedProjectile.Damage = ProjDamage;
            SpawnedProjectile.MyDamageType = InstantHitDamageTypes[CurrentFireMode];
		}

		// Set the penetration power for this projectile
        if( SpawnedProjectile != none )
        {
			// because of clientside hit detection, we need two variables --
			// one that replicates on init and one that updates but doesn't replicate
        	SpawnedProjectile.InitialPenetrationPower = GetInitialPenetrationPower(CurrentFireMode);
			SpawnedProjectile.PenetrationPower = SpawnedProjectile.InitialPenetrationPower;
        }

		SpawnedProjectile.Init( AimDir );
	}

	// return it up the line
	return SpawnedProjectile;
}

/**
 * Get the starting penetration power for this FiringMode
 * @param FiringMode: The FiringMode to get penetration power for
 */
simulated event float GetInitialPenetrationPower(byte FiringMode)
{
	local KFPerk InstigatorPerk;
	local float UsedPenetrationPower;
	local KFPlayerController KFPC;

	// Set the initial penetration power for this shot
	if ( PenetrationPower.Length > FiringMode && PenetrationPower[FiringMode] > 0 )
    {
        UsedPenetrationPower = default.PenetrationPower[FiringMode];
    }

	InstigatorPerk = GetPerk();

    // Add in any extra penetration power from the perk
    if ( InstigatorPerk != none && InstantHitDamageTypes.Length > FiringMode && Instigator != none)
    {
    	KFPC = KFPlayerController(Instigator.Controller);
    	if(KFPC != none)
    	{
    		UsedPenetrationPower += InstigatorPerk.GetPenetrationModifier( KFPC.GetLevel(), class<KFDamageType>(InstantHitDamageTypes[FiringMode]) );
    	}
    }

    return UsedPenetrationPower;
}

/**
 * See Pawn.ProcessInstantHit
 * @param DamageReduction: Custom KF parameter to handle penetration damage reduction
 */
simulated function ProcessInstantHitEx(byte FiringMode, ImpactInfo Impact, optional int NumHits, optional out float out_PenetrationVal)
{
	local int TotalDamage;
	local KActorFromStatic NewKActor;
	local StaticMeshComponent HitStaticMesh;
	local InterpCurveFloat PenetrationCurve;
    local KFPawn KFP;

	if (Impact.HitActor != None)
	{
		// default damage model is just hits * base damage
		NumHits = Max(NumHits, 1);
		TotalDamage = InstantHitDamage[FiringMode] * NumHits;

		if ( Impact.HitActor.bWorldGeometry )
		{
			HitStaticMesh = StaticMeshComponent(Impact.HitInfo.HitComponent);
			if ( !WorldInfo.bDropDetail && WorldInfo.GetDetailMode() != DM_Low &&
				(HitStaticMesh != None) && HitStaticMesh.CanBecomeDynamic() )
			{
				NewKActor = class'KActorFromStatic'.Static.MakeDynamic(HitStaticMesh);
				if ( NewKActor != None )
				{
					Impact.HitActor = NewKActor;
				}
			}
		}
		// Handle PenetrationDamageReduction / DamageModifier if the weapon has penetration
		else if ( Impact.HitActor.bCanBeDamaged && GetInitialPenetrationPower(FiringMode) > 0  )
		{
            if ( out_PenetrationVal <= 0 )
			{
                return;
			}
			else
			{
                PenetrationCurve = PenetrationDamageReductionCurve[FiringMode];
                TotalDamage *= EvalInterpCurveFloat(PenetrationCurve, out_PenetrationVal/GetInitialPenetrationPower(FiringMode));

                // Reduce penetration power for every KFPawn penetrated
                KFP = KFPawn(Impact.HitActor);
            	if ( KFP != none )
            	{
                    out_PenetrationVal -= KFP.PenetrationResistance;
            	}
			}
		}
		Impact.HitActor.TakeDamage( TotalDamage, Instigator.Controller,
						Impact.HitLocation, InstantHitMomentum[FiringMode] * Impact.RayDir,
						InstantHitDamageTypes[FiringMode], Impact.HitInfo, self );
	}
}

/**
 * Handle a bullet this weapon has fired for client side hit detection impacting a Pawn
 * see 'InstantFireClient'
 */
simulated function HandleProjectileImpact(ImpactInfo Impact, optional float PenetrationValue)
{
	// local player only for clientside hit detection
	if ( Instigator != None && Instigator.IsLocallyControlled() )
	{
		if ( Instigator.Role < ROLE_Authority )
		{
			SendClientProjectileImpact(CurrentFireMode, Impact, PenetrationValue);
		}

		ProcessInstantHitEx(CurrentFireMode, Impact,, PenetrationValue);
	}
}

/** process local player fragment impact for clientside hit detection */
event RecieveClientFragmentImpact(const out ImpactInfo Impact, class<KFProjectile> Fragment)
{
    ProcessGrenadeProjectileImpact(Impact, Fragment);
}

/**
 * Handle a fragment for client side hit detection impacting a Pawn
 * @param Impact: The hit to process
 * @param Fragment: The type of fragment that impacted
 */
simulated function HandleGrenadeProjectileImpact(ImpactInfo Impact, class<KFProjectile> Fragment)
{
	// local player only for clientside hit detection
	if ( Instigator != None && Instigator.IsLocallyControlled() )
	{
		if ( Instigator.Role < ROLE_Authority )
		{
            SendClientFragmentImpact(Impact,Fragment);
		}

		ProcessGrenadeProjectileImpact(Impact, Fragment);
	}
}

/**
 * Process the damage for a grenade fragment impact
 * @param Impact: The hit to process
 * @param Fragment: The type of fragment that impacted
 */
simulated function ProcessGrenadeProjectileImpact(ImpactInfo Impact, class<KFProjectile> Fragment)
{
	local int TotalDamage;
	local KActorFromStatic NewKActor;
	local StaticMeshComponent HitStaticMesh;

	if (Impact.HitActor != None)
	{
		TotalDamage = Fragment.default.Damage;

		if ( Impact.HitActor.bWorldGeometry )
		{
			HitStaticMesh = StaticMeshComponent(Impact.HitInfo.HitComponent);
			if ( (HitStaticMesh != None) && HitStaticMesh.CanBecomeDynamic() )
			{
				NewKActor = class'KActorFromStatic'.Static.MakeDynamic(HitStaticMesh);
				if ( NewKActor != None )
				{
					Impact.HitActor = NewKActor;
				}
			}
		}

		Impact.HitActor.TakeDamage( TotalDamage, Instigator.Controller,
						Impact.HitLocation, Fragment.default.MomentumTransfer * Impact.RayDir,
						Fragment.default.MyDamageType, Impact.HitInfo, Instigator );
	}
}

/*********************************************************************************************
 * @name	Clientside Hit Detection
 *********************************************************************************************/

// Create RPC's of various sizes since we can't replicate dynamic arrays.  Don't need to be too exact here
// as there is only a small overhead for calling another RPC (e.g. 2 + 8 = 10)
// see https://udn.unrealengine.com/questions/158710/efficient-array-replication.html
reliable server final private native event ServerRegisterImpact1(byte FiringMode, ImpactRepInfo NetImpact);
reliable server final private native event ServerRegisterImpact2(byte FiringMode, ImpactRepInfo NetImpacts[2]);
reliable server final private native event ServerRegisterImpact3(byte FiringMode, ImpactRepInfo NetImpacts[3]);
reliable server final private native event ServerRegisterImpact4(byte FiringMode, ImpactRepInfo NetImpacts[4]);
reliable server final private native event ServerRegisterImpact5(byte FiringMode, ImpactRepInfo NetImpacts[5]);
reliable server final private native event ServerRegisterImpact6(byte FiringMode, ImpactRepInfo NetImpacts[6]);
reliable server final private native event ServerRegisterImpact7(byte FiringMode, ImpactRepInfo NetImpacts[7]);
reliable server final private native event ServerRegisterImpact8(byte FiringMode, ImpactRepInfo NetImpacts[8]);
reliable server final private native event ServerRegisterProjectileImpact(byte FiringMode, ImpactRepInfo NetImpact, optional byte PenetrationByte);
// special ammo types
reliable server final private native event ServerRegisterProjectileExplosion(vector ExplosionLocation, KFProjectile ExplodingProjectile);
reliable server final private native event ServerRegisterFragmentImpact(ImpactRepInfo NetImpact, class<KFProjectile> FragmentClass);

// Compress our impact into a ImpactRepInfo for replication (returns number of impacts sent)
simulated protected native function int SendClientImpactList(byte FiringMode, const array<ImpactInfo> ImpactList);
// Same as SendClientImpactList, but recieves a single impact with a penetration value
simulated protected native function int SendClientProjectileImpact(byte FiringMode, const out ImpactInfo Impact, float PenetrationFloat);
// Replicate a projectile explosion to the server
simulated protected native function int SendClientProjectileExplosion(vector ExplosionLocation, KFProjectile ExplodingProjectile);
// Compress our fragment impact into a ImpactRepInfo for replication (returns number of impacts sent)
simulated protected native function int SendClientFragmentImpact(const out ImpactInfo Impact, class<KFProjectile> FragmentClass);
simulated protected native function vector GetSafeStartTraceLocation();

/**
 * Allows subclass to perform extra bullet traces
 * Network: Local Player
 */
simulated function InstantFireClient_AddImpacts(vector StartTrace, rotator Aim, out array<ImpactInfo> ImpactList);

/**
 * Performs an 'Instant Hit' shot.
 * Network: Local Player and Server
 */
simulated function InstantFireClient()
{
	local vector			StartTrace, EndTrace;
	local rotator			AimRot;
	local Array<ImpactInfo>	ImpactList;
	local int				Idx;
	local ImpactInfo		RealImpact;
	local float				CurPenetrationValue;

	// define range to use for CalcWeaponFire()
	StartTrace = GetSafeStartTraceLocation();
	AimRot = GetAdjustedAim(StartTrace);
	EndTrace = StartTrace + vector(AimRot) * GetTraceRange();

    // Initialize penetration power
    PenetrationPowerRemaining = GetInitialPenetrationPower(CurrentFireMode);
    CurPenetrationValue = PenetrationPowerRemaining;

	// Perform shot
	RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);

	// Set flash location to trigger client side effects.  Bypass Weapon.SetFlashLocation since
	// that function is not marked as simulated and we want instant client feedback.
	// ProjectileFire/IncrementFlashCount has the right idea:
	//	1) Call IncrementFlashCount on Server & Local
	//	2) Replicate FlashCount if ( !bNetOwner )
	//	3) Call WeaponFired() once on local player
	if( Instigator != None )
	{
		Instigator.SetFlashLocation( Self, CurrentFireMode, RealImpact.HitLocation );
	}

	// local player only for clientside hit detection
	if ( Instigator != None && Instigator.IsLocallyControlled() )
	{
		// allow weapon to add extra bullet impacts (useful for shotguns)
		InstantFireClient_AddImpacts(StartTrace, AimRot, ImpactList);

		for (Idx = 0; Idx < ImpactList.Length; Idx++)
		{
			ProcessInstantHitEx(CurrentFireMode, ImpactList[Idx],, CurPenetrationValue);
		}

		if ( Instigator.Role < ROLE_Authority )
		{
            SendClientImpactList(CurrentFireMode, ImpactList);
		}
	}
}

/** process local player impact for clientside hit detection */
event RecieveClientImpact(byte FiringMode, const out ImpactInfo Impact, optional out float PenetrationValue)
{
	if ( FiringMode == BASH_FIREMODE )
	{
		MeleeAttackHelper.ProcessMeleeHit(FiringMode, Impact);
	}
	else
	{
        ProcessInstantHitEx(FiringMode, Impact,, PenetrationValue);
	}
}

/** process local player explosion for clientside explosion handling */
event RecieveClientProjectileExplosion(vector ExplosionLocation, KFProjectile ExplodingProjectile)
{
    // TODO: maybe validate the explosion normal on the client?
    ExplodingProjectile.CallExplode( ExplosionLocation, vect(0,0,1) );
}

/**
 * Replicate client side explosion to server
 */
simulated function HandleClientProjectileExplosion(vector ExplosionLocation, KFProjectile ExplodingProjectile)
{
    SendClientProjectileExplosion(ExplosionLocation, ExplodingProjectile);
}

/** process local player impact for clientside hit detection */
event RecieveClientImpactList(byte FiringMode, array<ImpactInfo> ImpactList)
{
	// deprecated, all impacts go through RecieveClientImpact
}

/*********************************************************************************************
 * @name	Ammunition
 *********************************************************************************************/

 /**
 * Returns which ammo pool a fire mode should pull from, primary or secondary.
 @ param    FiringMode  the fire mode we want to check against
 @ return   the ammo pool we should pull from for the input fire mode
 */
simulated function int GetAmmoType(byte FiringMode)
{
    if( FiringMode == ALTFIRE_FIREMODE && UsesSecondaryAmmo() )
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

 /**
 * Returns true if this weapon uses a secondary ammo pool
 */
static simulated event bool UsesAmmo()
{
    return default.MaxSpareAmmo[0] > 0;
}

 /**
 * Returns true if this weapon uses a secondary ammo pool
 */
static simulated event bool UsesSecondaryAmmo()
{
    return default.MagazineCapacity[1] > 0;
}

 /**
 * Returns true if this weapon uses a secondary ammo pool
 */
static simulated event bool CanRefillSecondaryAmmo()
{
 	return UsesSecondaryAmmo() && default.bCanRefillSecondaryAmmo;
}

/**
 * Initializes ammo counts, when weapon is spawned.
 */
function InitializeAmmo()
{
	local KFPerk CurrentPerk;

	CurrentPerk = GetPerk();

	MagazineCapacity[0] = default.MagazineCapacity[0];
	MagazineCapacity[1] = default.MagazineCapacity[1];
	SpareAmmoCount[0] = default.SpareAmmoCount[0];

	// The weapons max spare ammo includes our current magazine as well
	MaxSpareAmmo[0] = default.MaxSpareAmmo[0] + default.MagazineCapacity[0];
	MaxSpareAmmo[1] = default.MaxSpareAmmo[1] + default.MagazineCapacity[1];

	// Let the perk change mag numbers etc if needed
	if( CurrentPerk != none )
	{
		CurrentPerk.ModifyMagSizeAndNumber( self, MagazineCapacity[0] );
		CurrentPerk.ModifyMagSizeAndNumber( self, MagazineCapacity[1] );

		// Update MaxSpareAmmo if we have modified mags
		if( CurrentPerk.ShouldMagSizeModifySpareAmmo(self) )
		{
			MaxSpareAmmo[0] = default.MaxSpareAmmo[0] + MagazineCapacity[0];
			MaxSpareAmmo[1] = default.MaxSpareAmmo[1] + MagazineCapacity[1];
		}
		else
		{
			MaxSpareAmmo[0] = default.MaxSpareAmmo[0] + default.MagazineCapacity[0];
			MaxSpareAmmo[1] = default.MaxSpareAmmo[1] + default.MagazineCapacity[1];
		}

		CurrentPerk.ModifyMaxSpareAmmoAmount( self, MaxSpareAmmo[0] );
		CurrentPerk.ModifyMaxSpareAmmoAmount( self, MaxSpareAmmo[1] );
	}

	AmmoCount[0] = MagazineCapacity[0];
	AmmoCount[1] = MagazineCapacity[1];

	AddAmmo(InitialSpareMags[0] * default.MagazineCapacity[0]);

	if( CurrentPerk != none )
	{
		CurrentPerk.ModifySpareAmmoAmount(self, SpareAmmoCount[0]);
	}

	// Finalize our spare ammo values
	AddAmmo(0);

	bForceNetUpdate	= TRUE;
}

 /**
  * @brief Re-initializes ammo counts after perk and/or perk skills has/have changed.
  */
function ReInitializeAmmoCounts(KFPerk CurrentPerk)
{
	if( CurrentPerk != none )
	{
		MagazineCapacity[0] = default.MagazineCapacity[0];
		MagazineCapacity[1] = default.MagazineCapacity[1];

		CurrentPerk.ModifyMagSizeAndNumber( self, MagazineCapacity[0] );
		CurrentPerk.ModifyMagSizeAndNumber( self, MagazineCapacity[1] );

		if( CurrentPerk.ShouldMagSizeModifySpareAmmo(self) )
		{
			MaxSpareAmmo[0] = default.MaxSpareAmmo[0] + MagazineCapacity[0];
			MaxSpareAmmo[1] = default.MaxSpareAmmo[1] + MagazineCapacity[1];
		}
		else
		{
			MaxSpareAmmo[0] = default.MaxSpareAmmo[0] + default.MagazineCapacity[0];
			MaxSpareAmmo[1] = default.MaxSpareAmmo[1] + default.MagazineCapacity[1];			
		}

		CurrentPerk.ModifyMaxSpareAmmoAmount( self, MaxSpareAmmo[0] );
		CurrentPerk.ModifyMaxSpareAmmoAmount( self, MaxSpareAmmo[1] );

		// We don't want to modify current ammo, but spare ammo should respect perk and level
		AddAmmo(0);
	}
}

/**
 * @see Weapon::ConsumeAmmo
 */
simulated function ConsumeAmmo( byte FireModeNum )
{
    local int AmmoGroup;








	// If AmmoCount is being replicated, don't allow the client to modify it here
	if ( Role == ROLE_Authority || bAllowClientAmmoTracking )
	{
		AmmoGroup = GetAmmoType(FireModeNum);
        // Don't consume ammo if magazine size is 0 (infinite ammo with no reload)
		if (MagazineCapacity[AmmoGroup] > 0 && AmmoCount[AmmoGroup] > 0)
		{
			AmmoCount[AmmoGroup]--;
		}
	}
}

/**
 * @see Weapon::AddAmmo
 */
function int AddAmmo(int Amount)
{
	local int OldSpareAmmo;

	// If we can't accept spare ammo, then abort
	if( MaxSpareAmmo[0] <= 0 )
	{
		return 0;
	}

	if (bLogAmmo) LogInternal(self@"Add Amount =" @ Amount);
	if (bLogAmmo) LogInternal(self@"MaxSpareAmmo[0] =" @ MaxSpareAmmo[0]);
	if (bLogAmmo) LogInternal(self@"SpareAmmoCount[0] =" @ SpareAmmoCount[0]);
	if (bLogAmmo) LogInternal(self@"AmmoCount[0] =" @ AmmoCount[0]);

	OldSpareAmmo = SpareAmmoCount[0];
	SpareAmmoCount[0]	= Min(SpareAmmoCount[0] + Amount, MaxSpareAmmo[0] - AmmoCount[0]);
	bForceNetUpdate	= TRUE;

	if (bLogAmmo) LogInternal(self@"SpareAmmoCount[0] AFTER =" @ SpareAmmoCount[0]);
	if (bLogAmmo) LogInternal(self@"Added" @ SpareAmmoCount[0] - OldSpareAmmo @ "Ammo");

	return SpareAmmoCount[0] - OldSpareAmmo;
}

/**
 * Add secondary ammo to weapon
 * @param	Amount to add.
 * @return	Amount actually added. (In case magazine is already full and some ammo is left
 *
 */
function int AddSecondaryAmmo(int Amount)
{
	local int OldAmmo;

	// If we can't accept spare ammo, then abort
	if( !CanRefillSecondaryAmmo() )
	{
		return 0;
	}

	OldAmmo = AmmoCount[1];
	AmmoCount[1]	= Min(AmmoCount[1] + Amount, MagazineCapacity[1]);
	bForceNetUpdate	= TRUE;

	// unlike AddAmmo, we're updating AmmoCount directly which if ClientAmmoTracking is enabled
	// will not be replicated.  Needs for replication via RPC
    if( bAllowClientAmmoTracking )
    {
        ClientForceSecondaryAmmoUpdate(AmmoCount[1]);
    }

	return AmmoCount[1] - OldAmmo;
}

/** Force client to match server ammo counts */
reliable client function ClientForceAmmoUpdate(byte NewAmmoCount, int NewSpareAmmoCount)
{
	if ( Role < ROLE_Authority )
	{
		// detect sync errors
		if (bDebug) LogInternal(self@"ClientForceAmmoUpdate ServerAmmo Primary:"$NewAmmoCount@"ClientAmmo Primary:"$AmmoCount[0]@"ServerSpareAmmo Primary:"$NewSpareAmmoCount@"ClientSpareAmmo Primary:"$SpareAmmoCount[0]);
		if ( NewAmmoCount != AmmoCount[0] )
		{
			LogInternal(self@"ClientForceAmmoUpdate Primary Ammo mismatch Server:"$NewAmmoCount@"Client:"$AmmoCount[0]);
		}
		if ( NewSpareAmmoCount != SpareAmmoCount[0] )
		{
			LogInternal(self@"ClientForceAmmoUpdate Primary SpareAmmo mismatch Server:"$NewSpareAmmoCount@"Client:"$SpareAmmoCount[0]);
		}

		AmmoCount[0] = NewAmmoCount;
		SpareAmmoCount[0] = NewSpareAmmoCount;
		NotifyHUDofWeapon(Pawn(Owner));
	}
}

/** Force client to match server secondary ammo counts */
reliable client function ClientForceSecondaryAmmoUpdate(byte NewSecondaryAmmoCount)
{
	if ( Role < ROLE_Authority )
	{
		// detect sync errors
		if (bDebug) LogInternal(self@"ClientForceAmmoUpdate ServerAmmo Secondary:"$NewSecondaryAmmoCount@"ClientAmmo Secondary:"$AmmoCount[1]);
		if ( NewSecondaryAmmoCount != AmmoCount[1] )
		{
			LogInternal(self@"ClientForceAmmoUpdate Secondary Ammo mismatch Server:"$NewSecondaryAmmoCount@"Client:"$AmmoCount[1]);
		}
		AmmoCount[1] = NewSecondaryAmmoCount;
		NotifyHUDofWeapon(Pawn(Owner));
	}
}

/** Notify the client that their weapon has been picked up and ready to show */
unreliable client function NotifyHUDofWeapon( Pawn P )
{
	local KFPlayerController KFPC;

	if ( Role < ROLE_Authority )
	{
		KFPC = KFPlayerController(P.Owner);

		if(KFPC != none && KFPC.MyGFxHUD != none)
		{
			KFPC.MyGFxHUD.NotifyHUDofWeapon();
		}
	}
}

/**
 * @see Weapon::HasAmmo
 */
simulated event bool HasAmmo( byte FireModeNum, optional int Amount=1 )
{
	// we can always do a melee attack
	if( FireModeNum == BASH_FIREMODE )
	{
		return TRUE;
	}
	else if ( FireModeNum == RELOAD_FIREMODE )
	{
		return CanReload();
	}
	else if ( FireModeNum == GRENADE_FIREMODE )
	{
        if( KFInventoryManager(InvManager) != none )
        {
            return KFInventoryManager(InvManager).HasGrenadeAmmo(Amount);
        }
	}

	// Assume we ask for at least 1 bullet to be there.
	if( Amount == 0 )
	{
		Amount = 1;
	}

	return (AmmoCount[GetAmmoType(FireModeNum)] - Amount) >= 0;
}

/**
 * @see Weapon::HasAnyAmmo
 */
simulated function bool HasAnyAmmo()
{
	if ( HasSpareAmmo() || HasAmmo(DEFAULT_FIREMODE) )
	{
		return true;
	}

    if( UsesSecondaryAmmo() && HasAmmo(ALTFIRE_FIREMODE) )
    {
		return true;
	}

	return false;
}

/** Returns true if spare ammo is available (outside of current magazine) */
simulated final event bool HasSpareAmmo()
{
	return (bInfiniteSpareAmmo || SpareAmmoCount[0] > 0);
}

simulated event int GetTotalAmmoAmount(byte FiringMode)
{
	return AmmoCount[GetAmmoType(FiringMode)] + SpareAmmoCount[GetAmmoType(FiringMode)];
}

simulated event int GetMaxAmmoAmount(byte FiringMode)
{
	return MaxSpareAmmo[GetAmmoType(FiringMode)] + MagazineCapacity[GetAmmoType(FiringMode)];
}

simulated event int GetMissingSpareAmmoAmount(byte FiringMode)
{
    return MaxSpareAmmo[GetAmmoType(FiringMode)] - SpareAmmoCount[GetAmmoType(FiringMode)];
}

simulated function float GetAmmoPercentage(optional byte FiringMode)
{
	if( MaxSpareAmmo[GetAmmoType(FiringMode)] == 0 )
	{
		return -1.f;
	}

	return float(GetTotalAmmoAmount(FiringMode)) / float(GetMaxAmmoAmount(FiringMode));
}

/** Determines the ammo left in magazine for HUD display */
simulated function int GetSpareAmmoForHUD()
{
    return SpareAmmoCount[0];
}

/**
 * Called by Player to force current weapon to be reloaded
 * NOTE: A reload will only begin once the weapons FireInterval has completed
 * Network: LocalPlayer
 */
simulated function bool ForceReload()
{
	// Make sure it's called for a locally controlled pawn.
	if (Instigator != None && Instigator.IsLocallyControlled())
	{
		// if we can reload,
		if( CanReload() )
		{
			StartFire(RELOAD_FIREMODE);
			return true;
		}
	}

	return false;
}

/** Returns true if weapon can potentially be reloaded */
simulated function bool CanReload()
{
	local KFPawn	P;
	local bool		bInstigatorCanReload;

	P = KFPawn(Instigator);

	// Cannot reload weapon when doing a special move
	bInstigatorCanReload = (P != None && P.CanReloadWeapon());

	return(	bCanBeReloaded                       &&	// Weapon can be reloaded
			bInstigatorCanReload                 &&	// Instigator can reload weapon
			AmmoCount[0] < MagazineCapacity[0]   &&	// we fired at least a shot
			HasSpareAmmo()					    // and we have more ammo to fill current magazine
			);
}

/** Returns true if weapon should be auto-reloaded */
simulated function bool ShouldAutoReload(byte FireModeNum)
{
    local bool bHasAmmo;

    bHasAmmo = HasAmmo(FireModeNum);

    // do dry fire or auto switch
    if( !bHasAmmo && Instigator != none && Instigator.IsLocallyControlled() )
    {
		if ( bPendingAutoSwitchOnDryFire )
		{
			if( CanSwitchWeapons() )
			{
                if ( !HasSpareAmmo() )
    			{
    				Instigator.Controller.ClientSwitchToBestWeapon(false);
    			}
			}

			bPendingAutoSwitchOnDryFire = false;
		}
		else
		{
			WeaponPlaySound(WeaponDryFireSnd[FireModeNum]);
			if( Role < ROLE_Authority )
			{
				ServerPlayDryFireSound(FireModeNum);
			}
			bPendingAutoSwitchOnDryFire = !HasSpareAmmo();
		}
    }

	return (!bHasAmmo && CanReload());
}

/** Play the dry fire sound on the server */
reliable server protected function ServerPlayDryFireSound(byte FireModeNum)
{
    WeaponPlaySound(WeaponDryFireSnd[FireModeNum]);
}

/*********************************************************************************************
 * @name	Rendering Methods
********************************************************************************************* */

/** Set the lighting channels on all the appropriate weapon meshes */
simulated function SetMeshLightingChannels(LightingChannelContainer NewLightingChannels)
{
	Mesh.SetLightingChannels(NewLightingChannels);
}

/*********************************************************************************************
 * @name	Debug info
 *********************************************************************************************/

/**
 * list important Weapon variables on canvas.  HUD will call DisplayDebug() on the current ViewTarget when
 * the ShowDebug exec is used
 *
 * @param	HUD		- HUD with canvas to draw on
 * @input	out_YL		- Height of the current font
 * @input	out_YPos	- Y position on Canvas. out_YPos += out_YL, gives position to draw text for next debug line.
 */

simulated function GetWeaponDebug( out Array<String> DebugInfo )
{
	super.GetWeaponDebug( DebugInfo );

	DebugInfo[DebugInfo.Length] = "AmmoCount Primary:" $ AmmoCount[0] @ "MagazineSize Primary:" $ MagazineCapacity[0];
	DebugInfo[DebugInfo.Length] = "SpareAmmoCount Primary:" $ SpareAmmoCount[0] @ "MaxSpareAmmo Primary:" $ MaxSpareAmmo[0];
	DebugInfo[DebugInfo.Length] = "AmmoCount Secondary:" $ AmmoCount[1] @ "MagazineSize Secondary:" $ MagazineCapacity[1];
	if( KFInventoryManager(InvManager) != none )
	{
		DebugInfo[DebugInfo.Length] = "GrenadeCount:" $ KFInventoryManager(InvManager).GrenadeCount @ "MaxGrenades:" $ GetPerk().MaxGrenadeCount;
	}
}

/**
 * list important LFWeapon variables on canvas.  HUD will call DisplayDebug() on the current ViewTarget when
 * the ShowDebug exec is used
 *
 * @param	HUD		- HUD with canvas to draw on
 * @input	out_YL		- Height of the current font
 * @input	out_YPos	- Y position on Canvas. out_YPos += out_YL, gives position to draw text for next debug line.
 */
simulated function DisplayDebug(HUD HUD, out float out_YL, out float out_YPos)
{
	local string CurAnim, CurHandAnim;
	// Recoil Debugging
	local vector FADebugLineStart,FADebugLineEnd,FADebugLineUL,FADebugLineUR,FADebugLineLL,FADebugLineLR;
	local rotator FADebugLineRot, FADebugViewRotation;
	local int UsedMaxYawLimit, UsedMaxPitchLimit, UsedMinYawLimit, UsedMinPitchLimit;
	local Rotator AimRotation, WeaponBufferRot;

	super.DisplayDebug(HUD, out_YL, out_YPos);

	if (HUD.ShouldDisplayDebug('Camera'))
	{
		HUD.Canvas.SetPos(4,out_YPos);
		HUD.Canvas.DrawText("---------- KFWeapon: Camera ----------");
		out_YPos += out_YL;

		HUD.Canvas.DrawText("WEAPONCAMERA MeshFOV="$MeshFOV @ "MeshIronSightFOV="$MeshIronSightFOV @ "CameraIronSightFOV="$PlayerIronSightFOV @" CurrentMeshFOV = "$MySkelMesh.FOV);
		out_YPos += out_YL;
		HUD.Canvas.SetPos(4, out_YPos);
	}

	if (HUD.ShouldDisplayDebug('Zooming'))
	{
		HUD.Canvas.SetPos(4,out_YPos);
		HUD.Canvas.DrawText("---------- KFWeapon: Zooming ----------");
		out_YPos += out_YL;

		HUD.Canvas.DrawText("ZOOMING ZoomRotInterp="$ZoomRotInterp @ "bDoingQuickDownZoom="$bDoingQuickDownZoom @ "QuickWeaponDownRotation="$QuickWeaponDownRotation @" ZoomInRotation = "$ZoomInRotation$" PlayerViewOffset= "$PlayerViewOffset);
		out_YPos += out_YL;
		HUD.Canvas.SetPos(4, out_YPos);
	}

	if (HUD.ShouldDisplayDebug('FireOffset'))
	{
		HUD.Canvas.SetPos(4,out_YPos);
		HUD.Canvas.DrawText("---------- KFWeapon: FireOffset ----------");
		out_YPos += out_YL;

		HUD.Canvas.DrawText("PROJECTILE SPAWNING FireOffset="$FireOffset);
		out_YPos += out_YL;
		HUD.Canvas.SetPos(4, out_YPos);

		if(Instigator.IsFirstPerson())
		{
            HUD.DrawDebugSphere( GetMuzzleLoc(), 3, 6, 255, 0, 0 );
		}
		else
		{
            if( CurrentFireMode == GRENADE_FIREMODE )
            {
                HUD.DrawDebugSphere( (Instigator.GetPawnViewLocation() + (GrenadeFireOffset >> Instigator.Rotation)), 3, 6, 0, 255, 0 );
            }
            else
            {
                HUD.DrawDebugSphere( (Instigator.GetPawnViewLocation() + (FireOffset >> Instigator.Rotation)), 3, 6, 255, 0, 0 );
            }
		}
	}

	if (HUD.ShouldDisplayDebug('animation'))
	{
		HUD.Canvas.SetPos(4,out_YPos);
		HUD.Canvas.DrawText("---------- KFWeapon: animation ----------");
		out_YPos += out_YL;

		if ( GetWeaponAnimNodeSeq() != none )
		{
			CurAnim = string(GetWeaponAnimNodeSeq().AnimSeqName);

			HUD.Canvas.DrawText("WEAPON WeaponAnim="$CurAnim$" Rate: "$GetWeaponAnimNodeSeq().Rate$" Position: "$GetWeaponAnimNodeSeq().CurrentTime);
			out_YPos += out_YL;
			HUD.Canvas.SetPos(4, out_YPos);
		}
		if ( GetArmAnimNodeSeq() != none )
		{
			CurHandAnim = string(GetArmAnimNodeSeq().AnimSeqName);

			HUD.Canvas.DrawText("WEAPON HandAnim="$CurHandAnim$" Rate: "$GetArmAnimNodeSeq().Rate$" Position: "$GetArmAnimNodeSeq().CurrentTime);
			out_YPos += out_YL;
			HUD.Canvas.SetPos(4, out_YPos);
		}
	}

	if (HUD.ShouldDisplayDebug('aim3d'))
	{
		HUD.Canvas.SetPos(4,out_YPos);
		HUD.Canvas.DrawText("---------- KFWeapon: aim3d ----------");
		out_YPos += out_YL;

		if( KFPlayerController(Instigator.Controller) != none )
		{
			KFPlayerController(Instigator.Controller).GetPlayerViewPoint(FADebugLineStart, AimRotation);
		}

    	if( bDebugRecoilPosition )
    	{
            WeaponBufferRot.Pitch = RecoilISMaxPitchLimit;
            WeaponBufferRot.Yaw += TotalRecoilRotator.Yaw;
            WeaponBufferRot.Pitch += TotalRecoilRotator.Pitch;
    	}
    	else
    	{
            WeaponBufferRot = KFPlayerController(Instigator.Controller).WeaponBufferRotation;
    	}


		FADebugLineRot.Yaw = AimRotation.Yaw + WeaponBufferRot.Yaw;
		FADebugLineRot.Pitch = AimRotation.Pitch + WeaponBufferRot.Pitch;

		FADebugLineEnd = FADebugLineStart + 400 * vector(FADebugLineRot);
		DrawDebugSphere(FADebugLineEnd, 5, 8, 0,255,0, false);
	}

	if (HUD.ShouldDisplayDebug('recoil3d'))
	{
		HUD.Canvas.SetPos(4,out_YPos);
		HUD.Canvas.DrawText("---------- KFWeapon: recoil3d ----------");
		out_YPos += out_YL;

		if( KFPlayerController(Instigator.Controller) != none )
		{
			KFPlayerController(Instigator.Controller).GetPlayerViewPoint(FADebugLineStart, FADebugViewRotation);
		}

		// Draw where the weapon is currently recoiling to
		FADebugLineRot.Yaw = FADebugViewRotation.Yaw + TotalRecoilRotator.Yaw;
		FADebugLineRot.Pitch = FADebugViewRotation.Pitch + TotalRecoilRotator.Pitch;
		FADebugLineEnd = FADebugLineStart + 20 * vector(FADebugLineRot);
		DrawDebugBox(FADebugLineEnd, vect(0.1,0.1,0.1), 255,255,0, false);

		// Draw where the free-aim buffer is currently at
		FADebugLineRot.Yaw = FADebugViewRotation.Yaw;
		FADebugLineRot.Pitch = FADebugViewRotation.Pitch;
		FADebugLineEnd = FADebugLineStart + 20 * vector(FADebugLineRot);
		DrawDebugBox(FADebugLineEnd, vect(0.1,0.1,0.1), 255,0,128, false);


		// Draw where the recoil limits are
		if( bUsingSights )
		{
			UsedMaxYawLimit = RecoilISMaxYawLimit;
			UsedMinYawLimit = RecoilISMinYawLimit;
			UsedMaxPitchLimit = RecoilISMaxPitchLimit;
			UsedMinPitchLimit = RecoilISMinPitchLimit;
		}
		else
		{
			UsedMaxYawLimit = RecoilMaxYawLimit;
			UsedMinYawLimit = RecoilMinYawLimit;
			UsedMaxPitchLimit = RecoilMaxPitchLimit;
			UsedMinPitchLimit = RecoilMinPitchLimit;
		}

		FADebugLineRot.Yaw = FADebugViewRotation.Yaw + UsedMinYawLimit;
		FADebugLineRot.Pitch = FADebugViewRotation.Pitch + UsedMaxPitchLimit;
		FADebugLineEnd = FADebugLineStart + 20 * vector(FADebugLineRot);
		FADebugLineUL = FADebugLineEnd;

		FADebugLineRot.Yaw = FADebugViewRotation.Yaw + UsedMaxYawLimit;
		FADebugLineRot.Pitch = FADebugViewRotation.Pitch + UsedMaxPitchLimit;
		FADebugLineEnd = FADebugLineStart + 20 * vector(FADebugLineRot);
		FADebugLineUR = FADebugLineEnd;

		FADebugLineRot.Yaw = FADebugViewRotation.Yaw + UsedMinYawLimit;
		FADebugLineRot.Pitch = FADebugViewRotation.Pitch + UsedMinPitchLimit;
		FADebugLineEnd = FADebugLineStart + 20 * vector(FADebugLineRot);
		FADebugLineLL = FADebugLineEnd;

		FADebugLineRot.Yaw = FADebugViewRotation.Yaw + UsedMaxYawLimit;
		FADebugLineRot.Pitch = FADebugViewRotation.Pitch + UsedMinPitchLimit;
		FADebugLineEnd = FADebugLineStart + 20 * vector(FADebugLineRot);
		FADebugLineLR = FADebugLineEnd;

		DrawDebugLine(FADebugLineUL,FADebugLineUR, 255,0,255,false);
		DrawDebugLine(FADebugLineUR,FADebugLineLR, 255,0,255,false);
		DrawDebugLine(FADebugLineLR,FADebugLineLL, 255,0,255,false);
		DrawDebugLine(FADebugLineLL,FADebugLineUL, 255,0,255,false);

		// Draw where the full recoil starts to blend in
		FADebugLineRot.Yaw = FADebugViewRotation.Yaw + (UsedMinYawLimit + ((65535-UsedMinYawLimit) * (1.0 - FullRecoilYawPct)));
		FADebugLineRot.Pitch = FADebugViewRotation.Pitch + UsedMaxPitchLimit * FullRecoilPitchPct;
		FADebugLineEnd = FADebugLineStart + 20 * vector(FADebugLineRot);
		FADebugLineUL = FADebugLineEnd;

		FADebugLineRot.Yaw = FADebugViewRotation.Yaw + UsedMaxYawLimit * FullRecoilYawPct;
		FADebugLineRot.Pitch = FADebugViewRotation.Pitch + UsedMaxPitchLimit * FullRecoilPitchPct;
		FADebugLineEnd = FADebugLineStart + 20 * vector(FADebugLineRot);
		FADebugLineUR = FADebugLineEnd;

		FADebugLineRot.Yaw = FADebugViewRotation.Yaw + (UsedMinYawLimit + ((65535-UsedMinYawLimit) * (1.0 - FullRecoilYawPct)));
		FADebugLineRot.Pitch = FADebugViewRotation.Pitch + (UsedMinPitchLimit + ((65535-UsedMinPitchLimit) * (1.0 - FullRecoilYawPct)));
		FADebugLineEnd = FADebugLineStart + 20 * vector(FADebugLineRot);
		FADebugLineLL = FADebugLineEnd;

		FADebugLineRot.Yaw = FADebugViewRotation.Yaw + UsedMaxYawLimit * FullRecoilYawPct;
		FADebugLineRot.Pitch = FADebugViewRotation.Pitch + (UsedMinPitchLimit + ((65535-UsedMinPitchLimit) * (1.0 - FullRecoilYawPct)));
		FADebugLineEnd = FADebugLineStart + 20 * vector(FADebugLineRot);
		FADebugLineLR = FADebugLineEnd;

		DrawDebugLine(FADebugLineUL,FADebugLineUR, 128,255,255,false);
		DrawDebugLine(FADebugLineUR,FADebugLineLR, 128,255,255,false);
		DrawDebugLine(FADebugLineLR,FADebugLineLL, 128,255,255,false);
		DrawDebugLine(FADebugLineLL,FADebugLineUL, 128,255,255,false);
	}
}

/*********************************************************************************************
 * @name	States
********************************************************************************************* */

/** Gets a weapon state identifier for third person anims */
simulated function byte GetWeaponStateId()
{
	return WEP_Idle;
}

/** Register new state with owning pawn */
simulated function NotifyBeginState()
{
	KFPawn(Instigator).WeaponStateChanged(GetWeaponStateId());
}

/** Register new state with owning pawn */
simulated function NotifyEndState()
{
	KFPawn(Instigator).WeaponStateChanged(WEP_Idle);
}

/*********************************************************************************************
 * state Inactive
 * This state is the default state.  It needs to make sure Zooming is reset when entering/leaving
 *********************************************************************************************/

auto simulated state Inactive
{
	ignores ForceReload, ShouldAutoReload, AllowIronSights;

	simulated function BeginState(name PreviousStateName)
	{
		// Reset ironsights
		if ( bUsingSights )
		{
			// do this locally and replicate to avoid sync errors w/ bIronSightOnBringUp
			if ( Instigator.IsLocallyControlled() )
			{
				SetIronSights(false);
			}
		}
		else if( !bHasIronSights )
		{
			// If this weapon doesn't have ironsights, clear altfire.  Fixes a bug where
			// when switching to a weapon that does have ironsights it will immediately alt-fire
			ClearPendingFire(ALTFIRE_FIREMODE);
		}

		// Clear pending reload - Fixes an issue where you can set a pending reload while
		// switching weapons and it will carry over to the new weapon.
		ClearPendingFire(RELOAD_FIREMODE);

		// force an update when switching weapons so we can detect sync errors
		if ( bAllowClientAmmoTracking && Role == ROLE_Authority && WorldInfo.TimeSeconds > CreationTime )
		{
			ClientForceAmmoUpdate(AmmoCount[0], SpareAmmoCount[0]);
			ClientForceSecondaryAmmoUpdate(AmmoCount[1]);
		}

		bPendingAutoSwitchOnDryFire = false;

		Super.BeginState(PreviousStateName);
	}

	simulated function EndState(Name NextStateName)
	{
		Super.EndState(NextStateName);
		UpdateOutOfAmmoEffects(0.0f);
	}
}

/**
 * Called from PerformReload when bAllowClientAmmoTracking==TRUE
 * This was moved up in the file because it has to be defined before state active
 */
reliable server function ServerSyncReload(int ClientSpareAmmoCount)
{
	local int ClientReloadAmount;

	if ( bAllowClientAmmoTracking && ClientSpareAmmoCount < SpareAmmoCount[0] )
	{
		// clamp to spare ammo size
		ClientReloadAmount = Min(SpareAmmoCount[0] - ClientSpareAmmoCount, SpareAmmoCount[0]);
		// consume spare ammo
		SpareAmmoCount[0] -= ClientReloadAmount;

		// increment and clamp magazine ammo
		AmmoCount[0] = Min(AmmoCount[0] + ClientReloadAmount, MagazineCapacity[0]);
	}
}

/*********************************************************************************************
 * State Active
 * A Weapon this is being held by a pawn should be in the active state.  In this state,
 * a weapon should loop any number of idle animations, as well as check the PendingFire flags
 * to see if a shot has been fired.
 *********************************************************************************************/

simulated function Activate()
{
	if ( bUseAltFireMode )
	{
		// Clear default firemode when coming from another weapon, this is required since
		// StopFire() will only clear alt firemode when the button is released.
		ClearPendingFire(DEFAULT_FIREMODE);
	}

	// The weapon is equipped, attach it to the mesh.
	AttachWeaponTo( Instigator.Mesh );

	super.Activate();
}

/** Global defs for active state */
simulated function PlayIdleAnim();
simulated function StartIdleFidgetTimer();
simulated function IdleFidgetTimer();
simulated function bool CanPlayIdleFidget(optional bool bOnReload);
simulated function bool PlayIdleFidgetAnim();
simulated function ANIMNOTIFY_EnableAdditiveBob();

simulated state Active
{
	simulated event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
	{
		if ( WorldInfo.NetMode != NM_DedicatedServer )
		{
			PlayIdleAnim();
		}
	}

	simulated function PlayIdleAnim()
	{
		local int IdleIndex;

		if ( Instigator.IsFirstPerson() )
		{
			if( bUsingSights && IdleSightedAnims.Length > 0 )
			{
				IdleIndex = Rand(IdleSightedAnims.Length);
				PlayAnimation(IdleSightedAnims[IdleIndex], 0.0, true, 0.1);
			}
			else if ( IdleAnims.Length > 0 )
			{
				IdleIndex = Rand(IdleAnims.Length);
				PlayAnimation(IdleAnims[IdleIndex], 0.0, true, 0.2);
			}

			StartIdleFidgetTimer();
			ToggleAdditiveBobAnim(!bUsingSights);
		}
	}

	/** Change states */
	simulated function GotoWeaponSprinting()
	{
		GotoState('WeaponSprinting');
	}

	/** Initialize the weapon as being active and ready to go. */
	simulated event BeginState(Name PreviousStateName)
	{
		// In case this flag is still set
		bIronSightOnBringUp = false;

		// Initialize recoil blend out settings
		if( RecoilRate > 0 && RecoilBlendOutRatio > 0 )
		{
			RecoilYawBlendOutRate = maxRecoilYaw/RecoilRate * RecoilBlendOutRatio;
			RecoilPitchBlendOutRate = maxRecoilPitch/RecoilRate * RecoilBlendOutRatio;
		}

		// restore idle animation
		if( !WeaponIsAnimating() || !IsTimerActive(nameof(OnAnimEnd)) )
			OnAnimEnd(none, 0.f, 0.f);

		// restore skel controls
		bEnableTiltSkelControl = true;

		if (InvManager != none && InvManager.LastAttemptedSwitchToWeapon != none)
		{
			if (InvManager.LastAttemptedSwitchToWeapon != self)
			{
				InvManager.LastAttemptedSwitchToWeapon.ClientWeaponSet(true);
			}
			InvManager.LastAttemptedSwitchToWeapon = none;
		}

		if( bHasLaserSight )
		{
			// Blend in when entering active state.
			// Also, cancel any active blend out
			LaserSight.SetAimBlendState(true, false);
		}

		// do this last so the above code happens before any state changes
		Super.BeginState(PreviousStateName);
	}

	/** Event called when weapon leaves this state */
	simulated event EndState(Name NextStateName)
	{
		ClearTimer(nameof(IdleFidgetTimer));
		ToggleAdditiveBobAnim(false);

		if( bHasLaserSight )
		{
			// Blend out when entering active state.
			// Also, cancel any active blend in
			LaserSight.SetAimBlendState(false, true);
		}

		Super.EndState(NextStateName);
	}

	/** Animation */
	simulated function StartIdleFidgetTimer()
	{
		if ( IdleFidgetAnims.Length > 0 )
		{
			SetTimer(RandRange(1.f, 10.f), false, nameof(IdleFidgetTimer));
		}
	}

	/** Animation */
	simulated function IdleFidgetTimer()
	{
		local bool bIsPlaying;

		if ( CanPlayIdleFidget() )
		{
			bIsPlaying = PlayIdleFidgetAnim();
		}

		// Otherwise keep trying.  When OnAnimEnd is called the timer will restart with a
		// random interval, but this allows anims to keep trying if one doesn't play.
		if ( !bIsPlaying )
		{
			SetTimer(20.f, false, nameof(IdleFidgetTimer));
		}
	}

	/** Returns true if IdleFidget anim is allowed (i.e. not in combat).  This has some
	 * hardcoded numbers, but it's easy to override in a subclass if needed
	 */
	simulated function bool CanPlayIdleFidget(optional bool bOnReload)
	{
		local Pawn P;

		if ( bCanBeReloaded && !HasAmmo(DEFAULT_FIREMODE) )
			return false; // only when Ammo > 0 since most anims check magazine
		if ( bUsingSights )
			return false;

		if ( !bOnReload )
		{
			// played randomly via the StartIdleFidgetTimer/IdleFidgetTimer
			if ( (WorldInfo.TimeSeconds - LastIdleFidgetAnimTime) < 20.f )
				return false;
			if ( (WorldInfo.TimeSeconds - Instigator.LastPainTime) < 10.f )
				return false;
			if ( (WorldInfo.TimeSeconds - KFPawn(Instigator).LastWeaponFireTime) < 10.f )
				return false;

			// Is enemy visible on screen.  Using class'Pawn' to avoid cast
			foreach WorldInfo.AllPawns( class'Pawn', P )
			{
				if ( (WorldInfo.TimeSeconds - P.LastRenderTime) < 1.f && P.GetTeamNum() != Instigator.GetTeamNum() )
				{
					return false;
				}
			}
		}
		else
		{
			// slightly modified rules when it's player activited
			if ( (WorldInfo.TimeSeconds - LastIdleFidgetAnimTime) < 1.f )
				return false;
			if ( !Instigator.IsLocallyControlled() )
				return false;
		}

		return true;
	}

	/** Play a random animation from the IdleFidget list */
	simulated function bool PlayIdleFidgetAnim()
	{
		local name AnimName;

		AnimName = IdleFidgetAnims[Rand(IdleFidgetAnims.Length)];
		if ( MySkelMesh.FindAnimSequence(AnimName) != None )
		{
			// disable the additive move bob temporarily
			ToggleAdditiveBobAnim(false);

			PlayAnimation(AnimName);
			LastIdleFidgetAnimTime = WorldInfo.TimeSeconds;
			return true;
		}

		return false;
	}

	/** Returns true if weapon can potentially be reloaded */
	simulated function bool CanReload()
	{
		if ( Global.CanReload() )
		{
			return true;
		}

		// If this attempt to reload failed try to play a idle fidget instead
		if ( PendingFire(RELOAD_FIREMODE) && CanPlayIdleFidget(true) )
		{
			PlayIdleFidgetAnim();
		}
		return false;
	}

	/** called during the settle portion of certain weapon actions */
	simulated function ANIMNOTIFY_EnableAdditiveBob()
	{
		ToggleAdditiveBobAnim(true, 0.3f);
	}

	/**
	 * Perform pending fire modes.  This prevents a missed oppurtunity if the server was out
	 * of ammo during reload and has already called 'Active' BeginState.
	 */
	reliable server function ServerSyncReload(int ClientSpareAmmoCount)
	{
		local int i;

		Global.ServerSyncReload(ClientSpareAmmoCount);

		for( i=0; i<GetPendingFireLength(); i++ )
		{
			if( PendingFire(i) )
			{
				BeginFire(i);
			}
		}
	}
}

/*********************************************************************************************
 * State WeaponEquipping
 * The Weapon is in this state while transitioning from Inactive to Active state.
 * Typically, the weapon will remain in this state while its selection animation is being played.
 * While in this state, the weapon cannot be fired.
*********************************************************************************************/

simulated state WeaponEquipping
{
	simulated function byte GetWeaponStateId()
	{
		return WEP_Equipping;
	}

	simulated function bool TryPutDown()
	{
		bWeaponPutDown = true;

		if (!IsTimerActive('WeaponEquipped'))
		{
			PutDownWeapon();
		}
		else
		{
			// We want the abort to be the same amount of time as
			// we have already spent equipping
			EquipAbortTime = PutDownTime * GetTimerCount('WeaponEquipped') / GetTimerRate('WeaponEquipped');
			GotoState('WeaponAbortEquip');
		}

		return true;
	}

	simulated function BeginState(Name PreviousStateName)
	{
		local KFPerk InstigatorPerk;
		local float PerkZedTimeResist;

		super.BeginState(PreviousStateName);

		if( bIronSightOnBringUp && bHasIronSights )
		{
			bIronSightOnBringUp = false;
			SetIronSights(true);
		}

		InstigatorPerk = GetPerk();
		if ( InstigatorPerk != none )
		{
			PerkZedTimeResist = InstigatorPerk.GetZedTimeModifier(self);
		}

		SetZedTimeResist(0.375f + PerkZedTimeResist);
		NotifyBeginState();
	}

	simulated function EndState(Name NextStateName)
	{
		ClearTimer('WeaponEquipped');
		ClearZedTimeResist();
		NotifyEndState();
	}
}

/**
 * Sets the timing for equipping a weapon.
 * The WeaponEquipped event is trigged when expired
 */
simulated function TimeWeaponEquipping()
{
	// Play the animation
	PlayWeaponEquip();

	SetTimer(EquipTime, false, nameof( WeaponEquipped ) );
}

simulated function WeaponEquipped();

/**
 * Show the weapon begin equipped
 */
simulated function PlayWeaponEquip()
{
	// Play the animation for the weapon being equipped
	PlayAnimation(GetEquipAnimName(), 0.f,,0.f);
}

/** Get equip anim name (overridden as necessary) */
simulated function name GetEquipAnimName()
{
	return EquipAnim;
}

/*********************************************************************************************
 * State WeaponPuttingDown
 * Putting down weapon in favor of a new one.
 * Weapon is transitioning to the Inactive state.
*********************************************************************************************/

simulated state WeaponPuttingDown
{
	simulated function byte GetWeaponStateId()
	{
		return WEP_PutAway;
	}

	simulated function BeginState( Name PreviousStateName )
	{
		local KFPerk InstigatorPerk;
		local float PerkZedTimeResist;

		// Turn off flashlight if it is on and we are changing weapons
		if ( Flashlight != none && Flashlight.bEnabled && Instigator.IsLocallyControlled() )
		{
			KFPawn_Human(Instigator).SetFlashlight(false, true);
		}

		TimeWeaponPutDown();
		bWeaponPutDown = false;

		InstigatorPerk = GetPerk();
		if ( InstigatorPerk != none )
		{
			PerkZedTimeResist = InstigatorPerk.GetZedTimeModifier(self);
		}

		SetZedTimeResist(0.375f + PerkZedTimeResist);
		NotifyBeginState();
	}

	simulated function EndState(Name NextStateName)
	{
		Super.EndState(NextStateName);

		ClearZedTimeResist();
		NotifyEndState();
	}

	simulated function Activate();
}

// Control 'WeaponDownSimple' state
simulated function SetSimplePutDown(bool bPutDownWeapon)
{
	if ( bPutDownWeapon )
	{
		GotoState('WeaponDownSimple');
	}
}

simulated function bool CanSwitchWeapons()
{
    return true;
}

/*********************************************************************************************
 * State WeaponDownSimple
 * Putting the weapon down off the screen, don't allow shooting or switching weapons
*********************************************************************************************/
simulated state WeaponDownSimple
{
	ignores CanThrow;

	simulated function bool CanTransitionToIronSights() {return false;}
	simulated function bool DenyClientWeaponSet() {return true;}
	simulated function bool CanReload() {return false;}
    simulated function SetIronSights(bool bNewIronSights){}
	simulated event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime){}

    simulated function bool CanSwitchWeapons()
    {
        return false;
    }

    exec function SimplePutDown()
    {
        SetSimplePutDown(false);
    }

	simulated function BeginState(name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);

		// Turn off flashlight if it is on and we are changing weapons
		if ( Flashlight != none && Flashlight.bEnabled && Instigator.IsLocallyControlled() )
		{
			KFPawn_Human(Instigator).SetFlashlight(false, true);
		}

        bDoingQuickDownZoom = true;

    	if ( Instigator.IsLocallyControlled() )
    	{
            ZoomDown(true, QuickWeaponDownTime);
    	}

		// Go to a looping idle animation to avoid screen clipping
		if( Instigator.IsFirstPerson() )
		{
			PlayAnimation(IdleAnims[0], 0.0, true, 0.2);
		}

		StopFire(CurrentFireMode);
	}

    /**
     * Zoom the weapon down, off the screen
     *
     * @param bAnimateTransition whether or not to animate this zoom transition
     * @param ZoomTimeToGo how much zoom time is left
     */
    simulated function ZoomDown(bool bAnimateTransition, float ZoomTimeToGo)
    {
    	if( bAnimateTransition )
    	{
    		ZoomInTime=ZoomTimeToGo;

    		// If the zoom out was interrupted, set the parameters for the native code to interpolate the zoom from the proper position
    		if( bZoomingOut )
    		{
    			bZoomingOut=false;
    			// Flag so the native code knows the zoom was interupted
    			bZoomOutInterrupted=true;
    			// Set the zoom time relative to how far along we were when zooming out
    			ZoomTime=ZoomInTime - ZoomTime;
    			// Let the native code know where/when the zoom was interrupted
    			ZoomPartialTime=ZoomTime;
    			ZoomStartOffset=PlayerViewOffset;
    			ZoomRotStartOffset=ZoomRotInterp;
    		}
    		else
    		{
    			ZoomTime=ZoomInTime;
    			ZoomStartOffset=PlayerViewOffset;
    		}

            // Zoom down to hipped offset
    		ZoomTargetOffset=default.PlayerViewOffset;

    		if( MySkelMesh != none )
    		{
    			ZoomWeaponFOVStart=MySkelMesh.FOV;
    		}
    		else
    		{
    			ZoomWeaponFOVStart=MeshFOV;
    		}

        	if( WorldInfo.NetMode != NM_DedicatedServer && Instigator != none )
        	{
        		EnableIronSightsDoF(false);
        		EnablePlayerZoom(false);
        	}

    		bZoomingIn=true;
    	}
    }

	simulated function EndState(name NextStateName)
	{
		Super.EndState(NextStateName);

		ClearTimer('EndWeaponDownSimpleTimer');

        bDoingQuickDownZoom=false;
	}

	simulated function EndWeaponDownSimpleTimer()
	{
		// we're done, leave state and go back to active
		GotoState('Active');
	}

	simulated function SetSimplePutDown(bool bPutDownWeapon)
	{
		if ( !bPutDownWeapon )
		{
			if ( WorldInfo.NetMode == NM_DedicatedServer || WorldInfo.NetMode == NM_ListenServer && !Instigator.IsLocallyControlled() )
			{
				// Slightly faster on the server to prevent sync issues
				EndWeaponDownSimpleTimer();
			}
			else
			{
				SetTimer(QuickWeaponDownFinishTime, false, 'EndWeaponDownSimpleTimer');
        		if ( Instigator.IsLocallyControlled() )
            	{
                    ZoomOut(true, QuickWeaponDownFinishTime);
            	}
			}
		}
		else
		{
			ClearTimer('EndWeaponDownSimpleTimer');
        	if ( Instigator.IsLocallyControlled() )
        	{
                ZoomDown(true, QuickWeaponDownTime);
        	}
			StopFire(CurrentFireMode);
		}
	}
}

/**
 * Sets the timing for putting a weapon down.  The WeaponIsDown event is trigged when expired
*/
simulated function TimeWeaponPutDown()
{
	if( Instigator.IsFirstPerson() )
	{
		PlayWeaponPutDown();
	}

	super.TimeWeaponPutDown();
}

/**
 * Show the weapon being put away
 */
simulated function PlayWeaponPutDown()
{
	// Play the animation for the weapon being put down
	PlayAnimation( GetWeaponPutDownAnimName(), PutDownTime );
}

/** Get putdown anim name (overridden as necessary) */
simulated function name GetWeaponPutDownAnimName()
{
	return PutDownAnim;
}

/**
 * When attempting to put the weapon down, look to see if our MinFiringPutDownPct has been met.  If so just put it down
 */
simulated function bool TryPutDown()
{
	local float MinTimerTarget;
	local float TimerCount;

	bWeaponPutDown = true;

	if (!IsTimerActive('RefireCheckTimer'))
	{
		PutDownWeapon();
	}
	else
	{
		MinTimerTarget = GetTimerRate('RefireCheckTimer') * MinFiringPutDownPct;
		TimerCount = GetTimerCount('RefireCheckTimer');

		if (TimerCount >= MinTimerTarget)
		{
			PutDownWeapon();
		}
		else
		{
			// Shorten the wait time
			SetTimer(MinTimerTarget - TimerCount, false, nameof( FiringPutDownWeapon ) );
		}
	}

	return true;
}

simulated function FiringPutDownWeapon()
{
	if (bWeaponPutDown)
	{
		PutDownWeapon();
	}
}

/*********************************************************************************************
* State WeaponAbortEquip
* Special PuttingDown state used when WeaponEquipping is interrupted.  Must come after
* WeaponPuttingDown definition or this willextend the super version.
*********************************************************************************************/

simulated state WeaponAbortEquip extends WeaponPuttingDown
{
	simulated function TimeWeaponPutDown()
	{
		local AnimNodeSequence AnimNode;
		local float Rate;

		// Time the abort
		SetTimer(FMax(EquipAbortTime, 0.01),, nameof(WeaponIsDown) );

		if (WorldInfo.NetMode != NM_DedicatedServer)
		{
			// play anim
			AnimNode = GetWeaponAnimNodeSeq();
			if (AnimNode != None && AnimNode.AnimSeq != None)
			{
				AnimNode.SetAnim(PutDownAnim);
				Rate = AnimNode.AnimSeq.SequenceLength / PutDownTime;
				AnimNode.PlayAnim(false, Rate, AnimNode.AnimSeq.SequenceLength - EquipAbortTime * Rate);
			}
		}
	}
}

/*********************************************************************************************
 * state WeaponFiring
 * This is the default Firing State.  It's performed on both the client and the server.
 *********************************************************************************************/
simulated state WeaponFiring
{
	ignores AllowSprinting;

	simulated function BeginState(Name PrevStateName)
	{
		local KFPerk InstigatorPerk;

		InstigatorPerk = GetPerk();
		if( InstigatorPerk != none )
		{
			SetZedTimeResist( InstigatorPerk.GetZedTimeModifier(self) );
		}

		if ( bLoopingFireAnim.Length > 0 || bLoopingFireSnd.Length > 0 )
		{
			StartLoopingFireEffects(CurrentFireMode);
		}

		super.BeginState(PrevStateName);
	}

	simulated event Tick(float DeltaTime)
	{
		Global.Tick(DeltaTime);

        // Stop the looping fire sound if we're in zed time and want to play single fire sounds
        if( bPlayingLoopingFireSnd && ShouldForceSingleFireSound() )
        {
    		StopLoopingFireSound(CurrentFireMode);
        }
	}

	/**
	 * Timer event, call is set up in Weapon::TimeWeaponFiring().
	 * The weapon is given a chance to evaluate if another shot should be fired.
	 * This event defines the weapon's rate of fire.
	 */
	simulated function RefireCheckTimer()
	{
		local KFPerk InstigatorPerk;

		InstigatorPerk = GetPerk();
		if( InstigatorPerk != none )
		{
			SetZedTimeResist( InstigatorPerk.GetZedTimeModifier(self) );
		}

		super.RefireCheckTimer();
	}

	simulated function EndState(Name NextStateName)
	{
		super.EndState(NextStateName);

		ClearZedTimeResist();

		// Simulate weapon firing effects on the local client
		if( WorldInfo.NetMode == NM_Client )
		{
			Instigator.WeaponStoppedFiring(self, false);
		}

		if ( bPlayingLoopingFireAnim || bPlayingLoopingFireAnim )
		{
			StopLoopingFireEffects(CurrentFireMode);
		}
	}

	/** Override to continue any looping fire anims */
	simulated event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
	{
		local name WeaponFireAnimName;

		if ( WorldInfo.NetMode != NM_DedicatedServer )
		{
			// If loop start or another event such as IronSights transition ended, restart looping fire anim.
			if ( bPlayingLoopingFireAnim )
			{
				WeaponFireAnimName = GetLoopingFireAnim(CurrentFireMode);
				if ( WeaponFireAnimName != '' )
				{
					PlayAnimation(WeaponFireAnimName, MySkelMesh.GetAnimLength(WeaponFireAnimName), true, 0.f);
				}
			}
		}
	}

	/** don't allow for a pickup to switch the weapon */
	simulated function bool DenyClientWeaponSet()
	{
		return true;
	}
}

/**
 * Sets the timing for the firing state on server and local client.
 * By default, a constant looping Rate Of Fire (ROF) is set up.
 * When the delay has expired, the RefireCheckTimer event is triggered.
 *
 * Network: LocalPlayer and Server
 *
 * @param	FireModeNum		Fire Mode.
 */
simulated function TimeWeaponFiring( byte FireModeNum )
{
	local Float AdjustedFireInterval;
	local KFPerk CurrentPerk;

	// if weapon is not firing, then start timer. Firing state is responsible to stopping the timer.
	if( !IsTimerActive('RefireCheckTimer') )
	{
		// Let the perk adjust the rate of fire if needed;
		AdjustedFireInterval = GetFireInterval(FireModeNum);

        CurrentPerk = GetPerk();
		if( CurrentPerk != none )
		{
            GetPerk().ModifyRateOfFire(AdjustedFireInterval);
		}

		SetTimer(AdjustedFireInterval, true, nameof(RefireCheckTimer) );
	}
}

/*********************************************************************************************
 * State WeaponSingleFiring
 * Fire must be released between every shot.
 *********************************************************************************************/

simulated state WeaponSingleFiring extends WeaponFiring
{
	/** Handle ClearPendingFire */
	simulated function FireAmmunition()
    {
        Super.FireAmmunition();

		// ClearPendingFire flag each time so that player has to press fire button
		// again.  Called from BeginState and RefireCheckTimer
		ClearPendingFire(CurrentFireMode);
	}
}

/*********************************************************************************************
 * State GrenadeFiring
 * Handles firing grenades.
 *********************************************************************************************/

/** Synchronize the server if it's not quite finished with another state */
reliable server private function ServerGotoGrenadeFiring()
{
	SendToFiringState(GRENADE_FIREMODE);
}

/** Set the cooldown time for weak zed grab for the pawn holding this weapon */
function SetWeakZedGrabCooldownOnPawn(float WeakZedGrabCooldown)
{
	local KFPawn KFP;

    if( Role == ROLE_Authority )
    {
    	KFP = KFPawn(Instigator);

    	if( KFP != none )
    	{
            KFP.SetWeakGrabCoolDown(WeakZedGrabCooldown);
    	}
    }
}

simulated state GrenadeFiring extends WeaponSingleFiring
{
	simulated function byte GetWeaponStateId()
	{
		return WEP_Grenade;
	}

	// Overriden to not call FireAmmunition right at the start of the state
    simulated event BeginState( Name PreviousStateName )
	{
		LogInternal(WorldInfo.TimeSeconds @ "Self:" @ Self @ "Instigator:" @ Instigator @ GetStateName() $ "::" $ GetFuncName() @ "PreviousStateName:" @ PreviousStateName,'Inventory');

        // Don't let a weak zed grab us right after throwing a grenade
        SetWeakZedGrabCooldownOnPawn(GrenadeTossWeakZedGrabCooldown);

		PlayGrenadeThrow();
		TimeWeaponFiring(CurrentFireMode);
		ClearPendingFire(CurrentFireMode);

		// Consume ammo right away instead of when grenade is spawned.  This gives time
		// for the client to get an updated grenade count before GotoState('Active')
		if ( Role == ROLE_Authority && KFInventoryManager(InvManager) != none )
        {
            KFInventoryManager(InvManager).ConsumeGrenades();

            // __TW_ANALYTICS_
            if(WorldInfo.Game != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress()){KFGameInfo(WorldInfo.Game).GameplayEventsWriter.LogPlayerIntEvent(class'KFGameplayEventsWriter'.const.GAMEEVENT_GRENADE_THROWN,Instigator.Controller,KFInventoryManager(InvManager).GrenadeCount);};
        }
		else if ( Role < ROLE_Authority && Instigator.IsLocallyControlled() )
		{
			// force synchronize the server to spawn the projectile
			ServerGotoGrenadeFiring();
		}

		NotifyBeginState();
	}

	simulated function EndState(Name NextStateName)
	{
		Super.EndState(NextStateName);
		NotifyEndState();

		// Spawn grenade, cannot be skipped once this state starts
		ProjectileFire();
	}

    /**
     * This function returns the world location for spawning the visual effects
     * Overridden to use a special offset for throwing grenades
     */
    simulated event vector GetMuzzleLoc()
    {
        local Rotator ViewRotation;

		if( Instigator != none )
		{
			ViewRotation = Instigator.GetViewRotation();

			// Add in the free-aim rotation
			if ( KFPlayerController(Instigator.Controller) != None )
			{
				ViewRotation += KFPlayerController(Instigator.Controller).WeaponBufferRotation;
			}

			return Instigator.GetPawnViewLocation() + (GrenadeFireOffset >> ViewRotation);
		}

		return Location;
    }

	/** Never refires.  Must re-enter this state instead. */
	simulated function bool ShouldRefire()
	{
		return false;
	}
}

/** Play animation at the start of the GrenadeFiring state */
simulated function PlayGrenadeThrow()
{
    local name WeaponFireAnimName;

    PlayFiringSound(CurrentFireMode);

    if( Instigator != none && Instigator.IsFirstPerson() )
    {
    	WeaponFireAnimName = GetGrenadeThrowAnim();

    	if ( WeaponFireAnimName != '' )
    	{
    		PlayAnimation(WeaponFireAnimName, MySkelMesh.GetAnimLength(WeaponFireAnimName),,FireTweenTime);
    	}
    }
}

/** Get nade throw anim name (overridden as necessary) */
simulated function name GetGrenadeThrowAnim()
{
	return GrenadeThrowAnim;
}

/*********************************************************************************************
 * State Reloading
 * This is the default Reloading State.  It's performed on both the client and the server.
 *********************************************************************************************/

// Global declarations for reload state
simulated function ReloadStatusTimer();
simulated function ReloadAmmoTimer();
simulated function ReloadComplete();
simulated function AbortReload();

/** Called on local player when reload starts and replicated to server */
simulated function InitializeReload()
{
	ReloadAmountLeft = Min(MagazineCapacity[0] - AmmoCount[0], SpareAmmoCount[0]);
	if ( Role < ROLE_Authority )
	{
		ServerSendToReload(ReloadAmountLeft);
	}
}

/** Called from client when reload starts */
reliable server function ServerSendToReload(byte ClientReloadAmount)
{
	ReloadAmountLeft = ClientReloadAmount;
	SendToFiringState(RELOAD_FIREMODE);
}

/**
 * State Reloading
 * State the weapon is in when it is being reloaded (current magazine replaced with a new one, related animations and effects played).
 */
simulated state Reloading
{
	ignores ForceReload, ShouldAutoReload, AllowSprinting;

	simulated function byte GetWeaponStateId()
	{
		local KFPerk Perk;
		local bool bTacticalReload;

		Perk = GetPerk();
		bTacticalReload = (Perk != None && Perk.GetUsingTactialReload(self));

		if ( !bReloadFromMagazine )
		{
			if ( bTacticalReload )
			{
				return AmmoCount[0] > 0 ? WEP_ReloadSingle_Elite : WEP_ReloadSingleEmpty_Elite;
			}
			return AmmoCount[0] > 0 ? WEP_ReloadSingle : WEP_ReloadSingleEmpty;
		}
		else
		{
			if ( bTacticalReload )
			{
				return AmmoCount[0] > 0 ? WEP_Reload_Elite : WEP_ReloadEmpty_Elite;
			}
			return AmmoCount[0] > 0 ? WEP_Reload : WEP_ReloadEmpty;
		}
	}

	simulated function BeginState(name PreviousStateName)
	{
		local KFPerk InstigatorPerk;

		InstigatorPerk = GetPerk();
		if ( InstigatorPerk != none )
		{
			SetZedTimeResist(InstigatorPerk.GetZedTimeModifier(self));
		}

		// Leave ironsights
		if ( bUsingSights )
		{
			ZoomOut(false, default.ZoomOutTime);
		}

		bEnableTiltSkelControl = false;
		bPendingAutoSwitchOnDryFire = false;

		ReloadStatus = RS_None;
		TimeWeaponReloading();

		NotifyBeginState();

		if(WorldInfo.Game != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress()){KFGameInfo(WorldInfo.Game).GameplayEventsWriter.LogPlayerWeaponReload(self,Instigator.Controller);};
		if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayReloadDialog( KFPawn(Instigator) );
	}

	simulated function EndState(Name NextStateName)
	{
		ClearZedTimeResist();
		ClearTimer(nameof(ReloadStatusTimer));
		ClearTimer(nameof(ReloadAmmoTimer));
		ClearPendingFire(RELOAD_FIREMODE);


		if ( bAllowClientAmmoTracking && Role < ROLE_Authority )
		{
			ServerSyncReload(SpareAmmoCount[0]);
		}


		CheckBoltLockPostReload();
		NotifyEndState();

		if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayAmmoDialog( KFPawn(Instigator), float(SpareAmmoCount[0]) / float(MaxSpareAmmo[0]) );
	}

	simulated function BeginFire(byte FireModeNum)
	{
		Global.BeginFire(FireModeNum);

		// handle reload interrupts
		if ( FireModeNum != RELOAD_FIREMODE )
		{
			if ( !bReloadFromMagazine || CanOverrideMagReload(FireModeNum) )
			{
				// if able, immediately interupt/abort the reload state
				if( PendingFire(FireModeNum) && HasAmmo(FireModeNum) )
				{
					AbortReload();
				}
			}
		}
	}

	/** Cancel reload when going into ironsights */
	simulated function ZoomIn(bool bAnimateTransition, float ZoomTimeToGo)
	{
		// Do zoom first in case Abort takes us to a state where sights are disallowed
		Global.ZoomIn(bAnimateTransition, ZoomTimeToGo);

		AbortReload();
	}

	/** @see Weapon::TryPutDown() */
	simulated function bool TryPutDown()
	{
		PutDownWeapon();
		return TRUE;
	}

	/** Update Reload Status */
	simulated function ReloadStatusTimer()
	{
		// If we haven't added ammo yet, do it now.  Handles reloading when the
		// weapon is missing notifies or the notify is very close to the end.
		if ( ReloadStatus == RS_Reloading && IsTimerActive(nameof(ReloadAmmoTimer)) )
		{
			PerformReload();
			ClearTimer(nameof(ReloadAmmoTimer));
		}

		TimeWeaponReloading();
	}

	/** Call Perform Reload */
	simulated function ReloadAmmoTimer()
	{
		PerformReload();
	}

	/** Cleanup reload state */
	simulated function ReloadComplete()
	{
		// we're done, leave state and go back to active
		GotoState('Active');
	}

	/** Called when reload animation is interrupted */
	simulated function AbortReload()
	{
		// we're done, leave state and go back to active
		GotoState('Active');
	}
}

/** Called during reload state */
simulated function bool CanOverrideMagReload(byte FireModeNum)
{
	if ( FireModeNum == BASH_FIREMODE || FireModeNum == GRENADE_FIREMODE )
	{
		return true;
	}

	return false;
}

/**
 * Sets the timing for equipping a weapon.
 * The WeaponEquipped event is trigged when expired
 */
simulated function TimeWeaponReloading()
{
	local name AnimName;
	local float AnimLength, AnimRate;
	local float AmmoTimer, StatusTimer;

	ReloadStatus = GetNextReloadStatus();

	// If we're finished exit reload
	if ( ReloadStatus == RS_Complete || MySkelMesh == None )
	{
		ReloadComplete();
		return;
	}

    // get desired animation and play-rate
    AnimName = GetReloadAnimName( UseTacticalReload() );
    AnimRate = GetReloadRateScale();
	AnimLength = AnimRate * MySkelMesh.GetAnimLength(AnimName);

	if ( AnimLength > 0.f )
	{
		MakeNoise(0.5f,'PlayerReload'); // AI

		if ( Instigator.IsFirstPerson() )
		{
			PlayAnimation(AnimName, AnimLength);
		}

		// Start timer for when to give ammo (aka 'PerformReload')
		if ( ReloadStatus == RS_Reloading )
		{
			AmmoTimer = AnimRate * MySkelMesh.GetReloadAmmoTime(AnimName);
			SetTimer(AmmoTimer, FALSE, nameof(ReloadAmmoTimer));
		}

		// Start timer for when to continue (e.g. ReloadComplete, TimeWeaponReloading)
		if ( bReloadFromMagazine || ReloadStatus == RS_ClosingBolt )
		{
			StatusTimer = AnimRate * MySkelMesh.GetAnimInterruptTime(AnimName);
		}
		else
		{
			StatusTimer = AnimLength;
		}

		SetTimer(StatusTimer, FALSE, nameof(ReloadStatusTimer));
	}
	else
	{
		WarnInternal("ReloadDuration is zero!!!");
		ReloadComplete();
	}
}

/** Returns an anim rate scale for reloading */
simulated function float GetReloadRateScale()
{
	local float Rate;
	local KFPerk MyPerk;
	local KFGameReplicationInfo KFGRI;

	Rate = 1.f;

	MyPerk = GetPerk();
	if( MyPerk != None )
	{
		Rate = MyPerk.GetReloadRateScale( self );
	}

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if( KFGRI != none && KFGRI.IsLeadershipActive() )
	{
		Rate -= class'KFPerk_Commando'.static.GetLeadshipRateReduction();
	}

	return Rate;
}

/** Access perk skill for tactical reload */
simulated function bool UseTacticalReload()
{
	local KFPerk MyPerk;

	MyPerk = GetPerk();
	if ( MyPerk != None )
	{
		return MyPerk.GetUsingTactialReload(self);
	}

	return false;
}

/** Move to the next valid reload status */
simulated function EReloadStatus GetNextReloadStatus()
{
	// Magazine reloading
	if ( bReloadFromMagazine )
	{
		if ( ReloadStatus < RS_Reloading )
		{
			return RS_Reloading;
		}
		return RS_Complete;
	}

	// Single shot reloading
	switch ( ReloadStatus )
	{
		case RS_None:
			return RS_OpeningBolt;
		case RS_OpeningBolt:
			return RS_Reloading;
		case RS_Reloading:
			if ( HasSpareAmmo() && ReloadAmountLeft > 0 )
			{
				return RS_Reloading;
			}
			return RS_ClosingBolt;
	}

	return RS_Complete;
}

/** Returns animation to play based on reload type and status */
simulated function name GetReloadAnimName( bool bTacticalReload )
{
	if ( !bReloadFromMagazine )
	{
		switch ( ReloadStatus )
		{
			case RS_OpeningBolt:
				return (bTacticalReload) ? ReloadOpenEliteAnim : ReloadOpenAnim;
			case RS_ClosingBolt:
				return (bTacticalReload) ? ReloadCloseEliteAnim : ReloadCloseAnim;
		}

		return (bTacticalReload) ? ReloadSingleEliteAnim : ReloadSingleAnim;
	}

	// magazine relaod
	if ( AmmoCount[0] > 0 )
	{
		return (bTacticalReload) ? ReloadNonEmptyMagEliteAnim : ReloadNonEmptyMagAnim;
	}
	else
	{
		return (bTacticalReload) ? ReloadEmptyMagEliteAnim : ReloadEmptyMagAnim;
	}
}

/** Performs actual ammo reloading */
simulated function PerformReload()
{
	local int ReloadAmount;

	if ( bInfiniteSpareAmmo )
	{
		AmmoCount[0] = MagazineCapacity[0];
		ReloadAmountLeft = 0;
		return;
	}

	// Server only unless bAllowClientAmmoTracking

	if ( (Role == ROLE_Authority && !bAllowClientAmmoTracking) || (Instigator.IsLocallyControlled() && bAllowClientAmmoTracking) )



	{
		if( MaxSpareAmmo[0] > 0 && SpareAmmoCount[0] > 0 )
		{
			if ( bReloadFromMagazine )
			{
				// clamp reload amount to spare ammo size
				ReloadAmount = Min(ReloadAmountLeft, SpareAmmoCount[0]);
			}
			else
			{
				ReloadAmount = 1;
			}

			// increment and clamp magazine ammo
			AmmoCount[0] = Min(AmmoCount[0] + ReloadAmount, MagazineCapacity[0]);


			// Update SpareAmmo, even if this is the client (for immediate feedback).  This is safe as long as
			// the server doesn't consume SpareAmmo first which is enforced by ServerSyncReload
			SpareAmmoCount[0] -= ReloadAmount;








		}
	}

	// decrement ReloadAmountLeft
	if ( bReloadFromMagazine )
	{
		ReloadAmountLeft = 0;
	}
	else if ( ReloadAmountLeft > 0 )
	{
		ReloadAmountLeft--;
	}
}

/** 
 * Called on reload end state if this weapon has unlocked the bolt
 * during reload.  If reload was interrupted before ammo was give
 * the bolt should revert to previous state
 */
simulated function CheckBoltLockPostReload()
{
	if ( bCheckBoltLockPostReload )
	{
		if ( ReloadStatus < RS_Complete )
		{
			if ( bAllowClientAmmoTracking && AmmoCount[0] == 0 )
			{
				EmptyMagBlendNode.SetBlendTarget(1, 0);
			}
		}

		bCheckBoltLockPostReload = false;
	}
}

/*********************************************************************************************
 * State WeaponSprinting
 * This is the default Sprinting State.  It's performed on both the client and the server.
 *********************************************************************************************/

// Global declarations for sprinting state
simulated function SprintLoopTimer();
simulated function SprintRetryTimer();

/**
 * State WeaponSprinting
 * State the weapon is in when it is being reloaded (current magazine replaced with a new one, related animations and effects played).
 */
simulated state WeaponSprinting
{
	ignores ForceReload;

	simulated function BeginState(name PreviousStateName)
    {
   		PlaySprintStart();
	}

	simulated function EndState(Name NextStateName)
	{
		PlaySprintEnd();
	}

	simulated function SprintLoopTimer()
	{
		PlaySprintLoop();
	}

	simulated function SprintRetryTimer()
	{
		PlaySprintStart();
	}

	simulated function SetWeaponSprint(bool bNewSprintStatus)
	{
		if ( !bNewSprintStatus )
		{
			GotoState('Active');
		}
	}

	simulated function SetIronSights(bool bNewIronSights)
	{
		Global.SetIronSights(bNewIronSights);

		if ( bUsingSights )
		{
			StopPawnSprint(true);
		}
	}

	/** Override BeginFire so that shooting/attacking will interrupt sprinting */
	simulated function BeginFire(byte FireModeNum)
	{
		if( !bDeleteMe && Instigator != None )
		{
			Global.BeginFire(FireModeNum);

			if( PendingFire(FireModeNum) && HasAmmo(FireModeNum) )
			{
				StopPawnSprint(false);
			}
		}
	}
}

simulated function PlaySprintStart()
{
	local KFPlayerController KFPC;
	local name AnimName;
	local float AnimDuration;

	// Retry timer if we're in the middle of something that we don't want to interrupt
	if ( bZoomingOut )
	{
		SetTimer(0.1f, false, nameof(SprintRetryTimer));
		return;
	}

	AnimName = GetSprintStartAnimName();

	if( Instigator.IsLocallyControlled() )
	{
		KFPC = KFPlayerController(Instigator.Controller);
		if ( KFPC != None )
		{
			KFPC.HandleTransitionFOV(PlayerSprintFOV, 0.25);
		}

		PlayAnimation( AnimName );
	}

	// set timer to begin the looping state
	AnimDuration = MySkelMesh.GetAnimLength( AnimName );
	if ( AnimDuration > 0.f )
	{
		SetTimer(AnimDuration, false, nameof(SprintLoopTimer));
	}
	else
	{
		SprintLoopTimer();
	}
}

/** Get sprint start anim name (overridden as necessary) */
simulated function name GetSprintStartAnimName()
{
	return SprintStartAnim;
}

simulated function PlaySprintLoop()
{
	local name AnimName;

	if( Instigator.IsLocallyControlled() )
	{
		AnimName = GetSprintLoopAnimName();

		SprintAnimRate = GetSprintAnimRate();

		if (SprintCameraAnimInst != None)
		{
			SprintCameraAnimInst.Stop(TRUE);
		}

		if (SprintCameraAnim != None)
		{
			SprintCameraAnimInst = PlayCameraAnim(SprintCameraAnim, SprintAnimRate, SprintAnimRate, 0.3, 0.5, true, true);
		}

		PlayAnimation(AnimName, MySkelMesh.GetAnimLength(AnimName) / SprintAnimRate, true);
	}
}

/** Get sprint loop anim name (overridden as necessary) */
simulated function name GetSprintLoopAnimName()
{
	return SprintLoopAnim;
}

simulated function PlaySprintEnd()
{
	local KFPlayerController KFPC;
	local name AnimName;

	if ( Instigator.IsLocallyControlled() )
	{
		AnimName = GetSprintEndAnimName();

		KFPC = KFPlayerController(Instigator.Controller);
		if ( KFPC != None && !bUsingSights )
		{
			KFPC.HandleTransitionFOV(KFPC.DefaultFOV, 0.25);
		}

		PlayAnimation(AnimName);
	}
}

/** Get sprint end anim name (overridden as necessary) */
simulated function name GetSprintEndAnimName()
{
	return SprintEndAnim;
}

simulated function float GetSprintAnimRate()
{
	return 1.f;
}

/*********************************************************************************************
 * State MeleeAttackBasic
 * This is a basic melee state that's used as a base for other more advanced states
 *********************************************************************************************/

/** Is this weapon currently in a melee attack firemode/state */
simulated function bool IsMeleeing();
/** Checks to see if we can perform another melee strike without changing states */
simulated function bool ShouldContinueMelee(optional int ChainCount);
/** Notification from the melee helper that a melee strike connected */
simulated function NotifyMeleeCollision(Actor HitActor, optional vector HitLocation);

/**
 * state MeleeAttackBasic
 * State the weapon is in when doing a melee attack
 */
simulated state MeleeAttackBasic
{
	ignores AllowSprinting, AllowIronSights;

	simulated function bool IsMeleeing() { return TRUE; }

	simulated function BeginState(Name PreviousStateName)
	{
		// Leave ironsights
		if ( bUsingSights )
		{
			ZoomOut(false, default.ZoomOutTime);
		}

		TimeWeaponFiring(CurrentFireMode);
		NotifyBeginState();
	}

	simulated function EndState(Name NextStateName)
	{
		ClearTimer( nameof(RefireCheckTimer) );
		NotifyEndState();
	}

	/** Allow the MeleeAttackHelper to do damage and setup timing */
	simulated function TimeWeaponFiring(byte FireModeNum)
	{
		// For standard melee attacks, use the helper object
		MeleeAttackHelper.BeginMeleeAttack();

		// Unless this a loop/chain attack, clear pending fire.
		// Do this at the beginning of an attack not the end, just like WeaponSingleFiring
		if( PendingFire(CurrentFireMode) && !ShouldContinueMelee() )
		{
			ClearPendingFire(CurrentFireMode);
		}
	}

	simulated function byte GetWeaponStateId()
	{
		return WEP_MeleeBasic;
	}
}

/** Called from the MeleeHelper class to allow for the weapon to override settings */
simulated function PlayMeleeAnimation(name AnimName, out float out_Rate, float BlendTime)
{
	local KFPerk InstigatorPerk;
	local float Duration;

	InstigatorPerk = GetPerk();
	if ( InstigatorPerk != none )
	{
		InstigatorPerk.ModifyMeleeAttackSpeed(out_Rate);
	}

	Duration = MySkelMesh.GetAnimLength(AnimName);
	Duration *= out_Rate; // scale by desired rate
	PlayAnimation(AnimName, Duration,, BlendTime);
}

/** returns the damage amount for this attack */
simulated function int GetMeleeDamage(byte FireModeNum, optional vector RayDir)
{
	return InstantHitDamage[FireModeNum];
}

///////////////////////////////////////////////////////////////////////////////////////////
//
// Trader
//
///////////////////////////////////////////////////////////////////////////////////////////

/** Allows weapon to calculate its own stats for display in trader */
static simulated event SetTraderWeaponStats( out array<STraderItemWeaponStats> WeaponStats )
{
	WeaponStats.Length = 4;

	WeaponStats[0].StatType = TWS_Damage;
	WeaponStats[0].StatValue = CalculateTraderWeaponStatDamage();

	// attacks per minutes (design says minute. why minute?)
	WeaponStats[1].StatType = TWS_RateOfFire;
	WeaponStats[1].StatValue = CalculateTraderStatFireRate();

	WeaponStats[2].StatType = TWS_Range;
	WeaponStats[2].StatValue = CalculateTraderWeaponStatRange();

	WeaponStats[3].StatType = TWS_Penetration;
	WeaponStats[3].StatValue = default.PenetrationPower[DEFAULT_FIREMODE];
}

/** Allows weapon to calculate its own damage for display in trader */
static simulated function float CalculateTraderWeaponStatDamage()
{
	local float CalculatedDamage;
	local class<KFDamageType> DamageType;

	CalculatedDamage = default.InstantHitDamage[DEFAULT_FIREMODE];

	DamageType = class<KFDamageType>(default.InstantHitDamageTypes[DEFAULT_FIREMODE]);
	if( DamageType != none && DamageType.default.DoT_Type != DOT_None )
	{
		CalculatedDamage += (DamageType.default.DoT_Duration / DamageType.default.DoT_Interval) * (CalculatedDamage * DamageType.default.DoT_DamageScale);
	}

	return CalculatedDamage;
}

/** Allows weapon to calculate its own fire rate for display in trader */
static simulated function float CalculateTraderStatFireRate()
{
	return 60.f / default.FireInterval[DEFAULT_FIREMODE]; // attacks per minute
}

/** Allows weapon to calculate its own range for display in trader */
static simulated function float CalculateTraderWeaponStatRange()
{
	return default.EffectiveRange;
}

defaultproperties
{
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
   FireModeIconPaths(1)=None
   SingleFireMode=255
   FilterTypeUI=FT_Assault
   bTargetFrictionEnabled=True
   bTargetAdhesionEnabled=True
   DOF_bOverrideEnvironmentDOF=True
   bCanRefillSecondaryAmmo=True
   bAllowClientAmmoTracking=True
   bUseAnimLenEquipTime=True
   bUseAdditiveMoveAnim=True
   MinFiringPutDownPct=0.800000
   PenetrationPower(0)=0.000000
   PenetrationPower(1)=0.000000
   PenetrationDamageReductionCurve(0)=(Points=(,(InVal=1.000000,OutVal=1.000000)))
   PenetrationDamageReductionCurve(1)=(Points=(,(InVal=1.000000,OutVal=1.000000)))
   GrenadeTossWeakZedGrabCooldown=1.000000
   TargetFrictionDistanceMin=320.000000
   TargetFrictionDistancePeak=200.000000
   TargetFrictionDistanceMax=4000.000000
   TargetFrictionDistanceCurve=(Points=(,(InVal=320.000000),(InVal=2000.000000,OutVal=1.000000),(InVal=4000.000000,OutVal=0.300000),(InVal=9000.000000)))
   TargetFrictionMultiplierRange=(X=0.300000,Y=0.400000)
   TargetFrictionPeakRadiusScale=1.000000
   TargetFrictionPeakHeightScale=0.200000
   TargetFrictionOffset=(X=0.000000,Y=0.000000,Z=32.000000)
   TargetFrictionZoomedBoostValue=0.250000
   TargetAdhesionDistanceMax=2000.000000
   TargetAdhesionAimDistY=128.000000
   TargetAdhesionAimDistZ=96.000000
   TargetAdhesionScaleRange=(X=0.300000,Y=2.850000)
   TargetAdhesionZoomedBoostValue=0.250000
   MeshFOV=86.000000
   MeshIronSightFOV=75.000000
   PlayerIronSightFOV=75.000000
   PlayerSprintFOV=95.000000
   ZoomInTime=0.150000
   ZoomOutTime=0.150000
   ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
   QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=16384)
   QuickWeaponDownTime=0.400000
   QuickWeaponDownFinishTime=0.200000
   FastZoomOutTime=0.100000
   DOF_SharpRadius=500.000000
   DOF_FocalRadius=1000.000000
   DOF_MaxNearBlurSize=2.000000
   DOF_ExpFalloff=1.000000
   DOF_MaxFocalDistance=2000.000000
   DOF_BlendInSpeed=1.000000
   DOF_BlendOutSpeed=1.000000
   DOF_FG_FocalRadius=50.000000
   DOF_FG_MaxNearBlurSize=3.000000
   DOF_FG_ExpFalloff=1.000000
   GrenadeFireOffset=(X=25.000000,Y=-15.000000,Z=0.000000)
   UITexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_AR15'
   SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.GasTank'
   AmmoPickupScale(0)=1.000000
   AmmoPickupScale(1)=1.000000
   ShakeScaleSighted=0.400000
   ShakeScaleStandard=1.000000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Default_Recoil'
   MeleeImpactCamShake=KFCameraShake'FX_CameraShake_Arch.Melee.Default_Melee'
   FireTweenTime=0.050000
   FireAnim="Shoot"
   FireLoopAnim="ShootLoop"
   FireLastAnim="Shoot_Last"
   PutDownAnim="PutAway"
   EquipAnim="Equip"
   IdleAnims(0)="Idle"
   IdleFidgetAnims(0)="Guncheck_v1"
   IdleFidgetAnims(1)="Guncheck_v2"
   IdleFidgetAnims(2)="Guncheck_v3"
   FireSightedAnims(0)="Shoot_Iron"
   FireLoopSightedAnim="ShootLoop_Iron"
   FireLastSightedAnim="Shoot_Iron_Last"
   IdleSightedAnims(0)="Idle_Iron"
   FireLoopStartAnim="ShootLoop_Start"
   FireLoopStartSightedAnim="ShootLoop_Iron_Start"
   FireLoopEndAnim="ShootLoop_End"
   FireLoopEndSightedAnim="ShootLoop_Iron_End"
   MeleeAttackAnims(0)="Bash"
   BobDamping=0.850000
   JumpDamping=1.000000
   PlayerViewOffset=(X=1.000000,Y=9.000000,Z=-3.000000)
   LagTensionHorizontal=0.800000
   LagVerticalTension=0.800000
   LagResistanceHorizontal=0.200000
   LagResistanceVertical=0.200000
   LagLimit=5.000000
   LagYawCoefficient=0.000050
   LagStrengthIronSights=3.000000
   LagStrengthCrouch=1.500000
   LagStrengthWalk=0.700000
   LagStrengthJog=0.600000
   LagStrengthSprint=0.500000
   StrafeLagLimit=4.000000
   StrafeLagRate=0.025000
   StrafeLagReturnRate=10.000000
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFMeleeHelperWeapon'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
   FlashLightTemplate=KFFlashlightAttachment'FX_Flashlight_ARCH.Default_Flashlight_1P'
   LaserSightTemplate=KFLaserSightAttachment'FX_LaserSight_ARCH.Default_LaserSight_1P'
   MovingSpreadMod=1.000000
   IronSightsSpreadMod=0.500000
   CrouchSpreadMod=0.750000
   RecoilRate=0.090000
   RecoilBlendOutRatio=1.250000
   RecoilViewRotationScale=0.400000
   RecoilCompensationScale=1.500000
   FullRecoilPitchPct=0.750000
   FullRecoilYawPct=0.750000
   RecoilMaxYawLimit=2000
   RecoilMinYawLimit=63535
   RecoilMaxPitchLimit=1500
   RecoilMinPitchLimit=64035
   RecoilISMaxYawLimit=500
   RecoilISMinYawLimit=65035
   RecoilISMaxPitchLimit=350
   RecoilISMinPitchLimit=65185
   SuppressRecoilSpeed=0.080000
   SuppressRecoilViewRotationScale=0.500000
   HippedRecoilModifier=1.750000
   JoggingRecoilModifier=1.500000
   WalkingRecoilModifier=1.250000
   FallingRecoilModifier=3.000000
   StanceCrouchedRecoilModifier=0.750000
   LastRecoilModifier=1.000000
   IronSightMeshFOVCompensationScale=1.000000
   FiringStatesArray(0)="WeaponFiring"
   FiringStatesArray(1)="WeaponFiring"
   FiringStatesArray(2)="Reloading"
   FiringStatesArray(3)="MeleeAttackBasic"
   FiringStatesArray(4)="GrenadeFiring"
   WeaponFireTypes(0)=EWFT_InstantHit
   WeaponFireTypes(1)=EWFT_InstantHit
   WeaponFireTypes(2)=EWFT_InstantHit
   WeaponFireTypes(3)=EWFT_Custom
   WeaponFireTypes(4)=EWFT_Projectile
   FireInterval(0)=1.000000
   FireInterval(1)=1.000000
   FireInterval(2)=0.000000
   FireInterval(3)=0.000000
   FireInterval(4)=0.600000
   InstantHitDamage(0)=0.000000
   InstantHitDamage(1)=0.000000
   InstantHitDamage(2)=0.000000
   InstantHitDamage(3)=15.000000
   InstantHitMomentum(0)=1.000000
   InstantHitMomentum(1)=1.000000
   InstantHitMomentum(2)=0.000000
   InstantHitMomentum(3)=30000.000000
   InstantHitDamageTypes(0)=Class'KFGame.KFDT_Ballistic'
   InstantHitDamageTypes(1)=Class'KFGame.KFDT_Ballistic'
   EquipTime=0.450000
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   Mesh=FirstPersonMesh
   bDropOnDeath=True
   DroppedPickupClass=Class'KFGame.KFDroppedPickup'
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   bIgnoreBaseRotation=True
   Name="Default__KFWeapon"
   ObjectArchetype=Weapon'Engine.Default__Weapon'
}
