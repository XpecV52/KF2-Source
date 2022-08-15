/*******************************************************************************
 * AnimNotify_PlayFaceFXAnim generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AnimNotify_PlayFaceFXAnim extends AnimNotify_Scripted
    editinlinenew
    collapsecategories
    hidecategories(Object);

/** Reference to FaceFX AnimSet package the animation is in */
var() FaceFXAnimSet FaceFXAnimSetRef;
var() string GroupName;
var() string AnimName;
/** The sound cue to play for the this animation */
var() SoundCue SoundCueToPlay;
/** The sound cue to play for the this animation */
var() AkEvent AkEventToPlay;
/** If a FaceFX animation is already playing, then override if TRUE, skip is FALSE */
var() bool bOverridePlayingAnim;
/** Chance to play. 0 - 1.f */
var() float PlayFrequency;

event Notify(Actor Owner, AnimNodeSequence AnimSeqInstigator)
{
    if(PlayFrequency < 1)
    {
        if(FRand() > PlayFrequency)
        {
            return;
        }        
    }
    else
    {
        if(PlayFrequency > 1)
        {
            LogInternal((((((("Play FaceFX animation from notify" @ string(AnimSeqInstigator.AnimSeqName)) @ "for") @ string(Owner)) @ "GroupName:") @ GroupName) @ "AnimName:") @ AnimName);
            LogInternal(" PlayFrequency > 1.0 is useless. Chance to play valid range is from 0.0 to 1.0.");
        }
    }
    if(Owner != none)
    {
        if(Owner.CanActorPlayFaceFXAnim())
        {
            if(bOverridePlayingAnim || !Owner.IsActorPlayingFaceFXAnim())
            {
                if(Owner.PlayActorFaceFXAnim(FaceFXAnimSetRef, GroupName, AnimName, SoundCueToPlay, AkEventToPlay) == false)
                {
                    LogInternal((((string(AnimSeqInstigator.AnimSeq.Outer) @ "(") @ string(AnimSeqInstigator.AnimSeqName)) @ ")") @ " - PlayFaceFXAnim notifier failed. Verify if this notifier is valid.", 'DevFaceFX');
                }
            }
        }
    }
}

defaultproperties
{
    bOverridePlayingAnim=true
    PlayFrequency=1
}