//=============================================================================
// KFGameStateObject
//=============================================================================
// Tracks game state while reading back stat files for transfer
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Implemented - Jonathan Howard 140904
// Created - Jonathan Howard 140715
//=============================================================================
class KFGameStateObject extends GameplayEventsHandler
	native(Analytics);

var transient int RoundNumber;
var transient int GameDifficulty;
var transient int GameLength;
var transient bool DidWin;

cpptext
{
	void InjectGameStateInfo(FString& json_Payload);

	virtual void HandleEvent(struct FGameEventHeader& GameEvent, class IGameEvent* GameEventData);
}

/** A chance to do something before the stream starts */
native event PreProcessStream();

/** A chance to do something after the stream end */
native event PostProcessStream();

/** Completely reset the game state object */
native function Reset();

defaultproperties
{
	DidWin=false
}
