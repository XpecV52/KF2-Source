/*******************************************************************************
 * KFDT_Sonic generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Sonic extends KFDamageType
    abstract;

static function int GetDamageeDialogID()
{
    return 117;
}

defaultproperties
{
    bCanObliterate=true
    ScreenMaterialName=Effect_Siren
    ObliterationHealthThreshold=-1
    ObliterationDamageThreshold=3
    bArmorStops=false
    KDamageImpulse=1400
    KDeathVel=700
    KDeathUpKick=500
}