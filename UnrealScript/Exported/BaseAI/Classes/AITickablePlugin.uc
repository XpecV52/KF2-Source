//=============================================================================
// AITickablePlugin
//=============================================================================
// this plugin type introduces tickable states functionality to deriving plugins
//
// NOTE: currently every plugin used is ticked directly by owner (only movement plugins
// implemented so far). If more plugins are created and need to be ticked a simple //
// registration mechanism should be implemented to store all plugins to be ticked in
// some array in owning BaseAIController (much like BaseAISubsystem.SmartObjects for example)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class AITickablePlugin extends AIPlugin within BaseAIController
	native(Plugin)
	abstract;

var const float	LatentTime;   // Internal latent function use.
var const private{private} bool bTickingEnabled;

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

final native latent function Sleep(float Seconds);

event ScriptTick( float DeltaTime )
{
}

function bool NotifyNpcTerminallyStuck()
{
	return false;
}

function bool NotifyNpcInGrannyMode()
{
	return false;
}

defaultproperties
{
   bTickingEnabled=True
   Name="Default__AITickablePlugin"
   ObjectArchetype=AIPlugin'BaseAI.Default__AIPlugin'
}
