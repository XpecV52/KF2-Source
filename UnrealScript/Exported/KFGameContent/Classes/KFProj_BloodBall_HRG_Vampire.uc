//=============================================================================
// KFProj_BloodBall_HRG_Vampire
//=============================================================================
// Projectile class for Vampire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================
class KFProj_BloodBall_HRG_Vampire extends KFProjectile;


/** Storing all relative info about Blood Ball charged (in order to help in replication) */
struct BloodBallChargeInfo
{
	var float ChargePercentage;
	var float DamageByChargePercentage;
};

/** Dampen amount for every bounce */
var float DampenFactor;

/** Dampen amount for parallel angle to velocity */
var float DampenFactorParallel;

/** How much to offset the mine when spawning inside of collision */
var float SpawnCollisionOffsetAmt;

/** Vector to offset the ground FX particle system by when landing */
var vector LandedFXOffset;

/** Armed mine collision settings */

/** Decal settings */
var MaterialInterface ImpactDecalMaterial;
var float ImpactDecalWidth;
var float ImpactDecalHeight;
var float ImpactDecalThickness;

var float MaxExplodeTriggerHeightPerPercentage;
var float MinExplodeTriggerHeightPerPercentage;

var float MaxDamageRadiusPerPercentage;
var float MinDamageRadiusPerPercentage;

var float MaxCollisionRadius;
var float MinCollisionRadius;
var float MaxCollisionHeight;
var float MinCollisionHeight;

var float MaxDamagePerPercentage;
var float MinDamagePerPercentage;

var repnotify BloodBallChargeInfo BloodBallCharge;

var float fCachedCylinderWidth, fCachedCylinderHeight;

//EXPERIMENTAL FEATURES
var bool bCantBeTouchedByInstigator;
var bool bManuallyDetonated;
var bool bCantDetonateOnFullHP;

replication
{
	if( bNetDirty && Role == Role_Authority)
		BloodBallCharge;
}

simulated event ReplicatedEvent( name VarName )
{
	super.ReplicatedEvent( VarName );

	if( VarName == nameOf(BloodBallCharge))
	{
		ScalingExplosionTemplateByBloodBallCharge();
		ScalingProjEffectsByBloodBallCharge();
	}
}

simulated function SetInheritedScale(float NewChargePercentage, float NewDamageByChargePercentage)
{
	BloodBallCharge.DamageByChargePercentage=NewDamageByChargePercentage;
	BloodBallCharge.ChargePercentage = FMax(0.1, NewChargePercentage);//We want to see at least a bit of the projectile.
	
	ScalingExplosionTemplateByBloodBallCharge();
	ScalingProjEffectsByBloodBallCharge();

	bNetDirty=true;
}

simulated function ScalingExplosionTemplateByBloodBallCharge()
{
	fCachedCylinderWidth = Lerp(MinCollisionRadius, MaxCollisionRadius, BloodBallCharge.ChargePercentage);
	fCachedCylinderHeight = Lerp(MinCollisionHeight, MaxCollisionHeight, BloodBallCharge.ChargePercentage);
	CylinderComponent(CollisionComponent).SetCylinderSize(fCachedCylinderWidth, fCachedCylinderHeight);

	ExplosionTemplate.DamageRadius = FMax(MinDamageRadiusPerPercentage, Lerp(MinDamageRadiusPerPercentage, MaxDamageRadiusPerPercentage, BloodBallCharge.DamageByChargePercentage));
	ExplosionTemplate.Damage = FMax(MinDamagePerPercentage, Lerp(MinDamagePerPercentage, MaxDamagePerPercentage, BloodBallCharge.DamageByChargePercentage));
}

simulated function ScalingProjEffectsByBloodBallCharge()
{
	local vector ChargePercentageVector;
	ChargePercentageVector.X = BloodBallCharge.ChargePercentage;
	ChargePercentageVector.Y = BloodBallCharge.ChargePercentage;
   	ChargePercentageVector.Z = BloodBallCharge.ChargePercentage;

	if(ProjEffects != None)
	{
		ProjEffects.SetVectorParameter( name("BlobCharge"), ChargePercentageVector);
		ProjEffects.SetFloatParameter( name("MineFxControlParam"), BloodBallCharge.ChargePercentage);
	}
}




