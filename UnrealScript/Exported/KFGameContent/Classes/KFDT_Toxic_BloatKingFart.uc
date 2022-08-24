//=============================================================================
// KFDT_Toxic_BloatKingFart
//=============================================================================
// Bloat King fart gas attack damagetype
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFDT_Toxic_BloatKingFart extends KFDT_Toxic
    abstract
    hidedropdown;

defaultproperties
{
   bNoInstigatorDamage=True
   bConsideredIndirectOrAoE=True
   DoT_Type=DOT_None
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_Puke_Light'
   Name="Default__KFDT_Toxic_BloatKingFart"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
