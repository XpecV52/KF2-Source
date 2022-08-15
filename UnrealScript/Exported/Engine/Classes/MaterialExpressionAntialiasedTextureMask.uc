/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionAntialiasedTextureMask extends MaterialExpressionTextureSampleParameter2D
	native(Material);

var() float	Threshold <UIMin=0.0 | UIMax=1.0 | ClampMin=0.0 | ClampMax=1.0>;
var() enum ETextureColorChannel
{
	TCC_Red,
	TCC_Green,
	TCC_Blue,
	TCC_Alpha
} Channel;

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
   Threshold=0.500000
   Channel=TCC_Alpha
   MenuCategories(0)="HighLevel"
   MenuCategories(1)=()
   Outputs(0)=(MaskG=0,MaskB=0)
   Outputs(1)=()
   Outputs(2)=()
   Outputs(3)=()
   Outputs(4)=()
   Name="Default__MaterialExpressionAntialiasedTextureMask"
   ObjectArchetype=MaterialExpressionTextureSampleParameter2D'Engine.Default__MaterialExpressionTextureSampleParameter2D'
}
