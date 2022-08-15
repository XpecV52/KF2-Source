/*******************************************************************************
 * KFGFxPostGameContainer_TeamAwards generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxPostGameContainer_TeamAwards extends KFGFxObject_Container within GFxMoviePlayer;

var const localized string NoTeamAwardsGivenString;
var const localized string TeamAwardsString;
var const localized string PersonalBestsString;
var GFxObject NoAwardsTextField;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    LocalizeText();
    NoAwardsTextField = GetObject("noAwardsTextField");
    SendTeamAwards();
    SendPersonalBests();
}

function LocalizeText()
{
    local GFxObject TextObject;

    TextObject = Outer.CreateObject("Object");
    TextObject.SetString("noAwards", NoTeamAwardsGivenString);
    TextObject.SetString("teamAwards", TeamAwardsString);
    TextObject.SetString("personalBests", PersonalBestsString);
    SetObject("localizedText", TextObject);
}

function SendPersonalBests()
{
    local GFxObject ObjectArray, TeamAWard;
    local KFPlayerController KFPC;
    local int I;
    local EphemeralMatchStats StatCollector;
    local array<AARAward> PersonalBests;

    KFPC = KFPlayerController(Outer.GetPC());
    if(KFPC == none)
    {
        return;
    }
    StatCollector = KFPC.MatchStats;
    StatCollector.GetPersonalBests(PersonalBests);
    ObjectArray = Outer.CreateArray();
    I = 0;
    J0xC7:

    if(I < PersonalBests.Length)
    {
        TeamAWard = Outer.CreateObject("Object");
        TeamAWard.SetString("stat", Localize("EphemeralMatchStats", PersonalBests[I].TitleIdentifier, "KFGame"));
        TeamAWard.SetString("icon", "img://" $ string(PersonalBests[I].IconPath));
        TeamAWard.SetBool("highLight", PersonalBests[I].bHighLight);
        TeamAWard.SetString("statValue", string(PersonalBests[I].DisplayValue) @ (Localize("EphemeralMatchStats", PersonalBests[I].ValueIdentifier, "KFGame")));
        ObjectArray.SetElementObject(I, TeamAWard);
        ++ I;
        goto J0xC7;
    }
    SetObject("personalBests", ObjectArray);
}

function SendTeamAwards()
{
    local GFxObject ObjectArray, TeamAWard;
    local KFPlayerController KFPC;
    local int I, ItemCount;
    local EphemeralMatchStats StatCollector;

    KFPC = KFPlayerController(Outer.GetPC());
    if(KFPC == none)
    {
        return;
    }
    StatCollector = KFPC.MatchStats;
    ObjectArray = Outer.CreateArray();
    ItemCount = 0;
    I = 0;
    J0xAA:

    if(I < StatCollector.TeamAwardList.Length)
    {
        if(StatCollector.TeamAwardList[I].PRI != none)
        {
            TeamAWard = Outer.CreateObject("Object");
            TeamAWard.SetString("playerName", StatCollector.TeamAwardList[I].PRI.PlayerName);
            TeamAWard.SetString("stat", Localize("EphemeralMatchStats", StatCollector.TeamAwardList[I].TitleIdentifier, "KFGame"));
            TeamAWard.SetString("icon", "img://" $ string(StatCollector.TeamAwardList[I].IconPath));
            TeamAWard.SetString("statValue", string(StatCollector.TeamAwardList[I].DisplayValue) @ (Localize("EphemeralMatchStats", StatCollector.TeamAwardList[I].ValueIdentifier, "KFGame")));
            ObjectArray.SetElementObject(ItemCount, TeamAWard);
            ++ ItemCount;            
        }
        else
        {
            TeamAWard = none;
        }
        ++ I;
        goto J0xAA;
    }
    NoAwardsTextField.SetVisible(ItemCount == 0);
    SetObject("teamAwards", ObjectArray);
}

defaultproperties
{
    NoTeamAwardsGivenString="NO AWARDS GIVEN"
    TeamAwardsString="TEAM AWARDS"
    PersonalBestsString="PERSONAL BESTS"
}