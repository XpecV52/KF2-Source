//=============================================================================
// KFSeqAct_DrawLocalizedText
//=============================================================================
// Kismet node to draw localized texts in the HUD
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSeqAct_DrawLocalizedText extends SequenceAction
	dependson(HUD)
	native;
	
var int SecondaryIDValue;

enum ELocalizedID
{
	LID_0,
	LID_1,	LID_2,	LID_3,	LID_4,	LID_5,	LID_6,	LID_7,	LID_8,	LID_9,	LID_10,
	LID_11,	LID_12,	LID_13,	LID_14,	LID_15,	LID_16,	LID_17,	LID_18,	LID_19,	LID_20,
	LID_21,	LID_22,	LID_23,	LID_24,	LID_25,	LID_26,	LID_27,	LID_28,	LID_29,	LID_30,
	LID_31,	LID_32,	LID_33,	LID_34,	LID_35,	LID_36,	LID_37,	LID_38,	LID_39,	LID_40,
	LID_41,	LID_42,	LID_43,	LID_44,	LID_45,	LID_46,	LID_47,	LID_48,	LID_49,	LID_MAX,
};

var(Message) ELocalizedID MessageLocalizedID;
var(Message) array<ELocalizedID> SecondaryMessageLocalizedIDList;

var(Message) bool bUseSecondaryMessage;
var(Message) string TextForReplace;

var() class<KFKismetMapLocalization> MapLocalizationClass;

var() float DisplayTimeSeconds;

var() vector2d	MessageFontScale;
var() vector2d	MessageOffset;
var() Color		MessageColor;

var bool bDisplayOnObject;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var HUD.KismetDrawTextInfo DrawTextInfo;

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
	return Super.GetObjClassVersion() + 2;
}

event Initialize()
{
	DrawTextInfo.MessageText = GetLocalizationText();
	DrawTextInfo.MessageFont = GetFontText();
	DrawTextInfo.MessageFontScale = MessageFontScale;
	DrawTextInfo.MessageOffset = MessageOffset;
	DrawTextInfo.MessageColor = MessageColor;
}

simulated function string GetLocalizationText()
{
	Local string finalText;
	Local string secondaryText;

	finalText = MapLocalizationClass.static.GetLocalization(MessageLocalizedID);
	LogInternal("bUseSecondaryMessage"@bUseSecondaryMessage);
	if(bUseSecondaryMessage)
	{
		LogInternal("SecondaryIDValue"@SecondaryIDValue);
		secondaryText = MapLocalizationClass.static.GetLocalization(SecondaryMessageLocalizedIDList[SecondaryIDValue]);
        class'Actor'.static.ReplaceText(finalText, TextForReplace, secondaryText);
	}
	return finalText;
}

simulated function Font GetFontText()
{
	return MapLocalizationClass.static.GetFont();
}

defaultproperties
{
   DisplayTimeSeconds=-1.000000
   MessageFontScale=(X=1.000000,Y=1.000000)
   MessageColor=(B=255,G=255,R=255,A=255)
   bLatentExecution=True
   bAutoActivateOutputLinks=False
   InputLinks(0)=(LinkDesc="Show")
   InputLinks(1)=(LinkDesc="Hide")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_String',LinkDesc="String",bHidden=True,MinVars=0)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="SecondaryIDValue",PropertyName="SecondaryIDValue",bWriteable=True,bHidden=True,MinVars=0)
   ObjName="Draw Localized Text"
   ObjCategory="Killing Floor"
   Name="Default__KFSeqAct_DrawLocalizedText"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
