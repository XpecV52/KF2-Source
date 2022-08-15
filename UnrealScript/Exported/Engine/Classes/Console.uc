//=============================================================================
// Console - A quick little command line console that accepts most commands.
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class Console extends Interaction
	within GameViewportClient
	transient
	config(Input)
	native(UserInterface);

// Constants.
const MaxHistory=16;		// # of command history to remember.

/** The player which the next console command should be executed in the context of.  If NULL, execute in the viewport. */
var LocalPlayer ConsoleTargetPlayer;

var Texture2D		DefaultTexture_Black;
var Texture2D		DefaultTexture_White;

/** The key which opens the console. */
var globalconfig name ConsoleKey;

/** The key which opens the typing bar. */
var globalconfig name TypeKey;

/**  Visible Console stuff */
var globalconfig int 	MaxScrollbackSize;

/** Holds the scrollback buffer */
var array<string> 		Scrollback;

/**  Where in the scrollback buffer are we */
var int 				SBHead, SBPos;

/** index into the History array for the latest command that was entered */
var config int HistoryTop;

/** index into the History array for the earliest command that was entered */
var config int HistoryBot;

/** the index of the current position in the History array */
var config int HistoryCur;

/** tracks previously entered console commands */
var config string History[MaxHistory];

/** tracks whether the user is using arrows keys to navigate the history, so that auto-complete doesn't override */
var transient bool bNavigatingHistory;

/** The command the user is currently typing. */
var string TypedStr;

var int TypedStrPos;						//Current position in TypedStr

/**
 * Indicates that InputChar events should be captured to prevent them from being passed on to other interactions.  Reset
 * when the another keydown event is received.
 */
var	transient	bool bCaptureKeyInput;

/** True while a control key is pressed. */
var bool bCtrl;

var config bool bEnableUI;

struct native AutoCompleteCommand
{
	var string		Command;
	var string		Desc;
};

/** Manual list of auto-complete commands and info specified in BaseInput.ini */
var config array<AutoCompleteCommand>	ManualAutoCompleteList;
/** Full list of auto-complete commands and info */
var transient array<AutoCompleteCommand>	AutoCompleteList;
/** Is the current auto-complete selection locked */
var transient bool 			bAutoCompleteLocked;
/** Currently selected auto complete index */
var transient int			AutoCompleteIndex;
/** Should the user be required to hold ctrl to use the up/down arrows when navigating auto-complete */
var config bool				bRequireCtrlToNavigateAutoComplete;
/** Do we need to rebuild auto complete? */
var transient bool			bIsRuntimeAutoCompleteUpToDate;

/** Node for storing an auto-complete tree based on each char in the command */
struct native AutoCompleteNode
{
	/** Char for node in the tree */
	var int IndexChar;
	/** Indicies into AutoCompleteList for commands that match to this level */
	var init array<int> AutoCompleteListIndices;
	/** Children for further matching */
	var init array<pointer> ChildNodes{FAutoCompleteNode};

structcpptext
{
	FAutoCompleteNode()
	{
		IndexChar = INDEX_NONE;
	}
	FAutoCompleteNode(INT NewChar)
	{
		IndexChar = NewChar;
	}
	~FAutoCompleteNode()
	{
		for (INT Idx = 0; Idx < ChildNodes.Num(); Idx++)
		{
			FAutoCompleteNode *Node = ChildNodes(Idx);
			delete Node;
		}
		ChildNodes.Empty();
	}
}
};
var native transient AutoCompleteNode AutoCompleteTree;

/** Current list of matching commands for auto-complete, @see UpdateCompleteIndices() */
var transient array<int> AutoCompleteIndices;

/**
 * Called when the Console is added to the GameViewportClient's Interactions array.
 */
function Initialized()
{
	Super.Initialized();
}

function SetInputText( string Text )
{
	TypedStr = Text;
}

function SetCursorPos( int Position )
{
	TypedStrPos = Position;
}

/**
* Searches console command history and removes any entries matching the specified command.
* @param Command - The command to search for and purge from the history.
*/
function PurgeCommandFromHistory(string Command)
{
	local int HistoryIdx, Idx, NextIdx;

	if ( (HistoryTop >= 0) && (HistoryTop < MaxHistory) )
	{
		for (HistoryIdx=0; HistoryIdx<MaxHistory; ++HistoryIdx)
		{
			if (History[HistoryIdx] ~= Command)
			{
				// from here to the top idx, shift everything back one
				Idx = HistoryIdx;
				NextIdx = (HistoryIdx + 1) % MaxHistory;

				while (Idx != HistoryTop)
				{
					History[Idx] = History[NextIdx];
					Idx = NextIdx;
					NextIdx = (NextIdx + 1) % MaxHistory;
				}

				// top index backs up one as well
				HistoryTop = (HistoryTop == 0) ? (MaxHistory - 1) : (HistoryTop - 1);
			}
		}
	}
}

/**
 * Executes a console command.
 * @param Command - The command to execute.
 */
function ConsoleCommand(string Command)
{
	// Store the command in the console history.
	if ((HistoryTop == 0) ? !(History[MaxHistory - 1] ~= Command) : !(History[HistoryTop - 1] ~= Command))
	{
		// ensure uniqueness
		PurgeCommandFromHistory(Command);

		History[HistoryTop] = Command;
		HistoryTop = (HistoryTop+1) % MaxHistory;

		if ( ( HistoryBot == -1) || ( HistoryBot == HistoryTop ) )
			HistoryBot = (HistoryBot+1) % MaxHistory;
	}
	HistoryCur = HistoryTop;

	// Save the command history to the INI.
	SaveConfig();

	OutputText("\n>>>" @ Command @ "<<<");

	if(ConsoleTargetPlayer != None)
	{
		// If there is a console target player, execute the command in the player's context.
		ConsoleTargetPlayer.Actor.ConsoleCommand(Command);
	}
	else if(GamePlayers.Length > 0 && GamePlayers[0].Actor != None)
	{
		// If there are any players, execute the command in the first players context.
		GamePlayers[0].Actor.ConsoleCommand(Command);
	}
	else
	{
		// Otherwise, execute the command in the context of the viewport.
		Outer.ConsoleCommand(Command);
	}
}

