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
	implements(KFUnlockableAsset)
	hidecategories(Object);

/************************************************************************/
/*  Identification													    */
/************************************************************************/

var() const int UnlockAssetID;

var(General) Texture DefaultHeadPortrait;
var(General) array<Texture> DefaultTeamHeadPortrait;

/** Matches the FamilyID in the CustomCharData */
var(General) string FamilyID;

/** Faction that this family belongs to. */
var(General) string Faction;

/** Whether these are female characters */
var(General) bool bIsFemale;

/************************************************************************/
/*  3P Mesh Info							                            */
/************************************************************************/

/** The material ID for the skin in the mesh */
var(ThirdPerson) int HeadMaterialID;
var(ThirdPerson) int BodyMaterialID;

struct SkinVariant
{
	var() const int UnlockAssetID;
	/** The path to this skins package and texture */
	var() Texture UITexture;
	/** The material this outfit can use */
 	var() MaterialInstance Skin;
};

struct OutfitVariants
{
	var() const int UnlockAssetID;
	/** The path to this skins package and texture */
	var() Texture UITexture;
	/** Outfit mesh name. Must be of form PackageName.MeshName */
	var() string MeshName;
	/** Reference to the different skin variants for a particular outfit mesh */
	var() array<SkinVariant> SkinVariations;
};

/** List of booleans that will effect which items can be attached with the current attachment */
struct AttachmentOverrideList
{
	var() bool bHat;
	var() bool bFace;	
	var() bool bEyes;	
	var() bool bJaw;
};

struct AttachmentVariants
{
	var() const int UnlockAssetID;
	/** The path to this skins package and texture */
	var() Texture UITexture;
	/** Whether the attachment is a skeletal mesh. Otherwise, it is treated as a static mesh attachment.
		Skeletal meshe animations are parented with the body mesh and must share the same skeletaon. */
	var() bool bIsSkeletalAttachment;
	/** Attachment mesh name. Must be of form PackageName.MeshName */
	var() string MeshName;
	/** Name of the socket that it attaches to. The socket MUST exist in the body mesh for static mesh
		attachments to work. SocketName is also used to resolve conflicts - when more than one attachment
		tries to attach to the same socket, it will replace the previously existing attachment. It will keep
		both if there is no conflict. NOTE: Skeletal meshes do not use sockets for attachment, but the socket name
		can still be used for conflit resolution. */
	var() name SocketName;
	/** Translation relative to given socket (for additional control) */
	var() vector RelativeTranslation<EditCondition=!bIsSkeletalAttachment>;
	/** Rotation relative to given socket (for additional control) */
	var() rotator RelativeRotation<EditCondition=!bIsSkeletalAttachment>;
	/** Scale relative to given socket (for additional control) */
	var() vector RelativeScale;
	/** Distance at which the attachment will be hidden (distance culled). If 0, it is never culled */
	var() float MaxDrawDistance;
	/** Material ID used for skin variations for this attachment (default is 0) */
	var() int SkinMaterialID;
	/** Reference to the different skin variants for a particular attachment mesh */
	var() array<SkinVariant> SkinVariations;
	/** List of sockets that this attachment will detach, if they are currently attached to a player */
	var() AttachmentOverrideList OverrideList;

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
var(ThirdPerson) array<OutfitVariants> BodyVariants;
/** The head variants for a character. Used for Character Customization */
var(ThirdPerson) array<OutfitVariants> HeadVariants;
/** Various cosmetic variants for a character. Used for Character Customization */
var(ThirdPerson) array<AttachmentVariants> CosmeticVariants;

/************************************************************************/
/*  1P Character Info                                                   */
/************************************************************************/

struct FirstPersonArmVariants
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
var(FaveWeapons) name FavoriteWeaponClassNames[NUM_FAVE_WEAPS];

/************************************************************************/
/*  Script Functions												    */
/************************************************************************/

/** Implements KFUnlockableAsset */
function int GetAssetId()
{
	return UnlockAssetID;
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

/** Return the material used for the 1P arm skeletal mesh given a team */
function MaterialInterface GetFirstPersonArmsMaterial(int TeamNum)
{
   return GetFirstPersonArms().Materials[0];
}

/** Return the texture portrait stored for this character */
function Texture GetCharPortrait(int TeamNum)
{
	return (TeamNum < DefaultTeamHeadPortrait.length) ? DefaultTeamHeadPortrait[TeamNum] : DefaultHeadPortrait;
}

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

	// Assign fallback portrait.
	KFPRI.CharPortrait = GetCharPortrait( KFPRI.GetTeamNum() );

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
	local int AttachmentIdx;
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
    	KFP, KFPRI);

