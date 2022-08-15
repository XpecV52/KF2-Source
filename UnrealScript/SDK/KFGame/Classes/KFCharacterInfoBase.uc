//=============================================================================
// KFCharacterInfoBase
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 3/18/2014
//=============================================================================

class KFCharacterInfoBase extends Object
	abstract
	dependsOn(KFPawn, KFDamageType);

/** Mesh scaling */
var(ThirdPerson) float DefaultMeshScale;

/** When not in a team game, this is the color to use for glowy bits. */
var(ThirdPerson) LinearColor			NonTeamEmissiveColor;
/** When not in a team game, this is the color to tint character at a distance. */
var(ThirdPerson) LinearColor			NonTeamTintColor;

/************************************************************************/
/*  Animation Info                                                   */
/************************************************************************/

/** Animation tree to use for a character in this 'family' */
var(Anim) AnimTree			AnimTreeTemplate;

/** Animation sets to use for a character in this 'family' */
var(Anim) array<AnimSet>	AnimSets;

/** This pawn's anim info class based on character info */
var(Anim) KFPawnAnimInfo	AnimArchetype;

/************************************************************************/
/*  Physics Info						                                    */
/************************************************************************/

/** Physics Asset to use  */
var(Physics) PhysicsAsset		PhysAsset;

/************************************************************************/
/*  Effects					                                    */
/************************************************************************/

var(Effects) KFPawnSoundGroup 	   SoundGroupArch;
//var(Effects) class<KFVoiceInfo>	   		VoiceClass;
//var(Effects) class< KFPawnVoiceGroup >    VoiceGroupArch;
var(Effects) string				 	VoiceGroupArchName;

/** Skin Type definition for impact effects */
var(Effects) array<KFSkinTypeEffects> ImpactSkins;

/** This is the bone from which the the trace for the blood pool effect will originate. The trace is done
	vertically downwards. If not specified, the root bone (index 0) will be used as blood pool origin */
var(Gore) name BloodPoolOriginBoneName;

/** Sets misc. properties from the character info */
simulated function SetCharacterFromArch( KFPawn KFP, optional KFPlayerReplicationInfo KFPRI );

/** Sets the pawns character mesh from it's CharacterInfo, and updates instance of player in map if there is one. */
simulated function SetCharacterMeshFromArch( KFPawn KFP, optional KFPlayerReplicationInfo KFPRI );

simulated function SetBodyMesh( byte CurrentOutfitIndex, KFPawn KFP, optional KFPlayerReplicationInfo KFPRI );
simulated function SetBodySkin(byte CurrentSkinIndex, KFPawn KFP, KFPlayerReplicationInfo KFPRI);

/** Sets the pawns character mesh from it's CharacterInfo, and updates instance of player in map if there is one. */
simulated function SetBodyMeshAndSkin(
	byte CurrentBodyMeshIndex,
	byte CurrentBodySkinIndex,
	KFPawn KFP,
	optional KFPlayerReplicationInfo KFPRI );

simulated function SetHeadMeshAndSkin(
	byte CurrentHeadMeshIndex,
	byte CurrentHeadSkinIndex,
	KFPawn KFP,
	optional KFPlayerReplicationInfo KFPRI );

simulated function SetAttachmentMeshAndSkin(
	byte CurrentAttachmentMeshIndex,
	byte CurrentAttachmentSkinIndex,
	KFPawn KFP,
	optional KFPlayerReplicationInfo KFPRI );

simulated function ClearAllAttachments(KFPawn KFP, KFPlayerReplicationInfo KFPRI);

function SetArmsMeshAndSkin(
	byte CurrentBodyMeshIndex,
	byte CurrentBodySkinIndex,
	KFPawn KFP,
	optional KFPlayerReplicationInfo KFPRI );

/** Assign an arm mesh and material to this pawn */
simulated function SetFirstPersonArmsFromArch( KFPawn KFP, optional KFPlayerReplicationInfo KFPRI );

defaultproperties
{
	AnimArchetype=KFPawnAnimInfo'ZED_Clot_Anim.AlphaClot_AnimGroup'
	SoundGroupArch=KFPawnSoundGroup'FX_Pawn_Sounds_ARCH.DefaultPawnSounds'

	NonTeamEmissiveColor=(R=10.0,G=0.2,B=0.2)
	NonTeamTintColor=(R=4.0,G=2.0,B=0.5)

	DefaultMeshScale=1.f

	ImpactSkins[0]=KFSkinTypeEffects'FX_Impacts_ARCH.SkinTypes.Flesh'
	ImpactSkins[1]=KFSkinTypeEffects'FX_Impacts_ARCH.SkinTypes.Skull'
}
