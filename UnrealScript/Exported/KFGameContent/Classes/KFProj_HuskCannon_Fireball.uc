//=============================================================================
// KFProj_HuskCannon_Fireball
//=============================================================================
// Player version for the Husk Cannon of the Husk fire ball.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFProj_HuskCannon_Fireball extends KFProj_BallisticExplosive
    implements(KFInterface_DamageCauser);

var float DamageScale;
var float AOEScale;
var float IncapScale;
var repnotify int ChargeLevel;

var const ParticleSystem ExplosionEffectL1;
var const ParticleSystem ExplosionEffectL2;
var const ParticleSystem ExplosionEffectL3;

var const ParticleSystem ProjFlightTemplateL1;
var const ParticleSystem ProjFlightTemplateL2;
var const ParticleSystem ProjFlightTemplateL3;

var const AkBaseSoundObject ExplosionSoundL1;
var const AkBaseSoundObject ExplosionSoundL2;
var const AkBaseSoundObject ExplosionSoundL3;

var const ParticleSystem ConcussiveForceEffectL1;
var const ParticleSystem ConcussiveForceEffectL2;
var const ParticleSystem ConcussiveForceEffectL3;

/** Explosion actor class to use for ground fire */
var const protected class<KFExplosionActorLingering> GroundFireExplosionActorClass;
/** Explosion template to use for ground fire */
var KFGameExplosion GroundFireExplosionTemplate;

/** How long the ground fire should stick around */
var const protected float BurnDuration;

/** How often, in seconds, we should apply burn */
var const protected float BurnDamageInterval;

var bool bSpawnGroundFire;

var bool bAltGroundFire;
var KFImpactEffectInfo AltGroundFire;

replication
{
	if (bNetInitial)
		bSpawnGroundFire, ChargeLevel;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(ChargeLevel))
	{
		bSpawnGroundFire = ChargeLevel == 3;
		SpawnFlightEffects();
	}

	Super.ReplicatedEvent(VarName);
}

simulated function PostBeginPlay()
{
	local KFWeap_HuskCannon HuskCannon;
	local KFPlayerReplicationInfo InstigatorPRI;

	if(Role == ROLE_Authority)
	{
		HuskCannon = KFWeap_HuskCannon(Owner);
		if (HuskCannon != none)
		{
			ChargeLevel = HuskCannon.GetChargeFXLevel();
			bSpawnGroundFire = ChargeLevel == 3;
		}
	}

	if(Instigator != none)
	{
		if (AltGroundFire != none)
		{
			InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
			if (InstigatorPRI != none)
			{
				bAltGroundFire = InstigatorPRI.bSplashActive;
			}
		}
		else
		{
			bAltGroundFire = false;
		}
	}

	Super.PostBeginPlay();
}

simulated protected function PrepareExplosionActor(GameExplosionActor GEA)
{
    local KFExplosionActor_HuskCannon HuskExplode;

    HuskExplode = KFExplosionActor_HuskCannon(GEA);
    if (HuskExplode != None)
    {
        HuskExplode.DamageScale = DamageScale;
    }
}

simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	local KFExplosionActorLingering GFExplosionActor;
	local vector GroundExplosionHitNormal;

	if (bHasDisintegrated)
	{
		return;
	}

	if (!bHasExploded && bSpawnGroundFire)
	{
		if (bAltGroundFire && AltGroundFire != none)
		{
			GroundFireExplosionTemplate.ExplosionEffects = AltGroundFire;
		}

		GroundExplosionHitNormal = HitNormal;

		// Spawn our explosion and set up its parameters
		GFExplosionActor = Spawn(GroundFireExplosionActorClass, self, , HitLocation + (HitNormal * 32.f), rotator(HitNormal));
		if (GFExplosionActor != None)
		{
			GFExplosionActor.Instigator = Instigator;
			GFExplosionActor.InstigatorController = InstigatorController;

			// These are needed for the decal tracing later in GameExplosionActor.Explode()
			GroundFireExplosionTemplate.HitLocation = HitLocation;
			GroundFireExplosionTemplate.HitNormal = GroundExplosionHitNormal;

			// Apply explosion direction
			if (GroundFireExplosionTemplate.bDirectionalExplosion)
			{
				GroundExplosionHitNormal = GetExplosionDirection(GroundExplosionHitNormal);
			}

			// Set our duration
			GFExplosionActor.MaxTime = BurnDuration;

			// Set our burn interval
			GFExplosionActor.Interval = BurnDamageInterval;

			// Boom
			GFExplosionActor.Explode(GroundFireExplosionTemplate, GroundExplosionHitNormal);
		}
	}

	super.TriggerExplosion(HitLocation, HitNormal, HitActor);
}

//==============
// Touching
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if (ClassIsChildOf(Other.class, class'KFPawn'))
	{
		bSpawnGroundFire = false;
	}

	super.ProcessTouch(Other, HitLocation, HitNormal);
}

