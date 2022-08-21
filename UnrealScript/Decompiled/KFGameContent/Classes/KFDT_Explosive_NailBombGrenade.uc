/*******************************************************************************
 * KFDT_Explosive_NailBombGrenade generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Explosive_NailBombGrenade extends KFDT_Explosive
    abstract;

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_Grenade_Gunslinger'
    bShouldSpawnPersistentBlood=true
    StunPower=200
    StumblePower=500
    MeleeHitPower=100
    KDeathVel=300
    KDeathUpKick=1000
    RadialDamageImpulse=3000
}