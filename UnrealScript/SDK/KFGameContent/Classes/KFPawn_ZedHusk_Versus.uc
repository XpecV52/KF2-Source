//=============================================================================
// KFPawn_ZedHusk_Versus
//=============================================================================
// Husk Versus pawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedHusk_Versus extends KFPawn_ZedHusk;

/** Speed at which a fireball travels */
var protected const float FireballSpeed;

/** Minimum/maximum strength (damage and radius multiplier) a fireball can have */
var protected const vector2D FireballStrengthRange;

/** How much strength to apply to a fireball per 1 second of holding the attack button down */
var protected const float FireballStrengthPerSecond;

/** How much to multiply FireballStrength by when applying the radius boost */
var protected const float FireballStrengthRadiusMultiplier;

/** Current strength of the fireball */
var protected float FireballStrength;

/** Turns flamethrower on (FX, damage) */
simulated function ANIMNOTIFY_FlameThrowerOn()
{
    if( IsDoingSpecialMove(SM_PlayerZedAttack2) )
	{
		KFSM_Husk_FlameThrowerAttack(SpecialMoves[SpecialMove]).TurnOnFlamethrower();
	}
}

/** AnimNotify which launches the fireball projectile */
function ANIMNOTIFY_HuskFireballAttack()
{
	local float FireballStartTime;

	// Determine how strong the fireball attack will be
	if( IsDoingSpecialMove(SM_PlayerZedAttack1) )
	{
		FireballStartTime = KFSM_PlayerHusk_FireBallAttack( SpecialMoves[SpecialMove] ).HoldStartTime;
		FireballStrength = fClamp( (WorldInfo.TimeSeconds - FireballStartTime) * FireballStrengthPerSecond, FireballStrengthRange.X, FireballStrengthRange.Y );
	}
	else
	{
		FireballStrength = 1.f;
	}

	ShootFireball();
}

/** Shoots a fireball at the crosshair */
function ShootFireball()
{
    local PlayerController PC;
	local KFProjectile	MyFireball;
	local KFProj_Husk_Fireball_Versus HuskFireball;
    local Actor HitActor;
	local vector SocketLocation;
    local rotator ShootRotation;
	local vector HitLocation, HitNormal;
    local vector TraceStart, TraceEnd;

    if( Role == ROLE_Authority && IsHumanControlled() )
    {
	    PC = PlayerController(Controller);
	    if( PC == none )
	    {
	        return;
	    }

		SocketLocation = GetPawnViewLocation() + ( PlayerFireOffset >> GetViewRotation() );

	    TraceStart = PC.PlayerCamera.CameraCache.POV.Location;
	    TraceEnd = PC.PlayerCamera.CameraCache.POV.Location + vector(PC.PlayerCamera.CameraCache.POV.Rotation)*100000;

	    HitActor = Trace( HitLocation, HitNormal, TraceEnd, TraceStart, TRUE,,, TRACEFLAG_Bullet );

	    if( HitActor != none )
	    {
	        ShootRotation = Rotator( HitLocation - SocketLocation );
	    }
	    else
	    {
	    	ShootRotation = Rotator( TraceEnd - SocketLocation );
		}

		if( Health > 0.f && IsDoingSpecialMove(SM_PlayerZedAttack1) )
		{
			// Shoot the fireball
			MyFireball = Spawn( FireballClass, self,, SocketLocation, ShootRotation );
			MyFireball.Instigator						= Self;
			MyFireball.InstigatorController				= Controller;
			MyFireball.Speed							= FireballSpeed;
			MyFireball.MaxSpeed							= FireballSpeed;
			MyFireball.ExplosionTemplate.Damage 		= GetRallyBoostDamage( MyFireball.default.ExplosionTemplate.Damage ) * FireballStrength;
			MyFireball.ExplosionTemplate.DamageRadius   = MyFireball.default.ExplosionTemplate.DamageRadius * (FireballStrength * FireballStrengthRadiusMultiplier);

			// Apply fireball size if our projectile is a husk fireball
			HuskFireball = KFProj_Husk_Fireball_Versus( MyFireball );
			if( HuskFireball != none )
			{
				HuskFireball.SetDrawScale( fMax(FireballStrength, 1.f) );
			}

			MyFireball.Init( vector(ShootRotation) );
		}
	}
}

