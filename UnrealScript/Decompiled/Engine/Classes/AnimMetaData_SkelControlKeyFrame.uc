/*******************************************************************************
 * AnimMetaData_SkelControlKeyFrame generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AnimMetaData_SkelControlKeyFrame extends AnimMetaData_SkelControl
    native(Anim)
    editinlinenew
    collapsecategories
    hidecategories(Object);

/** Modifiers for what time and what strength for this skelcontrol */
var() editinline array<editinline TimeModifier> KeyFrames;

defaultproperties
{
    bFullControlOverController=false
}