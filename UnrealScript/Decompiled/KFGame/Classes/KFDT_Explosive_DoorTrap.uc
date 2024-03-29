/*******************************************************************************
 * KFDT_Explosive_DoorTrap generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Explosive_DoorTrap extends KFDT_Explosive
    abstract;

defaultproperties
{
    bShouldSpawnPersistentBlood=true
    KnockdownPower=300
    StumblePower=500
    ModifierPerkList(0)=class'KFPerk_Demolitionist'
    KDeathVel=300
    KDeathUpKick=1000
    RadialDamageImpulse=3000
}