//=============================================================================
// KFTargetingWeaponComponent_HRGIncision
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFTargetingWeaponComponent_HRGIncision extends KFTargetingWeaponComponent;

simulated function bool AllowTargetLockOn(byte TargetingMode)
{
	local bool bAllowLockOn;

	bAllowLockOn = super.AllowTargetLockOn(TargetingMode);

	if (bAllowLockOn)
	{
		if (TargetingMode == ETargetingMode_Zed)
		{
			bAllowLockOn = KFW.bUsingSights;
		}
	}

	return bAllowLockOn;
}

simulated function bool CanLockOnTo(byte TargetingMode, Actor TA)
{
	local KFPawn PawnTarget;
	local bool bCanLockOnTo;

	bCanLockOnTo = super.CanLockOnTo(TargetingMode, TA);

	if (bCanLockOnTo)
	{
		if (TargetingMode == ETargetingMode_Player)
		{
			PawnTarget = KFPawn(TA);
			bCanLockOnTo = PawnTarget.Health < PawnTarget.HealthMax;
		}
	}

	return bCanLockOnTo;
}

simulated function Actor DetermineBestTarget(byte TargetingMode)
{
	local int i;
    local vector StartTrace, EndTrace;
    local rotator ViewRotation;
	local array<Actor> HitActors;
	local array<vector> HitLocations;
	local Actor HitActor;

	StartTrace = Instigator.GetWeaponStartTraceLocation();
    ViewRotation = Instigator.GetViewRotation();
	ViewRotation += KFPlayerController(Instigator.Controller).WeaponBufferRotation;
	EndTrace = StartTrace + vector(ViewRotation) * GetLockRange();
	HitActors = KFW.BeamLineCheck(EndTrace, StartTrace, vect(0,0,0), HitLocations);

	for (i = 0; i < HitActors.Length; ++i)
	{
		HitActor = HitActors[i];
		if (CanLockOnTo(TargetingMode, HitActor))
		{
			return HitActor;
		}
		else
		{
			if (Pawn(HitActor) == none)
			{
				break;
			}
		}
	}

	return none;
}

defaultproperties
{
   TargetingModeFlags(0)=3
   LockRange(0)=200000.000000
   LockAcquireTime(0)=0.010000
   LockAcquireTime_Large(0)=0.010000
   LockAcquireTime_Boss(0)=0.010000
   LockAcquireTime_Versus(0)=0.010000
   LockTolerance(0)=0.400000
   LockAim(0)=0.987000
   LockTargetingSoundInterval(0)=0.090000
   LockAcquiredSoundFirstPerson=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Scope_Locked'
   LockLostSoundFirstPerson=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Scope_Lost'
   LockTargetingSoundFirstPerson=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Scope_Locking'
   HumanTargetableBoneNames(0)="Spine2"
   TargetLocationReplicationInterval=0.016000
   Name="Default__KFTargetingWeaponComponent_HRGIncision"
   ObjectArchetype=KFTargetingWeaponComponent'KFGame.Default__KFTargetingWeaponComponent'
}
