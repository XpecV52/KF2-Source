/*******************************************************************************
 * KFGFxWidget_KickVote generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWidget_KickVote extends GFxObject within GFxMoviePlayer;

var const localized string VoteKickString;
var bool bIsVoteActive;
var const string GBA_VoteYes;
var const string GBA_VoteNo;

function InitializeHUD()
{
    LocalizeText();
}

function LocalizeText()
{
    local GFxObject TempObject;
    local KFPlayerInput KFInput;
    local KeyBind TempKeyBind;

    TempObject = Outer.CreateObject("Object");
    KFInput = KFPlayerInput(Outer.GetPC().PlayerInput);
    KFInput.GetKeyBindFromCommand(TempKeyBind, GBA_VoteYes);
    TempObject.SetString("yesKey", string(TempKeyBind.Name));
    KFInput.GetKeyBindFromCommand(TempKeyBind, GBA_VoteNo);
    TempObject.SetString("noKey", string(TempKeyBind.Name));
    TempObject.SetString("yes", Class'KFCommon_LocalizedStrings'.default.YesString);
    TempObject.SetString("no", Class'KFCommon_LocalizedStrings'.default.NoString);
    TempObject.SetString("voteKick", VoteKickString);
    SetObject("localizedText", TempObject);
}

function ShowKickVote(PlayerReplicationInfo PRI, byte VoteDuration, bool bShowChoices)
{
    if(PRI != none)
    {
        LocalizeText();
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
    UpdateUsingGamepad(Outer.GetPC().PlayerInput.bUsingGamepad);
}

function UpdateUsingGamepad(bool bIsUsingGamepad)
{
    SetBool("bUsingGamepad", bIsUsingGamepad);
    if(!bIsUsingGamepad)
    {
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

defaultproperties
{
    VoteKickString="Kick Player?"
    GBA_VoteYes="GBA_VoteYes"
    GBA_VoteNo="GBA_VoteNo"
}