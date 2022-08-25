//=============================================================================
// KFSkinTypeEffects
//=============================================================================
// Defines content used for hit effects based on surface (e.g. Skin type),
// as well as damage type (aka EffectDamageGroup).
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
	FXG_ShieldBash,
	FXG_MetalMace,
    FXG_Flare,
	FXG_Freeze
};
const FXG_MAX = 16; //!! Update me when the enum gets modified !!

struct native SkinEffectInfo
{
	/** type for readability in editor */
	var() editoronly editconst EEffectDamageGroup Type;

	/** particle system used for this impact */
	var() ParticleSystem DefaultParticle;

	/** If true, attach particle to the hit bone (e.g. fire) */
	var() bool bAttachParticle<DisplayName=Attach FX To Hit Bone | EditCondition=!bAttachToHitLocation>;
	/** If true, attach particle to hit bone but offset to the location of the hit (e.g. electricity) */
	var() bool bAttachToHitLocation<DisplayName=Attach FX to Hit Location | EditCondition=!bAttachParticle>;

	/** Sound used for this impact */
	var() AkEvent DefaultSound;
	/** Sounds used for local player (1st person) impacts only */
	var() AKEvent LocalSound;
	/** Sound played when I'm the one taking damage */
	var() AkEvent LocalTakeHitSound;
};

/** Container for effects per type of damage/weapon */
var() SkinEffectInfo ImpactFXArray[FXG_MAX];

/** Dynamic container for additional modability */
var() array<SkinEffectInfo> CustomEffects;

/** The minimum time between mesh attached impact particle effect (optimization) */
var config float ImpactParticleEffectInterval; // Default=0.5
/** The minimum time between mesh attached impact sound (optimization) */
var float ImpactSoundInterval;

//-----------------------------------------------------------------------------
// cpptext.

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Plays clientside particle effect based on damage type  */
function PlayImpactParticleEffect(KFPawn P, vector HitLocation, vector HitDirection, byte HitZoneIndex, EEffectDamageGroup EffectGroup)
{
	local ParticleSystem ParticleTemplate;

	ParticleTemplate = GetImpactParticleEffect(EffectGroup);
	if ( ParticleTemplate == None )
	{
		return;
	}

	if ( ImpactFXArray[EffectGroup].bAttachParticle ) // Spawn effect and attach to bone
	{
		AttachEffectToBone( P, ParticleTemplate, HitZoneIndex );
	}
	else if( ImpactFXArray[EffectGroup].bAttachToHitLocation ) // Spawn effect and attach to bone with offset
	{
		AttachEffectToHitLocation( P, ParticleTemplate, HitZoneIndex, HitLocation, HitDirection );
	}
	else // Spawn effect, no attachment
	{
		switch(EffectGroup)
		{
			case FXG_Bludgeon:
			case FXG_Piercing:
			case FXG_Slashing:
			case FXG_SawBlade:
				MeleeSpawnEffect(P , ParticleTemplate, HitLocation, HitDirection );
				break;
			default:
				DefaultSpawnEffect(P , ParticleTemplate, HitLocation, HitDirection );
				break;
		}
	}
}

function ParticleSystemComponent AttachEffectToBone( KFPawn P, ParticleSystem ParticleTemplate, int HitZoneIndex )
{
	local name HitBoneName;
	local ParticleSystemComponent PSC;

	// make sure enough time passes between spawning emitters
	if( (P.WorldInfo.TimeSeconds - P.LastImpactParticleEffectTime) < ImpactParticleEffectInterval )
	{
		return None;
	}
	P.LastImpactParticleEffectTime = P.WorldInfo.TimeSeconds;

	HitBoneName = (HitZoneIndex != 255 && HitZoneIndex < P.HitZones.Length) ? P.HitZones[HitZoneIndex].BoneName : P.TorsoBoneName;
	PSC = P.WorldInfo.ImpactFXEmitterPool.SpawnEmitterMeshAttachment(ParticleTemplate, P.Mesh, HitBoneName, false);

	// Make the particle system ignore bone rotation
	PSC.SetAbsolute(false, true, true);
	return PSC;
}

/** Attaches effect to nearest bone. Doesn't not account for rotation. Can be overridden for different effects. */
function ParticleSystemComponent AttachEffectToHitLocation( KFPawn P, ParticleSystem ParticleTemplate, int HitZoneIndex, vector HitLocation, vector HitDirection )
{
	local name HitBoneName;
	local int HitBoneIdx;
	local vector BoneSpaceHitLocation, EmitterLocationOffset;
	local ParticleSystemComponent PSC;

	// make sure enough time passes between spawning emitters
	if( (P.WorldInfo.TimeSeconds - P.LastImpactParticleEffectTime) < ImpactParticleEffectInterval )
	{
		return None;
	}

	// HitZone==255 is unsupported for this type
	if ( HitZoneIndex != 255 && HitZoneIndex < P.HitZones.Length )
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

			if( PSC != none )
			{
				P.LastImpactParticleEffectTime = P.WorldInfo.TimeSeconds;

				// Make the particle system ignore bone rotation
				PSC.SetAbsolute(false, true, true);
				return PSC;
			}
		}
	}
}

