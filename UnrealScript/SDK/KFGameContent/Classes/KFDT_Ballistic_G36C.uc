//=============================================================================
// KFDT_Ballistic_G36C
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//
//=============================================================================

class KFDT_Ballistic_G36C extends KFDT_Ballistic_AssaultRifle
	abstract
	hidedropdown;

/** G36C has still to play a metal effect if impacting metal. (and we demoted to impact on Flesh) */
var ParticleSystem MetalImpactEffect;
var AkEvent MetalImpactSound;

static function PlayImpactHitEffects( KFPawn P, vector HitLocation, vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator )
{
	local KFSkinTypeEffects SkinType, OriginalSkinType, FleshSkinType;
	local int i;

	if ( P.CharacterArch != None && default.EffectGroup < FXG_Max )
	{
		// Search if affected target has Flesh skin type
		for (i = 0; i < P.CharacterArch.ImpactSkins.Length ; ++i)
		{
		 	if (P.CharacterArch.ImpactSkins[i].Name == 'Flesh'
			 	|| P.CharacterArch.ImpactSkins[i].Name == 'Tough_Flesh')
			{
				FleshSkinType = P.CharacterArch.ImpactSkins[i];
				break;
			}
		}

		SkinType = P.GetHitZoneSkinTypeEffects( HitZoneIndex );
		OriginalSkinType = SkinType;

		// If we don't hit flesh or shield, try to demote to Flesh
		if (SkinType != none && SkinType.Name != 'Flesh' && SkinType.Name != 'Tough_Flesh' && SkinType.Name != 'ShieldEffects')
		{
			// We default to none as we don't want bullet to ricochet if any
			SkinType = none;

			// Demote to flesh skin hit
			if (FleshSkinType != none)
			{
				SkinType = FleshSkinType;
			}
		}
		
		// If we hit metal we have to make sure we play it's Metal impact effect (this effect doesn't contain bullet ricochet) (don't play sound though!)
		if (OriginalSkinType != none && (OriginalSkinType.Name == 'Metal' || OriginalSkinType.Name == 'Machine'))
		{
			OriginalSkinType.PlayImpactParticleEffect(P, HitLocation, HitDirection, HitZoneIndex, default.EffectGroup, default.MetalImpactEffect);
			OriginalSkinType.PlayTakeHitSound(P, HitLocation, HitInstigator, default.EffectGroup, default.MetalImpactSound);
		}

		if (SkinType != none)
		{
			SkinType.PlayImpactParticleEffect(P, HitLocation, HitDirection, HitZoneIndex, default.EffectGroup);
			SkinType.PlayTakeHitSound(P, HitLocation, HitInstigator, default.EffectGroup);
		}
	}
}

defaultproperties
{
    KDamageImpulse=900
	KDeathUpKick=-300
	KDeathVel=100

	DamageModifierAP=0.8f
	ArmorDamageModifier=15.0f
	
	StumblePower=15
	GunHitPower=15

	WeaponDef=class'KFWeapDef_G36C'

	//Perk
	ModifierPerkList(0)=class'KFPerk_Swat'

	MetalImpactEffect=ParticleSystem'FX_Impacts_EMIT.FX_Wep_Impact_MetalArmor_E'
	MetalImpactSound=AkEvent'WW_Skin_Impacts.Play_Slashing_Metal_3P'
}
