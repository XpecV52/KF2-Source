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
	native(Pawn)
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

/************************************************************************/
/*  Native Functions												    */
/************************************************************************/

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/************************************************************************/
/*  Script Functions												    */
/************************************************************************/

/** Sets misc. properties from the character info */
simulated function SetCharacterFromArch( KFPawn KFP, optional KFPlayerReplicationInfo KFPRI );

/** Sets the pawns character mesh from it's CharacterInfo, and updates instance of player in map if there is one. */
simulated function SetCharacterMeshFromArch( KFPawn KFP, optional KFPlayerReplicationInfo KFPRI );

simulated function SetBodyMesh( byte CurrentOutfitIndex, KFPawn KFP, optional KFPlayerReplicationInfo KFPRI );
simulated function SetBodySkin(byte CurrentSkinIndex, KFPawn KFP, KFPlayerReplicationInfo KFPRI);

/** Assign an arm mesh and material to this pawn */
function SetFirstPersonArmsFromArch( KFPawn KFP, optional KFPlayerReplicationInfo KFPRI );

defaultproperties
{
   DefaultMeshScale=1.000000
   NonTeamEmissiveColor=(R=10.000000,G=0.200000,B=0.200000,A=1.000000)
   NonTeamTintColor=(R=4.000000,G=2.000000,B=0.500000,A=1.000000)
   AnimArchetype=KFPawnAnimInfo'ZED_Clot_Anim.AlphaClot_AnimGroup'
   SoundGroupArch=KFPawnSoundGroup'FX_Pawn_Sounds_ARCH.DefaultPawnSounds'
   ImpactSkins(0)=KFSkinTypeEffects'FX_Impacts_ARCH.SkinTypes.Flesh'
   ImpactSkins(1)=KFSkinTypeEffects'FX_Impacts_ARCH.SkinTypes.Skull'
   Name="Default__KFCharacterInfoBase"
   ObjectArchetype=Object'Core.Default__Object'
}
