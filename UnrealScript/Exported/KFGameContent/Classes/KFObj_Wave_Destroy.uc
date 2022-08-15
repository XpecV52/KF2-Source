//=============================================================================
// KFObj_Destroy
//=============================================================================
// KF2 Destroy Objective class
// Players must damage a specified actor or set of actors.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFObj_Wave_Destroy extends KFObj_Wave;

/** replicated information on a hit we've taken */
struct DestroyActorTarget
{
	var()	int					Health;			// The amount of health the destroy target has.
	var()	ParticleSystem		ParticleEffect; // A particle system that emits from the actor if the actor is destroyed.
	var()   AkEvent				SoundEffect;	// A sound effect that is played when the actor is destroyed
	var() 	StaticMesh			HealthyMesh;	// A static mesh that is the healthy version of the destroy target
	var() 	StaticMesh			DestroyedMesh;	// A static mesh that is the destroyed version of the destroy target
};

/*********************************************************************************************
 Designer Variables
**********************************************************************************************/
var()		array<DestroyActorTarget>		DestroyActorTargets;		// Array of DestroyActorTargets

defaultproperties
{
   Name="Default__KFObj_Wave_Destroy"
   ObjectArchetype=KFObj_Wave'KFGameContent.Default__KFObj_Wave'
}
