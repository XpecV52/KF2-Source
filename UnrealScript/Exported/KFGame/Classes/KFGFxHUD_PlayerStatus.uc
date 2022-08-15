//=============================================================================
// KFGFxInGameHUD_PlayerStatus
//=============================================================================
// HUD container that stores information about the player's pawn (Health, armor, etc)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Alex Quick 5/15/2014
//=============================================================================

class KFGFxHUD_PlayerStatus extends GFxObject;

/** Cached KFPlayerController */
var KFPlayerController 				MyPC;
// Player's perk type as of the last tick.
var class<KFPerk>					LastPerkClass;
// The experience level of the player's perk as of the last tick.
var int                             LastPerkLevel;
// Player's health as of last tick.
var int 							LastHealth;
// Player's armor amount as of the last tick.
var int								LastArmor;
// Percentage of full ammo the player's healer had as of the last tick. (0-1, where 1 is full)
var float                           LastHealerAmmoPct;

var int                             LastEXPValue;

var localized string EXPString;

function InitializeHUD()
{
	MyPC = KFPlayerController(GetPC());    
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

function ShowActiveIndicators( array<string> IconPathStrings )
{
    local byte i;
    local GFxObject DataProvider;
    local GFxObject TempObj;

    DataProvider = CreateArray();

    for (i = 0; i < IconPathStrings.length; i++)
    {
        //Corresponding AS3 class reads string off of the object to load in icon
        TempObj = CreateObject( "Object" );
        TempObj.SetString( "iconPath", "img://"$IconPathStrings[i] );
        DataProvider.SetElementObject( i, TempObj );
    }

    SetObject("activeEffects", DataProvider);
}

function ClearBuffIcons()
{
    local GFxObject DataProvider;

    DataProvider = CreateArray();

    SetObject("activeEffects", DataProvider);
}

function UpdateHealer()
{
	local float CurrentHealerAmmoPct;
    local KFInventoryManager KFInvManager;
    
	if( MyPC.Pawn != none && MyPC.Pawn.IsAliveAndWell() )
	{
        KFInvManager = KFInventoryManager(MyPC.Pawn.InvManager);
        if( KFInvManager != none && KFInvManager.HealerWeapon != none)
        {
            CurrentHealerAmmoPct = FClamp(float(KFInvManager.HealerWeapon.AmmoCount[0]) / float(KFInvManager.HealerWeapon.MagazineCapacity[0]),0.f,1.f);
        }
	}

	// Update the Healer charge amount
	if( LastHealerAmmoPct != CurrentHealerAmmoPct )
	{
        SetInt("playerHealerCharge" , int(CurrentHealerAmmoPct * 100.f));
        LastHealerAmmoPct = CurrentHealerAmmoPct;
	}
}

function UpdatePerk()
{
    local byte CurrentPerkLevel;
    local int CurrentPerkEXP;
    
    if( MyPC == none || MyPC.CurrentPerk == none )
    {
        return;
    }

    CurrentPerkLevel = MYPC.GetLevel();
    CurrentPerkEXP = MyPC.GetPerkXP(MyPC.CurrentPerk.Class);

    // Update the perk class.
    if( ( LastPerkClass != MyPC.CurrentPerk.Class ) || ( LastPerkLevel != CurrentPerkLevel ) )
	{
        SetString("playerPerkIcon" , "img://"$ MyPC.CurrentPerk.GetPerkIconPath());
        if(LastPerkLevel != CurrentPerkLevel)
        {    
            if(LastPerkClass != none && LastPerkClass == MyPC.CurrentPerk.Class)
            {
                 UpdateXP(CurrentPerkEXP, MyPC.GetPerkLevelProgressPercentage(MyPC.CurrentPerk.Class, CurrentPerkEXP), true, MyPC.CurrentPerk.Class);
            }
            else
            {
                SetBool("bXPInit", false);
            } 
        }
        LastPerkClass = MyPC.CurrentPerk.class;

        SetInt("playerPerkLevel" , CurrentPerkLevel);
        LastPerkLevel = CurrentPerkLevel;
        SetInt("playerPerkXPPercent", MyPC.GetPerkLevelProgressPercentage(LastPerkClass) );
        LastEXPValue = CurrentPerkEXP;
	}
}

function UpdateHealth()
{
	local KFPawn_Human MyKFP;

    MyKFP = KFPawn_Human(MyPC.Pawn);
    if( MyKFP == none )
    {
        LastHealth = 0;
        SetInt("playerHealth" , LastHealth);
	}
	else if( LastHealth != MyKFP.Health )
	{
        SetInt("playerHealth" , MyKFP.Health);
        LastHealth = MyKFP.Health;
	}
}

function UpdateArmor()
{
	local KFPawn_Human MyKFP;

    MyKFP = KFPawn_Human(MyPC.Pawn);
    if( MyKFP == none )
    {
        LastArmor = 0;
        SetInt("playerArmor" , LastArmor);
	}
	else if( LastArmor != MyKFP.Armor )
	{
        SetInt("playerArmor" , MyKFP.Armor);
        LastArmor = MyKFP.Armor;
	}
}

function UpdateXP(int XPDelta, int XPPercent, bool bLevelUp, Class<KFPerk> PerkClass)
{
    local bool bIsCurrentPerk;
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(GetPC());

    SetBool("bLevelUp", bLevelUp);

    bIsCurrentPerk = PerkClass == MyPC.CurrentPerk.Class;
    if(bIsCurrentPerk)
    {
        SetInt("playerPerkXPPercent", MyPC.GetPerkLevelProgressPercentage(PerkClass));
    }
    if(!bLevelUp && KFPC.GetPerkLevelFromPerkList(PerkClass) < 25)
    {
        ShowXPBark( XPDelta, "img://"$PerkClass.Static.GetPerkIconPath(), bIsCurrentPerk );
    }
}

function ShowXPBark( int DeltaXP, string iconPath, bool bIsCurrentPerk )
{
    ActionScriptVoid("showXPBark");
}

defaultproperties
{
   EXPString="XP"
   Name="Default__KFGFxHUD_PlayerStatus"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
