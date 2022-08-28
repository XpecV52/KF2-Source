/*******************************************************************************
 * KFGFxHUD_PlayerStatus generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxHUD_PlayerStatus extends GFxObject within GFxMoviePlayer;

var KFPlayerController MyPC;
var KFPawn_Human MyHumanPawn;
var KFInventoryManager MyInventoryManager;
var class<KFPerk> LastPerkClass;
var int LastPerkLevel;
var int LastHealth;
var int LastArmor;
var float LastHealerAmmoPct;
var int LastEXPValue;
var const localized string EXPString;

function InitializeHUD()
{
    MyPC = KFPlayerController(Outer.GetPC());
    LocalizeText();
}

function LocalizeText()
{
    SetString("expString", EXPString);
}

function TickHud(float DeltaTime)
{
    UpdatePerk();
    UpdateHealth();
    UpdateArmor();
    UpdateHealer();
}

function ShowActiveIndicators(array<string> IconPathStrings)
{
    local byte I;
    local GFxObject DataProvider, TempObj;

    DataProvider = Outer.CreateArray();
    I = 0;
    J0x35:

    if(I < IconPathStrings.Length)
    {
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("iconPath", "img://" $ IconPathStrings[I]);
        DataProvider.SetElementObject(I, TempObj);
        ++ I;
        goto J0x35;
    }
    SetObject("activeEffects", DataProvider);
}

function ClearBuffIcons()
{
    local GFxObject DataProvider;

    DataProvider = Outer.CreateArray();
    SetObject("activeEffects", DataProvider);
}

function UpdateHealer()
{
    local float CurrentHealerAmmoPct;

    if((MyPC.Pawn != none) && MyPC.Pawn.IsAliveAndWell())
    {
        if(MyInventoryManager == none)
        {
            MyInventoryManager = KFInventoryManager(MyPC.Pawn.InvManager);
        }
        if((MyInventoryManager != none) && MyInventoryManager.HealerWeapon != none)
        {
            CurrentHealerAmmoPct = FClamp(float(MyInventoryManager.HealerWeapon.AmmoCount[0]) / float(MyInventoryManager.HealerWeapon.MagazineCapacity[0]), 0, 1);
        }
    }
    if(LastHealerAmmoPct != CurrentHealerAmmoPct)
    {
        SetInt("playerHealerCharge", int(CurrentHealerAmmoPct * 100));
        LastHealerAmmoPct = CurrentHealerAmmoPct;
    }
}

function UpdatePerk()
{
    local byte CurrentPerkLevel;
    local int CurrentPerkEXP;
    local GFxObject PerkIconObject;

    if((MyPC == none) || MyPC.CurrentPerk == none)
    {
        return;
    }
    CurrentPerkLevel = MyPC.GetLevel();
    CurrentPerkEXP = MyPC.GetPerkXP(MyPC.CurrentPerk.Class);
    if((LastPerkClass != MyPC.CurrentPerk.Class) || LastPerkLevel != CurrentPerkLevel)
    {
        PerkIconObject = Outer.CreateObject("Object");
        PerkIconObject.SetString("perkIcon", "img://" $ MyPC.CurrentPerk.GetPerkIconPath());
        PerkIconObject.SetString("prestigeIcon", MyPC.CurrentPerk.GetPrestigeIconPath(MyPC.GetPerkPrestigeLevelFromPerkList(MyPC.CurrentPerk.Class)));
        SetObject("playerPerkIcon", PerkIconObject);
        if(LastPerkLevel != CurrentPerkLevel)
        {
            if((LastPerkClass != none) && LastPerkClass == MyPC.CurrentPerk.Class)
            {
                UpdateXP(CurrentPerkEXP, int(MyPC.GetPerkLevelProgressPercentage(MyPC.CurrentPerk.Class, CurrentPerkEXP)), true, MyPC.CurrentPerk.Class);                
            }
            else
            {
                SetBool("bXPInit", false);
            }
        }
        LastPerkClass = MyPC.CurrentPerk.Class;
        SetInt("playerPerkLevel", CurrentPerkLevel);
        LastPerkLevel = CurrentPerkLevel;
        SetInt("playerPerkXPPercent", int(MyPC.GetPerkLevelProgressPercentage(LastPerkClass)));
        LastEXPValue = CurrentPerkEXP;
    }
}

function UpdateHealth()
{
    if(MyPC.Pawn != MyHumanPawn)
    {
        MyHumanPawn = KFPawn_Human(MyPC.Pawn);
    }
    if(MyHumanPawn == none)
    {
        LastHealth = 0;
        SetInt("playerHealth", LastHealth);        
    }
    else
    {
        if(LastHealth != MyHumanPawn.Health)
        {
            if(MyHumanPawn.Health < 0)
            {
                SetInt("playerHealth", 0);                
            }
            else
            {
                SetInt("playerHealth", MyHumanPawn.Health);
            }
            LastHealth = MyHumanPawn.Health;
        }
    }
}

function UpdateArmor()
{
    if(MyPC.Pawn != MyHumanPawn)
    {
        MyHumanPawn = KFPawn_Human(MyPC.Pawn);
    }
    if(MyHumanPawn == none)
    {
        LastArmor = 0;
        SetInt("playerArmor", LastArmor);        
    }
    else
    {
        if(LastArmor != MyHumanPawn.Armor)
        {
            SetInt("playerArmor", MyHumanPawn.Armor);
            LastArmor = MyHumanPawn.Armor;
        }
    }
}

function UpdateXP(int XPDelta, int XPPercent, bool bLevelUp, class<KFPerk> PerkClass)
{
    local bool bIsCurrentPerk;

    SetBool("bLevelUp", bLevelUp);
    bIsCurrentPerk = PerkClass == MyPC.CurrentPerk.Class;
    if(bIsCurrentPerk)
    {
        SetInt("playerPerkXPPercent", int(MyPC.GetPerkLevelProgressPercentage(PerkClass)));
    }
    if(!bLevelUp && MyPC.GetPerkLevelFromPerkList(PerkClass) < 25)
    {
        ShowXPBark(XPDelta, "img://" $ PerkClass.static.GetPerkIconPath(), bIsCurrentPerk);
    }
}

function ShowXPBark(int DeltaXP, string IconPath, bool bIsCurrentPerk)
{
    ActionScriptVoid("showXPBark");
}

defaultproperties
{
    EXPString="XP"
}