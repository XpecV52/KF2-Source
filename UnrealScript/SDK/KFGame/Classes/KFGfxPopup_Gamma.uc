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
	GammaSlider.SetFloat("value", class'KFGameEngine'.default.GammaMultiplier);
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

	GammaSlider.SetFloat("value", DefaultGamma);

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
	SetGamma( NewGamma );
}

function Callback_DefaultGamma()
{
	ResetGamma();
}

defaultproperties
{
	GammaImagePath="UI_GammaPopup_TEX.KF2_Brightess_Calibration"
}
