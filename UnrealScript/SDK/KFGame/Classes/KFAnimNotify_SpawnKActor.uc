//=============================================================================
// KFAnimNotify_SpawnKActor
//=============================================================================
// Spawns a KActor at a given mesh location (e.g. discarded magazines)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFAnimNotify_SpawnKActor extends AnimNotify_Scripted;

/** Mesh to spawn physics for */
var() const StaticMesh RigidBodyMesh;

/** Lower bound of random initial linear vel */
var() vector					MinLinearVel;
/** Upper bound of random initial linear vel */
var() vector					MaxLinearVel;

/** Lower bound of random initial angular vel */
var() vector					MinAngularVel;
/** Upper bound of random initial angular vel */
var() vector					MaxAngularVel;

/** Bone to spawn this actor on */
var() name BoneName;

/** If set, hide the bone when spawning the new mesh */
var() bool bShouldHideBone;

/** If > 0, when spawned in first person the mesh is hidden for a short time */
var() float FirstPersonUnhideDelay;

/** Spwans a magazine KActor from the weapon's magazine bone */
event Notify( Actor Owner, AnimNodeSequence AnimSeqInstigator )
{
	local KFKActorSpawnable NewKActor;
	local SkeletalMeshComponent SkelComp;
	local vector Loc, LinearVel, AngularVel;
	local rotator Rot;
	local Quat BoneQuat;
	local Pawn P;

	SkelComp = AnimSeqInstigator.SkelComponent;

	if ( RigidBodyMesh == None || SkelComp == None )
		return;

	if ( bShouldHideBone )
	{
		// hide the magazine bone until the reload is finished
		SkelComp.HideBoneByName(BoneName, PBO_None);
	}

	// Skip physics in dropdetail
	if ( Owner.WorldInfo.bDropDetail || !Owner.ActorEffectIsRelevant(None, false) )
		return;

	Loc = SkelComp.GetBoneLocation(BoneName);
	BoneQuat = SkelComp.GetBoneQuaternion(BoneName);
	Rot = QuatToRotator(BoneQuat);

	NewKActor = Owner.Spawn( class'KFKActorSpawnable', Owner,, Loc, Rot);
	if ( NewKActor != None )
	{
		NewKActor.StaticMeshComponent.SetStaticMesh(RigidBodyMesh);
		NewKActor.LifeSpan = 30.f * FClamp(Owner.WorldInfo.DestructionLifetimeScale, 0.1f, 2.f);		

		// Set initial linear velocity
		LinearVel.X = RandRange(MinLinearVel.X, MaxLinearVel.X);
		LinearVel.Y = RandRange(MinLinearVel.Y, MaxLinearVel.Y);
		LinearVel.Z = RandRange(MinLinearVel.Z, MaxLinearVel.Z);
		NewKActor.StaticMeshComponent.SetRBLinearVelocity( Owner.Velocity + QuatRotateVector(BoneQuat, LinearVel) );

		// Set initial angular velocity
		AngularVel.X = RandRange(MinAngularVel.X, MaxAngularVel.X);
		AngularVel.Y = RandRange(MinAngularVel.Y, MaxAngularVel.Y);
		AngularVel.Z = RandRange(MinAngularVel.Z, MaxAngularVel.Z);
		NewKActor.StaticMeshComponent.SetRBAngularVelocity( QuatRotateVector(BoneQuat, AngularVel) );
		
		NewKActor.StaticMeshComponent.WakeRigidBody();

		// If bOwnerNoSee, this may be a third person effect so handle FirstPersonUnhideDelay
		if ( SkelComp.bOwnerNoSee && FirstPersonUnhideDelay > 0 )
		{
			P = Pawn(Owner);
			if ( P != None && P.IsFirstPerson() )
			{
				NewKActor.HideForInterval(FirstPersonUnhideDelay);
			}
		}
	}
}

defaultproperties
{
	NotifyColor=(R=255,G=0,B=255)
	BoneName=RW_Magazine1
	FirstPersonUnhideDelay=0.15
}