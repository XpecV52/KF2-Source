/*******************************************************************************
 * KFGFxMoviePlayer_ScreenSize generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxMoviePlayer_ScreenSize extends GFxMoviePlayer
    config(UI);

const KFID_QuickWeaponSelect = 100;
const KFID_CurrentLayoutIndex = 101;
const KFID_ForceFeedbackEnabled = 103;
const KFID_SavedPerkIndex = 105;
const KFID_AllowBloodSplatterDecals = 106;
const KFID_GoreLevel = 107;
const KFID_StoredCharIndex = 111;
const KFID_MasterVolumeMultiplier = 112;
const KFID_DialogVolumeMultiplier = 113;
const KFID_MusicVolumeMultiplier = 114;
const KFID_SFXVolumeMultiplier = 115;
const KFID_GammaMultiplier = 117;
const KFID_MusicVocalsEnabled = 118;
const KFID_MinimalChatter = 119;
const KFID_ShowCrossHair = 121;
const KFID_FOVOptionsPercentageValue = 122;
const KFID_ShowKillTicker = 123;
const KFID_FriendlyHudScale = 125;
const KFID_FavoriteWeapons = 127;
const KFID_GearLoadouts = 128;
const KFID_SetGamma = 129;
const KFID_RequiresPushToTalk = 130;
const KFID_InvertController = 131;
const KFID_AutoTargetEnabled = 132;
const KFID_GamepadSensitivityScale = 133;
const KFID_ZoomedSensitivityScale = 134;
const KFID_GamepadZoomedSensitivityScale = 135;
const KFID_EnableMouseSmoothing = 136;
const KFID_MouseSensitivity = 138;
const KFID_TargetAdhesionEnabled = 139;
const KFID_TargetFrictionEnabled = 140;
const KFID_InvertMouse = 142;
const KFID_DEPRECATED_143 = 143;
const KFID_SavedSoloModeIndex = 144;
const KFID_SavedSoloMapString = 145;
const KFID_SavedSoloDifficultyIndex = 146;
const KFID_SavedSoloLengthIndex = 147;
const KFID_SavedModeIndex = 148;
const KFID_SavedMapString = 149;
const KFID_SavedDifficultyIndex = 150;
const KFID_SavedLengthIndex = 151;
const KFID_SavedPrivacyIndex = 152;
const KFID_SavedServerTypeIndex = 153;
const KFID_SavedInProgressIndex = 154;
const KFID_ControllerSoundEnabled = 155;
const KFID_MatchmakingRegion = 156;
const KFID_UseAltAimOnDuals = 157;
const KFID_HideBossHealthBar = 158;
const KFID_AntiMotionSickness = 159;
const KFID_ShowWelderInInventory = 160;
const KFID_AutoTurnOff = 161;
const KFID_ReduceHightPitchSounds = 162;
const KFID_ShowConsoleCrossHair = 163;
const KFID_VOIPVolumeMultiplier = 164;
const KFID_WeaponSkinAssociations = 165;
const KFID_SavedEmoteId = 166;
const KFID_DisableAutoUpgrade = 167;
const KFID_SafeFrameScale = 168;

var name SoundThemeName;
var bool bUsingGamepad;
var GFxObject ManagerObject;
var KFGFxMoviePlayer_Manager GFxMenuManager;
var KFPlayerController KFPC;
var const float AdjustMovePercentage;
var const float SafeFrameMinScale;
var KFGameEngine KFEngine;
var KFProfileSettings Profile;
var KFGFxScreenSizeContainer ScreenSizeContainer;

function Init(optional LocalPlayer LocPlay)
{
    super.Init(LocPlay);
    KFPC = KFPlayerController(GetPC());
    GFxMenuManager = KFPC.MyGFxManager;
    KFEngine = KFGameEngine(Class'Engine'.static.GetEngine());
    Profile = GFxMenuManager.CachedProfile;
}

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
    local bool bHandled;

    LogInternal("widgetname: " @ string(WidgetName));
    bHandled = true;
    switch(WidgetName)
    {
        case 'root1':
            if(ManagerObject == none)
            {
                ManagerObject = Widget;
                if(Class'WorldInfo'.static.IsConsoleBuild())
                {
                    ManagerObject.SetBool("bUsingGamepad", true);
                }
            }
            break;
        case 'screenSizePopup':
            if(ScreenSizeContainer == none)
            {
                ScreenSizeContainer = KFGFxScreenSizeContainer(Widget);
                ScreenSizeContainer.InitMenu();
            }
            break;
        default:
            bHandled = false;
            break;
    }
    return bHandled;
}

event bool FilterButtonInput(int ControllerId, name ButtonName, Core.Object.EInputEvent InputEvent)
{
    if(!Class'WorldInfo'.static.IsConsoleBuild())
    {
        CheckIfUsingGamepad();
    }
    return false;
}

function CheckIfUsingGamepad()
{
    local bool bGamepad;

    bGamepad = GetUsingGamepad();
    if(bUsingGamepad != bGamepad)
    {
        OnInputTypeChanged(bGamepad);
    }
}

function OnInputTypeChanged(bool bGamepad)
{
    bUsingGamepad = bGamepad;
    if(ManagerObject != none)
    {
        ManagerObject.SetBool("bUsingGamepad", bGamepad);
    }
}

function bool GetUsingGamepad()
{
    local PlayerController PC;

    PC = GetPC();
    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        return true;
    }
    if((PC == none) || PC.PlayerInput == none)
    {
        return false;
    }
    return PC.PlayerInput.bUsingGamepad;
}

function NotifyControllerDisconnected()
{
    SetVisibility(false);
    SetPriority(1);
    GFxMenuManager.SetPriority(2);
}

function NotifyControllerReconnected()
{
    SetVisibility(true);
    SetPriority(2);
    GFxMenuManager.SetPriority(1);
}

function Callback_Enlarge()
{
    KFEngine.SafeFrameScale += AdjustMovePercentage;
    KFEngine.SafeFrameScale = FClamp(KFEngine.SafeFrameScale, SafeFrameMinScale, 1);
}

function Callback_Shrink()
{
    KFEngine.SafeFrameScale -= AdjustMovePercentage;
    KFEngine.SafeFrameScale = FClamp(KFEngine.SafeFrameScale, SafeFrameMinScale, 1);
}

function Callback_Confirm()
{
    SaveAndClose();
}

function Callback_Cancel();

function SaveAndClose()
{
    Profile.SetProfileSettingValueFloat(168, KFEngine.SafeFrameScale);
    Profile.Save(byte(GetLP().ControllerId));
    GFxMenuManager.CloseScreenSizeMovie();
}

defaultproperties
{
    SoundThemeName=ButtonSoundTheme
    AdjustMovePercentage=0.005
    SafeFrameMinScale=0.85
    MovieInfo=SwfMovie'UI_ScreenSize.ScreenSizeManager_SWF'
    bAutoPlay=true
    bCaptureInput=true
    bCaptureMouseInput=true
    CaptureKeys=/* Array type was not detected. */
    SoundThemes=/* Array type was not detected. */
    WidgetBindings=/* Array type was not detected. */
}