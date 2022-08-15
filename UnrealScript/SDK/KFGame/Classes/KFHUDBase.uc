//=============================================================================
// KFHUDBase
//=============================================================================
// The Killing Floor 2 base HUD class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Based on UDKHUD/UTBASEHUD Copyright 1998-2012 Epic Games, Inc.
//  - Christian "schneidzekk" Schneider 8/22/2012
//=============================================================================

class KFHUDBase extends HUD
	native(UI)
	dependson(KFWeapon)
	config(Game);

/** Cached a typed Player controller.  Unlike PawnOwner we only set this once in PostBeginPlay */
var KFPlayerController KFPlayerOwner;

/** Cached reference to the GRI */
var KFGameReplicationInfo KFGRI;

var const Texture2D IconHudTexture;

/** Various colors */
var const color BlackColor, GoldColor;
var const color LightGoldColor, LightGreenColor;

var const color ArmorColor, HealthColor;
var const color PlayerBarBGColor, PlayerBarTextColor, PlayerBarIconColor;
var const color SupplierActiveColor, SupplierUsableColor;

/** Holds the scaling factor given the current resolution.  This is calculated in PostRender() */
var float ResolutionScale, ResolutionScaleX;

/*********************************************************************************************
 Friendly HUD
********************************************************************************************* */

var config  float FriendlyHudScale;

/*********************************************************************************************
 DrawGlowText()
********************************************************************************************* */

var font			GlowFonts[2];	// 0 = the Glow, 1 = Text
var FontRenderInfo	TextRenderInfo;

/** How long should the pulse take total */
var float PulseDuration;
/** When should the pulse switch from Out to in */
var float PulseSplit;
/** How much should the text pulse - NOTE this will be added to 1.0 (so PulseMultipler 0.5 = 1.5) */
var float PulseMultiplier;

/*********************************************************************************************
 Debugging Related (showdebug)
********************************************************************************************* */

var bool	bCachedShowOverlays;
var const	FontRenderInfo Text_NoClipShadowed;

/*********************************************************************************************
 Crosshair - Added by Ramm
********************************************************************************************* */

/** Whether the crosshair should be drawn at this moment */
var	bool	bDrawCrosshair;
/** Whether or not we should force draw the crosshair for debugging (Toggled from exec ToggleCrosshair in KFCheatManager) */
var bool    bForceDrawCrosshair;

/** The target crosshair spread we are blending to */
var float TargetCrossHairMod;
/** The current crosshair spread value */
var float CurrentCrossHairMod;
/** Base size of the weapon crosshair */
var(Crosshair) float BaseCrosshairSize;
/** Used to scale the spread of the crosshair based on the Spread of the weapon */
var(Crosshair)	InterpCurveFloat	CrosshairAccuracyScale;

/** If true, we will alter the crosshair when it's over a friendly */
var bool bCrosshairOnFriendly;

/** Make the crosshair green (found valid friendly) */
var bool bGreenCrosshair;

//-----------------------------------------------------------------------------------------

var 	Texture2d					PlayerStatusBarBGTexture;
var 	const float 				PlayerStatusBarLengthMax;
var 	const float					PlayerStatusIconSize;

/**
 * Draw a glowing string
 */
native function DrawGlowText(string Text, float X, float Y, optional float MaxHeightInPixels=0.0, optional float PulseTime=-100.0, optional bool bRightJustified);


simulated function PostBeginPlay()
{
	super.PostBeginPlay();

	bCachedShowOverlays = bShowOverlays;

	KFPlayerOwner = KFPlayerController(PlayerOwner);

	bDrawCrosshair = class'KFGameEngine'.static.IsCrosshairEnabled();
}

/**
 * Pre-Calculate most common values, to avoid doing 1200 times the same operations
 */
function PreCalcValues()
{
	super.PreCalcValues();

	// Let the PC know that the resolution has changed
	if ( KFPlayerOwner != None )
	{
	   KFPlayerOwner.NotifyResolutionChanged(SizeX, SizeY);
	}
}

/**
  * Reset movies since resolution changed
  */
function ResolutionChanged()
{
}

