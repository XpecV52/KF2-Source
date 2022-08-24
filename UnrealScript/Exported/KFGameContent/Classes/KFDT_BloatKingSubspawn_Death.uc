//=============================================================================
// KFDT_BloatKingSubspawn_Death
//=============================================================================
// Bloat King poop monster death attack damagetype
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFDT_BloatKingSubspawn_Death extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   bNoInstigatorDamage=True
   bConsideredIndirectOrAoE=True
   Name="Default__KFDT_BloatKingSubspawn_Death"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