/**
 * Clears the console output buffer.
 */
function ClearOutput()
{
	SBHead = 0;
	ScrollBack.Remove(0,ScrollBack.Length);
}

/**
 * Prints a single line of text to the console.
 * @param Text - A line of text to display on the console.
 */
function OutputTextLine(coerce string Text)
{
	// If we are full, delete the first line
	if (ScrollBack.Length > MaxScrollbackSize)
	{
		ScrollBack.Remove(0,1);
		SBHead = MaxScrollBackSize-1;
	}
	else
		SBHead++;

	// Add the line
	ScrollBack.Length = ScrollBack.Length+1;
	ScrollBack[SBHead] = Text;
}

/**
 * Prints a (potentially multi-line) string of text to the console.
 * The text is split into separate lines and passed to OutputTextLine.
 * @param Text - Text to display on the console.
 */
event OutputText(coerce string Text)
{
	local string RemainingText;
	local int StringLength;
	local int LineLength;

	RemainingText = Text;
	StringLength = Len(Text);
	while(StringLength > 0)
	{
		// Find the number of characters in the next line of text.
		LineLength = InStr(RemainingText,"\n");
		if(LineLength == -1)
		{
			// There aren't any more newlines in the string, assume there's a newline at the end of the string.
			LineLength = StringLength;
		}

		// Output the line to the console.
		OutputTextLine(Left(RemainingText,LineLength));

		// Remove the line from the string.
		RemainingText = Mid(RemainingText,LineLength + 1);
		StringLength -= LineLength + 1;
	};
}

/**
 * Opens the typing bar with text already entered.
 * @param Text - The text to enter in the typing bar.
 */
function StartTyping(coerce string Text)
{
	GotoState('Typing');
	SetInputText(Text);
	SetCursorPos(Len(Text));
}

function PostRender_Console(Canvas Canvas);

/**
 * Process an input key event routed through unrealscript from another object. This method is assigned as the value for the
 * OnRecievedNativeInputKey delegate so that native input events are routed to this unrealscript function.
 *
 * @param	ControllerId	the controller that generated this input key event
 * @param	Key				the name of the key which an event occured for (KEY_Up, KEY_Down, etc.)
 * @param	EventType		the type of event which occured (pressed, released, etc.)
 * @param	AmountDepressed	for analog keys, the depression percent.
 *
 * @return	true to consume the key event, false to pass it on.
 */
function bool InputKey( int ControllerId, name Key, EInputEvent Event, float AmountDepressed = 1.f, bool bGamepad = FALSE )
{
	if ( Event == IE_Pressed )
	{
		bCaptureKeyInput = false;

		if ( Key == ConsoleKey )
		{
			GotoState('Open');
			bCaptureKeyInput = true;
			return true;
		}
		else if ( Key == TypeKey )
		{
			GotoState('Typing');
			bCaptureKeyInput = true;
			return true;
		}
	}

	return bCaptureKeyInput;
}

/**
 * Process a character input event (typing) routed through unrealscript from another object. This method is assigned as the value for the
 * OnRecievedNativeInputKey delegate so that native input events are routed to this unrealscript function.
 *
 * @param	ControllerId	the controller that generated this character input event
 * @param	Unicode			the character that was typed
 *
 * @return	True to consume the character, false to pass it on.
 */
function bool InputChar( int ControllerId, string Unicode )
{
	return bCaptureKeyInput;
}

/**
 * Clears out all pressed keys from the player's input object.
 */
function FlushPlayerInput()
{
	local PlayerController PC;

	if(ConsoleTargetPlayer != None)
	{
		PC = ConsoleTargetPlayer.Actor;
	}
	else if(GamePlayers.Length > 0 && GamePlayers[0].Actor != None)
	{
		// If there are any players, execute the command in the first players context.
		PC = GamePlayers[0].Actor;
	}

	if ( PC != None && PC.PlayerInput != None )
	{
		PC.PlayerInput.ResetInput();
	}
}

/** looks for Control key presses and the copy/paste combination that apply to both the console bar and the full open console */
function bool ProcessControlKey(name Key, EInputEvent Event)
{
	if (Key == 'LeftControl' || Key == 'RightControl')
	{
		if (Event == IE_Released)
		{
			bCtrl = false;
		}
		else if (Event == IE_Pressed)
		{
			bCtrl = true;
		}

		return true;
	}
	else if (bCtrl && Event == IE_Pressed && GamePlayers.length > 0 && GamePlayers[0].Actor != None)
	{
		if (Key == 'v')
		{
			// paste
			AppendInputText(GamePlayers[0].Actor.PasteFromClipboard());
			return true;
		}
		else if (Key == 'c')
		{
			// copy
			GamePlayers[0].Actor.CopyToClipboard(TypedStr);
			return true;
		}
		else if (Key == 'x')
		{
			// cut
			if (TypedStr != "")
			{
				GamePlayers[0].Actor.CopyToClipboard(TypedStr);
				SetInputText("");
				SetCursorPos(0);
			}
			return true;
		}
	}

	return false;
}

/** appends the specified text to the string of typed text */
function AppendInputText(string Text)
{
	local int Character;

	while (Len(Text) > 0)
	{
		Character = Asc(Left(Text, 1));
		Text = Mid(Text, 1);

		if (Character >= 0x20 && Character < 0x100)
		{
			SetInputText(Left(TypedStr, TypedStrPos) $ Chr(Character) $ Right(TypedStr, Len(TypedStr) - TypedStrPos));
			SetCursorPos(TypedStrPos + 1);
		}
	};
	UpdateCompleteIndices();
}

final native function BuildRuntimeAutoCompleteList(optional bool bForce);

native function UpdateCompleteIndices();

/**
 * This state is used when the typing bar is open.
 */
