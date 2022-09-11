//=============================================================================
// KFSeqAct_DrawRandomLocalizedText
//=============================================================================
// Kismet node to draw random localized texts in the HUD
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSeqAct_DrawRandomLocalizedText extends KFSeqAct_DrawLocalizedText
	dependson(HUD)
	HideCategories(Message)
	native;

var(RandomMessage) array<ELocalizedID> MessageLocalizedIDList;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
* Return the version number for this class.  Child classes should increment this method by calling Super then adding
* a individual class version to the result.  When a class is first created, the number should be 0; each time one of the
* link arrays is modified (VariableLinks, OutputLinks, InputLinks, etc.), the number that is added to the result of
* Super.GetObjClassVersion() should be incremented by 1.
*
* @return	the version number for this specific class.
*/
static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 3;
}

simulated function string GetLocalizationText()
{
	Local int RandomValue;
	RandomValue = Rand(MessageLocalizedIDList.length);
	return MapLocalizationClass.static.GetLocalization(MessageLocalizedIDList[RandomValue]);
}

defaultproperties
{
   ObjName="Draw Random Localized Text"
   Name="Default__KFSeqAct_DrawRandomLocalizedText"
   ObjectArchetype=KFSeqAct_DrawLocalizedText'KFGame.Default__KFSeqAct_DrawLocalizedText'
}