/** For melee weapons orient along the hit direction */
function ParticleSystemComponent MeleeSpawnEffect( KFPawn P, ParticleSystem ParticleTemplate, vector HitLocation, vector HitDirection )
{
	local ParticleSystemComponent PSC;

	// Don't spawn more than one effect per frame
	if( (P.WorldInfo.TimeSeconds - P.LastImpactParticleEffectTime) == 0 )
	{
		return None;
	}
	P.LastImpactParticleEffectTime = P.WorldInfo.TimeSeconds;

	// START DEBUG
	//P.DrawDebugLine(HitLocation - HitDirection*20, HitLocation + HitDirection*20, 255, 0, 255, true);
	// END DEBUG

	PSC = P.WorldInfo.ImpactFXEmitterPool.SpawnEmitter(ParticleTemplate, HitLocation, rotator(-HitDirection));
	if( PSC != none )
	{
		PSC.SetLightingChannels(P.PawnLightingChannel);
	}
	return PSC;
}

/** For normal bullet type weapons orient perpendicular to HitDirection */
function ParticleSystemComponent DefaultSpawnEffect( KFPawn P, ParticleSystem ParticleTemplate, vector HitLocation, vector HitDirection )
{
	local vector EmitterDir, EmitterDirRight, EmitterDirLeft, RelativeHitLoc;
	local ParticleSystemComponent PSC;

	// Don't spawn more than one effect per frame if on low detail
	if( P.WorldInfo.bDropDetail || P.WorldInfo.GetDetailMode() == DM_Low )
	{
		if( (P.WorldInfo.TimeSeconds - P.LastImpactParticleEffectTime) == 0 )
		{
			return None;
		}
		P.LastImpactParticleEffectTime = P.WorldInfo.TimeSeconds;
	}

	//P.DrawDebugLine(HitLocation - HitDirection*20, HitLocation + HitDirection*20, 255, 0, 0, true);

	// orient the effect perpendicular to HitDirection and away from the victim to make it more noticeable
	HitDirection.Z = 0.f;
	EmitterDirRight = HitDirection cross vect(0,0,1);
	EmitterDirLeft = -EmitterDirRight;
	RelativeHitLoc = HitLocation - P.Location;
	EmitterDir = EmitterDirRight dot RelativeHitLoc >= 0 ? EmitterDirRight : EmitterDirLeft;

	PSC = P.WorldInfo.ImpactFXEmitterPool.SpawnEmitter(ParticleTemplate, HitLocation, rotator(EmitterDir));
	if( PSC != none )
	{
		PSC.SetLightingChannels(P.PawnLightingChannel);
	}
	return PSC;
}

/** returns the impact particle that should be played */
function ParticleSystem GetImpactParticleEffect(EEffectDamageGroup EffectGroup)
{
	return ImpactFXArray[EffectGroup].DefaultParticle;
}

/** Play an impact sound on taking damage */
function PlayTakeHitSound(KFPawn P, vector HitLocation, Pawn DamageCauser, EEffectDamageGroup EffectGroup)
{
	local AKEvent ImpactSound;
	local float ArmorPct;

	if ( P.ActorEffectIsRelevant(DamageCauser, false, 4000.f) )
	{
		// make sure enough time passes between playing sounds
		if( (P.WorldInfo.TimeSeconds - P.LastImpactSoundTime) < ImpactSoundInterval )
		{
			return;
		}

		ImpactSound = GetImpactSound(EffectGroup, DamageCauser, P);

		if (ShouldSetArmorValue(P, ArmorPct))
		{
			P.Controller.SetRTPCValue('Armor_Level', ArmorPct, true);
		}

		if( ImpactSound != none )
		{
			P.LastImpactSoundTime = P.WorldInfo.TimeSeconds;
			P.PlaySoundBase(ImpactSound, true,,, HitLocation);
		}
	}
}

/** returns the impact sound that should be played */
function AkEvent GetImpactSound(EEffectDamageGroup EffectGroup, Pawn DamageCauser, Pawn HitPawn)
{
	// handle local player sounds
	if ( ImpactFXArray[EffectGroup].LocalSound != None && DamageCauser != none
		&& DamageCauser.IsLocallyControlled() && DamageCauser.IsHumanControlled() )
	{
		return ImpactFXArray[EffectGroup].LocalSound;
	}
	else if (HitPawn.Controller != none && HitPawn.Controller.IsLocalController() && ImpactFXArray[EffectGroup].LocalTakeHitSound != none)
	{
		return ImpactFXArray[EffectGroup].LocalTakeHitSound;
	}

	return ImpactFXArray[EffectGroup].DefaultSound;
}

function bool ShouldSetArmorValue(Pawn HitPawn, out float ArmorPct)
{
	local KFPawn_Human KFPH;

	KFPH = KFPawn_Human(HitPawn);
	if (KFPH != none && KFPH.Controller != none && KFPH.Controller.IsLocalController() && KFPH.Armor > 0)
	{
		ArmorPct = float(KFPH.Armor) / float(KFPH.MaxArmor);
		return true;
	}

	return false;
}

defaultproperties
{
   ImpactParticleEffectInterval=0.500000
   ImpactSoundInterval=0.050000
   Name="Default__KFSkinTypeEffects"
   ObjectArchetype=Object'Core.Default__Object'
}
