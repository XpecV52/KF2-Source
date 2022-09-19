//=============================================================================
// KFDT_Shrink_ShrinkRayGun
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================
class KFDT_Shrink_ShrinkRayGun extends KFDT_EMP
	abstract;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_ShrinkRayGun'
   DoT_Type=DOT_Fire
   DoT_Duration=-1.000000
   DoT_Interval=-1.000000
   MeleeHitPower=20.000000
   EMPPower=0.000000
   ShrinkPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Survivalist'
   KDeathVel=300.000000
   Name="Default__KFDT_Shrink_ShrinkRayGun"
   ObjectArchetype=KFDT_EMP'KFGame.Default__KFDT_EMP'
}