state Typing
{
	/**
	 * Process a character input event (typing) routed through unrealscript from another object. This method is assigned as the value for the
	 * OnRecievedNativeInputKey delegate so that native input events are routed to this unrealscript function.
	 *
	 * @param	ControllerId	the controller that generated this character input event
	 * @param	Unicode			the character that was typed
	 *
	 * @return	True to consume the character, false to pass it on.
	 */
	function bool InputChar( int ControllerId, string Unicode )
	{
		if ( bCaptureKeyInput )
		{
			return true;
		}

		AppendInputText(Unicode);

		return true;
	}

	/**
	 * Process an input key event routed through unrealscript from another object. This method is assigned as the value for the
	 * OnRecievedNativeInputKey delegate so that native input events are routed to this unrealscript function.
	 *
	 * @param	ControllerId	the controller that generated this input key event
	 * @param	Key				the name of the key which an event occured for (KEY_Up, KEY_Down, etc.)
	 * @param	EventType		the type of event which occured (pressed, released, etc.)
	 * @param	AmountDepressed	for analog keys, the depression percent.
	 *
	 * @return	true to consume the key event, false to pass it on.
	 */
	function bool InputKey( int ControllerId, name Key, EInputEvent Event, float AmountDepressed = 1.f, bool bGamepad = FALSE )
	{
		local string Temp;
		local int NewPos, SpacePos, PeriodPos;

		//`log(`location@`showvar(Key));

		if ( Event == IE_Pressed )
		{
			bCaptureKeyInput = false;
		}

		if (ProcessControlKey(Key, Event))
		{
			return true;
		}
		else if( bGamepad )
		{
			return FALSE;
		}
		else if( Key == 'Escape' && Event == IE_Released )
		{
			if( TypedStr!="" )
			{
				SetInputText("");
				SetCursorPos(0);
				HistoryCur = HistoryTop;
				return true;
			}
			else
			{
				GotoState( '' );
			}

			return true;
		}
		else if ( Key==ConsoleKey && Event == IE_Pressed )
		{
			GotoState('Open');
			bCaptureKeyInput = true;
			return true;
		}
		else if(Key == TypeKey && Event == IE_Pressed)
		{
			if (AutoCompleteIndices.Length > 0 && !bAutoCompleteLocked)
			{
				TypedStr = AutoCompleteList[AutoCompleteIndices[AutoCompleteIndex]].Command;
				SetCursorPos(Len(TypedStr));
				bAutoCompleteLocked = TRUE;

				// Prevent TypeKey from appending onto auto complete
				bCaptureKeyInput = true;

			}
			else
			{
				GotoState('');
				bCaptureKeyInput = true;
			}
			return true;
		}
		else if( Key=='Enter' && Event == IE_Released )
		{
			if( TypedStr!="" )
			{
				// Make a local copy of the string.
				Temp=TypedStr;

				SetInputText("");
				SetCursorPos(0);

				ConsoleCommand(Temp);

				//OutputText( Localize("Errors","Exec","Core") );

				OutputText( "" );
				GotoState('');

				UpdateCompleteIndices();
			}
			else
			{
				GotoState('');
			}

			return true;
		}
		else if( Global.InputKey( ControllerId, Key, Event, AmountDepressed, bGamepad ) )
		{
			return true;
		}
		else if( Event != IE_Pressed && Event != IE_Repeat )
		{
			if( !bGamepad )
			{
				return	Key != 'LeftMouseButton'
					&&	Key != 'MiddleMouseButton'
					&&	Key != 'RightMouseButton';
			}
			return FALSE;
		}
		else if( Key=='up' )
		{
			if (!bNavigatingHistory && ((bRequireCtrlToNavigateAutoComplete && bCtrl) || (!bRequireCtrlToNavigateAutoComplete && !bCtrl && AutoCompleteIndices.Length > 1)))
			{
				if (++AutoCompleteIndex == AutoCompleteIndices.Length)
				{
					AutoCompleteIndex = 0;
				}
			}
			else
			if ( HistoryBot >= 0 )
			{
				if (HistoryCur == HistoryBot)
					HistoryCur = HistoryTop;
				else
				{
					HistoryCur--;
					if (HistoryCur<0)
						HistoryCur = MaxHistory-1;
				}

				SetInputText(History[HistoryCur]);
				SetCursorPos(Len(History[HistoryCur]));
				UpdateCompleteIndices();
				bNavigatingHistory = TRUE;
			}
			return True;
		}
		else if( Key=='down' )
		{
			if (!bNavigatingHistory && ((bRequireCtrlToNavigateAutoComplete && bCtrl) || (!bRequireCtrlToNavigateAutoComplete && !bCtrl && AutoCompleteIndices.Length > 1)))
			{
				if (--AutoCompleteIndex < 0)
				{
					AutoCompleteIndex = AutoCompleteIndices.Length - 1;
				}
				bAutoCompleteLocked = FALSE;
			}
			else
			if ( HistoryBot >= 0 )
			{
				if (HistoryCur == HistoryTop)
					HistoryCur = HistoryBot;
				else
					HistoryCur = (HistoryCur+1) % MaxHistory;

				SetInputText(History[HistoryCur]);
				SetCursorPos(Len(History[HistoryCur]));
				UpdateCompleteIndices();
				bNavigatingHistory = TRUE;
			}

		}
		else if( Key=='backspace' )
		{
			if( TypedStrPos>0 )
			{
				SetInputText(Left(TypedStr,TypedStrPos-1) $ Right(TypedStr, Len(TypedStr) - TypedStrPos));
				SetCursorPos(TypedStrPos-1);
				// unlock auto-complete (@todo - track the lock position so we don't bother unlocking under bogus cases)
				bAutoCompleteLocked = FALSE;
			}

			return true;
		}
		else if ( Key=='delete' )
		{
			if ( TypedStrPos < Len(TypedStr) )
			{
				SetInputText(Left(TypedStr,TypedStrPos) $ Right(TypedStr, Len(TypedStr) - TypedStrPos - 1));
			}
			return true;
		}
		else if ( Key=='left' )
		{
			if (bCtrl)
			{
				// find the nearest '.' or ' '
				NewPos = Max(InStr(TypedStr,".",TRUE,FALSE,TypedStrPos),InStr(TypedStr," ",TRUE,FALSE,TypedStrPos));
				SetCursorPos(Max(0,NewPos));
			}
			else
			{
				SetCursorPos(Max(0, TypedStrPos - 1));
			}
			return true;
		}
		else if ( Key=='right' )
		{
			if (bCtrl)
			{
				// find the nearest '.' or ' '
				SpacePos = InStr(TypedStr," ",FALSE,FALSE,TypedStrPos+1);
				PeriodPos = InStr(TypedStr,".",FALSE,FALSE,TypedStrPos+1);
				// pick the closest valid index
				NewPos = SpacePos < 0 ? PeriodPos : (PeriodPos < 0 ? SpacePos : Min(SpacePos,PeriodPos));
				// jump to end if nothing in between
				if (NewPos == INDEX_NONE)
				{
					NewPos = Len(TypedStr);
				}
				SetCursorPos(Min(Len(TypedStr),Max(TypedStrPos,NewPos)));
			}
			else
			{
				SetCursorPos(Min(Len(TypedStr), TypedStrPos + 1));
			}
			return true;
		}
		else if ( Key=='home' )
		{
			SetCursorPos(0);
			return true;
		}
		else if ( Key=='end' )
		{
			SetCursorPos(Len(TypedStr));
			return true;
		}

		return TRUE;
	}

	event PostRender_Console(Canvas Canvas)
	{
		local float y, xl, yl, info_xl, info_yl, ClipX, ClipY, LeftPos;
		local string OutStr;
		local int MatchIdx, Idx, StartIdx;

		Global.PostRender_Console(Canvas);

		// Blank out a space

		// use the smallest font
		Canvas.Font	 = class'Engine'.Static.GetSmallFont();
		// determine the position for the cursor
		OutStr = "(>"@TypedStr;
		Canvas.Strlen(OutStr,xl,yl);

		ClipX = Canvas.ClipX;
		ClipY = Canvas.ClipY;
		LeftPos = 0;

		if (Class'WorldInfo'.Static.IsConsoleBuild())
		{
			ClipX	-= 32;
			ClipY	-= 32;
			LeftPos	 = 32;
		}

		// start at the bottom of the screen, then come up 6 pixels more than the height of the font
		Canvas.SetPos(LeftPos,ClipY-6-yl);
		// draw the background texture
		Canvas.DrawTile( DefaultTexture_Black, ClipX, yl+6,0,0,32,32);

		Canvas.SetPos(LeftPos,ClipY-6-yl);

		// change the draw color to green
		Canvas.SetDrawColor(0,255,0);

		// draw the top border of the typing region
		Canvas.DrawTile( DefaultTexture_White, ClipX, 2,0,0,32,32);

		// center the text between the bottom of the screen and the bottom of the border line
		Canvas.SetPos(LeftPos,ClipY-3-yl);
		Canvas.bCenter = False;
		Canvas.DrawText( OutStr, false );

		// draw the remaining text for matching auto-complete
		if (AutoCompleteIndices.Length > 0)
		{
			Idx = AutoCompleteIndices[AutoCompleteIndex];
			//Canvas.StrLen(OutStr,xl,yl);
			Canvas.SetPos(LeftPos+xl,ClipY-3-yl);
			Canvas.SetDrawColor(87,148,87);
			Canvas.DrawText(Right(AutoCompleteList[Idx].Command,Len(AutoCompleteList[Idx].Command) - Len(TypedStr)),FALSE);
			Canvas.StrLen("(>",xl,yl);

			StartIdx = AutoCompleteIndex - 5;
			if (StartIdx < 0)
			{
				StartIdx = Max(0,AutoCompleteIndices.Length + StartIdx);
			}
			Idx = StartIdx;
			y = ClipY - 6 - (yl * 2);
			for (MatchIdx = 0; MatchIdx < 10; MatchIdx++)
			{
				OutStr = AutoCompleteList[AutoCompleteIndices[Idx]].Desc;
				Canvas.StrLen(OutStr, info_xl, info_yl);
				y -= info_yl - yl;
				Canvas.SetPos(LeftPos + xl, y);
				Canvas.SetDrawColor(0, 0, 0);
				Canvas.DrawTile(DefaultTexture_White, info_xl, info_yl, 0, 0, 32, 32);
				Canvas.SetPos(LeftPos + xl, y);
				if (Idx == AutoCompleteIndex)
				{
					Canvas.SetDrawColor(0,255,0);
				}
				else
				{
					Canvas.SetDrawColor(0,150,0);
				}
				Canvas.DrawText(OutStr,false);
				if (++Idx >= AutoCompleteIndices.Length)
				{
					Idx = 0;
				}
				y -= yl;
				// break out if we loop on lists < 10
				if (Idx == StartIdx)
				{
					break;
				}
			}
			if (AutoCompleteIndices.Length >= 10)
			{
				OutStr = "[" $ (AutoCompleteIndices.Length - 10 + 1) @ "more matches]";
				Canvas.StrLen(OutStr, info_xl, info_yl);
				Canvas.SetPos(LeftPos + xl, y);
				Canvas.SetDrawColor(0, 0, 0);
				Canvas.DrawTile(DefaultTexture_White, info_xl, info_yl, 0, 0, 32, 32);
				Canvas.SetPos(LeftPos + xl, y);
				Canvas.SetDrawColor(0, 255, 0);
				Canvas.DrawText(OutStr, false);
			}
		}

		// determine the cursor position
		OutStr = "(>"@Left(TypedStr,TypedStrPos);
		Canvas.StrLen(OutStr,xl,yl);

		// move the pen to that position
		Canvas.SetPos(LeftPos + xl,ClipY-1-yl);

		// draw the cursor
		Canvas.DrawText("_");
	}

	event BeginState(Name PreviousStateName)
	{
		if ( PreviousStateName == '' )
		{
			FlushPlayerInput();
		}
		bCaptureKeyInput = true;
		HistoryCur = HistoryTop;
	}

	event EndState( Name NextStateName )
	{
		bAutoCompleteLocked = FALSE;
	}
}

