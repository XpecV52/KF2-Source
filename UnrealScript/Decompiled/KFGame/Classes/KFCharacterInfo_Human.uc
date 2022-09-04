/*******************************************************************************
 * KFCharacterInfo_Human generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFCharacterInfo_Human extends KFCharacterInfoBase
    native(Pawn)
    hidecategories(Object)
    implements(KFUnlockableAsset);

const NUM_FAVE_WEAPS = 8;

enum ECosmeticType
{
    ECosmeticType_Head,
    ECosmeticType_Body,
    ECosmeticType_Attachment,
    ECosmeticType_Arms,
    ECosmeticType_MAX
};

struct native SkinVariant
{
    var() const int UnlockAssetID;
    /** The path to this skins package and texture */
    var() Texture UITexture;
    var MaterialInstance Skin;
    /** The material this outfit can use */
    var() string SkinName;
    var MaterialInstance Skin1p;
    /** The first person material of this outfit */
    var() string Skin1pName;

    structdefaultproperties
    {
        UnlockAssetID=0
        UITexture=none
        Skin=none
        SkinName=""
        Skin1p=none
        Skin1pName=""
    }
};

struct native OutfitVariants
{
    /** The path to this skins package and texture */
    var() Texture UITexture;
    var edithide transient SkeletalMesh Mesh;
    /** Outfit mesh name. Must be of form PackageName.MeshName */
    var() string MeshName;
    /** Reference to the different skin variants for a particular outfit mesh */
    var() array<SkinVariant> SkinVariations;

    structdefaultproperties
    {
        UITexture=none
        Mesh=none
        MeshName=""
        SkinVariations=none
    }
};

struct native AttachmentOverrideList
{
    /** List of booleans that will effect which items can be attached with the current attachment */
    var() bool bHat;
    /** List of booleans that will effect which items can be attached with the current attachment */
    var() bool bFace;
    /** List of booleans that will effect which items can be attached with the current attachment */
    var() bool bEyes;
    /** List of booleans that will effect which items can be attached with the current attachment */
    var() bool bJaw;
    /** List of booleans that will effect which items can be attached with the current attachment */
    var() bool bArmband;
    /** List of booleans that will effect which items can be attached with the current attachment */
    var() bool bBackpack;
    var array<byte> SpecialOverrideIds;

    structdefaultproperties
    {
        bHat=false
        bFace=false
        bEyes=false
        bJaw=false
        bArmband=false
        bBackpack=false
        SpecialOverrideIds=none
    }
};

struct native AttachmentVariants
{
    var() KFCharacterAttachment AttachmentItem;
    var() const int UnlockAssetID;
    var Texture UITexture;
    /** If set enables the material mask parameter on the assigned head variant */
    var() bool bMaskHeadMesh;
    var edithide transient StaticMesh MeshStatic;
    var edithide transient SkeletalMesh MeshSkeletal;
    /** Attachment mesh name. Must be of form PackageName.MeshName */
    var() string MeshName;
    var name SocketName;
    var edithide transient StaticMesh MeshStatic1p;
    var edithide transient SkeletalMesh MeshSkeletal1p;
    /** Mesh name for 1p attachmentt */
    var() string MeshName1p;
    /**  
     *Name of the socket that the 1p mesh attaches to. If bIsSkeletalAttachment is true, then the mesh will attach
     *           to the ParentAnimComponent.
     */
    var() name SocketName1p;
    /** Translation relative to given socket (for additional control) */
    var() Vector RelativeTranslation;
    /** Rotation relative to given socket (for additional control) */
    var() Rotator RelativeRotation;
    /** Scale relative to given socket (for additional control) */
    var() Vector RelativeScale;
    var float MaxDrawDistance;
    var int SkinMaterialID;
    var array<SkinVariant> SkinVariations;
    var AttachmentOverrideList OverrideList;
    var array<byte> SpecialOverrideIds;
    /** List of cosmetic indices that this attachment will detach, if they are currently attached to a player */
    var() array<KFCharacterAttachment> SpecialOverrideAttachments;

    structdefaultproperties
    {
        AttachmentItem=none
        UnlockAssetID=0
        UITexture=none
        bMaskHeadMesh=false
        MeshStatic=none
        MeshSkeletal=none
        MeshName=""
        SocketName=None
        MeshStatic1p=none
        MeshSkeletal1p=none
        MeshName1p=""
        SocketName1p=None
        RelativeTranslation=(X=0,Y=0,Z=0)
        RelativeRotation=(Pitch=0,Yaw=0,Roll=0)
        RelativeScale=(X=1,Y=1,Z=1)
        MaxDrawDistance=0
        SkinMaterialID=0
        SkinVariations=none
        OverrideList=(bHat=false,bFace=false,bEyes=false,bJaw=false,bArmband=false,bBackpack=false,SpecialOverrideIds=none)
        SpecialOverrideIds=none
        SpecialOverrideAttachments=none
    }
};

