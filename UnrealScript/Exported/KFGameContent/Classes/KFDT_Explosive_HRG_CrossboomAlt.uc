//=============================================================================
// KFDT_Explosive_HRG_CrossboomAlt
//=============================================================================
// Explosive damage type for the HRG Crossboom
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFDT_Explosive_HRG_CrossboomAlt extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Crossboom'
   bShouldSpawnPersistentBlood=True
   KnockdownPower=100.000000
   StumblePower=200.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   GibImpulseScale=0.150000
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=2000.000000
   Name="Default__KFDT_Explosive_HRG_CrossboomAlt"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
