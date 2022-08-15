//=============================================================================
// KFGFxMenu_Gear
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 7/23/2013
//=============================================================================

class KFGFxMenu_Gear extends KFGFxObject_Menu;

var KFGFxObject_Container CustomizationComponent;
var KFPlayerReplicationInfo MyKFPRI;

var const string HeadMeshKey; 
var const string HeadSkinKey; 
var const string HeadFunctionKey;
var const string BodyMeshKey;
var const string BodySkinKey;
var const string BodyFunctionKey;
var const string AttachmentKey; 
var const string AttachmentSkinKey; 
var const string AttachmentFunctionKey;
var const string KFCharacterInfoString; 

var KFCharacterInfo_Human CurrentCharInfo;
var string CharInfoPath;

var localized string GearHeaderString;
var localized string CharacterString;
var localized string BioString;
var localized string HeadString;
var localized string BodyString;
var localized string AttachmentsString;
var localized string SkinsString;
var localized string BackString;
var localized string NoneString;

var const int ControllerRotationRate;
var const float ControllerRotationThreshold;

var string ClearImagePath;

function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	super.InitializeMenu(InManager);
	MyKFPRI = KFPlayerReplicationInfo( GetPC().PlayerReplicationInfo );
	LocalizeText();
	// Set the list of usable characters
	UpdateCharacterList();	
	UpdateGear();
}

function OnOpen()
{
	local PlayerController PC;

	PC = GetPC();
	if( PC == none )
	{
		return;
	}
	
	// @hack: moved from KFGfxMoviePlayer_Manager because this causes a crash while 
	// bink (e.g. KFII-25456) are playing.  Don't use HandleInputAxis with Bink! (for now) :) 
	GetGameViewportClient().HandleInputAxis = OnAxisModified;

	if ( class'WorldInfo'.static.IsMenuLevel() )
	{
		Manager.ManagerObject.SetBool("backgroundVisible", false);
	}
	else if ( PC.PlayerReplicationInfo.bReadyToPlay && PC.WorldInfo.GRI.bMatchHasBegun )
	{
		// Players cannot change characters if they are in a game
		SetBool("characterButtonEnabled", false);
	}
}

function LocalizeText()
{
	local GFxObject LocalizedObject;

	LocalizedObject = CreateObject("Object");

	LocalizedObject.SetString("header", GearHeaderString);
	LocalizedObject.SetString("listButton", BackString);
	LocalizedObject.SetString("bioStringText", BioString);
	LocalizedObject.SetString("charactersString", CharacterString);
	LocalizedObject.SetString("headsString", HeadString);
	LocalizedObject.SetString("bodiesString", BodyString);
	LocalizedObject.SetString("skinsString", SkinsString);
	LocalizedObject.SetString("attachmentsString", AttachmentsString);

	SetObject("localizeText", LocalizedObject);
}

