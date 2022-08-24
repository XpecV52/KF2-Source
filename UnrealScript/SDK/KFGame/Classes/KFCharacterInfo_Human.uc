//=============================================================================
// KFCharacterInfo_Human
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 3/19/2014
//=============================================================================

class KFCharacterInfo_Human extends KFCharacterInfoBase
	native(Pawn)
	implements(KFUnlockableAsset)
	hidecategories(Object);

/************************************************************************/
/*  Identification													    */
/************************************************************************/

var() const int UnlockAssetID;

/** Whether these are female characters */
var() bool bIsFemale;

/************************************************************************/
/*  3P Mesh Info							                            */
/************************************************************************/

/** The material ID for the skin in the mesh */
var(ThirdPerson) int HeadMaterialID;
var(ThirdPerson) int BodyMaterialID;

struct native SkinVariant
{
	var() const int UnlockAssetID;
	/** The path to this skins package and texture */
	var() Texture UITexture;
	/** The material this outfit can use */
 	var() MaterialInstance Skin;
};

struct native OutfitVariants
{
	//var() const int UnlockAssetID;
	/** The path to this skins package and texture */
	var() Texture UITexture;
	/** Outfit mesh name. Must be of form PackageName.MeshName */
	var() string MeshName;
	/** Reference to the different skin variants for a particular outfit mesh */
	var() array<SkinVariant> SkinVariations;
};

/** List of booleans that will effect which items can be attached with the current attachment */
struct native AttachmentOverrideList
{
	var() bool bHat;
	var() bool bFace;
	var() bool bEyes;
	var() bool bJaw;
	var() bool bArmband;
	var() bool bBackpack;

	/** List of cosmetic indices that this attachment will detach, if they are currently attached to a player */
	var array<byte> SpecialOverrideIds;
};

struct native AttachmentVariants
{
	var() KFCharacterAttachment AttachmentItem;

	var() const int UnlockAssetID;
	/** The path to this skins package and texture */
	var Texture UITexture;
	/** Whether the attachment is a skeletal mesh. Otherwise, it is treated as a static mesh attachment.
		Skeletal meshe animations are parented with the body mesh and must share the same skeletaon. */
	var bool bIsSkeletalAttachment;
	/** If set enables the material mask parameter on the assigned head variant */
	var() bool bMaskHeadMesh;
	/** Attachment mesh name. Must be of form PackageName.MeshName */
	var() string MeshName;
	/** Name of the socket that it attaches to. The socket MUST exist in the body mesh for static mesh
		attachments to work. SocketName is also used to resolve conflicts - when more than one attachment
		tries to attach to the same socket, it will replace the previously existing attachment. It will keep
		both if there is no conflict. NOTE: Skeletal meshes do not require sockets for attachment, but the socket name
		can still be used for conflit resolution. */
	var name SocketName;
	/** Translation relative to given socket (for additional control) */
	var() vector RelativeTranslation;
	/** Rotation relative to given socket (for additional control) */
	var() rotator RelativeRotation;
	/** Scale relative to given socket (for additional control) */
	var() vector RelativeScale;
	/** Distance at which the attachment will be hidden (distance culled). If 0, it is never culled */
	var float MaxDrawDistance;
	/** Material ID used for skin variations for this attachment (default is 0) */
	var int SkinMaterialID;
	/** Reference to the different skin variants for a particular attachment mesh */
	var array<SkinVariant> SkinVariations;
	/** List of sockets that this attachment will detach, if they are currently attached to a player */
	var AttachmentOverrideList OverrideList;

	/** List of cosmetic indices that this attachment will detach, if they are currently attached to a player */
	var array<byte> SpecialOverrideIds;

	var() array<KFCharacterAttachment> SpecialOverrideAttachments;

	structdefaultproperties
	{
		RelativeScale=(X=1.f,Y=1.f,Z=1.f)
	}
};

/**
	Whether to enable Character Customization. If TRUE, it uses the settings below
	to assemble the character, otherwise it uses the CharacterMesh
*/
/** The outfit variants for a character. Used for Character Customization */
var(ThirdPerson) const array<OutfitVariants> BodyVariants;
/** The head variants for a character. Used for Character Customization */
var(ThirdPerson) const array<OutfitVariants> HeadVariants;
/** Various cosmetic variants for a character. Used for Character Customization */
var(ThirdPerson) const array<AttachmentVariants> CosmeticVariants;

