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
var array<SWhatsNew> PS4ActiveWhatsNewItems;

var localized string MultiplayerString;
var localized string SoloString;
var localized string TutorialString;

//==============================================================
// Initialization
//==============================================================
function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
    StartMenu = KFGFxMenu_StartGame( NewParentMenu );
    LocalizeMenu();
    SetWhatsNewItems();
}

function SetWhatsNewItems()
{
    local GFxObject DataObject;
    local GFxObject DataArray;
	local GFxObject WhatsNewButton;
    local int i;
	local OnlineSubsystem OSS;
	local bool bLoggedIn;

	WhatsNewButton = GetObject( "whatsNewButton" );

    DataArray = CreateArray();
    if(Class'WorldInfo'.Static.IsConsoleBuild())
    {
		OSS = class'GameEngine'.static.GetOnlineSubsystem();
		bLoggedIn = OSS.PlayerInterface.GetLoginStatus( GetLP().ControllerId ) == LS_LoggedIn;
		PS4ActiveWhatsNewItems.Length = 0;

		WhatsNewButton.SetVisible( bLoggedIn );

        for (i = 0; i < PS4WhatsNewItems.length; i++)
        {
			// Only show store items if we are logged in
			if( bLoggedIn || PS4WhatsNewItems[i].PSNProductId == "" )
			{
				DataObject = CreateObject("Object");
				DataObject.SetString("label",Localize("WhatsNewMessages",PS4WhatsNewItems[i].TextField,"KFGame"));
				DataObject.SetString("imageURL",PS4WhatsNewItems[i].ImageURL);
				DataObject.SetString("redirectURL",PS4WhatsNewItems[i].RedirectURL);
				DataArray.SetElementObject(PS4ActiveWhatsNewItems.Length, DataObject);
				PS4ActiveWhatsNewItems.AddItem( PS4WhatsNewItems[i] );
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
    TextObject.SetString("serverBrowser",StartMenu.ServerBrowserString);    
    TextObject.SetString("solo",SoloString);    
    TextObject.SetString("tutorial",TutorialString);
    SetObject("localizedText", TextObject);
}

DefaultProperties
{
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_volcano", Textfield="LatestUpdate", RedirectURL="http://www.killingfloor2.com/bullseye")) 
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_CommunityHub", Textfield="Jaegorhorn", RedirectURL="https://steamcommunity.com/app/232090"))    
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_HorzineKey_Emote_01_11", Textfield="NewEmotes", RedirectURL="https://store.steampowered.com/buyitem/232090/4540"))
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_USBKey_MaceShield_15", Textfield="USBBoneCrusher", RedirectURL="https://store.steampowered.com/buyitem/232090/4562"))
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_CommunityForums", Textfield="Forums", RedirectURL="http://forums.tripwireinteractive.com/"))
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_Survey", Textfield="Survey", RedirectURL="http://www.tripwireinteractive.com/redirect/KF2Survey/"))
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_CommunityIssue", Textfield="CommunityTracker", RedirectURL="https://trello.com/b/ZOwMRlcW/killing-floor-2-community-issue-roadmap"))
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew.UI_WhatsNew_Merch", Textfield="Merch", RedirectURL="https://tripwire.gomerch.com/"))
    WhatsNewItems.Add((ImageURL="img://UI_WhatsNew_PS4.UI_WhatsNew_KFUncovered", Textfield="Uncovered", RedirectURL="https://www.youtube.com/watch?v=fTdfedt9B48/"))
}