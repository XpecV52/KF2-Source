/*******************************************************************************
 * KFDT_Toxic_HansGrenade generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Toxic_HansGrenade extends KFDT_Toxic
    abstract;

static function int GetKillerDialogID()
{
    return 25;
}

defaultproperties
{
    bNoInstigatorDamage=true
    DoT_Type=EDamageOverTimeGroup.DOT_None
}