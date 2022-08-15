/**
 * This class handles hotkey binding management for the editor.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class UnrealEdKeyBindings extends Object
	Config(EditorKeyBindings)
	native;

/** An editor hotkey binding to a parameterless exec. */
struct native EditorKeyBinding
{
	var bool bCtrlDown;
	var bool bAltDown;
	var bool bShiftDown;
	var name Key;
	var name CommandName;
};

/** An editor hotkey binding used to spawn an actor when clicking with the left mouse. */
struct native QuickActorKeyBinding
{
	var bool bCtrlDown;
	var bool bAltDown;
	var bool bShiftDown;
	var name Key;
	var name ActorClassName;
};

/** Array of keybindings */
var config array<EditorKeyBinding> KeyBindings;

/** Array of quick actor bindings. These actors will be spawned when the associated key is held down during a left mouse click provided the key was not already handled by another action. */
var config array<QuickActorKeyBinding> QuickActorKeyBindings;

defaultproperties
{
   KeyBindings(0)=(Key="J",CommandName="Matinee_PlayReverse")
   KeyBindings(1)=(Key="K",CommandName="Matinee_Stop")
   KeyBindings(2)=(Key="L",CommandName="Matinee_PlayForward")
   KeyBindings(3)=(Key="SpaceBar",CommandName="Matinee_TogglePlayPause")
   KeyBindings(4)=(Key="Delete",CommandName="Matinee_DeleteSelection")
   KeyBindings(5)=(Key="Add",CommandName="Matinee_ZoomIn")
   KeyBindings(6)=(Key="Subtract",CommandName="Matinee_ZoomOut")
   KeyBindings(7)=(Key="Equals",CommandName="Matinee_ZoomInAlt")
   KeyBindings(8)=(Key="Underscore",CommandName="Matinee_ZoomOutAlt")
   KeyBindings(9)=(bCtrlDown=True,Key="Z",CommandName="Matinee_Undo")
   KeyBindings(10)=(bCtrlDown=True,Key="Y",CommandName="Matinee_Redo")
   KeyBindings(11)=(Key="I",CommandName="Matinee_MarkInSection")
   KeyBindings(12)=(Key="O",CommandName="Matinee_MarkOutSection")
   KeyBindings(13)=(Key="Right",CommandName="Matinee_IncrementPosition")
   KeyBindings(14)=(Key="Left",CommandName="Matinee_DecrementPosition")
   KeyBindings(15)=(bShiftDown=True,Key="Right",CommandName="Matinee_MoveToNextKey")
   KeyBindings(16)=(bShiftDown=True,Key="Left",CommandName="Matinee_MoveToPrevKey")
   KeyBindings(17)=(Key="R",CommandName="Matinee_SplitAnimKey")
   KeyBindings(18)=(Key="S",CommandName="Matinee_ToggleSnap")
   KeyBindings(19)=(Key="Up",CommandName="Matinee_MoveActiveUp")
   KeyBindings(20)=(Key="Down",CommandName="Matinee_MoveActiveDown")
   KeyBindings(21)=(Key="Enter",CommandName="Matinee_AddKey")
   KeyBindings(22)=(bCtrlDown=True,Key="W",CommandName="Matinee_DuplicateSelectedKeys")
   KeyBindings(23)=(bCtrlDown=True,Key="I",CommandName="Matinee_CropAnimationBeginning")
   KeyBindings(24)=(bCtrlDown=True,Key="O",CommandName="Matinee_CropAnimationEnd")
   KeyBindings(25)=(bCtrlDown=True,Key="C",CommandName="Matinee_Copy")
   KeyBindings(26)=(bCtrlDown=True,Key="X",CommandName="Matinee_Cut")
   KeyBindings(27)=(bCtrlDown=True,Key="V",CommandName="Matinee_Paste")
   KeyBindings(28)=(Key="A",CommandName="Matinee_ViewFitSequence")
   KeyBindings(29)=(Key="F",CommandName="Matinee_ViewFitToSelected")
   KeyBindings(30)=(bShiftDown=True,Key="A",CommandName="Matinee_ViewFitLoop")
   KeyBindings(31)=(bCtrlDown=True,Key="A",CommandName="Matinee_ViewFitLoopSequence")
   KeyBindings(32)=(Key="E",CommandName="Matinee_ViewEndOfTrack")
   KeyBindings(33)=(Key="one",CommandName="Matinee_ChangeKeyInterpModeAUTO")
   KeyBindings(34)=(Key="two",CommandName="Matinee_ChangeKeyInterpModeUSER")
   KeyBindings(35)=(Key="three",CommandName="Matinee_ChangeKeyInterpModeBREAK")
   KeyBindings(36)=(Key="four",CommandName="Matinee_ChangeKeyInterpModeLINEAR")
   KeyBindings(37)=(Key="five",CommandName="Matinee_ChangeKeyInterpModeCONSTANT")
   KeyBindings(38)=(Key="one",CommandName="CurveEditor_ChangeInterpModeAUTO")
   KeyBindings(39)=(Key="two",CommandName="CurveEditor_ChangeInterpModeUSER")
   KeyBindings(40)=(Key="three",CommandName="CurveEditor_ChangeInterpModeBREAK")
   KeyBindings(41)=(Key="four",CommandName="CurveEditor_ChangeInterpModeLINEAR")
   KeyBindings(42)=(Key="five",CommandName="CurveEditor_ChangeInterpModeCONSTANT")
   KeyBindings(43)=(Key="A",CommandName="CurveEditor_FitViewToAll")
   KeyBindings(44)=(bShiftDown=True,Key="A",CommandName="CurveEditor_FitViewHorizontally")
   KeyBindings(45)=(bCtrlDown=True,Key="A",CommandName="CurveEditor_FitViewVertically")
   KeyBindings(46)=(Key="F",CommandName="CurveEditor_FitViewToSelected")
   Name="Default__UnrealEdKeyBindings"
   ObjectArchetype=Object'Core.Default__Object'
}