struct native FirstPersonArmVariants
{
    var edithide transient SkeletalMesh Mesh;
    /** Mesh name. Must be of form PackageName.MeshName */
    var() string MeshName;
    var init edithide array<init MaterialInstance> SkinVariants;
    /** Reference to the different skin variants for a particular arms mesh */
    var() array<string> SkinVariantsName;

    structdefaultproperties
    {
        Mesh=none
        MeshName=""
        SkinVariants=none
        SkinVariantsName=none
    }
};

var() const int UnlockAssetID;
/** Whether these are female characters */
var() bool bIsFemale;
/** The material ID for the skin in the mesh */
var(ThirdPerson) int HeadMaterialID;
var(ThirdPerson) int BodyMaterialID;
/** The package key for async loading purposes. Console only. */
var(ThirdPerson) string CosmeticsPackageKey;
/** The outfit variants for a character. Used for Character Customization */
var(ThirdPerson) const array<OutfitVariants> BodyVariants;
/** The head variants for a character. Used for Character Customization */
var(ThirdPerson) const array<OutfitVariants> HeadVariants;
/** Various cosmetic variants for a character. Used for Character Customization */
var(ThirdPerson) const array<AttachmentVariants> CosmeticVariants;
/** The outfit variants for a character. Used for Character Customization */
var(FirstPerson) array<FirstPersonArmVariants> CharacterArmVariants;
/** Package to load to find the arm mesh for this char. */
var(FirstPerson) string ArmMeshPackageName;
/** Name of mesh within ArmMeshPackageName to use for arms. */
var(FirstPerson) SkeletalMesh ArmMesh;
/** Package that contains team-skin materials for first-person arms. */
var(FirstPerson) string ArmSkinPackageName;
var(FaveWeapons) editconst name FavoriteWeaponClassNames[8];
var(FaveWeapons) editoronly class<KFWeaponDefinition> FavoriteWeaponClassDefs[8]<AllowAbstract=>;
var AnimSet EmoteAnimset;

function int GetAssetId()
{
    return UnlockAssetID;
}

function string GetMesh(const out AttachmentVariants Variant)
{
    if(Len(Variant.MeshName) > 0)
    {
        return Variant.MeshName;        
    }
    else
    {
        return Variant.AttachmentItem.MeshName;
    }
}

function string GetMeshByIndex(int Index)
{
    return GetMesh(CosmeticVariants[Index]);
}

function string Get1pMesh(const out AttachmentVariants Variant)
{
    if(Len(Variant.MeshName1p) > 0)
    {
        return Variant.MeshName1p;        
    }
    else
    {
        return Variant.AttachmentItem.MeshName1p;
    }
}

function string Get1pMeshByIndex(int Index)
{
    return Get1pMesh(CosmeticVariants[Index]);
}

function SkeletalMesh GetFirstPersonArms()
{
    if(ArmMesh == none)
    {
        WarnInternal("Unable to load first person arms");
    }
    return ArmMesh;
}

function int GetFavoriteWeaponIndexOf(Weapon W)
{
    local int I;

    I = 0;
    J0x0B:

    if(I < 8)
    {
        if(W.Class.Name == FavoriteWeaponClassNames[I])
        {
            return I;
        }
        ++ I;
        goto J0x0B;
    }
    return -1;
}

simulated function SetCharacterFromArch(KFPawn KFP, optional KFPlayerReplicationInfo KFPRI)
{
    super.SetCharacterFromArch(KFP, KFPRI);
    if(KFPRI == none)
    {
        WarnInternal("Does not have a KFPRI" @ string(self));
        return;
    }
    if(bIsFemale)
    {
        KFPRI.TTSSpeaker = byte(Rand(4));        
    }
    else
    {
        KFPRI.TTSSpeaker = byte(Rand(5) + 4);
    }
}

