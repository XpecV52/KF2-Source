//=============================================================================
// KFDifficulty_DAR_EMP
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_DAR_EMP extends KFDifficulty_DAR
	dependsOn(KFPawn_ZedDAR_EMP)
	abstract;

defaultproperties
{
   Normal=(DamageMod=0.350000,SoloDamageMod=0.350000)
   Hard=(SoloDamageMod=0.750000)
   Suicidal=(DamagedSprintChance=0.500000,SoloDamageMod=0.750000)
   HellOnEarth=(HealthMod=1.300000,HeadHealthMod=1.100000,SprintChance=0.750000,DamageMod=1.500000,SoloDamageMod=0.750000)
   RallySettings_Versus=(bCauseSprint=True)
   Name="Default__KFDifficulty_DAR_EMP"
   ObjectArchetype=KFDifficulty_DAR'kfgamecontent.Default__KFDifficulty_DAR'
}
