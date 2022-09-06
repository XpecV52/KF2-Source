//=============================================================================
// KFProj_Cannonball_Blunderbuss
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//	- Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFProj_Cannonball_Blunderbuss extends KFProj_BallisticExplosive
	hidedropdown;

/** Additional X Axis velocity to apply when launching this projectile */
var(Projectile) float TossX;

/** Factor added to the rolling speed of the ball when bouncing **/
var(Projectilve) float RollingFactor;

/** Indicates that the ball hit the wall and is doing rolling animations **/
var transient bool bIsRolling;

/** Flag indicating that the player is no longer pressing the fire button and the projectile should explode as soon as it cans **/
var transient bool bReadyToDetonate;

/** Amount of roll stored for this cannonball **/
var transient float CurrentRoll;

var ParticleSystemComponent	ProjIndicatorEffects;
var bool IndicatorActive;

/** This is the effect indicator that is played for the current user **/
var(Projectile) ParticleSystem ProjIndicatorTemplate;

/** This is the effect indicator that is played for the current user in zed time **/
var(Projectile) ParticleSystem ProjIndicatorTemplateZedTime;

//var array<Actor> vActorsTouched;

function Init(vector Direction)
{
	Super.Init(Direction);
	//Velocity.X += TossX;
}

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();
}

simulated function TryActivateIndicator()
{
	if(!IndicatorActive && Instigator != None)
	{
		IndicatorActive = true;

		if(WorldInfo.NetMode == NM_Standalone || Instigator.Role == Role_AutonomousProxy ||
		 (Instigator.Role == ROLE_Authority && WorldInfo.NetMode == NM_ListenServer && Instigator.IsLocallyControlled() ))
		{
			if( `IsInZedTime(self) && ProjIndicatorTemplateZedTime != none )
			{
			    ProjIndicatorEffects = WorldInfo.MyEmitterPool.SpawnEmitterCustomLifetime(ProjIndicatorTemplateZedTime);
			}
			// Play normal speed flight effects
			else if( ProjIndicatorTemplate != None )
			{
			    ProjIndicatorEffects = WorldInfo.MyEmitterPool.SpawnEmitterCustomLifetime(ProjIndicatorTemplate);
			}

			if(ProjIndicatorEffects != None)
			{
				ProjIndicatorEffects.SetAbsolute(false, false, false);
				ProjIndicatorEffects.SetLODLevel(WorldInfo.bDropDetail ? 1 : 0);
				ProjIndicatorEffects.bUpdateComponentInTick = true;
				AttachComponent(ProjIndicatorEffects);
			}
		}
	}
}

/** Called when the owning instigator controller has left a game */
simulated function OnInstigatorControllerLeft()
{
	if( WorldInfo.NetMode != NM_Client )
	{
		SetTimer( 1.f + Rand(5) + fRand(), false, nameOf(Timer_Detonate) );
	}
}

function Timer_Detonate()
{
	Detonate();
}

function Detonate()
{
	local vector ExplosionNormal;

	// Check if the bomb should explode right now
	if (bIsRolling && !bHasExploded && !bHasDisintegrated)
	{
		ExplosionNormal =  vect(0,0,1) >> Rotation;
		CallExplode(Location, ExplosionNormal);
	}
	// If not, mark the bomb to explode as soon as it hits something
	else
	{
		bIsTimedExplosive = false;
		bNetDirty = true;
	}
}

simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	local KFWeap_Pistol_Blunderbuss Blunderbuss;
	
	if (Role == ROLE_Authority)
    {
    	Blunderbuss = KFWeap_Pistol_Blunderbuss(Owner);
    	if (Blunderbuss != none)
    	{
    		Blunderbuss.RemoveDeployedCannonball(, self);
    	}
    }

	Super.TriggerExplosion(HitLocation, HitNormal, HitActor);
}

simulated function Disintegrate( rotator InDisintegrateEffectRotation )
{
	local KFWeap_Pistol_Blunderbuss Blunderbuss;

	if (Role == ROLE_Authority)
    {
    	Blunderbuss = KFWeap_Pistol_Blunderbuss(Owner);
    	if (Blunderbuss != none)
    	{
    		Blunderbuss.RemoveDeployedCannonball(, self);
    	}
    }

    super.Disintegrate(InDisintegrateEffectRotation);
}

simulated function SetIsDud(bool bWantsClientSideDudHit, vector HitNormal)
{
	// This projectile doesn't dud.
}

simulated event Tick(float DeltaTime)
{
	local vector RollDelta;
	local rotator NewRotation;

	// Let's roll (only in the client)
    if ( bIsRolling && WorldInfo.NetMode != NM_DedicatedServer && Physics != PHYS_None && (Velocity.X != 0 || Velocity.Y != 0) )
    {
		CurrentRoll -= (Abs(Velocity.X) + Abs(Velocity.Y)) * DeltaTime * RollingFactor; 
		RollDelta = ((vect(1, 0 , 0) * (Velocity.X)) + (vect(0, 1, 0) * (Velocity.Y) ));
		NewRotation = Rotator(RollDelta);
		NewRotation.pitch += CurrentRoll;
		SetRotation(NewRotation);
    }

	TryActivateIndicator();
	Super.Tick(DeltaTime);
}

simulated event HitWall(vector HitNormal, actor Wall, PrimitiveComponent WallComp)
{
	bIsRolling = true;
	Super.HitWall(HitNormal, Wall, WallComp);
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    local bool bWantsClientSideDudHit;
	local float TraveledDistance;
	local Vector VNorm;
	//local int Index;

    // If we collided with a Siren shield, let the shield code handle touches
    if( Other.IsA('KFTrigger_SirenProjectileShield') )
    {
        return;
    }

	if ( !bCollideWithTeammates && Pawn(Other) != None )
	{
        // Don't hit teammates
		if( Other.GetTeamNum() == GetTeamNum() )
		{
            return;
		}
	}

    // Need to do client side dud hits if this is a client
    if( Instigator != none && Instigator.Role < ROLE_Authority )
	{
        bWantsClientSideDudHit = true;
    }

	TraveledDistance = (`TimeSince(CreationTime) * Speed);
	TraveledDistance *= TraveledDistance;

    if( (!bDud || ( bWantsClientSideDudHit && !bClientDudHit)) && ((TraveledDistance < ArmDistSquared) || bIsTimedExplosive || (OriginalLocation == vect(0,0,0) && ArmDistSquared > 0)))
    {
		//for (Index = 0; Index < vActorsTouched.Length; Index++)
		//{
		//	if(vActorsTouched[Index] == Other)
		//	{
		//		return;
		//	}
		//}
		//if(Other == LastActorTouched)
		//{
		//	return;
		//}
		//LastActorTouched = Other;
		//bForceNetUpdate=true;
		//vActorsTouched.AddItem(Other);
        // Don't touch the same actor multiple time's immediately after just
        // touching it if the TouchTimeThreshhold is set to greater than 0.
        // This was causing projectiles just to "stop" sometimes when hitting
        // dead/ragdolled pawns because it was counting as multiple penetrations
        if( LastTouched.Actor == Other && TouchTimeThreshhold > 0
            && `TimeSince(LastTouched.Time) <= TouchTimeThreshhold )
        {
            return;
        }

		//TODO: Add an impact sound here
		SetIsDud(bWantsClientSideDudHit, HitNormal);

		if (Other != Instigator && !Other.bStatic && Other.GetTeamNum() != GetTeamNum() && !CheckRepeatingTouch(Other))
		{
			ProcessBulletTouch(Other, HitLocation, HitNormal);
		}
		// Reflect off Wall w/damping but allow penetration if the pawn is dead
		//if(KFPawn_Monster(Other) == None || KFPawn_Monster(Other).Health > 0)
		//{
			VNorm = (Velocity dot HitNormal) * HitNormal;
			Velocity = -VNorm * DampenFactor + (Velocity - VNorm) * DampenFactorParallel;
			Speed = VSize(Velocity);
		//}
    }
	else if (!bDud && !bIsTimedExplosive)
	{
        // Process impact hits
    	if (Other != Instigator && !Other.bStatic)
    	{
			// check/ignore repeat touch events
			if( !CheckRepeatingTouch(Other) && Other.GetTeamNum() != GetTeamNum())
			{
				ProcessBulletTouch(Other, HitLocation, HitNormal);
			}
    	}

    	if( WorldInfo.NetMode == NM_Standalone ||
            (WorldInfo.NetMode == NM_ListenServer && Instigator != none && Instigator.IsLocallyControlled()) )
        {
            Super.ProcessTouch( Other, HitLocation, HitNormal );
            return;
        }

        if( Owner != none && KFWeapon( Owner ) != none && Instigator != none )
    	{
    		if( Instigator.Role < ROLE_Authority && Instigator.IsLocallyControlled() )
    		{
                KFWeapon(Owner).HandleClientProjectileExplosion(HitLocation, self);
                Super.ProcessTouch( Other, HitLocation, HitNormal );
                return;
            }
    	}

    	StopSimulating();
	}
}

simulated protected function StopSimulating()
{
	Velocity = vect(0,0,0);
	Acceleration = vect(0,0,0);
	RotationRate = rot(0,0,0);
	SetCollision(FALSE, FALSE);

	StopFlightEffects();

	bRotationFollowsVelocity = FALSE;

	if (ProjIndicatorEffects!=None)
	{
        ProjIndicatorEffects.DeactivateSystem();
	}
}

defaultproperties
{
	TouchTimeThreshhold = 60.0f
	Physics=PHYS_Falling
	Speed=3200
	MaxSpeed=3200
	TerminalVelocity=3200
	TossZ=150
	GravityScale=1.0
    MomentumTransfer=50000.0
    LifeSpan=0.f
	bWarnAIWhenFired=true
	RollingFactor=1100
	MinSpeedBeforeStop=5
	ResetRotationOnStop=false

	// Rolling and dampen values
	TossX=150.0
    DampenFactor=0.1
    DampenFactorParallel=0
	WallHitDampenFactor=0.5
	WallHitDampenFactorParallel=0.5

	bCollideComplex=TRUE	// Ignore simple collision on StaticMeshes, and collide per poly
	bUseClientSideHitDetection=true
	bNoReplicationToInstigator=false
	bAlwaysReplicateExplosion=true;
	bUpdateSimulatedPosition=true

	Begin Object Name=CollisionCylinder
		CollisionRadius=0.f
		CollisionHeight=0.f
		BlockNonZeroExtent=false
	End Object

	ExplosionActorClass=class'KFExplosion_BlunderbussCannonball'

	ProjFlightTemplate=ParticleSystem'WEP_Blunderbuss_EMIT.FX_Cannonball_Projectile'
	ProjFlightTemplateZedTime=ParticleSystem'WEP_Blunderbuss_EMIT.FX_Cannonball_Projectile_ZEDTIME'
	
	ProjIndicatorTemplate=ParticleSystem'WEP_Blunderbuss_EMIT.FX_Cannonball_Projectile_Indicator'
	ProjIndicatorTemplateZedTime=ParticleSystem'WEP_Blunderbuss_EMIT.FX_Cannonball_Projectile_Indicator_ZEDTIME'

	GrenadeBounceEffectInfo=KFImpactEffectInfo'FX_Impacts_ARCH.DefaultGrenadeImpacts'
    ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
	AltExploEffects=KFImpactEffectInfo'WEP_Blunderbuss_ARCH.Cannonball_Explosion_Concussive_Force'

	// Grenade explosion light
	Begin Object Class=PointLightComponent Name=ExplosionPointLight
	    LightColor=(R=252,G=218,B=171,A=255)
		Brightness=4.f
		Radius=2000.f
		FalloffExponent=10.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=False
		bCastPerObjectShadows=false
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

	// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=250
		DamageRadius=750
		DamageFalloffExponent=2
		DamageDelay=0.f

		// Damage Effects
		MyDamageType=class'KFDT_Explosive_Blunderbuss'
		KnockDownStrength=0
		FractureMeshRadius=200.0
		FracturePartVel=500.0
		ExplosionEffects=KFImpactEffectInfo'WEP_Blunderbuss_ARCH.Cannonball_Explosion'
		ExplosionSound=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Explosion'

        // Dynamic Light
        ExploLight=ExplosionPointLight
        ExploLightStartFadeOutTime=0.0
        ExploLightFadeOutTime=0.2

		// Camera Shake
		CamShake=CameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
		CamShakeInnerRadius=200
		CamShakeOuterRadius=900
		CamShakeFalloff=1.5f
		bOrientCameraShakeTowardsEpicenter=true
	End Object
	ExplosionTemplate=ExploTemplate0

	//AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Projectile_Loop'
    //AmbientSoundStopEvent=AkEvent'WW_WEP_SA_M79.Stop_WEP_SA_M79_Projectile_Loop'
}