/************************************************************************/
/*  1P Character Info                                                   */
/************************************************************************/

struct native FirstPersonArmVariants
{
	/** Mesh name. Must be of form PackageName.MeshName */
	var() string MeshName;
	/**	Reference to the different skin variants for a particular arms mesh */
 	var() array<MaterialInstance> SkinVariants;
};

/** The outfit variants for a character. Used for Character Customization */
var(FirstPerson) array<FirstPersonArmVariants> CharacterArmVariants;

/** Package to load to find the arm mesh for this char. */
var(FirstPerson) string	ArmMeshPackageName;

/** Name of mesh within ArmMeshPackageName to use for arms. */
var(FirstPerson) SkeletalMesh	ArmMesh;

/** Package that contains team-skin materials for first-person arms. */
var(FirstPerson) string			ArmSkinPackageName;

/************************************************************************/
/*  Favorite Weapons (for dialog)                                       */
/************************************************************************/

// make sure this matches NUM_FAVE_WEAPS in KFDialogManager
const NUM_FAVE_WEAPS = 8;
var(FaveWeapons) editconst name FavoriteWeaponClassNames[NUM_FAVE_WEAPS];
var(FaveWeapons) editoronly class<KFWeaponDefinition> FavoriteWeaponClassDefs[NUM_FAVE_WEAPS]<AllowAbstract>;

/************************************************************************/
/*  Emote AnimSets                             					        */
/************************************************************************/
var Animset EmoteAnimset;


/************************************************************************/
/*  Native Functions												    */
/************************************************************************/

cpptext
{
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

	// set FavoriteWeaponClassNames from FavoriteWeaponClassDefs
	void SetFavoriteWeaponClassNames();
}

/************************************************************************/
/*  Script Functions												    */
/************************************************************************/

/** Implements KFUnlockableAsset */
function int GetAssetId()
{
	return UnlockAssetID;
}

function string GetMesh(const out AttachmentVariants Variant)
{
	if (Len(Variant.MeshName) > 0)
	{
		return Variant.MeshName;
	}
	else
	{
		return Variant.AttachmentItem.MeshName;
	}
}

function string GetMeshByIndex(int index)
{
	return GetMesh(CosmeticVariants[index]);
}

/** Return the 1P arm skeletal mesh representation for the class */
function SkeletalMesh GetFirstPersonArms()
{
	if (ArmMesh == None)
	{
		`warn("Unable to load first person arms");
	}

	return ArmMesh;
}

/** Return the texture portrait stored for this character */
/*function Texture GetCharPortrait(int TeamNum)
{
	return (TeamNum < DefaultTeamHeadPortrait.length) ? DefaultTeamHeadPortrait[TeamNum] : DefaultHeadPortrait;
}*/

function int GetFavoriteWeaponIndexOf( Weapon W )
{
	local int i;

    for( i = 0; i < NUM_FAVE_WEAPS; ++i )
    {
       if( W.Class.Name == FavoriteWeaponClassNames[i] )
       {
           return i;
       }
    }

    return -1;
}

/** Sets misc. properties from the character info */
simulated function SetCharacterFromArch( KFPawn KFP, optional KFPlayerReplicationInfo KFPRI )
{
   	super.SetCharacterFromArch( KFP, KFPRI );

	if ( KFPRI == none )
	{
        `Warn("Does not have a KFPRI" @ Self);
	 	return;
	}

   	// a little hacky, relies on presumption that enum vals 0-3 are male, 4-8 are female
	if ( bIsFemale )
	{
		KFPRI.TTSSpeaker = ETTSSpeaker(Rand(4));
	}
	else
	{
		KFPRI.TTSSpeaker = ETTSSpeaker(Rand(5) + 4);
	}
}

