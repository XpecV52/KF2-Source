//=============================================================================
// KFDT_Fire_Ground_ThermiteBore
//=============================================================================
// Damage type class for the thermite bore ground fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Fire_Ground_ThermiteBore extends KFDT_Fire_Ground
	abstract;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_ThermiteBore'
   bIgnoreSelfInflictedScale=False
   DoT_Duration=3.000000
   DoT_Interval=0.500000
   StumblePower=100.000000
   BurnPower=10.000000
   Name="Default__KFDT_Fire_Ground_ThermiteBore"
   ObjectArchetype=KFDT_Fire_Ground'KFGame.Default__KFDT_Fire_Ground'
}
