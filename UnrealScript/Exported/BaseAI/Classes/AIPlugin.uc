//=============================================================================
// AIPlugin
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class AIPlugin extends PluginBase within BaseAIController
	native(Plugin)
	abstract;

var const protected{protected} BaseAIController MyBaseAIController;
var const protected{private} bool bCustomSetupController;

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

event ScriptSetUp()
{

}

/**
 * ===========
 * DEBUG STATES
 * ===========
 */
state DEBUGSTATE
{
	function BeginState( Name PreviousStateName )
	{
		//debug
		AILog_Internal("BEGINSTATE"@PreviousStateName,'State',);
	}

	function EndState( Name NextStateName )
	{
		//debug
		AILog_Internal("ENDSTATE"@NextStateName,'State',);
	}

	function PushedState()
	{
		//debug
		AILog_Internal("PUSHED",'State',);
	}

	function PoppedState()
	{
		//debug
		AILog_Internal("POPPED",'State',);
	}

	function ContinuedState()
	{
		//debug
		AILog_Internal("CONTINUED",'State',);
	}

	function PausedState()
	{
		//debug
		AILog_Internal("PAUSED",'State',);
	}
}

defaultproperties
{
   Name="Default__AIPlugin"
   ObjectArchetype=PluginBase'BaseAI.Default__PluginBase'
}
