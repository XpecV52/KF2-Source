/*******************************************************************************
 * KFHUDBase generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFHUDBase extends HUD
    transient
    native(UI)
    config(Game)
    hidecategories(Navigation);

var KFPlayerController KFPlayerOwner;
var KFGameReplicationInfo KFGRI;
var const Texture2D IconHudTexture;
var const Color BlackColor;
var const Color GoldColor;
var const Color LightGoldColor;
var const Color LightGreenColor;
var const Color ArmorColor;
var const Color HealthColor;
var const Color PlayerBarBGColor;
var const Color PlayerBarTextColor;
var const Color PlayerBarIconColor;
var const Color SupplierActiveColor;
var const Color SupplierUsableColor;
var float ResolutionScale;
var float ResolutionScaleX;
var config float FriendlyHudScale;
var Font GlowFonts[2];
var FontRenderInfo TextRenderInfo;
var float PulseDuration;
var float PulseSplit;
var float PulseMultiplier;
var bool bCachedShowOverlays;
var bool bDrawCrosshair;
var bool bForceDrawCrosshair;
var bool bCrosshairOnFriendly;
var bool bGreenCrosshair;
var const FontRenderInfo Text_NoClipShadowed;
var float TargetCrossHairMod;
var float CurrentCrossHairMod;
/** Base size of the weapon crosshair */
var(Crosshair) float BaseCrosshairSize;
/** Used to scale the spread of the crosshair based on the Spread of the weapon */
var(Crosshair) InterpCurveFloat CrosshairAccuracyScale;
var Texture2D PlayerStatusBarBGTexture;
var const float PlayerStatusBarLengthMax;
var const float PlayerStatusIconSize;

// Export UKFHUDBase::execDrawGlowText(FFrame&, void* const)
native function DrawGlowText(string Text, float X, float Y, optional float MaxHeightInPixels, optional float PulseTime, optional bool bRightJustified)
{
    MaxHeightInPixels = 0;
    PulseTime = -100;                                    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    bCachedShowOverlays = bShowOverlays;
    KFPlayerOwner = KFPlayerController(PlayerOwner);
    bDrawCrosshair = Class'KFGameEngine'.static.IsCrosshairEnabled();
}

function PreCalcValues()
{
    super.PreCalcValues();
    if(KFPlayerOwner != none)
    {
        KFPlayerOwner.NotifyResolutionChanged(SizeX, SizeY);
    }
}

function ResolutionChanged();

function SetShowOverlays(bool bShow)
{
    bShowOverlays = bShow;
}

