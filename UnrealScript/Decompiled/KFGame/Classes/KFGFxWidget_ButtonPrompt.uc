/*******************************************************************************
 * KFGFxWidget_ButtonPrompt generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWidget_ButtonPrompt extends KFGFxObject_Menu within GFxMoviePlayer;

var const localized string CancelString;
var const localized string ConfirmString;

function InitializeMenu(KFGFxMoviePlayer_Manager InManager)
{
    super.InitializeMenu(InManager);
    LocalizeWidget();
}

function LocalizeWidget()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("cancel", CancelString);
    LocalizedObject.SetString("confirm", ConfirmString);
    LocalizedObject.SetString("reset", Localize("KFGFxOptionsMenu_Graphics", "DefaultString", "KFGame"));
    SetObject("localizedText", LocalizedObject);
}

defaultproperties
{
    CancelString="BACK"
    ConfirmString="SELECT"
}