//=============================================================================
// KFDT_SwingMinigame
//=============================================================================
// Damage caused by the Swing minigame in the Summer Sideshow.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// Dan Weiss
//=============================================================================

class KFDT_SwingMinigame extends KFDamageType;

static function PlayImpactHitEffects(KFPawn P, vector HitLocation, vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator)
{
    //Volume hit that this is used for was throwing all sorts of screwy hit locations.  Use the Pawn's location instead.
    super.PlayImpactHitEffects(P, P.Location, HitDirection, HitZoneIndex, HitInstigator);
}

defaultproperties
{
   bIsTrapDamage=True
   GoreDamageGroup=DGT_Explosive
   GibImpulseScale=0.150000
   OverrideImpactEffect=ParticleSystem'FX_Environmental_EMIT_THREE.FX_Swing_Ride_Bloodhit_01'
   OverrideImpactSound=AkEvent'WW_ENV_Summer_Sideshow.Play_SS_Swing_Flesh_Hit'
   bArmorStops=False
   KDamageImpulse=1000.000000
   KDeathUpKick=55.000000
   Name="Default__KFDT_SwingMinigame"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