/** Sets the pawns character mesh from it's CharacterInfo, and updates instance of player in map if there is one. */
simulated function SetCharacterMeshFromArch( KFPawn KFP, optional KFPlayerReplicationInfo KFPRI )
{
	local int AttachmentIdx, CosmeticMeshIdx;
	local bool bMaskHeadMesh;

   	super.SetCharacterMeshFromArch( KFP, KFPRI );

   	if ( KFPRI == none )
	{
        `Warn("Does not have a KFPRI" @ Self);
	 	return;
	}

	// Body mesh & skin. Index of 255 implies use index 0 (default).
    SetBodyMeshAndSkin(
    	KFPRI.RepCustomizationInfo.BodyMeshIndex,
    	KFPRI.RepCustomizationInfo.BodySkinIndex,
    	KFP);

    // Head mesh & skin. Index of 255 implies use index 0 (default).
	SetHeadMeshAndSkin(
		KFPRI.RepCustomizationInfo.HeadMeshIndex,
		KFPRI.RepCustomizationInfo.HeadSkinIndex,
		KFP);

	// skip dedicated for purely cosmetic stuff
	if ( KFP.WorldInfo.NetMode != NM_DedicatedServer )
	{
		// Must clear all attachments before trying to attach new ones,
		// otherwise we might accidentally remove things we're not supposed to
		for( AttachmentIdx=0; AttachmentIdx < `MAX_COSMETIC_ATTACHMENTS; AttachmentIdx++ )
		{
			// Clear any previous attachments from other characters
			DetachAttachment(AttachmentIdx, KFP);
		}

		// Cosmetic attachment mesh & skin. Index of 255 implies don't use any attachments (default)
		for( AttachmentIdx=0; AttachmentIdx < `MAX_COSMETIC_ATTACHMENTS; AttachmentIdx++ )
		{
				CosmeticMeshIdx = KFPRI.RepCustomizationInfo.AttachmentMeshIndices[AttachmentIdx];
				if ( CosmeticMeshIdx != `CLEARED_ATTACHMENT_INDEX && CosmeticMeshIdx != INDEX_NONE)
			{
					bMaskHeadMesh = bMaskHeadMesh || CosmeticVariants[CosmeticMeshIdx].bMaskHeadMesh;

					// Attach all saved attachments to the character
					SetAttachmentMeshAndSkin(
						CosmeticMeshIdx,
						KFPRI.RepCustomizationInfo.AttachmentSkinIndices[AttachmentIdx],
						KFP, KFPRI);
			}
		}

		InitCharacterMICs(KFP, bMaskHeadMesh);
	}
}

