//=============================================================================
// KFDT_Toxic_PlayerCrawlerSuicide
//=============================================================================
// Crawler suicide gas attack damagetype
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFDT_Toxic_PlayerCrawlerSuicide extends KFDT_Toxic
	abstract
	hidedropdown;

defaultproperties
{
   bNoInstigatorDamage=True
   bConsideredIndirectOrAoE=True
   DoT_Type=DOT_None
   PoisonPower=0.000000
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_Puke_Light'
   Name="Default__KFDT_Toxic_PlayerCrawlerSuicide"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
