/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class AnimObject extends Object
	native(Anim)
	hidecategories(Object)
	abstract;

/** For editor use. */
var	editoronly int									DrawWidth;

/** for editor use  */
var editoronly int									DrawHeight;

/** for editor use. */
var	editoronly int									NodePosX;

/** For editor use. */
var editoronly int									NodePosY;

/** for editor use. */
var editoronly int									OutDrawY;

/**
 * Editor category for this object.  Determines which animtree submenu this object
 * should be placed in
 */
var editoronly string 					CategoryDesc;

/** SkeletalMeshComponent owner */
var const transient	duplicatetransient SkeletalMeshComponent SkelComponent;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   Name="Default__AnimObject"
   ObjectArchetype=Object'Core.Default__Object'
}
