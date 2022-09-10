/*******************************************************************************
 * KFDT_Explosive_HRGWinterbite generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Explosive_HRGWinterbite extends KFDT_Freeze
    abstract;

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_HRGWinterbite'
    bNoInstigatorDamage=true
    bShouldSpawnPersistentBlood=true
    StumblePower=25
    FreezePower=25
    ModifierPerkList=/* Array type was not detected. */
    GibImpulseScale=0.15
    KDeathVel=300
    KDeathUpKick=700
}