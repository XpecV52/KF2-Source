/*******************************************************************************
 * KFGameViewportClient generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGameViewportClient extends GameViewportClient within Engine
    transient
    native(UI)
    config(Engine);

var array<string> TripWireOfficialMaps;
var array<string> CommunityOfficialMaps;
var LinearColor BackgroundColor;
var string ErrorTitle;
var string ErrorMessage;
var string LastConnectionAttemptAddress;
var const localized array<localized string> RandomLoadingStrings;
var const localized string OfficialCommunityString;
var const localized string TripWireOfficialString;
var const localized string CommunityCustomString;
var Font MessageFont;
var float FontScale;
var bool bSeenIIS;
var bool bNeedDisconnectMessage;
var bool bNeedSignoutMessage;
var bool bHandlePlayTogether;
var bool bDownloadingContent;
var string CurrentDownloadName;
var int CurrentDownloadProgress;

function NotifyConnectionError(Engine.PlayerController.EProgressMessageType MessageType, optional string Message, optional string Title)
{
    local KFGameEngine KFGEngine;

    Message = Localize("Errors", "ConnectionFailed", "Engine");
    Title = Localize("Errors", "ConnectionFailed_Title", "Engine");
    KFGEngine = KFGameEngine(Class'KFGameEngine'.static.GetEngine());
    if(ErrorTitle == "")
    {
        ErrorTitle = Class'KFLocalMessage'.static.getLocalized(Title);
        ErrorMessage = Class'KFLocalMessage'.static.getLocalized(Message);
        KFGEngine.SetLastConnectionError(Message, Title);
    }
    super.NotifyConnectionError(MessageType, Message, Title);
}

event NotifyDownloadProgress(Engine.PlayerController.EProgressMessageType ProgressType, string ProgressTitle, string ProgressDescription, optional bool SuppressPasswordRetry)
{
    SuppressPasswordRetry = false;
    if(ProgressType == 3)
    {
        bDownloadingContent = true;
        CurrentDownloadName = ProgressTitle;
        CurrentDownloadProgress = int(float(ProgressDescription) * float(100));
    }
}

event ClearDownloadInfo()
{
    CurrentDownloadName = "";
    CurrentDownloadProgress = 0;
    bDownloadingContent = false;
}

event PreBrowse(string Address)
{
    LastConnectionAttemptAddress = Address;
}

function GetErrorMessage(out string outTitle, out string outMessage)
{
    outTitle = ErrorTitle;
    outMessage = ErrorMessage;
    ErrorTitle = "";
    ErrorMessage = "";
}

function DrawTransition(Canvas Canvas)
{
    local string RandomLoadingString;

    switch(Outer.TransitionType)
    {
        case 2:
            RandomLoadingString = GetRandomLoadingMessage();
            DrawTransitionMessage(Canvas, RandomLoadingString);
            break;
        default:
            break;
    }
}

function string GetRandomLoadingMessage()
{
    return RandomLoadingStrings[Rand(RandomLoadingStrings.Length)];
}

function DrawTransitionMessage(Canvas Canvas, string Message)
{
    local string MapName;

    FontScale = float(Canvas.SizeY) / float(1080);
    MapName = KFGameEngine(Class'Engine'.static.GetEngine()).TransitionDescription;
    DrawMapInfo(Canvas, MapName);
    if(!Class'WorldInfo'.static.IsConsoleBuild())
    {
        if(bDownloadingContent)
        {
            DrawDownloadingString(Canvas);
        }
        if((MapName != "") && MapName != "KFMainMenu")
        {
            DrawCancelString(Canvas);
        }
    }
    Class'Engine'.static.AddOverlay(MessageFont, Message, 0.15, 0.85, FontScale, FontScale, true);
    return;
    super.DrawTransitionMessage(Canvas, Message);
}

function DrawDownloadingString(Canvas Canvas)
{
    local string DownloadingString;

    DownloadingString = (((Class'KFGFxWidget_BaseParty'.default.DownloadingString @ CurrentDownloadName) @ "-") @ string(CurrentDownloadProgress)) $ "%";
    Class'Engine'.static.AddOverlay(MessageFont, DownloadingString, 0.12, 0.7, FontScale, FontScale, true);
}

function DrawCancelString(Canvas Canvas)
{
    local string CancelString;

    CancelString = "F10 -" @ Class'KFCommon_LocalizedStrings'.default.CancelConnectionString;
    Class'Engine'.static.AddOverlay(MessageFont, CancelString, 0.12, 0.75, FontScale, FontScale, true);
}

function DrawMapInfo(Canvas Canvas, string MapName)
{
    local KFMapSummary MapData;
    local string GameModeString;
    local array<string> GamemModeStringArray;

    ParseStringIntoArray(KFGameEngine(Class'Engine'.static.GetEngine()).TransitionGameType, GamemModeStringArray, ".", true);
    if(GamemModeStringArray.Length > 0)
    {
        if(Caps(GamemModeStringArray[0]) == Caps("KFGameContent"))
        {
            GameModeString = Localize(GamemModeStringArray[1], "GameName", "KFGameContent");            
        }
        else
        {
            if(GamemModeStringArray.Length > 1)
            {
                GameModeString = GamemModeStringArray[1];
            }
        }
    }
    MapData = Class'KFUIDataStore_GameResource'.static.GetMapSummaryFromMapName(MapName);
    if(MapData == none)
    {
        MapData = Class'KFUIDataStore_GameResource'.static.GetMapSummaryFromMapName("KF-Default");
    }
    if(MapData.DisplayName != "")
    {
        Class'Engine'.static.AddOverlay(MessageFont, Class'KFCommon_LocalizedStrings'.default.LoadingString, 0.12, 0.12, FontScale, FontScale, false);
        Class'Engine'.static.AddOverlay(MessageFont, (MapData.DisplayName @ "-") @ (GetAssociationIdentifier(MapData)), 0.135, 0.15, FontScale, FontScale, false);
        if(GameModeString != "")
        {
            Class'Engine'.static.AddOverlay(MessageFont, GameModeString, 0.135, 0.18, FontScale, FontScale, false);
        }
    }
}

function string GetAssociationIdentifier(KFMapSummary MapData)
{
    switch(MapData.MapAssociation)
    {
        case 1:
            return OfficialCommunityString;
        case 2:
            return TripWireOfficialString;
        case 0:
            return CommunityCustomString;
        default:
            return CommunityCustomString;
            break;
    }
}

defaultproperties
{
    TripWireOfficialMaps(0)="KF-BioticsLab"
    TripWireOfficialMaps(1)="KF-BlackForest"
    TripWireOfficialMaps(2)="KF-BurningParis"
    TripWireOfficialMaps(3)="KF-Catacombs"
    TripWireOfficialMaps(4)="KF-EvacuationPoint"
    TripWireOfficialMaps(5)="KF-Farmhouse"
    TripWireOfficialMaps(6)="KF-VolterManor"
    TripWireOfficialMaps(7)="KF-Outpost"
    TripWireOfficialMaps(8)="KF-Prison"
    TripWireOfficialMaps(9)="KF-ZedLanding"
    TripWireOfficialMaps(10)="KF-TheDescent"
    TripWireOfficialMaps(11)="KF-Nuked"
    TripWireOfficialMaps(12)="KF-TragicKingdom"
    TripWireOfficialMaps(13)="KF-Nightmare"
    TripWireOfficialMaps(14)="KF-KrampusLair"
    TripWireOfficialMaps(15)="KF-DieSector"
    CommunityOfficialMaps(0)="KF-ContainmentStation"
    CommunityOfficialMaps(1)="KF-HostileGrounds"
    CommunityOfficialMaps(2)="KF-InfernalRealm"
    CommunityOfficialMaps(3)="KF-PowerCore_Holdout"
    CommunityOfficialMaps(4)="KF-LockDown"
    BackgroundColor=(R=1,G=1,B=1,A=1)
    RandomLoadingStrings(0)="The fleshpound is vulnerable to explosives but resistant to bullets."
    RandomLoadingStrings(1)="The scrake is resistant to explosives but vulnerable to bullets."
    RandomLoadingStrings(2)="You can only carry a limited amount of weight. Sell weaker weapons to make room for better ones."
    RandomLoadingStrings(3)="Watch the vents and sewers; Zeds can come from anywhere."
    RandomLoadingStrings(4)="Keep an eye out for gear and ammo boxes scattered throughout the map. They may save you if you get in a pinch."
    RandomLoadingStrings(5)="The bloat's body can take a lot of hits. Aim for its head."
    RandomLoadingStrings(6)="The parry ability stumbles a Zed, allowing you to get in a few extra strikes."
    RandomLoadingStrings(7)="Watch out for the husk. Once he takes enough damage, he may try to self-detonate on your team."
    RandomLoadingStrings(8)="You receive XP for damaging Zeds towards the perk associated with the weapon that inflicted the damage."
    RandomLoadingStrings(9)="Stick together. Getting singled out decreases your chances of survival if things get hairy."
    RandomLoadingStrings(10)="Players can use the syringe to heal themselves as well as their teammates."
    RandomLoadingStrings(11)="Welding doors can hold Zeds back, but they can eventually break them down."
    RandomLoadingStrings(12)="If a teammate dies, it is helpful to grab their weapon and drop it for them at the trader."
    RandomLoadingStrings(13)="Got some extra dosh? Drop some for your team; they may return the favor."
    RandomLoadingStrings(14)="Choose your targets. Different weapons are more or less effective against different types of Zeds."
    RandomLoadingStrings(15)="Prioritize your targets. A fleshpound is a lot more deserving of your attention than a clot."
    RandomLoadingStrings(16)="All Zeds have weak points. If it's not the head, look for glowing elements on their bodies."
    RandomLoadingStrings(17)="While you will get occasional cosmetic items as loot, some cosmetic items can be purchased."
    RandomLoadingStrings(18)="The siren's scream neutralizes grenades and other explosives."
    RandomLoadingStrings(19)="Scrakes and fleshpounds will rage once they receive enough damage. Stay out of their way."
    RandomLoadingStrings(20)="Have a bunch of weapon skins or cosmetic items you're not using?  Craft new ones in your Inventory."
    RandomLoadingStrings(21)="Consider your outfit and gear carefully. One must look stylish while killing Zeds."
    RandomLoadingStrings(22)="Melee attacks are directional based on your movement."
    RandomLoadingStrings(23)="Welding doors shut can limit the directions the Zeds will attack you from, but will also limit your escape routes."
    RandomLoadingStrings(24)="Don't get close to even the weakest Zeds; they can grab you and hold on until their bigger friends arrive."
    RandomLoadingStrings(25)="Want Medic XP and some dosh? Heal your team -- both parties benefit!"
    RandomLoadingStrings(26)="Use controlled bursts with your weapons. Running out of ammo mid-wave makes for a difficult time."
    RandomLoadingStrings(27)="New perk skills are unlocked every 5 levels. Check them out at the Perks Menu."
    RandomLoadingStrings(28)="The M79 and RPG must travel a certain distance to arm the explosive charge."
    RandomLoadingStrings(29)="If you're having trouble seeing the Zeds, try your flashlight."
    RandomLoadingStrings(30)="Having a tough time surviving? Try a different perk! You may find one that fits your playstyle better."
    RandomLoadingStrings(31)="Always make sure you have a way out. Getting boxed in is a sure way to take a dirt nap."
    RandomLoadingStrings(32)="Armor is your friend. You can never go wrong getting more armor."
    RandomLoadingStrings(33)="Fire is a great way to keep Zeds away from you. Fire alone takes awhile to kill Zeds, but it keeps them occupied."
    RandomLoadingStrings(34)="If a Zed or its weapon are glowing red, parrying its melee attacks will be less effective. Run!"
    RandomLoadingStrings(35)="Lighting Zeds on fire can cause them to panic."
    RandomLoadingStrings(36)="Submachine guns have a high chance to cause targets to stumble, allowing you to keep them at a distance."
    RandomLoadingStrings(37)="The rail gun can fire through multiple Zeds if you line them up right."
    RandomLoadingStrings(38)="The microwave gun does more damage against Zeds carrying metal, like fleshpounds and sirens."
    RandomLoadingStrings(39)="Try out your weapon's alternate fire mode. Not all weapons have them, but it may help you in a tight spot."
    RandomLoadingStrings(40)="You get XP and dosh for assists in addition to kills, so don't feel bad for setting up kills for your allies."
    RandomLoadingStrings(41)="To remove a weld from a door, equip your welder and press the iron sights button."
    OfficialCommunityString="Official Community Map"
    TripWireOfficialString="Tripwire Official Map"
    CommunityCustomString="Community Custom Map"
    MessageFont=Font'UI_Canvas_Fonts.Font_Main'
    FontScale=1
}