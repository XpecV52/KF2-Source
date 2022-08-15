/**
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class ScriptedTexture extends TextureRenderTarget2D
	native(Texture);

/** whether the texture needs to be redrawn. Render() will be called at the end of the tick, just before all other rendering. */
var transient bool bNeedsUpdate;

/** whether or not to clear the texture before the next call of the Render delegate  */
var transient bool bSkipNextClear;

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

/**
 * Called whenever bNeedsUpdate is true to update the texture. The texture is cleared to ClearColor prior to calling this function 
 * (unless bSkipNextClear is set to true).
 * bNeedsUpdate is reset before calling this function, so you can set it to true here to get another update next tick.
 * bSkipNextClear is reset to false before calling this function, so set it to true here whenever you want the next clear to be skipped
 */
delegate Render(Canvas C);

defaultproperties
{
   AddressX=TA_Clamp
   AddressY=TA_Clamp
   bNeedsTwoCopies=False
   Name="Default__ScriptedTexture"
   ObjectArchetype=TextureRenderTarget2D'Engine.Default__TextureRenderTarget2D'
}
