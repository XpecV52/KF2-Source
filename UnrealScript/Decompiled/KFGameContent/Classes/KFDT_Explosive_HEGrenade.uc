/*******************************************************************************
 * KFDT_Explosive_HEGrenade generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Explosive_HEGrenade extends KFDT_Explosive
    abstract;

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_Grenade_Commando'
    bShouldSpawnPersistentBlood=true
    KnockdownPower=0
    StumblePower=120
    ObliterationHealthThreshold=-250
    ObliterationDamageThreshold=250
    KDeathVel=300
    KDeathUpKick=1000
    RadialDamageImpulse=3000
}