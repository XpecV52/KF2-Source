/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 *	A material expression that routes particle emitter parameters to the
 *	material.
 */
class MaterialExpressionDynamicParameter extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** 
 *	The names of the parameters.
 *	These will show up in Cascade when editing a particle system
 *	that uses the material it is in...
 */
var()	editfixedsize	array<string>	ParamNames;

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

defaultproperties
{
   ParamNames(0)="Param1"
   ParamNames(1)="Param2"
   ParamNames(2)="Param3"
   ParamNames(3)="Param4"
   bShowOutputNameOnPin=True
   bHidePreviewWindow=True
   MenuCategories(0)="Particles"
   MenuCategories(1)="Parameters"
   Outputs(0)=(Mask=1,MaskR=1)
   Outputs(1)=(Mask=1,MaskG=1)
   Outputs(2)=(Mask=1,MaskB=1)
   Outputs(3)=(Mask=1,MaskA=1)
   Name="Default__MaterialExpressionDynamicParameter"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
