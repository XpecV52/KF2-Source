//=============================================================================
// KFProj_Bullet_RackEmUp
//=============================================================================
// Bullet class for weapons belonging to a perk that has the "Rack 'em Up" skill
// (gunslinger, sharpshooter)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Chris "schneidzekk" Schneider
//=============================================================================

class KFProj_Bullet_RackEmUp extends KFProj_Bullet
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

defaultproperties
{
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_Bullet:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_Bullet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Bullet_RackEmUp"
   ObjectArchetype=KFProj_Bullet'KFGame.Default__KFProj_Bullet'
}