function DrawCrosshair()
{
    local float CrosshairSize, CrossHairSpread;
    local KFWeapon KFWP;
    local bool bMonsterPawn, bDrawCrosshairNoWeapon;
    local byte CrossHairAlpha;
    local float WeaponAccuracyAdjust, WeaponRecoilAdjust, WeaponRecoilMod;
    local KFPerk MyKFPerk;

    CrosshairSize = 6;
    if((PlayerOwner.Pawn != none) && PlayerOwner.Pawn.Health > 0)
    {
        KFWP = KFWeapon(PlayerOwner.Pawn.Weapon);
        MyKFPerk = KFPlayerController(PlayerOwner).GetPerk();
        bMonsterPawn = PlayerOwner.GetTeamNum() == 255;
        bDrawCrosshairNoWeapon = KFPawn(PlayerOwner.Pawn).bNeedsCrosshair;
        if(bMonsterPawn)
        {
            if(!bDrawCrosshairNoWeapon)
            {
                return;
            }
        }
        if(!bDrawCrosshairNoWeapon)
        {
            if(((!bMonsterPawn && MyKFPerk == none) || KFWP == none) || !bForceDrawCrosshair && KFWP.bUsingSights)
            {
                return;
            }
            if((KFWP.Spread.Length == 0) && !bForceDrawCrosshair)
            {
                return;
            }
        }
        TargetCrossHairMod = 1;
        if(bForceDrawCrosshair)
        {
            TargetCrossHairMod = 1E-07;            
        }
        else
        {
            if(bDrawCrosshairNoWeapon)
            {
                TargetCrossHairMod = 0.4;
            }
        }
        if(KFWP != none)
        {
            if(!bForceDrawCrosshair)
            {
                WeaponAccuracyAdjust = EvalInterpCurveFloat(CrosshairAccuracyScale, KFWP.Spread[0]);
                TargetCrossHairMod *= WeaponAccuracyAdjust;
            }
            WeaponRecoilMod = ((KFWP.RecoilPitchPercentage > KFWP.RecoilYawPercentage) ? KFWP.RecoilPitchPercentage : KFWP.RecoilYawPercentage);
            WeaponRecoilAdjust = Lerp(1, 2.5, WeaponRecoilMod);
            TargetCrossHairMod *= WeaponRecoilAdjust;
        }
        if((MyKFPerk == none) || !MyKFPerk.IsShootAndMoveActive())
        {
            if(PlayerOwner.Pawn.Physics == 2)
            {
                if(KFWP == none)
                {
                    TargetCrossHairMod *= Class'KFWeapon'.default.FallingRecoilModifier;                    
                }
                else
                {
                    TargetCrossHairMod *= KFWP.FallingRecoilModifier;
                }                
            }
            else
            {
                if((KFPawn(PlayerOwner.Pawn) != none) && KFPawn(PlayerOwner.Pawn).bIsSprinting)
                {
                    TargetCrossHairMod *= 3;                    
                }
                else
                {
                    if(PlayerOwner.Pawn.bIsCrouched)
                    {
                        if(KFWP == none)
                        {
                            TargetCrossHairMod *= Class'KFWeapon'.default.CrouchSpreadMod;                            
                        }
                        else
                        {
                            TargetCrossHairMod *= KFWP.CrouchSpreadMod;
                        }
                    }
                    if((VSizeSq(PlayerOwner.Pawn.Velocity) > float(50)) && (KFWP == none) || !KFWP.bZoomingOut)
                    {
                        if(KFWP == none)
                        {
                            TargetCrossHairMod *= Class'KFWeapon'.default.JoggingRecoilModifier;                            
                        }
                        else
                        {
                            if(!KFWP.bZoomingOut)
                            {
                                TargetCrossHairMod *= KFWP.JoggingRecoilModifier;
                            }
                        }
                    }
                    if(MyKFPerk != none)
                    {
                        MyKFPerk.ModifySpread(TargetCrossHairMod);
                    }
                }
            }
        }
        if(CurrentCrossHairMod > TargetCrossHairMod)
        {
            CurrentCrossHairMod -= (RenderDelta * 6);
            if(CurrentCrossHairMod < TargetCrossHairMod)
            {
                CurrentCrossHairMod = TargetCrossHairMod;
            }            
        }
        else
        {
            if(CurrentCrossHairMod < TargetCrossHairMod)
            {
                CurrentCrossHairMod += (RenderDelta * 6);
                if(CurrentCrossHairMod > TargetCrossHairMod)
                {
                    CurrentCrossHairMod = TargetCrossHairMod;
                }
            }
        }
        CrosshairSize *= RatioY;
        CrossHairSpread = (BaseCrosshairSize * RatioY) * CurrentCrossHairMod;
        CrossHairAlpha = 210;
        if(bForceDrawCrosshair)
        {
            Canvas.SetDrawColor(255, 255, 255, CrossHairAlpha);
            Canvas.SetPos(CenterX, CenterY);
            Canvas.DrawRect(1, 1);
        }
        Canvas.SetDrawColor(0, 0, 0, CrossHairAlpha);
        Canvas.SetPos((CenterX - (CrosshairSize + CrossHairSpread)) - float(1), CenterY - float(1));
        Canvas.DrawRect(CrosshairSize + float(1), 3);
        Canvas.SetDrawColor(255, 255, 255, CrossHairAlpha);
        Canvas.SetPos(CenterX - (CrosshairSize + CrossHairSpread), CenterY);
        Canvas.DrawRect(CrosshairSize, 1);
        Canvas.SetDrawColor(0, 0, 0, CrossHairAlpha);
        Canvas.SetPos((CenterX + CrossHairSpread) + float(1), CenterY - float(1));
        Canvas.DrawRect(CrosshairSize + float(1), 3);
        Canvas.SetDrawColor(255, 255, 255, CrossHairAlpha);
        Canvas.SetPos((CenterX + CrossHairSpread) + float(1), CenterY);
        Canvas.DrawRect(CrosshairSize, 1);
        Canvas.SetDrawColor(0, 0, 0, CrossHairAlpha);
        Canvas.SetPos(CenterX - float(1), (CenterY - (CrosshairSize + CrossHairSpread)) - float(1));
        Canvas.DrawRect(3, CrosshairSize + float(1));
        Canvas.SetDrawColor(255, 255, 255, CrossHairAlpha);
        Canvas.SetPos(CenterX, CenterY - (CrosshairSize + CrossHairSpread));
        Canvas.DrawRect(1, CrosshairSize);
        Canvas.SetDrawColor(0, 0, 0, CrossHairAlpha);
        Canvas.SetPos(CenterX - float(1), (CenterY + CrossHairSpread) + float(1));
        Canvas.DrawRect(3, CrosshairSize + float(1));
        Canvas.SetDrawColor(255, 255, 255, CrossHairAlpha);
        Canvas.SetPos(CenterX, (CenterY + CrossHairSpread) + float(1));
        Canvas.DrawRect(1, CrosshairSize);
    }
}

