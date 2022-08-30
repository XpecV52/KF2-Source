//=============================================================================
// KFGFxStartGameContainer_FindGame
//=============================================================================
// 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 1/27/2015
//=============================================================================

class KFGFxStartGameContainer_FindGame extends KFGFxObject_Container
	config(UI);

var KFGFxMenu_StartGame StartMenu;

struct SWhatsNew
{
    var string ImageURL;
    var string TextField;
    var string RedirectURL;
	var string PSNProductId;
};

var array<SWhatsNew> WhatsNewItems;
var const private config array<SWhatsNew> PS4WhatsNewItems;
var const private config array<SWhatsNew> PS4WhatsNewItemsFreeTrial;
var array<SWhatsNew> PS4ActiveWhatsNewItems;

var localized string MultiplayerString;
var localized string CreateGameString;
var localized string SoloString;
var localized string TutorialString;

var bool bTrialNewsActive;
var OnlineSubsystem OnlineSub;
//==============================================================
// Initialization
//==============================================================
function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
    StartMenu = KFGFxMenu_StartGame( NewParentMenu );
	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
    LocalizeMenu();
    SetWhatsNewItems();

    if( class'KFGameEngine'.static.IsSoloPlayDisabled())
    {
        DisableSoloButton();
    }
}

function DisableSoloButton()
{
    local GFxObject SoloButton;

    SoloButton = GetObject("soloOfflineButton");
    if(SoloButton != none)
    {
        SoloButton.SetBool("enabled", false);
    }
}

function CheckNewsState()
{
	if (Class'WorldInfo'.Static.IsConsoleBuild(CONSOLE_Orbis) && OnlineSub != none)
	{
		if (OnlineSub.IsGameOwned() && bTrialNewsActive)
		{
			SetWhatsNewItems();
		}
	}
}

function SetWhatsNewItems()
{
    local GFxObject DataObject;
    local GFxObject DataArray;
	local GFxObject WhatsNewButton;
    local int i;
	local bool bLoggedIn;

	WhatsNewButton = GetObject( "whatsNewButton" );

    DataArray = CreateArray();
    if(Class'WorldInfo'.Static.IsConsoleBuild())
    {
		bLoggedIn = OnlineSub.PlayerInterface.GetLoginStatus( GetLP().ControllerId ) == LS_LoggedIn;
		PS4ActiveWhatsNewItems.Length = 0;

		WhatsNewButton.SetVisible( bLoggedIn && OnlineSub.CanCheckFreeTrialState());
																		//if we don't own the game, show the buy the game news item
		if (Class'WorldInfo'.Static.IsConsoleBuild(CONSOLE_Orbis) && !OnlineSub.IsGameOwned())
		{
			bTrialNewsActive = true;
			for (i = 0; i < PS4WhatsNewItemsFreeTrial.length; i++)
			{
				// Only show store items if we are logged in
				DataObject = CreateObject("Object");
				DataObject.SetString("label", Localize("WhatsNewMessages", PS4WhatsNewItemsFreeTrial[i].TextField, "KFGame"));
				DataObject.SetString("imageURL", PS4WhatsNewItemsFreeTrial[i].ImageURL);
				DataObject.SetString("redirectURL", "OpenStore");
				DataArray.SetElementObject(PS4ActiveWhatsNewItems.Length, DataObject);
				PS4ActiveWhatsNewItems.AddItem(PS4WhatsNewItemsFreeTrial[i]);
			}
		}
		else
		{
			bTrialNewsActive = false;
			for (i = 0; i < PS4WhatsNewItems.length; i++)
			{

				// When Summer Sideshow is off, we don't want to link to the time limited SS item.
				if (class'KFGameEngine'.static.GetSeasonalEventId() == 0)
				{
					if (PS4WhatsNewItems[i].TextField == "FeaturedEventItem")
					{
						continue;
					}
				}

				// Only show store items if we are logged in
				if (bLoggedIn || PS4WhatsNewItems[i].PSNProductId == "")
				{
					DataObject = CreateObject("Object");
					DataObject.SetString("label", Localize("WhatsNewMessages", PS4WhatsNewItems[i].TextField, "KFGame"));
					DataObject.SetString("imageURL", PS4WhatsNewItems[i].ImageURL);
					DataObject.SetString("redirectURL", PS4WhatsNewItems[i].RedirectURL);
					DataArray.SetElementObject(PS4ActiveWhatsNewItems.Length, DataObject);
					PS4ActiveWhatsNewItems.AddItem(PS4WhatsNewItems[i]);
				}
			}
		}
        
    }
    else
    {
        for (i = 0; i < WhatsNewItems.length; i++)
        {
            DataObject = CreateObject("Object");
            DataObject.SetString("label", Localize("WhatsNewMessages",WhatsNewItems[i].TextField,"KFGame"));
            DataObject.SetString("imageURL",WhatsNewItems[i].ImageURL);
            DataObject.SetString("redirectURL",WhatsNewItems[i].RedirectURL);
            DataArray.SetElementObject(i, DataObject);
        }
    }
    
    SetObject("whatsNew", DataArray);
}

function LocalizeMenu()
{
    local GFxObject TextObject;
    TextObject = CreateObject("Object");
    // Localize static text
    TextObject.SetString("home",StartMenu.FindGameString);  
    TextObject.SetString("multiplayer",MultiplayerString);  
	TextObject.SetString("createGame", CreateGameString);
	
	TextObject.SetString("news", StartMenu.NewsPageString);
    TextObject.SetString("serverBrowser",StartMenu.ServerBrowserString);    
    TextObject.SetString("solo",SoloString);    
    TextObject.SetString("tutorial",TutorialString);
    SetObject("localizedText", TextObject);
}

DefaultProperties
{
// Latest Update
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_Summer_KickinBrass_Event", Textfield="LatestUpdate", RedirectURL="http://www.tripwireinteractive.com/redirect/KF2LatestUpdate/")) 
// Featured Time Limited Item
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_SS_PremiumTicket", Textfield="FeaturedEventItem", RedirectURL="https://store.steampowered.com/buyitem/232090/5030"))
// Featured Cosmetic Bundle
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_Summer_Clotbackpacks", Textfield="FeaturedItemBundle", RedirectURL="https://store.steampowered.com/buyitem/232090/7423"))
// Featured Weapon Skin USB
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_Summer_USBKey_Steampunk_25", Textfield="FeaturedUsbKey", RedirectURL="https://store.steampowered.com/buyitem/232090/7408"))
// Featured Crate Key
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_Summer_Crate_ProjectH_21", Textfield="FeaturedCrateKey", RedirectURL="https://store.steampowered.com/buyitem/232090/7398"))
// Featured Crossover

// Misc Community Links
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_CommunityHub", Textfield="Jaegorhorn", RedirectURL="https://steamcommunity.com/app/232090"))    
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_CommunityForums", Textfield="Forums", RedirectURL="http://forums.tripwireinteractive.com/"))
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_Survey", Textfield="Survey", RedirectURL="http://www.tripwireinteractive.com/redirect/KF2Survey/"))
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_CommunityIssue", Textfield="CommunityTracker", RedirectURL="https://trello.com/b/ZOwMRlcW/killing-floor-2-community-issue-roadmap"))
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_Merch", Textfield="Merch", RedirectURL="https://tripwire.manheadmerch.com/"))
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew_PS4.UI_WhatsNew_KFUncovered", Textfield="Uncovered", RedirectURL="https://www.youtube.com/watch?v=fTdfedt9B48/"))
}