function UpdateCharacterList()
{
	local byte i, ItemIndex;
	local GFxObject DataProvider, SlotObject;
	local string TexturePath;

	ItemIndex = 0;
	DataProvider = CreateArray();
	for (i = 0; i < MyKFPRI.CharacterArchetypes.length; i++)
	{
		if (class'KFUnlockManager'.static.GetAvailable(MyKFPRI.CharacterArchetypes[i]))
		{
			SlotObject = CreateObject( "Object" );
			SlotObject.SetInt("ItemIndex", i);
			SlotObject.SetString("label", Localize(String(MyKFPRI.CharacterArchetypes[i].Name), "CharacterName", KFCharacterInfoString));
			TexturePath = "img://"$PathName(MyKFPRI.CharacterArchetypes[i].DefaultHeadPortrait);
			SlotObject.SetString("source", TexturePath);
			DataProvider.SetElementObject(ItemIndex, SlotObject);
			ItemIndex++;
		}
		else
		{
			`log(MyKFPRI.CharacterArchetypes[i] @ "is not purchased.");
		}
	}
	
	SetObject("characterArray", DataProvider);
}

function UpdateGear()
{
	CurrentCharInfo = MyKFPRI.CharacterArchetypes[MyKFPRI.StoredCharIndex];
	CharInfoPath = String(CurrentCharInfo.Name);
	// Set the list of usable bodies for this character
	UpdateMeshList(BodyMeshKey, BodySkinKey, CurrentCharInfo.BodyVariants, "bodyArray");
	// Set the list of usable heads for this character
	UpdateMeshList(HeadMeshKey, HeadSkinKey, CurrentCharInfo.HeadVariants, "headsArray");
	// Set the list of usable attachments for this character
	UpdateAttachmentsList(AttachmentKey, CurrentCharInfo.CosmeticVariants, "attachmentsArray");

	SetCurrentCharacterButtons();
}

function UpdateMeshList(string OutfitKey, string SkinKey, array<OutfitVariants> Outfits, string DataArrayString)
{
	local byte i, ItemIndex;
	local GFxObject DataProvider, SlotObject;
	local string TexturePath;
	local OutfitVariants Outfit;

	ItemIndex = 0;
	DataProvider = CreateArray();
	for (i = 0; i < Outfits.length; i++)
	{
		Outfit = Outfits[i];
		if (class'KFUnlockManager'.static.GetAvailableOutfit(Outfit))
		{
			SlotObject = CreateObject( "Object" );
			SlotObject.SetInt("ItemIndex", i);
			SlotObject.SetString("label", Localize(CharInfoPath, OutfitKey$i, KFCharacterInfoString));

			TexturePath = "img://"$PathName(Outfit.UITexture);
			SlotObject.SetString("source", TexturePath);

			UpdateVariants( OutfitKey, SkinKey, Outfit.SkinVariations, i, SlotObject );

			DataProvider.SetElementObject(ItemIndex, SlotObject);
			ItemIndex++;
		}
		else
		{
			`log("Outfit" @ Outfit.MeshName @ "is not purchased.");
		}
	}
	
	SetObject(DataArrayString, DataProvider);
}

function UpdateAttachmentsList(string ItemKey, array<AttachmentVariants> Attachments, string DataArrayString)
{
	local byte i, ItemIndex;
	local GFxObject DataProvider, SlotObject;
	local string TexturePath;
	local AttachmentVariants Variant;

	ItemIndex = 0;
	DataProvider = CreateArray();

	// Insert blank object
	SlotObject = CreateObject( "Object" );
	SlotObject.SetString("label", NoneString);
	SlotObject.SetString("source", "img://"$ClearImagePath);
	DataProvider.SetElementObject(ItemIndex, SlotObject);
	ItemIndex++;

	for (i = 0; i < Attachments.length; i++)
	{
		Variant = Attachments[i];
		if (class'KFUnlockManager'.static.GetAvailableAttachment(Variant))
		{
			SlotObject = CreateObject( "Object" );
			SlotObject.SetInt("ItemIndex", i);
			SlotObject.SetString("label", Localize(CharInfoPath, ItemKey$i, KFCharacterInfoString));

			TexturePath = "img://"$PathName(Variant.UITexture);
			SlotObject.SetString("source", TexturePath);
			UpdateVariants( ItemKey, AttachmentSkinKey, Variant.SkinVariations, i, SlotObject );

			DataProvider.SetElementObject(ItemIndex, SlotObject);
			ItemIndex++;
		}
		else
		{
			`log("Attachment" @ Variant.MeshName @ "is not purchased.");
		}
	}
	
	SetObject(DataArrayString, DataProvider);
}

function UpdateVariants(string OutfitKey, string KeyName, out array<SkinVariant> SkinVariations, int OutfitIndex, out GFxObject MeshObject)
{
	local byte i, ItemIndex;
	local GFxObject DataProvider, SlotObject;
	local SkinVariant Skin;
	local string SectionPath;
	local string TexturePath;

	ItemIndex = 0;
	DataProvider = CreateArray();
	SectionPath = CharInfoPath$"."$OutfitKey$OutfitIndex;	

	for (i = 0; i < SkinVariations.length; i++)
	{
		Skin = SkinVariations[i];
		if (class'KFUnlockManager'.static.GetAvailableSkin(Skin))
		{
			SlotObject = CreateObject( "Object" );
			SlotObject.SetInt("ItemIndex", i);
			SlotObject.SetString("label", Localize(SectionPath, KeyName$i, KFCharacterInfoString));
			TexturePath = "img://"$PathName(Skin.UITexture);
			SlotObject.SetString("source", TexturePath);

			DataProvider.SetElementObject(ItemIndex, SlotObject);
			ItemIndex++;
		}
		else
		{
			`log("Skin" @ Skin.UITexture.Name @ "is not purchased.");
		}
	}
	MeshObject.SetObject("skinInfo", DataProvider);
}

