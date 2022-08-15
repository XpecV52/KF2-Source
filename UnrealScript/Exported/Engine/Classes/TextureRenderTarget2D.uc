/**
 * TextureRenderTarget2D
 *
 * 2D render target texture resource. This can be used as a target
 * for rendering as well as rendered as a regular 2D texture resource.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class TextureRenderTarget2D extends TextureRenderTarget
	native(Texture)
	hidecategories(Object)
	hidecategories(Texture);

/** The width of the texture.												*/
var() const int SizeX;

/** The height of the texture.												*/
var() const int SizeY;

/** The format of the texture data.											*/
var const EPixelFormat Format;

/** the color the texture is cleared to */
var const private LinearColor ClearColor;

/** The addressing mode to use for the X axis.								*/
var() TextureAddress AddressX;

/** The addressing mode to use for the Y axis.								*/
var() TextureAddress AddressY;

/** True to force linear gamma space for this render target */
var() const transient bool bForceLinearGamma;


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

/** creates and initializes a new TextureRenderTarget2D with the requested settings */
static native noexport final function TextureRenderTarget2D Create(int InSizeX, int InSizeY, optional EPixelFormat InFormat = PF_A8R8G8B8, optional LinearColor InClearColor, optional bool bOnlyRenderOnce );

defaultproperties
{
   Format=PF_A8R8G8B8
   ClearColor=(R=0.000000,G=1.000000,B=0.000000,A=1.000000)
   Name="Default__TextureRenderTarget2D"
   ObjectArchetype=TextureRenderTarget'Engine.Default__TextureRenderTarget'
}
