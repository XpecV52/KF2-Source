//=============================================================================
// KFGFxMenu_Gear
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 7/23/2013
//=============================================================================

class KFGFxMenu_Gear extends KFGFxObject_Menu
	dependson(KFWeaponSkinList)
	native(UI);

/** The customization option we want alter */
enum ECustomizationOption
{
	CO_Character,
	CO_Head,
	CO_Body,
	CO_Attachment
};

var KFGFxObject_Container CustomizationComponent;
var KFPlayerReplicationInfo MyKFPRI;
var KFGFxGearContainer_PerksSelection PerkSelectionContainer;

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

/*********** Weapon customization *****************/
var localized string WeaponsString;
var localized string WeaponsInfoString;

var KFGFxObject_TraderItems TraderItems;

var array<class<KFWeaponDefinition> > CurrentWearponDefList;

var const int ControllerRotationRate;
var const float ControllerRotationThreshold;

var int CurrentPerkIndex;

var string ClearImagePath;

function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	super.InitializeMenu(InManager);
	MyKFPRI = KFPlayerReplicationInfo( GetPC().PlayerReplicationInfo );
	LocalizeText();
	// Set the list of usable characters
	UpdateCharacterList();	
	UpdateGear();
	TraderItems = KFGameReplicationInfo( KFPlayerController(GetPC()).WorldInfo.GRI ).TraderItems;
}

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{	
	switch(WidgetName)
	{
        case ('perkSelectionContainer'):
			if ( PerkSelectionContainer == none )
			{
			    PerkSelectionContainer = KFGFxGearContainer_PerksSelection( Widget );
			    PerkSelectionContainer.Initialize(self);
		    }
        break;
	}

	return true;
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
		return;
	}
	UpdateCharacterList();	
	UpdateGear();
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

	LocalizedObject.SetString("weapons", WeaponsString);
	LocalizedObject.SetString("weaponsInfo", WeaponsInfoString);

	SetObject("localizeText", LocalizedObject);
}

//WEAPONS CUSTOMIZATION 
function UpdateWeaponList()
{
	local int i, ItemIndex;
	local GFxObject DataProvider, SlotObject;
	local string TexturePath;
	local KFPlayerController KFPC; 
	local array<STraderItem> FullItemList;

	KFPC = KFPlayerController(GetPC());
	if (KFPC == none || TraderItems == none)
	{
		return;
	}

	ItemIndex = 0;
	DataProvider = CreateArray();
	FullItemList = TraderItems.SaleItems;

	CurrentWearponDefList.length = 0;

	for (i = 0; i < FullItemList.Length; i++)
	{
		if ( FullItemList[i].AssociatedPerkClass == None ||
				 (CurrentPerkIndex < KFPC.PerkList.Length && FullItemList[i].AssociatedPerkClass == KFPC.PerkList[CurrentPerkIndex].PerkClass) )
		{
			SlotObject = CreateObject( "Object" );
			SlotObject.SetInt("ItemIndex", i);
			SlotObject.SetString("label", FullItemList[i].WeaponDef.static.GetItemName());
			TexturePath = "img://"$FullItemList[i].WeaponDef.static.GetImagePath();
			SlotObject.SetString("source", TexturePath);
			SlotObject.SetBool("enabled", (class'KFWeaponSkinList'.default.Skins.Find('WeaponDef', FullItemList[i].WeaponDef) != INDEX_NONE));

			UpdateWeaponVariants( FullItemList[i].WeaponDef, SlotObject );

			DataProvider.SetElementObject(ItemIndex, SlotObject);
			ItemIndex++;
			CurrentWearponDefList.AddItem(FullItemList[i].WeaponDef);
		}
		
	}

	SetObject("weaponArray", DataProvider);
//@HSL_MOD_BEGIN - amiller 4/1/2016 - Force game to resave game.ini when a gear piece changes
	KFPC = KFPlayerController(GetPC());
	KFPC.SaveConfig();
//@HSL_MOD_END
}

