/*******************************************************************************
 * KFDT_Fire_MolotovGrenade generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Fire_MolotovGrenade extends KFDT_Fire
    abstract;

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_Grenade_Firebug'
    bIgnoreSelfInflictedScale=false
    DoT_DamageScale=0.2
    StumblePower=100
    BurnPower=10
}