//=============================================================================
// KFDT_Environment_KActorImpulse
//=============================================================================
// Damage type used only for physics actor (e.g. CanBecomeDynamic) impulses
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Environment_KActorImpulse extends KFDamageType
	abstract;

defaultproperties
{
   bCausedByWorld=True
   KDamageImpulse=0.000000
   RadialDamageImpulse=1000.000000
   Name="Default__KFDT_Environment_KActorImpulse"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
