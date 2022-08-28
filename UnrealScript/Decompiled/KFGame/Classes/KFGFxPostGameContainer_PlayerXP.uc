/*******************************************************************************
 * KFGFxPostGameContainer_PlayerXP generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxPostGameContainer_PlayerXP extends KFGFxObject_Container within GFxMoviePlayer;

var int ItemCount;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    SetXPList();
}

function SetXPList()
{
    local GFxObject ObjectArray;
    local KFPlayerReplicationInfo KFPRI;
    local KFPlayerController KFPC;
    local int I;
    local EphemeralMatchStats StatCollector;

    ItemCount = 0;
    KFPRI = KFPlayerReplicationInfo(Outer.GetPC().PlayerReplicationInfo);
    KFPC = KFPlayerController(Outer.GetPC());
    if((KFPRI != none) && KFPC != none)
    {
        StatCollector = KFPC.MatchStats;
        ObjectArray = Outer.CreateArray();
        StatCollector.PerkXPList.Sort(StatCollector.SortXP;
        I = 0;
        J0x148:

        if(I < StatCollector.PerkXPList.Length)
        {
            if(StatCollector.PerkXPList[I].XPDelta > 0)
            {
                ObjectArray.SetElementObject(ItemCount, MakePerkXPObject(StatCollector.PerkXPList[I]));
            }
            ++ I;
            goto J0x148;
        }
    }
    SetObject("xpList", ObjectArray);
}

function GFxObject MakePerkXPObject(PerkXPGain PerkXPObject)
{
    local GFxObject TempGFxObject;
    local KFPlayerController KFPC;
    local float BonusXPMultiplier;

    KFPC = KFPlayerController(Outer.GetPC());
    TempGFxObject = Outer.CreateObject("Object");
    BonusXPMultiplier = KFPC.GetPerkPrestigeXPMultiplier(PerkXPObject.PerkClass);
    TempGFxObject.SetInt("bonusXP", PerkXPObject.BonusXP);
    TempGFxObject.SetString("bonusXPMultiplier", (string(int(BonusXPMultiplier * float(100))) $ "%") @ Class'KFCommon_LocalizedStrings'.default.PrestigeBonusString);
    TempGFxObject.SetFloat("startXP", PerkXPObject.StartXPPercentage);
    TempGFxObject.SetFloat("finishXP", float(Min(int(KFPC.GetPerkLevelProgressPercentage(PerkXPObject.PerkClass)), 100)));
    TempGFxObject.SetFloat("xpDelta", float(PerkXPObject.XPDelta));
    TempGFxObject.SetInt("perkLevel", PerkXPObject.StartLevel);
    TempGFxObject.SetInt("finishLevel", KFPC.GetPerkLevelFromPerkList(PerkXPObject.PerkClass));
    TempGFxObject.SetString("perkName", PerkXPObject.PerkClass.default.PerkName);
    TempGFxObject.SetString("perkIcon", "img://" $ PerkXPObject.PerkClass.static.GetPerkIconPath());
    TempGFxObject.SetString("objective1", PerkXPObject.PerkClass.default.EXPAction1);
    TempGFxObject.SetInt("objective1Value", (PerkXPObject.XPDelta - PerkXPObject.SecondaryXPGain) - PerkXPObject.BonusXP);
    TempGFxObject.SetString("objective2", PerkXPObject.PerkClass.default.EXPAction2);
    TempGFxObject.SetInt("objective2Value", PerkXPObject.SecondaryXPGain);
    ++ ItemCount;
    return TempGFxObject;
}

defaultproperties
{
    ItemCount=-1
}