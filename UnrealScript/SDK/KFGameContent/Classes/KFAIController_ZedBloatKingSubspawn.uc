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
	ExplosionRadiusSq=62500 //300uu=3m squared for performance
	// ---------------------------------------------
	// Combat
	MeleeCommandClass=class'AICommand_Base_Zed'
	DefaultCommandClass=class'AICommand_Base_Zed'
	bIsProbingMeleeRangeEvents=true
	// ---------------------------------------------
	// AI / Navigation
	SprintWithinEnemyRange=(X=600.f,Y=1200.f)
	bEvadeOnRunOverWarning=true
}