/** Create all the MICs we'll need for material params later */
private function InitCharacterMICs(KFPawn P, optional bool bMaskHead)
{
	local int i;

	if( P.WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	P.CharacterMICs.Remove(0, P.CharacterMICs.Length);

	// body MIC
	if ( P.Mesh != None )
	{
		P.CharacterMICs[0] = P.Mesh.CreateAndSetMaterialInstanceConstant(BodyMaterialID);
	}

	// head MIC
	if( P.ThirdPersonHeadMeshComponent != None )
	{
		P.CharacterMICs[1] = P.ThirdPersonHeadMeshComponent.CreateAndSetMaterialInstanceConstant(HeadMaterialID);

		if ( bMaskHead )
		{
			// initial mask for new head MIC (also see ResetHeadMaskParam())
			P.CharacterMICs[1].SetScalarParameterValue('Scalar_Mask', 1.f);
		}
	}

	// attachment MIC
	for( i=0; i < `MAX_COSMETIC_ATTACHMENTS; i++ )
	{
		if( P.ThirdPersonAttachments[i] != none )
		{
			P.CharacterMICs.AddItem(P.ThirdPersonAttachments[i].CreateAndSetMaterialInstanceConstant(0));
		}
	}
}

private function SetBodyMeshAndSkin(
	byte CurrentBodyMeshIndex,
	byte CurrentBodySkinIndex,
	KFPawn KFP )
{
	local string CharBodyMeshName;
	local SkeletalMesh CharBodyMesh;

    //Always use default body on servers
    if (KFP.WorldInfo.NetMode == NM_DedicatedServer)
    {
        CurrentBodyMeshIndex = 0;
        CurrentBodySkinIndex = 0;
    }

	// Character Mesh
	if( BodyVariants.length > 0 )
	{
		// Assign a skin to the body mesh as a material override
		CurrentBodyMeshIndex = (CurrentBodyMeshIndex < BodyVariants.length) ? CurrentBodyMeshIndex : 0;

		// Retrieve the name of the meshes to be used from the archetype
		CharBodyMeshName = BodyVariants[CurrentBodyMeshIndex].MeshName;

		// Load the meshes
		CharBodyMesh = SkeletalMesh(DynamicLoadObject(CharBodyMeshName, class'SkeletalMesh'));

		// Assign the body mesh to the pawn
		if ( CharBodyMesh != KFP.Mesh.SkeletalMesh )
		{
			KFP.Mesh.SetSkeletalMesh(CharBodyMesh);
			KFP.OnCharacterMeshChanged();
		}

		if (KFP.WorldInfo.NetMode != NM_DedicatedServer)
		{
			SetBodySkinMaterial(BodyVariants[CurrentBodyMeshIndex], CurrentBodySkinIndex, KFP);
		}
	}
	else
	{
		`warn("Character does not have a valid mesh");
	}
}

protected simulated function SetBodySkinMaterial(OutfitVariants CurrentVariant, byte NewSkinIndex, KFPawn KFP)
{
	local int i;
	if (KFP.WorldInfo.NetMode != NM_DedicatedServer)
	{
		if( CurrentVariant.SkinVariations.length > 0 )
		{
			// Assign a skin to the body mesh as a material override
			NewSkinIndex = (NewSkinIndex < CurrentVariant.SkinVariations.length) ? NewSkinIndex : 0;
			KFP.Mesh.SetMaterial(BodyMaterialID, CurrentVariant.SkinVariations[NewSkinIndex].Skin);
		}
		else
		{
			// Use material specified in the mesh asset
			for( i=0; i<KFP.Mesh.GetNumElements(); i++ )
			{
				KFP.Mesh.SetMaterial(i, none);
			}
		}
	}
}

protected simulated function SetHeadSkinMaterial(OutfitVariants CurrentVariant, byte NewSkinIndex, KFPawn KFP)
{
	local int i;
	if (KFP.WorldInfo.NetMode != NM_DedicatedServer)
	{
		if( CurrentVariant.SkinVariations.length > 0 )
		{
			// Assign a skin to the body mesh as a material override
			NewSkinIndex = (NewSkinIndex < CurrentVariant.SkinVariations.length) ? NewSkinIndex : 0;
			KFP.ThirdPersonHeadMeshComponent.SetMaterial(HeadMaterialID, CurrentVariant.SkinVariations[NewSkinIndex].Skin);
		}
		else
		{
			// Use material specified in the mesh asset
			for( i=0; i<KFP.ThirdPersonHeadMeshComponent.GetNumElements(); i++ )
			{
				KFP.ThirdPersonHeadMeshComponent.SetMaterial(i, none);
			}
		}
	}
}

private function SetHeadMeshAndSkin(
	byte CurrentHeadMeshIndex,
	byte CurrentHeadSkinIndex,
	KFPawn KFP )
{
	local string CharHeadMeshName;
	local SkeletalMesh CharHeadMesh;

	if ( HeadVariants.length > 0 )
	{
		CurrentHeadMeshIndex = (CurrentHeadMeshIndex < HeadVariants.length) ? CurrentHeadMeshIndex : 0;

		CharHeadMeshName = HeadVariants[CurrentHeadMeshIndex].MeshName;
		CharHeadMesh = SkeletalMesh(DynamicLoadObject(CharHeadMeshName, class'SkeletalMesh'));

		// Parent the third person head mesh to the body mesh
		KFP.ThirdPersonHeadMeshComponent.SetSkeletalMesh(CharHeadMesh);
		KFP.ThirdPersonHeadMeshComponent.SetScale(DefaultMeshScale);

		KFP.ThirdPersonHeadMeshComponent.SetParentAnimComponent(KFP.Mesh);
		KFP.ThirdPersonHeadMeshComponent.SetShadowParent(KFP.Mesh);
		KFP.ThirdPersonHeadMeshComponent.SetLODParent(KFP.Mesh);

		KFP.AttachComponent(KFP.ThirdPersonHeadMeshComponent);

		if (KFP.WorldInfo.NetMode != NM_DedicatedServer)
		{
			SetHeadSkinMaterial(HeadVariants[CurrentHeadMeshIndex], CurrentHeadSkinIndex, KFP);
		}
	}
}

/**
 * Check to see if the attachment is supported for this mesh. Go through all the sockets of the mesh
 * and check if the socket for the attachment is present. If not, that attachment is not supported.
 * Network: Local Player Only
 */
function bool IsAttachmentAvailable(const out AttachmentVariants Attachment, Pawn PreviewPawn)
{
	if ( !class'KFUnlockManager'.static.GetAvailableAttachment(Attachment) )
	{
		//`log("Attachment" @ Attachment.MeshName @ "is not purchased.");
		return FALSE;
	}
	else if ( Attachment.AttachmentItem.SocketName != ''
		&& PreviewPawn.Mesh.GetSocketByName(Attachment.AttachmentItem.SocketName) == None )
	{
		`log("Attachment" @ Attachment.MeshName @ "is missing a required socket.");
		return FALSE;
	}

	return TRUE;
}

protected simulated function SetAttachmentSkinMaterial(
	int PawnAttachmentIndex,
	const out AttachmentVariants CurrentVariant,
	byte NewSkinIndex,
	KFPawn KFP)
{
	local int i;
	if (KFP.WorldInfo.NetMode != NM_DedicatedServer)
	{
		if( CurrentVariant.AttachmentItem.SkinVariations.length > 0 )
		{
			// Assign a skin to the attachment mesh as a material override
			if ( NewSkinIndex < CurrentVariant.AttachmentItem.SkinVariations.length )
			{
			KFP.ThirdPersonAttachments[PawnAttachmentIndex].SetMaterial(
				CurrentVariant.AttachmentItem.SkinMaterialID,
				CurrentVariant.AttachmentItem.SkinVariations[NewSkinIndex].Skin);
		}
		else
		{
				`log("Out of bounds skin index for"@CurrentVariant.MeshName);
				RemoveAttachmentMeshAndSkin(PawnAttachmentIndex, KFP);
			}
		}
		else
		{
			// Use material specified in the mesh asset
			for( i=0; i < KFP.ThirdPersonAttachments[PawnAttachmentIndex].GetNumElements(); i++ )
			{
				KFP.ThirdPersonAttachments[PawnAttachmentIndex].SetMaterial(i, none);
			}
		}
	}
}

