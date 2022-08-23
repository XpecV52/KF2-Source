//=============================================================================
// KFDifficulty_ClotAlphaKing
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_ClotAlphaKing extends KFDifficulty_ClotAlpha
	abstract;

/** Struct containing values for Alpha Clot rallies */
struct sRallyTriggerInfo
{
	/** Chance to rally when all conditions are met */
	var float RallyChance;
	/** Cooldown between rallies */
	var float Cooldown;
	/** How much to modify dealt damage on self when rallying */
	var float SelfDealtDamageModifier;
	/** How much to modify taken damage on self when rallying */
	var float SelfTakenDamageModifier;
};

/** Per-difficulty rally settings */
var const array<sRallyTriggerInfo> RallyTriggerSettings;

defaultproperties
{
   RallyTriggerSettings(0)=(Cooldown=15.000000,SelfDealtDamageModifier=2.500000,SelfTakenDamageModifier=0.100000)
   RallyTriggerSettings(1)=(Cooldown=15.000000,SelfDealtDamageModifier=2.500000,SelfTakenDamageModifier=0.100000)
   RallyTriggerSettings(2)=(RallyChance=0.700000,Cooldown=15.000000,SelfDealtDamageModifier=2.500000,SelfTakenDamageModifier=0.100000)
   RallyTriggerSettings(3)=(RallyChance=0.800000,Cooldown=15.000000,SelfDealtDamageModifier=2.500000,SelfTakenDamageModifier=0.100000)
   Name="Default__KFDifficulty_ClotAlphaKing"
   ObjectArchetype=KFDifficulty_ClotAlpha'kfgamecontent.Default__KFDifficulty_ClotAlpha'
}
