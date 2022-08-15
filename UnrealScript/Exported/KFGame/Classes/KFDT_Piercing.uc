//=============================================================================
// KFDT_Piercing
//=============================================================================
// Sharp or high velocity objects designed to pass through enemies
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing extends KFDamageType
	abstract;

defaultproperties
{
   EffectGroup=FXG_Piercing
   KDamageImpulse=300.000000
   Name="Default__KFDT_Piercing"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
