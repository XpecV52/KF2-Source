/*******************************************************************************
 * PlayerCollectorGame generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PlayerCollectorGame extends GameInfo
    config(Game)
    hidecategories(Navigation,Movement,Collision);

var int NumberOfClientsToWaitFor;
var string URLToLoad;

event PlayerController Login(string Portal, string Options, const UniqueNetId UniqueId, out string ErrorMessage)
{
    local PlayerController PC;

    PC = super.Login(Portal, Options, UniqueId, ErrorMessage);
    if(PC == none)
    {
        return none;
    }
    if(NumberOfClientsToWaitFor == 0)
    {
        NumberOfClientsToWaitFor = GetIntOption(Options, "NumClients", 1);
        URLToLoad = ParseOption(Options, "SubMap");
        URLToLoad = (URLToLoad $ "?game=") $ (ParseOption(Options, "SubGame"));        
    }
    else
    {
        -- NumberOfClientsToWaitFor;
    }
    if(NumberOfClientsToWaitFor == 0)
    {
        LogInternal("SEAMLESS TRAVELING TO " $ URLToLoad);
        WorldInfo.SeamlessTravel(URLToLoad, true);
    }
    return PC;
}

event GetSeamlessTravelActorList(bool bToEntry, out array<Actor> ActorList);
