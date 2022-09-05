//=============================================================================
// KFMedicWeaponComponent_HRGIncision
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFMedicWeaponComponent_HRGIncision extends KFMedicWeaponComponent;

simulated function name GetWeaponFireAnim()
{
	return KFW.GetWeaponFireAnim(DEFAULT_FIREMODE);
}

defaultproperties
{
   HealingDartDamageType=Class'KFGame.KFDT_Healing'
   HealAmount=40
   HealFullRechargeSeconds=10.000000
   DartFireSnd=(DefaultCue=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Fire_1P')
   HealingDartWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Default_Recoil'
   OpticsUIClass=Class'KFGame.KFGFxWorld_MedicOptics'
   Name="Default__KFMedicWeaponComponent_HRGIncision"
   ObjectArchetype=KFMedicWeaponComponent'KFGame.Default__KFMedicWeaponComponent'
}
