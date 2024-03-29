/**
 * Copyright 1998-2012 Epic Games, Inc. All Rights Reserved.
 */
class DrawTaperedCapsuleComponent extends PrimitiveComponent
	native
	noexport
	collapsecategories
	hidecategories(Object)
	editinlinenew;

var()	color			CapsuleColor;
var()	material		CapsuleMaterial;
var()	float			CapsuleHeight;
var()	float			CapsuleRadius;
var()	float			CapsuleTopRadius;
var()	bool			bDrawWireCapsule;
var()	bool			bDrawLitCapsule;
var()	bool			bDrawOnlyIfSelected;

defaultproperties
{
   CapsuleColor=(B=0,G=0,R=255,A=255)
   CapsuleHeight=200.000000
   CapsuleRadius=200.000000
   CapsuleTopRadius=100.000000
   bDrawWireCapsule=True
   ReplacementPrimitive=None
   HiddenGame=True
   Name="Default__DrawTaperedCapsuleComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