function OnCloseAnimComplete();

function OnOpenAnimComplete();

function RemoveMovies();

function SetVisible(bool bNewVisible)
{
    bShowHUD = bNewVisible;
}

function CloseOtherMenus();

function TogglePauseMenu();

function CompletePauseMenuClose();

exec function ReleaseShowScores();

function int GetLocalPlayerOwnerIndex()
{
    return Class'Engine'.static.GetEngine().GamePlayers.Find(LocalPlayer(PlayerOwner.Player);
}

exec function SetShowScores(bool bEnableShowScores);

exec function ToggleLeaderboard();

exec function SetShowLeaderboard(bool bEnableLeaderboard);

function DrawToolTip(Canvas Cvs, PlayerController PC, string Command, float X, float Y, float U, float V, float UL, float VL, float ResScale, optional Texture2D IconTexture, optional float Alpha)
{
    IconTexture = default.IconHudTexture;
    Alpha = 1;
}

function bool CheckCrosshairOnFriendly()
{
    return true;
}

simulated function DrawShadowedTile(Texture2D Tex, float X, float Y, float XL, float YL, float U, float V, float UL, float VL, Color TileColor, optional bool bScaleToRes)
{
    local Color B;

    B = BlackColor;
    B.A = TileColor.A;
    XL *= ((bScaleToRes) ? ResolutionScale : 1);
    YL *= ((bScaleToRes) ? ResolutionScale : 1);
    Canvas.SetPos(X + float(1), Y + float(1));
    Canvas.DrawColor = B;
    Canvas.DrawTile(Tex, XL, YL, U, V, UL, VL);
    Canvas.SetPos(X, Y);
    Canvas.DrawColor = TileColor;
    Canvas.DrawTile(Tex, XL, YL, U, V, UL, VL);
}

simulated function DrawShadowedStretchedTile(Texture2D Tex, float X, float Y, float XL, float YL, float U, float V, float UL, float VL, Color TileColor, optional bool bScaleToRes)
{
    local LinearColor C, B;

    C = ColorToLinearColor(TileColor);
    B = ColorToLinearColor(BlackColor);
    B.A = C.A;
    XL *= ((bScaleToRes) ? ResolutionScale : 1);
    YL *= ((bScaleToRes) ? ResolutionScale : 1);
    Canvas.SetPos(X + float(1), Y + float(1));
    Canvas.DrawTileStretched(Tex, XL, YL, U, V, UL, VL, B);
    Canvas.SetPos(X, Y);
    Canvas.DrawColor = TileColor;
    Canvas.DrawTileStretched(Tex, XL, YL, U, V, UL, VL, C);
}

simulated function DrawShadowedRotatedTile(Texture2D Tex, Rotator Rot, float X, float Y, float XL, float YL, float U, float V, float UL, float VL, Color TileColor, optional bool bScaleToRes)
{
    local Color B;

    B = BlackColor;
    B.A = TileColor.A;
    XL *= ((bScaleToRes) ? ResolutionScale : 1);
    YL *= ((bScaleToRes) ? ResolutionScale : 1);
    Canvas.SetPos(X + float(1), Y + float(1));
    Canvas.DrawColor = B;
    Canvas.DrawRotatedTile(Tex, Rot, XL, YL, U, V, UL, VL);
    Canvas.SetPos(X, Y);
    Canvas.DrawColor = TileColor;
    Canvas.DrawRotatedTile(Tex, Rot, XL, YL, U, V, UL, VL);
}

function DrawHUD()
{
    local KFPawn_Human KFPH;
    local float ThisDot;
    local Vector ViewLocation, ViewVector, PlayerPartyInfoLocation;
    local Rotator ViewRotation;

    super.DrawHUD();
    if((bDrawCrosshair || bForceDrawCrosshair) || (KFPlayerOwner != none) && KFPlayerOwner.GetTeamNum() == 255)
    {
        if((KFPlayerOwner != none) && !KFPlayerOwner.bCinematicMode)
        {
            DrawCrosshair();
        }
    }
    if(PlayerOwner.GetTeamNum() == 0)
    {
        if(KFPlayerOwner != none)
        {
            KFPlayerOwner.GetPlayerViewPoint(ViewLocation, ViewRotation);
        }
        ViewVector = vector(ViewRotation);
        Canvas.EnableStencilTest(true);
        foreach WorldInfo.AllPawns(Class'KFPawn_Human', KFPH)
        {
            PlayerPartyInfoLocation = (KFPH.Location + KFPH.MTO_PhysSmoothOffset) + (KFPH.CylinderComponent.CollisionHeight * vect(0, 0, 1));
            ThisDot = Normal(PlayerPartyInfoLocation - ViewLocation) Dot Normal(ViewVector);
            if(KFPH.IsAliveAndWell() && KFPH != KFPlayerOwner.Pawn)
            {
                if(((WorldInfo.TimeSeconds - KFPH.Mesh.LastRenderTime) < 0.4) && (ThisDot > float(0)) && ThisDot < 1)
                {
                    DrawFriendlyHUD(KFPH);
                }
            }            
        }        
        Canvas.EnableStencilTest(false);
    }
}

simulated function DrawFriendlyHUD(KFPawn_Human KFPH)
{
    local float Percentage, BarHeight, BarLength;
    local Vector ScreenPos, TargetLocation;
    local KFPlayerReplicationInfo KFPRI;
    local FontRenderInfo MyFontRenderInfo;
    local float FontScale;
    local Color TempColor;

    KFPRI = KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo);
    if(KFPRI == none)
    {
        return;
    }
    MyFontRenderInfo = Canvas.CreateFontRenderInfo(true);
    BarLength = FMin(PlayerStatusBarLengthMax * (float(Canvas.SizeX) / 1024), PlayerStatusBarLengthMax) * FriendlyHudScale;
    BarHeight = FMin(8 * (float(Canvas.SizeX) / 1024), 8) * FriendlyHudScale;
    TargetLocation = KFPH.Location + ((vect(0, 0, 1) * KFPH.GetCollisionHeight()) * 1.2);
    ScreenPos = Canvas.Project(TargetLocation);
    if((((ScreenPos.X < float(0)) || ScreenPos.X > float(Canvas.SizeX)) || ScreenPos.Y < float(0)) || ScreenPos.Y > float(Canvas.SizeY))
    {
        return;
    }
    Percentage = FMin(float(KFPH.Health) / float(KFPH.HealthMax), 100);
    DrawKFBar(Percentage, BarLength, BarHeight, ScreenPos.X - (BarLength * 0.5), ScreenPos.Y, HealthColor);
    Percentage = FMin(float(KFPH.Armor) / float(KFPH.MaxArmor), 100);
    DrawKFBar(Percentage, BarLength, BarHeight, ScreenPos.X - (BarLength * 0.5), ScreenPos.Y - BarHeight, ArmorColor);
    FontScale = Class'KFGameEngine'.static.GetKFFontScale();
    Canvas.Font = Class'KFGameEngine'.static.GetKFCanvasFont();
    Canvas.SetDrawColorStruct(PlayerBarTextColor);
    Canvas.SetPos(ScreenPos.X - (BarLength * 0.5), ScreenPos.Y - (BarHeight * float(3)));
    Canvas.DrawText(KFPRI.PlayerName,, FontScale * FriendlyHudScale, FontScale * FriendlyHudScale, MyFontRenderInfo);
    if(KFPRI.CurrentPerkClass == none)
    {
        return;
    }
    Canvas.SetDrawColorStruct(PlayerBarIconColor);
    Canvas.SetPos(ScreenPos.X - (BarLength * 0.75), ScreenPos.Y - (BarHeight * float(2)));
    Canvas.DrawTile(KFPRI.CurrentPerkClass.default.PerkIcon, PlayerStatusIconSize * FriendlyHudScale, PlayerStatusIconSize * FriendlyHudScale, 0, 0, 256, 256);
    Canvas.SetDrawColorStruct(PlayerBarTextColor);
    Canvas.SetPos(ScreenPos.X - (BarLength * 0.5), ScreenPos.Y + BarHeight);
    Canvas.DrawText(string(KFPRI.GetActivePerkLevel()) @ KFPRI.CurrentPerkClass.default.PerkName,, FontScale * FriendlyHudScale, FontScale * FriendlyHudScale, MyFontRenderInfo);
    if(KFPRI.bPerkCanSupply && KFPRI.CurrentPerkClass.static.GetInteractIcon() != none)
    {
        TempColor = ((KFPRI.bPerkSupplyUsed) ? SupplierActiveColor : SupplierUsableColor);
        Canvas.SetDrawColorStruct(TempColor);
        Canvas.SetPos(ScreenPos.X + (BarLength * 0.5), ScreenPos.Y - (BarHeight * float(2)));
        Canvas.DrawTile(KFPRI.CurrentPerkClass.static.GetInteractIcon(), PlayerStatusIconSize * FriendlyHudScale, PlayerStatusIconSize * FriendlyHudScale, 0, 0, 256, 256);
    }
}