/**
  * Currently used to let some actors render HUD debug text
  */
function SetShowOverlays( bool bShow )
{
	bShowOverlays = bShow;
}

/**
 * Draw the crosshair
 */
function DrawCrosshair()
{
	local float CrosshairSize;
	local float CrossHairSpread;
	local KFWeapon KFWP;
	local byte CrossHairAlpha;
	local float WeaponAccuracyAdjust;
	local float WeaponRecoilAdjust;
	local float WeaponRecoilMod;
	local KFPerk MyKFPerk;

	CrosshairSize = 6;

	// Only draw the crosshair if we're not in a vehicle and we have a living pawn
    if ( PlayerOwner.Pawn != none && PlayerOwner.Pawn.Health > 0  )
	{
		KFWP = KFWeapon(PlayerOwner.Pawn.Weapon);
		MyKFPerk = KFPlayerController(PlayerOwner).GetPerk();

		// Don't draw the crosshair if we don't have a weapon, or are using ironsights
        if( MyKFPerk == none || KFWP == none || !bForceDrawCrosshair && (KFWP.bUsingSights /*|| KFWP.bResting*/) )
		{
            return;
		}

		// Skip if weapon is missing spread settings
		if ( KFWP.Spread.Length == 0 && !bForceDrawCrosshair )
		{
			return;
		}

        TargetCrossHairMod = 1.0;

        // Have the crosshair really small if we are forcing it for debugging
        if( bForceDrawCrosshair )
        {
            TargetCrossHairMod = 0.0000001;
        }

        // Scale up the crosshair if the player is focusing - TODO: make this more precise based on FOV
        /*if( KFPlayerController(PlayerOwner) != none && KFPlayerController(PlayerOwner).bIsFocusing )
        {
            TargetCrossHairMod *= 2.15;
        }*/

        if( !bForceDrawCrosshair )
        {
            WeaponAccuracyAdjust = EvalInterpCurveFloat(CrosshairAccuracyScale, KFWP.Spread[0]);
            // Scale spread based on weapon accuracy
            TargetCrossHairMod *= WeaponAccuracyAdjust;
        }

        WeaponRecoilMod = KFWP.RecoilPitchPercentage > KFWP.RecoilYawPercentage ? KFWP.RecoilPitchPercentage : KFWP.RecoilYawPercentage;

        // Scale up the recoil spread based on how far away the weapon has rotated from center due to recoil
        WeaponRecoilAdjust = Lerp(1.0,2.5,WeaponRecoilMod);

        // Scale spread based on weapon recoil
        TargetCrossHairMod *= WeaponRecoilAdjust;

        // Figure out the crosshair spread based on the pawn and weapon's state
        if ( !MyKFPerk.IsShootAndMoveActive() )
        {
	        if( PlayerOwner.Pawn.Physics == PHYS_Falling )
	        {
	            TargetCrossHairMod *= KFWP.FallingRecoilModifier;
	        }
	        else if( KFPawn(PlayerOwner.Pawn) != none && KFPawn(PlayerOwner.Pawn).bIsSprinting )
	        {
	            TargetCrossHairMod *= 3.0;
	        }
	        else
	        {
	            if( PlayerOwner.Pawn.bIsCrouched )
	            {
	                TargetCrossHairMod *= KFWP.CrouchSpreadMod;
	            }

	            if( VSizeSq(PlayerOwner.Pawn.Velocity) > 50 && !KFWP.bZoomingOut )
	            {
	                TargetCrossHairMod *= KFWP.JoggingRecoilModifier;
	            }

	            MyKFPerk.ModifySpread(TargetCrossHairMod);
	        }
	    }

        // Blend the crosshair spread in
        if( CurrentCrossHairMod > TargetCrossHairMod )
        {
            CurrentCrossHairMod -= RenderDelta * 6.0;
            if( CurrentCrossHairMod < TargetCrossHairMod )
            {
                CurrentCrossHairMod = TargetCrossHairMod;
            }
        }
        else if( CurrentCrossHairMod < TargetCrossHairMod )
        {
            CurrentCrossHairMod += RenderDelta * 6.0;
            if( CurrentCrossHairMod > TargetCrossHairMod )
            {
                CurrentCrossHairMod = TargetCrossHairMod;
            }
        }

        // Set the stock crosshair spread and scale it based on screen resolution
        CrosshairSize *= RatioY;
        CrossHairSpread = BaseCrosshairSize * RatioY * CurrentCrossHairMod;

        // Set the crosshair alpha = TODO: Move this to a config?
        CrossHairAlpha=210;

        // If we're doing crosshair debugging then turn on the center dot
        if( bForceDrawCrosshair )
        {
            // Center
            Canvas.SetDrawColor(255, 255, 255, CrossHairAlpha);
    		Canvas.SetPos(CenterX, CenterY);
    		Canvas.DrawRect(1, 1);
		}

        // Left side
		// Drop shadow
        Canvas.SetDrawColor(0, 0, 0, CrossHairAlpha);
		Canvas.SetPos(CenterX - (CrosshairSize + CrossHairSpread) - 1, CenterY - 1);
		Canvas.DrawRect(CrosshairSize + 1, 3);
        // Crosshair
        Canvas.SetDrawColor(255, 255, 255, CrossHairAlpha);
		Canvas.SetPos(CenterX - (CrosshairSize + CrossHairSpread), CenterY);
		Canvas.DrawRect(CrosshairSize, 1);

		// Right side
		// Drop shadow
        Canvas.SetDrawColor(0, 0, 0, CrossHairAlpha);
		Canvas.SetPos(CenterX + CrossHairSpread + 1, CenterY - 1);
		Canvas.DrawRect(CrosshairSize + 1, 3);
        // Crosshair
        Canvas.SetDrawColor(255, 255, 255, CrossHairAlpha);
		Canvas.SetPos(CenterX + CrossHairSpread + 1, CenterY);
		Canvas.DrawRect(CrosshairSize, 1);

        // Top
		// Drop shadow
        Canvas.SetDrawColor(0, 0, 0, CrossHairAlpha);
		Canvas.SetPos(CenterX - 1, CenterY - (CrosshairSize + CrossHairSpread) - 1);
		Canvas.DrawRect(3, CrosshairSize + 1);
        // Crosshair
        Canvas.SetDrawColor(255, 255, 255, CrossHairAlpha);
		Canvas.SetPos(CenterX, CenterY - (CrosshairSize + CrossHairSpread));
		Canvas.DrawRect(1, CrosshairSize);

		// Bottom
		// Drop shadow
        Canvas.SetDrawColor(0, 0, 0, CrossHairAlpha);
		Canvas.SetPos(CenterX - 1, CenterY + CrossHairSpread + 1);
		Canvas.DrawRect(3, CrosshairSize + 1);
        // Crosshair
		Canvas.SetDrawColor(255, 255, 255, CrossHairAlpha);
		Canvas.SetPos(CenterX, CenterY + CrossHairSpread + 1);
		Canvas.DrawRect(1, CrosshairSize);
	}
}

