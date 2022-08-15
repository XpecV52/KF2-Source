//=============================================================================
// KFObj_Interact
//=============================================================================
// KF2 Interact Objective class
// Players must interact with a specified object for a specified period of time
// or a specified number of heal or weld points. There are several ways a
// player can interact with the object. Healing, Welding, Un-Welding or Using.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFObj_Wave_Interact extends KFObj_Wave;

enum EInteractType
{
	EIT_None,
	EIT_Healing,
	EIT_Welding,
	EIT_Using,
};

/*********************************************************************************************
 Designer Variables
**********************************************************************************************/
var()		EInteractType			InteractType;			//defines the type of interaction by the player. None, Healing, Welding, Un-Welding, Using
var()		int						InteractPoints;			//A number of "points" a player must reach by interacting with the object.

defaultproperties
{
   Name="Default__KFObj_Wave_Interact"
   ObjectArchetype=KFObj_Wave'KFGameContent.Default__KFObj_Wave'
}