simulated function DrawKFBar(float BarPercentage, float BarLength, float BarHeight, float XPos, float YPos, Color BarColor)
{
    Canvas.SetDrawColorStruct(PlayerBarBGColor);
    Canvas.SetPos(XPos, YPos);
    Canvas.DrawTileStretched(PlayerStatusBarBGTexture, BarLength, BarHeight, 0, 0, 32, 32);
    Canvas.SetDrawColorStruct(BarColor);
    Canvas.SetPos(XPos, YPos + float(1));
    Canvas.DrawTileStretched(PlayerStatusBarBGTexture, (BarLength - 2) * BarPercentage, BarHeight - 2, 0, 0, 32, 32);
}

event OnLostFocusPause(bool bEnable)
{
    if((WorldInfo.NetMode == NM_Standalone) && KFPlayerOwner.MyGFxManager.bMenusOpen)
    {
        return;
    }
    super.OnLostFocusPause(bEnable);
}

function SetPostRenderingFor(bool bOn, Actor A)
{
    if(bOn)
    {
        A.bPostRenderIfNotVisible = true;
        if(!bShowOverlays)
        {
            SetShowOverlays(true);
        }
        AddPostRenderedActor(A);        
    }
    else
    {
        bPostRenderIfNotVisible = default.bPostRenderIfNotVisible;
        SetShowOverlays(default.bShowOverlays);
        RemovePostRenderedActor(A);
    }
}

