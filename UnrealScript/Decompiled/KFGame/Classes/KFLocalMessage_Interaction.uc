/*******************************************************************************
 * KFLocalMessage_Interaction generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFLocalMessage_Interaction extends KFLocalMessage;

enum EInteractionMessageType
{
    IMT_None,
    IMT_AcceptObjective,
    IMT_ReceiveAmmo,
    IMT_ReceiveGrenades,
    IMT_UseTrader,
    IMT_UseDoor,
    IMT_UseDoorWelded,
    IMT_RepairDoor,
    IMT_UseMinigame,
    IMT_UseMinigameGenerator,
    IMT_GamepadWeaponSelectHint,
    IMT_HealSelfWarning,
    IMT_ClotGrabWarning,
    IMT_PlayerClotGrabWarning,
    IMT_MAX
};

var const localized string UseTraderMessage;
var const localized string UseDoorMessage;
var const localized string EquipWelderMessage;
var const localized string RepairDoorMessage;
var const localized string AcceptObjectiveMessage;
var const localized string ReceiveAmmoMessage;
var const localized string ReceiveGrenadesMessage;
var const localized string HealSelfWarning;
var const localized string HealSelfGamepadWarning;
var const localized string PressToBashWarning;
var const localized string GamepadWeaponSelectHint;
var const localized string ZedUseDoorMessage;
var const localized string ZedUseDoorWeldedMessage;
var const localized string PlayerClotGrabWarningMessage;
var const localized string UseMinigameMessage;
var const localized string UseMinigameGeneratorMessage;
var const string USE_COMMAND;
var const string HEAL_COMMAND;
var const string HEAL_COMMAND_CONTROLLER;
var const string BASH_COMMAND;
var const string WEAPON_SELECT_CONTROLLER;

static function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local string MessageString;
    local KFGFxMoviePlayer_HUD GFxHud;

    if(KFGFxHudWrapper(P.myHUD) != none)
    {
        GFxHud = KFGFxHudWrapper(P.myHUD).HudMovie;
        if(GFxHud != none)
        {
            MessageString = GetString(Switch, RelatedPRI_1 == P.PlayerReplicationInfo, RelatedPRI_1, RelatedPRI_2, OptionalObject);
            GFxHud.DisplayInteractionMessage(MessageString, Switch, GetKeyBind(P, Switch), GetMessageDuration(Switch));
        }
    }
}

static function float GetMessageDuration(int Switch)
{
    switch(Switch)
    {
        case 10:
            return 2;
        default:
            return 0;
            break;
    }
}

static function string GetKeyBind(PlayerController P, optional int Switch)
{
    local KFPlayerInput KFInput;
    local KeyBind BoundKey;
    local string KeyString;

    KFInput = KFPlayerInput(P.PlayerInput);
    if(KFInput == none)
    {
        return "";
    }
    switch(Switch)
    {
        case 6:
            if(Class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController().PlayerReplicationInfo.GetTeamNum() == 255)
            {
                KeyString = "";
                break;
            }
        case 4:
        case 5:
        case 7:
        case 1:
        case 2:
        case 3:
            KFInput.GetKeyBindFromCommand(BoundKey, default.USE_COMMAND, false);
            KeyString = KFInput.GetBindDisplayName(BoundKey);
            break;
        case 11:
            if(KFInput.bUsingGamepad)
            {
                KFInput.GetKeyBindFromCommand(BoundKey, default.HEAL_COMMAND_CONTROLLER, false);                
            }
            else
            {
                KFInput.GetKeyBindFromCommand(BoundKey, default.HEAL_COMMAND, false);
            }
            KeyString = KFInput.GetBindDisplayName(BoundKey);
            break;
        case 12:
            KFInput.GetKeyBindFromCommand(BoundKey, default.BASH_COMMAND, false);
            KeyString = KFInput.GetBindDisplayName(BoundKey);
            break;
        case 10:
            KFInput.GetKeyBindFromCommand(BoundKey, default.WEAPON_SELECT_CONTROLLER, false);
            KeyString = KFInput.GetBindDisplayName(BoundKey);
            break;
        default:
            break;
    }
    return KeyString;
}

static function string GetString(optional int Switch, optional bool bPRI1HUD, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local PlayerInput Input;
    local KFGameReplicationInfo KFGRI;
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController());
    switch(Switch)
    {
        case 4:
            KFGRI = KFGameReplicationInfo(Class'WorldInfo'.static.GetWorldInfo().GRI);
            if(((KFGRI != none) && KFGRI.GameClass.Name == 'KFGameInfo_Tutorial') || (KFPC != none) && KFPC.bDisableAutoUpgrade)
            {
                return Left(default.UseTraderMessage, InStr(default.UseTraderMessage, "<%HOLD%>"));
            }
            return default.UseTraderMessage;
        case 5:
            if(Class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController().PlayerReplicationInfo.GetTeamNum() == 255)
            {
                return default.ZedUseDoorMessage;
            }
            return default.UseDoorMessage;
        case 6:
            if(Class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController().PlayerReplicationInfo.GetTeamNum() == 255)
            {
                return default.ZedUseDoorWeldedMessage;
            }
            return default.EquipWelderMessage;
        case 7:
            return default.RepairDoorMessage;
        case 1:
            return default.AcceptObjectiveMessage;
        case 2:
            return default.ReceiveAmmoMessage;
        case 3:
            return default.ReceiveGrenadesMessage;
        case 11:
            Input = Class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController().PlayerInput;
            return (((Input != none) && Input.bUsingGamepad) ? default.HealSelfGamepadWarning : default.HealSelfWarning);
        case 12:
            return default.PressToBashWarning;
        case 13:
            return default.PlayerClotGrabWarningMessage;
        case 10:
            return default.GamepadWeaponSelectHint;
        case 8:
            return default.UseMinigameMessage;
        case 9:
            return default.UseMinigameGeneratorMessage;
        default:
            return "";
            break;
    }
}

static function float GetPos(int Switch, HUD myHUD)
{
    return 0.8;
}

static function string GetHexColor(int Switch)
{
    return default.InteractionColor;
}

defaultproperties
{
    UseTraderMessage="USE TRADER<%HOLD%>AUTO-UPGRADE"
    UseDoorMessage="OPEN/CLOSE<%HOLD%>EQUIP WELDER"
    EquipWelderMessage="<%HOLD%>EQUIP WELDER"
    RepairDoorMessage="<%HOLD%>EQUIP WELDER TO FIX DOOR"
    AcceptObjectiveMessage="ACCEPT OBJECTIVE"
    ReceiveAmmoMessage="RECEIVE AMMO"
    ReceiveGrenadesMessage="RECEIVE GRENADES"
    HealSelfWarning="HEAL SELF"
    HealSelfGamepadWarning="<%HOLD%>HEAL SELF"
    PressToBashWarning="BASH"
    GamepadWeaponSelectHint="<%HOLD%>WEAPON SELECT"
    ZedUseDoorMessage="OPEN/CLOSE"
    ZedUseDoorWeldedMessage="DOOR WELDED, BREAK IT DOWN!"
    PlayerClotGrabWarningMessage="KILL ZED TO BREAK FREE!"
    UseMinigameMessage="ACTIVATE MINIGAME"
    UseMinigameGeneratorMessage="ACTIVATE GENERATOR"
    USE_COMMAND="GBA_Use"
    HEAL_COMMAND="GBA_QuickHeal"
    HEAL_COMMAND_CONTROLLER="GBA_Reload_Gamepad"
    BASH_COMMAND="GBA_TertiaryFire"
    WEAPON_SELECT_CONTROLLER="GBA_WeaponSelect_Gamepad"
    bIsUnique=true
    bIsConsoleMessage=false
    bBeep=true
    Lifetime=5
}