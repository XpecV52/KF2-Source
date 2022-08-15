/*******************************************************************************
 * KFDebugCameraHUD generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDebugCameraHUD extends KFHUDBase
    transient
    native(UI)
    config(Game)
    hidecategories(Navigation);

var bool bDrawDebugText;
var bool bDrawAimBasedText;
var bool bFocusOnSelectedActor;
var bool bDisplayHelp;
var KFPawn SelectedKFPawn;
var Camera PlayerCamera;
var float DebugTextMaxLen;

// Export UKFDebugCameraHUD::execDrawDebugHUDText(FFrame&, void* const)
native function DrawDebugHUDText(string Text, optional Color TextColor);

function ToggleHelpDisplay()
{
    bDisplayHelp = !bDisplayHelp;
}

function DisplayHelp()
{
    local Color Greenish;

    Greenish = MakeColor(0, 255, 50);
    Canvas.Font = Class'Engine'.static.GetSmallFont();
    Canvas.SetPos((Canvas.ClipX * 0.5) - float(80), float(Canvas.SizeY) * 0.3);
    Canvas.bCenter = true;
    DrawDebugHUDText("COMMANDS [work in progress]", Greenish);
    DrawDebugHUDText("[LEFT CLICK] While aiming at NPC to enable issuing commands to selected NPC:");
    DrawDebugHUDText("[RIGHT CLICK] Move or pathfind to click location, if possible");
    DrawDebugHUDText("[ESC] Turn off NPC Lock");
    DrawDebugHUDText("[END] Toggle PlayersOnly");
    DrawDebugHUDText("[DEL] ToggleDebugCamera (exits this mode)");
    DrawDebugHUDText("[N] Order selected NPC to attempt to pathfind and move to your pawn location");
    DrawDebugHUDText("[Z] Teleport your own pawn to debug camera location");
    DrawDebugHUDText("[P] Toggle Sprinting");
    DrawDebugHUDText("[R] Rotate toward crosshair dot");
    DrawDebugHUDText("[K] Force a combat action");
    DrawDebugHUDText("[L] Toggle camera mode, current view or auto-viewing selected NPC");
    DrawDebugHUDText("[M] Move NPC forward regardless of obstructions");
    DrawDebugHUDText("[H] Toggle displaying this help menu");
    DrawDebugHUDText("[O] Toggle displaying debug text");
}

event PostRender()
{
    local KFDebugCameraController DCC;
    local float XL, YL, X, Y;
    local string MyText;
    local TraceHitInfo HitInfo;
    local byte I;
    local Vector CamLoc, HitLoc, HitNormal, ZeroVec;
    local Rotator CamRot;
    local Actor HitActor;
    local KFPawn_Monster HitPawn;

    super(HUD).PostRender();
    DCC = KFDebugCameraController(PlayerOwner);
    if(DCC != none)
    {
        Canvas.SetDrawColor(0, 0, 255, 255);
        MyText = "KFDebugCameraHUD";
        Canvas.Font = Class'Engine'.static.GetSmallFont();
        Canvas.StrLen(MyText, XL, YL);
        X = float(Canvas.SizeX) * 0.05;
        Y = YL;
        YL += (float(2) * Y);
        Canvas.SetPos(X, YL);
        Canvas.DrawText(MyText, true);
        Canvas.SetDrawColor(128, 128, 128, 255);
        YL += Y;
        if(bDisplayHelp)
        {
            DisplayHelp();
        }
        if(bDrawAimBasedText)
        {
            CamLoc = DCC.PlayerCamera.CameraCache.POV.Location;
            CamRot = DCC.PlayerCamera.CameraCache.POV.Rotation;
            HitActor = Trace(HitLoc, HitNormal, ((vector(CamRot) * float(5000)) * float(20)) + CamLoc, CamLoc, true, ZeroVec, HitInfo);
            DrawDebugLine(HitLoc, HitLoc + (HitNormal * float(30)), 255, 255, 231);
            HitPawn = KFPawn_Monster(HitActor);
            if(HitPawn != none)
            {
                DCC.SelectedActor = HitPawn;
                DCC.SelectedKFPawn = HitPawn;
                DCC.bShowSelectedInfo = true;                
            }
            else
            {
                DCC.SelectedKFPawn = none;
                DCC.SelectedActor = none;
                DCC.bShowSelectedInfo = false;
            }
        }
        if((DCC.bShowSelectedInfo == true) && DCC.SelectedActor != none)
        {
            YL += Y;
            Canvas.SetPos(X, YL);
            Canvas.DrawText("--------------------------------------");
            YL += Y;
            Canvas.SetPos(X, YL);
            Canvas.DrawText(("Selected: '" $ string(DCC.SelectedActor.Name)) $ "'");
            SelectedKFPawn = DCC.SelectedKFPawn;
            if(SelectedKFPawn != none)
            {
                if(SelectedKFPawn.MyKFAIC != none)
                {
                    SelectedKFPawn.MyKFAIC.bPostRenderIfNotVisible = true;
                    I = byte(PostRenderedActors.Find(SelectedKFPawn.MyKFAIC);
                    if(I == -1)
                    {
                        PostRenderedActors.AddItem(SelectedKFPawn.MyKFAIC;
                    }
                    bShowOverlays = true;
                }
            }
        }
    }
}

function DrawCrosshair()
{
    local byte CrossHairAlpha;

    CrossHairAlpha = 255;
    Canvas.SetDrawColor(255, 255, 255, CrossHairAlpha);
    Canvas.SetPos(CenterX, CenterY);
    Canvas.DrawRect(4, 4);
}

defaultproperties
{
    bDrawDebugText=true
    bDrawCrosshair=true
    bShowOverlays=true
    bHidden=false
}