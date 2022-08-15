/*******************************************************************************
 * KFDT_Slashing_Eviscerator generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Slashing_Eviscerator extends KFDT_Slashing
    abstract;

static simulated function bool CanDismemberHitZone(name InHitZoneName)
{
    return true;
}

static simulated function GetBoneToDismember(KFPawn_Monster inPawn, Vector HitDirection, name InHitZoneName, out name OutBoneName)
{
    local KFGame.KFPawn.EPawnOctant SlashDir;
    local MeleeSpecialDismembermentInfo SpecialDismembermentInfo;
    local KFCharacterInfo_Monster MonsterInfo;

    MonsterInfo = inPawn.GetCharacterMonsterInfo();
    if(MonsterInfo != none)
    {
        SpecialDismembermentInfo = MonsterInfo.SpecialMeleeDismemberment;
    }
    SlashDir = GetLastSlashDirection(inPawn, HitDirection);
    if((SlashDir == 0) || SlashDir == 1)
    {
        if((InHitZoneName == 'chest') || InHitZoneName == 'head')
        {
            if(SpecialDismembermentInfo.bAllowVerticalSplit)
            {
                OutBoneName = ((Rand(2) == 0) ? SpecialDismembermentInfo.LeftShoulderBoneName : SpecialDismembermentInfo.RightShoulderBoneName);
            }
        }        
    }
    else
    {
        if((SlashDir == 2) || SlashDir == 3)
        {
            if(((InHitZoneName == 'chest') || InHitZoneName == 'abdomen') || InHitZoneName == 'stomach')
            {
                if(SpecialDismembermentInfo.bAllowHorizontalSplit)
                {
                    OutBoneName = SpecialDismembermentInfo.SpineBoneName;
                }
            }            
        }
        else
        {
            if((SlashDir == 4) || SlashDir == 7)
            {
                if(InHitZoneName == 'chest')
                {
                    if(SpecialDismembermentInfo.bAllowVerticalSplit)
                    {
                        OutBoneName = SpecialDismembermentInfo.RightShoulderBoneName;
                    }                    
                }
                else
                {
                    if(InHitZoneName == 'head')
                    {
                        if(SpecialDismembermentInfo.bAllowVerticalSplit)
                        {
                            if(Rand(2) == 0)
                            {
                                OutBoneName = SpecialDismembermentInfo.RightShoulderBoneName;
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
                        if(SpecialDismembermentInfo.bAllowVerticalSplit)
                        {
                            OutBoneName = SpecialDismembermentInfo.LeftShoulderBoneName;
                        }                        
                    }
                    else
                    {
                        if(InHitZoneName == 'head')
                        {
                            if(SpecialDismembermentInfo.bAllowVerticalSplit)
                            {
                                if(Rand(2) == 0)
                                {
                                    OutBoneName = SpecialDismembermentInfo.LeftShoulderBoneName;
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

defaultproperties
{
    AARWeaponID=7
    StunPower=42
    MeleeHitPower=114
    ModifierPerkList=/* Array type was not detected. */
    KDamageImpulse=1000
    KDeathVel=600
    KDeathUpKick=800
}