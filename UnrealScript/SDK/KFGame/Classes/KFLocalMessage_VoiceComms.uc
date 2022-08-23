//=============================================================================
// KFLocalMessage_VoiceComms
//=============================================================================
// Message class for world interaction messages
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFLocalMessage_VoiceComms extends KFLocalMessage;

enum EVoiceCommsType
{
	VCT_REQUEST_HEALING,
	VCT_REQUEST_DOSH,
	VCT_REQUEST_HELP,
	VCT_TAUNT_ZEDS,
	VCT_FOLLOW_ME,
	VCT_GET_TO_THE_TRADER,
	VCT_AFFIRMATIVE,
	VCT_NEGATIVE,
	VCT_EMOTE,
	VCT_MAX,
};

var localized array<string> VoiceCommsOptionStrings;

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	if(Switch < default.VoiceCommsOptionStrings.length)
	{
		return RelatedPRI_1.PlayerName $":"  @default.VoiceCommsOptionStrings[Switch];
	}
}

// Returns a hex color code for the supplied message type
static function string GetHexColor(int Switch)
{
    return default.DefaultColor;
}

