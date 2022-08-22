//=============================================================================
// KFDT_BloatPuke
//=============================================================================
// Any bio-chemical substance that burns or causes cell damage
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_BloatPuke extends KFDT_Toxic
	abstract
	hidedropdown;

defaultproperties
{
   bNoInstigatorDamage=True
   bConsideredIndirectOrAoE=True
   DoT_Duration=12.000000
   DoT_DamageScale=0.083333
   PoisonPower=0.000000
   Name="Default__KFDT_BloatPuke"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
