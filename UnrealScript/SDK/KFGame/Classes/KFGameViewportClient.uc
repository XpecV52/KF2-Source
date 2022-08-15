//=============================================================================
// KFGameViewportClient
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 12/3/2012
//=============================================================================

class KFGameViewportClient extends GameViewportClient
	native(UI);


/** The message that the front ends pop up will display if there is a connection issue */
var string ErrorTitle;
var string ErrorMessage;

var string LastConnectionAttemptAddress;

var localized array<string> RandomLoadingStrings;
var FONT MessageFont;
var float FontScale;

cpptext
{
	virtual void ShowSpawnVolumes( ESetMode SetMode );
};

function NotifyConnectionError(EProgressMessageType MessageType, optional string Message=Localize("Errors", "ConnectionFailed", "Engine"), optional string Title=Localize("Errors", "ConnectionFailed_Title", "Engine") )
{
	local KFGameEngine KFGEngine;
	KFGEngine = KFGameEngine( Class'KFGameEngine'.static.GetEngine() );
	
	// Don't override cached error messages until we've dealt with them
	if ( ErrorTitle == "" )
	{
		// localize our strings
		ErrorTitle = class'KFLocalMessage'.static.getLocalized(Title);
		ErrorMessage = class'KFLocalMessage'.static.getLocalized(Message);
		KFGEngine.SetLastConnectionError(Message, Title);
	}

	super.NotifyConnectionError(MessageType, Message, Title);
}

//Ported from RO2, storing last address that we attempted to connect to.
event PreBrowse(string Address)
{
	LastConnectionAttemptAddress = Address;
}

/** Returns the error message related to any disconnects */
function GetErrorMessage(out string outTitle, out string outMessage)
{
	outTitle = ErrorTitle;
	outMessage = ErrorMessage;

	ErrorTitle = "";
	ErrorMessage = "";
}

/**
 * Displays the transition screen.
 * @param Canvas - The canvas to use for rendering.
 */
function DrawTransition(Canvas Canvas)
{
	local string RandomLoadingString;
	switch(Outer.TransitionType)
	{
		case TT_Loading:
			RandomLoadingString = GetRandomLoadingMessage();
			DrawTransitionMessage(Canvas,RandomLoadingString);
			break;
	}
}

function string GetRandomLoadingMessage()
{
	return RandomLoadingStrings[Rand(RandomLoadingStrings.length)];
}

/**
 * Print a centered transition message with a drop shadow.
 */
function DrawTransitionMessage(Canvas Canvas,string Message)
{
	//class'Engine'.static.AddOverlay(MessageFont, message, 0.1, 0.925, FontScale, FontScale, false);
	
`if(`isdefined(ShippingPC) || `isdefined(FINAL_RELEASE))
	return;
`endif

	Super.DrawTransitionMessage(Canvas, Message);
}

DefaultProperties
{
	//defaults
	MessageFont=Font'UI_Canvas_Fonts.Font_General_Small'
	FontScale=0.5
}