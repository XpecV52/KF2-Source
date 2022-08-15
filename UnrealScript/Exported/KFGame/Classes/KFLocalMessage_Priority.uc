//=============================================================================
// KFLocalMessage_Priority
//=============================================================================
// Killing Floor 2
//
// Base class for important message that renders to the center of the player's HUD
//
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFLocalMessage_Priority extends KFLocalMessage;

var localized string			WaveStartMessage;
var localized string			WaveEndMessage;
var localized string            GetToTraderMessage;
var localized string            YouLostMessage;
var localized string            YouWonMessage;
var localized string            SquadWipedOutMessage;
var localized string            SquadSurvivedMessage;
var localized string            ObjectiveStartMessage;
var localized string            ObjectiveWonMessage;
var localized string            ObjectiveLostMessage;
var localized string            ObjectiveEndedMessage;
var localized string            ObjNotEnoughPlayersMessage;
var localized string            ObjTimeRanOutMessage;

enum EGameMessageType
{
	GMT_WaveStart,
	GMT_WaveEnd,
	GMT_MatchWon,
	GMT_MatchLost,
	GMT_ObjectiveStart,
	GMT_ObjectiveWon,
	GMT_ObjectiveLost,
	GMT_ObjEndPlayerNeeded,
	GMT_ObjEndTimeLimit,
	GMT_LevelUp,
	GMT_TierUnlocked,
	GMT_Died
};

static function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local string MessageString,SecondaryMessageString;
	local KFGFxMoviePlayer_HUD myGfxHUD;
	local KFGameReplicationInfo KFGRI;

	MessageString = static.GetMessageString(Switch,SecondaryMessageString);
	if ( MessageString != "" && KFGFxHudWrapper(p.myHUD) != none)
	{
	    myGfxHUD = KFGFxHudWrapper(p.myHUD).HudMovie;
		if ( myGfxHUD != None )
		{
            myGfxHUD.DisplayPriorityMessage(MessageString,SecondaryMessageString,static.GetMessageLifeTime(Switch) );
		}
	}

	switch( Switch )
	{
	case GMT_WaveStart:
		class'KFMusicStingerHelper'.static.PlayWaveStartStinger( P );
		break;
	case GMT_WaveEnd:
		class'KFMusicStingerHelper'.static.PlayWaveCompletedStinger( P );
		break;

	case GMT_MatchWon:
		KFGRI = KFGameReplicationInfo(P.WorldInfo.GRI);
		if(KFGRI != none)
		{
			KFGRI.bMatchVictory = true;
		}
		class'KFMusicStingerHelper'.static.PlayMatchWonStinger( P );
		break;

	case GMT_MatchLost:
		class'KFMusicStingerHelper'.static.PlayMatchLostStinger( P );
		break;

	// make sure only local player
	case GMT_LevelUp:
		class'KFMusicStingerHelper'.static.PlayLevelUpStinger( P );
		break;

	// make sure only local player
	case GMT_TierUnlocked:
		class'KFMusicStingerHelper'.static.PlayTierUnlockedStinger( P );
		break;

	case GMT_ObjectiveWon:
		class'KFMusicStingerHelper'.static.PlayObjectiveWonStinger( P );
		break;

	case GMT_ObjectiveLost:
		class'KFMusicStingerHelper'.static.PlayObjectiveLostStinger( P );
		break;

	// make sure only local player
	case GMT_Died:
		class'KFMusicStingerHelper'.static.PlayPlayerDiedStinger( P );
		break;
	};
}

static function string GetMessageString(int Switch, optional out String SecondaryString)
{
	switch ( Switch )
	{
		case GMT_WaveStart:
			return default.WaveStartMessage;
		case GMT_WaveEnd:
		    SecondaryString = default.GetToTraderMessage;
			return default.WaveEndMessage;
		case GMT_MatchWon:
		     SecondaryString = default.SquadSurvivedMessage;
			return default.YouWonMessage;
		case GMT_MatchLost:
		    SecondaryString = default.SquadWipedOutMessage;
			return default.YouLostMessage;
		case GMT_ObjectiveStart:
			return default.ObjectiveStartMessage;
		case GMT_ObjectiveWon:
			return default.ObjectiveWonMessage;
		case GMT_ObjectiveLost:
			return default.ObjectiveLostMessage;
		case GMT_ObjEndPlayerNeeded:
			SecondaryString = default.ObjNotEnoughPlayersMessage;
			return default.ObjectiveEndedMessage;
		case GMT_ObjEndTimeLimit:
			SecondaryString = default.ObjTimeRanOutMessage;
			return default.ObjectiveLostMessage;
		case GMT_LevelUp:
			SecondaryString =""; //TODO: Remove this hard coded test message when we add the pop up in. ZG
			return "";
		case GMT_TierUnlocked:
			SecondaryString =""; //TODO: Remove this hard coded test message when we add the pop up in. ZG
			return "";
		default:
			return "";
	}
}

static function float GetMessageLifeTime(int Switch)
{
	switch ( Switch )
	{
	 	case GMT_WaveStart:
	 	     return 5.f;
	    case GMT_WaveEnd:
	 		 return 4.f;
	 	case GMT_ObjectiveStart:
	 	case GMT_ObjectiveWon:
	 	case GMT_ObjectiveLost:
	 		return 3.f;
 		case GMT_LevelUp:
 		case GMT_TierUnlocked:
 		return 0.01f;
	 	case GMT_MatchWon:
		case GMT_MatchLost:
			return 0.f;
	}

    return default.LifeTime;
}

defaultproperties
{
   WaveStartMessage="W A V E  I N C O M I N G"
   WaveEndMessage="W A V E  C O M P L E T E"
   GetToTraderMessage="Get to the Trader Pod"
   YouLostMessage="D E F E A T"
   YouWonMessage="V I C T O R Y"
   SquadWipedOutMessage="Your squad was wiped out"
   SquadSurvivedMessage="Your squad survived"
   ObjectiveStartMessage="Objective Started!"
   ObjectiveWonMessage="Objective Won!"
   ObjectiveLostMessage="Objective Lost!"
   ObjectiveEndedMessage="Objective Ended!"
   ObjNotEnoughPlayersMessage="Not Enough Players!"
   ObjTimeRanOutMessage="Time Limit Reached!"
   Name="Default__KFLocalMessage_Priority"
   ObjectArchetype=KFLocalMessage'KFGame.Default__KFLocalMessage'
}
