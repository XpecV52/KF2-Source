/*******************************************************************************
 * KFDT_Slashing_IonThruster generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Slashing_IonThruster extends KFDT_Slashing
    abstract;

var class<KFDamageType> BurnDamageType;

static simulated function bool CanDismemberHitZone(name InHitZoneName)
{
    return true;
}

static simulated function GetBoneToDismember(KFPawn_Monster inPawn, Vector HitDirection, name InHitZoneName, out name OutBoneName)
{
    local KFGame.KFPawn.EPawnOctant SlashDir;
    local KFCharacterInfo_Monster MonsterInfo;

    MonsterInfo = inPawn.GetCharacterMonsterInfo();
    if(MonsterInfo == none)
    {
        return;
    }
    SlashDir = GetLastSlashDirection(inPawn, HitDirection);
    if((SlashDir == 0) || SlashDir == 1)
    {
        if((InHitZoneName == 'chest') || InHitZoneName == 'head')
        {
            if(MonsterInfo.SpecialMeleeDismemberment.bAllowVerticalSplit)
            {
                OutBoneName = ((Rand(2) == 0) ? MonsterInfo.SpecialMeleeDismemberment.LeftShoulderBoneName : MonsterInfo.SpecialMeleeDismemberment.RightShoulderBoneName);
            }
        }        
    }
    else
    {
        if((SlashDir == 2) || SlashDir == 3)
        {
            if(((InHitZoneName == 'chest') || InHitZoneName == 'abdomen') || InHitZoneName == 'stomach')
            {
                if(MonsterInfo.SpecialMeleeDismemberment.bAllowHorizontalSplit)
                {
                    OutBoneName = MonsterInfo.SpecialMeleeDismemberment.SpineBoneName;
                }
            }            
        }
        else
        {
            if((SlashDir == 4) || SlashDir == 7)
            {
                if(InHitZoneName == 'chest')
                {
                    if(MonsterInfo.SpecialMeleeDismemberment.bAllowVerticalSplit)
                    {
                        OutBoneName = MonsterInfo.SpecialMeleeDismemberment.RightShoulderBoneName;
                    }                    
                }
                else
                {
                    if(InHitZoneName == 'head')
                    {
                        if(MonsterInfo.SpecialMeleeDismemberment.bAllowVerticalSplit)
                        {
                            if(Rand(2) == 0)
                            {
                                OutBoneName = MonsterInfo.SpecialMeleeDismemberment.RightShoulderBoneName;
                            }
                        }
                    }
                }                
            }
            else
            {
                if((SlashDir == 5) || SlashDir == 6)
                {
                    if(InHitZoneName == 'chest')
                    {
                        if(MonsterInfo.SpecialMeleeDismemberment.bAllowVerticalSplit)
                        {
                            OutBoneName = MonsterInfo.SpecialMeleeDismemberment.LeftShoulderBoneName;
                        }                        
                    }
                    else
                    {
                        if(InHitZoneName == 'head')
                        {
                            if(MonsterInfo.SpecialMeleeDismemberment.bAllowVerticalSplit)
                            {
                                if(Rand(2) == 0)
                                {
                                    OutBoneName = MonsterInfo.SpecialMeleeDismemberment.LeftShoulderBoneName;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

static simulated function ModifyDismembermentHitImpulse(KFPawn_Monster inPawn, name InHitZoneName, Vector HitDirection, out Vector OutImpulseDir, out Vector OutParentImpulseDir, out float OutImpulseScale, out float OutParentImpulseScale)
{
    local KFGame.KFPawn.EPawnOctant SlashDir;

    SlashDir = GetLastSlashDirection(inPawn, HitDirection);
    if((InHitZoneName == 'head') && (SlashDir == 2) || SlashDir == 3)
    {
        OutImpulseDir += (float(10) * vect(0, 0, 1));
        OutImpulseDir = Normal(OutImpulseDir);
        OutParentImpulseScale = 0;        
    }
    else
    {
        if(((InHitZoneName == 'head') || InHitZoneName == 'chest') && (SlashDir == 0) || SlashDir == 1)
        {
            OutImpulseScale = 0;
            OutParentImpulseScale = 0;
        }
    }
}

static function PlayImpactHitEffects(KFPawn P, Vector HitLocation, Vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator)
{
    if(P.bPlayedDeath && P.WorldInfo.TimeSeconds > P.TimeOfDeath)
    {
        default.BurnDamageType.static.PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);
    }
    super(KFDamageType).PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);
}

static function ApplySecondaryDamage(KFPawn Victim, int DamageTaken, optional Controller InstigatedBy)
{
    if(default.BurnDamageType.default.DoT_Type != 0)
    {
        Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, default.BurnDamageType);
    }
}

defaultproperties
{
    BurnDamageType=Class'KFDT_Fire_IonThrusterDoT'
    WeaponDef=Class'KFGame.KFWeapDef_IonThruster'
    EffectGroup=EEffectDamageGroup.FXG_Slashing_Ion
    GoreDamageGroup=EGoreDamageGroup.DGT_Fire
    MeleeHitPower=75
    BurnPower=25
    ModifierPerkList=/* Array type was not detected. */
    OverrideImpactEffect=ParticleSystem'WEP_Ion_Sword_EMIT.FX_Ion_Sword_Impact'
    KDamageImpulse=1500
    KDeathVel=375
    KDeathUpKick=200
}