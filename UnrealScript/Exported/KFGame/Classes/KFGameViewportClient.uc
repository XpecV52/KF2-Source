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

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

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
	

	return;


	Super.DrawTransitionMessage(Canvas, Message);
}

defaultproperties
{
   RandomLoadingStrings(0)="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in lacinia odio. Integer egestas, tortor in dignissim aliquam, sem libero gravida felis, quis porta sem massa at nunc. Aliquam in nulla et libero auctor convallis. Mauris ultrices eros sed tellus egestas luctus. Vivamus ut laoreet erat. Etiam ut pharetra mi. Curabitur semper nulla vitae eros ornare tristique 0"
   RandomLoadingStrings(1)="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in lacinia odio. Integer egestas, tortor in dignissim aliquam, sem libero gravida felis, quis porta sem massa at nunc. Aliquam in nulla et libero auctor convallis. Mauris ultrices eros sed tellus egestas luctus. Vivamus ut laoreet erat. Etiam ut pharetra mi. Curabitur semper nulla vitae eros ornare tristique 1"
   RandomLoadingStrings(2)="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in lacinia odio. Integer egestas, tortor in dignissim aliquam, sem libero gravida felis, quis porta sem massa at nunc. Aliquam in nulla et libero auctor convallis. Mauris ultrices eros sed tellus egestas luctus. Vivamus ut laoreet erat. Etiam ut pharetra mi. Curabitur semper nulla vitae eros ornare tristique 2"
   RandomLoadingStrings(3)="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in lacinia odio. Integer egestas, tortor in dignissim aliquam, sem libero gravida felis, quis porta sem massa at nunc. Aliquam in nulla et libero auctor convallis. Mauris ultrices eros sed tellus egestas luctus. Vivamus ut laoreet erat. Etiam ut pharetra mi. Curabitur semper nulla vitae eros ornare tristique 3"
   RandomLoadingStrings(4)="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in lacinia odio. Integer egestas, tortor in dignissim aliquam, sem libero gravida felis, quis porta sem massa at nunc. Aliquam in nulla et libero auctor convallis. Mauris ultrices eros sed tellus egestas luctus. Vivamus ut laoreet erat. Etiam ut pharetra mi. Curabitur semper nulla vitae eros ornare tristique 4"
   RandomLoadingStrings(5)="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in lacinia odio. Integer egestas, tortor in dignissim aliquam, sem libero gravida felis, quis porta sem massa at nunc. Aliquam in nulla et libero auctor convallis. Mauris ultrices eros sed tellus egestas luctus. Vivamus ut laoreet erat. Etiam ut pharetra mi. Curabitur semper nulla vitae eros ornare tristique 5"
   MessageFont=Font'UI_Canvas_Fonts.Font_General_Small'
   FontScale=0.500000
   Name="Default__KFGameViewportClient"
   ObjectArchetype=GameViewportClient'Engine.Default__GameViewportClient'
}
