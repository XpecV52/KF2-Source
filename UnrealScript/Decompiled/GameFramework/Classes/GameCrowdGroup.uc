/*******************************************************************************
 * GameCrowdGroup generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GameCrowdGroup extends Object
    native;

var array<GameCrowdAgent> Members;

function AddMember(GameCrowdAgent Agent)
{
    Members[Members.Length] = Agent;
    Agent.MyGroup = self;
}

function RemoveMember(GameCrowdAgent Agent)
{
    Members.RemoveItem(Agent;
    Agent.MyGroup = none;
}

function UpdateDestinations(GameCrowdDestination NewDestination)
{
    local int I;

    I = 0;
    J0x0B:

    if(I < Members.Length)
    {
        if((Members[I] != none) && Members[I].CurrentDestination != NewDestination)
        {
            Members[I].SetCurrentDestination(NewDestination);
            Members[I].UpdateIntermediatePoint();
        }
        ++ I;
        goto J0x0B;
    }
}
