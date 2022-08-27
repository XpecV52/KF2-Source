//=============================================================================
// KFWeapDef_Hemogoblin
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Hemogoblin extends KFWeaponDefinition
    abstract;

DefaultProperties
{
    WeaponClassPath="KFGameContent.KFWeap_Rifle_Hemogoblin"

    BuyPrice=1100 //1100
    AmmoPricePerMag=40 //40
    ImagePath="WEP_UI_Bleeder_TEX.UI_WeaponSelect_Bleeder"

    EffectiveRange=90
}