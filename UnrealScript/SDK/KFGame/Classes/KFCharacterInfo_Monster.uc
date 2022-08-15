//=============================================================================
// KFCharacterInfo_Monster
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 3/19/2014
//=============================================================================

class KFCharacterInfo_Monster extends KFCharacterInfoBase
	hidecategories(Object);

/** Character mesh to use */
var(Display) SkeletalMesh CharacterMesh<DisplayName=Body Mesh>;
/** The material ID for the body */
var(Display) int CharacterSkinMaterialID<DisplayName=Body Material ID>;
/** (optional) Randomly selected material override applied to body mesh */
var(Display) array<MaterialInterface> CharacterSkinVariants<DisplayName=Character Skins>;

/** Aggressively optimized mesh for the server with minimal bones */
var(Performance) SkeletalMesh ServerMesh;

/************************************************************************/
/*  Audio                                                   */
/************************************************************************/
var(Audio) DoorSoundFx		DoorHitSound;

/************************************************************************/
/*  Difficulty Info                                                     */
/************************************************************************/

struct native ZedDifficultySettings
{
	/** The individual health modifier for this zed type */
	var() float HealthMod;
	/** The individual head health modifier for this zed type */
	var() float HeadHealthMod;
	/** The chance that a zed can use sprinting at a specific difficulty */
	var() float SprintChance;
	/** The chance that a zed will start sprinting when damaged */
	var() float DamagedSprintChance;
	/** A per zed damage mod configurable by difficulty */
	var() float DamageMod;
	/** A per zed damage mod configurable by difficulty when playing solo/offline */
	var() float SoloDamageMod;
 	structdefaultproperties
	{
		HealthMod=1.0f;
		HeadHealthMod=1.0f;
	    SprintChance=0.f;
	    DamagedSprintChance=0.f;
	    DamageMod=1.f;
	    SoloDamageMod=1.f;
	}
};

var(Difficulty) ZedDifficultySettings Normal;
var(Difficulty) ZedDifficultySettings Hard;
var(Difficulty) ZedDifficultySettings Suicidal;
var(Difficulty) ZedDifficultySettings HellOnEarth;

/** [KF1] Used to scale the health of certain zed types based on player count */
var(Difficulty) float NumPlayersScale_BodyHealth;
var(Difficulty) float NumPlayersScale_HeadHealth;

/************************************************************************/
/*  Gore Info														    */
/************************************************************************/

/** Settings for special melee dismeberment such as being able to split a character in half */
struct native MeleeSpecialDismembermentInfo
{
	var() bool bAllowHorizontalSplit;
	var() name SpineBoneName<EditCondition=bAllowHorizontalSplit>;
	var() bool bAllowVerticalSplit;
	var() name LeftShoulderBoneName<EditCondition=bAllowVerticalSplit>;
	var() name RightShoulderBoneName<EditCondition=bAllowVerticalSplit>;
};

/** This is the blood splatter effect to use on the walls when this pawn is shot @see LeaveABloodSplatterDecal **/
var MaterialInstance BloodSplatterDecalMaterial;

/** Temp option in order to transition from GoreLOD to GoreMesh */
//var(Gore) bool bUseGoreMesh;

/** Gore mesh with alternate bone weights */
var(Gore) SkeletalMesh GoreMesh;

/** The LOD to use as the gore mesh */
//var(Gore) int GoreMeshLOD;

/** Alternate material ID for the body used for gore */
var(Gore) int CharacterGoreMaterialID<DisplayName=Gore Material ID>;

/** Gore settings for bones that can be dismembered.
	ALL HITZONE BONES MUST BE INCLUDED EVEN IF THEY CANNOT BE DISMEMBERED  */
var(Gore) editinline array<KFGoreJointInfo> GoreJointSettings;
/** Gore chunk attachment settings for the mesh */
var(Gore) editinline array<KFGoreChunkAttachmentInfo> GoreChunkAttachments;
/** Giblets to spawn on obliteration*/
var(Gore) editinline array<KFGibletInfo> GibletSettings;

/** Use for special melee dismeberment settings such as being able to split a character in half */
var(Gore) MeleeSpecialDismembermentInfo SpecialMeleeDismemberment;

/** Additional particle effect to be spawned for an explosion (if any)*/
var(Gore) ParticleSystem ExplosionEffectTemplate<DisplayName=Gib Explosion Template>;

/** Particle effect to be spawned on obliteration */
var(Gore) ParticleSystem ObliterationEffectTemplate<DisplayName=Obliteration Effect Template>;

/** Use to scale the number of gibs when the character explodes. Values greater than 1
	scale up, and values smaller than 0 scale down. Must be greater than 0. This is for
	actual grenade (or other explosive) based explosions. It has no effect on explosions
	triggered by Explosion Joints */
var(Gore) float ExplosionGibScale<DisplayName=Num Gibs Scale|UIMin=0|ClampMin=0|UIMax=10.0|ClampMax=10.0> ;

/** Use to scale the impulse applied to gibs when the character explodes. Values greater than 1
	scale up, and values smaller than 0 scale down. Must be greater than 0. This affects both
	grenade based explosions and explosions triggered by Explosion Joints */
var(Gore) float ExplosionImpulseScale<DisplayName=Gib Impulse Scale|UIMin=0|ClampMin=0|UIMax=20.0|ClampMax=20.0> ;

/************************************************************************/
/*  Script Functions												    */
/************************************************************************/

/** Sets the pawns character mesh from it's CharacterInfo, and updates instance of player in map if there is one. */
simulated function SetCharacterMeshFromArch( KFPawn KFP, optional KFPlayerReplicationInfo KFPRI )
{
	local int i, BodyMICIndex;

	super.SetCharacterMeshFromArch( KFP, KFPRI );

	if( CharacterMesh != none )
	{
		// Clear character customization settings
		KFP.DetachComponent(KFP.ThirdPersonHeadMeshComponent);
		for( i=0; i < `MAX_COSMETIC_ATTACHMENTS; i++ )
		{
			KFP.DetachComponent(KFP.ThirdPersonAttachments[i]);
		}

        // Assign the body mesh to the pawn
		if ( KFP.WorldInfo.NetMode == NM_DedicatedServer && ServerMesh != None )
		{
			KFP.Mesh.SetSkeletalMesh(ServerMesh);
		}
		else
		{
			KFP.Mesh.SetSkeletalMesh(CharacterMesh);
		}
		KFP.Mesh.SetScale(DefaultMeshScale);
		BodyMICIndex = CharacterSkinMaterialID;

		if ( CharacterSkinVariants.Length > 0 )
		{
			KFP.Mesh.SetMaterial(CharacterSkinMaterialID, CharacterSkinVariants[Rand(CharacterSkinVariants.Length)]);
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
		KFP.BodyMIC = KFP.Mesh.CreateAndSetMaterialInstanceConstant(BodyMICIndex);
	}
}

defaultproperties
{
	//GoreMeshLOD=-1
	ExplosionGibScale=1.f
	ExplosionImpulseScale=1.f

	NumPlayersScale_BodyHealth=1.f
	NumPlayersScale_HeadHealth=0.f
}
