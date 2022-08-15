//=============================================================================
// KFAnimSeq_ByWeaponClass
//=============================================================================
// AnimNodeSequence which chooses an animation based on the equipped weapon
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
// Based on GearAnim_SequenceByWeaponClass 
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class KFAnimSeq_ByWeaponClass extends AnimNodeSequence
	deprecated
	native(Anim);

struct native WeaponClassNameInfo
{
	/** Weapon class */
	var() Class<KFWeapon> WeaponClass<AllowAbstract>;
	/** Animation to use */
	var() Name AnimName;
};

/** List of weapons, class and animation name.*/
var() Array<WeaponClassNameInfo> WeaponList;

/** Default, when no match can be made, or weapon is holstered */
var() Name  WeaponDefaultAnimName;

/** When moving the slider, keep nodes with same property in sync. */
var() bool	bSynchronizeNodesInEditor;

/** Slider position for weapon list */
var editoronly const FLOAT WeaponListSliderPosition;

/** Internal cached pointer to GearPawn Owner */
var const	transient	Pawn		PawnOwner;
/** Internal cached pointer to owner's weapon */
var const	transient	Weapon		CurrentWeapon;
/** Cached bool to track holstering changes */
var const   transient   bool        bTemporaryHolster;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   bSynchronizeNodesInEditor=True
   Name="Default__KFAnimSeq_ByWeaponClass"
   ObjectArchetype=AnimNodeSequence'Engine.Default__AnimNodeSequence'
}
