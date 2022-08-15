class InterpGroupAI extends InterpGroup
	native(Interpolation)
	collapsecategories
	hidecategories(Object);

/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * Group for controlling properties of a 'player' in the game. This includes switching the player view between different cameras etc.
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

/** 
 *	Preview Pawn class for this track 
 */
var()   editoronly class<Pawn>                      PreviewPawnClass;

/**
 * Name of Stage Mark Group - used for locator
 */
var()   Name                            StageMarkGroup;

/** Snap AI to root bone location when finished **/
var() bool  SnapToRootBoneLocationWhenFinished;

/** Disable Collision Check when initializing first time**/
var() bool  bNoEncroachmentCheck;
/** Disable World Collision during Matinee**/
var() bool  bDisableWorldCollision;
/** Ignore old legacy height adjust for pawn - TODO: REMOVE THIS BEFORE 2012 **/
var() bool	bIgnoreLegacyHeightAdjust;

/** Editor only variable to mark dirty for instance to update when needed**/
var editoronly transient bool bRecreatePreviewPawn;
var editoronly transient bool bRefreshStageMarkGroup;

defaultproperties
{
   GroupName="AIGroup"
   Name="Default__InterpGroupAI"
   ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
}
