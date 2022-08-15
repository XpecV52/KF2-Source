/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * Group for controlling properties of a 'CameraAnim' in the game. Used for CameraAnim Previews
 */
class InterpGroupCamera extends InterpGroup
	native(Interpolation)
	collapsecategories
	hidecategories(Object);

var transient CameraAnim                        CameraAnimInst;

/** 
 *	Preview Pawn class for this track 
 */

struct native CameraPreviewInfo
{
	var()   class<Pawn>                     PawnClass;	
	var()   array<AnimSet>                  PreviewAnimSets;
	var()   name                            AnimSeqName;
	/* for now this is read-only. It has maintenance issue to be resolved if I enable this.*/
	var   editconst vector                Location;
	var   editconst rotator               Rotation;
	/** Pawn Inst - CameraAnimInst doesn't really exist in editor **/
	var     transient Pawn                  PawnInst;
};

// this is interaction property info for CameraAnim
// this information isn't really saved with it
var() editoronly CameraPreviewInfo              Target;
//var() editoronly bool                           EnableInteractionTarget;
//var() editoronly CameraAnim.CameraPreviewInfo   InteractionTarget;

/** When compress, tolerance option **/
var() float                                     CompressTolerance;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Target=(Location=(X=140.000000,Y=0.000000,Z=-40.000000))
   CompressTolerance=5.000000
   Name="Default__InterpGroupCamera"
   ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
}
