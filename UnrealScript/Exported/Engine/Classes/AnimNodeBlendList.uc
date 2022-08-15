/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
// This class of blend node will ramp the 'active' child up to 1.0

class AnimNodeBlendList extends AnimNodeBlendBase
	native(Anim)
	hidecategories(Object);

/** Array of target weights for each child. Size must be the same as the Children array. */
var		array<float>		TargetWeight;

/** How long before current blend is complete (ie. active child reaches 100%) */
var		float				BlendTimeToGo;

/** Child currently active - that is, at or ramping up to 100%. */
var		INT					ActiveChildIndex;

/** Call play anim when active child is changed */
var() bool	bPlayActiveChild;

/**
 * If TRUE (Default), then when the node becomes relevant, the Active Child will be forced to full weight.
 * This is a general optimization, as multiple nodes tend to change state at the same time, this will
 * reduce the maximum number of blends and animation decompression done at the same time.
 * Setting it to FALSE, will let the node interpolate animation normally.
 */
var(Performance) bool	bForceChildFullWeightWhenBecomingRelevant;

/**
 * if TRUE, do not blend when the Skeletal Mesh is not visible.
 * Optimization to save on blending time when meshes are not rendered.
 * Instant switch instead.
 */
var(Performance) bool	bSkipBlendWhenNotRendered;

/** slider position, for animtree editor */
var const	float	SliderPosition;

/** ActiveChildIndex for use in editor only, to debug transitions */
var() editoronly INT EditorActiveChildIndex;

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

native function SetActiveChild( INT ChildIndex, FLOAT BlendTime );

defaultproperties
{
   bForceChildFullWeightWhenBecomingRelevant=True
   bSkipBlendWhenNotRendered=True
   Children(0)=(Name="Child1")
   CategoryDesc="BlendBy"
   Name="Default__AnimNodeBlendList"
   ObjectArchetype=AnimNodeBlendBase'Engine.Default__AnimNodeBlendBase'
}
