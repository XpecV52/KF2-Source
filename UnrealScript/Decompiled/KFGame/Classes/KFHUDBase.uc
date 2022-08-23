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

const KFID_QuickWeaponSelect = 100;
const KFID_CurrentLayoutIndex = 101;
const KFID_ForceFeedbackEnabled = 103;
const KFID_SavedPerkIndex = 105;
const KFID_AllowBloodSplatterDecals = 106;
const KFID_GoreLevel = 107;
const KFID_StoredCharIndex = 111;
const KFID_MasterVolumeMultiplier = 112;
const KFID_DialogVolumeMultiplier = 113;
const KFID_MusicVolumeMultiplier = 114;
const KFID_SFXVolumeMultiplier = 115;
const KFID_GammaMultiplier = 117;
const KFID_MusicVocalsEnabled = 118;
const KFID_MinimalChatter = 119;
const KFID_ShowCrossHair = 121;
const KFID_FOVOptionsPercentageValue = 122;
const KFID_ShowKillTicker = 123;
const KFID_FriendlyHudScale = 125;
const KFID_FavoriteWeapons = 127;
const KFID_GearLoadouts = 128;
const KFID_SetGamma = 129;
const KFID_RequiresPushToTalk = 130;
const KFID_InvertController = 131;
const KFID_AutoTargetEnabled = 132;
const KFID_GamepadSensitivityScale = 133;
const KFID_ZoomedSensitivityScale = 134;
const KFID_GamepadZoomedSensitivityScale = 135;
const KFID_EnableMouseSmoothing = 136;
const KFID_MouseSensitivity = 138;
const KFID_TargetAdhesionEnabled = 139;
const KFID_TargetFrictionEnabled = 140;
const KFID_InvertMouse = 142;
const KFID_DEPRECATED_143 = 143;
const KFID_SavedSoloModeIndex = 144;
const KFID_SavedSoloMapString = 145;
const KFID_SavedSoloDifficultyIndex = 146;
const KFID_SavedSoloLengthIndex = 147;
const KFID_SavedModeIndex = 148;
const KFID_SavedMapString = 149;
const KFID_SavedDifficultyIndex = 150;
const KFID_SavedLengthIndex = 151;
const KFID_SavedPrivacyIndex = 152;
const KFID_SavedServerTypeIndex = 153;
const KFID_SavedInProgressIndex = 154;
const KFID_ControllerSoundEnabled = 155;
const KFID_MatchmakingRegion = 156;
const KFID_UseAltAimOnDuals = 157;
const KFID_HideBossHealthBar = 158;
const KFID_AntiMotionSickness = 159;
const KFID_ShowWelderInInventory = 160;
const KFID_AutoTurnOff = 161;
const KFID_ReduceHightPitchSounds = 162;
const KFID_ShowConsoleCrossHair = 163;
const KFID_VOIPVolumeMultiplier = 164;
const KFID_WeaponSkinAssociations = 165;
const KFID_SavedEmoteId = 166;
const KFID_DisableAutoUpgrade = 167;
const KFID_SafeFrameScale = 168;

struct sHiddenHumanPawnInfo
{
    var Pawn HumanPawn;
    var PlayerReplicationInfo HumanPRI;

    structdefaultproperties
    {
        HumanPawn=none
        HumanPRI=none
    }
};

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
var const Color SupplierHalfUsableColor;
var const Color ZedIconColor;
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
var float HumanPlayerIconInterpMult;
var const Texture2D GenericHumanIconTexture;
var const Texture2D GenericZedIconTexture;

// Export UKFHUDBase::execDrawGlowText(FFrame&, void* const)
native function DrawGlowText(string Text, float X, float Y, optional float MaxHeightInPixels, optional float PulseTime, optional bool bRightJustified)
{
    MaxHeightInPixels = 0;
    PulseTime = -100;                                    
}

