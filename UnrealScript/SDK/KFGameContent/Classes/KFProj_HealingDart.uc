//=============================================================================
// KFProj_HealingDart
//=============================================================================
// Healing Dart projectile
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_HealingDart extends KFProj_Bullet
	hidedropdown;

var Actor SeekTarget;
var vector InitialDir;

/** Tracking strength multiplier */
var(Locking) float TrackingStrength;

/** Offset to apply to SeekTarget's location */
var vector SeekOffset;
/** Set on first tick with a valid SeekTarget */
var bool bSeekInitialized;

replication
{
    if( bNetInitial && (Role==ROLE_Authority) )
        SeekTarget, InitialDir;
}

/** Called from Tick the first time we have a valid target */
simulated function InitializeSeek()
{
	local KFPawn KFP;

	if ( IsZero(InitialDir) )
	{
		InitialDir = Normal(Velocity);
	}
	
	// Instead of aiming at the cylinder aim for a bone on the mesh that will collide with this
	// projectile. Fixes an issue where the dart can miss a stationary target (see MTO_IKFloorConform)
	KFP = KFPawn(SeekTarget);
	if ( KFP != None && KFP.TorsoBoneName != '' )
	{
		SeekOffset = KFP.Mesh.GetBoneLocation(KFP.TorsoBoneName) - KFP.Location;
	}
}

/** Handle flight FX fading */
simulated event Tick(float DeltaTime)
{
    local vector SeekingVector, ForceDir;
    local float VelMag;

    super.Tick(DeltaTime);

	if ( bShuttingDown || SeekTarget == none )
	{
		return;
	}

	if ( SeekTarget == Instigator )
	{
		SeekTarget = none;
		return;
	}

	// Initialize seek vars
    if ( !bSeekInitialized )
	{
		InitializeSeek(); 
		bSeekInitialized = true;
	}

	SeekingVector = SeekTarget.Location + SeekOffset;
	ForceDir = Normal(SeekingVector - Location);

	if( (ForceDir Dot InitialDir) > 0.f )
	{
		VelMag = VSize(Velocity);
		Acceleration = TrackingStrength * VelMag * ForceDir;
	}
	else
	{
		Acceleration = Vect(0,0,0);
	}
}

/** Handle bullet collision and damage */
simulated function ProcessBulletTouch( Actor Other, Vector HitLocation, Vector HitNormal )
{
	local KFPerk InstigatorPerk;
	local KFPawn_Monster KFPM;

	super.ProcessBulletTouch( Other, HitLocation, HitNormal );
	KFPM = KFPawn_Monster(Other);

	if( Other != none && KFPM != none )
	{
		InstigatorPerk = KFPawn(Instigator).GetPerk();
		if( InstigatorPerk != none && InstigatorPerk.ShouldSedate() )
		{
			KFPM.DoSpecialMove( SM_Stunned );
		}
	}
}

/** Skip projectile HitWall since the healing dart does no damage and just explode/shutdown */
simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
	Explode(Location, HitNormal);
}

defaultproperties
{
	MaxSpeed=10000.0
	Speed=10000.0

	TrackingStrength=75

	// @note: Use caution when bNoReplicationToInstigator != bUseClientSideHitDetection or if bSyncToOriginalLocation !=
	// bUpdateSimulatedPosition.  Using CSHD with server replicated projectiles can be error prone if not careful.

	bAmbientSoundZedTimeOnly=false
    bNoReplicationToInstigator=false
	bUseClientSideHitDetection=true
	bUpdateSimulatedPosition=false
	bRotationFollowsVelocity=true//false
	bNetTemporary=false

	ProjFlightTemplate=ParticleSystem'FX_Projectile_EMIT.FX_Medic_dart_01'
	ProjFlightTemplateZedTime=ParticleSystem'FX_Projectile_EMIT.FX_Medic_dart_01'//ParticleSystem'WEP_1P_Nail_Shotgun_EMIT.FX_Nail_Shotgun_Tracer_ZEDTime'

    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Loop'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_MedicDart.Stop_WEP_SA_Medic_Dart_Loop'

	bDamageDestructiblesOnTouch=false
}