simulated protected function PrepareExplosionTemplate()
{
	local bool bUseConcussiveForce;
	local Weapon OwnerWeapon;
	local Pawn OwnerPawn;
	local KFPlayerReplicationInfo PRI;

	super(KFProjectile).PrepareExplosionTemplate();

	bUseConcussiveForce = false;
	OwnerWeapon = Weapon(Owner);
	if (OwnerWeapon != none)
	{
		OwnerPawn = Pawn(OwnerWeapon.Owner);
		if (OwnerPawn != none)
		{
			PRI = KFPlayerReplicationInfo(OwnerPawn.PlayerReplicationInfo);
			if (PRI != none)
			{
				bUseConcussiveForce = PRI.bConcussiveActive;
			}
		}
	}

	switch (ChargeLevel)
	{
	case 1:
		if (bUseConcussiveForce)
		{
			ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ConcussiveForceEffectL1;
			ExplosionTemplate.ExplosionSound = class'KFPerk_Demolitionist'.static.GetConcussiveExplosionSound();
		}
		else
		{
			ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ExplosionEffectL1;
			ExplosionTemplate.ExplosionSound = ExplosionSoundL1;
		}
		break;
	case 2:
		if (bUseConcussiveForce)
		{
			ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ConcussiveForceEffectL2;
			ExplosionTemplate.ExplosionSound = class'KFPerk_Demolitionist'.static.GetConcussiveExplosionSound();
		}
		else
		{
			ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ExplosionEffectL2;
			ExplosionTemplate.ExplosionSound = ExplosionSoundL2;
		}
		break;
	case 3:
		if (bUseConcussiveForce)
		{
			ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ConcussiveForceEffectL3;
			ExplosionTemplate.ExplosionSound = class'KFPerk_Demolitionist'.static.GetConcussiveExplosionSound();
		}
		else
		{
			ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ExplosionEffectL3;
			ExplosionTemplate.ExplosionSound = ExplosionSoundL3;
		}
		break;
	}

	class'KFPerk_Demolitionist'.static.PrepareExplosive(Instigator, self, AOEScale, DamageScale);
}

simulated protected function SetExplosionActorClass()
{
	local KFPlayerReplicationInfo InstigatorPRI;

	if (bWasTimeDilated && Instigator != none)
	{
		InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
		if (InstigatorPRI != none && InstigatorPRI.CurrentPerkClass == class'KFPerk_Demolitionist')
		{
			if (InstigatorPRI.bNukeActive && class'KFPerk_Demolitionist'.static.ProjectileShouldNuke(self))
			{
				ExplosionActorClass = class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass();
			}
		}
	}

	super.SetExplosionActorClass();
}

// KFInterface_DamageCauser
function float GetIncapMod()
{
    return IncapScale;
}

// Override ProjFlightTemplate to correct emitter.
simulated function SpawnFlightEffects()
{
	if (ChargeLevel == 0)
	{
		return; // Charge level will be set using replication.
	}

	switch (ChargeLevel)
	{
		case 1:
			ProjFlightTemplate = ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Projectile_L1';
			break;
		case 2:
			ProjFlightTemplate = ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Projectile_L2';
			break;
		case 3:
			ProjFlightTemplate = ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Projectile_L3';
			break;
	}

	Super.SpawnFlightEffects();
}

defaultproperties
{
   ExplosionEffectL1=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Impact_L1'
   ExplosionEffectL2=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Impact_L2'
   ExplosionEffectL3=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Impact_L3'
   ProjFlightTemplateL1=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Projectile_L1'
   ProjFlightTemplateL2=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Projectile_L2'
   ProjFlightTemplateL3=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Projectile_L3'
   ExplosionSoundL1=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_Impact'
   ExplosionSoundL2=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_Impact'
   ExplosionSoundL3=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_Impact'
   ConcussiveForceEffectL1=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Impact_L1_CF'
   ConcussiveForceEffectL2=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Impact_L2_CF'
   ConcussiveForceEffectL3=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Impact_L3_CF'
   GroundFireExplosionActorClass=Class'kfgamecontent.KFExplosion_HuskCannonFireballGroundFire'
   GroundFireExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_HuskCannon_Fireball:ExploTemplate1'
   BurnDuration=4.000000
   BurnDamageInterval=0.500000
   AltGroundFire=KFImpactEffectInfo'WEP_Flamethrower_ARCH.GroundFire_Splash_Impacts'
   ExtraLineCollisionOffsets(1)=(X=0.000000,Y=-8.000000,Z=0.000000)
   ExtraLineCollisionOffsets(2)=(X=0.000000,Y=8.000000,Z=0.000000)
   ExtraLineCollisionOffsets(3)=()
   ExplosionActorClass=Class'kfgamecontent.KFExplosionActor_HuskCannon'
   Begin Object Class=KFGameExplosion Name=ExploTemplate2
      ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.HuskProjectile_Explosion'
      bUseOverlapCheck=True
      Damage=60.000000
      DamageRadius=100.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_HuskCannon'
      MomentumTransferScale=6000.000000
      ExplosionEmitterScale=2.000000
      ExplosionSound=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_Impact'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_HuskCannon_Fireball:ExplosionPointLight'
      ExploLightFadeOutTime=0.500000
      FracturePartVel=100.000000
      CamShake=None
      Name="ExploTemplate2"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_HuskCannon_Fireball:ExploTemplate2'
   ProjFlightTemplate=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Projectile_L3'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   MomentumTransfer=0.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
      CollisionHeight=4.000000
      CollisionRadius=4.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_HuskCannon_Fireball"
   ObjectArchetype=KFProj_BallisticExplosive'KFGame.Default__KFProj_BallisticExplosive'
}
