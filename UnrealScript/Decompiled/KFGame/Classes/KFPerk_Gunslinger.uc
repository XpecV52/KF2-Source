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
    EGunslingerPenetration,
    EGunslingerSpeedReload,
    EGunslingerSkullCracker,
    EGunslingerKnockEmDown,
    EGunslingerUberAmmo,
    EGunslingerFanfare,
    EGunslingerSkills_MAX
};

var const PerkSkill WeaponDamage;
var const PerkSkill BulletResistance;
var const PerkSkill MovementSpeed;
var const PerkSkill Recoil;
var const PerkSkill ZedTimeReload;
var protected const array<name> SpecialZedClassNames;
var protected const array<name> AdditionalOnPerkWeaponNames;
var protected const array<name> AdditionalOnPerkDTNames;
var protected const AkEvent RhythmMethodSoundReset;
var protected const AkEvent RhythmMethodSoundHit;
var protected const AkEvent RhythmMethodSoundTop;
var protected const name RhytmMethodRTPCName;
var protected const float QuickSwitchSpeedModifier;
var private const float QuickSwitchRecoilModifier;
var private const float ShootnMooveBobDamp;
var private const array<byte> BoneBreakerBodyParts;
var private const float BoneBreakerDamage;
var private const float SnarePower;
var private const float SnareSpeedModifier;
var private int HeadShotComboCount;
var private int HeadShotComboCountDisplay;
var private const int MaxHeadShotComboCount;
var private const float HeadShotCountdownIntervall;

simulated function ModifySpeed(out float Speed)
{
    local float TempSpeed;

    TempSpeed = Speed;
    TempSpeed += (Speed * (GetPassiveValue(MovementSpeed, GetLevel())));
    if(IsQuickSwitchActive())
    {
        TempSpeed += (Speed * GetQuickSwitychSpeedModifier());
    }
    Speed = float(Round(TempSpeed));
}

protected simulated event PostSkillUpdate()
{
    super.PostSkillUpdate();
    SetTickIsDisabled(!IsRhythmMethodActive());
    if(Role == ROLE_Authority)
    {
        if(IsRhythmMethodActive())
        {
            ServerClearHeadShotsCombo();
        }
    }
}

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
    if(((KFW != none) && IsWeaponOnPerk(KFW,, self.Class)) || (DamageType != none) && IsDamageTypeOnPerk(DamageType))
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
        if(((IsBoneBreakerActive()) && MyKFPM != none) && HitShouldGiveBodyPartDamage(MyKFPM.HitZones[HitZoneIdx].Limb))
        {
            TempDamage += (float(InDamage) * GetBoneBreakerDamage());
        }
    }
    InDamage = FCeil(TempDamage);
}

function ModifyDamageTaken(out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy)
{
    local float TempDamage;

    if(InDamage <= 0)
    {
        return;
    }
    TempDamage = float(InDamage);
    if(ClassIsChildOf(DamageType, Class'KFDT_Ballistic') && TempDamage > float(0))
    {
        TempDamage -= (float(InDamage) * (GetPassiveValue(BulletResistance, CurrentLevel)));
    }
    InDamage = Round(TempDamage);
}

simulated function ModifyRecoil(out float CurrentRecoilModifier, KFWeapon KFW)
{
    if(IsWeaponOnPerk(KFW,, self.Class))
    {
        CurrentRecoilModifier -= (CurrentRecoilModifier * (GetPassiveValue(Recoil, GetLevel())));
        if((IsQuickSwitchActive()) && !KFW.bUsingSights)
        {
            CurrentRecoilModifier *= GetQuickSwitchRecoilModifier();
        }
    }
}

private static final simulated function float GetQuickSwitchRecoilModifier()
{
    return default.QuickSwitchRecoilModifier;
}

simulated function float GetReloadRateScale(KFWeapon KFW)
{
    if((((IsWeaponOnPerk(KFW,, self.Class)) && WorldInfo.TimeDilation < 1) && !IsFanfareActive()) && IsZedTimeReloadAllowed())
    {
        return 1 - (GetPassiveValue(ZedTimeReload, GetLevel()));
    }
    return 1;
}

simulated function bool IsZedTimeReloadAllowed()
{
    return ((MyKFGRI != none) ? MyKFGRI.MaxPerkLevel == MyKFGRI.default.MaxPerkLevel : false);
}

