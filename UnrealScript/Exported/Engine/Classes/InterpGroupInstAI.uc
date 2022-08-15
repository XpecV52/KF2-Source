/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class InterpGroupInstAI extends InterpGroupInst
	native(Interpolation);

/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * 
 * An instance of an InterpGroup for a particular Actor. There may be multiple InterpGroupInsts for a single
 * InterpGroup in the InterpData, if multiple Actors are connected to the same InterpGroup. 
 * The Outer of an InterpGroupInst is the SeqAct_Interp
 */

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

/** Cache data to AIGroup **/
var transient InterpGroupAI AIGroup;

/** Saved Physics state to go back to **/
var EPhysics  	SavedPhysics;
var bool        bSavedNoEncroachCheck;
var bool		bSavedCollideActors;
var bool		bSavedBlockActors;

/** Preview Pawn for only editor - in game it should be AI **/
var   editoronly transient Pawn PreviewPawn;

/** Stage Mark Actor - from StageMark Group **/
var transient Actor   StageMarkActor;

defaultproperties
{
   Name="Default__InterpGroupInstAI"
   ObjectArchetype=InterpGroupInst'Engine.Default__InterpGroupInst'
}
