/**
 * Base class for all Kismet related objects.
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SequenceObject extends Object
	native(Sequence)
	abstract
	hidecategories(Object)
	forcescriptorder( TRUE );

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Class vs instance version, for offering updates in the Kismet editor */
var const			int	ObjInstanceVersion;

/** Sequence that contains this object */
var const noimport Sequence ParentSequence;

/** Visual position of this object within a sequence */
var editoronly int ObjPosX, ObjPosY;

/** Text label that describes this object */
var	string ObjName;

/**
 * Editor category for this object.  Determines which kismet submenu this object
 * should be placed in
 */
var editoronly string ObjCategory;

/** List of games that do not want to display this object */
var editoronly array<string> ObjRemoveInProject;

/** Color used to draw the object */
var editoronly color ObjColor;

/** User editable text comment */
var() string ObjComment<MultilineWithMaxRows=5>;

/** Whether or not this object is deletable. */
var		bool					bDeletable;

/** Should this object be drawn in the first pass? */
var		bool					bDrawFirst;

/** Should this object be drawn in the last pass? */
var		bool					bDrawLast;

/** Cached drawing dimensions */
var		int						DrawWidth, DrawHeight;

/** Should this object display ObjComment when activated? */
var()	bool					bOutputObjCommentToScreen;

/** Should we suppress the 'auto' comment text - values of properties flagged with the 'autocomment' metadata string. */
var()	bool					bSuppressAutoComment;

/** Pointer to our PIE runtime sequence object for runtime kismet debugging.*/
var transient nontransactional editoronly SequenceObject PIESequenceObject;

/** Writes out the specified text to a dedicated scripting log file.
 * @param LogText the text to print
 * @param bWarning true if this is a warning message.
 * 	Warning messages are also sent to the normal game log and appear onscreen if Engine's configurable bOnScreenKismetWarnings is true
 */
native final function ScriptLog(string LogText, optional bool bWarning = true);

/** Returns the current world's WorldInfo, useful for spawning actors and such. */
native final function WorldInfo GetWorldInfo();

/**
 * Determines whether this class should be displayed in the list of available ops in the level kismet editor.
 *
 * @return	TRUE if this sequence object should be available for use in the level kismet editor
 */
event bool IsValidLevelSequenceObject()
{
	return true;
}

/**
 * Determines whether objects of this class are allowed to be pasted into level sequences.
 *
 * @return	TRUE if this sequence object can be pasted into level sequences.
 */
event bool IsPastingIntoLevelSequenceAllowed()
{
	return IsValidLevelSequenceObject();
}

/**
 * Determines whether objects of this class should clear their names when pasting into a level sequence.  
 * NOTE: If not done errors with subojects can happen from copy/paste
 *
 * @return	TRUE if this sequence object should have its name cleared when pasted into level sequences.
 */
event bool ShouldClearNameOnPasting()
{
	return true;
}

/**
 * Return the version number for this class.  Child classes should increment this method by calling Super then adding
 * a individual class version to the result.  When a class is first created, the number should be 0; each time one of the
 * link arrays is modified (VariableLinks, OutputLinks, InputLinks, etc.), the number that is added to the result of
 * Super.GetObjClassVersion() should be incremented by 1.
 *
 * @return	the version number for this specific class.
 */
static event int GetObjClassVersion()
{
	return 1;
}

defaultproperties
{
   ObjName="Undefined"
   ObjColor=(B=255,G=255,R=255,A=255)
   bDeletable=True
   bSuppressAutoComment=True
   Name="Default__SequenceObject"
   ObjectArchetype=Object'Core.Default__Object'
}
