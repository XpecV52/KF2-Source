//=============================================================================
// KFDT_GoompaStomp
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_GoompaStomp extends KFDamageType;

defaultproperties
{
   bCanGib=True
   bIgnoreAggroOnDamage=True
   bCanObliterate=True
   bPointImpulseTowardsOrigin=True
   ObliterationDamageThreshold=1
   MaxObliterationGibs=12.000000
   ImpulseOriginScale=100.000000
   ImpulseOriginLift=150.000000
   RadialDamageImpulse=1000.000000
   Name="Default__KFDT_GoompaStomp"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
