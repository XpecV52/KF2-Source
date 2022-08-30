/*******************************************************************************
 * KFCharacterAttachment generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFCharacterAttachment extends Object
    native(Pawn);

/** The path to this skins package and texture */
var() Texture UITexture;
/**  
 *Whether the attachment is a skeletal mesh. Otherwise, it is treated as a static mesh attachment.
 *       Skeletal meshe animations are parented with the body mesh and must share the same skeletaon.
 */
var() bool bIsSkeletalAttachment;
var edithide transient StaticMesh MeshStatic;
var edithide transient SkeletalMesh MeshSkeletal;
/** Attachment mesh name. Must be of form PackageName.MeshName */
var() string MeshName;
/**  
 *Name of the socket that it attaches to. The socket MUST exist in the body mesh for static mesh
 *       attachments to work. SocketName is also used to resolve conflicts - when more than one attachment
 *       tries to attach to the same socket, it will replace the previously existing attachment. It will keep
 *       both if there is no conflict. NOTE: Skeletal meshes do not require sockets for attachment, but the socket name
 *       can still be used for conflit resolution.
 */
var() name SocketName;
var edithide transient StaticMesh MeshStatic1p;
var edithide transient SkeletalMesh MeshSkeletal1p;
/** Mesh attachment name for 1p. */
var() string MeshName1p;
/**  
 *Socket name that the 1p mesh attaches to. If bIsSkeletalAttachment is true, then the mesh will be attached
 *    to the ParentAnimComponent.
 */
var() name SocketName1p;
/** Distance at which the attachment will be hidden (distance culled). If 0, it is never culled */
var() float MaxDrawDistance;
/** Material ID used for skin variations for this attachment (default is 0) */
var() int SkinMaterialID;
/** Reference to the different skin variants for a particular attachment mesh */
var() array<SkinVariant> SkinVariations;
/** List of sockets that this attachment will detach, if they are currently attached to a player */
var() AttachmentOverrideList OverrideList;
var array<byte> SpecialOverrideIds;
var() array<KFCharacterAttachment> DefaultSpecialOverrideAttachments;