/**
 * This state is used when the console is open.
 */
state Open
{
	function bool InputChar( int ControllerId, string Unicode )
	{
		if ( bCaptureKeyInput )
		{
			return true;
		}

		AppendInputText(Unicode);

		return true;
	}

	/**
	 * Process an input key event routed through unrealscript from another object. This method is assigned as the value for the
	 * OnRecievedNativeInputKey delegate so that native input events are routed to this unrealscript function.
	 *
	 * @param	ControllerId	the controller that generated this input key event
	 * @param	Key				the name of the key which an event occured for (KEY_Up, KEY_Down, etc.)
	 * @param	EventType		the type of event which occured (pressed, released, etc.)
	 * @param	AmountDepressed	for analog keys, the depression percent.
	 *
	 * @return	true to consume the key event, false to pass it on.
	 */
	function bool InputKey( int ControllerId, name Key, EInputEvent Event, float AmountDepressed = 1.f, bool bGamepad = FALSE )
	{
		local string Temp;

		if (Event == IE_Pressed)
		{
			bCaptureKeyInput=false;
		}

		if (ProcessControlKey(Key, Event))
		{
			return true;
		}
		else if( bGamepad )
		{
			return FALSE;
		}
		else if( Key == 'Escape' && Event == IE_Released )
		{
			if( TypedStr!="" )
			{
				SetInputText("");
				SetCursorPos(0);
				HistoryCur = HistoryTop;
				return true;
			}
			else
			{
				GotoState( '' );
			}
		}
		else if( Key==ConsoleKey && Event == IE_Pressed )
		{
			GotoState('');
			bCaptureKeyInput = true;
			return true;
		}
		else if(Key == TypeKey && Event == IE_Pressed)
		{
			if (AutoCompleteIndices.Length > 0 && !bAutoCompleteLocked)
			{
				TypedStr = AutoCompleteList[AutoCompleteIndices[0]].Command;
				SetCursorPos(Len(TypedStr));
				bAutoCompleteLocked = TRUE;

				// Prevent TypeKey from appending onto auto complete
				bCaptureKeyInput = true;

			}
			else
			{
				GotoState('');
				bCaptureKeyInput = true;
			}
			return true;
		}
		else if( Key=='Enter' && Event == IE_Released )
		{
			if( TypedStr!="" )
			{
				// Make a local copy of the string.
				Temp=TypedStr;
				SetInputText("");
				SetCursorPos(0);

				if (Temp~="cls")
				{
					ClearOutput();
				}
				else
				{
					ConsoleCommand(Temp);
				}

				UpdateCompleteIndices();
			}

			return true;
		}
		else if( Global.InputKey( ControllerId, Key, Event, AmountDepressed, bGamepad ) )
		{
			return true;
		}
		else if( Event != IE_Pressed && Event != IE_Repeat )
		{
			if( !bGamepad )
			{
				return	Key != 'LeftMouseButton'
					&&	Key != 'MiddleMouseButton'
					&&	Key != 'RightMouseButton';
			}
			return FALSE;
		}
		else if( Key=='up' )
		{

			if (!bCtrl)
			{

				if ( HistoryBot >= 0 )
				{
					if (HistoryCur == HistoryBot)
						HistoryCur = HistoryTop;
					else
					{
						HistoryCur--;
						if (HistoryCur<0)
							HistoryCur = MaxHistory-1;
					}

					SetInputText(History[HistoryCur]);
					SetCursorPos(Len(History[HistoryCur]));
				}
			}
			else
			{
				if (SBPos<ScrollBack.Length-1)
				{
					SBPos++;

					if (SBPos>=ScrollBack.Length)
					  SBPos = ScrollBack.Length-1;
				}
			}
			return True;
		}
		else if( Key=='down' )
		{
			if (!bCtrl)
			{
				if ( HistoryBot >= 0 )
				{
					if (HistoryCur == HistoryTop)
						HistoryCur = HistoryBot;
					else
						HistoryCur = (HistoryCur+1) % MaxHistory;

					SetInputText(History[HistoryCur]);
					SetCursorPos(Len(History[HistoryCur]));
				}
			}
			else
			{
				if (SBPos>0)
				{
					SBPos--;
					if (SBPos<0)
						SBPos = 0;
				}

			}
			return true;
		}
		else if( Key=='backspace' )
		{
			if( TypedStrPos>0 )
			{
				SetInputText(Left(TypedStr,TypedStrPos-1) $ Right(TypedStr, Len(TypedStr) - TypedStrPos));
				SetCursorPos(TypedStrPos-1);
				// unlock auto-complete (@todo - track the lock position so we don't bother unlocking under bogus cases)
				bAutoCompleteLocked = FALSE;
			}

			return true;
		}
		else if ( Key=='delete' )
		{
			if ( TypedStrPos < Len(TypedStr) )
			{
				SetInputText(Left(TypedStr,TypedStrPos) $ Right(TypedStr, Len(TypedStr) - TypedStrPos - 1));
			}
			return true;
		}
		else if ( Key=='left' )
		{
			SetCursorPos(Max(0, TypedStrPos - 1));
			return true;
		}
		else if ( Key=='right' )
		{
			SetCursorPos(Min(Len(TypedStr), TypedStrPos + 1));
			return true;
		}
		else if (bCtrl && Key=='home')
		{
			SBPos=0;
		}
		else if ( Key=='home' )
		{
			SetCursorPos(0);
			return true;
		}
		else if (bCtrl && Key=='end')
		{
			SBPos = ScrollBack.Length-1;
		}
		else if ( Key=='end' )
		{
			SetCursorPos(Len(TypedStr));
			return true;
		}

		else if ( Key=='pageup' || Key=='mousescrollup')
		{
			if (SBPos<ScrollBack.Length-1)
			{
				if (bCtrl)
					SBPos+=5;
				else
					SBPos++;

				if (SBPos>=ScrollBack.Length)
				  SBPos = ScrollBack.Length-1;
			}

			return true;
		}
		else if ( Key=='pagedown' || Key=='mousescrolldown')
		{
			if (SBPos>0)
			{
				if (bCtrl)
					SBPos-=5;
				else
					SBPos--;

				if (SBPos<0)
					SBPos = 0;
			}

			return true;
		}


		return TRUE;
	}

	event PostRender_Console(Canvas Canvas)
	{

		local float Height;
		local float xl, yl, y, ScrollLineXL, ScrollLineYL, info_xl, info_yl;
		local string OutStr;
		local int idx, MatchIdx;

		// render the buffer

		// Blank out a space
		Canvas.Font = class'Engine'.Static.GetSmallFont();

		// the height of the buffer will be 75% of the height of the screen
		Height = Canvas.ClipY * 0.75;

		// change the draw color to white
		Canvas.SetDrawColor(255,255,255,255);

		// move the pen to the top-left pixel
		Canvas.SetPos(0,0);

		// draw the black background tile
		Canvas.DrawTile( DefaultTexture_Black, Canvas.ClipX, Height,0,0,32,32);

		// now render the typing region
		OutStr = "(>"@TypedStr;

		// determine the height of the text
		Canvas.Strlen(OutStr,xl,yl);

		// move the pen up + 12 pixels of buffer (for the green borders and some space)
		Canvas.SetPos(0,Height-12-yl);

		// change the draw color to green
		Canvas.SetDrawColor(0,255,0);

		// draw the top typing region border
		Canvas.DrawTile( DefaultTexture_White, Canvas.ClipX, 2,0,0,32,32);

		// move the pen to the bottom of the console buffer area
		Canvas.SetPos(0,Height);

		// draw the bottom typing region border
		Canvas.DrawTile( DefaultTexture_White, Canvas.ClipX, 2,0,0,32,32);

		// center the pen between the two borders
		Canvas.SetPos(0,Height-5-yl);
		Canvas.bCenter = False;

		// render the text that is being typed
		Canvas.DrawText( OutStr, false );

		// draw the remaining text for matching auto-complete
		if (AutoCompleteIndices.Length > 0)
		{
			Idx = AutoCompleteIndices[0];
			//Canvas.StrLen(OutStr,xl,yl);
			Canvas.SetPos(0+xl,Height-5-yl);
			Canvas.SetDrawColor(87,148,87);
			Canvas.DrawText(Right(AutoCompleteList[Idx].Command,Len(AutoCompleteList[Idx].Command) - Len(TypedStr)),FALSE);

			Canvas.StrLen("(>", xl, yl);
			y = Height + 5;
			for (MatchIdx = 0; MatchIdx < AutoCompleteIndices.Length && MatchIdx < 10; MatchIdx++)
			{
				Idx = AutoCompleteIndices[MatchIdx];
				Canvas.SetPos(0 + xl, y);
				Canvas.StrLen(AutoCompleteList[Idx].Desc, info_xl, info_yl);
				Canvas.SetDrawColor(0, 0, 0);
				Canvas.DrawTile(DefaultTexture_White, info_xl, info_yl, 0, 0, 32, 32);
				Canvas.SetPos(0 + xl, y);
				Canvas.SetDrawColor(0, 255, 0);
				Canvas.DrawText(AutoCompleteList[Idx].Desc, false);
				y += info_yl;
			}
		}

		OutStr = "(>"@Left(TypedStr,TypedStrPos);

		// position the pen at the cursor position
		Canvas.StrLen(OutStr,xl,yl);
		Canvas.SetPos(xl,Height-3-yl);

		// render the cursor
		Canvas.DrawText("_");

		// figure out which element of the scrollback buffer to should appear first (at the top of the screen)
		idx = SBHead - SBPos;
		y = Height-16-(yl*2);

		if (ScrollBack.Length==0)
			return;

		// change the draw color to white
		Canvas.SetDrawColor(255,255,255,255);

		// while we have enough room to draw another line and there are more lines to draw
		while (y>yl && idx>=0)
		{
			// move the pen to the correct position
			Canvas.SetPos(0, y);

			// adjust the location for any word wrapping due to long text lines
			Canvas.StrLen(ScrollBack[idx], ScrollLineXL, ScrollLineYL);
			if (ScrollLineYL > yl)
			{
				y -= (ScrollLineYL - yl);
				Canvas.SetPos(Canvas.CurX, y, Canvas.CurZ);
			}

			// draw the next line down in the buffer
			Canvas.DrawText(Scrollback[idx],false);
			idx--;
			y-=yl;
		}
	}

	event BeginState(Name PreviousStateName)
	{
		bCaptureKeyInput = true;
		HistoryCur = HistoryTop;

		SBPos = 0;
		bCtrl = false;

		if ( PreviousStateName == '' )
		{
			FlushPlayerInput();
		}
	}
}

