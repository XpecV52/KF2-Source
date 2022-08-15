//=============================================================================
// KFProj_Bullet_Gunslinger
//=============================================================================
// Bullet class for Gunslinmger hand guns
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Chris "schneidzekk" Schneider
//=============================================================================

class KFProj_Bullet_Gunslinger extends KFProj_Bullet
	native
	hidedropdown;

var private bool 	bCollided;

simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	bCollided = true;
	Super.Touch( Other, OtherComp, HitLocation, HitNormal );
}

simulated event HitWall(vector HitNormal, actor Wall, PrimitiveComponent WallComp)
{
	if( !bCollided )
	{ 
		CheckForComboBreaker();
		bCollided = true;
	}

	Super.HitWall(HitNormal, Wall, WallComp);
}

native simulated final private function CheckForComboBreaker();

defaultproperties
{
}
