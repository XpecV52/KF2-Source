/*******************************************************************************
 * KFGFxScreenSizeContainer generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxScreenSizeContainer extends KFGFxObject_Menu within GFxMoviePlayer;

var const localized string TitleString;
var const localized string DescriptionString;
var const localized string EnlargeString;
var const localized string ShrinkString;
var KFPlayerInput KFPI;

function InitMenu()
{
    KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
    LocalizeText();
    if(Outer.GetPC().WorldInfo.IsConsoleBuild())
    {
        UpdateUsingGamePad(true);        
    }
    else
    {
        if(KFPI != none)
        {
            UpdateUsingGamePad(KFPI.bUsingGamepad);
        }
    }
    LocalizeText();
}

function UpdateUsingGamePad(bool bValue)
{
    SetBool("bUsingGamepad", bValue);
}

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("title", TitleString);
    LocalizedObject.SetString("description", DescriptionString);
    LocalizedObject.SetString("enlarge", EnlargeString);
    LocalizedObject.SetString("shrink", ShrinkString);
    LocalizedObject.SetString("confirm", Class'KFCommon_LocalizedStrings'.default.ConfirmString);
    LocalizedObject.SetString("cancel", Class'KFCommon_LocalizedStrings'.default.CancelString);
    SetObject("localizedText", LocalizedObject);
}

defaultproperties
{
    TitleString="Application will be displayed in the boxed area"
    DescriptionString="Adjust the area to fit the TV display"
    EnlargeString="Enlarge"
    ShrinkString="Shrink"
}