function UpdateWeaponVariants(class<KFWeaponDefinition> WeaponDef, out GFxObject MeshObject)
{
	local int i, ItemIndex;
	local GFxObject DataProvider, SlotObject;
	//local string SectionPath;
	//local string TexturePath;

	ItemIndex = 0;
	DataProvider = CreateArray();

	SlotObject = CreateObject( "Object" );
	SlotObject.SetString("label", NoneString);
	SlotObject.SetString("source", "img://"$ClearImagePath);
	SlotObject.SetBool("enabled", true);
	DataProvider.SetElementObject(ItemIndex, SlotObject);
	ItemIndex++;

	for (i = 0; i < class'KFWeaponSkinList'.default.Skins.length; i++)
	{
		if( class'KFWeaponSkinList'.default.Skins[i].Weapondef == WeaponDef )
		{
			SlotObject = CreateObject( "Object" );
			SlotObject.SetInt("ItemIndex", i);
			SlotObject.SetString("label", class'KFWeaponSkinList'.default.Skins[i].MIC_3P);
			SlotObject.SetBool("enabled", class'KFUnlockManager'.static.GetWeaponSkinAvailable(class'KFWeaponSkinList'.default.Skins[i].Id));
			SlotObject.SetInt("definition", class'KFWeaponSkinList'.default.Skins[i].Id);
			//TexturePath = "img://"$PathName(Skin.UITexture);
			//SlotObject.SetString("source", TexturePath);

			DataProvider.SetElementObject(ItemIndex, SlotObject);
			ItemIndex++;
		}
	}

	MeshObject.SetObject("skinInfo", DataProvider);
}

function UpdateCharacterList()
{
	local byte i, ItemIndex;
	local GFxObject DataProvider, SlotObject;
	local string TexturePath;
	local KFPlayerController KFPC; 

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
			SlotObject.SetBool("enabled", true);
			SlotObject.SetString("source", TexturePath);
			DataProvider.SetElementObject(ItemIndex, SlotObject);
			ItemIndex++;
		}
		else
		{
			LogInternal(MyKFPRI.CharacterArchetypes[i] @ "is not purchased.");
		}
	}
	
	SetObject("characterArray", DataProvider);
//@HSL_MOD_BEGIN - amiller 4/1/2016 - Force game to resave game.ini when a gear piece changes
	KFPC = KFPlayerController(GetPC());
	KFPC.SaveConfig();
//@HSL_MOD_END
}

function UpdateGear()
{
	CurrentCharInfo = MyKFPRI.CharacterArchetypes[MyKFPRI.RepCustomizationInfo.CharacterIndex];
	CharInfoPath = String(CurrentCharInfo.Name);
	// Set the list of usable bodies for this character
	UpdateMeshList(BodyMeshKey, BodySkinKey, CurrentCharInfo.BodyVariants, "bodyArray");
	// Set the list of usable heads for this character
	UpdateMeshList(HeadMeshKey, HeadSkinKey, CurrentCharInfo.HeadVariants, "headsArray");
	// Set the list of usable attachments for this character
	UpdateAttachmentsList(CurrentCharInfo.CosmeticVariants);

	SetCurrentCharacterButtons();
}

function UpdateMeshList(string OutfitKey, string SkinKey, array<OutfitVariants> Outfits, string DataArrayString)
{
	local byte i, ItemIndex;
	local GFxObject DataProvider, SlotObject;
	local string TexturePath;
	local OutfitVariants Outfit;
	local SkinVariant FirstSkin;
	
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
			SlotObject.SetBool("enabled", true);
			FirstSkin = UpdateVariants( OutfitKey, SkinKey, Outfit.SkinVariations, i, SlotObject );
			TexturePath = "img://"$PathName(FirstSkin.UITexture);
			SlotObject.SetString("source", TexturePath);

			

			DataProvider.SetElementObject(ItemIndex, SlotObject);
			ItemIndex++;
		}
		else
		{
			LogInternal("Outfit" @ Outfit.MeshName @ "is not purchased.");
		}
	}
	
	SetObject(DataArrayString, DataProvider);
}

