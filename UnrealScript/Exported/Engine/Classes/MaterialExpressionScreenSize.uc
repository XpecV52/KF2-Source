/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionScreenSize extends MaterialExpression
	native(Material);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   MenuCategories(0)="Vectors"
   Outputs(0)=(OutputName="X/Y",Mask=1,MaskR=1,MaskG=1)
   Outputs(1)=(OutputName="X",Mask=1,MaskR=1)
   Outputs(2)=(OutputName="Y",Mask=1,MaskG=1)
   Name="Default__MaterialExpressionScreenSize"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
