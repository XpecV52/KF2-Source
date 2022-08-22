//=============================================================================
// KFAIController_ZedBloat
//=============================================================================
// The mighty Bloat.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFAIController_ZedBloat extends KFAIController_Monster;

defaultproperties
{
   bCanTeleportCloser=False
   bCanStrikeThroughEnemies=True
   bIsProbingMeleeRangeEvents=True
   SprintWithinEnemyRange=(X=520.000000,Y=1200.000000)
   EvadeGrenadeChance=0.600000
   LowIntensityAttackCooldown=3.000000
   DangerEvadeSettings(0)=(ClassName="KFProj_CaulkNBurn_GroundFire",Cooldowns=(3.000000,1.000000,1.000000,1.000000),EvadeChances=(0.200000,0.200000,0.300000,0.400000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(1)=(ClassName="KFProj_FlameThrower_GroundFire",Cooldowns=(3.000000,1.000000,1.000000,1.000000),EvadeChances=(0.200000,0.200000,0.300000,0.400000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(2)=(ClassName="KFWeap_Flame_CaulkBurn",Cooldowns=(2.500000,2.500000,2.500000,2.000000),EvadeChances=(0.200000,0.200000,0.300000,0.400000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(3)=(ClassName="KFWeap_Flame_Flamethrower",Cooldowns=(2.500000,2.500000,2.500000,2.000000),EvadeChances=(0.200000,0.200000,0.300000,0.400000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(4)=(ClassName="KFWeap_Beam_Microwave",Cooldowns=(2.500000,2.500000,2.500000,2.000000),EvadeChances=(0.200000,0.200000,0.300000,0.400000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(5)=(ClassName="KFWeap_Rifle_Winchester1894",Cooldowns=(0.500000,0.400000,0.300000,0.200000),BlockChances=(0.100000,0.200000,0.700000,0.850000))
   DangerEvadeSettings(6)=(ClassName="KFWeap_Bow_Crossbow",Cooldowns=(0.500000,0.400000,0.300000,0.200000),BlockChances=(0.100000,0.200000,0.700000,0.850000))
   DangerEvadeSettings(7)=(ClassName="KFWeap_Rifle_M14EBR",Cooldowns=(0.500000,0.400000,0.300000,0.200000),BlockChances=(0.100000,0.200000,0.700000,0.850000))
   DangerEvadeSettings(8)=(ClassName="KFWeap_Rifle_RailGun",Cooldowns=(0.500000,0.400000,0.300000,0.200000),BlockChances=(0.100000,0.200000,0.700000,0.850000))
   Name="Default__KFAIController_ZedBloat"
   ObjectArchetype=KFAIController_Monster'KFGame.Default__KFAIController_Monster'
}
