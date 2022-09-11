/*******************************************************************************
 * KFDT_Toxic_MineReconstructorExplosion generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Toxic_MineReconstructorExplosion extends KFDT_Toxic
    abstract;

static function ApplySecondaryDamage(KFPawn Victim, int DamageTaken, optional Controller InstigatedBy)
{
    if(Class'KFDT_Mine_Reconstructor_BileExplosionDoT'.default.DoT_Type != 0)
    {
        Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, Class'KFDT_Mine_Reconstructor_BileExplosionDoT');
    }
}

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_Mine_Reconstructor'
    bHasToSpawnMicrowaveFire=false
    DoT_Duration=4
    KnockdownPower=50
    StumblePower=200
    PoisonPower=60
    MicrowavePower=50
    ModifierPerkList=/* Array type was not detected. */
}