    // Head mesh & skin. Index of 255 implies use index 0 (default).
	SetHeadMeshAndSkin(
		KFPRI.RepCustomizationInfo.HeadMeshIndex,
		KFPRI.RepCustomizationInfo.HeadSkinIndex,
		KFP, KFPRI);

	// Must clear all attachments before trying to attach new ones, 
	// otherwise we might accidentally remove things we're not supposed to
	for( AttachmentIdx=0; AttachmentIdx < `MAX_COSMETIC_ATTACHMENTS; AttachmentIdx++ )
	{
		// Clear any previous attachments from other characters
		DetatchAttachment(AttachmentIdx, KFP);
	}

	// Cosmetic attachment mesh & skin. Index of 255 implies don't use any attachments (default)
	for( AttachmentIdx=0; AttachmentIdx < `MAX_COSMETIC_ATTACHMENTS; AttachmentIdx++ )
	{
		// Attach all saved attachments to the character
		SetAttachmentMeshAndSkin(
			KFPRI.RepCustomizationInfo.AttachmentMeshIndices[AttachmentIdx],
			KFPRI.RepCustomizationInfo.AttachmentSkinIndices[AttachmentIdx],
			KFP, KFPRI);
	}
}

simulated function byte GetValidVarriantIndex(out array<OutfitVariants> VarriantList, byte StartingIndex)
{
	local byte i;
	local OutfitVariants CurrentBodyVariant;

	for( i = 0; i < VarriantList.length; i++ )
	{
		CurrentBodyVariant = VarriantList[i];
		if( class'KFUnlockManager'.static.GetAvailableOutfit(CurrentBodyVariant) )
		{
			return i;
		}
	}

	return 0;
}

simulated function byte GetValidSkinIndex(out array<SkinVariant> SkinList, byte StartingIndex)
{
	local byte i;
	local SkinVariant CurrentSkinVariant;

	for( i = 0; i < SkinList.length; i++ )
	{
		CurrentSkinVariant = SkinList[i];
		if( class'KFUnlockManager'.static.GetAvailableSkin(CurrentSkinVariant) )
		{
			return i;
		}
	}

	return 0;
}

simulated function byte GetValidAttachmentIndex(out array<AttachmentVariants> AttachmentList, byte StartingIndex)
{
	local byte i;
	local AttachmentVariants CurrentAttachmentVariant;

	for( i = 0; i < AttachmentList.length; i++ )
	{
		CurrentAttachmentVariant = AttachmentList[i];
		if( class'KFUnlockManager'.static.GetAvailableAttachment(CurrentAttachmentVariant) )
		{
			return i;
		}
	}

	return 0;
}

