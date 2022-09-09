//=============================================================================
// KFGFxPopup_FriendsConfirm
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 SPL
//  - Pavel Rodionov 10/09/2019
//=============================================================================

class KFGFxPopup_FriendsConfirm extends KFGFxObject_Popup;

function AssignLeftButtonDelegate( delegate<LeftButtonPress> LeftDelegate)
{
	LeftButtonPress = LeftDelegate;
}


function AssignRightButtonDelegate( delegate<RightButtonPress> RightDelegate)
{
	RightButtonPress = RightDelegate;
}

function ClearDelegates()
{
	LeftButtonPress = none;
	MiddleButtonPress = none;
	RightButtonPress = none;
}


function Callback_onBtnAcceptClick()
{
        LogInternal(getFuncName());
        if( LeftButtonPress != none )
	{
	       LogInternal("LeftButtonPress");
		LeftButtonPress();
	}	
	ClosePopUp();
}


function Callback_onBtnDeclineClick()
{
        LogInternal(getFuncName());
        if( RightButtonPress != none )
	{
	       LogInternal("RightButtonPress");
		RightButtonPress();
	}
        ClosePopUp();
}

defaultproperties
{
   Name="Default__KFGFxPopup_FriendsConfirm"
   ObjectArchetype=KFGFxObject_Popup'KFGame.Default__KFGFxObject_Popup'
}