function UpdateAttachmentsList(array<AttachmentVariants> Attachments)
{
	local byte i, ItemIndex;
	local GFxObject DataProvider, SlotObject;
	local string TexturePath;
	local AttachmentVariants Variant;
	local Pawn MyPawn;
	local SkinVariant FirstSkin;

	ItemIndex = 0;
	DataProvider = CreateArray();
	MyPawn = GetPC().Pawn;

	// Insert blank object
	SlotObject = CreateObject( "Object" );
	SlotObject.SetString("label", NoneString);
	SlotObject.SetString("source", "img://"$ClearImagePath);
	SlotObject.SetBool("enabled", true);
	DataProvider.SetElementObject(ItemIndex, SlotObject);
	ItemIndex++;

	for (i = 0; i < Attachments.length; i++)
	{
		Variant = Attachments[i];
		if ( CurrentCharInfo.IsAttachmentAvailable(Variant, MyPawn) )
		{
			SlotObject = CreateObject( "Object" );
			SlotObject.SetInt("ItemIndex", i);
			FirstSkin= UpdateVariants( AttachmentKey, AttachmentSkinKey, Variant.AttachmentItem.SkinVariations, i, SlotObject );
			SlotObject.SetString("label", Localize(CharInfoPath, AttachmentKey$i, KFCharacterInfoString));
			SlotObject.SetBool("enabled", true);
			TexturePath = "img://"$PathName(FirstSkin.UITexture);
			SlotObject.SetString("source", TexturePath);
			
			DataProvider.SetElementObject(ItemIndex, SlotObject);
			ItemIndex++;
		}
	}
	
	SetObject("attachmentsArray", DataProvider);
}

function SkinVariant UpdateVariants(string OutfitKey, string KeyName, out array<SkinVariant> SkinVariations, int OutfitIndex, out GFxObject MeshObject)
{
	local byte i, ItemIndex;
	local GFxObject DataProvider, SlotObject;
	local SkinVariant Skin;
	local SkinVariant FirstSkin;
	local string SectionPath;
	local string TexturePath;
	local bool bFoundFirst;

	ItemIndex = 0;
	DataProvider = CreateArray();
	SectionPath = CharInfoPath$"."$OutfitKey$OutfitIndex;	

	for (i = 0; i < SkinVariations.length; i++)
	{
		Skin = SkinVariations[i];
		if (class'KFUnlockManager'.static.GetAvailableSkin(Skin))
		{
			if(!bFoundFirst)
			{
				FirstSkin = Skin;
				bFoundFirst = true;
			}
			SlotObject = CreateObject( "Object" );
			SlotObject.SetInt("ItemIndex", i);
			SlotObject.SetString("label", Localize(SectionPath, KeyName$i, KFCharacterInfoString));
			TexturePath = "img://"$PathName(Skin.UITexture);
			SlotObject.SetBool("enabled", true);
			SlotObject.SetString("source", TexturePath);

			DataProvider.SetElementObject(ItemIndex, SlotObject);
			ItemIndex++;
		}
		else
		{
			LogInternal("Skin" @ Skin.UITexture.Name @ "is not purchased.");
		}
	}
	MeshObject.SetObject("skinInfo", DataProvider);

	return FirstSkin;
}

function SetCurrentCharacterButtons()
{
	local GFxObject DataObject;

	DataObject = CreateObject("Object");

	DataObject.SetString( "selectedCharacter", Localize(CharInfoPath, "CharacterName", KFCharacterInfoString) );
	DataObject.SetString( "characterBio", Localize(CharInfoPath, "Description", KFCharacterInfoString) );
	DataObject.SetInt( "selectedCharacterIndex", MyKFPRI.RepCustomizationInfo.CharacterIndex );

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
	local KFPlayerController KFPC; 

	DataObject = CreateObject("Object");

	if(MeshIndex == 255)
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
//@HSL_MOD_BEGIN - amiller 4/1/2016 - Force game to resave game.ini when a gear piece changes
	KFPC = KFPlayerController(GetPC());
	KFPC.SaveConfig();
//@HSL_MOD_END
}