simulated event PostBeginPlay()
{
	local vector Hitlocation, HitNormal;

	super.PostBeginPlay();

	BloodBallCharge.ChargePercentage=0;
	BloodBallCharge.DamageByChargePercentage=0;

	if( Role == ROLE_Authority )
	{
		// If we're spawning in collision for some reason, offset it towards the instigator to keep it in play
		Instigator.Trace( HitLocation, HitNormal, Location, Instigator.Location, false,,, TRACEFLAG_Bullet );
		if( !IsZero(HitLocation) )
		{
			SetLocation( HitLocation + HitNormal*SpawnCollisionOffsetAmt );
		}
	}
}

simulated function SpawnFlightEffects()
{
	super.SpawnFlightEffects();
}

/** Validates a touch */


simulated protected function PrepareExplosionTemplate()
{

	local Weapon OwnerWeapon;
	local Pawn OwnerPawn;

	super(KFProjectile).PrepareExplosionTemplate();
	OwnerWeapon = Weapon(Owner);
	if (OwnerWeapon != none)
	{
		OwnerPawn = Pawn(OwnerWeapon.Owner);
		if (OwnerPawn != none)
		{
			ExplosionTemplate.DamageRadius *= KFPawn(OwnerPawn).GetPerk().GetAoERadiusModifier();
		}
	}
}

simulated protected function PrepareExplosionActor(GameExplosionActor GEA)
{
	KFExplosion_HRG_Vampire_BloodBall(GEA).ChargePercentage = BloodBallCharge.ChargePercentage;
	KFExplosion_HRG_Vampire_BloodBall(GEA).DamageByChargePercentage = BloodBallCharge.DamageByChargePercentage;
	super.PrepareExplosionActor(GEA);
}

/** Call ProcessBulletTouch */
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if (Other == Instigator || CheckRepeatingTouch(Other))
	{
		return;
	}

	if (IgnoreTouchActor != Other)
	{
		ProcessBulletTouch(Other, HitLocation, HitNormal);
	}
	super.ProcessTouch(Other, HitLocation, HitNormal);
}

defaultproperties
{
   DampenFactor=0.125000
   DampenFactorParallel=0.175000
   SpawnCollisionOffsetAmt=28.000000
   LandedFXOffset=(X=0.000000,Y=0.000000,Z=2.000000)
   ImpactDecalWidth=178.000000
   ImpactDecalHeight=178.000000
   ImpactDecalThickness=28.000000
   MaxExplodeTriggerHeightPerPercentage=22.000000
   MinExplodeTriggerHeightPerPercentage=11.000000
   MaxDamageRadiusPerPercentage=280.000000
   MinDamageRadiusPerPercentage=130.000000
   MaxCollisionRadius=20.000000
   MinCollisionRadius=10.000000
   MaxCollisionHeight=20.000000
   MinCollisionHeight=10.000000
   MaxDamagePerPercentage=150.000000
   MinDamagePerPercentage=15.000000
   bCantBeTouchedByInstigator=True
   bCantDetonateOnFullHP=True
   bSyncToOriginalLocation=True
   bSyncToThirdPersonMuzzleLocation=True
   bUseClientSideHitDetection=True
   bStopAmbientSoundOnExplode=True
   GlassShatterType=FMGS_ShatterAll
   TouchTimeThreshhold=0.050000
   TossZ=150.000000
   GravityScale=0.500000
   TerminalVelocity=2000.000000
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_HRG_Vampire_BloodBall'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_HRG_Vampire_Arch.HRG_Vampire_BlobFireImpacts'
      bAllowPerMaterialFX=True
      DamageRadius=200.000000
      DamageFalloffExponent=0.500000
      MyDamageType=Class'kfgamecontent.KFDT_Toxic_HRG_Vampire_BloodBall'
      KnockDownStrength=0.000000
      MomentumTransferScale=45000.000000
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=KFCameraShake'WEP_Mine_Reconstructor_Arch.Camera_Shake'
      CamShakeInnerRadius=200.000000
      CamShakeOuterRadius=400.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_BloodBall_HRG_Vampire:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'WEP_HRG_Vampire_EMIT.FX_HRG_Vampire_BlobProjectile_01'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   AssociatedPerkClass=Class'KFGame.KFPerk_FieldMedic'
   Speed=2000.000000
   MaxSpeed=2000.000000
   MomentumTransfer=50000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
      CollisionHeight=10.000000
      CollisionRadius=10.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   Physics=PHYS_Falling
   bPushedByEncroachers=False
   bNetTemporary=False
   bCanBeDamaged=False
   bCollideComplex=True
   bProjTarget=True
   bNoEncroachCheck=True
   bBounce=True
   LifeSpan=300.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_BloodBall_HRG_Vampire"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