simulated function bool GetUsingTactialReload(KFWeapon KFW)
{
    return (IsSpeedReloadActive()) && IsWeaponOnPerk(KFW,, self.Class);
}

function float GetKnockdownPowerModifier(optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting)
{
    bIsSprinting = false;
    if(((IsKnockEmDownActive()) && HitShouldKnockdown(BodyPart)) && bIsSprinting)
    {
        return GetSkillValue(PerkSkills[7]);
    }
    return 0;
}

function float GetStumblePowerModifier(optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart)
{
    if((IsKnockEmDownActive()) && (HitShouldStumble(BodyPart)) || CheckSpecialZedBodyPart(KFP.Class, BodyPart))
    {
        return GetSkillValue(PerkSkills[7]);
    }
    return 0;
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

    if((GetFanfareActive()) && IsWeaponOnPerk(W,, self.Class))
    {
        StateName = W.GetStateName();
        if(ZedTimeModifyingStates.Find(StateName != -1)
        {
            return GetSkillValue(PerkSkills[9]);
        }
        if(StateName == 'Reloading')
        {
            return 1;
        }
    }
    return 0;
}

simulated function bool GetIsUberAmmoActive(KFWeapon KFW)
{
    return ((IsWeaponOnPerk(KFW,, self.Class)) && IsUberAmmoActive()) && WorldInfo.TimeDilation < 1;
}

function AddToHeadShotCombo(class<KFDamageType> KFDT, KFPawn_Monster KFPM)
{
    if(IsDamageTypeOnPerk(KFDT))
    {
        ++ HeadShotComboCount;
        ++ HeadShotComboCountDisplay;
        HeadShotComboCount = Min(HeadShotComboCount, MaxHeadShotComboCount);
        HeadShotMessage(byte(HeadShotComboCount), byte(HeadShotComboCountDisplay),, KFPM);
        SetTimer(HeadShotCountdownIntervall, true, 'SubstractHeadShotCombo');
    }
}

function UpdatePerkHeadShots(ImpactInfo Impact, class<DamageType> DamageType, int NumHit)
{
    local int HitZoneIdx;
    local KFPawn_Monster KFPM;

    if(!IsRhythmMethodActive())
    {
        return;
    }
    KFPM = KFPawn_Monster(Impact.HitActor);
    if((KFPM != none) && !KFPM.bIsHeadless)
    {
        HitZoneIdx = KFPM.HitZones.Find('ZoneName', Impact.HitInfo.BoneName;
        if(((HitZoneIdx == 0) && KFPM != none) && KFPM.IsAliveAndWell())
        {
            AddToHeadShotCombo(class<KFDamageType>(DamageType), KFPM);
        }
    }
}

reliable client simulated function HeadShotMessage(byte HeadShotNum, byte DisplayValue, optional bool bMissed, optional KFPawn_Monster KFPM)
{
    local int I;
    local AkEvent TempAkEvent;

    bMissed = false;    
    if(((OwnerPC == none) || OwnerPC.myGfxHUD == none) || !IsRhythmMethodActive())
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
            if(!bMissed)
            {
                TempAkEvent = RhythmMethodSoundHit;
            }
            break;
        case 5:
            if(!bMissed)
            {
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
    else
    {
        if(HeadShotComboCount <= 0)
        {
            ClearTimer('SubstractHeadShotCombo');
        }
    }
}

private reliable server final function ServerClearHeadShotsCombo()
{
    HeadShotComboCountDisplay = 0;
    HeadShotComboCount = 0;
    HeadShotMessage(byte(HeadShotComboCount), byte(HeadShotComboCountDisplay));
    ClearTimer('SubstractHeadShotCombo');
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
    return GetSkillValue(PerkSkills[4]);
}

simulated event float GetIronSightSpeedModifier(KFWeapon KFW)
{
    if((IsShootnMoveActive()) && IsWeaponOnPerk(KFW,, self.Class))
    {
        return GetSkillValue(PerkSkills[0]);
    }
    return 1;
}

simulated function ModifyWeaponBopDamping(out float BobDamping, KFWeapon PawnWeapon)
{
    if((IsShootnMoveActive()) && IsWeaponOnPerk(PawnWeapon,, self.Class))
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

private final function bool HitShouldGiveBodyPartDamage(byte BodyPart)
{
    return BoneBreakerBodyParts.Find(BodyPart != -1;
}

private static final function float GetBoneBreakerDamage()
{
    return default.BoneBreakerDamage;
}

simulated function bool IgnoresPenetrationDmgReduction()
{
    return IsPenetrationActive();
}

simulated function float GetSnareSpeedModifier()
{
    return ((IsSkullCrackerActive()) ? SnareSpeedModifier : 1);
}

simulated function float GetSnarePowerModifier(optional class<DamageType> DamageType, optional byte HitZoneIdx)
{
    if((((IsSkullCrackerActive()) && DamageType != none) && IsDamageTypeOnPerk(class<KFDamageType>(DamageType))) && HitZoneIdx == 0)
    {
        return default.SnarePower;
    }
    return 0;
}

simulated function bool IsShootnMoveActive()
{
    return PerkSkills[0].bActive && IsPerkLevelAllowed(0);
}

simulated function bool IsQuickSwitchActive()
{
    return PerkSkills[1].bActive && IsPerkLevelAllowed(1);
}

simulated function bool IsRhythmMethodActive()
{
    return PerkSkills[2].bActive && IsPerkLevelAllowed(2);
}

function bool IsBoneBreakerActive()
{
    return PerkSkills[3].bActive && IsPerkLevelAllowed(3);
}

simulated function bool IsSpeedReloadActive()
{
    return PerkSkills[5].bActive && IsPerkLevelAllowed(5);
}

simulated function bool IsPenetrationActive()
{
    return PerkSkills[4].bActive && IsPerkLevelAllowed(4);
}

simulated function bool IsKnockEmDownActive()
{
    return PerkSkills[7].bActive && IsPerkLevelAllowed(7);
}

simulated function bool IsFanfareActive()
{
    return PerkSkills[9].bActive && IsPerkLevelAllowed(9);
}

simulated function bool GetFanfareActive()
{
    return IsFanfareActive();
}

simulated function bool IsUberAmmoActive()
{
    return PerkSkills[8].bActive && IsPerkLevelAllowed(8);
}

simulated function bool IsSkullCrackerActive()
{
    return PerkSkills[6].bActive && IsPerkLevelAllowed(6);
}

static simulated function bool IsWeaponOnPerk(KFWeapon W, optional array< class<KFPerk> > WeaponPerkClass, optional class<KFPerk> InstigatorPerkClass, optional name WeaponClassName)
{
    if((W != none) && default.AdditionalOnPerkWeaponNames.Find(W.Class.Name != -1)
    {
        return true;        
    }
    else
    {
        if((WeaponClassName != 'None') && default.AdditionalOnPerkWeaponNames.Find(WeaponClassName != -1)
        {
            return true;
        }
    }
    return super.IsWeaponOnPerk(W, WeaponPerkClass, InstigatorPerkClass, WeaponClassName);
}

static function bool IsDamageTypeOnPerk(class<KFDamageType> KFDT)
{
    if((KFDT != none) && default.AdditionalOnPerkDTNames.Find(KFDT.Name != -1)
    {
        return true;
    }
    return super.IsDamageTypeOnPerk(KFDT);
}

private static final simulated function float GetQuickSwitychSpeedModifier()
{
    return default.QuickSwitchSpeedModifier;
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
    PassiveValues[4] = string(Round((GetPassiveValue(default.ZedTimeReload, Level)) * float(100))) $ "%";
    Increments[0] = ((("[" @ Left(string(default.WeaponDamage.Increment * float(100)), InStr(string(default.WeaponDamage.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[1] = (((("[" @ "5% +") @ Left(string(default.BulletResistance.Increment * float(100)), InStr(string(default.BulletResistance.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[2] = ((("[" @ Left(string(default.MovementSpeed.Increment * float(100)), InStr(string(default.MovementSpeed.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[3] = ((("[" @ Left(string(default.Recoil.Increment * float(100)), InStr(string(default.Recoil.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[4] = ((("[" @ Left(string(default.ZedTimeReload.Increment * float(100)), InStr(string(default.ZedTimeReload.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
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
        LogInternal("-SpeedReload:" @ string(PerkSkills[5].bActive));
        LogInternal("-Penetration:" @ string(PerkSkills[4].bActive));
        LogInternal("-Fanfare:" @ string(PerkSkills[9].bActive));
        LogInternal("-UberAmmo:" @ string(PerkSkills[8].bActive));
    }
}

defaultproperties
{
    WeaponDamage=(Name="Weapon Damage",Increment=0.01,Rank=0,StartingValue=0,MaxValue=0.25,ModifierValue=0,IconPath="",bActive=false)
    BulletResistance=(Name="Bullet Resistance",Increment=0.01,Rank=0,StartingValue=0.05,MaxValue=0.3,ModifierValue=0,IconPath="",bActive=false)
    MovementSpeed=(Name="Movement Speed",Increment=0.008,Rank=0,StartingValue=0,MaxValue=0.2,ModifierValue=0,IconPath="",bActive=false)
    Recoil=(Name="Recoil",Increment=0.01,Rank=0,StartingValue=0,MaxValue=0.25,ModifierValue=0,IconPath="",bActive=false)
    ZedTimeReload=(Name="Zed Time Reload",Increment=0.03,Rank=0,StartingValue=0,MaxValue=0.75,ModifierValue=0,IconPath="",bActive=false)
    SpecialZedClassNames(0)=KFPawn_ZedFleshpound
    AdditionalOnPerkWeaponNames(0)=KFWeap_Pistol_9mm
    AdditionalOnPerkWeaponNames(1)=KFWeap_Pistol_Dual9mm
    AdditionalOnPerkWeaponNames(2)=KFWeap_GrenadeLauncher_HX25
    AdditionalOnPerkDTNames(0)=KFDT_Ballistic_9mm
    AdditionalOnPerkDTNames(1)=KFDT_Ballistic_Pistol_Medic
    AdditionalOnPerkDTNames(2)=KFDT_Ballistic_Winchester
    AdditionalOnPerkDTNames(3)=KFDT_Ballistic_HX25Impact
    AdditionalOnPerkDTNames(4)=KFDT_Ballistic_HX25SubmunitionImpact
    RhythmMethodSoundReset=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Reset'
    RhythmMethodSoundHit=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Hit'
    RhythmMethodSoundTop=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Top'
    RhytmMethodRTPCName=R_Method
    QuickSwitchSpeedModifier=0.05
    QuickSwitchRecoilModifier=0.5
    ShootnMooveBobDamp=1.11
    BoneBreakerBodyParts(0)=
/* Exception thrown while deserializing BoneBreakerBodyParts
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.UnrealStreamImplementations.ReadName(IUnrealStream stream)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    BoneBreakerBodyParts(1)=.!=_9719
    BoneBreakerBodyParts(2)=.!=_3
    BoneBreakerBodyParts(3)=.!=_1050253721
    BoneBreakerDamage=0.3
    SnarePower=100
    SnareSpeedModifier=0.7
    MaxHeadShotComboCount=5
    HeadShotCountdownIntervall=2
    ProgressStatID=80
    PerkBuildStatID=81
    SecondaryXPModifier[1]=1
    SecondaryXPModifier[2]=1
    SecondaryXPModifier[3]=1
    PerkName="Gunslinger"
    Passives(0)=(Title="Perk Weapon Damage",Description="Increase perk weapon damage %x% per level",IconPath="")
    Passives(1)=(Title="Bullet Resistance",Description="Increase resistance to projectile damage 5% plus %x% per level",IconPath="")
    Passives(2)=(Title="Movement Speed",Description="Increase movement speed %x% every five levels",IconPath="")
    Passives(3)=(Title="Recoil Reduction",Description="Reduce perk weapon recoil %x% per level",IconPath="")
    Passives(4)=(Title="Zedtime Reload",Description="Increase reload speed in Zed time %x% per level",IconPath="")
    SkillCatagories[0]="Techniques"
    SkillCatagories[1]="Skill"
    SkillCatagories[2]="Advanced Techniques"
    SkillCatagories[3]="Critical hits"
    SkillCatagories[4]="Master Techniques"
    EXPAction1="Dealing Gunslinger weapon damage"
    EXPAction2="Head shots with Gunslinger weapons"
    PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Gunslinger'
    PerkSkills(0)=(Name="ShootnMove",Increment=0,Rank=0,StartingValue=2,MaxValue=2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_Steady",bActive=false)
    PerkSkills(1)=(Name="QuickSwitch",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_QuickSwitch",bActive=false)
    PerkSkills(2)=(Name="RhythmMethod",Increment=0,Rank=0,StartingValue=0.1,MaxValue=0.1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_RackEmUp",bActive=false)
    PerkSkills(3)=(Name="BoneBreaker",Increment=0,Rank=0,StartingValue=0.2,MaxValue=0.2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_BoneBreaker",bActive=false)
    PerkSkills(4)=(Name="Penetration",Increment=0,Rank=0,StartingValue=1,MaxValue=1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_LineEmUp",bActive=false)
    PerkSkills(5)=(Name="SpeedReload",Increment=0,Rank=0,StartingValue=0,MaxValue=0,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_SpeedReload",bActive=false)
    PerkSkills(6)=(Name="Skullcracker",Increment=0,Rank=0,StartingValue=2,MaxValue=2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_Skullcracker",bActive=false)
    PerkSkills(7)=(Name="KnockEmDown",Increment=0,Rank=0,StartingValue=4.1,MaxValue=4.1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_KnockEmDown",bActive=false)
    PerkSkills(8)=(Name="UberAmmo",Increment=0,Rank=0,StartingValue=0,MaxValue=0,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_ZEDAmmo",bActive=false)
    PerkSkills(9)=(Name="Fanfare",Increment=0,Rank=0,StartingValue=1,MaxValue=1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_ZEDSpeed",bActive=false)
    ZedTimeModifyingStates(0)=WeaponFiring
    ZedTimeModifyingStates(1)=WeaponBurstFiring
    ZedTimeModifyingStates(2)=WeaponSingleFiring
    ZedTimeModifyingStates(3)=WeaponSingleFireAndReload
    ZedTimeModifyingStates(4)=Reloading
    ZedTimeModifyingStates(5)=AltReloading
    BodyPartsCanStumble(0)=
/* Exception thrown while deserializing BodyPartsCanStumble
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.UnrealStreamImplementations.ReadName(IUnrealStream stream)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    BodyPartsCanStumble(1)=.!=_1196
    BodyPartsCanStumble(2)=.!=_5
    BodyPartsCanStumble(3)=.!=_1
    BodyPartsCanKnockDown(0)=4
    BodyPartsCanKnockDown(1)=5
    PrimaryWeaponDef=Class'KFWeapDef_Remington1858Dual'
    KnifeWeaponDef=Class'KFWeapDef_Knife_Gunslinger'
    GrenadeWeaponDef=Class'KFWeapDef_Grenade_Gunslinger'
    AutoBuyLoadOutPath(0)=class'KFWeapDef_Remington1858'
    AutoBuyLoadOutPath(1)=class'KFWeapDef_Remington1858Dual'
    AutoBuyLoadOutPath(2)=class'KFWeapDef_Colt1911'
    AutoBuyLoadOutPath(3)=class'KFWeapDef_Colt1911Dual'
    AutoBuyLoadOutPath(4)=class'KFWeapDef_Deagle'
    AutoBuyLoadOutPath(5)=class'KFWeapDef_DeagleDual'
    AutoBuyLoadOutPath(6)=class'KFWeapDef_SW500'
    AutoBuyLoadOutPath(7)=class'KFWeapDef_SW500Dual'
    HitAccuracyHandicap=-5
    HeadshotAccuracyHandicap=-8
    PrestigeRewardItemIconPaths(0)="WEP_SkinSet_Prestige01_Item_TEX.knives.GunslingerKnife_PrestigePrecious_Mint_large"
    PrestigeRewardItemIconPaths(1)="WEP_SkinSet_Prestige02_Item_TEX.tier01.Remington1858_PrestigePrecious_Mint_large"
    PrestigeRewardItemIconPaths(2)="WEP_skinset_prestige03_itemtex.tier02.M1911_PrestigePrecious_Mint_large"
    PrestigeRewardItemIconPaths(3)="wep_skinset_prestige04_itemtex.tier03.DesertEagle_PrestigePrecious_Mint_large"
    PrestigeRewardItemIconPaths(4)="WEP_SkinSet_Prestige05_Item_TEX.tier04.500MagnumRevolver_PrestigePrecious_Mint_large"
}