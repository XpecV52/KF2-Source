//=============================================================================
// AnimationProxy
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class BaseAISubsystem extends AISubsystem
	config(Engine)
	native
	inherits(FCallbackEventDevice,FTickableObject);

var AIDebugTool AIDebug;

var const array<BaseAISquad> Squads;

var const array<INT> TeamSizes;

// ----------------------------------------------------------------------- //
// @deprecated with __TW_BASEAI_LEAN_
// ----------------------------------------------------------------------- //































// ----------------------------------------------------------------------- //
// END __TW_BASEAI_LEAN_
// ----------------------------------------------------------------------- //

native static final noexport function BaseAISubsystem GetInstance();
native static final noexport function AIDebugTool GetAIDebugTool();

native static final noexport function RegisterSquad(BaseAISquad Squad);
native static final noexport function UnRegisterSquad(BaseAISquad Squad);

native static final noexport function IncreaseTeamSize(BYTE TeamId);
native static final noexport function DecreaseTeamSize(BYTE TeamId);
native static final noexport function int GetTeamSize(byte TeamId);
native static final noexport function int GetEnemyTeamsSize(byte TeamId);

//NotifyKilled(Controller Killer, Controller Killed, pawn KilledPawn, class<DamageType> damageType)
native static final function NotifyKilled(Controller Killer, Controller KilledController, Pawn KilledPawn, class<DamageType> damageType);

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

defaultproperties
{
   bImplementsNavMeshGeneration=True
   Name="Default__BaseAISubsystem"
   ObjectArchetype=AISubsystem'Engine.Default__AISubsystem'
}
