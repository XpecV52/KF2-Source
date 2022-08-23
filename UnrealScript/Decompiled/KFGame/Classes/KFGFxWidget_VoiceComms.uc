/*******************************************************************************
 * KFGFxWidget_VoiceComms generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWidget_VoiceComms extends GFxObject within GFxMoviePlayer;

var private bool bPlayedVoiceComm;
var bool bActive;
var Vector RawJoyVector;
var PlayerController PC;
var array<string> IconPaths;
var const float MouseDampening;
var const float ControllerDampening;
var private int SavedSelectionIndex;
var private float DeselectTime;

function InitializeHUD()
{
    SetLocalizedText();
    PC = Outer.GetPC();
}

function SetLocalizedText()
{
    local GFxObject DataProvider, TempObj;
    local byte I;

    DataProvider = Outer.CreateArray();
    I = 0;
    J0x35:

    if(I < Class'KFLocalMessage_VoiceComms'.default.VoiceCommsOptionStrings.Length)
    {
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("text", Class'KFLocalMessage_VoiceComms'.default.VoiceCommsOptionStrings[I]);
        TempObj.SetString("iconPath", "img://" $ IconPaths[I]);
        DataProvider.SetElementObject(I, TempObj);
        ++ I;
        goto J0x35;
    }
    SetObject("textOptions", DataProvider);
}

function SaveVoiceCommSelection(int CommsIndex)
{
    if(CommsIndex >= 0)
    {
        SavedSelectionIndex = CommsIndex;        
    }
    else
    {
        DeselectTime = PC.WorldInfo.RealTimeSeconds;
    }
}

function EnableComm()
{
    DeselectTime = 0;
    bPlayedVoiceComm = false;
    SavedSelectionIndex = -1;
    if(!PC.IsDead() && PC.Pawn != none)
    {
        bActive = true;
        if(PC.IsTimerActive('HandleInputChange', self))
        {
            PC.ClearTimer('HandleInputChange', self);
            PC.IgnoreLookInput(false);
        }
        PC.IgnoreLookInput(true);
        Outer.GetGameViewportClient().__HandleInputAxis__Delegate = OnAxisModified;
        SetBool("bUsingGamePad", PC.PlayerInput.bUsingGamepad);
        ActionScriptVoid("enableComm");
    }
}

function DisableComm()
{
    if(bActive)
    {
        bActive = false;
        if(!PC.PlayerInput.bUsingGamepad)
        {
            PC.IgnoreLookInput(false);            
        }
        else
        {
            PC.SetTimer(0.25, false, 'HandleInputChange', self);
        }
        Outer.GetGameViewportClient().__HandleInputAxis__Delegate = None;
        ActionScriptVoid("disableComm");
        if(((!bPlayedVoiceComm && SavedSelectionIndex >= 0) && DeselectTime > 0) && (PC.WorldInfo.RealTimeSeconds - DeselectTime) <= 0.15)
        {
            SayVoiceCommms(SavedSelectionIndex);
        }
    }
}

function HandleInputChange()
{
    PC.IgnoreLookInput(false);
}

function SayVoiceCommms(int CommsIndex)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(PC);
    if(KFPC == none)
    {
        return;
    }
    if(CommsIndex == 8)
    {
        KFPC.DoEmote();
        return;
    }
    KFPlayerController(PC).ServerPlayVoiceCommsDialog(CommsIndex);
    bPlayedVoiceComm = true;
}

function bool OnAxisModified(int ControllerId, name Key, float Delta, float DeltaTime, bool bGamepad)
{
    local Vector MouseVector;

    if(PC.PlayerInput.bUsingGamepad)
    {
        UpdateJoystickDirection(Key, Delta);
        UpdateUICursorPosition(RawJoyVector.X, RawJoyVector.Y, false);        
    }
    else
    {
        if(Key == 'MouseX')
        {
            MouseVector.X = Delta;            
        }
        else
        {
            if(Key == 'MouseY')
            {
                MouseVector.Y = Delta;
            }
        }
        UpdateUICursorPosition(MouseVector.X * MouseDampening, -MouseVector.Y * MouseDampening, true);
    }
    return false;
}

function UpdateJoystickDirection(name Key, float Delta)
{
    if(Key == 'XboxTypeS_RightX')
    {
        RawJoyVector.X = Delta;
    }
    if(Key == 'XboxTypeS_RightY')
    {
        RawJoyVector.Y = Delta;
    }
}

function UpdateUICursorPosition(float newX, float newY, bool bMouseInput)
{
    ActionScriptVoid("setNormalizedMousePosition");
}

defaultproperties
{
    IconPaths(0)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Heal"
    IconPaths(1)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Dosh"
    IconPaths(2)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Help"
    IconPaths(3)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Taunt"
    IconPaths(4)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Follow"
    IconPaths(5)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Trader"
    IconPaths(6)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Affirmative"
    IconPaths(7)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Negative"
    IconPaths(8)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Emote"
    MouseDampening=0.2
    ControllerDampening=2.5
}