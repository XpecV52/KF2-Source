//=============================================================================
// KFDT_Falling
//=============================================================================
// Damage caused by falling
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Falling extends KFDamageType
	abstract;

defaultproperties
{
   bArmorStops=False
   bCausedByWorld=True
   Name="Default__KFDT_Falling"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
