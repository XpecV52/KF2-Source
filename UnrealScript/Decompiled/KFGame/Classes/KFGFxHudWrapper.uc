/*******************************************************************************
 * KFGFxHudWrapper generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxHudWrapper extends KFHUDBase
    transient
    config(Game)
    hidecategories(Navigation);

var class<KFGFxMoviePlayer_HUD> HUDClass;
var KFGFxMoviePlayer_HUD HudMovie;
var KFPawn_MonsterBoss BossPawn;

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    CreateHUDMovie();
}

function CreateHUDMovie()
{
    if(!Class'WorldInfo'.static.IsMenuLevel())
    {
        HudMovie = new HUDClass;
        HudMovie.SetTimingMode(1);
        HudMovie.Init(Class'Engine'.static.GetEngine().GamePlayers[HudMovie.LocalPlayerOwnerIndex]);
    }
}

singular event Destroyed()
{
    RemoveMovies();
    super(Actor).Destroyed();
}

function RemoveMovies()
{
    if(HudMovie != none)
    {
        HudMovie.Cleanup();
        HudMovie.Close(true);
        HudMovie = none;
    }
    super.RemoveMovies();
}

function int GetLocalPlayerOwnerIndex()
{
    return HudMovie.LocalPlayerOwnerIndex;
}

function SetVisible(bool bNewVisible)
{
    super.SetVisible(bNewVisible);
    if(HudMovie != none)
    {
        HudMovie.SetPause(!bNewVisible);
        HudMovie.NotifyVisibilityChange(bNewVisible);
    }
}

function ResolutionChanged()
{
    super.ResolutionChanged();
    CreateHUDMovie();
}

event PostRender()
{
    super(HUD).PostRender();
    if(HudMovie != none)
    {
        HudMovie.TickHud(0);
    }
    UpdatePlayerInfos();
}

exec function SetShowScores(bool bNewValue)
{
    super.SetShowScores(bNewValue);
    if(HudMovie != none)
    {
        HudMovie.ShowScoreboard(bNewValue);
    }
}

event DrawHUD()
{
    local Vector ViewPoint;
    local Rotator ViewRotation;
    local float XL, YL, YPos;

    super.DrawHUD();
    if((KFGRI != none) && !KFGRI.bMatchIsOver)
    {
        Canvas.Font = GetFontSizeIndex(0);
        PlayerOwner.GetPlayerViewPoint(ViewPoint, ViewRotation);
        DrawActorOverlays(ViewPoint, ViewRotation);
    }
    if(bCrosshairOnFriendly)
    {
        bGreenCrosshair = CheckCrosshairOnFriendly();
        bCrosshairOnFriendly = false;        
    }
    else
    {
        bGreenCrosshair = false;
    }
    if(bShowDebugInfo)
    {
        Canvas.Font = GetFontSizeIndex(0);
        Canvas.DrawColor = ConsoleColor;
        Canvas.StrLen("X", XL, YL);
        YPos = 0;
        PlayerOwner.ViewTarget.DisplayDebug(self, YL, YPos);
        if((ShouldDisplayDebug('AI')) && Pawn(PlayerOwner.ViewTarget) != none)
        {
            DrawRoute(Pawn(PlayerOwner.ViewTarget));
        }
        return;
    }
}

function UpdatePlayerInfos()
{
    local KFPawn_Human KFPH;
    local Vector ViewLocation, ViewVector, PlayerPartyInfoLocation;
    local Rotator ViewRotation;
    local float ThisDot;
    local KFWeapon KFW;

    PlayerOwner.GetPlayerViewPoint(ViewLocation, ViewRotation);
    ViewVector = vector(ViewRotation);
    if(PlayerOwner.Pawn != none)
    {
        KFW = KFWeapon(PlayerOwner.Pawn.Weapon);
    }
    foreach WorldInfo.AllPawns(Class'KFPawn_Human', KFPH)
    {
        if((KFPH.PlayerPartyInfo == none) || !KFPH.IsAliveAndWell())
        {
            continue;            
        }
        PlayerPartyInfoLocation = (KFPH.Location + KFPH.MTO_PhysSmoothOffset) + (KFPH.CylinderComponent.CollisionHeight * vect(0, 0, 1));
        ThisDot = Normal(PlayerPartyInfoLocation - ViewLocation) Dot Normal(ViewVector);
        if(((WorldInfo.TimeSeconds - KFPH.Mesh.LastRenderTime) < 0.4) && ThisDot > float(0))
        {
            if(((KFW != none) && !KFW.bUsingSights) || ThisDot < 0.99)
            {
                KFPH.PlayerPartyInfo.SetVisible(true);
                KFPH.PlayerPartyInfo.ScreenPosition = Canvas.Project(PlayerPartyInfoLocation);
                KFPH.PlayerPartyInfo.TickHud(0);                
            }
            else
            {
                KFPH.PlayerPartyInfo.SetVisible(false);
            }
            continue;
        }
        KFPH.PlayerPartyInfo.SetVisible(false);        
    }    
}

function PlayerOwnerDied()
{
    super(HUD).PlayerOwnerDied();
    if(HudMovie != none)
    {
        HudMovie.PlayerOwnerDied();
    }
}

function LocalizedMessage(class<LocalMessage> InMessageClass, PlayerReplicationInfo RelatedPRI_1, PlayerReplicationInfo RelatedPRI_2, string MessageString, int Switch, float Position, float Lifetime, int FontSize, Color DrawColor, optional Object OptionalObject)
{
    local KFPlayerController KFPC;
    local string HexClr;
    local class<KFLocalMessage> KFLocalMessageClass;

    if(MessageString == "")
    {
        return;
    }
    KFPC = KFPlayerController(PlayerOwner);
    if(HudMovie == none)
    {
        super(HUD).LocalizedMessage(InMessageClass, RelatedPRI_1, RelatedPRI_2, MessageString, Switch, Position, Lifetime, FontSize, DrawColor, OptionalObject);
        return;
    }
    if(!InMessageClass.default.bIsSpecial)
    {
        AddConsoleMessage(MessageString, InMessageClass, RelatedPRI_1);
        return;
    }
    if(bMessageBeep && InMessageClass.default.bBeep)
    {
        PlayerOwner.PlayBeepSound();
    }
    KFLocalMessageClass = class<KFLocalMessage>(InMessageClass);
    if(KFLocalMessageClass != none)
    {
        HexClr = KFLocalMessageClass.static.GetHexColor(Switch);        
    }
    else
    {
        if(InMessageClass == Class'GameMessage')
        {
            HexClr = Class'KFLocalMessage'.default.ConnectionColor;
        }
    }
    if(HudMovie.HudChatBox != none)
    {
        HudMovie.HudChatBox.AddChatMessage(MessageString, HexClr);
    }
    if(KFPC.MyGFxManager.PartyWidget != none)
    {
        KFPC.MyGFxManager.PartyWidget.ReceiveMessage(MessageString, HexClr);
    }
}

defaultproperties
{
    HUDClass=Class'KFGFxMoviePlayer_HUD'
}