simulated function SetCharacterMeshFromArch(KFPawn KFP, optional KFPlayerReplicationInfo KFPRI)
{
    local int AttachmentIdx, CosmeticMeshIdx;
    local bool bMaskHeadMesh;

    super.SetCharacterMeshFromArch(KFP, KFPRI);
    if(KFPRI == none)
    {
        WarnInternal("Does not have a KFPRI" @ string(self));
        return;
    }
    SetBodyMeshAndSkin(byte(KFPRI.RepCustomizationInfo.BodyMeshIndex), byte(KFPRI.RepCustomizationInfo.BodySkinIndex), KFP, KFPRI);
    SetHeadMeshAndSkin(byte(KFPRI.RepCustomizationInfo.HeadMeshIndex), byte(KFPRI.RepCustomizationInfo.HeadSkinIndex), KFP, KFPRI);
    SetArmsMeshAndSkin(byte(KFPRI.RepCustomizationInfo.BodyMeshIndex), byte(KFPRI.RepCustomizationInfo.BodySkinIndex), KFP, KFPRI);
    if(KFP.WorldInfo.NetMode != NM_DedicatedServer)
    {
        AttachmentIdx = 0;
        J0x21B:

        if(AttachmentIdx < 3)
        {
            DetachAttachment(AttachmentIdx, KFP);
            ++ AttachmentIdx;
            goto J0x21B;
        }
        AttachmentIdx = 0;
        J0x260:

        if(AttachmentIdx < 3)
        {
            CosmeticMeshIdx = KFPRI.RepCustomizationInfo.AttachmentMeshIndices[AttachmentIdx];
            if((CosmeticMeshIdx != -1) && CosmeticMeshIdx != -1)
            {
                bMaskHeadMesh = bMaskHeadMesh || CosmeticVariants[CosmeticMeshIdx].bMaskHeadMesh;
                SetAttachmentMeshAndSkin(CosmeticMeshIdx, KFPRI.RepCustomizationInfo.AttachmentSkinIndices[AttachmentIdx], KFP, KFPRI);
            }
            ++ AttachmentIdx;
            goto J0x260;
        }
        InitCharacterMICs(KFP, bMaskHeadMesh);
    }
}

