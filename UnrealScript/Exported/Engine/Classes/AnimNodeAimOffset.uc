/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class AnimNodeAimOffset extends AnimNodeBlendBase
	native(Anim)
	hidecategories(Object);

/**
 * 9 control points range:
 *
 * Left	Center	Right
 *
 * LU	CU		RU		Up
 * LC	CC		RC		Center
 * LD	CD		RD		Down
 */
struct immutablewhencooked native AimTransform
{
	var()	Quat	Quaternion;
	var()	Vector	Translation;
};


/**
 * definition of an AimComponent.
 */
struct immutablewhencooked native AimComponent
{
	/** Bone transformed */
	var()	Name			BoneName;

	/** Left column */
	var()	AimTransform	LU;
	var()	AimTransform	LC;
	var()	AimTransform	LD;

	/** Center */
	var()	AimTransform	CU;
	var()	AimTransform	CC;
	var()	AimTransform	CD;

	/** Right */
	var()	AimTransform	RU;
	var()	AimTransform	RC;
	var()	AimTransform	RD;
};



/** Handy enum for working with directions. */
enum EAnimAimDir
{
	ANIMAIM_LEFTUP,
	ANIMAIM_CENTERUP,
	ANIMAIM_RIGHTUP,
	ANIMAIM_LEFTCENTER,
	ANIMAIM_CENTERCENTER,
	ANIMAIM_RIGHTCENTER,
	ANIMAIM_LEFTDOWN,
	ANIMAIM_CENTERDOWN,
	ANIMAIM_RIGHTDOWN
};

/** Convert Aim(X,Y) into a an enum that we use for blending into the main loop. */
enum EAimID
{
	EAID_LeftUp,
	EAID_LeftDown,
	EAID_RightUp,
	EAID_RightDown,
	EAID_ZeroUp,
	EAID_ZeroDown,
	EAID_ZeroLeft,
	EAID_ZeroRight,
	EAID_CellLU,
	EAID_CellCU,
	EAID_CellRU,
	EAID_CellLC,
	EAID_CellCC,
	EAID_CellRC,
	EAID_CellLD,
	EAID_CellCD,
	EAID_CellRD,
};

/** Angle of aiming, between -1..+1 */
var()	Vector2d		Aim;

/** Angle offset applied to Aim before processing */
var()	Vector2d		AngleOffset;

/** If true, ignore Aim, and use the ForcedAimDir enum instead to determine which aim direction to draw. */
var()	bool			bForceAimDir;

/** If the LOD of this skeletal mesh is at or above this LOD, then this node will do nothing. */
var(Performance)	int				PassThroughAtOrAboveLOD;

/** If bForceAimDir is true, this is the direction to render the character aiming in. */
var()	EAnimAimDir		ForcedAimDir;

/** Internal, array of required bones. Selected bones and their parents for local to component space transformation. */
var	transient	Array<byte>	RequiredBones;
/** Look Up Table for AimCpnt Indices */
var transient	Array<byte>	AimCpntIndexLUT;

/** 
 *	Pointer to AimOffset node in package (AnimTreeTemplate), to avoid duplicating profile data. 
 *	Always NULL in AimOffset Editor (in ATE).
 */
var	transient AnimNodeAimOffset	TemplateNode;

/** Bake offsets from animations. */
var()	bool			bBakeFromAnimations;

struct immutablewhencooked native AimOffsetProfile
{
	/** Name of this aim-offset profile. */
	var()	const editconst name	ProfileName;

	/** Maximum horizontal range (min, max) for horizontal aiming. */
	var()	Vector2d				HorizontalRange;

	/** Maximum horizontal range (min, max) for vertical aiming. */
	var()	Vector2d				VerticalRange;

	/**
	 * Array of AimComponents.
	 * Represents the selected bones and their transformations.
	 */
	var		Array<AimComponent>		AimComponents;

	/**
	 *	Names of animations to use when automatically generating offsets based animations for each direction.
	 *	Animations are not actually used in-game - just for editor.
	 */
	var()	Name	AnimName_LU;
	var()	Name	AnimName_LC;
	var()	Name	AnimName_LD;
	var()	Name	AnimName_CU;
	var()	Name	AnimName_CC;
	var()	Name	AnimName_CD;
	var()	Name	AnimName_RU;
	var()	Name	AnimName_RC;
	var()	Name	AnimName_RD;

	structdefaultproperties
	{
		ProfileName="Default"
		HorizontalRange=(X=-1,Y=+1)
		VerticalRange=(X=-1,Y=+1)
	}
};

/** Array of different aiming 'profiles' */
var()	editfixedsize array<AimOffsetProfile>		Profiles;

/**
 *	Index of currently active Profile.
 *	Use the SetActiveProfileByName or SetActiveProfileByIndex function to change.
*/
var()	const editconst int			CurrentProfileIndex;

/** 
 * if TRUE, pass through (skip additive animation blending) when mesh is not rendered
 */
var(Performance) bool	bPassThroughWhenNotRendered;
/** When moving the slider, keep nodes with same property in sync. */
var(Editor)	bool	bSynchronizeNodesInEditor;

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

/**
 *	Change the currently active profile to the one with the supplied name.
 *	If a profile with that name does not exist, this does nothing.
 */
native function SetActiveProfileByName(name ProfileName);

/**
 *	Change the currently active profile to the one with the supplied index.
 *	If ProfileIndex is outside range, this does nothing.
 */
native function SetActiveProfileByIndex(int ProfileIndex);

defaultproperties
{
   bSynchronizeNodesInEditor=True
   PassThroughAtOrAboveLOD=1000
   ForcedAimDir=ANIMAIM_CENTERCENTER
   Children(0)=(Name="Input",Weight=1.000000)
   bFixNumChildren=True
   Name="Default__AnimNodeAimOffset"
   ObjectArchetype=AnimNodeBlendBase'Engine.Default__AnimNodeBlendBase'
}
