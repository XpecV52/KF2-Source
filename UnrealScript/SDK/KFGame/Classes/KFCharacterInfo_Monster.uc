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
	hidecategories(Object)
	native(Pawn);

/** Character mesh to use */
var(ThirdPerson) SkeletalMesh CharacterMesh<DisplayName=Body Mesh>;

var(ThirdPerson) array<MaterialInterface> PlayerControlledSkins;
var(ThirdPerson) array<MaterialInterface> PlayerControlledGoreSkins;

/** Aggressively optimized mesh for the server with minimal bones */
var(Server) SkeletalMesh ServerMesh;

/** Additional material IDs that require MICs for gameplay material params */
var(Effects) array<int> ExtraMICIndices;

/************************************************************************/
/*  Audio                                                   */
/************************************************************************/

struct native DoorSoundFx
{
	var() AkEvent Metal;
	var() AkEvent Wood;
};

var(Effects) DoorSoundFx		DoorHitSound;

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

/** Particle effect to be spawned when knocked down, stunned, etc */
var(Effects) ParticleSystem DazedEffectTemplate<DisplayName=Stunned/Knocked Down Effect Template>;

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
	local int i;
	local int MaterialIndex;

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

		// Use material specified in the mesh asset
		// @note: need to add this if we allow character swap post-spawn (e.g. customization)
		//for( i=0; i<KFP.Mesh.GetNumElements(); i++ )
		//{
		//	KFP.Mesh.SetMaterial(i, none);
		//}

		if ( KFP.UsePlayerControlledZedSkin() )
		{
			for( i=0; i < PlayerControlledSkins.Length; i++ )
			{
				KFP.Mesh.SetMaterial(i, PlayerControlledSkins[i]);
			}
		}
	}

	// Initialize MICs
	if( KFP.WorldInfo.NetMode != NM_DedicatedServer && KFP.Mesh != None )
	{
		KFP.CharacterMICs.Length = 0;
		KFP.CharacterMICs[0] = KFP.Mesh.CreateAndSetMaterialInstanceConstant(0);

		foreach ExtraMICIndices(MaterialIndex)
		{
			KFP.CharacterMICs.AddItem(KFP.Mesh.CreateAndSetMaterialInstanceConstant(MaterialIndex));
		}
	}
}

defaultproperties
{
	//GoreMeshLOD=-1
	ExplosionGibScale=1.f
	ExplosionImpulseScale=1.f
}
