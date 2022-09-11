//=============================================================================
// KFKismetMapLocalization_Elysium
//=============================================================================
// Class for Elysium Kismet localization
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFKismetMapLocalization_Elysium extends KFKismetMapLocalization;

var localized string FuneralPyreIgnitionText;
var localized string TomeMissingText;
var localized string LeverWarningText;
var localized string LoreMastersKnowsText;
var localized string SandTomeCollectedText;
var localized string SteelTomeCollectedText;
var localized string SludgeTomeCollectedText;
var localized string WoodTomeCollectedText;
var localized string RedRoseCollectedText;
var localized string MagentaRoseollectedText;
var localized string YellowRoseCollectedText;
var localized string FlowerActivationText;
var localized string BotanicaOpenText;
var localized string OneOfThreeCollectedText;
var localized string TwoOfThreeCollectedText;
var localized string ThreeOfThreeCollectedText;
var localized string OneOfFourCollectedText;
var localized string TwoOfFourCollectedText;
var localized string ThreeOfFourCollectedText;
var localized string FourOfFourCollectedText;

static simulated function string GetLocalization(int MessageId)
{
	switch(MessageId)
	{
		case 0:  return default.FuneralPyreIgnitionText;

		case 1:  return default.TomeMissingText;

		case 2:  return default.LeverWarningText;
		case 3:  return default.LoreMastersKnowsText;

		case 4:  return default.SandTomeCollectedText;
		case 5:  return default.SteelTomeCollectedText;
		case 6:  return default.SludgeTomeCollectedText;
		case 7:  return default.WoodTomeCollectedText;

		case 8:  return default.RedRoseCollectedText;
		case 9:  return default.MagentaRoseollectedText;
		case 10: return default.YellowRoseCollectedText;

		case 11: return default.FlowerActivationText;

		case 12: return default.BotanicaOpenText;

		case 13: return default.OneOfThreeCollectedText;
		case 14: return default.TwoOfThreeCollectedText;
		case 15: return default.ThreeOfThreeCollectedText;

		case 16: return default.OneOfFourCollectedText;
		case 17: return default.TwoOfFourCollectedText;
		case 18: return default.ThreeOfFourCollectedText;
		case 19: return default.FourOfFourCollectedText;
	}
	return "";
}

defaultproperties
{
   FuneralPyreIgnitionText="The sacred funeral pyre has been set ablaze!\nBurning souls of Avernus now haunt the heart of Elysium"
   TomeMissingText="A tome seems to be missing from this pedestal"
   LeverWarningText="Pulling this lever may have consequences . . ."
   LoreMastersKnowsText="The Lore Master knows"
   SandTomeCollectedText="The Tome of Sand has been collected\n%VALUE%"
   SteelTomeCollectedText="The Tome of Steel has been collected\n%VALUE%"
   SludgeTomeCollectedText="The Tome of Sludge has been collected\n%VALUE%"
   WoodTomeCollectedText="The Tome of Wood has been collected\n%VALUE%"
   RedRoseCollectedText="A red rose was collected\n%VALUE%"
   MagentaRoseollectedText="A magenta rose was collected\n%VALUE%"
   YellowRoseCollectedText="A yellow rose was collected\n%VALUE%"
   FlowerActivationText="A flowery aroma wafts from the vase"
   BotanicaOpenText="The Botanica has opened"
   OneOfThreeCollectedText="1 of 3 collected"
   TwoOfThreeCollectedText="2 of 3 collected"
   ThreeOfThreeCollectedText="3 of 3 collected"
   OneOfFourCollectedText="1 of 4 collected"
   TwoOfFourCollectedText="2 of 4 collected"
   ThreeOfFourCollectedText="3 of 4 collected"
   FourOfFourCollectedText="4 of 4 collected"
   TextFont=Font'UI_Canvas_Fonts.Font_General'
   Name="Default__KFKismetMapLocalization_Elysium"
   ObjectArchetype=KFKismetMapLocalization'KFGame.Default__KFKismetMapLocalization'
}
