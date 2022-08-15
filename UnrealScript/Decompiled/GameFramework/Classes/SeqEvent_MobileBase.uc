/*******************************************************************************
 * SeqEvent_MobileBase generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SeqEvent_MobileBase extends SequenceEvent
    abstract
    native
    forcescriptorder(true)
    hidecategories(Object);

event RegisterEvent()
{
    local WorldInfo WI;
    local GamePlayerController GPC;
    local MobilePlayerInput MPI;

    WI = Class'WorldInfo'.static.GetWorldInfo();
    if(WI != none)
    {
        foreach WI.LocalPlayerControllers(Class'GamePlayerController', GPC)
        {
            MPI = MobilePlayerInput(GPC.PlayerInput);
            if(MPI != none)
            {
                AddToMobileInput(MPI);
                break;
            }            
        }        
    }
}

event AddToMobileInput(MobilePlayerInput MPI)
{
    MPI.AddKismetEventHandler(self);
}

defaultproperties
{
    MaxTriggerCount=0
}