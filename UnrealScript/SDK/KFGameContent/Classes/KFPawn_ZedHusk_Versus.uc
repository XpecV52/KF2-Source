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
var float FireballSpeed;

/** Turns medium range flamethrower effect on */
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
	ShootFireball();
}

function ShootFireball()
{
	local vector		SocketLocation;
	local KFProjectile	MyFireball;
    local PlayerController PC;
    local rotator ShootRotation;
	local vector HitLocation, HitNormal;
    local vector TraceStart, TraceEnd;
    local Actor HitActor;

    if( Role == ROLE_Authority && IsHumanControlled() )
    {
	    PC = PlayerController(Controller);
	    if( PC == none )
	    {
	        return;
	    }

		SocketLocation = GetPawnViewLocation() + (PlayerFireOffset >> GetViewRotation());

	    TraceStart = PC.PlayerCamera.CameraCache.POV.Location;
	    TraceEnd = PC.PlayerCamera.CameraCache.POV.Location + vector(PC.PlayerCamera.CameraCache.POV.Rotation)*100000;

	    HitActor = Trace( HitLocation, HitNormal, TraceEnd, TraceStart, TRUE,,,TRACEFLAG_Bullet );

	    if( HitActor != none )
	    {
	        ShootRotation = Rotator( HitLocation - SocketLocation);
	    }
	    else
	    {
		   ShootRotation = Rotator( TraceEnd - SocketLocation);
		}

		if( Health > 0.f && IsDoingSpecialMove(SM_PlayerZedAttack1) )
		{
			// Shoot the fireball
			MyFireball = Spawn( FireballClass, self,, SocketLocation, ShootRotation );
			MyFireball.Instigator			= Self;
			MyFireball.InstigatorController	= Controller;
			MyFireball.Speed				= FireballSpeed;
			MyFireball.MaxSpeed				= FireballSpeed;
			MyFireball.Init( vector(ShootRotation) );
		}
	}
}

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

DefaultProperties
{
	bVersusZed=true
	TeammateCollisionRadiusPercent=0.30

	LocalizationKey=KFPawn_ZedHusk
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

	InstantIncaps(IAF_Stun)=(Head=68,Torso=90,Leg=90,Arm=90,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_Knockdown)=(Head=50,Torso=80,Leg=80,Arm=80,Special=50,LowHealthBonus=10,Cooldown=10.0)
	InstantIncaps(IAF_Stumble)=(Head=60,Torso=65,Arm=65,Special=50,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_LegStumble)=(Leg=60,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_GunHit)=(Head=110,Torso=110,Leg=110,Arm=110,LowHealthBonus=10,Cooldown=0.5)
	InstantIncaps(IAF_MeleeHit)=(Head=23,Torso=29,Leg=29,Arm=29,LowHealthBonus=10,Cooldown=0.35)
	StackingIncaps(SAF_Poison)=(Threshhold=3.0,Duration=4.0,Cooldown=8.5,DissipationRate=1.00)
	StackingIncaps(SAF_Microwave)=(Threshhold=3.0,Duration=4.0,Cooldown=8.5,DissipationRate=1.00)
	StackingIncaps(SAF_FirePanic)=(Threshhold=12.0,Duration=2.0,Cooldown=5.0,DissipationRate=1.0)
	StackingIncaps(SAF_EMPPanic)=(Threshhold=1.5,Duration=2.0,Cooldown=5.0,DissipationRate=0.5)
	StackingIncaps(SAF_EMPDisrupt)=(Threshhold=0.0,Duration=2.0,Cooldown=5.0,DissipationRate=1.0)
	StackingIncaps(SAF_Freeze)=(Threshhold=5.0,Duration=1.0,Cooldown=5.0,DissipationRate=0.33)

	bNeedsCrosshair=true
	FireballSpeed=3600.f
	PlayerFireOffset=(X=15.f,Y=32,Z=-12)

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
		BaseDamage=30.f
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
