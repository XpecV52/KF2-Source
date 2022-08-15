/*******************************************************************************
 * SoundNodeLooping generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SoundNodeLooping extends SoundNode
    native(Sound)
    editinlinenew
    hidecategories(Object,Object);

var(Looping) bool bLoopIndefinitely;
/** The lower bound of number of times to loop */
var(Looping) float LoopCountMin;
/** The upper bound of number of times to loop */
var(Looping) float LoopCountMax;
var deprecated RawDistributionFloat LoopCount;

defaultproperties
{
    bLoopIndefinitely=true
    LoopCountMin=1000000
    LoopCountMax=1000000
}