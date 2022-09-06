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
			if( (self.WorldInfo.TimeDilation < 1.f) && ProjIndicatorTemplateZedTime != none )
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

	TraveledDistance = ((WorldInfo.TimeSeconds - CreationTime) * Speed);
	TraveledDistance *= TraveledDistance;

    if( (!bDud || ( bWantsClientSideDudHit && !bClientDudHit)) && ((TraveledDistance < ArmDistSquared) || bIsTimedExplosive || (OriginalLocation == vect(0,0,0) && ArmDistSquared > 0)))
    {
        // Don't touch the same actor multiple time's immediately after just
        // touching it if the TouchTimeThreshhold is set to greater than 0.
        // This was causing projectiles just to "stop" sometimes when hitting
        // dead/ragdolled pawns because it was counting as multiple penetrations
        if( LastTouched.Actor == Other && TouchTimeThreshhold > 0
            && (WorldInfo.TimeSeconds - LastTouched.Time) <= TouchTimeThreshhold )
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
	if (!bDud && !bIsTimedExplosive)
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
	if(bHasExploded || Instigator.Role < ROLE_Authority)
	{
		Velocity = vect(0,0,0);
		Acceleration = vect(0,0,0);
		RotationRate = rot(0,0,0);
		SetPhysics(PHYS_None);
		SetCollision(FALSE, FALSE);

		StopFlightEffects();

		bRotationFollowsVelocity = FALSE;
	}
	else
	{
		super.StopSimulating();
	}

	if (ProjIndicatorEffects!=None)
	{
        ProjIndicatorEffects.DeactivateSystem();
	}
}

defaultproperties
{
   TossX=150.000000
   RollingFactor=1100.000000
   ProjIndicatorTemplate=ParticleSystem'WEP_Blunderbuss_EMIT.FX_Cannonball_Projectile_Indicator'
   ProjIndicatorTemplateZedTime=ParticleSystem'WEP_Blunderbuss_EMIT.FX_Cannonball_Projectile_Indicator_ZEDTIME'
   ResetRotationOnStop=False
   GrenadeBounceEffectInfo=KFImpactEffectInfo'FX_Impacts_ARCH.DefaultGrenadeImpacts'
   DampenFactor=0.100000
   DampenFactorParallel=0.000000
   WallHitDampenFactor=0.500000
   WallHitDampenFactorParallel=0.500000
   MinSpeedBeforeStop=5.000000
   bWarnAIWhenFired=True
   TossZ=150.000000
   TerminalVelocity=3200.000000
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_BlunderbussCannonball'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_Blunderbuss_ARCH.Cannonball_Explosion'
      Damage=250.000000
      DamageRadius=750.000000
      DamageFalloffExponent=2.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_Blunderbuss'
      KnockDownStrength=0.000000
      ExplosionSound=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Cannonball_Blunderbuss:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
      CamShakeInnerRadius=200.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Cannonball_Blunderbuss:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   AltExploEffects=KFImpactEffectInfo'WEP_Blunderbuss_ARCH.Cannonball_Explosion_Concussive_Force'
   ProjFlightTemplate=ParticleSystem'WEP_Blunderbuss_EMIT.FX_Cannonball_Projectile'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_Blunderbuss_EMIT.FX_Cannonball_Projectile_ZEDTIME'
   AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Projectile_Loop'
   AmbientSoundStopEvent=AkEvent'WW_WEP_SA_M79.Stop_WEP_SA_M79_Projectile_Loop'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=3200.000000
   MaxSpeed=3200.000000
   MomentumTransfer=50000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   Physics=PHYS_Falling
   bUpdateSimulatedPosition=True
   LifeSpan=0.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Cannonball_Blunderbuss"
   ObjectArchetype=KFProj_BallisticExplosive'KFGame.Default__KFProj_BallisticExplosive'
}