/*
 * Complete close of Scoreboard.  Fired from Flash
 * when the "close" animation is finished.
 */
function OnCloseAnimComplete()
{
}

/*
 * Complete open of Scoreboard.  Fired from Flash
 * when the "open" animation is finished.
 */
function OnOpenAnimComplete()
{
}

/**
  * Destroy existing Movies
  */
function RemoveMovies()
{
}

/**
 *  Toggles visibility of normal in-game HUD
 */
function SetVisible(bool bNewVisible)
{
	bShowHUD = bNewVisible;
}

/**
  * Called when pause menu is opened
  */
function CloseOtherMenus();

/*
 * Toggle the Pause Menu on or off.
 *
 */
function TogglePauseMenu()
{
}

/*
 * Complete necessary actions for OnPauseMenuClose.
 * Fired from Flash.
 */
function CompletePauseMenuClose()
{
}

/* toggles displaying scoreboard (used by console controller)
*/
exec function ReleaseShowScores()
{
}

/**
  * Returns the index of the local player that owns this HUD
  */
function int GetLocalPlayerOwnerIndex()
{
	return class'Engine'.static.GetEngine().GamePlayers.Find(LocalPlayer(PlayerOwner.Player));
}

/*
 * SetShowScores() override to display GFx Scoreboard.
 * If the scoreboard has been loaded, this will play the appropriate
 * Flash animation.
 */
