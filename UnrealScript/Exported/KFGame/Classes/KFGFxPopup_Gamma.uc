//=============================================================================
// KFGFxPopup_Gamma
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 1/10/2014
//=============================================================================

class KFGFxPopup_Gamma extends KFGFxObject_Popup;

var GFxObject GammaSlider;
var string GammaImagePath;

function InitializePopup( KFGFxMoviePlayer_Manager InManager )
{
    Super.InitializePopup(InManager);

	GammaSlider = GetObject("mainSlider");
	// Multiplying by 100 so we can go 0-100 with a snapInterval of 1 for consistency. HSL_BB
	GammaSlider.SetFloat("value", class'KFGameEngine'.default.GammaMultiplier*100);
	SetString("imagePath", "img://"$GammaImagePath);

 	Manager.bEnableGammaCorrection = true;
 	Manager.RefreshViewportFlags();
}

event OnClosed()
{
    Super.OnClosed();
    Manager.bEnableGammaCorrection = false;
    Manager.RefreshViewportFlags();
    Manager.bSetGamma = true;
    Manager.SaveConfig();
}

function SetGamma( float GammaValue )
{
	local KFGameEngine KFGE;

	KFGE = KFGameEngine(Class'Engine'.static.GetEngine());
	KFGE.GammaMultiplier = GammaValue;
	KFGE.SaveConfig();

	class'KFGameEngine'.static.SetGamma( GammaValue );
	class'KFGameEngine'.default.GammaMultiplier = GammaValue;
	class'KFGameEngine'.static.StaticSaveConfig();
	
}

function ResetGamma()
{
	local float DefaultGamma;
	local KFGameEngine KFGE;

	DefaultGamma = class'KFGameEngine'.default.DefaultGammaMult;

	// Multiplying by 100 so we can go 0-100 with a snapInterval of 1 for consistency. HSL_BB
	GammaSlider.SetFloat("value", DefaultGamma*100);

	KFGE = KFGameEngine(Class'Engine'.static.GetEngine());
	KFGE.GammaMultiplier = DefaultGamma;
	KFGE.SaveConfig();

    class'KFGameEngine'.static.SetGamma( DefaultGamma );
	class'KFGameEngine'.default.GammaMultiplier = DefaultGamma;
	class'KFGameEngine'.static.StaticSaveConfig();
}


function Callback_ClosedPopup()
{
    Super.Callback_Closedpopup();
}

function Callback_GammaChanged( float NewGamma )
{
	// Dividing by 100 so we can go 0-100 with a snapInterval of 1 for consistency. HSL_BB
	SetGamma( NewGamma/100 );
}

function Callback_DefaultGamma()
{
	ResetGamma();
}

defaultproperties
{
   GammaImagePath="UI_GammaPopup_TEX.KF2_Brightess_Calibration"
   Name="Default__KFGFxPopup_Gamma"
   ObjectArchetype=KFGFxObject_Popup'KFGame.Default__KFGFxObject_Popup'
}