defaultproperties
{
    ArmorColor=(B=255,G=0,R=0,A=192)
    HealthColor=(B=0,G=0,R=255,A=192)
    PlayerBarBGColor=(B=0,G=0,R=0,A=192)
    PlayerBarTextColor=(B=192,G=192,R=192,A=192)
    PlayerBarIconColor=(B=192,G=192,R=192,A=192)
    SupplierActiveColor=(B=128,G=128,R=128,A=192)
    SupplierUsableColor=(B=0,G=0,R=255,A=192)
    FriendlyHudScale=1
    TextRenderInfo=(bClipText=false,bEnableShadow=false,GlowInfo=(bEnableGlow=false,GlowColor=(R=0,G=0,B=0,A=1),GlowOuterRadius=(X=0,Y=0),GlowInnerRadius=(X=0,Y=0)))
    PulseDuration=0.33
    PulseSplit=0.25
    PulseMultiplier=0.5
    Text_NoClipShadowed=(bClipText=false,bEnableShadow=true,GlowInfo=(bEnableGlow=false,GlowColor=(R=0,G=0,B=0,A=1),GlowOuterRadius=(X=0,Y=0),GlowInnerRadius=(X=0,Y=0)))
    BaseCrosshairSize=50
    CrosshairAccuracyScale=(Points=/* Array type was not detected. */,InVal=0.0001,OutVal=0.4,ArriveTangent=0,LeaveTangent=0,InterpMode=EInterpCurveMode.CIM_Linear)
    PlayerStatusBarBGTexture=Texture2D'EngineResources.WhiteSquareTexture'
    PlayerStatusBarLengthMax=150
    PlayerStatusIconSize=32
}