simulated function SetBodyMeshAndSkin(
	byte CurrentBodyMeshIndex,
	byte CurrentBodySkinIndex,
	KFPawn KFP,
	optional KFPlayerReplicationInfo KFPRI )
{
	local string CharBodyMeshName;
	local SkeletalMesh CharBodyMesh;
	local OutfitVariants CurrentBodyVariant;
	local SkinVariant CurrentSkinVariant;

	// Character Mesh
	if( BodyVariants.length > 0 )
	{
		// Assign a skin to the body mesh as a material override
		CurrentBodyMeshIndex = (CurrentBodyMeshIndex < BodyVariants.length) ? CurrentBodyMeshIndex : 0;

		CurrentBodyVariant = BodyVariants[CurrentBodyMeshIndex];

 		if( !class'KFUnlockManager'.static.GetAvailableOutfit(CurrentBodyVariant) &&
			KFP.IsLocallyControlled() )
 		{
 			CurrentBodyMeshIndex = GetValidVarriantIndex(BodyVariants, CurrentBodyMeshIndex);
 			CurrentBodyVariant = BodyVariants[CurrentBodyMeshIndex];
 		}

 		CurrentSkinVariant = CurrentBodyVariant.SkinVariations[CurrentBodySkinIndex];

 		if( !class'KFUnlockManager'.static.GetAvailableSkin(CurrentSkinVariant) &&
			KFP.IsLocallyControlled() )
 		{
 			CurrentBodySkinIndex = GetValidSkinIndex(CurrentBodyVariant.SkinVariations, CurrentBodySkinIndex);
 		}

		// Retrieve the name of the meshes to be used from the archetype
		CharBodyMeshName = BodyVariants[CurrentBodyMeshIndex].MeshName;

		// Load the meshes
		CharBodyMesh = SkeletalMesh(DynamicLoadObject(CharBodyMeshName, class'SkeletalMesh'));

		// Assign the body mesh to the pawn
		KFP.Mesh.SetSkeletalMesh(CharBodyMesh);

		KFPRI.RepCustomizationInfo.BodyMeshIndex = CurrentBodyMeshIndex;
		KFPRI.RepCustomizationInfo.BodySkinIndex = CurrentBodySkinIndex;

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

	// Initialize MICs
	if( KFP.WorldInfo.NetMode != NM_DedicatedServer && KFP.Mesh != None )
	{
		KFP.BodyMIC = KFP.Mesh.CreateAndSetMaterialInstanceConstant(BodyMaterialID);
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

	// Initialize MICs
	if( KFP.WorldInfo.NetMode != NM_DedicatedServer && KFP.ThirdPersonHeadMeshComponent != None )
	{
		KFP.HeadMIC = KFP.ThirdPersonHeadMeshComponent.CreateAndSetMaterialInstanceConstant(HeadMaterialID);
	}
}

simulated function SetHeadMeshAndSkin(
	byte CurrentHeadMeshIndex,
	byte CurrentHeadSkinIndex,
	KFPawn KFP,
	optional KFPlayerReplicationInfo KFPRI )
{
	local string CharHeadMeshName;
	local SkeletalMesh CharHeadMesh;

	local OutfitVariants HeadVariant;
	local SkinVariant HeadSkinVariant; 

	if ( HeadVariants.length > 0 )
	{
		CurrentHeadMeshIndex = (CurrentHeadMeshIndex < HeadVariants.length) ? CurrentHeadMeshIndex : 0;

		HeadVariant = HeadVariants[CurrentHeadMeshIndex];

		if( !class'KFUnlockManager'.static.GetAvailableOutfit(HeadVariant)  &&
			KFP.IsLocallyControlled() )
 		{
 			CurrentHeadMeshIndex = GetValidVarriantIndex(HeadVariants, CurrentHeadMeshIndex);
 			HeadVariant = HeadVariants[CurrentHeadMeshIndex];
 		}

		HeadSkinVariant = HeadVariant.SkinVariations[CurrentHeadSkinIndex];

 		if( !class'KFUnlockManager'.static.GetAvailableSkin(HeadSkinVariant)  &&
			KFP.IsLocallyControlled() )
 		{
 			CurrentHeadSkinIndex = GetValidSkinIndex(HeadVariant.SkinVariations, CurrentHeadSkinIndex);
 			HeadSkinVariant = HeadVariant.SkinVariations[CurrentHeadSkinIndex];
 		}

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

        KFPRI.RepCustomizationInfo.HeadMeshIndex = CurrentHeadMeshIndex;
        KFPRI.RepCustomizationInfo.HeadSkinIndex = CurrentHeadSkinIndex;
	}
}

/** Check to see if the attachment is supported for this mesh. Go through all the sockets of the mesh
	and check if the socket for the attachment is present. If not, that attachment is not supported.
 */
function bool IsAttachmentSupported(byte CurrentAttachmentMeshIndex, KFPawn KFP)
{
	local name CharAttachmentSocketName;

	if ( CosmeticVariants.length > 0 )
	{
		if( CosmeticVariants[CurrentAttachmentMeshIndex].bIsSkeletalAttachment )
		{
			// Skeletal attachments are always supported since then don't rely on a socket
			return true;
		}
		else
		{
			// For static attachments, check to see if the socket is present on the mesh
			CharAttachmentSocketName = CosmeticVariants[CurrentAttachmentMeshIndex].SocketName;
			return KFP.mesh.GetSocketByName(CharAttachmentSocketName) != none;
		}
	}
	else
	{
		return false;
	}
}

protected simulated function SetAttachmentSkinMaterial(
	int PawnAttachmentIndex,
	AttachmentVariants CurrentVariant,
	byte NewSkinIndex,
	KFPawn KFP)
{
	local int i;
	if (KFP.WorldInfo.NetMode != NM_DedicatedServer)
	{
		if( CurrentVariant.SkinVariations.length > 0 )
		{
			// Assign a skin to the attachment mesh as a material override
			NewSkinIndex = (NewSkinIndex < CurrentVariant.SkinVariations.length) ? NewSkinIndex : 0;
			KFP.ThirdPersonAttachments[PawnAttachmentIndex].SetMaterial(
				CurrentVariant.SkinMaterialID,
				CurrentVariant.SkinVariations[NewSkinIndex].Skin);
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
simulated function SetAttachmentMeshAndSkin(
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

	local AttachmentVariants AttachmentVariant;
	local SkinVariant AttachmentSkin;

	// Clear any previously attachments for the same slot
	DetatchConflictingAttachments(CurrentAttachmentMeshIndex, KFP, KFPRI);
	// Get a slot where this attachment could fit
	AttachmentSlotIndex = GetAttachmentSlotIndex(CurrentAttachmentMeshIndex, KFP);

	// Since cosmetic attachments are optional, do not choose index 0 if none is
	// specified unlike the the head and body meshes
	if ( CosmeticVariants.length > 0 &&
		 CurrentAttachmentMeshIndex < CosmeticVariants.length )
	{
		AttachmentVariant = CosmeticVariants[CurrentAttachmentMeshIndex];

		if( !class'KFUnlockManager'.static.GetAvailableAttachment(AttachmentVariant) &&
			KFP.IsLocallyControlled() )
 		{
 			CurrentAttachmentMeshIndex = GetValidAttachmentIndex(CosmeticVariants, CurrentAttachmentMeshIndex);
 			AttachmentVariant = CosmeticVariants[CurrentAttachmentMeshIndex];
 		}

		AttachmentSkin = AttachmentVariant.SkinVariations[CurrentAttachmentSkinIndex];

 		if(!class'KFUnlockManager'.static.GetAvailableSkin(AttachmentSkin) &&
			KFP.IsLocallyControlled())
 		{
 			CurrentAttachmentSkinIndex = GetValidSkinIndex(AttachmentVariant.SkinVariations, CurrentAttachmentSkinIndex);
 			AttachmentSkin = AttachmentVariant.SkinVariations[CurrentAttachmentSkinIndex];
 		}

		// Cache values from character info
		CharAttachmentMeshName = CosmeticVariants[CurrentAttachmentMeshIndex].MeshName;
		CharAttachmentSocketName = CosmeticVariants[CurrentAttachmentMeshIndex].SocketName;
		MaxDrawDistance = CosmeticVariants[CurrentAttachmentMeshIndex].MaxDrawDistance;
		AttachmentLocationRelativeToSocket = CosmeticVariants[CurrentAttachmentMeshIndex].RelativeTranslation;
		AttachmentRotationRelativeToSocket = CosmeticVariants[CurrentAttachmentMeshIndex].RelativeRotation;
		AttachmentScaleRelativeToSocket = CosmeticVariants[CurrentAttachmentMeshIndex].RelativeScale;
		bIsSkeletalAttachment = CosmeticVariants[CurrentAttachmentMeshIndex].bIsSkeletalAttachment;

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

		if (KFP.WorldInfo.NetMode != NM_DedicatedServer)
		{
			SetAttachmentSkinMaterial(
				AttachmentSlotIndex,
				CosmeticVariants[CurrentAttachmentMeshIndex],
				CurrentAttachmentSkinIndex,
				KFP);
		}

   		KFPRI.RepCustomizationInfo.AttachmentMeshIndices[AttachmentSlotIndex] = CurrentAttachmentMeshIndex;
    	KFPRI.RepCustomizationInfo.AttachmentSkinIndices[AttachmentSlotIndex] = CurrentAttachmentSkinIndex;
	}

	// Treat `CLEARED_ATTACHMENT_INDEX as special value (for client detachment)
	if( CurrentAttachmentMeshIndex == `CLEARED_ATTACHMENT_INDEX )
	{
		RemoveAttachmentMeshAndSkin(AttachmentSlotIndex, KFP, KFPRI);
	}
}

simulated function ClearAllAttachments(KFPawn KFP, KFPlayerReplicationInfo KFPRI)
{
	local byte i;
	for( i = 0; i < `MAX_COSMETIC_ATTACHMENTS; i++ )
	{
		RemoveAttachmentMeshAndSkin(i, KFP, KFPRI);
	}
}

/** Check to see if the socket specified is already in use by another attachment.
	If TRUE, it returns the index of the attachment with the socket conflict
 */
function bool HasSocketConflict(
	KFPawn KFP,
	name SocketName,
	out int OutConflictAttachmentIndex)
{
	local int AttachmentIdx;

	for( AttachmentIdx=0; AttachmentIdx < `MAX_COSMETIC_ATTACHMENTS; AttachmentIdx++ )
	{
		if( KFP.ThirdPersonAttachmentSocketNames[AttachmentIdx] != '' &&
			KFP.ThirdPersonAttachmentSocketNames[AttachmentIdx] == SocketName )
		{
			OutConflictAttachmentIndex = AttachmentIdx;
			return true;
		}
	}

	OutConflictAttachmentIndex = -1;
	return false;
}

/** Removes any attachments that exist in the same socket or have overriding cases */
function DetatchConflictingAttachments(byte CurrentAttachmentMeshIndex, KFPawn KFP, optional KFPlayerReplicationInfo KFPRI)
{
	local name CharAttachmentSocketName;
	local int AttachmentIdx;

	if ( CosmeticVariants.length > 0 &&
		 CurrentAttachmentMeshIndex < CosmeticVariants.length )
	{
		// The socket that this attachment requires
		CharAttachmentSocketName = CosmeticVariants[CurrentAttachmentMeshIndex].SocketName;

		for( AttachmentIdx=0; AttachmentIdx < `MAX_COSMETIC_ATTACHMENTS; AttachmentIdx++ )
		{
			// Remove the object if it is taking up our desired slot
			if( KFP.ThirdPersonAttachmentSocketNames[AttachmentIdx] != '' &&
				KFP.ThirdPersonAttachmentSocketNames[AttachmentIdx] == CharAttachmentSocketName )
			{
				RemoveAttachmentMeshAndSkin(AttachmentIdx, KFP, KFPRI);	
				continue;
			}

			// Remove the object if it cannot exist at the same time as another equipped item
			if( GetOverrideCase(KFP.ThirdPersonAttachmentSocketNames[AttachmentIdx], CurrentAttachmentMeshIndex) )
			{
				RemoveAttachmentMeshAndSkin(AttachmentIdx, KFP, KFPRI);	
			}
		}
	}
}

function bool GetOverrideCase(name SocketName, byte AttachmentIndex)
{
	switch(SocketName)
	{
		case 'Hat_Attach':
			return CosmeticVariants[AttachmentIndex].OverrideList.bHat;
		case 'Face_Attach':
			return CosmeticVariants[AttachmentIndex].OverrideList.bFace;
		case 'Eyes_Attach':
			return CosmeticVariants[AttachmentIndex].OverrideList.bEyes;
		case 'Jaw_Attach':
			return CosmeticVariants[AttachmentIndex].OverrideList.bJaw;
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
	DetatchAttachment(PawnAttachmentIndex, KFP);

	// Notify clients
	if( KFPRI != none )
	{
		KFPRI.RepCustomizationInfo.AttachmentMeshIndices[PawnAttachmentIndex] = `CLEARED_ATTACHMENT_INDEX;
        KFPRI.RepCustomizationInfo.AttachmentSkinIndices[PawnAttachmentIndex] = `CLEARED_ATTACHMENT_INDEX;        
    }
}

/** Remove the attachment from the mesh */
function DetatchAttachment(int PawnAttachmentIndex, KFPawn KFP)
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
    	KFP, KFPRI);
}

simulated function SetArmsMeshAndSkin(
	byte ArmsMeshIndex,
	byte ArmsSkinIndex,
	KFPawn KFP,
	optional KFPlayerReplicationInfo KFPRI )
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