/** Update the labels for our currently equipped attachments */
function SetAttachmentButtons(string AttachmentMeshKey, string sectionFunctionName)
{
	local string CurrentMesh, FinishedString;
	local GFxObject DataObject;
	local byte i, AttachmentIndex;
	local KFPlayerController KFPC; 

	DataObject = CreateObject("Object");

	for(i = 0; i < 3; i++)
	{
		AttachmentIndex = MyKFPRI.RepCustomizationInfo.AttachmentMeshIndices[i];		
		if( AttachmentIndex == 255)
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
//@HSL_MOD_BEGIN - amiller 4/1/2016 - Force game to resave game.ini when a gear piece changes
	KFPC = KFPlayerController(GetPC());
	KFPC.SaveConfig();
//@HSL_MOD_END
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

function Callback_Weapon( int ItemIndex, int SkinIndex )
{
	local KFPawn_Customization KFP;

	KFP = KFPawn_Customization(GetPC().Pawn);
	if(KFP != none)
	{
		//KFP.AttachWeaponByItemDefinition(SkinIndex);
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

private function Callback_Character(byte Index)
{
	local Pawn P;

	P = GetPC().Pawn;
	if( P != none )
	{
		// only allowed during gear preview
		if ( KFPawn_Customization(P) != none )
		{
			SelectCharacter(P, Index);
		}
	}

	UpdateGear();
}

private function Callback_Head( byte MeshIndex, byte SkinIndex )
{
	local Pawn P;
	local KFPawn KFP;

	P = GetPC().Pawn;
	if( P != none )
	{
		KFP = KFPawn( P );
		if ( KFP != none )
		{
			SelectCustomizationOption(KFP, CO_Head, MeshIndex, SkinIndex);
		}
	}

	SetGearButtons(MeshIndex, SkinIndex, HeadMeshKey, HeadSkinKey, HeadFunctionKey);
}

private function Callback_Body( byte MeshIndex, byte SkinIndex )
{
	local Pawn P;
	local KFPawn KFP;

	P = GetPC().Pawn;
	if( P != none )
	{
		KFP = KFPawn( P );
		if ( KFP != none )
		{
			SelectCustomizationOption(KFP, CO_Body, MeshIndex, SkinIndex);

			// When assigning a new body mesh we may need to remove certain attachments
			// refresh filters, and update the equipped accessories list
			UpdateAttachmentsList(CurrentCharInfo.CosmeticVariants);
			SetAttachmentButtons(AttachmentKey, AttachmentFunctionKey);
		}
	}

	SetGearButtons(MeshIndex, SkinIndex, BodyMeshKey, BodySkinKey, BodyFunctionKey);
}

private function Callback_Attachment( byte MeshIndex, byte SkinIndex )
{
	local Pawn P;
	local KFPawn KFP;
	local KFPlayerReplicationInfo KFPRI;
	local int SlotIndex;

	P = GetPC().Pawn;
	if( P != none )
	{
		KFP = KFPawn( P );
		KFPRI = KFPlayerReplicationInfo(P.PlayerReplicationInfo);

		if ( KFP != none && KFPRI != None )
		{
			CurrentCharInfo.DetachConflictingAttachments(MeshIndex, KFP, KFPRI);
			SlotIndex = CurrentCharInfo.GetAttachmentSlotIndex(MeshIndex, KFP);
			SelectCustomizationOption(KFP, CO_Attachment, MeshIndex, SkinIndex, SlotIndex);
		}
	}

	SetAttachmentButtons(AttachmentKey, AttachmentFunctionKey);
}

/** Update our character parts when the UI is being used */
native private function SelectCharacter(Pawn P, byte CharacterIndex);
native private function SelectCustomizationOption(Pawn P, ECustomizationOption CustomizationOption, byte MeshIndex, byte SkinIndex, optional int AttachmentIndex);

defaultproperties
{
   HeadMeshKey="HeadMesh"
   HeadSkinKey="HeadSkin"
   HeadFunctionKey="selectedHead"
   BodyMeshKey="BodyMesh"
   BodySkinKey="BodySkin"
   BodyFunctionKey="selectedBody"
   AttachmentKey="Attachment"
   AttachmentSkinKey="AttachmentSkin"
   AttachmentFunctionKey="selectedAttachment"
   KFCharacterInfoString="KFCharacterInfo"
   GearHeaderString="CUSTOMIZE GEAR"
   CharacterString="CHARACTER"
   BioString="BIO"
   HeadString="HEAD"
   BodyString="BODY"
   AttachmentsString="ACCESSORIES"
   SkinsString="SKINS"
   BackString="BACK"
   NoneString="NONE"
   WeaponsString="Weapons"
   WeaponsInfoString="Customize"
   ControllerRotationRate=15
   ControllerRotationThreshold=0.250000
   CurrentPerkIndex=-1
   ClearImagePath="CHR_Shared_TEX.NoItem_Selection"
   SubWidgetBindings(0)=(WidgetName="CustomizationComponent",WidgetClass=Class'KFGame.KFGFxObject_Container')
   SubWidgetBindings(1)=(WidgetName="PerkSelectionContainer",WidgetClass=Class'KFGame.KFGFxGearContainer_PerksSelection')
   Name="Default__KFGFxMenu_Gear"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
