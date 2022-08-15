/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ArrowComponent extends PrimitiveComponent
	native
	noexport
	collapsecategories
	hidecategories(Object)
	editinlinenew;

var() color					ArrowColor;
var() float					ArrowSize;
/** If TRUE, don't show the arrow when SHOW_Sprites is disabled. */
var() bool					bTreatAsASprite;

/** Sprite category that the arrow component belongs to, if being treated as a sprite. Value serves as a key into the localization file. */
var editoronly name SpriteCategoryName;

defaultproperties
{
   ArrowColor=(B=0,G=0,R=255,A=255)
   ArrowSize=1.000000
   SpriteCategoryName="Misc"
   ReplacementPrimitive=None
   HiddenGame=True
   AlwaysLoadOnClient=False
   AlwaysLoadOnServer=False
   Name="Default__ArrowComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
