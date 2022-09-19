/*******************************************************************************
 * KFGFxStartGameContainer_FindGame generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxStartGameContainer_FindGame extends KFGFxObject_Container within GFxMoviePlayer
    config(UI);

struct SWhatsNew
{
    var string ImageURL;
    var string TextField;
    var string RedirectURL;
    var string PSNProductId;
    var bool bPlayfabItemPairedUp;

    structdefaultproperties
    {
        ImageURL=""
        TextField=""
        RedirectURL=""
        PSNProductId=""
        bPlayfabItemPairedUp=true
    }
};

var KFGFxMenu_StartGame StartMenu;
var array<SWhatsNew> WhatsNewItems;
var private const config array<config SWhatsNew> PS4WhatsNewItems;
var private const config array<config SWhatsNew> PS4WhatsNewItemsFreeTrial;
var array<SWhatsNew> PS4ActiveWhatsNewItems;
var const localized string MultiplayerString;
var const localized string CreateGameString;
var const localized string SoloString;
var const localized string TutorialString;
var bool bTrialNewsActive;
var OnlineSubsystem OnlineSub;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    StartMenu = KFGFxMenu_StartGame(NewParentMenu);
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    FillWhatsNew();
    LocalizeMenu();
    SetWhatsNewItems();
    if(Class'KFGameEngine'.static.IsSoloPlayDisabled())
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
    if(Class'WorldInfo'.static.IsConsoleBuild(8) && OnlineSub != none)
    {
        if(OnlineSub.IsGameOwned() && bTrialNewsActive)
        {
            SetWhatsNewItems();
        }
    }
}

function SetWhatsNewItems()
{
    local GFxObject DataObject, DataArray, WhatsNewButton;
    local int I, Index;
    local bool bLoggedIn;

    WhatsNewButton = GetObject("whatsNewButton");
    DataArray = Outer.CreateArray();
    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        bLoggedIn = OnlineSub.PlayerInterface.GetLoginStatus(byte(Outer.GetLP().ControllerId)) == 2;
        PS4ActiveWhatsNewItems.Length = 0;
        WhatsNewButton.SetVisible(bLoggedIn && OnlineSub.CanCheckFreeTrialState());
        if(Class'WorldInfo'.static.IsConsoleBuild(8) && !OnlineSub.IsGameOwned())
        {
            bTrialNewsActive = true;
            I = 0;
            J0x1A9:

            if(I < PS4WhatsNewItemsFreeTrial.Length)
            {
                DataObject = Outer.CreateObject("Object");
                DataObject.SetString("label", Localize("WhatsNewMessages", PS4WhatsNewItemsFreeTrial[I].TextField, "KFGame"));
                DataObject.SetString("imageURL", PS4WhatsNewItemsFreeTrial[I].ImageURL);
                DataObject.SetString("redirectURL", "OpenStore");
                DataArray.SetElementObject(PS4ActiveWhatsNewItems.Length, DataObject);
                PS4ActiveWhatsNewItems.AddItem(PS4WhatsNewItemsFreeTrial[I];
                ++ I;
                goto J0x1A9;
            }            
        }
        else
        {
            bTrialNewsActive = false;
            I = 0;
            J0x367:

            if(I < PS4WhatsNewItems.Length)
            {
                if(Class'KFGameEngine'.static.GetSeasonalEventID() == 0)
                {
                    if(PS4WhatsNewItems[I].TextField == "FeaturedEventItem")
                    {
                        goto J0x5BA;
                    }
                }
                if(bLoggedIn || PS4WhatsNewItems[I].PSNProductId == "")
                {
                    DataObject = Outer.CreateObject("Object");
                    DataObject.SetString("label", Localize("WhatsNewMessages", PS4WhatsNewItems[I].TextField, "KFGame"));
                    DataObject.SetString("imageURL", PS4WhatsNewItems[I].ImageURL);
                    DataObject.SetString("redirectURL", PS4WhatsNewItems[I].RedirectURL);
                    DataArray.SetElementObject(PS4ActiveWhatsNewItems.Length, DataObject);
                    PS4ActiveWhatsNewItems.AddItem(PS4WhatsNewItems[I];
                }
                J0x5BA:

                ++ I;
                goto J0x367;
            }
        }        
    }
    else
    {
        Index = 0;
        I = 0;
        J0x5E1:

        if(I < WhatsNewItems.Length)
        {
            if(Class'WorldInfo'.static.IsEOSBuild() && WhatsNewItems[I].TextField == "Jaegorhorn")
            {                
            }
            else
            {
                if(!Class'WorldInfo'.static.IsEOSBuild() && WhatsNewItems[I].TextField == "PS4Key")
                {                    
                }
                else
                {
                    DataObject = Outer.CreateObject("Object");
                    DataObject.SetString("label", Localize("WhatsNewMessages", WhatsNewItems[I].TextField, "KFGame"));
                    LogInternal("label" @ WhatsNewItems[I].TextField);
                    DataObject.SetString("imageURL", WhatsNewItems[I].ImageURL);
                    LogInternal("imageURL" @ WhatsNewItems[I].ImageURL);
                    DataObject.SetString("redirectURL", WhatsNewItems[I].RedirectURL);
                    LogInternal("redirectURL" @ WhatsNewItems[I].RedirectURL);
                    DataArray.SetElementObject(++ Index, DataObject);
                }
            }
            ++ I;
            goto J0x5E1;
        }
    }
    SetObject("whatsNew", DataArray);
}

function LocalizeMenu()
{
    local GFxObject TextObject;

    TextObject = Outer.CreateObject("Object");
    TextObject.SetString("home", StartMenu.FindGameString);
    TextObject.SetString("multiplayer", MultiplayerString);
    TextObject.SetString("createGame", CreateGameString);
    TextObject.SetString("news", StartMenu.NewsPageString);
    TextObject.SetString("serverBrowser", StartMenu.ServerBrowserString);
    TextObject.SetString("solo", SoloString);
    TextObject.SetString("tutorial", TutorialString);
    SetObject("localizedText", TextObject);
}

function FillWhatsNew()
{
    local SWhatsNew Item;

    WhatsNewItems.Remove(0, WhatsNewItems.Length;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_Summer2022_TidalTerror", "LatestUpdate", "http://www.tripwireinteractive.com/redirect/KF2LatestUpdate/");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_Summer2022_ArmorySeasonPassII", "ArmorySeasonPass", "https://store.steampowered.com/app/1914490/KF2__Season_Pass_2022");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_SS_PremiumTicket", "FeaturedEventItem", "https://store.steampowered.com/buyitem/232090/4928");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_Summer2022_UltimateEdition", "FeaturedItemBundle", "https://store.steampowered.com/buyitem/232090/9283");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_Summer2022_NeonMKVIII_Weapon_Skin", "FeaturedItemBundle", "https://store.steampowered.com/buyitem/232090/9362");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_Summer2022_Classic_Weapon_Skin", "FeaturedItemBundle", "https://store.steampowered.com/buyitem/232090/9363");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_Summer2022_DeepSea_Weapon_Skin", "FeaturedItemBundle", "https://store.steampowered.com/buyitem/232090/9364");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_Summer2022_Chameleon_Weapon_Skin", "FeaturedItemBundle", "https://store.steampowered.com/buyitem/232090/9365");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_Summer2022_DeepSea_Explorer_Uniforms", "FeaturedItemBundle", "https://store.steampowered.com/buyitem/232090/9366");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_Summer2022_ReductoRay", "FeaturedItemBundle", "https://store.steampowered.com/buyitem/232090/9367");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_Summer2022_Sentinel", "FeaturedItemBundle", "https://store.steampowered.com/buyitem/232090/9368");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_Summer2022_Weaponsbundle", "FeaturedItemBundle", "https://store.steampowered.com/buyitem/232090/9369");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_CommunityHub", "Jaegorhorn", "https://steamcommunity.com/app/232090");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_CommunityForums", "Forums", "http://forums.tripwireinteractive.com/");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_Survey", "Survey", "http://www.tripwireinteractive.com/redirect/KF2Survey/");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_CommunityIssue", "CommunityTracker", "http://www.killingfloor2.com/roadmap");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew.UI_WhatsNew_Merch", "Merch", "http://www.tripwireinteractive.com/redirect/shop/");
    WhatsNewItems.AddItem(Item;
    Item = SetWhatsNewItem("img://UI_WhatsNew_PS4.UI_WhatsNew_KFUncovered", "Uncovered", "https://www.youtube.com/watch?v=fTdfedt9B48/");
    WhatsNewItems.AddItem(Item;
}

function SWhatsNew SetWhatsNewItem(string Image, string TextField, string URL)
{
    local SWhatsNew Item;

    Item.ImageURL = Image;
    Item.TextField = TextField;
    Item.RedirectURL = URL;
    return Item;
}

defaultproperties
{
    MultiplayerString="Find A Match"
    CreateGameString="Create A Match"
    SoloString="Play Solo Offline"
    TutorialString="Basic Training"
}