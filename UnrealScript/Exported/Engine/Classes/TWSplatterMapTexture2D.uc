//=============================================================================
// TWSplatterMapTexture2D
//=============================================================================
// Class that stores the splatter texture data
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 6/27/2013
//=============================================================================

class TWSplatterMapTexture2D extends Texture2D
	native
	noexport
	hidecategories(Object);

var array<byte> SystemMemoryCache;
var bool bDirty;	

defaultproperties
{
   LODGroup=TEXTUREGROUP_Splattermap
   Name="Default__TWSplatterMapTexture2D"
   ObjectArchetype=Texture2D'Engine.Default__Texture2D'
}
