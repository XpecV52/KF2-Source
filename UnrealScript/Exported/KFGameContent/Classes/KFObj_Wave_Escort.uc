//=============================================================================
// KFObj_Escort
//=============================================================================
// KF2 Escort Objective class
// Players must take an object from place A to place B.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFObj_Wave_Escort extends KFObj_Wave;

/*********************************************************************************************
 Designer Variables
**********************************************************************************************/
var()			actor			EscortActor;			//An actor placed in the level that a player must carry to the extraction point.
var()			volume			ExtractionVolume;		//A map volume that defines the extraction point of the carried object.
var()			SkeletalMesh	TargetMesh3rd;			//The 3rd person representation of the escort target.
var()			SkeletalMesh	TargetMesh1st;			//The 3rd person representation of the escort target.

defaultproperties
{
   Name="Default__KFObj_Wave_Escort"
   ObjectArchetype=KFObj_Wave'kfgamecontent.Default__KFObj_Wave'
}