exec function SetShowScores(bool bEnableShowScores)
{
}

/**
 * Toggles display of the leaderboard
 */
exec function ToggleLeaderboard()
{
}

/**
 * Displays/closes the leaderboard
 */
exec function SetShowLeaderboard(bool bEnableLeaderboard)
{
}

//Given a input command of the form GBA_ and its mapping store that in a lookup for future use
function DrawToolTip(Canvas Cvs, PlayerController PC, string Command, float X, float Y, float U, float V, float UL, float VL, float ResScale, optional Texture2D IconTexture = default.IconHudTexture, optional float Alpha=1.0)
{
}

function bool CheckCrosshairOnFriendly()
{
	return true;
}

simulated function DrawShadowedTile(texture2D Tex, float X, float Y, float XL, float YL, float U, float V, float UL, float VL, Color TileColor, Optional bool bScaleToRes)
{
	local Color B;

	B = BlackColor;
	B.A = TileColor.A;

	XL *= (bScaleToRes) ? ResolutionScale : 1.0;
	YL *= (bScaleToRes) ? ResolutionScale : 1.0;

	Canvas.SetPos(X+1,Y+1);
	Canvas.DrawColor = B;
	Canvas.DrawTile(Tex,XL,YL,U,V,UL,VL);
	Canvas.SetPos(X,Y);
	Canvas.DrawColor = TileColor;
	Canvas.DrawTile(Tex,XL,YL,U,V,UL,VL);
}

simulated function DrawShadowedStretchedTile(texture2D Tex, float X, float Y, float XL, float YL, float U, float V, float UL, float VL, Color TileColor, Optional bool bScaleToRes)
{
	local LinearColor C,B;

	C = ColorToLinearColor(TileColor);
	B = ColorToLinearColor(BlackColor);
	B.A = C.A;

	XL *= (bScaleToRes) ? ResolutionScale : 1.0;
	YL *= (bScaleToRes) ? ResolutionScale : 1.0;

	Canvas.SetPos(X+1,Y+1);
	Canvas.DrawTileStretched(Tex,XL,YL,U,V,UL,VL,B);
	Canvas.SetPos(X,Y);
	Canvas.DrawColor = TileColor;
	Canvas.DrawTileStretched(Tex,XL,YL,U,V,UL,VL,C);
}

simulated function DrawShadowedRotatedTile(texture2D Tex, Rotator Rot, float X, float Y, float XL, float YL, float U, float V, float UL, float VL, Color TileColor, Optional bool bScaleToRes)
{
	local Color B;

	B = BlackColor;
	B.A = TileColor.A;

	XL *= (bScaleToRes) ? ResolutionScale : 1.0;
	YL *= (bScaleToRes) ? ResolutionScale : 1.0;

	Canvas.SetPos(X+1,Y+1);
	Canvas.DrawColor = B;
	Canvas.DrawRotatedTile(Tex,Rot,XL,YL,U,V,UL,VL);
	Canvas.SetPos(X,Y);
	Canvas.DrawColor = TileColor;
	Canvas.DrawRotatedTile(Tex,Rot,XL,YL,U,V,UL,VL);
}

