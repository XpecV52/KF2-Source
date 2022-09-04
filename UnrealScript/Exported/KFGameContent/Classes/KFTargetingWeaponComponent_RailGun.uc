//=============================================================================
// KFTargetingWeaponComponent_RailGun
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFTargetingWeaponComponent_RailGun extends KFTargetingWeaponComponent;

defaultproperties
{
   TargetingEnabled(0)=1
   TargetZeds(0)=1
   LockRange(0)=200000.000000
   LockAcquireTime(0)=0.350000
   LockAcquireTime_Large(0)=0.600000
   LockAcquireTime_Boss(0)=1.100000
   LockAcquireTime_Versus(0)=1.100000
   LockTolerance(0)=0.200000
   LockAim(0)=0.995000
   LockTargetingSoundInterval=0.090000
   LockAcquiredSoundFirstPerson=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Scope_Locked'
   LockLostSoundFirstPerson=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Scope_Lost'
   LockTargetingSoundFirstPerson=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Scope_Locking'
   TargetLocationReplicationInterval=0.016000
   Name="Default__KFTargetingWeaponComponent_RailGun"
   ObjectArchetype=KFTargetingWeaponComponent'KFGame.Default__KFTargetingWeaponComponent'
}