simulated function PostBeginPlay()
{
    local KFProfileSettings Profile;

    super.PostBeginPlay();
    bDrawCrosshair = Class'KFGameEngine'.static.IsCrosshairEnabled();
    bCachedShowOverlays = bShowOverlays;
    KFPlayerOwner = KFPlayerController(PlayerOwner);
    if((KFPlayerOwner != none) && KFPlayerOwner.OnlineSub != none)
    {
        Profile = KFProfileSettings(KFPlayerOwner.OnlineSub.PlayerInterface.GetProfileSettings(byte(LocalPlayer(PlayerOwner.Player).ControllerId)));
        if(Profile != none)
        {
            FriendlyHudScale = Profile.GetProfileFloat(125);
            FClamp(FriendlyHudScale, 0.25, 1);
        }
    }
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
    local KFPawn KFP;
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
        KFP = KFPawn(PlayerOwner.Pawn);
        bDrawCrosshairNoWeapon = KFP.bNeedsCrosshair;
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
        if(KFP.IsDoingSpecialMove() && !KFP.SpecialMoves[KFP.SpecialMove].CanDrawCrosshair())
        {
            return;
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
                if((KFP != none) && KFP.bIsSprinting)
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
    local Vector ViewLocation, ViewVector, PlayerPartyInfoLocation;
    local Rotator ViewRotation;
    local array<PlayerReplicationInfo> VisibleHumanPlayers;
    local array<sHiddenHumanPawnInfo> HiddenHumanPlayers;

    super.DrawHUD();
    if(KFGRI == none)
    {
        KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    }
    if((KFPlayerOwner != none) && KFPlayerOwner.bCinematicMode)
    {
        return;
    }
    if((KFPlayerOwner != none) && (bDrawCrosshair || bForceDrawCrosshair) || KFPlayerOwner.GetTeamNum() == 255)
    {
        DrawCrosshair();
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
            if(((KFPH.IsAliveAndWell() && KFPH != KFPlayerOwner.Pawn) && KFPH.Mesh.SkeletalMesh != none) && KFPH.Mesh.bAnimTreeInitialised)
            {
                PlayerPartyInfoLocation = KFPH.Mesh.GetPosition() + (KFPH.CylinderComponent.CollisionHeight * vect(0, 0, 1));
                if(((WorldInfo.TimeSeconds - KFPH.Mesh.LastRenderTime) < 0.2) && (Normal(PlayerPartyInfoLocation - ViewLocation) Dot ViewVector) > 0)
                {
                    if(DrawFriendlyHumanPlayerInfo(KFPH))
                    {
                        VisibleHumanPlayers.AddItem(KFPH.PlayerReplicationInfo;                        
                    }
                    else
                    {
                        HiddenHumanPlayers.Insert(0, 1;
                        HiddenHumanPlayers[0].HumanPawn = KFPH;
                        HiddenHumanPlayers[0].HumanPRI = KFPH.PlayerReplicationInfo;
                    }
                    continue;
                }
                HiddenHumanPlayers.Insert(0, 1;
                HiddenHumanPlayers[0].HumanPawn = KFPH;
                HiddenHumanPlayers[0].HumanPRI = KFPH.PlayerReplicationInfo;
            }            
        }        
        if(!KFGRI.bHidePawnIcons)
        {
            CheckAndDrawHiddenPlayerIcons(VisibleHumanPlayers, HiddenHumanPlayers);
            CheckAndDrawRemainingZedIcons();
        }
        Canvas.EnableStencilTest(false);
    }
}

simulated function bool DrawFriendlyHumanPlayerInfo(KFPawn_Human KFPH)
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
        return false;
    }
    MyFontRenderInfo = Canvas.CreateFontRenderInfo(true);
    BarLength = FMin(PlayerStatusBarLengthMax * (float(Canvas.SizeX) / 1024), PlayerStatusBarLengthMax) * FriendlyHudScale;
    BarHeight = FMin(8 * (float(Canvas.SizeX) / 1024), 8) * FriendlyHudScale;
    TargetLocation = KFPH.Mesh.GetPosition() + (KFPH.CylinderComponent.CollisionHeight * vect(0, 0, 2.2));
    ScreenPos = Canvas.Project(TargetLocation);
    if((((ScreenPos.X < float(0)) || ScreenPos.X > float(Canvas.SizeX)) || ScreenPos.Y < float(0)) || ScreenPos.Y > float(Canvas.SizeY))
    {
        return false;
    }
    Percentage = FMin(float(KFPH.Health) / float(KFPH.HealthMax), 100);
    DrawKFBar(Percentage, BarLength, BarHeight, ScreenPos.X - (BarLength * 0.5), ScreenPos.Y, HealthColor);
    Percentage = FMin(float(KFPH.Armor) / float(KFPH.MaxArmor), 100);
    DrawKFBar(Percentage, BarLength, BarHeight, ScreenPos.X - (BarLength * 0.5), ScreenPos.Y - BarHeight, ArmorColor);
    FontScale = Class'KFGameEngine'.static.GetKFFontScale();
    Canvas.Font = Class'KFGameEngine'.static.GetKFCanvasFont();
    Canvas.SetDrawColorStruct(PlayerBarTextColor);
    Canvas.SetPos(ScreenPos.X - (BarLength * 0.5), ScreenPos.Y - (BarHeight * 3.8));
    Canvas.DrawText(KFPRI.PlayerName,, FontScale * FriendlyHudScale, FontScale * FriendlyHudScale, MyFontRenderInfo);
    if(KFPRI.CurrentPerkClass == none)
    {
        return false;
    }
    Canvas.SetDrawColorStruct(PlayerBarIconColor);
    Canvas.SetPos(ScreenPos.X - (BarLength * 0.75), ScreenPos.Y - (BarHeight * 2));
    Canvas.DrawTile(KFPRI.CurrentPerkClass.default.PerkIcon, PlayerStatusIconSize * FriendlyHudScale, PlayerStatusIconSize * FriendlyHudScale, 0, 0, 256, 256);
    Canvas.SetDrawColorStruct(PlayerBarTextColor);
    Canvas.SetPos(ScreenPos.X - (BarLength * 0.5), ScreenPos.Y + (BarHeight * 0.6));
    Canvas.DrawText(string(KFPRI.GetActivePerkLevel()) @ KFPRI.CurrentPerkClass.default.PerkName,, FontScale * FriendlyHudScale, FontScale * FriendlyHudScale, MyFontRenderInfo);
    if((KFPRI.PerkSupplyLevel > 0) && KFPRI.CurrentPerkClass.static.GetInteractIcon() != none)
    {
        if(KFPRI.PerkSupplyLevel == 2)
        {
            if(KFPRI.bPerkPrimarySupplyUsed && KFPRI.bPerkSecondarySupplyUsed)
            {
                TempColor = SupplierActiveColor;                
            }
            else
            {
                if(KFPRI.bPerkPrimarySupplyUsed || KFPRI.bPerkSecondarySupplyUsed)
                {
                    TempColor = SupplierHalfUsableColor;                    
                }
                else
                {
                    TempColor = SupplierUsableColor;
                }
            }            
        }
        else
        {
            if(KFPRI.PerkSupplyLevel == 1)
            {
                TempColor = ((KFPRI.bPerkPrimarySupplyUsed) ? SupplierActiveColor : SupplierUsableColor);
            }
        }
        Canvas.SetDrawColorStruct(TempColor);
        Canvas.SetPos(ScreenPos.X + (BarLength * 0.5), ScreenPos.Y - (BarHeight * float(2)));
        Canvas.DrawTile(KFPRI.CurrentPerkClass.static.GetInteractIcon(), PlayerStatusIconSize * FriendlyHudScale, PlayerStatusIconSize * FriendlyHudScale, 0, 0, 256, 256);
    }
    return true;
}

simulated function DrawKFBar(float BarPercentage, float BarLength, float BarHeight, float XPos, float YPos, Color BarColor)
{
    Canvas.SetDrawColorStruct(PlayerBarBGColor);
    Canvas.SetPos(XPos, YPos);
    Canvas.DrawTile(PlayerStatusBarBGTexture, BarLength, BarHeight, 0, 0, 32, 32);
    Canvas.SetDrawColorStruct(BarColor);
    Canvas.SetPos(XPos, YPos + float(1));
    Canvas.DrawTile(PlayerStatusBarBGTexture, (BarLength - 2) * BarPercentage, BarHeight - 2, 0, 0, 32, 32);
}

simulated function CheckAndDrawHiddenPlayerIcons(array<PlayerReplicationInfo> VisibleHumanPlayers, array<sHiddenHumanPawnInfo> HiddenHumanPlayers)
{
    local int I, HiddenHumanIndex;
    local PlayerReplicationInfo PRI;
    local Vector ViewLocation, ViewVector, PawnLocation;
    local Rotator ViewRotation;
    local KFPlayerReplicationInfo KFPRI;
    local float ThisDot;

    if(WorldInfo.GRI == none)
    {
        return;
    }
    if(KFPlayerOwner.PlayerCamera != none)
    {
        KFPlayerOwner.PlayerCamera.GetCameraViewPoint(ViewLocation, ViewRotation);
    }
    ViewVector = vector(ViewRotation);
    I = 0;
    J0xB0:

    if(I < WorldInfo.GRI.PRIArray.Length)
    {
        PawnLocation = vect(0, 0, 0);
        PRI = WorldInfo.GRI.PRIArray[I];
        if(((VisibleHumanPlayers.Find(PRI != -1) || KFPlayerOwner.PlayerReplicationInfo == PRI) || PRI.GetTeamNum() == 255)
        {            
        }
        else
        {
            HiddenHumanIndex = HiddenHumanPlayers.Find('HumanPRI', PRI;
            if((((HiddenHumanIndex != -1) && HiddenHumanPlayers[HiddenHumanIndex].HumanPawn != none) && HiddenHumanPlayers[HiddenHumanIndex].HumanPawn.Mesh.SkeletalMesh != none) && HiddenHumanPlayers[HiddenHumanIndex].HumanPawn.Mesh.bAnimTreeInitialised)
            {
                PawnLocation = HiddenHumanPlayers[HiddenHumanIndex].HumanPawn.Mesh.GetPosition();
                KFPRI = KFPlayerReplicationInfo(PRI);
                if(KFPRI != none)
                {
                    KFPRI.SetSmoothedPawnIconLocation(PawnLocation);
                }
            }
            if(IsZero(PawnLocation))
            {
                KFPRI = KFPlayerReplicationInfo(PRI);
                if(KFPRI != none)
                {
                    PawnLocation = KFPRI.GetSmoothedPawnIconLocation(HumanPlayerIconInterpMult);
                    if(IsZero(PawnLocation) || KFPRI.PlayerHealth <= 0)
                    {
                        goto J0x4E0;
                    }                    
                }
                else
                {
                    goto J0x4E0;
                }
            }
            ThisDot = Normal((PawnLocation + (Class'KFPawn_Human'.default.CylinderComponent.CollisionHeight * vect(0, 0, 1))) - ViewLocation) Dot ViewVector;
            if(ThisDot > 0)
            {
                DrawHiddenHumanPlayerIcon(PRI, PawnLocation);
            }
        }
        J0x4E0:

        ++ I;
        goto J0xB0;
    }
}

function DrawHiddenHumanPlayerIcon(PlayerReplicationInfo PRI, Vector IconWorldLocation)
{
    local Vector ScreenPos;
    local float IconSizeMult;
    local KFPlayerReplicationInfo KFPRI;
    local Texture2D PlayerIcon;

    KFPRI = KFPlayerReplicationInfo(PRI);
    if(KFPRI == none)
    {
        return;
    }
    ScreenPos = Canvas.Project(IconWorldLocation + (vect(0, 0, 2.2) * Class'KFPawn_Human'.default.CylinderComponent.CollisionHeight));
    IconSizeMult = (PlayerStatusIconSize * FriendlyHudScale) * 0.5;
    ScreenPos.X -= IconSizeMult;
    ScreenPos.Y -= IconSizeMult;
    if((((ScreenPos.X < float(0)) || ScreenPos.X > float(Canvas.SizeX)) || ScreenPos.Y < float(0)) || ScreenPos.Y > float(Canvas.SizeY))
    {
        return;
    }
    PlayerIcon = ((PlayerOwner.GetTeamNum() == 0) ? KFPRI.CurrentPerkClass.default.PerkIcon : GenericHumanIconTexture);
    Canvas.SetDrawColor(255, 255, 255, 255);
    Canvas.SetPos(ScreenPos.X, ScreenPos.Y);
    Canvas.DrawTile(PlayerIcon, PlayerStatusIconSize * FriendlyHudScale, PlayerStatusIconSize * FriendlyHudScale, 0, 0, 256, 256);
}

function CheckAndDrawRemainingZedIcons()
{
    local Pawn P;
    local Vector ViewLocation, ViewDir, PawnLocation;
    local Rotator ViewRotation;

    if(((((KFGRI == none) || KFPlayerOwner == none) || KFPlayerOwner.PlayerCamera == none) || KFGRI.WaveNum == KFGRI.WaveMax) || float(KFGRI.AIRemaining) > Class'KFGameInfo'.static.GetNumAlwaysRelevantZeds())
    {
        return;
    }
    KFPlayerOwner.PlayerCamera.GetCameraViewPoint(ViewLocation, ViewRotation);
    ViewDir = vector(ViewRotation);
    foreach WorldInfo.AllPawns(Class'Pawn', P)
    {
        if(((((P.Mesh.SkeletalMesh == none) || !P.Mesh.bAnimTreeInitialised) || P.GetTeamNum() == PlayerOwner.GetTeamNum()) || !P.IsAliveAndWell()) || (WorldInfo.TimeSeconds - P.Mesh.LastRenderTime) < 0.2)
        {
            continue;            
        }
        PawnLocation = P.Mesh.GetPosition();
        if((Normal((PawnLocation + (P.CylinderComponent.CollisionHeight * vect(0, 0, 1))) - ViewLocation) Dot ViewDir) > 0)
        {
            DrawZedIcon(P, PawnLocation);
        }        
    }    
}

function DrawZedIcon(Pawn ZedPawn, Vector PawnLocation)
{
    local Vector ScreenPos, TargetLocation;
    local float IconSizeMult;

    TargetLocation = PawnLocation + (vect(0, 0, 2.2) * ZedPawn.CylinderComponent.CollisionHeight);
    ScreenPos = Canvas.Project(TargetLocation);
    IconSizeMult = (PlayerStatusIconSize * FriendlyHudScale) * 0.5;
    ScreenPos.X -= IconSizeMult;
    ScreenPos.Y -= IconSizeMult;
    if((((ScreenPos.X < float(0)) || ScreenPos.X > float(Canvas.SizeX)) || ScreenPos.Y < float(0)) || ScreenPos.Y > float(Canvas.SizeY))
    {
        return;
    }
    Canvas.SetDrawColorStruct(ZedIconColor);
    Canvas.SetPos(ScreenPos.X, ScreenPos.Y);
    Canvas.DrawTile(GenericZedIconTexture, PlayerStatusIconSize * FriendlyHudScale, PlayerStatusIconSize * FriendlyHudScale, 0, 0, 128, 128);
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
    HealthColor=(B=255,G=210,R=95,A=192)
    PlayerBarBGColor=(B=0,G=0,R=0,A=192)
    PlayerBarTextColor=(B=192,G=192,R=192,A=192)
    PlayerBarIconColor=(B=192,G=192,R=192,A=192)
    SupplierActiveColor=(B=128,G=128,R=128,A=192)
    SupplierUsableColor=(B=0,G=0,R=255,A=192)
    SupplierHalfUsableColor=(B=0,G=200,R=220,A=192)
    ZedIconColor=(B=255,G=255,R=255,A=192)
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
    HumanPlayerIconInterpMult=0.007
    GenericHumanIconTexture=Texture2D'UI_PerkIcons_TEX.UI_Horzine_H_Logo'
    GenericZedIconTexture=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_ZED'
}