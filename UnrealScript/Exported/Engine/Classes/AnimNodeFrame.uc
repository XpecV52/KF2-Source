/**
 * This class is used for rendering a box around a group of kismet objects in the kismet editor, for organization
 * and clarity.  Corresponds to a "comment box" in the kismet editor.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class AnimNodeFrame extends AnimObject
	native(Anim);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Horizontal size of comment box in pixels. */
var()	int			SizeX;

/** Vertical size of comment box in pixels. */
var()	int			SizeY;

/** Width of border of comment box in pixels. */
var()	int			BorderWidth;

/** Should we draw a box for this comment object, or leave it just as text. */
var()	bool		bDrawBox;

/** If we are drawing a box, should it be filled, or just an outline. */
var()	bool		bFilled;

/** If bDrawBox and bFilled are true, and FillMaterial or FillTexture are true, should be tile it across the box or stretch to fit. */
var()	bool		bTileFill;

/** If we are drawing a box for this comment object, what colour should the border be. */
var()	color		BorderColor;

/** If bDrawBox and bFilled are true, what colour should the background be. */
var()	color		FillColor;

/**
 *	If bDrawBox and bFilled, you can optionally specify a texture to fill the box with.
 *	If both FillTexture and FillMaterial are specified, the FillMaterial will be used.
 */
var()	editoronly	Texture2D	FillTexture;

/**
 *	If bDrawBox and bFilled, you can optionally specify a material to fill the box with.
 *	If both FillTexture and FillMaterial are specified, the FillMaterial will be used.
 */
var()	editoronly	Material	FillMaterial;

var()   editoronly String       ObjComment;

defaultproperties
{
   SizeX=128
   SizeY=64
   BorderWidth=1
   bDrawBox=True
   bFilled=True
   BorderColor=(B=0,G=0,R=0,A=255)
   FillColor=(B=255,G=255,R=255,A=16)
   DrawWidth=128
   DrawHeight=64
   Name="Default__AnimNodeFrame"
   ObjectArchetype=AnimObject'Engine.Default__AnimObject'
}
