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
var const localized string Attachment0String;
var const localized string Attachment1String;
var const localized string Attachment2String;
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
    ForceWeeklyCowboyHat();
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
    LocalizedObject.SetString("attachment0String", Attachment0String);
    LocalizedObject.SetString("attachment1String", Attachment1String);
    LocalizedObject.SetString("attachment2String", Attachment2String);
    SetObject("localizeText", LocalizedObject);
}

function UpdateEmoteList()
{
    local int ItemIndex, I;
    local GFxObject DataProvider, SlotObject;
    local string TexturePath;

    ItemIndex = 0;
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x3F:

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
        goto J0x3F;
    }
    SetObject("emoteArray", DataProvider);
}

function UpdateCharacterList()
{
    local int I, ItemIndex;
    local GFxObject DataProvider, SlotObject;
    local string TexturePath;

    ItemIndex = 0;
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x3F:

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
        goto J0x3F;
    }
    SetObject("characterArray", DataProvider);
}

function UpdateGear()
{
    CurrentCharInfo = MyKFPRI.CharacterArchetypes[MyKFPRI.RepCustomizationInfo.CharacterIndex];
    if(CurrentCharInfo != none)
    {
        CharInfoPath = string(CurrentCharInfo.Name);
        UpdateMeshList(BodyMeshKey, BodySkinKey, CurrentCharInfo.BodyVariants, "bodyArray");
        UpdateMeshList(HeadMeshKey, HeadSkinKey, CurrentCharInfo.HeadVariants, "headsArray");
        UpdateAttachmentsList(CurrentCharInfo.CosmeticVariants);
        UpdateEmoteList();
        SetCurrentCharacterButtons();
        ForceWeeklyCowboyHat();        
    }
    else
    {
        Outer.GetPC().SetTimer(0.25, false, 'ReInitMenu', self);
    }
}

function ReInitMenu()
{
    InitializeMenu(Manager);
}

function UpdateMeshList(string OutfitKey, string SkinKey, array<OutfitVariants> Outfits, string DataArrayString)
{
    local int I, ItemIndex;
    local GFxObject DataProvider, SlotObject;
    local string TexturePath;
    local OutfitVariants Outfit;
    local SkinVariant FirstSkin;

    ItemIndex = 0;
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x3F:

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
        goto J0x3F;
    }
    SetObject(DataArrayString, DataProvider);
}

function UpdateAttachmentsList(array<AttachmentVariants> Attachments)
{
    local int I, ItemIndex;
    local GFxObject DataProvider, SlotObject;
    local string TexturePath;
    local AttachmentVariants Variant;
    local Pawn MyPawn;
    local SkinVariant FirstSkin;
    local string AttachmentName;
    local PlayerController PC;
    local bool bIsWildWest;
    local KFGameReplicationInfo KFGRI;

    bIsWildWest = false;
    ItemIndex = 0;
    DataProvider = Outer.CreateArray();
    MyPawn = Outer.GetPC().Pawn;
    SlotObject = Outer.CreateObject("Object");
    SlotObject.SetString("label", NoneString);
    SlotObject.SetString("source", "img://" $ ClearImagePath);
    SlotObject.SetInt("ItemIndex", -1);
    SlotObject.SetBool("enabled", true);
    DataProvider.SetElementObject(ItemIndex, SlotObject);
    ++ ItemIndex;
    PC = Outer.GetPC();
    KFGRI = ((PC != none) ? KFGameReplicationInfo(PC.WorldInfo.GRI) : none);
    bIsWildWest = ((KFGRI != none) && KFGRI.bIsWeeklyMode) && KFGRI.CurrentWeeklyIndex == 12;
    I = 0;
    J0x29E:

    if(I < Attachments.Length)
    {
        Variant = Attachments[I];
        if(CurrentCharInfo.IsAttachmentAvailable(Variant, MyPawn))
        {
            if(bIsWildWest && Variant.SocketName == 'Hat_Attach')
            {                
            }
            else
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
        }
        ++ I;
        goto J0x29E;
    }
    SetObject("attachmentsArray", DataProvider);
}

function SkinVariant UpdateCosmeticVariants(string OutfitKey, string KeyName, KFCharacterAttachment Attachment, int OutfitIndex, out GFxObject MeshObject)
{
    local int I, ItemIndex;
    local GFxObject DataProvider, SlotObject;
    local SkinVariant Skin, FirstSkin;
    local string TexturePath;
    local bool bFoundFirst;
    local string SkinName;

    ItemIndex = 0;
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x3F:

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
        goto J0x3F;
    }
    MeshObject.SetObject("skinInfo", DataProvider);
    return FirstSkin;
}

