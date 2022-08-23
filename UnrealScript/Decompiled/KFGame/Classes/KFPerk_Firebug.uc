/*******************************************************************************
 * KFPerk_Firebug generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPerk_Firebug extends KFPerk
    native
    config(Game)
    hidecategories(Navigation,Movement,Collision);

enum EFirebugSkills
{
    EFirebugBringTheHeat,
    EFirebugHighCapFuelTank,
    EFirebugFuse,
    EFirebugGroundFire,
    EFirebugNapalm,
    EFirebugZedShrapnel,
    EFirebugSplashDamage,
    EFirebugRange,
    EFirebugScorch,
    EFirebugInferno,
    EFirebugSkills_MAX
};

var const PerkSkill WeaponDamage;
var const PerkSkill WeaponReload;
var const PerkSkill FireResistance;
var const PerkSkill OwnFireResistance;
var const PerkSkill StartingAmmo;
var const int HeatWaveRadiusSQ;
var const float ShrapnelChance;
var GameExplosion ExplosionTemplate;
var private const float SnarePower;
var private const class<DamageType> SnareCausingDmgTypeClass;
var private const int NapalmDamage;
var private const float NapalmCheckCollisionScale;

function ApplySkillsToPawn()
{
    super.ApplySkillsToPawn();
    if(MyPRI != none)
    {
        MyPRI.bExtraFireRange = IsRangeActive();
        MyPRI.bSplashActive = IsGroundFireActive();
    }
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
        TempDamage *= (GetPassiveValue(WeaponDamage, CurrentLevel));
        if(IsBringTheHeatActive())
        {
            TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[0])));
        }
        if(IsInfernoActive())
        {
            TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[9])));
        }
    }
    if((IsGroundFireActive() && DamageType != none) && ClassIsChildOf(DamageType, SnareCausingDmgTypeClass))
    {
        TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[3])));
    }
    InDamage = Round(TempDamage);
}

simulated function float GetReloadRateScale(KFWeapon KFW)
{
    if(IsWeaponOnPerk(KFW,, self.Class))
    {
        return 1 - (GetPassiveValue(WeaponReload, CurrentLevel));
    }
    return 1;
}

function ModifyDamageTaken(out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy)
{
    local float TempDamage;
    local PerkSkill UsedResistance;

    if(InDamage <= 0)
    {
        return;
    }
    TempDamage = float(InDamage);
    if(ClassIsChildOf(DamageType, Class'KFDT_Fire'))
    {
        UsedResistance = (((InstigatedBy != none) && InstigatedBy == OwnerPC) ? OwnFireResistance : FireResistance);
        TempDamage *= (float(1) - (GetPassiveValue(UsedResistance, CurrentLevel)));
    }
    InDamage = Round(TempDamage);
}

simulated function ModifySpareAmmoAmount(KFWeapon KFW, out int PrimarySpareAmmo, const optional out STraderItem TraderItem, optional bool bSecondary)
{
    local float TempSpareAmmoAmount;
    local array< class<KFPerk> > WeaponPerkClass;

    if(KFW == none)
    {
        WeaponPerkClass = TraderItem.AssociatedPerkClasses;        
    }
    else
    {
        WeaponPerkClass = KFW.GetAssociatedPerkClasses();
    }
    if(IsWeaponOnPerk(KFW, WeaponPerkClass, self.Class))
    {
        TempSpareAmmoAmount = float(PrimarySpareAmmo);
        TempSpareAmmoAmount *= (float(1) + GetStartingAmmoPercent(CurrentLevel));
        PrimarySpareAmmo = Round(TempSpareAmmoAmount);
    }
}

simulated function MaximizeSpareAmmoAmount(array< class<KFPerk> > WeaponPerkClass, out int PrimarySpareAmmo, int MaxPrimarySpareAmmo);

private static final simulated function float GetStartingAmmoPercent(int Level)
{
    return default.StartingAmmo.Increment * float(FFloor(float(Level) / 5));
}

function ModifyDoTScaler(out float DoTScaler, optional class<KFDamageType> KFDT, optional bool bNapalmInfected)
{
    if(IsFuseActive() && IsDamageTypeOnPerk(KFDT))
    {
        DoTScaler = GetSkillValue(PerkSkills[2]);
    }
    if(IsNapalmActive() && IsDamageTypeOnPerk(KFDT))
    {
        DoTScaler += (GetSkillValue(PerkSkills[4]));
    }
}

static function int GetNapalmDamage()
{
    return default.NapalmDamage;
}

function bool InHeatRange(KFPawn KFP)
{
    return VSizeSq(OwnerPawn.Location - KFP.Location) <= float(HeatWaveRadiusSQ);
}

simulated function ModifyMagSizeAndNumber(KFWeapon KFW, out byte MagazineCapacity, optional array< class<KFPerk> > WeaponPerkClass, optional bool bSecondary, optional name WeaponClassName)
{
    local float TempCapacity;

    bSecondary = false;    
    TempCapacity = float(MagazineCapacity);
    if((IsWeaponOnPerk(KFW, WeaponPerkClass, self.Class)) && IsHighCapFuelTankActive())
    {
        TempCapacity += (float(MagazineCapacity) * (GetSkillValue(PerkSkills[1])));
    }
    MagazineCapacity = byte(Round(TempCapacity));
}

function bool CanSpreadNapalm()
{
    return IsNapalmActive();
}

static final function float GetNapalmCheckCollisionScale()
{
    return default.NapalmCheckCollisionScale;
}

function bool CouldBeZedShrapnel(class<KFDamageType> KFDT)
{
    return IsZedShrapnelActive() && IsDamageTypeOnPerk(KFDT);
}

simulated function float GetSplashDamageModifier()
{
    return ((IsSplashDamageActive()) ? GetSkillValue(PerkSkills[6]) : 1);
}

simulated function bool ShouldShrapnel()
{
    return IsZedShrapnelActive() && FRand() <= default.ShrapnelChance;
}

function GameExplosion GetExplosionTemplate()
{
    return default.ExplosionTemplate;
}

simulated function float GetZedTimeModifier(KFWeapon W)
{
    local name StateName;

    if(GetScorchActive() && IsWeaponOnPerk(W,, self.Class))
    {
        StateName = W.GetStateName();
        if(ZedTimeModifyingStates.Find(StateName != -1)
        {
            return GetSkillValue(PerkSkills[8]);
        }
    }
    return 0;
}

function float GetStumblePowerModifier(optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart)
{
    if((IsHeatWaveActive() && IsDamageTypeOnPerk(DamageType)) && InHeatRange(KFP))
    {
        CooldownModifier = GetSkillValue(PerkSkills[6]);
        return 1000;
    }
    CooldownModifier = 1;
    return 1;
}

simulated function float GetSnarePower(optional class<DamageType> DamageType, optional byte HitZoneIdx)
{
    if((IsGroundFireActive() && DamageType != none) && ClassIsChildOf(DamageType, SnareCausingDmgTypeClass))
    {
        return default.SnarePower;
    }
    if(IsInfernoActive() && IsDamageTypeOnPerk(class<KFDamageType>(DamageType)))
    {
        return default.SnarePower;
    }
    return 0;
}

simulated function bool GetIsUberAmmoActive(KFWeapon KFW)
{
    return (IsWeaponOnPerk(KFW,, self.Class)) && GetScorchActive();
}

private final simulated function bool IsBringTheHeatActive()
{
    return PerkSkills[0].bActive;
}

simulated function bool IsHighCapFuelTankActive()
{
    return PerkSkills[1].bActive;
}

private final simulated function bool IsFuseActive()
{
    return PerkSkills[2].bActive;
}

private final simulated function bool IsGroundFireActive()
{
    return PerkSkills[3].bActive;
}

simulated function bool IsFlarotovActive()
{
    return true;
}

private final simulated function bool IsHeatWaveActive()
{
    return PerkSkills[6].bActive;
}

private final simulated function bool IsZedShrapnelActive()
{
    return PerkSkills[5].bActive;
}

private final simulated function bool IsNapalmActive()
{
    return PerkSkills[4].bActive;
}

simulated function bool IsRangeActive()
{
    return PerkSkills[7].bActive;
}

private final simulated function bool IsSplashDamageActive()
{
    return false;
}

private final simulated function bool IsInfernoActive()
{
    return PerkSkills[9].bActive && WorldInfo.TimeDilation < 1;
}

private final simulated function bool GetScorchActive()
{
    return IsScorchActive() && WorldInfo.TimeDilation < 1;
}

private final simulated function bool IsScorchActive()
{
    return PerkSkills[8].bActive;
}

static simulated function int GetCrawlerKillXP(byte Difficulty)
{
    return default.SecondaryXPModifier[Difficulty];
}

static simulated function int GetBloatKillXP(byte Difficulty)
{
    return default.SecondaryXPModifier[Difficulty];
}

static simulated function GetPassiveStrings(out array<string> PassiveValues, out array<string> Increments, byte Level)
{
    PassiveValues[0] = string(Round(((GetPassiveValue(default.WeaponDamage, Level)) * float(100)) - float(100))) $ "%";
    PassiveValues[1] = string(Round((GetPassiveValue(default.WeaponReload, Level)) * float(100))) $ "%";
    PassiveValues[2] = string(Round((GetPassiveValue(default.FireResistance, Level)) * float(100))) $ "%";
    PassiveValues[3] = string(Round((GetPassiveValue(default.OwnFireResistance, Level)) * float(100))) $ "%";
    PassiveValues[4] = string(Round(GetStartingAmmoPercent(Level) * float(100))) $ "%";
    Increments[0] = ((("[" @ Left(string(default.WeaponDamage.Increment * float(100)), InStr(string(default.WeaponDamage.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[1] = ((("[" @ Left(string(default.WeaponReload.Increment * float(100)), InStr(string(default.WeaponReload.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[2] = (((((("[" @ Left(string(default.FireResistance.StartingValue * float(100)), InStr(string(default.FireResistance.StartingValue * float(100)), ".") + 2)) $ "%") @ "+") @ Left(string(default.FireResistance.Increment * float(100)), InStr(string(default.FireResistance.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[3] = (((((("[" @ Left(string(default.OwnFireResistance.StartingValue * float(100)), InStr(string(default.OwnFireResistance.StartingValue * float(100)), ".") + 2)) $ "%") @ "+") @ Left(string(default.OwnFireResistance.Increment * float(100)), InStr(string(default.OwnFireResistance.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[4] = ((("[" @ Left(string(default.StartingAmmo.Increment * float(100)), InStr(string(default.StartingAmmo.Increment * float(100)), ".") + 2)) $ "% / 5") @ default.LevelString) @ "]";
}

simulated function LogPerkSkills()
{
    super.LogPerkSkills();
    if(bLogPerk)
    {
        LogInternal("PASSIVE PERKS");
        LogInternal(("-WeaponDamage:" @ string((GetPassiveValue(default.WeaponDamage, GetLevel())) - float(1))) $ "%");
        LogInternal(("-WeaponReload:" @ string(GetPassiveValue(default.WeaponReload, GetLevel()))) $ "%");
        LogInternal(("-FireResistance:" @ string(GetPassiveValue(default.FireResistance, GetLevel()))) $ "%");
        LogInternal(("-OwnFireResistance:" @ string(GetPassiveValue(default.OwnFireResistance, GetLevel()))) $ "%");
        LogInternal(("-Ammo:" @ string(GetStartingAmmoPercent(GetLevel()))) $ "%");
        LogInternal("Skill Tree");
        LogInternal("-Fuse:" @ string(PerkSkills[2].bActive));
        LogInternal("-ZedShrapnel:" @ string(PerkSkills[5].bActive));
        LogInternal("-Napalm:" @ string(PerkSkills[4].bActive));
        LogInternal("-Range:" @ string(PerkSkills[7].bActive));
        LogInternal(("-SplashDamage:" @ string(PerkSkills[6].bActive)) @ string(GetSplashDamageModifier()));
        LogInternal("-Scorch:" @ string(PerkSkills[8].bActive));
    }
}

defaultproperties
{
    WeaponDamage=(Name="Weapon Damage",Increment=0.008,Rank=0,StartingValue=1,MaxValue=1.2,ModifierValue=0,IconPath="",bActive=false)
    WeaponReload=(Name="Weapon Reload Speed",Increment=0.008,Rank=0,StartingValue=0,MaxValue=0.2,ModifierValue=0,IconPath="",bActive=false)
    FireResistance=(Name="Fire Resistance",Increment=0.02,Rank=0,StartingValue=0.3,MaxValue=0.8,ModifierValue=0,IconPath="",bActive=false)
    OwnFireResistance=(Name="Own fire Resistance",Increment=0.03,Rank=0,StartingValue=0.25,MaxValue=1,ModifierValue=0,IconPath="",bActive=false)
    StartingAmmo=(Name="Starting Ammo",Increment=0.1,Rank=0,StartingValue=0,MaxValue=0.5,ModifierValue=0,IconPath="",bActive=false)
    HeatWaveRadiusSQ=90000
    ShrapnelChance=0.2
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'FX_Explosions_ARCH.FX_Combustion_Explosion'
        Damage=10
        DamageRadius=200
        MyDamageType=Class'KFDT_Explosive_Shrapnel'
        ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_Frag.Play_WEP_EXP_Grenade_Frag_Explosion'
        CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Perk_ShrapnelCombustion'
    object end
    // Reference: KFGameExplosion'Default__KFPerk_Firebug.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    SnarePower=100
    SnareCausingDmgTypeClass=Class'KFDT_Fire_Ground'
    NapalmDamage=7
    NapalmCheckCollisionScale=2
    ProgressStatID=30
    PerkBuildStatID=31
    SecondaryXPModifier[0]=2
    SecondaryXPModifier[1]=3
    SecondaryXPModifier[2]=3
    SecondaryXPModifier[3]=5
    PerkName="Firebug"
    Passives(0)=(Title="Perk Weapon Damage",Description="Increase perk weapon damage %x% per level",IconPath="")
    Passives(1)=(Title="Perk Weapon Reload",Description="Increase perk weapon reload speed %x% per level",IconPath="")
    Passives(2)=(Title="Resist Zed Fire Damage",Description="Resistance to Zed fire starts at 30% and increases %x% per level",IconPath="")
    Passives(3)=(Title="Immunity to your own Fire",Description="Increase resistance to your own fire gains 25%, which increases %x% per level",IconPath="")
    Passives(4)=(Title="Starting Ammo",Description="Increase starting ammo %x% every five levels",IconPath="")
    SkillCatagories[0]="Supplies"
    SkillCatagories[1]="Spicy"
    SkillCatagories[2]="Burn"
    SkillCatagories[3]="Flame"
    SkillCatagories[4]="Advanced Training"
    EXPAction1="Dealing Firebug weapon damage"
    EXPAction2="Killing Crawlers and Bloats with Firebug weapons"
    PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Firebug'
    PerkSkills(0)=(Name="BringTheHeat",Increment=0,Rank=0,StartingValue=0.35,MaxValue=0.35,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_BringtheHeat",bActive=false)
    PerkSkills(1)=(Name="HighCapFuelTank",Increment=0,Rank=0,StartingValue=1,MaxValue=1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_HighCapacityFuel",bActive=false)
    PerkSkills(2)=(Name="Fuse",Increment=0,Rank=0,StartingValue=2.5,MaxValue=2.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Fuse",bActive=false)
    PerkSkills(3)=(Name="GroundFire",Increment=0,Rank=0,StartingValue=2,MaxValue=2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_HeatWave",bActive=false)
    PerkSkills(4)=(Name="Napalm",Increment=0,Rank=0,StartingValue=2.5,MaxValue=2.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Napalm",bActive=false)
    PerkSkills(5)=(Name="ZedShrapnel",Increment=0,Rank=0,StartingValue=1.2,MaxValue=1.2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_ZedShrapnel",bActive=false)
    PerkSkills(6)=(Name="SplashDamage",Increment=0,Rank=0,StartingValue=1,MaxValue=1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_GroundFire",bActive=false)
    PerkSkills(7)=(Name="Range",Increment=0,Rank=0,StartingValue=0.3,MaxValue=0,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Range",bActive=false)
    PerkSkills(8)=(Name="Scorch",Increment=0,Rank=0,StartingValue=0.9,MaxValue=0.9,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Scorch",bActive=false)
    PerkSkills(9)=(Name="Inferno",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Inferno",bActive=false)
    ZedTimeModifyingStates(0)=WeaponFiring
    ZedTimeModifyingStates(1)=WeaponBurstFiring
    ZedTimeModifyingStates(2)=WeaponSingleFiring
    ZedTimeModifyingStates(3)=SprayingFire
    PrimaryWeaponDef=Class'KFWeapDef_CaulkBurn'
    KnifeWeaponDef=Class'KFWeapDef_Knife_Firebug'
    GrenadeWeaponDef=Class'KFWeapDef_Grenade_Firebug'
    AutoBuyLoadOutPath(0)=class'KFWeapDef_CaulkBurn'
    AutoBuyLoadOutPath(1)=class'KFWeapDef_DragonsBreath'
    AutoBuyLoadOutPath(2)=class'KFWeapDef_FlameThrower'
    AutoBuyLoadOutPath(3)=class'KFWeapDef_MicrowaveGun'
    HitAccuracyHandicap=-2
    HeadshotAccuracyHandicap=5
}