//=============================================================================
// KFProj_Thrown_C4
//=============================================================================
// Projectile class for C4 weapon
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFProj_Thrown_C4 extends KFProjectile;

var KFImpactEffectInfo ImpactEffectInfo;

/** "beep" sound to play (on an interval) when instigator is within blast radius */
var() AkEvent ProximityAlertAkEvent;
/** Time between proximity beeps */
var() float ProximityAlertInterval;
/** Time between proximity beeps when the instigator is within "fatal" radius */
var() float ProximityAlertIntervalClose;
/** Time until next alert */
var transient float ProximityAlertTimer;

/** Visual component of this projectile (we don't use ProjEffects particle system because we need to manipulate the MIC) */
var StaticMeshComponent ChargeMesh;
/** Mesh MIC, used to make LED blink */
var MaterialInstanceConstant ChargeMIC;
/** Dynamic light for blinking */
var PointLightComponent BlinkLightComp;
/** Blink colors */
var LinearColor BlinkColorOn, BlinkColorOff;
/** How long LED and dynamic light should stay lit for */
var float BlinkTime;

var ParticleSystem BlinkFX;
var ParticleSystemComponent BlinkPSC;

/** Id for skin override */
var repnotify int WeaponSkinId;

replication
{
	if(bNetDirty)
		WeaponSkinId;
}

simulated function PostBeginPlay()
{
	if( WorldInfo.NetMode != NM_Client )
	{
		if( InstigatorController != none )
		{
			class'KFGameplayPoolManager'.static.GetPoolManager().AddProjectileToPool( self, PPT_C4 );
		}
		else
		{
			Destroy();
			return;
		}
	}

	super.PostBeginPlay();

	ProximityAlertTimer = ProximityAlertInterval;

	AdjustCanDisintigrate();

	ChargeMIC = ChargeMesh.CreateAndSetMaterialInstanceConstant(0);
}

/** Used to check current status of StuckTo actor (to figure out if we should fall) */
simulated event Tick( float DeltaTime )
{
	super.Tick(DeltaTime);

	StickHelper.Tick();

	if (StuckToActor != none)
	{
		UpdateAlert(DeltaTime);
	}
}

/** Checks if deployed charge should play a warning "beep" for the instigator. Beeps faster if the instigator is within "lethal" range. */
simulated function UpdateAlert( float DeltaTime )
{
	local vector ToInstigator, BBoxCenter;
	local float DistToInstigator, DamageScale;
	local Actor TraceActor;
	local Box BBox;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	if( bHasExploded || bHasDisintegrated )
	{
		return;
	}

	if( ProximityAlertTimer <= 0 )
	{
		return;
	}

	ProximityAlertTimer -= DeltaTime;

	if( ProximityAlertTimer > 0 )
	{
		return;
	}

	ProximityAlertTimer = ProximityAlertInterval;

	// only play sound for instigator (based on distance)
	if( Instigator != none && Instigator.IsLocallyControlled() )
	{
		ToInstigator = Instigator.Location - Location;
		DistToInstigator = VSize( ToInstigator );
		if( DistToInstigator <= ExplosionTemplate.DamageRadius )
		{
			Instigator.GetComponentsBoundingBox(BBox);
			BBoxCenter = (BBox.Min + BBox.Max) * 0.5f;
			TraceActor = class'GameExplosionActor'.static.StaticTraceExplosive(BBoxCenter, Location + vect(0,0,20), self);
			if( TraceActor == none || TraceActor == Instigator )
			{
				DamageScale = FClamp(1.f - DistToInstigator/ExplosionTemplate.DamageRadius, 0.f, 1.f);
				DamageScale = DamageScale ** ExplosionTemplate.DamageFalloffExponent;

				if( ExplosionTemplate.Damage * DamageScale > Instigator.Health )
				{
					ProximityAlertTimer = ProximityAlertIntervalClose;
				}

				PlaySoundBase( ProximityAlertAkEvent, true );
			}
		}
	}

	// blink for everyone to see
	BlinkOn();
}

/** Turns on LED and dynamic light */
simulated function BlinkOn()
{
	if( BlinkPSC == none )
	{
		BlinkPSC = WorldInfo.MyEmitterPool.SpawnEmitter(BlinkFX, Location + (vect(0,0,4) + vect(8,0,0) >> Rotation),, self,,, true);
	}

	BlinkPSC.SetFloatParameter('Glow', 1.0);

	ChargeMIC.SetVectorParameterValue('Vector_GlowColor', BlinkColorOn);
	BlinkLightComp.SetEnabled( true );
	SetTimer( BlinkTime, false, nameof(BlinkOff) );
}

/** Turns off LED and dynamic light */
simulated function BlinkOff()
{
	if( BlinkPSC != none )
	{
		BlinkPSC.SetFloatParameter('Glow', 0.0);
	}

	ChargeMIC.SetVectorParameterValue('Vector_GlowColor', BlinkColorOff);
	BlinkLightComp.SetEnabled( false );
}

simulated function SetStickOrientation(vector HitNormal)
{
	local rotator StickRot;

	StickRot = CalculateStickOrientation(HitNormal);
    SetRotation(StickRot);
}

/** Causes charge to explode */
function Detonate()
{
	local KFWeap_Thrown_C4 C4WeaponOwner;
	local vector ExplosionNormal;

	if( Role == ROLE_Authority )
    {
    	C4WeaponOwner = KFWeap_Thrown_C4( Owner );
    	if( C4WeaponOwner != none )
    	{
    		C4WeaponOwner.RemoveDeployedCharge(, self);
    	}
    }

	ExplosionNormal = vect(0,0,1) >> Rotation;
	Explode( Location, ExplosionNormal );
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		BlinkOff();
	}

	super.Explode( HitLocation, HitNormal );
}