function DrawHUD()
{
	local KFPawn_Human KFPH;
	local float ThisDot;
	local vector ViewLocation, ViewVector, PlayerPartyInfoLocation;
	local rotator ViewRotation;

	super.DrawHUD();

	// Draw the crosshair for casual mode
	if( bDrawCrosshair || bForceDrawCrosshair )
	{
		if( KFPlayerOwner != none && !KFPlayerOwner.bCinematicMode )
		{
	        DrawCrosshair();
	    }
    }

    if( KFPlayerOwner != none )
    {
        KFPlayerOwner.GetPlayerViewPoint(ViewLocation, ViewRotation);
    }
    ViewVector = vector(ViewRotation);

    //Friendly player status
    Canvas.EnableStencilTest(true);
	foreach WorldInfo.AllPawns(class'KFPawn_Human', KFPH)
	{
		PlayerPartyInfoLocation = KFPH.Location + KFPH.MTO_PhysSmoothOffset + KFPH.CylinderComponent.CollisionHeight * vect(0,0,1);
		ThisDot = Normal(PlayerPartyInfoLocation - ViewLocation) dot Normal(ViewVector);

		if( KFPH.IsAliveAndWell() && KFPH != KFPlayerOwner.Pawn)
		{
			if(`TimeSince(KFPH.Mesh.LastRenderTime) < 0.4f && (ThisDot > 0 && ThisDot < 1.0) )
			{
				DrawFriendlyHUD(KFPH);
			}
		}
	}
	Canvas.EnableStencilTest(false);
}

simulated function DrawFriendlyHUD( KFPawn_Human KFPH )
{
	local float Percentage;
	local float BarHeight, BarLength;
	local vector ScreenPos, TargetLocation;
	local KFPlayerReplicationInfo KFPRI;
	local FontRenderInfo MyFontRenderInfo;
	local float FontScale;
	local color TempColor;

	KFPRI = KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo);

	if( KFPRI == none )
	{
		return;
	}

	MyFontRenderInfo = Canvas.CreateFontRenderInfo( true );
	BarLength = FMin(PlayerStatusBarLengthMax * (float(Canvas.SizeX) / 1024.f), PlayerStatusBarLengthMax) * FriendlyHudScale;
	BarHeight = FMin(8.f * (float(Canvas.SizeX) / 1024.f), 8.f) * FriendlyHudScale;

	TargetLocation = KFPH.Location + vect(0,0,1) * KFPH.GetCollisionHeight() * 1.2;

	ScreenPos = Canvas.Project(TargetLocation);
	if( ScreenPos.X < 0 || ScreenPos.X > Canvas.SizeX || ScreenPos.Y < 0 || ScreenPos.Y > Canvas.SizeY )
	{
		return;
	}

	//Draw health bar
	Percentage = FMin(float(KFPH.Health) / float(KFPH.HealthMax), 100);
	DrawKFBar(Percentage, BarLength, BarHeight, ScreenPos.X - (BarLength *0.5f), ScreenPos.Y, HealthColor);

	//Draw armor bar
	Percentage = FMin(float(KFPH.Armor) / float(KFPH.MaxArmor), 100);
	DrawKFBar(Percentage, BarLength, BarHeight, ScreenPos.X - (BarLength *0.5f), ScreenPos.Y - BarHeight, ArmorColor);

	//Draw player name (Top)
	FontScale = class'KFGameEngine'.Static.GetKFFontScale();
	Canvas.Font = class'KFGameEngine'.Static.GetKFCanvasFont();
	Canvas.SetDrawColorStruct(PlayerBarTextColor);
	Canvas.SetPos(ScreenPos.X - (BarLength *0.5f), ScreenPos.Y - BarHeight * 3);
	Canvas.DrawText( KFPRI.PlayerName,,FontScale * FriendlyHudScale,FontScale * FriendlyHudScale, MyFontRenderInfo );

	if( KFPRI.CurrentPerkClass == none )
	{
		return;
	}

	//draw perk icon
	Canvas.SetDrawColorStruct(PlayerBarIconColor);
	Canvas.SetPos(ScreenPos.X - (BarLength * 0.75), ScreenPos.Y - BarHeight * 2);
	Canvas.DrawTile(KFPRI.CurrentPerkClass.default.PerkIcon, PlayerStatusIconSize * FriendlyHudScale, PlayerStatusIconSize * FriendlyHudScale, 0, 0, 256, 256 );

	//Draw perk level and name text
	Canvas.SetDrawColorStruct(PlayerBarTextColor);
	Canvas.SetPos(ScreenPos.X - (BarLength *0.5f), ScreenPos.Y + BarHeight);
	Canvas.DrawText( KFPRI.GetActivePerkLevel() @KFPRI.CurrentPerkClass.default.PerkName,,FontScale * FriendlyHudScale, FontScale * FriendlyHudScale, MyFontRenderInfo );

	if( KFPRI.bPerkCanSupply && KFPRI.CurrentPerkClass.static.GetInteractIcon() != none )
	{
		TempColor = KFPRI.bPerkSupplyUsed ? SupplierActiveColor : SupplierUsableColor;
		Canvas.SetDrawColorStruct( TempColor );
		Canvas.SetPos( ScreenPos.X + BarLength * 0.5f, ScreenPos.Y - BarHeight * 2 );
		Canvas.DrawTile( KFPRI.CurrentPerkClass.static.GetInteractIcon(), PlayerStatusIconSize * FriendlyHudScale, PlayerStatusIconSize * FriendlyHudScale, 0, 0, 256, 256); 
	}
}

simulated function DrawKFBar( float BarPercentage, float BarLength, float BarHeight, float XPos, float YPos, Color BarColor )
{
	//background for status bar
	Canvas.SetDrawColorStruct(PlayerBarBGColor);
	Canvas.SetPos(XPos, YPos);
	Canvas.DrawTileStretched(PlayerStatusBarBGTexture, BarLength, BarHeight, 0, 0, 32, 32);

	//Forground for status bar.
	Canvas.SetDrawColorStruct(BarColor);
	Canvas.SetPos(XPos, YPos + 1);  // Adjust pos for border
	Canvas.DrawTileStretched(PlayerStatusBarBGTexture, (BarLength - 2.0) * BarPercentage, BarHeight - 2.0, 0, 0, 32, 32);
}

/*********************************************************************************************
`* Pausing
********************************************************************************************* */

/**
 *	Pauses or unpauses the game due to main window's focus being lost.
 *	@param Enable tells whether to enable or disable the pause state
 */
event OnLostFocusPause(bool bEnable)
{
	// don't pause or unpause after toggling external UI if we have menus up (menu toggling handles pausing on standalone)
	// (see KFPlayerController::OnExternalUIChanged)
	if( WorldInfo.NetMode == NM_Standalone && KFPlayerOwner.MyGFxManager.bMenusOpen )
	{
		return;
	}

	super.OnLostFocusPause( bEnable );
}

/*********************************************************************************************
`* Debugging
********************************************************************************************* */

/** Add an actor to the list so that it will recieve a PostRenderFor() */
function SetPostRenderingFor( bool bOn, Actor A )
{
	if( bOn )
	{
		A.bPostRenderIfNotVisible = true;
		if( !bShowOverlays )
		{
			SetShowOverlays( true );
		}
		AddPostRenderedActor(A);
	}
	else
	{
		bPostRenderIfNotVisible = default.bPostRenderIfNotVisible;
		SetShowOverlays( default.bShowOverlays );
		RemovePostRenderedActor(A);
	}
}

defaultproperties
{
	PulseDuration=0.33
	PulseSplit=0.25
	PulseMultiplier=0.5

	bDrawCrosshair=false
	CrosshairAccuracyScale=(Points=((InVal=0.0001,OutVal=0.4),(InVal=0.0095,OutVal=0.5),(InVal=0.015,OutVal=0.65)))
	BaseCrosshairSize=50

	Text_NoClipShadowed=(bClipText=false,bEnableShadow=true)

	ArmorColor=(R=0, G=0, B=255, A=192)
	HealthColor=(R=255, G=0, B=0, A=192)
	PlayerBarBGColor=(R=0, G=0, B=0, A=192)
	PlayerBarTextColor=(R=192, G=192, B=192, A=192)
	PlayerBarIconColor=(R=192, G=192, B=192, A=192)

	SupplierActiveColor=(R=128, G=128, B=128, A=192)
	SupplierUsableColor=(R=255, G=0, B=0, A=192)

	PlayerStatusBarBGTexture=Texture2D'EngineResources.WhiteSquareTexture'
	PlayerStatusBarLengthMax = 150.0f;
	PlayerStatusIconSize = 32.0f;
}
