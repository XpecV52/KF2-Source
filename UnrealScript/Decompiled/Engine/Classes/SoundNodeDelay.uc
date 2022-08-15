/*******************************************************************************
 * SoundNodeDelay generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SoundNodeDelay extends SoundNode
    native(Sound)
    editinlinenew
    hidecategories(Object,Object);

/** The lower bound of delay time in seconds */
var(Delay) float DelayMin;
/** The upper bound of delay time in seconds */
var(Delay) float DelayMax;
var deprecated RawDistributionFloat DelayDuration;
