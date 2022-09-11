//=============================================================================
// KFSeqAct_DrawCountText
//=============================================================================
// Kismet node to draw texts in the counter container of the HUD
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSeqAct_DrawCountText extends SequenceAction
	dependson(HUD)
	native;
	
var(Message) string Message;

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
	DrawTextInfo.MessageText = Message;
	DrawTextInfo.MessageFont = GetFontText();
	DrawTextInfo.MessageFontScale = MessageFontScale;
	DrawTextInfo.MessageOffset = MessageOffset;
	DrawTextInfo.MessageColor = MessageColor;
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
   ObjName="Draw Count Text"
   ObjCategory="Killing Floor"
   Name="Default__KFSeqAct_DrawCountText"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