private final function InitCharacterMICs(KFPawn P, optional bool bMaskHead)
{
    local int I;

    if(P.WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    P.CharacterMICs.Remove(0, P.CharacterMICs.Length;
    if(P.Mesh != none)
    {
        P.CharacterMICs[0] = P.Mesh.CreateAndSetMaterialInstanceConstant(BodyMaterialID);
    }
    if(P.ThirdPersonHeadMeshComponent != none)
    {
        P.CharacterMICs[1] = P.ThirdPersonHeadMeshComponent.CreateAndSetMaterialInstanceConstant(HeadMaterialID);
        if(bMaskHead)
        {
            P.CharacterMICs[1].SetScalarParameterValue('Scalar_Mask', 1);
        }
    }
    I = 0;
    J0x1E1:

    if(I < 3)
    {
        if(P.ThirdPersonAttachments[I] != none)
        {
            P.CharacterMICs.AddItem(P.ThirdPersonAttachments[I].CreateAndSetMaterialInstanceConstant(0);
        }
        if(P.FirstPersonAttachments[I] != none)
        {
            P.CharacterMICs.AddItem(P.FirstPersonAttachments[I].CreateAndSetMaterialInstanceConstant(0);
        }
        ++ I;
        goto J0x1E1;
    }
}

private final function SetBodyMeshAndSkin(byte CurrentBodyMeshIndex, byte CurrentBodySkinIndex, KFPawn KFP, KFPlayerReplicationInfo KFPRI)
{
    local string CharBodyMeshName;
    local SkeletalMesh CharBodyMesh;

    if(KFP.WorldInfo.NetMode == NM_DedicatedServer)
    {
        CurrentBodyMeshIndex = 0;
        CurrentBodySkinIndex = 0;
    }
    if(BodyVariants.Length > 0)
    {
        CurrentBodyMeshIndex = ((CurrentBodyMeshIndex < BodyVariants.Length) ? CurrentBodyMeshIndex : 0);
        if(KFPRI.StartLoadCosmeticContent(self, 1, CurrentBodyMeshIndex))
        {
            return;
        }
        CharBodyMeshName = BodyVariants[CurrentBodyMeshIndex].MeshName;
        CharBodyMesh = SkeletalMesh(DynamicLoadObject(CharBodyMeshName, Class'SkeletalMesh'));
        if(CharBodyMesh != KFP.Mesh.SkeletalMesh)
        {
            KFP.Mesh.SetSkeletalMesh(CharBodyMesh);
            KFP.OnCharacterMeshChanged();
        }
        if(KFP.WorldInfo.NetMode != NM_DedicatedServer)
        {
            SetBodySkinMaterial(BodyVariants[CurrentBodyMeshIndex], CurrentBodySkinIndex, KFP);
        }        
    }
    else
    {
        WarnInternal("Character does not have a valid mesh");
    }
}

protected simulated function SetBodySkinMaterial(OutfitVariants CurrentVariant, byte NewSkinIndex, KFPawn KFP)
{
    local int I;

    if(KFP.WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(CurrentVariant.SkinVariations.Length > 0)
        {
            NewSkinIndex = ((NewSkinIndex < CurrentVariant.SkinVariations.Length) ? NewSkinIndex : 0);
            KFP.Mesh.SetMaterial(BodyMaterialID, CurrentVariant.SkinVariations[NewSkinIndex].Skin);            
        }
        else
        {
            I = 0;
            J0x12B:

            if(I < KFP.Mesh.GetNumElements())
            {
                KFP.Mesh.SetMaterial(I, none);
                ++ I;
                goto J0x12B;
            }
        }
    }
}

protected simulated function SetHeadSkinMaterial(OutfitVariants CurrentVariant, byte NewSkinIndex, KFPawn KFP)
{
    local int I;

    if(KFP.WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(CurrentVariant.SkinVariations.Length > 0)
        {
            NewSkinIndex = ((NewSkinIndex < CurrentVariant.SkinVariations.Length) ? NewSkinIndex : 0);
            KFP.ThirdPersonHeadMeshComponent.SetMaterial(HeadMaterialID, CurrentVariant.SkinVariations[NewSkinIndex].Skin);            
        }
        else
        {
            I = 0;
            J0x12B:

            if(I < KFP.ThirdPersonHeadMeshComponent.GetNumElements())
            {
                KFP.ThirdPersonHeadMeshComponent.SetMaterial(I, none);
                ++ I;
                goto J0x12B;
            }
        }
    }
}

private final function SetHeadMeshAndSkin(byte CurrentHeadMeshIndex, byte CurrentHeadSkinIndex, KFPawn KFP, KFPlayerReplicationInfo KFPRI)
{
    local string CharHeadMeshName;
    local SkeletalMesh CharHeadMesh;

    if(HeadVariants.Length > 0)
    {
        CurrentHeadMeshIndex = ((CurrentHeadMeshIndex < HeadVariants.Length) ? CurrentHeadMeshIndex : 0);
        if(KFPRI.StartLoadCosmeticContent(self, 0, CurrentHeadMeshIndex))
        {
            return;
        }
        CharHeadMeshName = HeadVariants[CurrentHeadMeshIndex].MeshName;
        CharHeadMesh = SkeletalMesh(DynamicLoadObject(CharHeadMeshName, Class'SkeletalMesh'));
        KFP.ThirdPersonHeadMeshComponent.SetSkeletalMesh(CharHeadMesh);
        KFP.ThirdPersonHeadMeshComponent.SetScale(DefaultMeshScale);
        KFP.ThirdPersonHeadMeshComponent.SetParentAnimComponent(KFP.Mesh);
        KFP.ThirdPersonHeadMeshComponent.SetShadowParent(KFP.Mesh);
        KFP.ThirdPersonHeadMeshComponent.SetLODParent(KFP.Mesh);
        KFP.AttachComponent(KFP.ThirdPersonHeadMeshComponent);
        if(KFP.WorldInfo.NetMode != NM_DedicatedServer)
        {
            SetHeadSkinMaterial(HeadVariants[CurrentHeadMeshIndex], CurrentHeadSkinIndex, KFP);
        }
    }
}

function bool IsAttachmentAvailable(const out AttachmentVariants Attachment, Pawn PreviewPawn)
{
    if(!Class'KFUnlockManager'.static.GetAvailableAttachment(Attachment))
    {
        return false;        
    }
    else
    {
        if((Attachment.AttachmentItem.SocketName != 'None') && PreviewPawn.Mesh.GetSocketByName(Attachment.AttachmentItem.SocketName) == none)
        {
            LogInternal(("Attachment" @ Attachment.MeshName) @ "is missing a required socket.");
            return false;
        }
    }
    return true;
}

// Export UKFCharacterInfo_Human::execSetFirstPersonCosmeticAttachment(FFrame&, void* const)
native function SetFirstPersonCosmeticAttachment(SkeletalMeshComponent SkeletalComponent);

protected simulated function SetAttachmentMesh(int CurrentAttachmentMeshIndex, int AttachmentSlotIndex, string CharAttachmentMeshName, name CharAttachmentSocketName, SkeletalMeshComponent PawnMesh, KFPawn KFP, optional bool bIsFirstPerson)
{
    local editinline StaticMeshComponent StaticAttachment;
    local editinline SkeletalMeshComponent SkeletalAttachment;
    local bool bIsSkeletalAttachment;
    local StaticMesh CharAttachmentStaticMesh;
    local SkeletalMesh CharacterAttachmentSkelMesh;
    local float MaxDrawDistance;
    local SkeletalMeshSocket AttachmentSocket;
    local Vector AttachmentLocationRelativeToSocket, AttachmentScaleRelativeToSocket;
    local Rotator AttachmentRotationRelativeToSocket;

    bIsFirstPerson = false;
    MaxDrawDistance = CosmeticVariants[CurrentAttachmentMeshIndex].AttachmentItem.MaxDrawDistance;
    AttachmentLocationRelativeToSocket = CosmeticVariants[CurrentAttachmentMeshIndex].RelativeTranslation;
    AttachmentRotationRelativeToSocket = CosmeticVariants[CurrentAttachmentMeshIndex].RelativeRotation;
    AttachmentScaleRelativeToSocket = CosmeticVariants[CurrentAttachmentMeshIndex].RelativeScale;
    bIsSkeletalAttachment = CosmeticVariants[CurrentAttachmentMeshIndex].AttachmentItem.bIsSkeletalAttachment;
    if(bIsSkeletalAttachment)
    {
        if(bIsFirstPerson && SkeletalMeshComponent(KFP.FirstPersonAttachments[AttachmentSlotIndex]) != none)
        {
            SkeletalAttachment = SkeletalMeshComponent(KFP.FirstPersonAttachments[AttachmentSlotIndex]);            
        }
        else
        {
            if(!bIsFirstPerson && SkeletalMeshComponent(KFP.ThirdPersonAttachments[AttachmentSlotIndex]) != none)
            {
                SkeletalAttachment = SkeletalMeshComponent(KFP.ThirdPersonAttachments[AttachmentSlotIndex]);                
            }
            else
            {
                SkeletalAttachment = new (KFP) Class'KFSkeletalMeshComponent';
                if(bIsFirstPerson)
                {
                    SetFirstPersonCosmeticAttachment(SkeletalAttachment);
                }
                SkeletalAttachment.SetActorCollision(false, false);
                if(bIsFirstPerson)
                {
                    KFP.FirstPersonAttachments[AttachmentSlotIndex] = SkeletalAttachment;                    
                }
                else
                {
                    KFP.ThirdPersonAttachments[AttachmentSlotIndex] = SkeletalAttachment;
                }
            }
        }
        CharacterAttachmentSkelMesh = SkeletalMesh(DynamicLoadObject(CharAttachmentMeshName, Class'SkeletalMesh'));
        SkeletalAttachment.SetSkeletalMesh(CharacterAttachmentSkelMesh);
        SkeletalAttachment.SetParentAnimComponent(PawnMesh);
        SkeletalAttachment.SetLODParent(PawnMesh);
        SkeletalAttachment.SetScale(DefaultMeshScale);
        SkeletalAttachment.SetCullDistance(MaxDrawDistance);
        SkeletalAttachment.SetShadowParent(PawnMesh);
        SkeletalAttachment.SetLightingChannels(KFP.PawnLightingChannel);
        KFP.AttachComponent(SkeletalAttachment);        
    }
    else
    {
        if(!bIsFirstPerson && StaticMeshComponent(KFP.ThirdPersonAttachments[AttachmentSlotIndex]) != none)
        {
            StaticAttachment = StaticMeshComponent(KFP.ThirdPersonAttachments[AttachmentSlotIndex]);            
        }
        else
        {
            if(bIsFirstPerson && StaticMeshComponent(KFP.FirstPersonAttachments[AttachmentSlotIndex]) != none)
            {
                StaticAttachment = StaticMeshComponent(KFP.FirstPersonAttachments[AttachmentSlotIndex]);                
            }
            else
            {
                StaticAttachment = new (KFP) Class'StaticMeshComponent';
                StaticAttachment.SetActorCollision(false, false);
                if(bIsFirstPerson)
                {
                    KFP.FirstPersonAttachments[AttachmentSlotIndex] = StaticAttachment;                    
                }
                else
                {
                    KFP.ThirdPersonAttachments[AttachmentSlotIndex] = StaticAttachment;
                }
            }
        }
        CharAttachmentStaticMesh = StaticMesh(DynamicLoadObject(CharAttachmentMeshName, Class'StaticMesh'));
        StaticAttachment.SetStaticMesh(CharAttachmentStaticMesh);
        StaticAttachment.SetScale(DefaultMeshScale);
        StaticAttachment.SetCullDistance(MaxDrawDistance);
        StaticAttachment.SetShadowParent(KFP.Mesh);
        StaticAttachment.SetLightingChannels(KFP.PawnLightingChannel);
        AttachmentSocket = PawnMesh.GetSocketByName(CharAttachmentSocketName);
        PawnMesh.AttachComponent(StaticAttachment, AttachmentSocket.BoneName, AttachmentSocket.RelativeLocation + AttachmentLocationRelativeToSocket, AttachmentSocket.RelativeRotation + AttachmentRotationRelativeToSocket, AttachmentSocket.RelativeScale * AttachmentScaleRelativeToSocket);
    }
    if(bIsFirstPerson)
    {
        KFP.FirstPersonAttachmentSocketNames[AttachmentSlotIndex] = CharAttachmentSocketName;        
    }
    else
    {
        KFP.ThirdPersonAttachmentSocketNames[AttachmentSlotIndex] = CharAttachmentSocketName;
    }
}

protected simulated function SetAttachmentSkinMaterial(int PawnAttachmentIndex, const out AttachmentVariants CurrentVariant, byte NewSkinIndex, KFPawn KFP, optional bool bIsFirstPerson)
{
    local int I;

    if(KFP.WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(CurrentVariant.AttachmentItem.SkinVariations.Length > 0)
        {
            if(NewSkinIndex < CurrentVariant.AttachmentItem.SkinVariations.Length)
            {
                if(bIsFirstPerson)
                {
                    if(KFP.FirstPersonAttachments[PawnAttachmentIndex] != none)
                    {
                        KFP.FirstPersonAttachments[PawnAttachmentIndex].SetMaterial(CurrentVariant.AttachmentItem.SkinMaterialID, CurrentVariant.AttachmentItem.SkinVariations[NewSkinIndex].Skin1p);
                    }                    
                }
                else
                {
                    KFP.ThirdPersonAttachments[PawnAttachmentIndex].SetMaterial(CurrentVariant.AttachmentItem.SkinMaterialID, CurrentVariant.AttachmentItem.SkinVariations[NewSkinIndex].Skin);
                }                
            }
            else
            {
                LogInternal("Out of bounds skin index for" @ CurrentVariant.MeshName);
                RemoveAttachmentMeshAndSkin(PawnAttachmentIndex, KFP);
            }            
        }
        else
        {
            if(bIsFirstPerson)
            {
                if(KFP.FirstPersonAttachments[PawnAttachmentIndex] != none)
                {
                    I = 0;
                    J0x31D:

                    if(I < KFP.FirstPersonAttachments[PawnAttachmentIndex].GetNumElements())
                    {
                        KFP.FirstPersonAttachments[PawnAttachmentIndex].SetMaterial(I, none);
                        ++ I;
                        goto J0x31D;
                    }
                }                
            }
            else
            {
                I = 0;
                J0x3CD:

                if(I < KFP.ThirdPersonAttachments[PawnAttachmentIndex].GetNumElements())
                {
                    KFP.ThirdPersonAttachments[PawnAttachmentIndex].SetMaterial(I, none);
                    ++ I;
                    goto J0x3CD;
                }
            }
        }
    }
}

private final function SetAttachmentMeshAndSkin(int CurrentAttachmentMeshIndex, int CurrentAttachmentSkinIndex, KFPawn KFP, KFPlayerReplicationInfo KFPRI, optional bool bIsFirstPerson)
{
    local string CharAttachmentMeshName;
    local name CharAttachmentSocketName;
    local int AttachmentSlotIndex;
    local editinline SkeletalMeshComponent AttachmentMesh;

    if(KFP.WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    AttachmentSlotIndex = GetAttachmentSlotIndex(CurrentAttachmentMeshIndex, KFP, KFPRI);
    if(AttachmentSlotIndex == -1)
    {
        return;
    }
    if((CosmeticVariants.Length > 0) && CurrentAttachmentMeshIndex < CosmeticVariants.Length)
    {
        if(KFPRI.StartLoadCosmeticContent(self, 2, CurrentAttachmentMeshIndex))
        {
            return;
        }
        CharAttachmentMeshName = ((bIsFirstPerson) ? Get1pMeshByIndex(CurrentAttachmentMeshIndex) : GetMeshByIndex(CurrentAttachmentMeshIndex));
        CharAttachmentSocketName = ((bIsFirstPerson) ? CosmeticVariants[CurrentAttachmentMeshIndex].AttachmentItem.SocketName1p : CosmeticVariants[CurrentAttachmentMeshIndex].AttachmentItem.SocketName);
        AttachmentMesh = ((bIsFirstPerson) ? KFP.ArmsMesh : KFP.Mesh);
        if(KFP.IsLocallyControlled())
        {
            if((CharAttachmentSocketName != 'None') && KFP.Mesh.GetSocketByName(CharAttachmentSocketName) == none)
            {
                RemoveAttachmentMeshAndSkin(AttachmentSlotIndex, KFP, KFPRI);
                return;
            }
        }
        if(CharAttachmentMeshName != "")
        {
            SetAttachmentMesh(CurrentAttachmentMeshIndex, AttachmentSlotIndex, CharAttachmentMeshName, CharAttachmentSocketName, AttachmentMesh, KFP, bIsFirstPerson);            
        }
        else
        {
            if(bIsFirstPerson)
            {
                KFP.FirstPersonAttachments[AttachmentSlotIndex] = none;
                KFP.FirstPersonAttachmentSocketNames[AttachmentSlotIndex] = 'None';
            }
        }
        SetAttachmentSkinMaterial(AttachmentSlotIndex, CosmeticVariants[CurrentAttachmentMeshIndex], byte(CurrentAttachmentSkinIndex), KFP, bIsFirstPerson);
    }
    if(CurrentAttachmentMeshIndex == -1)
    {
        RemoveAttachmentMeshAndSkin(AttachmentSlotIndex, KFP, KFPRI);
    }
}

function DetachConflictingAttachments(int NewAttachmentMeshIndex, KFPawn KFP, optional KFPlayerReplicationInfo KFPRI)
{
    local name NewAttachmentSocketName;
    local int I, CurrentAttachmentIdx;

    if(((CosmeticVariants.Length > 0) && NewAttachmentMeshIndex < CosmeticVariants.Length) && NewAttachmentMeshIndex != -1)
    {
        NewAttachmentSocketName = CosmeticVariants[NewAttachmentMeshIndex].AttachmentItem.SocketName;
        I = 0;
        J0x90:

        if(I < 3)
        {
            CurrentAttachmentIdx = KFPRI.RepCustomizationInfo.AttachmentMeshIndices[I];
            if(CurrentAttachmentIdx == -1)
            {                
            }
            else
            {
                if((KFP.ThirdPersonAttachmentSocketNames[I] != 'None') && KFP.ThirdPersonAttachmentSocketNames[I] == NewAttachmentSocketName)
                {
                    RemoveAttachmentMeshAndSkin(I, KFP, KFPRI);                    
                }
                else
                {
                    if(GetOverrideCase(CurrentAttachmentIdx, NewAttachmentMeshIndex))
                    {
                        RemoveAttachmentMeshAndSkin(I, KFP, KFPRI);                        
                    }
                    else
                    {
                        if(GetOverrideCase(NewAttachmentMeshIndex, CurrentAttachmentIdx))
                        {
                            RemoveAttachmentMeshAndSkin(I, KFP, KFPRI);                            
                        }
                    }
                }
            }
            ++ I;
            goto J0x90;
        }
    }
}

function bool GetOverrideCase(int AttachmentIndex1, int AttachmentIndex2)
{
    local KFCharacterAttachment Attachment1;

    if((AttachmentIndex1 == -1) || AttachmentIndex2 == -1)
    {
        return false;
    }
    if((AttachmentIndex1 >= CosmeticVariants.Length) || AttachmentIndex2 >= CosmeticVariants.Length)
    {
        return false;
    }
    Attachment1 = CosmeticVariants[AttachmentIndex1].AttachmentItem;
    if(CosmeticVariants[AttachmentIndex2].SpecialOverrideAttachments.Length > 0)
    {
        if(CosmeticVariants[AttachmentIndex2].SpecialOverrideAttachments.Find(Attachment1 != -1)
        {
            return true;
        }        
    }
    else
    {
        if(CosmeticVariants[AttachmentIndex2].AttachmentItem.DefaultSpecialOverrideAttachments.Find(Attachment1 != -1)
        {
            return true;
        }
    }
    switch(CosmeticVariants[AttachmentIndex1].AttachmentItem.SocketName)
    {
        case 'Hat_Attach':
            return CosmeticVariants[AttachmentIndex2].AttachmentItem.OverrideList.bHat;
        case 'Face_Attach':
            return CosmeticVariants[AttachmentIndex2].AttachmentItem.OverrideList.bFace;
        case 'Eyes_Attach':
            return CosmeticVariants[AttachmentIndex2].AttachmentItem.OverrideList.bEyes;
        case 'Jaw_Attach':
            return CosmeticVariants[AttachmentIndex2].AttachmentItem.OverrideList.bJaw;
        case 'Armband_Attach':
            return CosmeticVariants[AttachmentIndex2].AttachmentItem.OverrideList.bArmband;
        case 'Backpack_Attach':
            return CosmeticVariants[AttachmentIndex2].AttachmentItem.OverrideList.bBackpack;
        default:
            return false;
            break;
    }
}

function int GetAttachmentSlotIndex(int CurrentAttachmentMeshIndex, KFPawn KFP, KFPlayerReplicationInfo KFPRI)
{
    local int AttachmentIdx;

    if(KFPRI == none)
    {
        WarnInternal("GetAttachmentSlotIndex - NO KFPRI");
        return -1;
    }
    AttachmentIdx = 0;
    J0x45:

    if(AttachmentIdx < 3)
    {
        if((KFPRI.RepCustomizationInfo.AttachmentMeshIndices[AttachmentIdx] == -1) || KFPRI.RepCustomizationInfo.AttachmentMeshIndices[AttachmentIdx] == CurrentAttachmentMeshIndex)
        {
            return AttachmentIdx;
        }
        ++ AttachmentIdx;
        goto J0x45;
    }
    return -1;
}

simulated function RemoveAttachmentMeshAndSkin(int PawnAttachmentIndex, KFPawn KFP, optional KFPlayerReplicationInfo KFPRI)
{
    DetachAttachment(PawnAttachmentIndex, KFP);
    if(KFPRI != none)
    {
        KFPRI.ClearCharacterAttachment(PawnAttachmentIndex);
    }
}

function DetachAttachment(int PawnAttachmentIndex, KFPawn KFP)
{
    if(KFP.ThirdPersonAttachments[PawnAttachmentIndex] != none)
    {
        if(SkeletalMeshComponent(KFP.ThirdPersonAttachments[PawnAttachmentIndex]) != none)
        {
            KFP.DetachComponent(KFP.ThirdPersonAttachments[PawnAttachmentIndex]);
            if(KFP.FirstPersonAttachments[PawnAttachmentIndex] != none)
            {
                KFP.DetachComponent(KFP.FirstPersonAttachments[PawnAttachmentIndex]);
            }            
        }
        else
        {
            KFP.Mesh.DetachComponent(KFP.ThirdPersonAttachments[PawnAttachmentIndex]);
            if(KFP.FirstPersonAttachments[PawnAttachmentIndex] != none)
            {
                KFP.ArmsMesh.DetachComponent(KFP.FirstPersonAttachments[PawnAttachmentIndex]);
            }
        }
    }
    KFP.ThirdPersonAttachmentSocketNames[PawnAttachmentIndex] = 'None';
    KFP.FirstPersonAttachmentSocketNames[PawnAttachmentIndex] = 'None';
}

simulated function SetFirstPersonArmsFromArch(KFPawn KFP, optional KFPlayerReplicationInfo KFPRI)
{
    local int CosmeticMeshIdx, AttachmentIdx;

    if(KFPRI == none)
    {
        WarnInternal("Does not have a KFPRI" @ string(self));
        return;
    }
    SetArmsMeshAndSkin(byte(KFPRI.RepCustomizationInfo.BodyMeshIndex), byte(KFPRI.RepCustomizationInfo.BodySkinIndex), KFP, KFPRI);
    AttachmentIdx = 0;
    J0xBD:

    if(AttachmentIdx < 3)
    {
        CosmeticMeshIdx = KFPRI.RepCustomizationInfo.AttachmentMeshIndices[AttachmentIdx];
        if((CosmeticMeshIdx != -1) && CosmeticMeshIdx != -1)
        {
            LogInternal("Attach 1p mesh" @ string(CosmeticMeshIdx));
            SetAttachmentMeshAndSkin(CosmeticMeshIdx, KFPRI.RepCustomizationInfo.AttachmentSkinIndices[AttachmentIdx], KFP, KFPRI, true);
        }
        ++ AttachmentIdx;
        goto J0xBD;
    }
}

simulated function SetArmsMeshAndSkin(byte ArmsMeshIndex, byte ArmsSkinIndex, KFPawn KFP, KFPlayerReplicationInfo KFPRI)
{
    local byte CurrentArmMeshIndex, CurrentArmSkinIndex;
    local string CharArmMeshName;
    local SkeletalMesh CharArmMesh;

    if(((KFP.WorldInfo.NetMode != NM_DedicatedServer) && KFP.IsHumanControlled()) && KFP.IsLocallyControlled())
    {
        if(CharacterArmVariants.Length > 0)
        {
            CurrentArmMeshIndex = ((ArmsMeshIndex < CharacterArmVariants.Length) ? ArmsMeshIndex : 0);
            if(KFPRI.StartLoadCosmeticContent(self, 3, CurrentArmMeshIndex))
            {
                return;
            }
            CharArmMeshName = CharacterArmVariants[CurrentArmMeshIndex].MeshName;
            CharArmMesh = SkeletalMesh(DynamicLoadObject(CharArmMeshName, Class'SkeletalMesh'));
            KFP.ArmsMesh.SetSkeletalMesh(CharArmMesh);
            if(CharacterArmVariants[CurrentArmMeshIndex].SkinVariants.Length > 0)
            {
                CurrentArmSkinIndex = ((ArmsSkinIndex < CharacterArmVariants[CurrentArmMeshIndex].SkinVariants.Length) ? ArmsSkinIndex : 0);
                KFP.ArmsMesh.SetMaterial(0, CharacterArmVariants[CurrentArmMeshIndex].SkinVariants[CurrentArmSkinIndex]);                
            }
            else
            {
                KFP.ArmsMesh.SetMaterial(0, none);
            }            
        }
        else
        {
            if(ArmMesh != none)
            {
                KFP.ArmsMesh.SetMaterial(0, none);
                KFP.ArmsMesh.SetSkeletalMesh(ArmMesh);                
            }
            else
            {
                WarnInternal("Character does not have a valid arms mesh");
            }
        }
    }
}

static function int GetWeaponAnimSetIdx()
{
    return ((default.EmoteAnimset != none) ? default.AnimSets.Length + 1 : default.AnimSets.Length);
}

simulated function SetCharacterAnimFromArch(KFPawn Pawn)
{
    super.SetCharacterAnimFromArch(Pawn);
    if(EmoteAnimset != none)
    {
        Pawn.Mesh.AnimSets.AddItem(EmoteAnimset;
    }
}

defaultproperties
{
    EmoteAnimset=AnimSet'ECON_emote.ECON_Emotes'
    SoundGroupArch=KFPawnSoundGroup'FX_Pawn_Sounds_ARCH.HumanPawnSounds'
}