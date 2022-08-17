//=============================================================================
// KFDT_NoGoVolume
//=============================================================================
// Damage caused by sitting in NoGoVolumes for too long
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// Christian "schneidzekk" Schneider
//=============================================================================

class KFDT_NoGoVolume extends KFDamageType
	abstract;

defaultproperties
{
   OverrideImpactEffect=ParticleSystem'ZED_Hans_EMIT.FX_Hans_Life_Draw_01'
   bArmorStops=False
   bCausedByWorld=True
   Name="Default__KFDT_NoGoVolume"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
