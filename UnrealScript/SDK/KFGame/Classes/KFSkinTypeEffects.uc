//=============================================================================
// KFSkinTypeEffects
//=============================================================================
// Defines content used for hit effects based on surface (e.g. Skin type),
// damage type (aka EffectDamageGroup), and vulnerability.  There are more
// types of effects contained in the DamageType (e.g. Decals), but only
// these vary based on hit zone/location.
//
// Similar to the KFImpactEffectInfo and PhysicalMaterial system,
// but specifically tailored to characters rather than world.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFSkinTypeEffects extends Object
	hidecategories(Object)
	config(Engine)
	native(Effect);

/** Abstracted DamageType categories useful for effect types */
enum EEffectDamageGroup
{
	FXG_Ballistic,
	FXG_Bludgeon,
	FXG_Piercing,
	FXG_Slashing,
	FXG_Fire,
	FXG_Toxic,	
	FXG_Healing,
	FXG_Sawblade,
	FXG_DrainLife,
	FXG_IncendiaryRound,
	FXG_UnexplodedGrenade,
	FXG_MicrowaveBlast,
};

struct native SkinEffectInfo
{
	/** type for readability in editor */
	var() editoronly editconst EEffectDamageGroup Type;

	/** particle system used for this impact */
	var() ParticleSystem DefaultParticle;
	var() ParticleSystem VulnerableParticle;
	var() ParticleSystem ResistantParticle;

	/** If true, attach particle to the hit bone (e.g. fire) */
	var() bool bAttachParticle<DisplayName=Attach FX To Hit Bone | EditCondition=!bAttachToHitLocation>;

	/** If true, attach particle to hit bone but offset to the location of the hit (e.g. electricity) */
	var() bool bAttachToHitLocation<DisplayName=Attach FX to Hit Location | EditCondition=!bAttachParticle>;

	/** Sound used for this impact */
	var() AkEvent DefaultSound;

	/** Sounds used for local player (1st person) impacts only */
	var() AKEvent LocalSound;
	//var() AkEvent LocalVulnerableSound;
	//var() AkEvent LocalResistantSound;
};

/** Container for effects per type of damage/weapon */
var() editfixedsize array<SkinEffectInfo> ImpactFX;

/** Dynamic container for additional modability */
var() array<SkinEffectInfo> CustomEffects;

/** The minimum time between mesh attached impact particle effect (optimization) */
var config float ImpactParticleEffectInterval; // Default=0.5
/** The minimum time between mesh attached impact sound (optimization) */
var float ImpactSoundInterval;

/** 
 * Determines what severity of effect to play based on victim and DamageType.
 * Not to be confused with locational damage (aka hit zone DamageScale)  
 */
enum EImpactEffectMode
{
	FXM_Neutral,
	FXM_Vulnerable,
	FXM_Resistant,
};

//-----------------------------------------------------------------------------
// cpptext.

cpptext
{
	/** Resizes the ImpactFX array when new EffectGroups are added */
	virtual void PostLoad();
}

/** Plays clientside particle effect based on damage type  */
function PlayImpactParticleEffect(KFPawn P, vector HitLocation, vector HitDirection, byte HitZoneIndex, EEffectDamageGroup EffectGroup, EImpactEffectMode EffectMode)
{
	local ParticleSystem ParticleTemplate;

	ParticleTemplate = GetImpactParticleEffect(EffectGroup, EffectMode);
	
	if ( ImpactFX[EffectGroup].bAttachParticle ) // Spawn effect and attach to bone
	{
		AttachEffectToBone( P, ParticleTemplate, HitZoneIndex );
	}
	else if( ImpactFX[EffectGroup].bAttachToHitLocation ) // Spawn effect and attach to bone with offset
	{
		AttachEffectToHitLocation( P, ParticleTemplate, HitZoneIndex, HitLocation, HitDirection );
	}
	else // Spawn effect, no attachment
	{
		DefaultSpawnEffect(P , ParticleTemplate, HitLocation, HitDirection );
	}
}

function AttachEffectToBone( KFPawn P, ParticleSystem ParticleTemplate, int HitZoneIndex )
{
	local name HitBoneName;
	local ParticleSystemComponent PSC;

	// make sure enough time passes between spawning emitters
	if( `TimeSinceEx(P, P.LastImpactParticleEffectTime) < ImpactParticleEffectInterval )
	{
		return;
	}
	P.LastImpactParticleEffectTime = P.WorldInfo.TimeSeconds;

	HitBoneName = (HitZoneIndex != 255) ? P.HitZones[HitZoneIndex].BoneName : P.TorsoBoneName;
	PSC = P.WorldInfo.ImpactFXEmitterPool.SpawnEmitterMeshAttachment(ParticleTemplate, P.Mesh, HitBoneName, false);

	// Make the particle system ignore bone rotation
	PSC.SetAbsolute(false, true, true);
}

/** Attaches effect to nearest bone. Doesn't not account for rotation. Can be overridden for different effects. */
function AttachEffectToHitLocation( KFPawn P, ParticleSystem ParticleTemplate, int HitZoneIndex, vector HitLocation, vector HitDirection )
{
	local name HitBoneName;
	local int HitBoneIdx;
	local vector BoneSpaceHitLocation, EmitterLocationOffset;
	local ParticleSystemComponent PSC;

	// make sure enough time passes between spawning emitters
	if( `TimeSinceEx(P, P.LastImpactParticleEffectTime) < ImpactParticleEffectInterval )
	{
		return;
	}

	// HitZone==255 is unsupported for this type
	if ( HitZoneIndex != 255 )
	{
		HitBoneName = P.HitZones[HitZoneIndex].BoneName;
		HitBoneIdx = P.Mesh.MatchRefBone(HitBoneName);

		if( HitBoneIdx != INDEX_NONE )
		{
			// Transform the hit location to the coordinate system of the hit bone
			BoneSpaceHitLocation = InverseTransformVector(P.Mesh.GetBoneMatrix(HitBoneIdx), HitLocation);		

			// Now that we have the bone space hit location, the offset is = BoneSpaceHitLocation - vect(0,0,0)
			EmitterLocationOffset = BoneSpaceHitLocation;	

			PSC = P.WorldInfo.ImpactFXEmitterPool.SpawnEmitterMeshAttachment(
												ParticleTemplate, 
												P.Mesh, 
												HitBoneName, 
												false, 
												EmitterLocationOffset);

			P.LastImpactParticleEffectTime = P.WorldInfo.TimeSeconds;

			// Make the particle system ignore bone rotation
			PSC.SetAbsolute(false, true, true);
		}
	}
}

