//=============================================================================
// KFAIController_ZedBloatKingSubspawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
// Base controller for the BK poop monster.  Streaks toward a target and
//		explodes its matter all over.
//=============================================================================

class KFAIController_ZedBloatKingSubspawn extends KFAIController_Monster;

/** Squared radius at which the poop monster will attempt to explode */
var const float ExplosionRadiusSq;

/** Cached pawn reference */
var KFPawn_ZedBloatKingSubspawn PoopPawn;

event Possess(Pawn inPawn, bool bVehicleTransition)
{
	super.Possess(inPawn, bVehicleTransition);

	PoopPawn = KFPawn_ZedBloatKingSubspawn(inPawn);
}

simulated function Tick(float DeltaTime)
{
	super.Tick(DeltaTime);

	if (Role == ROLE_Authority)
	{
		CheckMeleeTargetExplosion();
	}
}

//This guy never melees, skip this functionality
function bool CanDoStrike()
{
	return false;
}

function CheckMeleeTargetExplosion()
{
	local Vector ToTarget;
	if (Enemy == none || PoopPawn.IsDoingSpecialMove(SM_Custom1))
	{
		return;
	}

	ToTarget = Enemy.Location - MyKFPawn.Location;

	if (VSizeSq(ToTarget) < ExplosionRadiusSq)
	{
		if (PoopPawn != none)
		{
			class'AICommand_BloatKingSubspawn_Explode'.static.StartExplode(self);
		}
	}
}

defaultproperties
{
   ExplosionRadiusSq=62500.000000
   bEvadeOnRunOverWarning=True
   bIsProbingMeleeRangeEvents=True
   SprintWithinEnemyRange=(X=600.000000,Y=1200.000000)
   DangerEvadeSettings(0)=(ClassName="KFProj_Bullet_Pellet",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.600000,0.500000,0.300000,0.200000),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.000000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(1)=(ClassName="KFProj_Nail_Nailgun",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.600000,0.500000,0.300000,0.200000),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.000000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(2)=(ClassName="KFProj_Bullet_DragonsBreath",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.600000,0.500000,0.300000,0.200000),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.000000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(3)=(ClassName="KFProj_HighExplosive_M79",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.600000,0.500000,0.300000,0.200000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(4)=(ClassName="KFProj_HighExplosive_M32",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.600000,0.500000,0.300000,0.200000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(5)=(ClassName="KFProj_Rocket_RPG7",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.600000,0.500000,0.300000,0.200000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(6)=(ClassName="KFProj_CaulkNBurn_GroundFire",Cooldowns=(3.000000,1.000000,1.000000,1.000000),EvadeChances=(0.200000,0.200000,0.300000,0.400000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(7)=(ClassName="KFProj_FlameThrower_GroundFire",Cooldowns=(3.000000,1.000000,1.000000,1.000000),EvadeChances=(0.200000,0.200000,0.300000,0.400000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(8)=(ClassName="KFWeap_Flame_CaulkBurn",Cooldowns=(2.500000,2.500000,2.500000,2.000000),EvadeChances=(0.200000,0.200000,0.300000,0.400000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(9)=(ClassName="KFWeap_Flame_Flamethrower",Cooldowns=(2.500000,2.500000,2.500000,2.000000),EvadeChances=(0.200000,0.200000,0.300000,0.400000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(10)=(ClassName="KFWeap_Beam_Microwave",Cooldowns=(2.500000,2.500000,2.500000,2.000000),EvadeChances=(0.200000,0.200000,0.300000,0.400000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(11)=(ClassName="KFProj_FragGrenade",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.200000,0.400000,0.600000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.500000),(X=0.000000,Y=0.300000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(12)=(ClassName="KFProj_MolotovGrenade",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.200000,0.400000,0.600000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.500000),(X=0.000000,Y=0.300000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(13)=(ClassName="KFProj_DynamiteGrenade",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.200000,0.400000,0.600000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.500000),(X=0.000000,Y=0.300000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(14)=(ClassName="KFProj_NailBombGrenade",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.200000,0.400000,0.600000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.500000),(X=0.000000,Y=0.300000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(15)=(ClassName="KFProj_HEGrenade",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.200000,0.400000,0.600000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.500000),(X=0.000000,Y=0.300000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   Name="Default__KFAIController_ZedBloatKingSubspawn"
   ObjectArchetype=KFAIController_Monster'KFGame.Default__KFAIController_Monster'
}
