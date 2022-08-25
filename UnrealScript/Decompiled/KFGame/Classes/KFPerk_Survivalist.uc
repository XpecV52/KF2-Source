/*******************************************************************************
 * KFPerk_Survivalist generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPerk_Survivalist extends KFPerk
    native
    config(Game)
    hidecategories(Navigation,Movement,Collision);

enum ESurvivalistPerkSkills
{
    ESurvivalist_TacticalReload,
    ESurvivalist_HeavyWeaponsReload,
    ESurvivalist_FieldMedic,
    ESurvivalist_MeleeExpert,
    ESurvivalist_AmmoVest,
    ESurvivalist_BigPockets,
    ESurvivalist_Shrapnel,
    ESurvivalist_MakeThingsGoBoom,
    ESurvivalist_MadMan,
    ESurvivalist_IncapMaster,
    ESurvivalist_MAX
};

var private const PerkSkill WeaponDamage;
var private const PerkSkill DamageResistance;
var private const PerkSkill HeavyBodyArmor;
var private const PerkSkill ZedTimeReload;
var private const float InjectionPotencyModifier;
var private const float MeleeExpertAttackSpeedModifier;
var private const GameExplosion ShrapnelExplosionTemplate;
var private const float ShrapnelChance;
var private const float SnarePower;
var private const float MeleeExpertMovementSpeedModifier;
var class<KFWeaponDefinition> HealingGrenadeWeaponDef;
var class<KFWeaponDefinition> MolotovGrenadeWeaponDef;
var private const array< class<KFWeaponDefinition> > PrimaryWeaponPaths;
var private const array<string> KnifeWeaponPaths;
var int StartingWeaponClassIndex;

function SetPlayerDefaults(Pawn PlayerPawn)
{
    local float NewArmor;

    super.SetPlayerDefaults(PlayerPawn);
    if(OwnerPawn.Role == ROLE_Authority)
    {
        NewArmor = float(OwnerPawn.default.MaxArmor) * (GetPassiveValue(HeavyBodyArmor, CurrentLevel));
        OwnerPawn.AddArmor(Round(NewArmor));
    }
}

function ApplyWeightLimits()
{
    local KFInventoryManager KFIM;

    KFIM = KFInventoryManager(OwnerPawn.InvManager);
    if(KFIM != none)
    {
        if(IsBigPocketsActive())
        {
            KFIM.MaxCarryBlocks = byte(float(KFIM.default.MaxCarryBlocks) + (GetSkillValue(PerkSkills[5])));
            CheckForOverWeight(KFIM);            
        }
        else
        {
            super.ApplyWeightLimits();
        }
    }
}

function bool ShouldGetAllTheXP()
{
    return true;
}

simulated function string GetPrimaryWeaponClassPath()
{
    StartingWeaponClassIndex = Rand(PrimaryWeaponPaths.Length);
    AutoBuyLoadOutPath.InsertItem(0, PrimaryWeaponPaths[StartingWeaponClassIndex];
    return PrimaryWeaponPaths[StartingWeaponClassIndex].default.WeaponClassPath;
}

function bool ShouldAutosellWeapon(class<KFWeaponDefinition> DefClass)
{
    if(super.ShouldAutosellWeapon(DefClass))
    {
        return PrimaryWeaponPaths.Find(DefClass == -1;
    }
    return false;
}

simulated function ModifyDamageGiven(out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx)
{
    local KFWeapon KFW;
    local float TempDamage;

    TempDamage = float(InDamage);
    TempDamage += (float(InDamage) * (GetPassiveValue(WeaponDamage, CurrentLevel)));
    if(DamageCauser != none)
    {
        KFW = GetWeaponFromDamageCauser(DamageCauser);
    }
    if(KFW != none)
    {
        if(KFW.IsMeleeWeapon() && IsMeleeExpertActive())
        {
            TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[3])));
        }
    }
    InDamage = Round(TempDamage);
}

function ModifyDamageTaken(out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy)
{
    local float TempDamage;

    if(InDamage <= 0)
    {
        return;
    }
    TempDamage = float(InDamage);
    TempDamage -= (float(InDamage) * (GetPassiveValue(DamageResistance, CurrentLevel)));
    InDamage = Round(TempDamage);
}

simulated function ModifyMeleeAttackSpeed(out float InDuration, KFWeapon KFW)
{
    local float TempDuration;

    if((KFW == none) || !KFW.IsMeleeWeapon())
    {
        return;
    }
    TempDuration = InDuration;
    if(IsMeleeExpertActive())
    {
        TempDuration -= (TempDuration * GetMeleeExpertAttackSpeedModifier());
    }
    InDuration = TempDuration;
}

simulated function ModifySpeed(out float Speed)
{
    local float TempSpeed;
    local KFWeapon KFW;

    if(IsMeleeExpertActive())
    {
        KFW = GetOwnerWeapon();
        if((KFW != none) && KFW.IsMeleeWeapon())
        {
            TempSpeed = Speed + (Speed * GetMeleeExpertMovementSpeedModifier());
            Speed = TempSpeed;
        }
    }
}

private static final simulated function float GetMeleeExpertMovementSpeedModifier()
{
    return default.MeleeExpertMovementSpeedModifier;
}

private static final simulated function float GetMeleeExpertAttackSpeedModifier()
{
    return default.MeleeExpertAttackSpeedModifier;
}

simulated function bool HasHeavyArmor()
{
    return true;
}

simulated function float GetReloadRateScale(KFWeapon KFW)
{
    if((WorldInfo.TimeDilation < 1) && IsZedTimeReloadAllowed())
    {
        return 1 - (GetPassiveValue(ZedTimeReload, GetLevel()));
    }
    return 1;
}

simulated function bool IsZedTimeReloadAllowed()
{
    return ((MyKFGRI != none) ? MyKFGRI.MaxPerkLevel == MyKFGRI.default.MaxPerkLevel : false);
}

function ModifyArmor(out byte MaxArmor)
{
    local float TempArmor;

    if(HasHeavyArmor())
    {
        TempArmor = float(MaxArmor);
        TempArmor += (float(MaxArmor) * (GetPassiveValue(HeavyBodyArmor, CurrentLevel)));
        MaxArmor = byte(Round(TempArmor));
    }
}

simulated function bool GetUsingTactialReload(KFWeapon KFW)
{
    return (IsTacticalReloadActive() && IsWeaponOnPerkLight(KFW)) || IsHeavyReloadActive() && IsWeaponOnPerkHeavy(KFW);
}

simulated function bool IsWeaponOnPerkLight(KFWeapon KFW)
{
    if(KFW != none)
    {
        return (Class'KFPerk_Commando'.static.IsWeaponOnPerk(KFW,, Class'KFPerk_Commando') || Class'KFPerk_Gunslinger'.static.IsWeaponOnPerk(KFW,, Class'KFPerk_Gunslinger')) || Class'KFPerk_SWAT'.static.IsWeaponOnPerk(KFW,, Class'KFPerk_SWAT');
    }
    return false;
}

simulated function bool IsWeaponOnPerkHeavy(KFWeapon KFW)
{
    if(KFW != none)
    {
        return (((Class'KFPerk_Demolitionist'.static.IsWeaponOnPerk(KFW,, Class'KFPerk_Demolitionist') || Class'KFPerk_Support'.static.IsWeaponOnPerk(KFW,, Class'KFPerk_Support')) || Class'KFPerk_Sharpshooter'.static.IsWeaponOnPerk(KFW,, Class'KFPerk_Sharpshooter')) || KFW.IsA('KFPerk_Survivalist')) || KFW.IsHeavyWeapon() && IsWeaponOnPerk(KFW);
    }
    return false;
}

simulated function ModifyHealerRechargeTime(out float RechargeRate)
{
    if(IsFieldMedicActive())
    {
        RechargeRate -= (RechargeRate * (GetSkillValue(PerkSkills[2])));
    }
}

function bool ModifyHealAmount(out float HealAmount)
{
    if(IsFieldMedicActive())
    {
        HealAmount *= GetInjectionPotencyModifier();
    }
    return IsFieldMedicActive();
}

private static final function float GetInjectionPotencyModifier()
{
    return default.InjectionPotencyModifier;
}

simulated function ModifyMaxSpareAmmoAmount(KFWeapon KFW, out int MaxSpareAmmo, const optional out STraderItem TraderItem, optional bool bSecondary)
{
    local bool bUsesAmmo;
    local float TempMaxSpareAmmoAmount;

    bSecondary = false;
    bUsesAmmo = ((KFW == none) ? TraderItem.WeaponDef.static.UsesAmmo() : KFW.UsesAmmo());
    if(IsAmmoVestActive() && bUsesAmmo)
    {
        TempMaxSpareAmmoAmount = float(MaxSpareAmmo);
        TempMaxSpareAmmoAmount += (float(MaxSpareAmmo) * (GetSkillValue(PerkSkills[4])));
        MaxSpareAmmo = Round(TempMaxSpareAmmoAmount);
    }
}

function bool CouldBeZedShrapnel(class<KFDamageType> KFDT)
{
    return IsZedShrapnelActive();
}

function GameExplosion GetExplosionTemplate()
{
    return default.ShrapnelExplosionTemplate;
}

simulated function bool ShouldShrapnel()
{
    return IsZedShrapnelActive() && FRand() <= default.ShrapnelChance;
}

simulated function float GetAoERadiusModifier()
{
    return ((IsMakeThingsGoBoomActive()) ? GetSkillValue(PerkSkills[7]) : 1);
}

simulated function float GetZedTimeModifier(KFWeapon W)
{
    local name StateName;

    if((GetMadManActive()) && !W.IsMeleeWeapon())
    {
        StateName = W.GetStateName();
        if(ZedTimeModifyingStates.Find(StateName != -1)
        {
            return GetSkillValue(PerkSkills[8]);
        }
    }
    return 0;
}

function float GetKnockdownPowerModifier(optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting)
{
    bIsSprinting = false;
    if(GetIncapMasterActive())
    {
        return GetSkillValue(PerkSkills[9]);
    }
    return 0;
}

function float GetStumblePowerModifier(optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart)
{
    if(GetIncapMasterActive())
    {
        return GetSkillValue(PerkSkills[9]);
    }
    return 0;
}

function float GetStunPowerModifier(optional class<DamageType> DamageType, optional byte HitZoneIdx)
{
    if(GetIncapMasterActive())
    {
        return GetSkillValue(PerkSkills[9]);
    }
    return 0;
}

simulated function float GetSnarePowerModifier(optional class<DamageType> DamageType, optional byte HitZoneIdx)
{
    if(GetIncapMasterActive())
    {
        return default.SnarePower;
    }
    return 0;
}

simulated function class<KFProj_Grenade> GetGrenadeClass()
{
    if(IsAmmoVestActive())
    {
        return class<KFProj_Grenade>(DynamicLoadObject(HealingGrenadeWeaponDef.default.WeaponClassPath, Class'Class'));        
    }
    else
    {
        if(IsBigPocketsActive())
        {
            return class<KFProj_Grenade>(DynamicLoadObject(MolotovGrenadeWeaponDef.default.WeaponClassPath, Class'Class'));
        }
    }
    return GrenadeClass;
}

private final simulated function bool IsTacticalReloadActive()
{
    return PerkSkills[0].bActive && IsPerkLevelAllowed(0);
}

private final simulated function bool IsHeavyReloadActive()
{
    return PerkSkills[1].bActive && IsPerkLevelAllowed(1);
}

private final simulated function bool IsFieldMedicActive()
{
    return PerkSkills[2].bActive && IsPerkLevelAllowed(2);
}

private final simulated function bool IsMeleeExpertActive()
{
    return PerkSkills[3].bActive && IsPerkLevelAllowed(3);
}

private final simulated function bool IsAmmoVestActive()
{
    return PerkSkills[4].bActive && IsPerkLevelAllowed(4);
}

private final simulated function bool IsBigPocketsActive()
{
    return PerkSkills[5].bActive && IsPerkLevelAllowed(5);
}

private final simulated function bool IsZedShrapnelActive()
{
    return PerkSkills[6].bActive && IsPerkLevelAllowed(6);
}

private final simulated function bool IsMakeThingsGoBoomActive()
{
    return PerkSkills[7].bActive && IsPerkLevelAllowed(7);
}

simulated function bool GetMadManActive()
{
    return IsMadManActive() && WorldInfo.TimeDilation < 1;
}

private final simulated function bool IsMadManActive()
{
    return PerkSkills[8].bActive && IsPerkLevelAllowed(8);
}

simulated function bool GetIncapMasterActive()
{
    return IsIncapMasterActive() && WorldInfo.TimeDilation < 1;
}

private final simulated function bool IsIncapMasterActive()
{
    return PerkSkills[9].bActive && IsPerkLevelAllowed(9);
}

static simulated function GetPassiveStrings(out array<string> PassiveValues, out array<string> Increments, byte Level)
{
    PassiveValues[0] = Left(string((GetPassiveValue(default.WeaponDamage, Level)) * float(100)), InStr(string((GetPassiveValue(default.WeaponDamage, Level)) * float(100)), ".") + 2) $ "%";
    PassiveValues[1] = string(Round((GetPassiveValue(default.DamageResistance, Level)) * float(100))) $ "%";
    PassiveValues[2] = string(Round((GetPassiveValue(default.HeavyBodyArmor, Level)) * float(100))) $ "%";
    PassiveValues[3] = string(Round((GetPassiveValue(default.ZedTimeReload, Level)) * float(100))) $ "%";
    Increments[0] = ((("[" @ Left(string(default.WeaponDamage.Increment * float(100)), InStr(string(default.WeaponDamage.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[1] = ((("[" @ Left(string(default.DamageResistance.Increment * float(100)), InStr(string(default.DamageResistance.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[2] = ((("[" @ Left(string(default.HeavyBodyArmor.Increment * float(100)), InStr(string(default.HeavyBodyArmor.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[3] = ((("[" @ Left(string(default.ZedTimeReload.Increment * float(100)), InStr(string(default.ZedTimeReload.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
}

simulated function string GetGrenadeImagePath()
{
    if(IsAmmoVestActive())
    {
        return default.HealingGrenadeWeaponDef.static.GetImagePath();        
    }
    else
    {
        if(IsBigPocketsActive())
        {
            return default.MolotovGrenadeWeaponDef.static.GetImagePath();
        }
    }
    return default.GrenadeWeaponDef.static.GetImagePath();
}

simulated function class<KFWeaponDefinition> GetGrenadeWeaponDef()
{
    if(IsAmmoVestActive())
    {
        return default.HealingGrenadeWeaponDef;        
    }
    else
    {
        if(IsBigPocketsActive())
        {
            return default.MolotovGrenadeWeaponDef;
        }
    }
    return default.GrenadeWeaponDef;
}

defaultproperties
{
    WeaponDamage=(Name="Weapon Damage",Increment=0.006,Rank=0,StartingValue=0,MaxValue=0.15,ModifierValue=0,IconPath="",bActive=false)
    DamageResistance=(Name="Damage Resistance",Increment=0.01,Rank=0,StartingValue=0,MaxValue=0.25,ModifierValue=0,IconPath="",bActive=false)
    HeavyBodyArmor=(Name="Heavy Body Armor",Increment=0.01,Rank=0,StartingValue=0,MaxValue=0.25,ModifierValue=0,IconPath="",bActive=false)
    ZedTimeReload=(Name="Zed Time Reload",Increment=0.03,Rank=0,StartingValue=0,MaxValue=0.75,ModifierValue=0,IconPath="",bActive=false)
    InjectionPotencyModifier=1.2
    MeleeExpertAttackSpeedModifier=0.15
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'FX_Explosions_ARCH.FX_Combustion_Explosion'
        Damage=10
        DamageRadius=200
        MyDamageType=Class'KFDT_Explosive_Shrapnel'
        ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_Frag.Play_WEP_EXP_Grenade_Frag_Explosion'
        CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Perk_ShrapnelCombustion'
    object end
    // Reference: KFGameExplosion'Default__KFPerk_Survivalist.ExploTemplate0'
    ShrapnelExplosionTemplate=ExploTemplate0
    ShrapnelChance=0.2
    SnarePower=20
    MeleeExpertMovementSpeedModifier=0.25
    HealingGrenadeWeaponDef=Class'KFWeapDef_Grenade_Medic'
    MolotovGrenadeWeaponDef=Class'KFWeapDef_Grenade_Firebug'
    PrimaryWeaponPaths(0)=class'KFWeapDef_AR15'
    PrimaryWeaponPaths(1)=class'KFWeapDef_MB500'
    PrimaryWeaponPaths(2)=class'KFWeapDef_Crovel'
    PrimaryWeaponPaths(3)=class'KFWeapDef_HX25'
    PrimaryWeaponPaths(4)=class'KFWeapDef_MedicPistol'
    PrimaryWeaponPaths(5)=class'KFWeapDef_CaulkBurn'
    PrimaryWeaponPaths(6)=class'KFWeapDef_Remington1858Dual'
    PrimaryWeaponPaths(7)=class'KFWeapDef_Winchester1894'
    PrimaryWeaponPaths(8)=class'KFWeapDef_MP7'
    StartingWeaponClassIndex=-1
    ProgressStatID=70
    PerkBuildStatID=71
    PerkName="Survivalist"
    Passives(0)=(Title="Weapon Damage",Description="Increase weapon damage %x% per level",IconPath="")
    Passives(1)=(Title="Global Damage Resistance",Description="Increase resistance to all damage %x% per level",IconPath="")
    Passives(2)=(Title="Heavy Body Armor",Description="%x% every level (max 25%) take no health damage if you have armor.",IconPath="")
    Passives(3)=(Title="Zedtime Reload",Description="Increase reload speed in Zed time %x% per level",IconPath="")
    Passives(4)=(Title="",Description="",IconPath="")
    SkillCatagories[0]="Weapon Handling"
    SkillCatagories[1]="Survival Techniques"
    SkillCatagories[2]="Equipment"
    SkillCatagories[3]="Destruction"
    SkillCatagories[4]="Specialist Training"
    EXPAction1="Dealing weapon damage with any weapon"
    EXPAction2="Killing Clots with any weapons"
    PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Survivalist'
    PerkSkills(0)=(Name="TacticalReload",Increment=0,Rank=0,StartingValue=0.25,MaxValue=0.25,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_TacticalReload",bActive=false)
    PerkSkills(1)=(Name="HeavyWeaponsReload",Increment=0,Rank=0,StartingValue=2.5,MaxValue=2.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_HeavyWeapons",bActive=false)
    PerkSkills(2)=(Name="FieldMedic",Increment=0,Rank=0,StartingValue=0.25,MaxValue=0.25,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_FieldMedic",bActive=false)
    PerkSkills(3)=(Name="MeleeExpert",Increment=0,Rank=0,StartingValue=0.1,MaxValue=0.1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_MeleeExpert",bActive=false)
    PerkSkills(4)=(Name="AmmoVest",Increment=0,Rank=0,StartingValue=0.15,MaxValue=0.15,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_AmmoVest",bActive=false)
    PerkSkills(5)=(Name="BigPockets",Increment=0,Rank=0,StartingValue=5,MaxValue=5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_BigPockets",bActive=false)
    PerkSkills(6)=(Name="ZedShrapnel",Increment=0,Rank=0,StartingValue=2,MaxValue=2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_Shrapnel",bActive=false)
    PerkSkills(7)=(Name="MakeThingsGoBoom",Increment=0,Rank=0,StartingValue=1.25,MaxValue=1.25,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_Boom",bActive=false)
    PerkSkills(8)=(Name="MadMan",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_Madman",bActive=false)
    PerkSkills(9)=(Name="IncapMaster",Increment=0,Rank=0,StartingValue=1,MaxValue=1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_IncapMaster",bActive=false)
    ZedTimeModifyingStates(0)=WeaponFiring
    ZedTimeModifyingStates(1)=WeaponBurstFiring
    ZedTimeModifyingStates(2)=WeaponSingleFiring
    ZedTimeModifyingStates(3)=WeaponSingleFireAndReload
    ZedTimeModifyingStates(4)=SprayingFire
    ZedTimeModifyingStates(5)=WeaponAltFiring
    ZedTimeModifyingStates(6)=HuskCannonCharge
    PrimaryWeaponDef=Class'KFWeapDef_Random'
    KnifeWeaponDef=Class'KFWeapDef_Knife_Support'
    GrenadeWeaponDef=Class'KFWeapDef_Grenade_Commando'
    AutoBuyLoadOutPath(0)=class'KFWeapDef_DragonsBreath'
    AutoBuyLoadOutPath(1)=class'KFWeapDef_M16M203'
    AutoBuyLoadOutPath(2)=class'KFWeapDef_MedicRifle'
}