function DefaultSpawnEffect( KFPawn P, ParticleSystem ParticleTemplate, vector HitLocation, vector HitDirection )
{
	local vector EmitterDir, EmitterDirRight, EmitterDirLeft, RelativeHitLoc;
	local ParticleSystemComponent PSC;

	// Don't spawn more than one effect per frame if on low detail
	if( P.WorldInfo.bDropDetail || P.WorldInfo.GetDetailMode() == DM_Low )
	{
		if( `TimeSinceEx(P, P.LastImpactParticleEffectTime) == 0 )
		{
			return;
		}
		P.LastImpactParticleEffectTime = P.WorldInfo.TimeSeconds;
	}

	// START DEBUG
	// DrawDebugLine(HitLocation - HitDirection*20, HitLocation + HitDirection*20, 255, 0, 0, true);
	// END DEBUG		

	// orient the effect perpendicular to HitDirection and away from the victim to make it more noticeable
	HitDirection.Z = 0.f;
	EmitterDirRight = HitDirection cross vect(0,0,1);
	EmitterDirLeft = -EmitterDirRight;
	RelativeHitLoc = HitLocation - P.Location;
	EmitterDir = EmitterDirRight dot RelativeHitLoc >= 0 ? EmitterDirRight : EmitterDirLeft;

	// NVCHANGE_BEGIN: JCAO - Apply the lightingChannel for the particle from the pawn
	PSC = P.WorldInfo.ImpactFXEmitterPool.SpawnEmitter(ParticleTemplate, HitLocation, rotator(EmitterDir));
	PSC.SetLightingChannels(P.PawnLightingChannel);
	// NVCHANGE_END: JCAO - Apply the lightingChannel for the particle from the pawn
}

/** returns the impact particle that should be played */
function ParticleSystem GetImpactParticleEffect(EEffectDamageGroup EffectGroup, EImpactEffectMode EffectMode)
{
	switch(EffectMode)
	{
		case FXM_Vulnerable:
			if ( ImpactFX[EffectGroup].VulnerableParticle != None )
			{
				return ImpactFX[EffectGroup].VulnerableParticle;
			}
			break;
		case FXM_Resistant:
			if ( ImpactFX[EffectGroup].ResistantParticle != None )
			{
				return ImpactFX[EffectGroup].ResistantParticle;
			}
			break;
	}

	return ImpactFX[EffectGroup].DefaultParticle;
}

/** Play an impact sound on taking damage */
function PlayTakeHitSound(KFPawn P, vector HitLocation, Pawn DamageCauser, EEffectDamageGroup EffectGroup, EImpactEffectMode EffectMode)
{
	local AKEvent ImpactSound;	

	if ( P.ActorEffectIsRelevant(DamageCauser, false, 4000.f) )
	{
		// make sure enough time passes between playing sounds
		if( `TimeSinceEx(P, P.LastImpactSoundTime) < ImpactSoundInterval )
		{
			return;
		}

		ImpactSound = GetImpactSound(EffectGroup, DamageCauser, EffectMode);

        if( ImpactSound != none )
        {
			P.LastImpactSoundTime = P.WorldInfo.TimeSeconds;
            P.PlaySoundBase(ImpactSound, true,,, HitLocation);
        }
	}
}

/** returns the impact sound that should be played */
function AkEvent GetImpactSound(EEffectDamageGroup EffectGroup, Pawn DamageCauser, EImpactEffectMode EffectMode)
{
	// handle local player sounds
	if ( ImpactFX[EffectGroup].LocalSound != None && DamageCauser != none 
		&& DamageCauser.IsLocallyControlled() && DamageCauser.IsHumanControlled() )
	{
		//switch(EffectMode)
		//{
		//	case FXM_Vulnerable:
		//		if ( ImpactFX[EffectGroup].LocalVulnerableSound != None )
		//		{
		//			return ImpactFX[EffectGroup].LocalVulnerableSound;
		//		}
		//		break;
		//	case FXM_Resistant:
		//		if ( ImpactFX[EffectGroup].LocalResistantSound != None )
		//		{
		//			return ImpactFX[EffectGroup].LocalResistantSound;
		//		}
		//		break;
		//}

		return ImpactFX[EffectGroup].LocalSound;
	}

	return ImpactFX[EffectGroup].DefaultSound;
}

defaultproperties
{
	//ImpactParticleEffectInterval=0.5
	ImpactSoundInterval=0.05
}

