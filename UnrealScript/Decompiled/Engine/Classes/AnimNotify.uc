/*******************************************************************************
 * AnimNotify generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AnimNotify extends Object
    abstract
    native(Anim)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var editoronly Color NotifyColor;

simulated function bool FindNextNotifyOfClass(AnimNodeSequence AnimSeqInstigator, class<AnimNotify> NotifyClass, out AnimNotifyEvent OutEvent)
{
    local AnimSequence Seq;
    local int I;
    local bool bFoundThis;

    if(AnimSeqInstigator.AnimSeq != none)
    {
        Seq = AnimSeqInstigator.AnimSeq;
        I = 0;
        J0x57:

        if(I < Seq.Notifies.Length)
        {
            if(Seq.Notifies[I].Notify == self)
            {
                bFoundThis = true;
            }
            if(bFoundThis && ClassIsChildOf(Seq.Notifies[I].Notify.Class, NotifyClass))
            {
                OutEvent = Seq.Notifies[I];
                return true;
            }
            ++ I;
            goto J0x57;
        }
    }
    return false;
}

defaultproperties
{
    NotifyColor=(B=200,G=200,R=255,A=255)
}