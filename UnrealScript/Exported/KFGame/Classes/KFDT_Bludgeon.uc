//=============================================================================
// KFDT_Bludgeon
//=============================================================================
// Any form of blunt force such as a hammer
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon extends KFDamageType
	abstract;








































































































































































































































































































































































	




	




	




	














	




	














	














































































#linenumber 13

/** Returns ID of dialog event for killer to speak after killing a zed using this damage type */
static function int GetKillerDialogID()
{
	return 80;
}

defaultproperties
{
   EffectGroup=FXG_Bludgeon
   GoreDamageGroup=DGT_MeleeBludgeon
   BodyWoundDecalMaterials(0)=MaterialInstanceConstant'FX_Impacts_MAT.FX_Blunted_Impact_Flesh_Decal_01_MIC'
   KDeathVel=200.000000
   Name="Default__KFDT_Bludgeon"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