function SetCurrentCharacterButtons()
{
	local GFxObject DataObject;

	DataObject = CreateObject("Object");

	DataObject.SetString( "selectedCharacter", Localize(CharInfoPath, "CharacterName", KFCharacterInfoString) );
	DataObject.SetString( "characterBio", Localize(CharInfoPath, "Description", KFCharacterInfoString) );
	DataObject.SetInt( "selectedCharacterIndex", MyKFPRI.StoredCharIndex );

	SetObject( "selectedCharacter", DataObject);

	//set head
	SetGearButtons(MyKFPRI.RepCustomizationInfo.HeadMeshIndex, MyKFPRI.RepCustomizationInfo.HeadSkinIndex, HeadMeshKey, HeadSkinKey, HeadFunctionKey);
	//set body
	SetGearButtons(MyKFPRI.RepCustomizationInfo.BodyMeshIndex, MyKFPRI.RepCustomizationInfo.BodySkinIndex, BodyMeshKey, BodySkinKey, BodyFunctionKey);
	//set attachments
	SetAttachmentButtons(AttachmentKey, AttachmentFunctionKey);
}

/** Update the labels for our gear buttons */
function SetGearButtons(byte MeshIndex, byte SkinIndex, string MeshKey, string SkinKey, string sectionFunctionName)
{
	local string SectionPath;
	local string CurrentMesh;
	local string SkinName, MeshName;
	local GFxObject DataObject;

	DataObject = CreateObject("Object");

	if(MeshIndex == `CLEARED_ATTACHMENT_INDEX)
	{
		DataObject.SetString( sectionFunctionName, NoneString );
	}
	else
	{
		CurrentMesh = MeshKey$MeshIndex;
		SectionPath = CharInfoPath$"."$CurrentMesh;

		SkinName = Localize(SectionPath, SkinKey$SkinIndex, KFCharacterInfoString);
		MeshName = Localize(CharInfoPath, CurrentMesh, KFCharacterInfoString);
		DataObject.SetString( sectionFunctionName,  MeshName @"\n" @SkinName );
	}

	DataObject.SetInt( (sectionFunctionName$"Index"), MeshIndex);
	DataObject.SetInt( (sectionFunctionName$"SkinIndex"), SkinIndex);

	SetObject( sectionFunctionName, DataObject);
}

/** Update the labels for our currently equipped attachments */
function SetAttachmentButtons(string AttachmentMeshKey, string sectionFunctionName)
{
	local string CurrentMesh, FinishedString;
	local GFxObject DataObject;
	local byte i, AttachmentIndex;

	DataObject = CreateObject("Object");

	for(i = 0; i < `MAX_COSMETIC_ATTACHMENTS; i++)
	{
		AttachmentIndex = MyKFPRI.RepCustomizationInfo.AttachmentMeshIndices[i];		
		if( AttachmentIndex == `CLEARED_ATTACHMENT_INDEX )
		{
			FinishedString $= "----"$"\n";
		}
		else
		{
			CurrentMesh = AttachmentMeshKey$AttachmentIndex;
			FinishedString $= Localize(CharInfoPath, CurrentMesh, KFCharacterInfoString)$"\n";
		}
	}

	DataObject.SetString( sectionFunctionName, FinishedString );

	SetObject( sectionFunctionName, DataObject);
}

event OnClose()
{
	local PlayerController PC;

	super.OnClose();

	GetGameViewportClient().HandleInputAxis = none;

	if ( class'WorldInfo'.static.IsMenuLevel() )
	{
		Manager.ManagerObject.SetBool("backgroundVisible", true);
	}

	// If we are alive, in game, with a playable pawn. switch back to first person view when leaving this menu
	PC = GetPC();
	if( PC != none && PC.WorldInfo.GRI.bMatchHasBegun && 
		PC.Pawn != none && !PC.Pawn.IsA('KFPawn_Customization') )
	{
		PC.ServerCamera( 'FirstPerson' );
	}
}

event bool OnAxisModified( int ControllerId, name Key, float Delta, float DeltaTime, bool bGamepad )
{
	if ( GetPC().PlayerInput.bUsingGamepad )
	{
		if ( Key == 'XboxTypeS_RightX' && Abs(Delta) > ControllerRotationThreshold)
		{
	    	Callback_RotateCamera(Delta * ControllerRotationRate);
		}
	}
	return false;
}

//==============================================================
// ActionScript Callbacks
//==============================================================

function Callback_RotateCamera( int RotationDirection )
{
	local KFPlayerCamera PlayerCamera;
	
	PlayerCamera = KFPlayerCamera( GetPC().PlayerCamera );
	if ( PlayerCamera != none )
	{
		PlayerCamera.CustomizationCam.RotatedCamera( RotationDirection );
	}
}

function Callback_EndRotateCamera()
{
	local KFPlayerCamera PlayerCamera;

	PlayerCamera = KFPlayerCamera( GetPC().PlayerCamera );
	if ( PlayerCamera != none )
	{
		PlayerCamera.CustomizationCam.StartFadeRotation();
	}
}

function Callback_BodyCamera()
{
	if ( KFPlayerCamera( GetPC().PlayerCamera ) != none )
	{
		KFPlayerCamera( GetPC().PlayerCamera ).CustomizationCam.SetBodyView( 0 );
	}
}

function Callback_HeadCamera()
{
	if ( KFPlayerCamera( GetPC().PlayerCamera ) != none )
	{
		KFPlayerCamera( GetPC().PlayerCamera ).CustomizationCam.SetBodyView( 1 );
	}
}

function Callback_Character(byte Index)
{
	SetOption(CO_Character, Index);
	UpdateGear();
}

function Callback_Head( byte MeshIndex, byte SkinIndex )
{
	SetOption(CO_Head, MeshIndex, SkinIndex );
	SetGearButtons(MeshIndex, SkinIndex, HeadMeshKey, HeadSkinKey, HeadFunctionKey);
}

function Callback_Body( byte MeshIndex, byte SkinIndex )
{
	SetOption(CO_Body, MeshIndex, SkinIndex );
	SetGearButtons(MeshIndex, SkinIndex, BodyMeshKey, BodySkinKey, BodyFunctionKey);
}

function Callback_Attachment( byte MeshIndex, byte SkinIndex )
{
	SetOption(CO_Attachment, MeshIndex, SkinIndex, 0 );
	SetAttachmentButtons(AttachmentKey, AttachmentFunctionKey);
}

function SetOption( ECustomizationOption CustomizationOption, byte PrimaryIndex, optional byte SecondaryIndex, optional byte AttachmentSlot )
{
	local KFPawn_Human KFP;
	if( GetPC().Pawn != none )
	{
		KFP = KFPawn_Human( GetPC().Pawn );
		if ( KFP != none )
		{
			if( CustomizationOption == CO_Character && KFPawn_Customization(GetPC().Pawn) != none )
			{
				KFPawn_Customization(GetPC().Pawn).UpdateCustomizationCharacter( PrimaryIndex );
			}
			else if( CustomizationOption == CO_Attachment )
			{
				KFP.UpdateCustomizationOption( CustomizationOption, PrimaryIndex, SecondaryIndex, AttachmentSlot );
			}
			else
			{
				KFP.UpdateCustomizationOption( CustomizationOption, PrimaryIndex, SecondaryIndex );
			}
		}
	}
}

defaultproperties
{
	ControllerRotationThreshold=.25
	ControllerRotationRate=15
	KFCharacterInfoString="KFCharacterInfo"
	HeadFunctionKey="selectedHead"
	BodyFunctionKey="selectedBody"
	AttachmentFunctionKey="selectedAttachment"
	BodyMeshKey="BodyMesh"
	BodySkinKey="BodySkin"
	HeadMeshKey="HeadMesh"
	HeadSkinKey="HeadSkin"
	AttachmentKey="Attachment"
	AttachmentSkinKey="AttachmentSkin"
	ClearImagePath="CHR_Shared_TEX.NoItem_Selection"
	SubWidgetBindings.Add((WidgetName="customizationComponent",WidgetClass=class'KFGFxObject_Container'))
}
