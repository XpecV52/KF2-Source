/*******************************************************************************
 * KFGFxObject_Popup generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxObject_Popup extends GFxObject within GFxMoviePlayer;

var KFGFxMoviePlayer_Manager Manager;
var delegate<LeftButtonPress> __LeftButtonPress__Delegate;
var delegate<MiddleButtonPress> __MiddleButtonPress__Delegate;
var delegate<RightButtonPress> __RightButtonPress__Delegate;

function Callback_ClosedPopup()
{
    ClosePopUp();
}

function ClosePopUp()
{
    ClearDelegates();
    Manager.UnloadCurrentPopup();
}

delegate LeftButtonPress();

delegate MiddleButtonPress();

delegate RightButtonPress();

function AssignLeftButtonDelegate(delegate<LeftButtonPress> LeftDelegate);

function AssignMiddleButtonDelegate(delegate<MiddleButtonPress> MiddleDelegate);

function AssignRightButtonDelegate(delegate<RightButtonPress> RightDelegate);

function ClearDelegates();

function UpdateDescritionText(string newDescription)
{
    SetString("descriptionText", newDescription);
}

function OnClosed()
{
    if(Manager.CurrentMenu != none)
    {
        Manager.SetExternalInterface(Manager.CurrentMenu);
    }
}

function InitializePopup(KFGFxMoviePlayer_Manager InManager)
{
    Manager = InManager;
}
