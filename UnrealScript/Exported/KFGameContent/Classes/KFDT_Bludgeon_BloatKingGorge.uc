//=============================================================================
// KFDT_Bludgeon_BloatKingGorge
//=============================================================================
// Bloat King gorge attack for players when they finish getting sucked in.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFDT_Bludgeon_BloatKingGorge extends KFDT_Bludgeon
    abstract;

var AkEvent GorgeBiteSound;

static function PlayImpactHitEffects(KFPawn P, vector HitLocation, vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator)
{
	super.PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);

	if (P.Controller != none && P.Controller.IsLocalController())
	{
		P.Controller.PlaySoundBase(default.GorgeBiteSound, true);
	}
}

defaultproperties
{
   GorgeBiteSound=AkEvent'WW_ZED_Abomination.Play_Abomination_Bite'
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_BloodGorge'
   bExtraMomentumZ=True
   KDamageImpulse=700.000000
   KDeathVel=980.000000
   KDeathUpKick=200.000000
   Name="Default__KFDT_Bludgeon_BloatKingGorge"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