/** Called on owning client to change a cosmetic attachment or on other clients via replication */
private function SetAttachmentMeshAndSkin(
	byte CurrentAttachmentMeshIndex,
	byte CurrentAttachmentSkinIndex,
	KFPawn KFP,
	optional KFPlayerReplicationInfo KFPRI )
{
	local string CharAttachmentMeshName;
	local name CharAttachmentSocketName;
	local bool bIsSkeletalAttachment;
	local StaticMesh CharAttachmentStaticMesh;
	local SkeletalMesh CharacterAttachmentSkelMesh;
	local float MaxDrawDistance;
	local StaticMeshComponent StaticAttachment;
	local SkeletalMeshComponent SkeletalAttachment;
	local SkeletalMeshSocket AttachmentSocket;
	local vector AttachmentLocationRelativeToSocket, AttachmentScaleRelativeToSocket;
	local rotator AttachmentRotationRelativeToSocket;
	local int AttachmentSlotIndex;

	if (KFP.WorldInfo.NetMode == NM_DedicatedServer)
	{
		return;
	}

	// Clear any previously attachments for the same slot
	//DetachConflictingAttachments(CurrentAttachmentMeshIndex, KFP, KFPRI);
	// Get a slot where this attachment could fit
	AttachmentSlotIndex = GetAttachmentSlotIndex(CurrentAttachmentMeshIndex, KFP);

	// Since cosmetic attachments are optional, do not choose index 0 if none is
	// specified unlike the the head and body meshes
	if ( CosmeticVariants.length > 0 &&
		 CurrentAttachmentMeshIndex < CosmeticVariants.length )
	{
		// Cache values from character info
		CharAttachmentMeshName = GetMeshByIndex(CurrentAttachmentMeshIndex);
		CharAttachmentSocketName = CosmeticVariants[CurrentAttachmentMeshIndex].AttachmentItem.SocketName;
		MaxDrawDistance = CosmeticVariants[CurrentAttachmentMeshIndex].AttachmentItem.MaxDrawDistance;
		AttachmentLocationRelativeToSocket = CosmeticVariants[CurrentAttachmentMeshIndex].RelativeTranslation;
		AttachmentRotationRelativeToSocket = CosmeticVariants[CurrentAttachmentMeshIndex].RelativeRotation;
		AttachmentScaleRelativeToSocket = CosmeticVariants[CurrentAttachmentMeshIndex].RelativeScale;
		bIsSkeletalAttachment = CosmeticVariants[CurrentAttachmentMeshIndex].AttachmentItem.bIsSkeletalAttachment;

		// If previously attached and we could have changed outfits (e.g. local player UI) then re-validate
		// required skeletal mesh socket.  Must be after body mesh DLO, but before AttachComponent.
		if ( KFP.IsLocallyControlled() )
		{
			if ( CharAttachmentSocketName != '' && KFP.Mesh.GetSocketByName(CharAttachmentSocketName) == None )
			{
				RemoveAttachmentMeshAndSkin(AttachmentSlotIndex, KFP, KFPRI);
				return;
			}
		}

		//`log("AttachmentLocationRelativeToSocket: x="$AttachmentLocationRelativeToSocket.x@"y="$AttachmentLocationRelativeToSocket.y@"z="$AttachmentLocationRelativeToSocket.z);
		// If it is a skeletal attachment, parent anim it to the body mesh
		if( bIsSkeletalAttachment )
		{
			if( SkeletalMeshComponent(KFP.ThirdPersonAttachments[AttachmentSlotIndex]) != none )
			{
				SkeletalAttachment = SkeletalMeshComponent(KFP.ThirdPersonAttachments[AttachmentSlotIndex]);
			}
			else
			{
				SkeletalAttachment = new(KFP) class'SkeletalMeshComponent';
				SkeletalAttachment.SetActorCollision(false, false);
				KFP.ThirdPersonAttachments[AttachmentSlotIndex] = SkeletalAttachment;
			}

			// Load and assign skeletal mesh
			CharacterAttachmentSkelMesh = SkeletalMesh(DynamicLoadObject(CharAttachmentMeshName, class'SkeletalMesh'));
			SkeletalAttachment.SetSkeletalMesh(CharacterAttachmentSkelMesh);

			// Parent animation and LOD transitions to body mesh
			SkeletalAttachment.SetParentAnimComponent(KFP.Mesh);
			SkeletalAttachment.SetLODParent(KFP.Mesh);
			SkeletalAttachment.SetScale(DefaultMeshScale);
			SkeletalAttachment.SetCullDistance(MaxDrawDistance);
			SkeletalAttachment.SetShadowParent(KFP.Mesh);
			SkeletalAttachment.SetLightingChannels(KFP.PawnLightingChannel);

			// Attach
			KFP.AttachComponent(SkeletalAttachment);
		}
		// Otherwise (if static), attach to a socket on the body mesh
		else
		{
			if( StaticMeshComponent(KFP.ThirdPersonAttachments[AttachmentSlotIndex]) != none )
			{
				StaticAttachment = StaticMeshComponent(KFP.ThirdPersonAttachments[AttachmentSlotIndex]);
			}
			else
			{
				StaticAttachment = new(KFP) class'StaticMeshComponent';
				StaticAttachment.SetActorCollision(false, false);
				KFP.ThirdPersonAttachments[AttachmentSlotIndex] = StaticAttachment;
			}

			// Load and assign static mesh
			CharAttachmentStaticMesh = StaticMesh(DynamicLoadObject(CharAttachmentMeshName, class'StaticMesh'));
			StaticAttachment.SetStaticMesh(CharAttachmentStaticMesh);

			// Set properties
			StaticAttachment.SetScale(DefaultMeshScale);
			StaticAttachment.SetCullDistance(MaxDrawDistance);
			StaticAttachment.SetShadowParent(KFP.Mesh);
			StaticAttachment.SetLightingChannels(KFP.PawnLightingChannel);

			// For static meshes, attach to given socket
			AttachmentSocket = KFP.mesh.GetSocketByName(CharAttachmentSocketName);
			KFP.mesh.AttachComponent(
				StaticAttachment,
				AttachmentSocket.BoneName,
				AttachmentSocket.RelativeLocation + AttachmentLocationRelativeToSocket,
				AttachmentSocket.RelativeRotation + AttachmentRotationRelativeToSocket,
				AttachmentSocket.RelativeScale * AttachmentScaleRelativeToSocket);
		}

		// Update the pawn's attachment metadata
		KFP.ThirdPersonAttachmentBitMask = KFP.ThirdPersonAttachmentBitMask | (1 << AttachmentSlotIndex);
		KFP.ThirdPersonAttachmentSocketNames[AttachmentSlotIndex] = CharAttachmentSocketName;

		SetAttachmentSkinMaterial(
			AttachmentSlotIndex,
				CosmeticVariants[CurrentAttachmentMeshIndex],
				CurrentAttachmentSkinIndex,
				KFP);
		}

	// Treat `CLEARED_ATTACHMENT_INDEX as special value (for client detachment)
	if( CurrentAttachmentMeshIndex == `CLEARED_ATTACHMENT_INDEX )
	{
		RemoveAttachmentMeshAndSkin(AttachmentSlotIndex, KFP, KFPRI);
	}
}

/**
 * Removes any attachments that exist in the same socket or have overriding cases
 * Network: Local Player
 */
function DetachConflictingAttachments(byte NewAttachmentMeshIndex, KFPawn KFP, optional KFPlayerReplicationInfo KFPRI)
{
	local name NewAttachmentSocketName;
	local int i, CurrentAttachmentIdx;

	if ( CosmeticVariants.length > 0 &&
		 NewAttachmentMeshIndex < CosmeticVariants.length )
	{
		// The socket that this attachment requires
		NewAttachmentSocketName = CosmeticVariants[NewAttachmentMeshIndex].AttachmentItem.SocketName;

		for( i=0; i < `MAX_COSMETIC_ATTACHMENTS; i++ )
		{
			CurrentAttachmentIdx = KFPRI.RepCustomizationInfo.AttachmentMeshIndices[i];
			if ( CurrentAttachmentIdx == `CLEARED_ATTACHMENT_INDEX )
				continue;

			// Remove the object if it is taking up our desired slot
			if( KFP.ThirdPersonAttachmentSocketNames[i] != '' &&
				KFP.ThirdPersonAttachmentSocketNames[i] == NewAttachmentSocketName )
			{
				RemoveAttachmentMeshAndSkin(i, KFP, KFPRI);
				continue;
			}

			// Remove the object if it cannot exist at the same time as another equipped item
			if( GetOverrideCase(CurrentAttachmentIdx, NewAttachmentMeshIndex) )
			{
				RemoveAttachmentMeshAndSkin(i, KFP, KFPRI);
				continue;
			}

			// Check inverse override
			if( GetOverrideCase(NewAttachmentMeshIndex, CurrentAttachmentIdx) )
	{
				RemoveAttachmentMeshAndSkin(i, KFP, KFPRI);
				continue;
			}
		}
	}
}

/**
 * Removes any attachments that exist in the same socket or have overriding cases
 * Network: Local Player
 */
function bool GetOverrideCase(byte AttachmentIndex1, byte AttachmentIndex2)
{
	local KFCharacterAttachment Attachment1;
	Attachment1 = CosmeticVariants[AttachmentIndex1].AttachmentItem;

	if (CosmeticVariants[AttachmentIndex2].SpecialOverrideAttachments.length > 0)
	{
		if ( CosmeticVariants[AttachmentIndex2].SpecialOverrideAttachments.Find(Attachment1) != INDEX_NONE )
		{
			return TRUE;
		}
	}
	else
	{
		if ( CosmeticVariants[AttachmentIndex2].AttachmentItem.DefaultSpecialOverrideAttachments.Find(Attachment1) != INDEX_NONE )
		{
			return TRUE;
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
	}

	return false;
}

/** Called on owning client to get the most appropriate slot for a cosmetic attachment.
	@returns -1 if no available slot otherwise returns the next available. If there is
	a socket conflict with an existing attachment, it returns the index of the existing
	attachment (to be replaced)
 */
function int GetAttachmentSlotIndex(
	byte CurrentAttachmentMeshIndex,
	KFPawn KFP)
{
	local int AttachmentIdx;
		// Otherwise, return the next available attachment index
		for( AttachmentIdx=0; AttachmentIdx < `MAX_COSMETIC_ATTACHMENTS; AttachmentIdx++ )
		{
			if( (KFP.ThirdPersonAttachmentBitMask & (1 << AttachmentIdx) ) == 0 )
			{
				return AttachmentIdx;
			}
		}
}

/** Called on owning client directly to remove a cosmetic attachment, or by
	SetAttachmentMeshAndSkin() on a replicated client when attachment index is `CLEARED_ATTACHMENT_INDEX
 */
simulated function RemoveAttachmentMeshAndSkin(
	int PawnAttachmentIndex,
	KFPawn KFP,
	optional KFPlayerReplicationInfo KFPRI)
{
	// Detach the attachment
	DetachAttachment(PawnAttachmentIndex, KFP);

	// Notify clients
	if( KFPRI != none )
	{
		KFPRI.ClearCharacterAttachment(PawnAttachmentIndex);
    }
}

/** Remove the attachment from the mesh */
function DetachAttachment(int PawnAttachmentIndex, KFPawn KFP)
{
	// Detach the attachment
	if( KFP.ThirdPersonAttachments[PawnAttachmentIndex] != none )
	{
        // We have a different attachment path if it is a skeletal mesh component
		if( SkeletalMeshComponent(KFP.ThirdPersonAttachments[PawnAttachmentIndex]) != none )
		{
			KFP.DetachComponent(KFP.ThirdPersonAttachments[PawnAttachmentIndex]);
		}
		else
		{
			KFP.mesh.DetachComponent(KFP.ThirdPersonAttachments[PawnAttachmentIndex]);
		}
	}

	// Update the pawn's attachment metadata
	KFP.ThirdPersonAttachmentBitMask = KFP.ThirdPersonAttachmentBitMask & ~(1 << PawnAttachmentIndex);
	KFP.ThirdPersonAttachmentSocketNames[PawnAttachmentIndex] = '';
}

/** Assign an arm mesh and material to this pawn */
simulated function SetFirstPersonArmsFromArch( KFPawn KFP, optional KFPlayerReplicationInfo KFPRI )
{
	if ( KFPRI == none )
	{
        `Warn("Does not have a KFPRI" @ Self);
	 	return;
	}

	// First person arms mesh and skin are based on body mesh & skin.
	// Index of 255 implies use index 0 (default).
    SetArmsMeshAndSkin(
    	KFPRI.RepCustomizationInfo.BodyMeshIndex,
    	KFPRI.RepCustomizationInfo.BodySkinIndex,
    	KFP);
}

simulated function SetArmsMeshAndSkin(
	byte ArmsMeshIndex,
	byte ArmsSkinIndex,
	KFPawn KFP )
{
	local byte CurrentArmMeshIndex, CurrentArmSkinIndex;
	local string CharArmMeshName;
	local SkeletalMesh CharArmMesh;

	if (KFP.WorldInfo.NetMode != NM_DedicatedServer && KFP.IsHumanControlled() && KFP.IsLocallyControlled())
	{
		// Character mesh
		if( CharacterArmVariants.length > 0 )
		{
			CurrentArmMeshIndex = (ArmsMeshIndex < CharacterArmVariants.length) ? ArmsMeshIndex : 0;

			// Retrieve the name of the meshes to be used from the archetype
			CharArmMeshName = CharacterArmVariants[CurrentArmMeshIndex].MeshName;

			// Load the meshes
			CharArmMesh = SkeletalMesh(DynamicLoadObject(CharArmMeshName, class'SkeletalMesh'));

			// Assign the arms mesh to the pawn
			KFP.ArmsMesh.SetSkeletalMesh(CharArmMesh);

			if( CharacterArmVariants[CurrentArmMeshIndex].SkinVariants.length > 0 )
			{
				// Assign a skin to the arms mesh as a material override
				CurrentArmSkinIndex = (ArmsSkinIndex < CharacterArmVariants[CurrentArmMeshIndex].SkinVariants.length) ? ArmsSkinIndex : 0;
				KFP.ArmsMesh.SetMaterial(0, CharacterArmVariants[CurrentArmMeshIndex].SkinVariants[CurrentArmSkinIndex]);
			}
			else
			{
				// Use material specified in the asset
				KFP.ArmsMesh.SetMaterial(0, none);
			}
		}
		else if( ArmMesh != none )
		{
			// Clear character customization settings
			KFP.ArmsMesh.SetMaterial(0, none);

	        // Assign the arms mesh to the pawn
	        KFP.ArmsMesh.SetSkeletalMesh(ArmMesh);
		}
		else
		{
			`warn("Character does not have a valid arms mesh");
		}
	}
}

static function int GetWeaponAnimSetIdx()
{
	return default.EmoteAnimset != none ? default.AnimSets.length + 1 : default.AnimSets.length;
}

simulated function SetCharacterAnimFromArch( KFPawn Pawn )
{
	super.SetCharacterAnimFromArch( Pawn );

	if( EmoteAnimset != none )
	{
		Pawn.Mesh.Animsets.AddItem(EmoteAnimset);
	}
}

defaultproperties
{
	SoundGroupArch=KFPawnSoundGroup'FX_Pawn_Sounds_ARCH.HumanPawnSounds'
	EmoteAnimset=AnimSet'ECON_emote.ECON_Emotes'
}