function SkinVariant UpdateOutfitVariants(string OutfitKey, string KeyName, out array<SkinVariant> SkinVariations, int OutfitIndex, out GFxObject MeshObject)
{
    local int I, ItemIndex;
    local GFxObject DataProvider, SlotObject;
    local SkinVariant Skin, FirstSkin;
    local string SectionPath, TexturePath;
    local bool bFoundFirst;

    ItemIndex = 0;
    DataProvider = Outer.CreateArray();
    SectionPath = ((CharInfoPath $ ".") $ OutfitKey) $ string(OutfitIndex);
    I = 0;
    J0x6F:

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
        goto J0x6F;
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

function SetGearButtons(int MeshIndex, int SkinIndex, string MeshKey, string SkinKey, string sectionFunctionName)
{
    local string SectionPath, CurrentMesh, SkinName, MeshName;
    local GFxObject DataObject;

    DataObject = Outer.CreateObject("Object");
    if(MeshIndex == -1)
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
    local GFxObject DataObject;
    local int I, AttachmentIndex;

    DataObject = Outer.CreateObject("Object");
    I = 0;
    J0x3E:

    if(I < 3)
    {
        AttachmentIndex = MyKFPRI.RepCustomizationInfo.AttachmentMeshIndices[I];
        if(AttachmentIndex == -1)
        {
            DataObject.SetString("selectedAttachment_" $ string(I), "----");            
        }
        else
        {
            DataObject.SetString("selectedAttachment_" $ string(I), Localize(string(CurrentCharInfo.CosmeticVariants[AttachmentIndex].AttachmentItem.Name), AttachmentMeshKey, KFCharacterInfoString));
        }
        ++ I;
        goto J0x3E;
    }
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

private final function Callback_Emote(int Index)
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

private final function Callback_Character(int Index)
{
    local Pawn P;

    P = Outer.GetPC().Pawn;
    if(P != none)
    {
        if(KFPawn_Customization(P) != none)
        {
            SelectCharacter(P, byte(Index));
        }
    }
    UpdateGear();
}

private final function Callback_Head(int MeshIndex, int SkinIndex)
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

private final function Callback_Body(int MeshIndex, int SkinIndex)
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

private final function Callback_Attachment1(int MeshIndex, int SkinIndex)
{
    Callback_AttachmentNumbered(MeshIndex, SkinIndex, 0);
}

private final function Callback_Attachment2(int MeshIndex, int SkinIndex)
{
    Callback_AttachmentNumbered(MeshIndex, SkinIndex, 1);
}

private final function Callback_Attachment3(int MeshIndex, int SkinIndex)
{
    Callback_AttachmentNumbered(MeshIndex, SkinIndex, 2);
}

private final function Callback_AttachmentNumbered(int MeshIndex, int SkinIndex, int SlotIndex)
{
    local Pawn P;
    local KFPawn KFP;
    local array<int> RemovedAttachments;

    P = Outer.GetPC().Pawn;
    if(P != none)
    {
        KFP = KFPawn(P);
        if((KFP != none) && MyKFPRI != none)
        {
            CurrentCharInfo.DetachConflictingAttachments(MeshIndex, KFP, MyKFPRI, RemovedAttachments);
            SelectCustomizationOption(KFP, 3, MeshIndex, SkinIndex, SlotIndex);
        }
    }
    SetAttachmentButtons(AttachmentKey, AttachmentFunctionKey);
}

private final function Callback_Attachment(int MeshIndex, int SkinIndex)
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
            SlotIndex = CurrentCharInfo.GetAttachmentSlotIndex(MeshIndex, KFP, MyKFPRI);
            SelectCustomizationOption(KFP, 3, MeshIndex, SkinIndex, SlotIndex);
        }
    }
    SetAttachmentButtons(AttachmentKey, AttachmentFunctionKey);
}

function RelayFromCheatManager(Pawn P, KFGFxMenu_Gear.ECustomizationOption CustomizationOption, int MeshIndex, int SkinIndex, int AttachmentIndex, optional bool bIgnoreConflictingSlots)
{
    bIgnoreConflictingSlots = false;
    if(!bIgnoreConflictingSlots)
    {
        CurrentCharInfo.DetachConflictingAttachments(MeshIndex, KFPawn(P), MyKFPRI);
    }
    SelectCustomizationOption(P, CustomizationOption, MeshIndex, SkinIndex, AttachmentIndex);
    Manager.CachedProfile.SetCharacterGear(MyKFPRI.RepCustomizationInfo);
}

function ForceWeeklyCowboyHat()
{
    local PlayerController PC;
    local int CowboyHatIndex;
    local bool bIsWildWest;
    local KFGameReplicationInfo KFGRI;

    PC = Outer.GetPC();
    KFGRI = ((PC != none) ? KFGameReplicationInfo(PC.WorldInfo.GRI) : none);
    bIsWildWest = ((KFGRI != none) && KFGRI.bIsWeeklyMode) && KFGRI.CurrentWeeklyIndex == 12;
    if(bIsWildWest)
    {
        CowboyHatIndex = FindCowboyHatAttachmentIndex(CurrentCharInfo);
        if(CowboyHatIndex >= 0)
        {
            Callback_AttachmentNumbered(CowboyHatIndex, 0, 2);
        }
        SetBool("ThirdAttachmentBlocked", true);
    }
}

// Export UKFGFxMenu_Gear::execSelectCharacter(FFrame&, void* const)
private native final function SelectCharacter(Pawn P, byte CharacterIndex);

// Export UKFGFxMenu_Gear::execSelectCustomizationOption(FFrame&, void* const)
private native final function SelectCustomizationOption(Pawn P, KFGFxMenu_Gear.ECustomizationOption CustomizationOption, int MeshIndex, int SkinIndex, optional int AttachmentIndex);

// Export UKFGFxMenu_Gear::execFindCowboyHatAttachmentIndex(FFrame&, void* const)
native static function int FindCowboyHatAttachmentIndex(KFCharacterInfo_Human CharInfo);

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
    Attachment0String="ACCESSORY 1"
    Attachment1String="ACCESSORY 2"
    Attachment2String="ACCESSORY 3"
    SkinsString="SKINS"
    BackString="BACK"
    NoneString="NONE"
    ControllerRotationRate=15
    ControllerRotationThreshold=0.25
    CurrentPerkIndex=-1
    ClearImagePath="CHR_Shared_TEX.NoItem_Selection"
    SubWidgetBindings=/* Array type was not detected. */
}