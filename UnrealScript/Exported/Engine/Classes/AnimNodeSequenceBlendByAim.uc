/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class AnimNodeSequenceBlendByAim extends AnimNodeSequenceBlendBase
	native(Anim)
	hidecategories(Animations);

/** Angle of aiming, between -1..+1 */
var()	Vector2d	Aim;
/** Keep track if aim changed to force an update of the node */
var transient const	Vector2d PreviousAim;
var()	Vector2d	HorizontalRange;
var()	Vector2d	VerticalRange;

/** Angle offset applied to Aim before processing */
var()	Vector2d	AngleOffset;

//
// Animations
//

// Left
var()	Name	AnimName_LU;
var()	Name	AnimName_LC;
var()	Name	AnimName_LD;

// Center
var()	Name	AnimName_CU;
var()	Name	AnimName_CC;
var()	Name	AnimName_CD;

// Right
var()	Name	AnimName_RU;
var()	Name	AnimName_RC;
var()	Name	AnimName_RD;

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

/** 
 * Makes sure animations are updated.
 * If you're changing any of the AnimName_XX during game, call this function afterwards. 
 */
native final function CheckAnimsUpToDate();

defaultproperties
{
   HorizontalRange=(X=-1.000000,Y=1.000000)
   VerticalRange=(X=-1.000000,Y=1.000000)
   Name="Default__AnimNodeSequenceBlendByAim"
   ObjectArchetype=AnimNodeSequenceBlendBase'Engine.Default__AnimNodeSequenceBlendBase'
}
