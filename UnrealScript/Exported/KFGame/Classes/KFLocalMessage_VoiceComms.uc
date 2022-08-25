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
	VCT_THANK_YOU,
	VCT_NONE,
	VCT_MAX,
};

var localized array<string> VoiceCommsOptionStrings;
var array<Texture2D> VoiceCommsIcons;

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
		KFPlayerReplicationInfo(RelatedPRI_1).SetCurrentVoiceCommsRequest(Switch);
		return RelatedPRI_1.PlayerName $":"  @default.VoiceCommsOptionStrings[Switch];
	}
}

// Returns a hex color code for the supplied message type
static function string GetHexColor(int Switch)
{
    return default.DefaultColor;
}

defaultproperties
{
   VoiceCommsOptionStrings(0)="REQUEST HEALING"
   VoiceCommsOptionStrings(1)="REQUEST DOSH"
   VoiceCommsOptionStrings(2)="REQUEST HELP"
   VoiceCommsOptionStrings(3)="TAUNT ZEDS"
   VoiceCommsOptionStrings(4)="FOLLOW ME"
   VoiceCommsOptionStrings(5)="GET TO THE TRADER"
   VoiceCommsOptionStrings(6)="AFFIRMATIVE"
   VoiceCommsOptionStrings(7)="NEGATIVE"
   VoiceCommsOptionStrings(8)="EMOTE"
   VoiceCommsOptionStrings(9)="THANK YOU"
   VoiceCommsIcons(0)=Texture2D'UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Heal'
   VoiceCommsIcons(1)=Texture2D'UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Dosh'
   VoiceCommsIcons(2)=Texture2D'UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Help'
   VoiceCommsIcons(3)=Texture2D'UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Taunt'
   VoiceCommsIcons(4)=Texture2D'UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Follow'
   VoiceCommsIcons(5)=Texture2D'UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Trader'
   VoiceCommsIcons(6)=Texture2D'UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Affirmative'
   VoiceCommsIcons(7)=Texture2D'UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Negative'
   VoiceCommsIcons(8)=Texture2D'UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Emote'
   VoiceCommsIcons(9)=Texture2D'UI_VoiceComms_TEX.UI_VoiceCommand_Icon_ThankYou'
   Name="Default__KFLocalMessage_VoiceComms"
   ObjectArchetype=KFLocalMessage'KFGame.Default__KFLocalMessage'
}
