//=============================================================================
// KFDT_GoompaStomp
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_GoompaStomp extends KFDamageType;

defaultproperties
{
    RadialDamageImpulse = 1000.f // This controls how much impulse is applied to gibs when exploding
	bUseHitLocationForGibImpulses = false // This will make the impulse origin where the victim was hit for directional gibs
	bPointImpulseTowardsOrigin = true // This creates an impulse direction aligned along hitlocation and pawn location -- this will push all gibs in the same direction
	ImpulseOriginScale = 100.f // Higher means more directional gibbing, lower means more outward (and upward) gibbing
	ImpulseOriginLift = 150.f
	MaxObliterationGibs = 12 // Maximum number of gibs that can be spawned by obliteration, 0=MAX
	bCanGib = true
	bCanObliterate = true
	ObliterationHealthThreshold = 0
	ObliterationDamageThreshold = 1
	bIgnoreAggroOnDamage=true
}
