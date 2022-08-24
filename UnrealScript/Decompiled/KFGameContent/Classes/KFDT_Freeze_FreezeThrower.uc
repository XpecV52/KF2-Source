/*******************************************************************************
 * KFDT_Freeze_FreezeThrower generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Freeze_FreezeThrower extends KFDT_Freeze
    abstract;

static function PlayImpactHitEffects(KFPawn P, Vector HitLocation, Vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator)
{
    local float ParamValue;

    if((P.bPlayedDeath && P.CharacterMICs.Length > 0) && P.CharacterMICs[0].GetScalarParameterValue('Scalar_Ice', ParamValue))
    {
        if(ParamValue == float(0))
        {
            PlayShatter(P, false, (P.WorldInfo.TimeSeconds - P.TimeOfDeath) > 0.5, HitDirection * default.KDeathVel);
            return;
        }
    }
    super(KFDamageType).PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);
}

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_FreezeThrower'
    DoT_Type=EDamageOverTimeGroup.DOT_Fire
    MeleeHitPower=20
    FreezePower=12.5
    ModifierPerkList=/* Array type was not detected. */
    KDeathVel=300
}