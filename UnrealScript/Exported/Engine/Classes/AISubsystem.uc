/**
 * Copyright 2008 PCF, All Rights Reserved.
 * This class is here because Engine needs to hold a pointer to an instance of it.
 */
 class AISubsystem extends Subsystem
	abstract
	native;

var bool bImplementsNavMeshGeneration;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

final native static noexport function ToggleNavByActor(Actor Referencer, bool bEnable);
final native static noexport function ToggleNavByComponent(Component Referencer, bool bEnable);
final native static noexport function ToggleNavByCover(CoverLink Referencer, int SlotIdx, bool bEnable);


/** Used to access the difficulty values from KFGame for BaseAI */
event float GetDifficultyValue(int Index)
{
	return -1;
}

defaultproperties
{
   Name="Default__AISubsystem"
   ObjectArchetype=Subsystem'Core.Default__Subsystem'
}
