/*******************************************************************************
 * KFGamepadLayoutManager generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGamepadLayoutManager extends Object
    abstract
    native;

const NUM_OVERRIDDEN_BUTTONS = 12;
const NUM_LAYOUTS = 4;
const NUM_CONTROLLER_BINDINGS = 20;

enum EGamepadLayoutType
{
    LAYOUT_Default,
    LAYOUT_JUMPER,
    LAYOUT_QUICKDRAW,
    LAYOUT_SOUTHPAW,
    LAYOUT_MAX
};

struct native GamepadButtonCommand
{
    var name Name;
    var string Command;

    structdefaultproperties
    {
        Name=None
        Command=""
    }
};

struct native GamepadLayout
{
    var string DisplayName;
    var GamepadButtonCommand ButtonCommands[12];

    structdefaultproperties
    {
        DisplayName=""
        ButtonCommands[0]=(Name=None,Command="")
        ButtonCommands[1]=(Name=None,Command="")
        ButtonCommands[2]=(Name=None,Command="")
        ButtonCommands[3]=(Name=None,Command="")
        ButtonCommands[4]=(Name=None,Command="")
        ButtonCommands[5]=(Name=None,Command="")
        ButtonCommands[6]=(Name=None,Command="")
        ButtonCommands[7]=(Name=None,Command="")
        ButtonCommands[8]=(Name=None,Command="")
        ButtonCommands[9]=(Name=None,Command="")
        ButtonCommands[10]=(Name=None,Command="")
        ButtonCommands[11]=(Name=None,Command="")
    }
};

var private GamepadLayout GamepadLayouts[4];
var private name GamepadButtonNames[20];

// Export UKFGamepadLayoutManager::execGetGamepadLayout(FFrame&, void* const)
native static function GetGamepadLayout(KFGamepadLayoutManager.EGamepadLayoutType GamepadLayoutType, out GamepadLayout Layout);

// Export UKFGamepadLayoutManager::execGetGamepadButtonNames(FFrame&, void* const)
native static function GetGamepadButtonNames(out name Names[20]);

// Export UKFGamepadLayoutManager::execGetLayoutName(FFrame&, void* const)
native static function string GetLayoutName(int Index);

// Export UKFGamepadLayoutManager::execGetNumLayouts(FFrame&, void* const)
native static function int GetNumLayouts();

defaultproperties
{
    GamepadLayouts[0]=(DisplayName="",ButtonCommands=(Name=XboxTypeS_A,Command="GBA_Jump | OnVoteYesPressed | OnRelease OnVoteYesRelease"),ButtonCommands[1]=(Name=XboxTypeS_Y,Command="GBA_WeaponSelect_Gamepad"),ButtonCommands[2]=(Name=XboxTypeS_LeftX,Command="GBA_StrafeLeft_Gamepad"),ButtonCommands[3]=(Name=XboxTypeS_LeftY,Command="GBA_MoveForward_Gamepad"),ButtonCommands[4]=(Name=XboxTypeS_LeftThumbStick,Command="GBA_SprintAndCrouch"),ButtonCommands[5]=(Name=XboxTypeS_RightX,Command="GBA_TurnLeft_Gamepad"),ButtonCommands[6]=(Name=XboxTypeS_RightY,Command="GBA_Look_Gamepad"),ButtonCommands[7]=(Name=XboxTypeS_RightThumbStick,Command="GBA_TertiaryFire"),ButtonCommands[8]=(Name=XboxTypeS_LeftShoulder,Command="GBA_Grenade_Gamepad"),ButtonCommands[9]=(Name=XboxTypeS_RightShoulder,Command="GBA_AltFire"),ButtonCommands[10]=(Name=XboxTypeS_LeftTrigger,Command="GBA_IronsightsHold"),ButtonCommands[11]=(Name=XboxTypeS_RightTrigger,Command="GBA_Fire"))
    GamepadLayouts[1]=(DisplayName="",ButtonCommands=(Name=XboxTypeS_A,Command="GBA_TertiaryFire | OnVoteYesPressed | OnRelease OnVoteYesRelease"),ButtonCommands[1]=(Name=XboxTypeS_Y,Command="GBA_WeaponSelect_Gamepad"),ButtonCommands[2]=(Name=XboxTypeS_LeftX,Command="GBA_StrafeLeft_Gamepad"),ButtonCommands[3]=(Name=XboxTypeS_LeftY,Command="GBA_MoveForward_Gamepad"),ButtonCommands[4]=(Name=XboxTypeS_LeftThumbStick,Command="GBA_SprintAndCrouch"),ButtonCommands[5]=(Name=XboxTypeS_RightX,Command="GBA_TurnLeft_Gamepad"),ButtonCommands[6]=(Name=XboxTypeS_RightY,Command="GBA_Look_Gamepad"),ButtonCommands[7]=(Name=XboxTypeS_RightThumbStick,Command="GBA_Grenade_Gamepad"),ButtonCommands[8]=(Name=XboxTypeS_LeftShoulder,Command="GBA_Jump"),ButtonCommands[9]=(Name=XboxTypeS_RightShoulder,Command="GBA_AltFire"),ButtonCommands[10]=(Name=XboxTypeS_LeftTrigger,Command="GBA_IronsightsHold"),ButtonCommands[11]=(Name=XboxTypeS_RightTrigger,Command="GBA_Fire"))
    GamepadLayouts[2]=(DisplayName="",ButtonCommands=(Name=XboxTypeS_A,Command="GBA_Jump | OnVoteYesPressed | OnRelease OnVoteYesRelease"),ButtonCommands[1]=(Name=XboxTypeS_Y,Command="GBA_TertiaryFire"),ButtonCommands[2]=(Name=XboxTypeS_LeftX,Command="GBA_StrafeLeft_Gamepad"),ButtonCommands[3]=(Name=XboxTypeS_LeftY,Command="GBA_MoveForward_Gamepad"),ButtonCommands[4]=(Name=XboxTypeS_LeftThumbStick,Command="GBA_SprintAndCrouch"),ButtonCommands[5]=(Name=XboxTypeS_RightX,Command="GBA_TurnLeft_Gamepad"),ButtonCommands[6]=(Name=XboxTypeS_RightY,Command="GBA_Look_Gamepad"),ButtonCommands[7]=(Name=XboxTypeS_RightThumbStick,Command="GBA_Grenade_Gamepad"),ButtonCommands[8]=(Name=XboxTypeS_LeftShoulder,Command="GBA_WeaponSelect_Gamepad"),ButtonCommands[9]=(Name=XboxTypeS_RightShoulder,Command="GBA_AltFire"),ButtonCommands[10]=(Name=XboxTypeS_LeftTrigger,Command="GBA_IronsightsHold"),ButtonCommands[11]=(Name=XboxTypeS_RightTrigger,Command="GBA_Fire"))
    GamepadLayouts[3]=(DisplayName="",ButtonCommands=(Name=XboxTypeS_A,Command="GBA_Jump | OnVoteYesPressed | OnRelease OnVoteYesRelease"),ButtonCommands[1]=(Name=XboxTypeS_Y,Command="GBA_WeaponSelect_Gamepad"),ButtonCommands[2]=(Name=XboxTypeS_LeftX,Command="GBA_TurnLeft_Gamepad"),ButtonCommands[3]=(Name=XboxTypeS_LeftY,Command="GBA_Look_GamepadSouthpaw"),ButtonCommands[4]=(Name=XboxTypeS_LeftThumbStick,Command="GBA_TertiaryFire"),ButtonCommands[5]=(Name=XboxTypeS_RightX,Command="GBA_StrafeLeft_Gamepad"),ButtonCommands[6]=(Name=XboxTypeS_RightY,Command="GBA_MoveForward_GamepadSouthpaw"),ButtonCommands[7]=(Name=XboxTypeS_RightThumbStick,Command="GBA_SprintAndCrouch"),ButtonCommands[8]=(Name=XboxTypeS_LeftShoulder,Command="GBA_AltFire"),ButtonCommands[9]=(Name=XboxTypeS_RightShoulder,Command="GBA_Grenade_Gamepad"),ButtonCommands[10]=(Name=XboxTypeS_LeftTrigger,Command="GBA_Fire"),ButtonCommands[11]=(Name=XboxTypeS_RightTrigger,Command="GBA_IronsightsHold"))
    GamepadButtonNames[0]=XboxTypeS_A
    GamepadButtonNames[1]=XboxTypeS_B
    GamepadButtonNames[2]=XboxTypeS_Y
    GamepadButtonNames[3]=XboxTypeS_X
    GamepadButtonNames[4]=XboxTypeS_LeftX
    GamepadButtonNames[5]=XboxTypeS_LeftY
    GamepadButtonNames[6]=XboxTypeS_LeftThumbStick
    GamepadButtonNames[7]=XboxTypeS_RightX
    GamepadButtonNames[8]=XboxTypeS_RightY
    GamepadButtonNames[9]=XboxTypeS_RightThumbStick
    GamepadButtonNames[10]=XboxTypeS_LeftShoulder
    GamepadButtonNames[11]=XboxTypeS_RightShoulder
    GamepadButtonNames[12]=XboxTypeS_LeftTrigger
    GamepadButtonNames[13]=XboxTypeS_RightTrigger
    GamepadButtonNames[14]=XboxTypeS_DPad_Left
    GamepadButtonNames[15]=XboxTypeS_DPad_Right
    GamepadButtonNames[16]=XboxTypeS_DPad_Down
    GamepadButtonNames[17]=XboxTypeS_DPad_Up
    GamepadButtonNames[18]=XboxTypeS_Back
    GamepadButtonNames[19]=XboxTypeS_Start
}