/** Called by KFSM_Husk_Suicide move after exploding */
simulated function OnExploded( Controller SuicideController )
{
	local KFPlayerController KFPC;

    // Swap to suicide cam
    if( SuicideController != none )
    {
        KFPC = KFPlayerController( SuicideController );
        if( KFPC != none )
        {
	        KFPC.SetCameraMode( 'ZedSuicide' );
	        KFPlayerCamera_Versus(KFPC.PlayerCamera).SwapToZedSuicideCam( Location );
	    }
    }
}

/** Accessors */
simulated function vector2D GetFireballStrengthRange()
{
	return FireballStrengthRange;
}
simulated function float GetFireballStrengthPerSecond()
{
	return FireballStrengthPerSecond;
}

DefaultProperties
{
	bVersusZed=true
	TeammateCollisionRadiusPercent=0.30

	LocalizationKey=KFPawn_ZedHusk
	Health=450 // KF1=600
    DoshValue=20.0 // default because they have the same health as survival
    XPValues(0)=30 // 2x default because they are harder to hit/kill

    // Faster sprint
    SprintSpeed=500.f
    SprintStrafeSpeed=250.f
    GroundSpeed=170.0f

	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_PlayerZedAttack1)=class'KFSM_PlayerHusk_FireBallAttack'
		SpecialMoveClasses(SM_PlayerZedAttack2)=class'KFSM_PlayerHusk_FlameThrowerAttack'
		SpecialMoveClasses(SM_PlayerZedSpecial1)=class'KFSM_PlayerHusk_Melee'
		SpecialMoveClasses(SM_PlayerZedSpecial4)=class'KFSM_PlayerHusk_Suicide'
	End Object

	SpecialMoveCooldowns(0)=(SMHandle=SM_PlayerZedAttack1,		CooldownTime=0.95f,	SpecialMoveIcon=Texture2D'ZED_Husk_UI.ZED-VS_Icons_Husk-Fireball', GBA_Name="GBA_Fire",NameLocalizationKey="Shoot")
	SpecialMoveCooldowns(1)=(SMHandle=SM_PlayerZedAttack2,		CooldownTime=2.0f,	SpecialMoveIcon=Texture2D'ZED_Husk_UI.ZED-VS_Icons_Husk-Flamethrower', GBA_Name="GBA_IronsightsToggle", ALT_GBA_Name="GBA_IronsightsHold",NameLocalizationKey="Flame")
	SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,					CooldownTime=1.0f,	GBA_Name="GBA_Reload",bShowOnHud=false,bShowOnHud=false))
	SpecialMoveCooldowns(3)=(SMHandle=SM_PlayerZedSpecial1,		CooldownTime=0.1f,	SpecialMoveIcon=Texture2D'ZED_clot_UI.ZED-VS_Icons_AlphaClot-Melee', GBA_Name="GBA_TertiaryFire",NameLocalizationKey="Melee")
	SpecialMoveCooldowns(6)=(SMHandle=SM_PlayerZedSpecial4,		CooldownTime=0.0f,	SpecialMoveIcon=Texture2D'ZED_Husk_UI.ZED-VS_Icons_Husk-Explode', GBA_Name="GBA_Grenade",NameLocalizationKey="Suicide")
	SpecialMoveCooldowns.Add((SMHandle=SM_Jump,					CooldownTime=1.f,	SpecialMoveIcon=Texture2D'ZED_Husk_UI.ZED-VS_Icons_Husk-Jump', GBA_Name="GBA_Jump",bShowOnHud=false)) // Jump always at end of array)) // Jump always at end of array

	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Submachinegun', 	DamageScale=(0.8)))  //3.0
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AssaultRifle', 	DamageScale=(0.5)))  //1.0
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Shotgun', 	        DamageScale=(0.5)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Handgun', 	        DamageScale=(0.6)))  //1.01  0.4
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rifle', 	        DamageScale=(0.65)))  //0.76  0.5
	DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing', 	                DamageScale=(0.5)))  //0.5
	DamageTypeModifiers.Add((DamageType=class'KFDT_Bludgeon', 	                DamageScale=(0.5)))  //0.5
	DamageTypeModifiers.Add((DamageType=class'KFDT_Fire', 	                    DamageScale=(0.1)))  //0.8
	DamageTypeModifiers.Add((DamageType=class'KFDT_Microwave', 	                DamageScale=(1.0)))  //0.25
	DamageTypeModifiers.Add((DamageType=class'KFDT_Explosive', 	                DamageScale=(0.5)))  //0.85  0.35
	DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing', 	                DamageScale=(0.4)))   //1.0
	DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic', 	                    DamageScale=(0.30)))  //0.88


