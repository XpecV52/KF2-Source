/*******************************************************************************
 * KFGFxMenu_Gear generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxMenu_Gear extends KFGFxObject_Menu within GFxMoviePlayer
    native(UI);

enum ECustomizationOption
{
    CO_Character,
    CO_Head,
    CO_Body,
    CO_Attachment,
    CO_MAX
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
var const string KFEmoteInfoString;
var KFCharacterInfo_Human CurrentCharInfo;
var string CharInfoPath;
var const localized string GearHeaderString;
var const localized string CharacterString;
var const localized string BioString;
var const localized string HeadString;
var const localized string BodyString;
var const localized string AttachmentsString;
var const localized string SkinsString;
var const localized string BackString;
var const localized string NoneString;
var KFGFxObject_TraderItems TraderItems;
var const int ControllerRotationRate;
var const float ControllerRotationThreshold;
var int CurrentPerkIndex;
var string ClearImagePath;
var array<Emote> EmoteList;

function InitializeMenu(KFGFxMoviePlayer_Manager InManager)
{
    super.InitializeMenu(InManager);
    CheckForCustomizationPawn(Outer.GetPC());
    MyKFPRI = KFPlayerReplicationInfo(Outer.GetPC().PlayerReplicationInfo);
    LocalizeText();
    EmoteList = Class'KFEmoteList'.static.GetEmoteArray();
    UpdateCharacterList();
    UpdateGear();
    TraderItems = KFGameReplicationInfo(KFPlayerController(Outer.GetPC()).WorldInfo.GRI).TraderItems;
}

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
    switch(WidgetName)
    {
        case 'PerkSelectionContainer':
            if(PerkSelectionContainer == none)
            {
                PerkSelectionContainer = KFGFxGearContainer_PerksSelection(Widget);
                PerkSelectionContainer.Initialize(self);
            }
            break;
        default:
            break;
    }
    return true;
}

function OnOpen()
{
    local PlayerController PC;

    PC = Outer.GetPC();
    if(PC == none)
    {
        return;
    }
    CheckForCustomizationPawn(PC);
    Outer.GetGameViewportClient().__HandleInputAxis__Delegate = OnAxisModified;
    if(Class'WorldInfo'.static.IsMenuLevel())
    {
        Manager.ManagerObject.SetBool("backgroundVisible", false);        
    }
    else
    {
        if(PC.PlayerReplicationInfo.bReadyToPlay && PC.WorldInfo.GRI.bMatchHasBegun)
        {
            SetBool("characterButtonEnabled", false);
            return;
        }
    }
    UpdateCharacterList();
    UpdateGear();
}

function CheckForCustomizationPawn(PlayerController PC)
{
    local KFPlayerController KFPC;

    if((PC.Pawn == none) || !PC.Pawn.IsAliveAndWell() && KFPawn_Customization(PC.Pawn) == none)
    {
        KFPC = KFPlayerController(PC);
        if(KFPC != none)
        {
            KFPC.SpawnMidGameCustomizationPawn();
        }
    }
}

function SaveChanges()
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    KFPC.SaveConfig();
    Manager.CachedProfile.Save(byte(LocalPlayer(KFPC.Player).ControllerId));
}

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("header", GearHeaderString);
    LocalizedObject.SetString("listButton", BackString);
    LocalizedObject.SetString("bioStringText", BioString);
    LocalizedObject.SetString("charactersString", CharacterString);
    LocalizedObject.SetString("headsString", HeadString);
    LocalizedObject.SetString("emoteString", Class'KFLocalMessage_VoiceComms'.default.VoiceCommsOptionStrings[8]);
    LocalizedObject.SetString("bodiesString", BodyString);
    LocalizedObject.SetString("skinsString", SkinsString);
    LocalizedObject.SetString("attachmentsString", AttachmentsString);
    SetObject("localizeText", LocalizedObject);
}

function UpdateEmoteList()
{
    local byte ItemIndex, I;
    local GFxObject DataProvider, SlotObject;
    local string TexturePath;

    ItemIndex = 0;
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x41:

    if(I < EmoteList.Length)
    {
        if(Class'KFEmoteList'.static.GetUnlockedEmote(EmoteList[I].Id) != 'None')
        {
            SlotObject = Outer.CreateObject("Object");
            SlotObject.SetInt("ItemIndex", I);
            SlotObject.SetString("label", Localize(EmoteList[I].ItemName, "EmoteName", KFCharacterInfoString));
            TexturePath = "img://" $ EmoteList[I].IconPath;
            SlotObject.SetBool("enabled", true);
            SlotObject.SetString("source", TexturePath);
            DataProvider.SetElementObject(ItemIndex, SlotObject);
            ++ ItemIndex;            
        }
        ++ I;
        goto J0x41;
    }
    SetObject("emoteArray", DataProvider);
}

function UpdateCharacterList()
{
    local byte I, ItemIndex;
    local GFxObject DataProvider, SlotObject;
    local string TexturePath;

    ItemIndex = 0;
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x41:

    if(I < MyKFPRI.CharacterArchetypes.Length)
    {
        if(Class'KFUnlockManager'.static.GetAvailable((MyKFPRI.CharacterArchetypes[I])))
        {
            SlotObject = Outer.CreateObject("Object");
            SlotObject.SetInt("ItemIndex", I);
            SlotObject.SetString("label", Localize(string(MyKFPRI.CharacterArchetypes[I].Name), "CharacterName", KFCharacterInfoString));
            TexturePath = "img://" $ PathName(MyKFPRI.CharacterArchetypes[I].DefaultHeadPortrait);
            SlotObject.SetBool("enabled", true);
            SlotObject.SetString("source", TexturePath);
            DataProvider.SetElementObject(ItemIndex, SlotObject);
            ++ ItemIndex;            
        }
        ++ I;
        goto J0x41;
    }
    SetObject("characterArray", DataProvider);
}

function UpdateGear()
{
    CurrentCharInfo = MyKFPRI.CharacterArchetypes[MyKFPRI.RepCustomizationInfo.CharacterIndex];
    CharInfoPath = string(CurrentCharInfo.Name);
    UpdateMeshList(BodyMeshKey, BodySkinKey, CurrentCharInfo.BodyVariants, "bodyArray");
    UpdateMeshList(HeadMeshKey, HeadSkinKey, CurrentCharInfo.HeadVariants, "headsArray");
    UpdateAttachmentsList(CurrentCharInfo.CosmeticVariants);
    UpdateEmoteList();
    SetCurrentCharacterButtons();
}

function UpdateMeshList(string OutfitKey, string SkinKey, array<OutfitVariants> Outfits, string DataArrayString)
{
    local byte I, ItemIndex;
    local GFxObject DataProvider, SlotObject;
    local string TexturePath;
    local OutfitVariants Outfit;
    local SkinVariant FirstSkin;

    ItemIndex = 0;
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x41:

    if(I < Outfits.Length)
    {
        Outfit = Outfits[I];
        if(Class'KFUnlockManager'.static.GetAvailableOutfit(Outfit))
        {
            SlotObject = Outer.CreateObject("Object");
            SlotObject.SetInt("ItemIndex", I);
            SlotObject.SetString("label", Localize(CharInfoPath, OutfitKey $ string(I), KFCharacterInfoString));
            SlotObject.SetBool("enabled", true);
            FirstSkin = UpdateOutfitVariants(OutfitKey, SkinKey, Outfit.SkinVariations, I, SlotObject);
            TexturePath = "img://" $ PathName(FirstSkin.UITexture);
            SlotObject.SetString("source", TexturePath);
            DataProvider.SetElementObject(ItemIndex, SlotObject);
            ++ ItemIndex;            
        }
        ++ I;
        goto J0x41;
    }
    SetObject(DataArrayString, DataProvider);
}

function UpdateAttachmentsList(array<AttachmentVariants> Attachments)
{
    local byte I, ItemIndex;
    local GFxObject DataProvider, SlotObject;
    local string TexturePath;
    local AttachmentVariants Variant;
    local Pawn MyPawn;
    local SkinVariant FirstSkin;
    local string AttachmentName;

    ItemIndex = 0;
    DataProvider = Outer.CreateArray();
    MyPawn = Outer.GetPC().Pawn;
    SlotObject = Outer.CreateObject("Object");
    SlotObject.SetString("label", NoneString);
    SlotObject.SetString("source", "img://" $ ClearImagePath);
    SlotObject.SetBool("enabled", true);
    DataProvider.SetElementObject(ItemIndex, SlotObject);
    ++ ItemIndex;
    I = 0;
    J0x184:

    if(I < Attachments.Length)
    {
        Variant = Attachments[I];
        if(CurrentCharInfo.IsAttachmentAvailable(Variant, MyPawn))
        {
            SlotObject = Outer.CreateObject("Object");
            SlotObject.SetInt("ItemIndex", I);
            FirstSkin = UpdateCosmeticVariants(AttachmentKey, AttachmentSkinKey, Variant.AttachmentItem, I, SlotObject);
            AttachmentName = Localize(string(Variant.AttachmentItem.Name), AttachmentKey, KFCharacterInfoString);
            SlotObject.SetString("label", AttachmentName);
            SlotObject.SetBool("enabled", true);
            TexturePath = "img://" $ PathName(FirstSkin.UITexture);
            SlotObject.SetString("source", TexturePath);
            DataProvider.SetElementObject(ItemIndex, SlotObject);
            ++ ItemIndex;
        }
        ++ I;
        goto J0x184;
    }
    SetObject("attachmentsArray", DataProvider);
}

function SkinVariant UpdateCosmeticVariants(string OutfitKey, string KeyName, KFCharacterAttachment Attachment, int OutfitIndex, out GFxObject MeshObject)
{
    local byte I, ItemIndex;
    local GFxObject DataProvider, SlotObject;
    local SkinVariant Skin, FirstSkin;
    local string TexturePath;
    local bool bFoundFirst;
    local string SkinName;

    ItemIndex = 0;
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x41:

    if(I < Attachment.SkinVariations.Length)
    {
        Skin = Attachment.SkinVariations[I];
        if(Class'KFUnlockManager'.static.GetAvailableSkin(Skin))
        {
            if(!bFoundFirst)
            {
                FirstSkin = Skin;
                bFoundFirst = true;
            }
            SlotObject = Outer.CreateObject("Object");
            SlotObject.SetInt("ItemIndex", I);
            SkinName = Localize(string(Attachment.Name), KeyName $ string(I), KFCharacterInfoString);
            SlotObject.SetString("label", SkinName);
            TexturePath = "img://" $ PathName(Skin.UITexture);
            SlotObject.SetBool("enabled", true);
            SlotObject.SetString("source", TexturePath);
            DataProvider.SetElementObject(ItemIndex, SlotObject);
            ++ ItemIndex;            
        }
        ++ I;
        goto J0x41;
    }
    MeshObject.SetObject("skinInfo", DataProvider);
    return FirstSkin;
}

function SkinVariant UpdateOutfitVariants(string OutfitKey, string KeyName, out array<SkinVariant> SkinVariations, int OutfitIndex, out GFxObject MeshObject)
{
    local byte I, ItemIndex;
    local GFxObject DataProvider, SlotObject;
    local SkinVariant Skin, FirstSkin;
    local string SectionPath, TexturePath;
    local bool bFoundFirst;

    ItemIndex = 0;
    DataProvider = Outer.CreateArray();
    SectionPath = ((CharInfoPath $ ".") $ OutfitKey) $ string(OutfitIndex);
    I = 0;
    J0x71:

    if(I < SkinVariations.Length)
    {
        Skin = SkinVariations[I];
        if(Class'KFUnlockManager'.static.GetAvailableSkin(Skin))
        {
            if(!bFoundFirst)
            {
                FirstSkin = Skin;
                bFoundFirst = true;
            }
            SlotObject = Outer.CreateObject("Object");
            SlotObject.SetInt("ItemIndex", I);
            SlotObject.SetString("label", Localize(SectionPath, KeyName $ string(I), KFCharacterInfoString));
            TexturePath = "img://" $ PathName(Skin.UITexture);
            SlotObject.SetBool("enabled", true);
            SlotObject.SetString("source", TexturePath);
            DataProvider.SetElementObject(ItemIndex, SlotObject);
            ++ ItemIndex;            
        }
        ++ I;
        goto J0x71;
    }
    MeshObject.SetObject("skinInfo", DataProvider);
    return FirstSkin;
}

function SetCurrentCharacterButtons()
{
    local GFxObject DataObject;

    DataObject = Outer.CreateObject("Object");
    DataObject.SetString("selectedCharacter", Localize(CharInfoPath, "CharacterName", KFCharacterInfoString));
    DataObject.SetString("characterBio", Localize(CharInfoPath, "Description", KFCharacterInfoString));
    DataObject.SetInt("selectedCharacterIndex", MyKFPRI.RepCustomizationInfo.CharacterIndex);
    SetObject("selectedCharacter", DataObject);
    SetGearButtons(MyKFPRI.RepCustomizationInfo.HeadMeshIndex, MyKFPRI.RepCustomizationInfo.HeadSkinIndex, HeadMeshKey, HeadSkinKey, HeadFunctionKey);
    SetGearButtons(MyKFPRI.RepCustomizationInfo.BodyMeshIndex, MyKFPRI.RepCustomizationInfo.BodySkinIndex, BodyMeshKey, BodySkinKey, BodyFunctionKey);
    SetAttachmentButtons(AttachmentKey, AttachmentFunctionKey);
    SetEmoteButton();
}

function SetEmoteButton()
{
    local GFxObject DataObject;
    local int EmoteIndex;

    EmoteIndex = Class'KFEmoteList'.static.GetEmoteIndex(Class'KFEmoteList'.static.GetEquippedEmoteId());
    DataObject = Outer.CreateObject("Object");
    if(EmoteIndex == 255)
    {
        DataObject.SetString("selectedEmote", "");
        DataObject.SetInt("selectedEmoteIndex", 0);        
    }
    else
    {
        DataObject.SetString("selectedEmote", Localize(EmoteList[EmoteIndex].ItemName, "EmoteName", KFCharacterInfoString));
        DataObject.SetInt("selectedEmoteIndex", 0);
    }
    SetObject("selectedEmote", DataObject);
}

function SetGearButtons(byte MeshIndex, byte SkinIndex, string MeshKey, string SkinKey, string sectionFunctionName)
{
    local string SectionPath, CurrentMesh, SkinName, MeshName;
    local GFxObject DataObject;

    DataObject = Outer.CreateObject("Object");
    if(MeshIndex == 255)
    {
        DataObject.SetString(sectionFunctionName, NoneString);        
    }
    else
    {
        CurrentMesh = MeshKey $ string(MeshIndex);
        SectionPath = (CharInfoPath $ ".") $ CurrentMesh;
        SkinName = Localize(SectionPath, SkinKey $ string(SkinIndex), KFCharacterInfoString);
        MeshName = Localize(CharInfoPath, CurrentMesh, KFCharacterInfoString);
        DataObject.SetString(sectionFunctionName, (MeshName @ "
") @ SkinName);
    }
    DataObject.SetInt(sectionFunctionName $ "Index", MeshIndex);
    DataObject.SetInt(sectionFunctionName $ "SkinIndex", SkinIndex);
    SetObject(sectionFunctionName, DataObject);
}

function SetAttachmentButtons(string AttachmentMeshKey, string sectionFunctionName)
{
    local string FinishedString;
    local GFxObject DataObject;
    local byte I, AttachmentIndex;

    DataObject = Outer.CreateObject("Object");
    I = 0;
    J0x3F:

    if(I < 3)
    {
        AttachmentIndex = MyKFPRI.RepCustomizationInfo.AttachmentMeshIndices[I];
        if(AttachmentIndex == 255)
        {            
            FinishedString $= ("----" $ "
");            
        }
        else
        {            
            FinishedString $= ((Localize(string(CurrentCharInfo.CosmeticVariants[AttachmentIndex].AttachmentItem.Name), AttachmentMeshKey, KFCharacterInfoString)) $ "
");
        }
        ++ I;
        goto J0x3F;
    }
    DataObject.SetString(sectionFunctionName, FinishedString);
    SetObject(sectionFunctionName, DataObject);
}

event OnClose()
{
    local PlayerController PC;
    local KFPlayerController KFPC;

    super.OnClose();
    Manager.CachedProfile.Save(byte(Outer.GetLP().ControllerId));
    Outer.GetGameViewportClient().__HandleInputAxis__Delegate = None;
    if(Class'WorldInfo'.static.IsMenuLevel())
    {
        Manager.ManagerObject.SetBool("backgroundVisible", true);
    }
    PC = Outer.GetPC();
    if(PC != none)
    {
        KFPC = KFPlayerController(PC);
        if(KFPC != none)
        {
            KFPC.ReturnToViewTarget();
            if((PC.WorldInfo.GRI.bMatchHasBegun && PC.Pawn != none) && !PC.Pawn.IsA('KFPawn_Customization'))
            {
                PC.ServerCamera('FirstPerson');
            }
        }
    }
}

event bool OnAxisModified(int ControllerId, name Key, float Delta, float DeltaTime, bool bGamepad)
{
    if(Outer.GetPC().PlayerInput.bUsingGamepad)
    {
        if((Key == 'XboxTypeS_RightX') && Abs(Delta) > ControllerRotationThreshold)
        {
            Callback_RotateCamera(int(Delta * float(ControllerRotationRate)));
        }
    }
    return false;
}

function Callback_RotateCamera(int RotationDirection)
{
    local KFPlayerCamera PlayerCamera;

    PlayerCamera = KFPlayerCamera(Outer.GetPC().PlayerCamera);
    if(PlayerCamera != none)
    {
        PlayerCamera.CustomizationCam.RotatedCamera(RotationDirection);
    }
}

function Callback_EndRotateCamera()
{
    local KFPlayerCamera PlayerCamera;

    PlayerCamera = KFPlayerCamera(Outer.GetPC().PlayerCamera);
    if(PlayerCamera != none)
    {
        PlayerCamera.CustomizationCam.StartFadeRotation();
    }
}

function Callback_BodyCamera()
{
    if(KFPlayerCamera(Outer.GetPC().PlayerCamera) != none)
    {
        KFPlayerCamera(Outer.GetPC().PlayerCamera).CustomizationCam.SetBodyView(0);
    }
}

function Callback_HeadCamera()
{
    if(KFPlayerCamera(Outer.GetPC().PlayerCamera) != none)
    {
        KFPlayerCamera(Outer.GetPC().PlayerCamera).CustomizationCam.SetBodyView(1);
    }
}

private final function Callback_Emote(byte Index)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    if(KFPC != none)
    {
        Class'KFEmoteList'.static.SaveEquippedEmote(EmoteList[Index].Id);
        if(KFPawn_Customization(KFPC.Pawn) != none)
        {
            KFPawn_Customization(KFPC.Pawn).PlayEmoteAnimation();
        }
    }
    SetEmoteButton();
}

private final function Callback_Character(byte Index)
{
    local Pawn P;

    P = Outer.GetPC().Pawn;
    if(P != none)
    {
        if(KFPawn_Customization(P) != none)
        {
            SelectCharacter(P, Index);
        }
    }
    UpdateGear();
}

private final function Callback_Head(byte MeshIndex, byte SkinIndex)
{
    local Pawn P;
    local KFPawn KFP;

    P = Outer.GetPC().Pawn;
    if(P != none)
    {
        KFP = KFPawn(P);
        if(KFP != none)
        {
            SelectCustomizationOption(KFP, 1, MeshIndex, SkinIndex);
        }
    }
    SetGearButtons(MeshIndex, SkinIndex, HeadMeshKey, HeadSkinKey, HeadFunctionKey);
}

private final function Callback_Body(byte MeshIndex, byte SkinIndex)
{
    local Pawn P;
    local KFPawn KFP;

    P = Outer.GetPC().Pawn;
    if(P != none)
    {
        KFP = KFPawn(P);
        if(KFP != none)
        {
            SelectCustomizationOption(KFP, 2, MeshIndex, SkinIndex);
            UpdateAttachmentsList(CurrentCharInfo.CosmeticVariants);
            SetAttachmentButtons(AttachmentKey, AttachmentFunctionKey);
        }
    }
    SetGearButtons(MeshIndex, SkinIndex, BodyMeshKey, BodySkinKey, BodyFunctionKey);
}

private final function Callback_Attachment(byte MeshIndex, byte SkinIndex)
{
    local Pawn P;
    local KFPawn KFP;
    local int SlotIndex;

    P = Outer.GetPC().Pawn;
    if(P != none)
    {
        KFP = KFPawn(P);
        if((KFP != none) && MyKFPRI != none)
        {
            CurrentCharInfo.DetachConflictingAttachments(MeshIndex, KFP, MyKFPRI);
            SlotIndex = CurrentCharInfo.GetAttachmentSlotIndex(MeshIndex, KFP);
            SelectCustomizationOption(KFP, 3, MeshIndex, SkinIndex, SlotIndex);
        }
    }
    SetAttachmentButtons(AttachmentKey, AttachmentFunctionKey);
}

function RelayFromCheatManager(Pawn P, KFGFxMenu_Gear.ECustomizationOption CustomizationOption, byte MeshIndex, byte SkinIndex, int AttachmentIndex, optional bool bIgnoreConflictingSlots)
{
    bIgnoreConflictingSlots = false;
    if(!bIgnoreConflictingSlots)
    {
        CurrentCharInfo.DetachConflictingAttachments(MeshIndex, KFPawn(P), MyKFPRI);
    }
    SelectCustomizationOption(P, CustomizationOption, MeshIndex, SkinIndex, AttachmentIndex);
    Manager.CachedProfile.SetCharacterGear(MyKFPRI.RepCustomizationInfo);
}

// Export UKFGFxMenu_Gear::execSelectCharacter(FFrame&, void* const)
private native final function SelectCharacter(Pawn P, byte CharacterIndex);

// Export UKFGFxMenu_Gear::execSelectCustomizationOption(FFrame&, void* const)
private native final function SelectCustomizationOption(Pawn P, KFGFxMenu_Gear.ECustomizationOption CustomizationOption, byte MeshIndex, byte SkinIndex, optional int AttachmentIndex);

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
    KFEmoteInfoString="KFEmoteInfo"
    GearHeaderString="CUSTOMIZE GEAR"
    CharacterString="CHARACTER"
    BioString="BIO"
    HeadString="HEAD"
    BodyString="BODY"
    AttachmentsString="ACCESSORIES"
    SkinsString="SKINS"
    BackString="BACK"
    NoneString="NONE"
    ControllerRotationRate=15
    ControllerRotationThreshold=0.25
    CurrentPerkIndex=-1
    ClearImagePath="CHR_Shared_TEX.NoItem_Selection"
    SubWidgetBindings=/* Array type was not detected. */
}