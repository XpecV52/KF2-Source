//=============================================================================
// KFDT_Ballistic_HRG_SonicGun_SonicBlastHalfCharged
//=============================================================================
// Sonic Boom impact damage for the HRG Sonic Gun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================
class KFDT_Ballistic_HRG_SonicGun_SonicBlastHalfCharged extends KFDT_Ballistic_Rifle
	abstract
	hidedropdown;

/** Play damage type specific impact effects when taking damage */
static function PlayImpactHitEffects(KFPawn P, vector HitLocation, vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator)
{
	// Play burn effect when dead
	if (P.bPlayedDeath && P.WorldInfo.TimeSeconds > P.TimeOfDeath)
	{
		return;
	}

	super.PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_SonicGun'
   bHasToSpawnMicrowaveFire=False
   EffectGroup=FXG_MicrowaveBlast
   StumblePower=50.000000
   GunHitPower=60.000000
   MicrowavePower=50.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Sharpshooter'
   OverrideImpactEffect=ParticleSystem'WEP_Microwave_Assault_EMIT.FX_Microwave_Assault_Impact'
   OverrideImpactSound=AkEvent'WW_WEP_SA_DragonsBreath.Play_Bullet_DragonsBreath_Impact_Dirt'
   bExtraMomentumZ=True
   ArmorDamageModifier=1.500000
   KDamageImpulse=0.000000
   RadialDamageImpulse=5000.000000
   Name="Default__KFDT_Ballistic_HRG_SonicGun_SonicBlastHalfCharged"
   ObjectArchetype=KFDT_Ballistic_Rifle'kfgamecontent.Default__KFDT_Ballistic_Rifle'
}
