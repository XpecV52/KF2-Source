/*******************************************************************************
 * KFPerk_Gunslinger generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPerk_Gunslinger extends KFPerk
    native
    config(Game)
    hidecategories(Navigation,Movement,Collision);

enum EGunslingerSkills
{
    EGunslingerShootnMove,
    EGunslingerQuickSwitch,
    EGunslingerRhythmMethod,
    EGunslingerBoneBreaker,
    EGunslingerSpeedReload,
    EGunslingerPenetration,
    EGunslingerCenterMass,
    EGunslingerLimbShots,
    EGunslingerFanfare,
    EGunslingerUberAmmo,
    EGunslingerSkills_MAX
};

var const PerkSkill WeaponDamage;
var const PerkSkill BulletResistance;
var const PerkSkill MovementSpeed;
var const PerkSkill Recoil;
var protected const array<name> SpecialZedClassNames;
var protected const array<name> AdditionalOnPerkWeaponNames;
var protected const array<name> AdditionalOnPerkDTNames;
var protected const AkEvent RhythmMethodSoundReset;
var protected const AkEvent RhythmMethodSoundHit;
var protected const AkEvent RhythmMethodSoundTop;
var protected const name RhytmMethodRTPCName;
var private const float ShootnMooveBobDamp;
var private int HeadShotComboCount;
var private int HeadShotComboCountDisplay;
var private const int MaxHeadShotComboCount;

static simulated function int GetHeadshotXP(byte Difficulty)
{
    return default.SecondaryXPModifier[Difficulty];
}

simulated function ModifyDamageGiven(out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx)
{
    local KFWeapon KFW;
    local float TempDamage;

    TempDamage = float(InDamage);
    if(DamageCauser != none)
    {
        KFW = GetWeaponFromDamageCauser(DamageCauser);
    }
    if(((KFW != none) && IsWeaponOnPerk(KFW)) || (DamageType != none) && IsDamageTypeOnPerk(DamageType))
    {
        TempDamage += (float(InDamage) * (GetPassiveValue(WeaponDamage, CurrentLevel)));
        if(IsBoneBreakerActive())
        {
            TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[3])));
        }
        if((IsRhythmMethodActive()) && HeadShotComboCount > 0)
        {
            TempDamage += ((float(InDamage) * (GetSkillValue(PerkSkills[2]))) * float(HeadShotComboCount));
        }
    }
    InDamage = FCeil(TempDamage);
}

function ModifyDamageTaken(out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy)
{
    local float TempDamage;

    TempDamage = float(InDamage);
    if(ClassIsChildOf(DamageType, Class'KFDT_Ballistic'))
    {
        TempDamage -= (float(InDamage) * (GetPassiveValue(BulletResistance, CurrentLevel)));
    }
    InDamage = Round(TempDamage);
}

simulated function ModifySpeed(out float Speed)
{
    local float TempSpeed;

    TempSpeed = Speed;
    TempSpeed += (Speed * (GetPassiveValue(MovementSpeed, GetLevel())));
    Speed = float(Round(TempSpeed));
}

simulated function ModifyRecoil(out float CurrentRecoilModifier, KFWeapon KFW)
{
    if(IsWeaponOnPerk(KFW))
    {
        CurrentRecoilModifier -= (CurrentRecoilModifier * (GetPassiveValue(Recoil, GetLevel())));
    }
}

simulated function bool GetUsingTactialReload(KFWeapon KFW)
{
    return (IsSpeedReloadActive()) && IsWeaponOnPerk(KFW);
}

function float GetKnockdownPowerModifier(optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting)
{
    bIsSprinting = false;
    if(((IsLimbShotsActive()) && HitShouldKnockdown(BodyPart)) && bIsSprinting)
    {
        return GetSkillValue(PerkSkills[7]);
    }
    return 1;
}

function float GetStumblePowerModifier(optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart)
{
    if((IsCenterMassActive()) && (HitShouldStumble(BodyPart)) || CheckSpecialZedBodyPart(KFP.Class, BodyPart))
    {
        return GetSkillValue(PerkSkills[6]);
    }
    return 1;
}

function bool CheckSpecialZedBodyPart(class<KFPawn> PawnClass, byte BodyPart)
{
    if((BodyPart == 6) && SpecialZedClassNames.Find(PawnClass.Name != -1)
    {
        return true;
    }
    return false;
}

simulated function float GetZedTimeModifier(KFWeapon W)
{
    local name StateName;

    if((GetFanfareActive()) && IsWeaponOnPerk(W))
    {
        StateName = W.GetStateName();
        if(ZedTimeModifyingStates.Find(StateName != -1)
        {
            return GetSkillValue(PerkSkills[8]);
        }
    }
    return 0;
}

simulated function bool GetIsUberAmmoActive(KFWeapon KFW)
{
    return ((IsWeaponOnPerk(KFW)) && IsUberAmmoActive()) && WorldInfo.TimeDilation < 1;
}

function AddToHeadShotCombo(class<KFDamageType> KFDT, KFPawn_Monster KFPM)
{
    if(IsRhythmMethodActive())
    {
        if(IsDamageTypeOnPerk(KFDT))
        {
            ++ HeadShotComboCount;
            ++ HeadShotComboCountDisplay;
            HeadShotComboCount = Min(HeadShotComboCount, MaxHeadShotComboCount);
            HeadShotMessage(byte(HeadShotComboCount), byte(HeadShotComboCountDisplay),, KFPM);            
        }
        else
        {
            SubstractHeadShotCombo();
        }
    }
}

function UpdatePerkHeadShots(ImpactInfo Impact, class<DamageType> DamageType, int NumHit)
{
    local int HitZoneIdx;
    local KFPawn_Monster KFPM;

    KFPM = KFPawn_Monster(Impact.HitActor);
    if(KFPM == none)
    {
        if(NumHit < 1)
        {
            SubstractHeadShotCombo();
        }
        return;
    }
    HitZoneIdx = KFPM.HitZones.Find('ZoneName', Impact.HitInfo.BoneName;
    if((HitZoneIdx == 0) && KFPM.IsAliveAndWell())
    {
        AddToHeadShotCombo(class<KFDamageType>(DamageType), KFPM);        
    }
    else
    {
        if(NumHit < 1)
        {
            SubstractHeadShotCombo();
        }
    }
}

reliable client simulated function HeadShotMessage(byte HeadShotNum, byte DisplayValue, optional bool bMissed, optional KFPawn_Monster KFPM)
{
    local int I;
    local AkEvent TempAkEvent;

    bMissed = false;    
    if(((OwnerPC == none) || OwnerPC.MyGFxHUD == none) || !IsRhythmMethodActive())
    {
        return;
    }
    I = HeadShotNum;
    OwnerPC.UpdateRhythmCounterWidget(DisplayValue, MaxHeadShotComboCount);
    switch(I)
    {
        case 0:
            TempAkEvent = RhythmMethodSoundReset;
            break;
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
            if(!bMissed)
            {
                OwnerPC.ClientSpawnCameraLensEffect(Class'KFCameraLensEmit_RackemHeadShot');
                TempAkEvent = RhythmMethodSoundHit;
            }
            break;
        case 7:
            if(!bMissed)
            {
                OwnerPC.ClientSpawnCameraLensEffect(Class'KFCameraLensEmit_RackemHeadShotPing');
                TempAkEvent = RhythmMethodSoundTop;
                I = 6;
            }
            break;
        default:
            break;
    }
    if(TempAkEvent != none)
    {
        OwnerPC.PlayRMEffect(TempAkEvent, RhytmMethodRTPCName, I);
    }
}

function SubstractHeadShotCombo()
{
    if((IsRhythmMethodActive()) && HeadShotComboCount > 0)
    {
        -- HeadShotComboCount;
        HeadShotComboCountDisplay = HeadShotComboCount;
        HeadShotMessage(byte(HeadShotComboCount), byte(HeadShotComboCountDisplay), true);
    }
}

private reliable server final event ServerResetHeadShotCombo()
{
    SubstractHeadShotCombo();
}

private reliable server final function ServerClearHeadShotsCombo()
{
    HeadShotComboCountDisplay = 0;
    HeadShotComboCount = 0;
    HeadShotMessage(byte(HeadShotComboCount), byte(HeadShotComboCountDisplay));
}

simulated event bool GetIsHeadShotComboActive()
{
    return IsRhythmMethodActive();
}

simulated function float GetPenetrationModifier(byte Level, class<KFDamageType> DamageType, optional bool bForce)
{
    if((!IsPenetrationActive() && !bForce) || (DamageType == none) || !IsDamageTypeOnPerk(DamageType))
    {
        return 0;
    }
    return GetSkillValue(PerkSkills[5]);
}

simulated event float GetIronSightSpeedModifier(KFWeapon KFW)
{
    if((IsShootnMooveActive()) && IsWeaponOnPerk(KFW))
    {
        return GetSkillValue(PerkSkills[0]);
    }
    return 1;
}

simulated function ModifyWeaponBopDamping(out float BobDamping, KFWeapon PawnWeapon)
{
    if((IsShootnMooveActive()) && IsWeaponOnPerk(PawnWeapon))
    {
        BobDamping *= default.ShootnMooveBobDamp;
    }
}

simulated function ModifyWeaponSwitchTime(out float ModifiedSwitchTime)
{
    if(IsQuickSwitchActive())
    {
        ModifiedSwitchTime *= (GetSkillValue(PerkSkills[1]));
    }
}

simulated function bool ShouldInstantlySwitchWeapon(KFWeapon KFW)
{
    return IsQuickSwitchActive();
}

simulated function bool IsShootnMooveActive()
{
    return PerkSkills[0].bActive;
}

simulated function bool IsQuickSwitchActive()
{
    return PerkSkills[1].bActive;
}

simulated function bool IsRhythmMethodActive()
{
    return PerkSkills[2].bActive;
}

function bool IsBoneBreakerActive()
{
    return PerkSkills[3].bActive;
}

simulated function bool IsSpeedReloadActive()
{
    return PerkSkills[4].bActive;
}

simulated function bool IsPenetrationActive()
{
    return PerkSkills[5].bActive;
}

simulated function bool IsCenterMassActive()
{
    return PerkSkills[6].bActive;
}

simulated function bool IsLimbShotsActive()
{
    return PerkSkills[7].bActive;
}

simulated function bool IsFanfareActive()
{
    return PerkSkills[8].bActive;
}

simulated function bool GetFanfareActive()
{
    return (IsFanfareActive()) && WorldInfo.TimeDilation < 1;
}

simulated function bool IsUberAmmoActive()
{
    return PerkSkills[9].bActive;
}

static simulated function bool IsWeaponOnPerk(KFWeapon W, optional class<KFPerk> WeaponPerkClass)
{
    if((W != none) && default.AdditionalOnPerkWeaponNames.Find(W.Class.Name != -1)
    {
        return true;
    }
    return super.IsWeaponOnPerk(W, WeaponPerkClass);
}

static function bool IsDamageTypeOnPerk(class<KFDamageType> KFDT)
{
    if((KFDT != none) && default.AdditionalOnPerkDTNames.Find(KFDT.Name != -1)
    {
        return true;
    }
    return super.IsDamageTypeOnPerk(KFDT);
}

protected simulated event PostSkillUpdate()
{
    super.PostSkillUpdate();
    if(Role == ROLE_Authority)
    {
        if(IsRhythmMethodActive())
        {
            ServerClearHeadShotsCombo();
        }
    }
}

event Destroyed()
{
    if(Role == ROLE_Authority)
    {
        ServerClearHeadShotsCombo();
    }
}

simulated function PlayerDied()
{
    if(Role == ROLE_Authority)
    {
        ServerClearHeadShotsCombo();
    }
}

static function int GetMaxHeadShotsValue()
{
    return default.MaxHeadShotComboCount;
}

static simulated function GetPassiveStrings(out array<string> PassiveValues, out array<string> Increments, byte Level)
{
    PassiveValues[0] = string(Round((GetPassiveValue(default.WeaponDamage, Level)) * float(100))) $ "%";
    PassiveValues[1] = string(Round((GetPassiveValue(default.BulletResistance, Level)) * float(100))) $ "%";
    PassiveValues[2] = string(Round((GetPassiveValue(default.MovementSpeed, Level)) * float(100))) $ "%";
    PassiveValues[3] = string(Round((GetPassiveValue(default.Recoil, Level)) * float(100))) $ "%";
    Increments[0] = ((("[" @ string(int(default.WeaponDamage.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
    Increments[1] = (((("[" @ "5% +") @ string(int(default.BulletResistance.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
    Increments[2] = ((("[" @ string(int(default.MovementSpeed.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
    Increments[3] = ((("[" @ string(int(default.Recoil.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
}

simulated function LogPerkSkills()
{
    super.LogPerkSkills();
    if(bLogPerk)
    {
        LogInternal("PASSIVE PERKS");
        LogInternal(("-WeaponDamage:" @ string((GetPassiveValue(WeaponDamage, GetLevel())) * float(100))) $ "%");
        LogInternal(("-BulletResistance:" @ string((GetPassiveValue(BulletResistance, GetLevel())) * float(100))) $ "%");
        LogInternal(("-MovementSpeed:" @ string((GetPassiveValue(MovementSpeed, GetLevel())) * float(100))) $ "%");
        LogInternal(("-Recoil:" @ string((GetPassiveValue(Recoil, GetLevel())) * float(100))) $ "%");
        LogInternal("Skill Tree");
        LogInternal("-Shot n Move:" @ string(PerkSkills[0].bActive));
        LogInternal("-QuickSwitch:" @ string(PerkSkills[1].bActive));
        LogInternal("-RhythmMethod:" @ string(PerkSkills[2].bActive));
        LogInternal("-BoneBreaker:" @ string(PerkSkills[3].bActive));
        LogInternal("-SpeedReload:" @ string(PerkSkills[4].bActive));
        LogInternal("-Penetration:" @ string(PerkSkills[5].bActive));
        LogInternal("-CenterMass:" @ string(PerkSkills[6].bActive));
        LogInternal("-LimbShots:" @ string(PerkSkills[7].bActive));
        LogInternal("-Fanfare:" @ string(PerkSkills[8].bActive));
        LogInternal("-UberAmmo:" @ string(PerkSkills[9].bActive));
    }
}

defaultproperties
{
    WeaponDamage=(Name="Weapon Damage",Increment=0.01,Rank=0,StartingValue=0,MaxValue=0.25,ModifierValue=0,IconPath="",bActive=false)
    BulletResistance=(Name="Bullet Resistance",Increment=0.01,Rank=0,StartingValue=0.05,MaxValue=0.3,ModifierValue=0,IconPath="",bActive=false)
    MovementSpeed=(Name="Movement Speed",Increment=0.01,Rank=0,StartingValue=0,MaxValue=0.25,ModifierValue=0,IconPath="",bActive=false)
    Recoil=(Name="Recoil",Increment=0.01,Rank=0,StartingValue=0,MaxValue=0.25,ModifierValue=0,IconPath="",bActive=false)
    SpecialZedClassNames(0)=KFPawn_ZedFleshpound
    AdditionalOnPerkWeaponNames(0)=KFWeap_Pistol_9mm
    AdditionalOnPerkWeaponNames(1)=KFWeap_Pistol_Dual9mm
    AdditionalOnPerkDTNames(0)=KFDT_Ballistic_9mm
    RhythmMethodSoundReset=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Reset'
    RhythmMethodSoundHit=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Hit'
    RhythmMethodSoundTop=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Top'
    RhytmMethodRTPCName=R_Method
    ShootnMooveBobDamp=1.11
    MaxHeadShotComboCount=7
    ProgressStatID=80
    PerkBuildStatID=81
    SecondaryXPModifier[1]=1
    SecondaryXPModifier[2]=2
    SecondaryXPModifier[3]=3
    PerkName="Gunslinger"
    Passives(0)=(Title="Perk Weapon Damage",Description="Perk weapon damage increased by %x%",IconPath="")
    Passives(1)=(Title="Bullet Resistance",Description="Resistance to projectile damage increased by %x%",IconPath="")
    Passives(2)=(Title="Movement Speed",Description="Movement speed increased by %x%",IconPath="")
    Passives(3)=(Title="Recoil",Description="%x% less recoil",IconPath="")
    Passives(4)=(Title="",Description="",IconPath="")
    SkillCatagories[0]="Technique"
    SkillCatagories[1]="Skill"
    SkillCatagories[2]="Advanced Techniques"
    SkillCatagories[3]="Critical hits"
    SkillCatagories[4]="Master Techniques"
    EXPAction1="Dealing Gunslinger weapon damage"
    EXPAction2="Head shots with Gunslinger weapons"
    PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Gunslinger'
    PerkSkills(0)=(Name="ShootnMove",Increment=0,Rank=0,StartingValue=2,MaxValue=2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_ShootNMove",bActive=false)
    PerkSkills(1)=(Name="QuickSwitch",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_QuickSwitch",bActive=false)
    PerkSkills(2)=(Name="RhythmMethod",Increment=0,Rank=0,StartingValue=0.1,MaxValue=0.1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_RhythmMethod",bActive=false)
    PerkSkills(3)=(Name="BoneBreaker",Increment=0,Rank=0,StartingValue=0.2,MaxValue=0.2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_BoneBreaker",bActive=false)
    PerkSkills(4)=(Name="SpeedReload",Increment=0,Rank=0,StartingValue=0,MaxValue=0,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_SpeedReload",bActive=false)
    PerkSkills(5)=(Name="Penetration",Increment=0,Rank=0,StartingValue=1,MaxValue=1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_Penetration",bActive=false)
    PerkSkills(6)=(Name="CenterMass",Increment=0,Rank=0,StartingValue=2,MaxValue=2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_CenterMass",bActive=false)
    PerkSkills(7)=(Name="LimbShots",Increment=0,Rank=0,StartingValue=5.1,MaxValue=5.1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_LimbShots",bActive=false)
    PerkSkills(8)=(Name="Fanfare",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_ZEDSpeed",bActive=false)
    PerkSkills(9)=(Name="UberAmmo",Increment=0,Rank=0,StartingValue=0,MaxValue=0,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_ZEDAmmo",bActive=false)
    ZedTimeModifyingStates(0)=WeaponFiring
    ZedTimeModifyingStates(1)=WeaponBurstFiring
    ZedTimeModifyingStates(2)=WeaponSingleFiring
    BodyPartsCanStumble(0)=
/* Exception thrown while deserializing BodyPartsCanStumble
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.UnrealStreamImplementations.ReadName(IUnrealStream stream)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    BodyPartsCanStumble(1)=.!=_937
    BodyPartsCanStumble(2)=.!=_5
    BodyPartsCanStumble(3)=.!=_1
    BodyPartsCanKnockDown(0)=4
    BodyPartsCanKnockDown(1)=5
    PrimaryWeaponDef=Class'KFWeapDef_Remington1858Dual'
    KnifeWeaponDef=Class'KFWeapDef_Knife_Gunslinger'
    GrenadeWeaponDef=Class'KFWeapDef_Grenade_Gunslinger'
    HitAccuracyHandicap=-5
    HeadshotAccuracyHandicap=-8
}