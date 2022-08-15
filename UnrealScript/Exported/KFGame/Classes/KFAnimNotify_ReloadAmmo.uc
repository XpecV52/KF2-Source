//=============================================================================
// KFAnimNotify_ReloadAmmo
//=============================================================================
// Notify to mark when to reload ammo into the current weapon. Used in
// place of AnimNotify_Script when we want to get a specific time without
// having to play the anim. (see KFSkeletalMeshComponent.GetAnimNotifyTime)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFAnimNotify_ReloadAmmo extends AnimNotify;

defaultproperties
{
   NotifyColor=(B=255,G=255,R=64,A=255)
   Name="Default__KFAnimNotify_ReloadAmmo"
   ObjectArchetype=AnimNotify'Engine.Default__AnimNotify'
}