simulated function Disintegrate( rotator InDisintegrateEffectRotation )
{
	local KFWeap_Thrown_C4 C4WeaponOwner;

	if( Role == ROLE_Authority )
    {
    	C4WeaponOwner = KFWeap_Thrown_C4( Owner );
    	if( C4WeaponOwner != none )
    	{
    		C4WeaponOwner.RemoveDeployedCharge(, self);
    	}
    }

    if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		BlinkOff();
	}

    super.Disintegrate( InDisintegrateEffectRotation );
}

// for nukes && concussive force
simulated protected function PrepareExplosionTemplate()
{
	class'KFPerk_Demolitionist'.static.PrepareExplosive( Instigator, self );

    super.PrepareExplosionTemplate();
}

simulated protected function SetExplosionActorClass()
{
   local KFPlayerReplicationInfo InstigatorPRI;

    if( WorldInfo.TimeDilation < 1.f && Instigator != none )
    {
       InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
        if( InstigatorPRI != none )
        {
            if( InstigatorPRI.bNukeActive && class'KFPerk_Demolitionist'.static.ProjectileShouldNuke( self ) )
            {
                ExplosionActorClass = class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass();
            }
        }
    }

    super.SetExplosionActorClass();
}

/** Blows up on a timer */
function Timer_Explode()
{
	Detonate();
}

/** Remove C4 from pool */
simulated event Destroyed()
{
	if( WorldInfo.NetMode != NM_Client )
	{
		if( InstigatorController != none )
		{
			class'KFGameplayPoolManager'.static.GetPoolManager().RemoveProjectileFromPool( self, PPT_C4 );
		}
	}

	super.Destroyed();
}

/** Called when the owning instigator controller has left a game */
simulated function OnInstigatorControllerLeft()
{
	if( WorldInfo.NetMode != NM_Client )
	{
		SetTimer( 1.f + Rand(5) + fRand(), false, nameOf(Timer_Explode) );
	}
}

simulated function SetWeaponSkin(int SkinId)
{
	local array<MaterialInterface> SkinMICs;
	local int i;

	if (SkinId > 0)
	{
		SkinMICs = class'KFWeaponSkinList'.static.GetWeaponSkin(SkinId, WST_FirstPerson);
		for (i = 0; i < SkinMICs.length; i++)
		{
			ChargeMesh.SetMaterial(i, SkinMICs[i]);
		}
	}

	ChargeMIC = ChargeMesh.CreateAndSetMaterialInstanceConstant(0);
}

defaultproperties
{
   ImpactEffectInfo=KFImpactEffectInfo'WEP_C4_ARCH.C4_Projectile_Impacts'
   ProximityAlertAkEvent=AkEvent'WW_WEP_EXP_C4.Play_WEP_EXP_C4_Prox_Beep'
   ProximityAlertInterval=1.000000
   ProximityAlertIntervalClose=0.500000
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
      StaticMesh=StaticMesh'WEP_3P_C4_MESH.Wep_C4_Projectile'
      ReplacementPrimitive=None
      bCastDynamicShadow=False
      CollideActors=False
      LightingChannels=(Dynamic=True)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   ChargeMesh=StaticMeshComponent0
   Begin Object Class=PointLightComponent Name=BlinkPointLight
      Radius=300.000000
      FalloffExponent=10.000000
      Translation=(X=8.000000,Y=0.000000,Z=4.000000)
      Brightness=4.000000
      LightColor=(B=63,G=63,R=255,A=255)
      bEnabled=False
      CastShadows=False
      CastStaticShadows=False
      CastDynamicShadows=False
      bCastPerObjectShadows=False
      LightingChannels=(Outdoor=True)
      Name="BlinkPointLight"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   BlinkLightComp=BlinkPointLight
   BlinkColorOn=(R=1.000000,G=0.000000,B=0.000000,A=1.000000)
   BlinkColorOff=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)
   BlinkTime=0.200000
   BlinkFX=ParticleSystem'WEP_C4_EMIT.FX_C4_Glow'
   bAlwaysReplicateExplosion=True
   bCanDisintegrate=True
   bCanStick=True
   AlwaysRelevantDistanceSquared=6250000.000000
   GlassShatterType=FMGS_ShatterDamaged
   TossZ=100.000000
   ExplosionActorClass=Class'kfgamecontent.KFExplosionActorC4'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_C4_ARCH.C4_Explosion'
      Damage=820.000000
      DamageRadius=400.000000
      DamageFalloffExponent=2.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_C4'
      KnockDownStrength=0.000000
      ExplosionSound=AkEvent'WW_WEP_EXP_C4.Play_WEP_EXP_C4_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Thrown_C4:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      CamShakeInnerRadius=200.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Thrown_C4:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   AltExploEffects=KFImpactEffectInfo'WEP_C4_ARCH.C4_Explosion_Concussive_Force'
   Begin Object Class=KFProjectileStickHelper Name=StickHelper0
      StickAkEvent=AkEvent'WW_WEP_EXP_C4.Play_WEP_EXP_C4_Handling_Place'
      Name="StickHelper0"
      ObjectArchetype=KFProjectileStickHelper'KFGame.Default__KFProjectileStickHelper'
   End Object
   StickHelper=KFProjectileStickHelper'kfgamecontent.Default__KFProj_Thrown_C4:StickHelper0'
   Speed=1200.000000
   MaxSpeed=1200.000000
   bBlockedByInstigator=False
   bIgnoreFoliageTouch=True
   DamageRadius=0.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=BlinkPointLight
   Components(2)=StaticMeshComponent0
   Physics=PHYS_Falling
   bNetTemporary=False
   bCollideComplex=True
   bBounce=True
   LifeSpan=0.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Thrown_C4"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