// special case
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AR15',              DamageScale=(1.0))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_MB500', 	         DamageScale=(1.1)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rem1858', 	         DamageScale=(0.85)))  //0.9  0.75
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Colt1911', 	     DamageScale=(0.75)))  //0.9   0.65
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_9mm', 	             DamageScale=(1.6)))  //0.9
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Pistol_Medic', 	 DamageScale=(1.5)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Winchester', 	     DamageScale=(0.75)))  //0.9  0.7
	DamageTypeModifiers.Add((DamageType=class'KFDT_Fire_CaulkBurn', 	         DamageScale=(0.2)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_ExplosiveSubmunition_HX25', 	 DamageScale=(0.6)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing_EvisceratorProj', 	 DamageScale=(0.4)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing_Eviscerator', 	     DamageScale=(0.3)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_DragonsBreath', 	 DamageScale=(1.1)))  //0.9



	IncapSettings(AF_Stun)=		(Vulnerability=(0.5, 0.5, 0.1, 0.1, 0.1), Cooldown=3.0, Duration=2.0)
	IncapSettings(AF_Knockdown)=(Vulnerability=(0.5),                     Cooldown=3.0)
	IncapSettings(AF_Stumble)=	(Vulnerability=(0.5),                     Cooldown=3.0)
	IncapSettings(AF_GunHit)=	(Vulnerability=(1.0),                     Cooldown=0.75)
	IncapSettings(AF_MeleeHit)=	(Vulnerability=(1.0),                     Cooldown=0.5)
	IncapSettings(AF_Poison)=	(Vulnerability=(1),                       Cooldown=5.0, Duration=2.0)
	IncapSettings(AF_Microwave)=(Vulnerability=(1.0),                     Cooldown=5.0, Duration=2.0)
	IncapSettings(AF_FirePanic)=(Vulnerability=(0.1),                     Cooldown=8.0, Duration=3)
	IncapSettings(AF_EMP)=		(Vulnerability=(1.0),                     Cooldown=5.0, Duration=3.0)
	IncapSettings(AF_Freeze)=	(Vulnerability=(1.0),                     Cooldown=1.5, Duration=2.0)

	HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=200, DmgScale=1.001, SkinID=1)  // KF1=200     //154

	// Fireball/flamethrower
	bNeedsCrosshair=true
	FireballSpeed=3600.f
	FireballStrengthRange=(X=0.5f, Y=1.3f)
	FireballStrengthPerSecond=0.4f
	FireballStrengthRadiusMultiplier=0.7f
	PlayerFireOffset=(X=15.f,Y=32,Z=-12)
	FireballClass=class'KFProj_Husk_Fireball_Versus'

	// Backpack/Suicide Explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=125
		DamageRadius=600
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

	//defaults
	Begin Object Name=MeleeHelper_0
		BaseDamage=15.f  //30
		MaxHitRange=180.f
		MomentumTransfer=25000.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
		MeleeImpactCamScale=0.2
		PlayerDoorDamageMultiplier=5.f
	End Object
	MeleeAttackHelper=MeleeHelper_0

	//defaults
	ThirdPersonViewOffset={(
		OffsetHigh=(X=-175,Y=75,Z=40),
		OffsetLow=(X=-220,Y=75,Z=50),
		OffsetMid=(X=-160,Y=60,Z=0),
		)}
}
