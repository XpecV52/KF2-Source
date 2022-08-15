/*******************************************************************************
 * ScriptedTexture generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptedTexture extends TextureRenderTarget2D
    native(Texture)
    hidecategories(Object,Texture);

var transient bool bNeedsUpdate;
var transient bool bSkipNextClear;
var delegate<Render> __Render__Delegate;

delegate Render(Canvas C);

defaultproperties
{
    bNeedsUpdate=true
    AddressX=TextureAddress.TA_Clamp
    AddressY=TextureAddress.TA_Clamp
    bNeedsTwoCopies=false
}