defaultproperties
{
   DefaultTexture_Black=Texture2D'EngineResources.Black'
   DefaultTexture_White=Texture2D'EngineResources.WhiteSquareTexture'
   ConsoleKey="Tilde"
   TypeKey="F3"
   MaxScrollbackSize=1024
   HistoryBot=-1
   ManualAutoCompleteList(0)=(Command="Exit",Desc="Exit (Exits the game)")
   ManualAutoCompleteList(1)=(Command="DebugCreatePlayer 1")
   ManualAutoCompleteList(2)=(Command="FreezeAt",Desc="Locks the player view and rendering time.")
   ManualAutoCompleteList(3)=(Command="SSSwapControllers")
   ManualAutoCompleteList(4)=(Command="Open",Desc="Open <MapName> (Opens the specified map)")
   ManualAutoCompleteList(5)=(Command="DisplayAll",Desc="DisplayAll <ClassName> <PropertyName> (Display property values for instances of classname)")
   ManualAutoCompleteList(6)=(Command="DisplayAllState",Desc="DisplayAllState <ClassName> (Display state names for all instances of classname)")
   ManualAutoCompleteList(7)=(Command="DisplayClear",Desc="DisplayClear (Clears previous DisplayAll entries)")
   ManualAutoCompleteList(8)=(Command="FlushPersistentDebugLines",Desc="FlushPersistentDebugLines (Clears persistent debug line cache)")
   ManualAutoCompleteList(9)=(Command="GetAll ",Desc="GetAll <ClassName> <PropertyName> <Name=ObjectInstanceName> <OUTER=ObjectInstanceName> <SHOWDEFAULTS> <SHOWPENDINGKILLS> <DETAILED> (Log property values of all instances of classname)")
   ManualAutoCompleteList(10)=(Command="GetAllState",Desc="GetAllState <ClassName> (Log state names for all instances of classname)")
   ManualAutoCompleteList(11)=(Command="Obj List ",Desc="Obj List <Class=ClassName> <Type=MetaClass> <Outer=OuterObject> <Package=InsidePackage> <Inside=InsideObject>")
   ManualAutoCompleteList(12)=(Command="Obj ListContentRefs",Desc="Obj ListContentRefs <Class=ClassName> <ListClass=ClassName>")
   ManualAutoCompleteList(13)=(Command="Obj Classes",Desc="Obj Classes (Shows all classes)")
   ManualAutoCompleteList(14)=(Command="Obj Refs",Desc="Name=<ObjectName> Class=<OptionalObjectClass> Lists referencers of the specified object")
   ManualAutoCompleteList(15)=(Command="EditActor",Desc="EditActor <Class=ClassName> or <Name=ObjectName> or TRACE")
   ManualAutoCompleteList(16)=(Command="EditDefault",Desc="EditDefault <Class=ClassName>")
   ManualAutoCompleteList(17)=(Command="EditObject",Desc="EditObject <Class=ClassName> or <Name=ObjectName> or <ObjectName>")
   ManualAutoCompleteList(18)=(Command="ReloadCfg ",Desc="ReloadCfg <Class/ObjectName> (Reloads config variables for the specified object/class)")
   ManualAutoCompleteList(19)=(Command="ReloadLoc ",Desc="ReloadLoc <Class/ObjectName> (Reloads localized variables for the specified object/class)")
   ManualAutoCompleteList(20)=(Command="Set ",Desc="Set <ClassName> <PropertyName> <Value> (Sets property to value on objectname)")
   ManualAutoCompleteList(21)=(Command="Show BOUNDS",Desc="Show BOUNDS (Displays bounding boxes for all visible objects)")
   ManualAutoCompleteList(22)=(Command="Show BSP",Desc="Show BSP (Toggles BSP rendering)")
   ManualAutoCompleteList(23)=(Command="Show COLLISION",Desc="Show COLLISION (Toggles collision rendering)")
   ManualAutoCompleteList(24)=(Command="Show COVER",Desc="Show COVER (Toggles cover rendering)")
   ManualAutoCompleteList(25)=(Command="Show DECALS",Desc="Show DECALS (Toggles decal rendering)")
   ManualAutoCompleteList(26)=(Command="Show FOG",Desc="Show FOG (Toggles fog rendering)")
   ManualAutoCompleteList(27)=(Command="Show LEVELCOLORATION",Desc="Show LEVELCOLORATION (Toggles per-level coloration)")
   ManualAutoCompleteList(28)=(Command="Show PATHS",Desc="Show PATHS (Toggles path rendering)")
   ManualAutoCompleteList(29)=(Command="Show POSTPROCESS",Desc="Show POSTPROCESS (Toggles post process rendering)")
   ManualAutoCompleteList(30)=(Command="Show SKELMESHES",Desc="Show SKELMESHES (Toggles skeletal mesh rendering)")
   ManualAutoCompleteList(31)=(Command="Show TERRAIN",Desc="Show TERRAIN (Toggles terrain rendering)")
   ManualAutoCompleteList(32)=(Command="Show VOLUMES",Desc="Show VOLUMES (Toggles volume rendering)")
   ManualAutoCompleteList(33)=(Command="Show SPLINES",Desc="Show SPLINES (Toggles spline rendering)")
   ManualAutoCompleteList(34)=(Command="ShowSet",Desc="Sets a show flag to enable it")
   ManualAutoCompleteList(35)=(Command="ShowClear",Desc="Clears a show flag to disable it")
   ManualAutoCompleteList(36)=(Command="Stat FPS",Desc="Stat FPS (Shows FPS counter)")
   ManualAutoCompleteList(37)=(Command="Stat UNIT",Desc="Stat UNIT (Shows hardware unit framerate)")
   ManualAutoCompleteList(38)=(Command="Stat LEVELS",Desc="Stat LEVELS (Displays level streaming info)")
   ManualAutoCompleteList(39)=(Command="Stat GAME",Desc="Stat GAME (Displays game performance stats)")
   ManualAutoCompleteList(40)=(Command="Stat MEMORY",Desc="Stat MEMORY (Displays memory stats)")
   ManualAutoCompleteList(41)=(Command="Stat XBOXMEMORY",Desc="Stat XBOXMEMORY (Displays Xbox memory stats while playing on PC)")
   ManualAutoCompleteList(42)=(Command="Stat PHYSICS",Desc="Stat PHYSICS (Displays physics performance stats)")
   ManualAutoCompleteList(43)=(Command="Stat STREAMING",Desc="Stat STREAMING (Displays basic texture streaming stats)")
   ManualAutoCompleteList(44)=(Command="Stat STREAMINGDETAILS",Desc="Stat STREAMINGDETAILS (Displays detailed texture streaming stats)")
   ManualAutoCompleteList(45)=(Command="Stat COLLISION",Desc="Stat COLLISION")
   ManualAutoCompleteList(46)=(Command="Stat PARTICLES",Desc="Stat PARTICLES")
   ManualAutoCompleteList(47)=(Command="Stat SCRIPT",Desc="Stat SCRIPT")
   ManualAutoCompleteList(48)=(Command="Stat AUDIO",Desc="Stat AUDIO")
   ManualAutoCompleteList(49)=(Command="Stat ANIM",Desc="Stat ANIM")
   ManualAutoCompleteList(50)=(Command="Stat NET",Desc="Stat NET")
   ManualAutoCompleteList(51)=(Command="Stat LIST",Desc="Stat LIST Groups/Sets/Group (List groups of stats, saved sets, or specific stats within a specified group)")
   ManualAutoCompleteList(52)=(Command="Stat splitscreen")
   ManualAutoCompleteList(53)=(Command="ListTextures",Desc="ListTextures (Lists all loaded textures and their current memory footprint)")
   ManualAutoCompleteList(54)=(Command="ListUncachedStaticLightingInteractions",Desc="ListUncachedStaticLightingInteractions (Lists all uncached static lighting interactions, which causes Lighting needs to be rebuilt messages)")
   ManualAutoCompleteList(55)=(Command="RestartLevel",Desc="RestartLevel (restarts the level)")
   ManualAutoCompleteList(56)=(Command="ListSounds",Desc="ListSounds (Lists all the loaded sounds and their memory footprint)")
   ManualAutoCompleteList(57)=(Command="ListWaves",Desc="ListWaves (List the WaveInstances and whether they have a source)")
   ManualAutoCompleteList(58)=(Command="ListSoundClasses",Desc="ListSoundClasses (Lists a summary of loaded sound collated by class)")
   ManualAutoCompleteList(59)=(Command="ListSoundModes",Desc="ListSoundModes (Lists loaded sound modes)")
   ManualAutoCompleteList(60)=(Command="ListAudioComponents",Desc="ListAudioComponents (Dumps a detailed list of all AudioComponent objects)")
   ManualAutoCompleteList(61)=(Command="ListSoundDurations",Desc="ListSoundDurations")
   ManualAutoCompleteList(62)=(Command="PlaySoundCue",Desc="PlaySoundCue (Lists a summary of loaded sound collated by class)")
   ManualAutoCompleteList(63)=(Command="PlaySoundWave",Desc="PlaySoundWave")
   ManualAutoCompleteList(64)=(Command="SetSoundMode",Desc="SetSoundMode <ModeName>")
   ManualAutoCompleteList(65)=(Command="DisableLowPassFilter",Desc="DisableLowPassFilter")
   ManualAutoCompleteList(66)=(Command="DisableEQFilter",Desc="DisableEQFilter")
   ManualAutoCompleteList(67)=(Command="IsolateDryAudio",Desc="IsolateDryAudio")
   ManualAutoCompleteList(68)=(Command="IsolateReverb",Desc="IsolateReverb")
   ManualAutoCompleteList(69)=(Command="ResetSoundState",Desc="ResetSoundState (Resets volumes to default and removes test filters)")
   ManualAutoCompleteList(70)=(Command="ModifySoundClass",Desc="ModifySoundClass <SoundClassName> Vol=<new volume>")
   ManualAutoCompleteList(71)=(Command="DisableAllScreenMessages",Desc="Disables all on-screen warnings/messages")
   ManualAutoCompleteList(72)=(Command="EnableAllScreenMessages",Desc="Enables all on-screen warnings/messages")
   ManualAutoCompleteList(73)=(Command="ToggleAllScreenMessages",Desc="Toggles display state of all on-screen warnings/messages")
   ManualAutoCompleteList(74)=(Command="CaptureMode",Desc="Toggles display state of all on-screen warnings/messages")
   ManualAutoCompleteList(75)=(Command="ShowDebug NET")
   ManualAutoCompleteList(76)=(Command="ShowDebug PHYSICS")
   ManualAutoCompleteList(77)=(Command="ShowDebug COLLISION")
   ManualAutoCompleteList(78)=(Command="ShowDebug AI")
   ManualAutoCompleteList(79)=(Command="ShowDebug CAMERA")
   ManualAutoCompleteList(80)=(Command="ShowDebug WEAPON")
   ManualAutoCompleteList(81)=(Command="ShowDebug ANIMATION")
   ManualAutoCompleteList(82)=(Command="ShowDebug INPUT")
   ManualAutoCompleteList(83)=(Command="memleakcheck")
   ManualAutoCompleteList(84)=(Command="togglehdwarning")
   ManualAutoCompleteList(85)=(Command="Stat SOUNDWAVES",Desc="Stat SOUNDWAVES (Shows active SoundWaves)")
   ManualAutoCompleteList(86)=(Command="Stat SOUNDCUES",Desc="Stat SOUNDCUES (Shows active SoundCues)")
   ManualAutoCompleteList(87)=(Command="Stat SOUNDS",Desc="Stat SOUNDS <?> <sort=distance|class|name|waves|default> <-debug> <off> (Shows active SoundCues and SoundWaves)")
   ManualAutoCompleteList(88)=(Command="STARTMOVIECAPTURE",Desc="STARTMOVIECAPTURE")
   ManualAutoCompleteList(89)=(Command="STOPMOVIECAPTURE",Desc="STOPMOVIECAPTURE")
   ManualAutoCompleteList(90)=(Command="DoMemLeakChecking 30",Desc="Sets a timer to do a MemLeakCheck every N seconds")
   ManualAutoCompleteList(91)=(Command="StopMemLeakChecking",Desc="Stops the periodic MemLeakCheck that was started via DoMemLeakChecking")
   __OnReceivedNativeInputKey__Delegate=Default__Console.InputKey
   __OnReceivedNativeInputChar__Delegate=Default__Console.InputChar
   Name="Default__Console"
   ObjectArchetype=Interaction'Engine.Default__Interaction'
}
