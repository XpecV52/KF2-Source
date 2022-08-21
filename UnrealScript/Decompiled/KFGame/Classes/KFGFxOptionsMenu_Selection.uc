/*******************************************************************************
 * KFGFxOptionsMenu_Selection generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxOptionsMenu_Selection extends KFGFxObject_Menu within GFxMoviePlayer;

enum OptionMenus
{
    OM_Video,
    OM_Audio,
    OM_Controls,
    OM_Gameplay,
    OM_Credits,
    OM_Max
};

var KFGFxControlsContainer_Keybinding KeybindingsContainer;
var KFGFxControlsContainer_Input InputContainer;
var const localized string HeaderString;
var const localized array<localized string> OptionStrings;

function InitializeMenu(KFGFxMoviePlayer_Manager InManager)
{
    local byte I;
    local GFxObject DataProvider, DataObject;
    local array<string> DisplayedOptions;
    local PlayerController PC;

    super.InitializeMenu(InManager);
    PC = Outer.GetPC();
    DataProvider = Outer.CreateArray();
    DataProvider.SetString("header", HeaderString);
    DisplayedOptions = OptionStrings;
    if((PC != none) && PC.WorldInfo != none)
    {
        if(PC.WorldInfo.IsConsoleBuild())
        {
            DisplayedOptions.Remove(0, 1;
            DisplayedOptions[0] = (OptionStrings[1] $ "/") $ OptionStrings[0];
        }
        if(!PC.WorldInfo.IsMenuLevel())
        {
            DisplayedOptions.Remove(DisplayedOptions.Length - 1, 1;
        }
    }
    I = 0;
    J0x1AB:

    if(I < DisplayedOptions.Length)
    {
        DataObject = Outer.CreateObject("Object");
        DataObject.SetString("label", DisplayedOptions[I]);
        DataProvider.SetElementObject(I, DataObject);
        ++ I;
        goto J0x1AB;
    }
    SetObject("buttonNames", DataProvider);
}

function Callback_MenuSelected(int MenuIndex)
{
    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        ++ MenuIndex;
    }
    switch(MenuIndex)
    {
        case 0:
            Manager.OpenMenu(9);
            break;
        case 1:
            Manager.OpenMenu(8);
            break;
        case 2:
            Manager.OpenMenu(7);
            break;
        case 3:
            Manager.OpenMenu(10);
            break;
        case 4:
            ActionScriptVoid("selectContainer");
            Class'KFGameEngine'.static.PlayFullScreenMovie("Credits");
            break;
        default:
            break;
    }
}

defaultproperties
{
    HeaderString="OPTIONS"
    OptionStrings(0)="Video"
    OptionStrings(1)="Audio"
    OptionStrings(2)="Controls"
    OptionStrings(3)="Gameplay"
    OptionStrings(4)="Credits"
    SubWidgetBindings=/* Array type was not detected. */
}