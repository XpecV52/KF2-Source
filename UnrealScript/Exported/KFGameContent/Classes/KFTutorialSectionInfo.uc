//=============================================================================
// KFTutorialSectionInfo
//=============================================================================
// archetype inside GP_Tutorial_ARCH for kfgameinfo_tutorial
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 4/21/2016
//=============================================================================

class KFTutorialSectionInfo extends Object
	hidecategories(Object);

struct STutorialSlide
{
	var() string TitleKey;
	var() string DescriptionKey;
	var() Texture2D UIImage;
	/** Key binds to locate and merge with description text */
	var() array<string> KeyGBAs;

	/** If >= 0, replace this slide from the GamepadSlides array */
	var() int GamepadSlideIndex;

	StructDefaultProperties
	{
		GamepadSlideIndex=INDEX_NONE
	}
};

/** Default slides */
var() private array <STutorialSlide> TutorialSlides;
/** Override slides used only for gamepad */
var() private array<STutorialSlide> GamepadReplacementSlides;

var() AKEvent VoiceOverOpenEvent;
var() AKEvent VoiceOverCloseEvent;

/** Delay before this screen opens */
var() float OpenDelay;

function array<STutorialSlide> GetSlides(PlayerController PC)
{
    local array<STutorialSlide> MergedSlides;
    local STutorialSlide NextSlide;
   
	if ( GamepadReplacementSlides.Length > 0 )
	{
		 if ( PC.PlayerInput.bUsingGamepad )
		 {
		 	foreach TutorialSlides(NextSlide)
		 	{
		 		if ( NextSlide.GamepadSlideIndex >= 0 
		 			&& NextSlide.GamepadSlideIndex < GamepadReplacementSlides.Length )
		 		{
		 			MergedSlides.AddItem(GamepadReplacementSlides[NextSlide.GamepadSlideIndex]);
		 		}
		 		else
		 		{
		 			MergedSlides.AddItem(NextSlide);
		 		}
		 	}

		 	return MergedSlides;
		 }
	}

	return TutorialSlides;
}

/** Called from GI when tutorial is requested */
function OpenDelayTimer()
{
	local KFGameInfo_Tutorial GI;

	GI = KFGameInfo_Tutorial(class'WorldInfo'.static.GetWorldInfo().Game);
	if ( GI != None )
	{
		GI.CreateTutorialHUD(self, true);
	}
}

defaultproperties
{
   Name="Default__KFTutorialSectionInfo"
   ObjectArchetype=Object'Core.Default__Object'
}
