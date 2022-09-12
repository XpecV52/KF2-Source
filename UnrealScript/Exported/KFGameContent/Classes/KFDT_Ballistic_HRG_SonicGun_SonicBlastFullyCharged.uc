//=============================================================================
// KFDT_Ballistic_HRG_SonicGun_SonicBlastFullyCharged
//=============================================================================
// Sonic Boom impact damage for the HRG Sonic Gun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================
class KFDT_Ballistic_HRG_SonicGun_SonicBlastFullyCharged extends KFDT_Ballistic_Rifle
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
   StumblePower=250.000000
   GunHitPower=120.000000
   MicrowavePower=25.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Sharpshooter'
   OverrideImpactEffect=ParticleSystem'WEP_HRG_SonicGun_EMIT.FX_SonicGun_Impact_AltFire'
   OverrideImpactSound=AkEvent'WW_WEP_HRG_SonicGun.Play_WEP_HRG_SonicGun_Hit_Surface'
   bExtraMomentumZ=True
   ArmorDamageModifier=1.500000
   KDamageImpulse=0.000000
   RadialDamageImpulse=5000.000000
   Name="Default__KFDT_Ballistic_HRG_SonicGun_SonicBlastFullyCharged"
   ObjectArchetype=KFDT_Ballistic_Rifle'kfgamecontent.Default__KFDT_Ballistic_Rifle'
}
