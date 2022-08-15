//=============================================================================
// KFGFxWidget_KickVote
//=============================================================================
// HUD Widget that displays when a kick vote has started
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 07/07/2014
//=============================================================================

class KFGFxWidget_KickVote extends GFxObject;

var localized string VoteKickString;
var bool bIsVoteActive;

var const string GBA_VoteYes;
var const string GBA_VoteNo;

function InitializeHUD()
{
    LocalizeText();
    UpdateUsingGamepad(GetPC().PlayerInput.bUsingGamepad);
}

function LocalizeText()
{
	local GFxObject TempObject;
	local KFPlayerInput KFInput;
	local KeyBind TempKeyBind;

	TempObject = CreateObject("Object");

	KFInput =  KFPlayerInput(GetPC().PlayerInput);

	KFInput.GetKeyBindFromCommand(TempKeyBind, GBA_VoteYes);
	TempObject.SetString("yesKey", String(TempKeyBind.Name));

	KFInput.GetKeyBindFromCommand(TempKeyBind, GBA_VoteNo);
	TempObject.SetString("noKey", String(TempKeyBind.Name));

    TempObject.SetString("yes", Class'KFCommon_LocalizedStrings'.default.YesString);
    TempObject.SetString("no", Class'KFCommon_LocalizedStrings'.default.NoString);
    TempObject.SetString("voteKick", VoteKickString);

    SetObject("localizedText", TempObject);
}

function ShowKickVote(PlayerReplicationInfo PRI, byte VoteDuration, bool bShowChoices)
{
	if(PRI != none)
	{
		LocalizeText(); //Added this here if the user changes their keybind, it will update
		bIsVoteActive = true;
		SendVoteKickToAS3(PRI.PlayerName, VoteDuration, bShowChoices);
	}
	else
	{
		bIsVoteActive = false;
	}
}

function SendVoteKickToAS3(string PlayerName, byte VoteDuration, bool bShowChoices)
{
	ActionScriptVoid("voteKick");
}

function UpdateUsingGamepad(bool bIsUsingGamepad)
{
    SetBool("bUsingGamepad", bIsUsingGamepad);
    if(!bIsUsingGamepad)
	{
		//the gamepad text will show on the input so we need to change it back to keyboard, it is simpler to just relocalize 
		LocalizeText();
	}
}

function UpdateKickVoteCount(byte YesVotes, byte NoVotes)
{
	ActionScriptVoid("updateKickVoteCount");
}

function VoteClosed()
{
	bIsVoteActive = false;
	SetVisible(false);
}

function OnYesPressed()
{
	if(bIsVoteActive)
	{
		ActionScriptVoid("onYesPressed");
	}
}

function OnYesReleased()
{
	if(bIsVoteActive)
	{
		ActionScriptVoid("onYesReleased");
	}
}

function OnNoPressed()
{
	if(bIsVoteActive)
	{
		ActionScriptVoid("onNoPressed");
	}
}

function OnNoReleased()
{
	if(bIsVoteActive)
	{
		ActionScriptVoid("onNoReleased");
	}
}

DefaultProperties
{
	//defaults
	GBA_VoteYes="GBA_VoteYes"
	GBA_VoteNo="GBA_VoteNo"
}