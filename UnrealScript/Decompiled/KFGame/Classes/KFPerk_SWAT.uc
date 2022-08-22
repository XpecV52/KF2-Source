/*******************************************************************************
 * KFPerk_SWAT generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPerk_SWAT extends KFPerk
    native
    config(Game)
    hidecategories(Navigation,Movement,Collision);

enum ESWATPerkSkills
{
    ESWAT_HeavyArmor,
    ESWAT_TacticalMovement,
    ESWAT_Backup,
    ESWAT_TacticalReload,
    ESWAT_SpecialAmmunition,
    ESWAT_AmmoVest,
    ESWAT_BodyArmor,
    ESWAT_Cripple,
    ESWAT_SWATEnforcer,
    ESWAT_RapidAssault,
    ESWAT_MAX
};

var private const PerkSkill BulletResistance;
var private const PerkSkill MagSize;
var private const PerkSkill WeaponSwitchSpeed;
var private const float SnarePower;
var private const float TacticalMovementBobDamp;
var private const class<KFWeaponDefinition> BackupSecondaryWeaponDef;

function SetPlayerDefaults(Pawn PlayerPawn)
{
    local float NewArmor;

    super.SetPlayerDefaults(PlayerPawn);
    if(OwnerPawn.Role == ROLE_Authority)
    {
        if(IsHeavyArmorActive())
        {
            NewArmor += (float(OwnerPawn.default.MaxArmor) * (GetSkillValue(PerkSkills[0])));
        }
        if(IsBodyArmorActive())
        {
            NewArmor += (float(OwnerPawn.default.MaxArmor) * (GetSkillValue(PerkSkills[6])));
        }
        OwnerPawn.AddArmor(Round(NewArmor));
    }
}

function ApplySkillsToPawn()
{
    super.ApplySkillsToPawn();
    if(OwnerPawn != none)
    {
        OwnerPawn.bMovesFastInZedTime = IsSWATEnforcerActive();
    }
}

simulated function string GetSecondaryWeaponClassPath()
{
    return ((IsBackupActive()) ? BackupSecondaryWeaponDef.default.WeaponClassPath : SecondaryWeaponDef.default.WeaponClassPath);
}

function ModifyDamageTaken(out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy)
{
    local float TempDamage;

    if(InDamage <= 0)
    {
        return;
    }
    TempDamage = float(InDamage);
    if(ClassIsChildOf(DamageType, Class'KFDT_Ballistic'))
    {
        TempDamage -= (float(InDamage) * (GetPassiveValue(BulletResistance, CurrentLevel)));
    }
    InDamage = Round(TempDamage);
}

simulated function ModifyMagSizeAndNumber(KFWeapon KFW, out byte MagazineCapacity, optional class<KFPerk> WeaponPerkClass, optional bool bSecondary)
{
    local float TempCapacity;

    bSecondary = false;
    TempCapacity = float(MagazineCapacity);
    if((IsWeaponOnPerk(KFW, WeaponPerkClass)) && (KFW == none) || !KFW.bNoMagazine)
    {
        if(KFW != none)
        {
            TempCapacity += (float(MagazineCapacity) * (GetPassiveValue(MagSize, CurrentLevel)));
        }
    }
    MagazineCapacity = byte(Round(TempCapacity));
}

simulated function ModifyWeaponSwitchTime(out float ModifiedSwitchTime)
{
    ModifiedSwitchTime *= (1 - (GetPassiveValue(WeaponSwitchSpeed, CurrentLevel)));
}

function bool CanNotBeGrabbed()
{
    return IsHeavyArmorActive();
}

simulated function bool HasHeavyArmor()
{
    return IsHeavyArmorActive();
}

private final function bool Is9mm(KFWeapon KFW)
{
    return KFW.default.bIsBackupWeapon && !KFW.IsMeleeWeapon();
}

simulated event float GetIronSightSpeedModifier(KFWeapon KFW)
{
    if((IsTacticalMovementActive()) && IsWeaponOnPerk(KFW))
    {
        return GetSkillValue(PerkSkills[1]);
    }
    return 1;
}

simulated event float GetCrouchSpeedModifier(KFWeapon KFW)
{
    if((IsTacticalMovementActive()) && IsWeaponOnPerk(KFW))
    {
        return GetSkillValue(PerkSkills[1]);
    }
    return 1;
}

simulated function ModifyWeaponBopDamping(out float BobDamping, KFWeapon PawnWeapon)
{
    if((IsTacticalMovementActive()) && IsWeaponOnPerk(PawnWeapon))
    {
        BobDamping *= default.TacticalMovementBobDamp;
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
    if(KFW != none)
    {
        if(IsBackupActive() && IsBackupWeapon(KFW))
        {
            TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[2])));
        }
        if(IsWeaponOnPerk(KFW))
        {
        }
    }
    InDamage = Round(TempDamage);
}

simulated function ModifyMaxSpareAmmoAmount(KFWeapon KFW, out int MaxSpareAmmo, const optional out STraderItem TraderItem, optional bool bSecondary)
{
    local float TempMaxSpareAmmoAmount;

    bSecondary = false;
    if(IsAmmoVestActive() && IsWeaponOnPerk(KFW, TraderItem.AssociatedPerkClass))
    {
        TempMaxSpareAmmoAmount = float(MaxSpareAmmo);
        TempMaxSpareAmmoAmount += (float(MaxSpareAmmo) * (GetSkillValue(PerkSkills[5])));
        MaxSpareAmmo = Round(TempMaxSpareAmmoAmount);
    }
}

static simulated function float GetSnareSpeedModifier()
{
    return default.PerkSkills[7].StartingValue;
}

simulated function float GetSnarePower(optional class<DamageType> DamageType, optional byte HitZoneIdx)
{
    if((IsCrippleActive() && DamageType != none) && IsDamageTypeOnPerk(class<KFDamageType>(DamageType)))
    {
        return default.SnarePower;
    }
    return 0;
}

function ModifyArmor(out byte MaxArmor)
{
    local float TempArmor;

    if(IsBodyArmorActive())
    {
        TempArmor = float(MaxArmor);
        TempArmor += (TempArmor * (GetSkillValue(PerkSkills[6])));
        MaxArmor = byte(Round(TempArmor));
    }
}

simulated function float GetZedTimeModifier(KFWeapon W)
{
    local name StateName;

    StateName = W.GetStateName();
    if((IsRapidAssaultActive()) && IsWeaponOnPerk(W))
    {
        if(ZedTimeModifyingStates.Find(StateName != -1)
        {
            return GetSkillValue(PerkSkills[9]);
        }
    }
    return 0;
}

function float GetStumblePowerModifier(optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart)
{
    local KFWeapon KFW;
    local float StumbleModifier;

    StumbleModifier = 1;
    KFW = GetOwnerWeapon();
    if((IsSpecialAmmunitionActive()) && IsWeaponOnPerk(KFW))
    {
        StumbleModifier *= (GetSkillValue(PerkSkills[4]));
    }
    if(IsRapidAssaultActive())
    {
        StumbleModifier *= (GetSkillValue(PerkSkills[9]));
    }
    return StumbleModifier;
}

simulated function bool GetIsUberAmmoActive(KFWeapon KFW)
{
    return (IsWeaponOnPerk(KFW)) && IsRapidAssaultActive();
}

simulated function bool ShouldKnockDownOnBump()
{
    return (IsSWATEnforcerActive()) && WorldInfo.TimeDilation < 1;
}

simulated function bool IsHeavyArmorActive()
{
    return PerkSkills[0].bActive;
}

simulated function bool IsTacticalMovementActive()
{
    return PerkSkills[1].bActive;
}

private final simulated function bool IsBackupActive()
{
    return PerkSkills[2].bActive;
}

private final simulated function bool IsTacticalReloadActive()
{
    return PerkSkills[3].bActive;
}

simulated function bool GetUsingTactialReload(KFWeapon KFW)
{
    return IsTacticalReloadActive() && (IsWeaponOnPerk(KFW)) || IsBackupWeapon(KFW);
}

simulated function bool IsSpecialAmmunitionActive()
{
    return PerkSkills[4].bActive;
}

private final function bool IsAmmoVestActive()
{
    return PerkSkills[5].bActive;
}

private final function bool IsBodyArmorActive()
{
    return PerkSkills[6].bActive;
}

private final function bool IsCrippleActive()
{
    return PerkSkills[7].bActive;
}

function bool IsSWATEnforcerActive()
{
    return PerkSkills[8].bActive;
}

simulated function bool IsRapidAssaultActive()
{
    return PerkSkills[9].bActive && WorldInfo.TimeDilation < 1;
}

static simulated function int GetClotKillXP(byte Difficulty)
{
    return default.SecondaryXPModifier[Difficulty];
}

static simulated function GetPassiveStrings(out array<string> PassiveValues, out array<string> Increments, byte Level)
{
    PassiveValues[0] = string(Round((GetPassiveValue(default.BulletResistance, Level)) * float(100))) $ "%";
    PassiveValues[1] = string(Round((GetPassiveValue(default.MagSize, Level)) * float(100))) $ "%";
    PassiveValues[2] = string(Round((GetPassiveValue(default.WeaponSwitchSpeed, Level)) * float(100))) $ "%";
    PassiveValues[3] = "";
    PassiveValues[4] = "";
    Increments[0] = (((("[" @ "5% +") @ string(Round(default.BulletResistance.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
    Increments[1] = ((("[" @ string(Round(default.MagSize.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
    Increments[2] = ((("[" @ string(Round(default.WeaponSwitchSpeed.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
    Increments[3] = "";
    Increments[4] = "";
}

defaultproperties
{
    BulletResistance=(Name="Bullet Resistance",Increment=0.01,Rank=0,StartingValue=0.05,MaxValue=0.3,ModifierValue=0,IconPath="",bActive=false)
    MagSize=(Name="Increased Mag Size",Increment=0.04,Rank=0,StartingValue=0,MaxValue=1,ModifierValue=0,IconPath="",bActive=false)
    WeaponSwitchSpeed=(Name="Weapon Switch Speed",Increment=0.01,Rank=0,StartingValue=0,MaxValue=0.25,ModifierValue=0,IconPath="",bActive=false)
    SnarePower=9
    TacticalMovementBobDamp=1.11
    BackupSecondaryWeaponDef=Class'KFWeapDef_9mmDual'
    ProgressStatID=90
    PerkBuildStatID=91
    SecondaryXPModifier[0]=2
    SecondaryXPModifier[1]=3
    SecondaryXPModifier[2]=4
    SecondaryXPModifier[3]=7
    PerkName="SWAT"
    Passives(0)=(Title="Perk Weapon Damage",Description="Increase perk weapon damage %x% per level",IconPath="")
    Passives(1)=(Title="Bullet Resistance",Description="Increase resistance to projectile damage 5%, increases %x% each level",IconPath="")
    Passives(2)=(Title="Increased Mag Size",Description="Increase magazine size %x% per level",IconPath="")
    Passives(3)=(Title="Weapon Switch Speed",Description="Increase weapon switch speed %x% per level",IconPath="")
    Passives(4)=(Title="",Description="",IconPath="")
    SkillCatagories[0]="Specialization"
    SkillCatagories[1]="Assault Techniques"
    SkillCatagories[2]="Equipment"
    SkillCatagories[3]="Defensive Techniques"
    SkillCatagories[4]="Specialist Training"
    EXPAction1="Dealing SWAT weapon damage"
    EXPAction2="Killing Clots with SWAT weapons"
    PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_SWAT'
    PerkSkills(0)=(Name="HeavyArmor",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_HeavyArmor",bActive=false)
    PerkSkills(1)=(Name="TacticalMovement",Increment=0,Rank=0,StartingValue=2.5,MaxValue=2.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_TacticalMovement",bActive=false)
    PerkSkills(2)=(Name="Backup",Increment=0,Rank=0,StartingValue=2.1,MaxValue=2.1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_Backup",bActive=false)
    PerkSkills(3)=(Name="TacticalReload",Increment=0,Rank=0,StartingValue=2,MaxValue=2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_TacticalReload",bActive=false)
    PerkSkills(4)=(Name="SpecialAmmunition",Increment=0,Rank=0,StartingValue=3,MaxValue=3,ModifierValue=0,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_SpecialAmmunition",bActive=false)
    PerkSkills(5)=(Name="AmmoVest",Increment=0,Rank=0,StartingValue=0.3,MaxValue=0.3,ModifierValue=0,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_AmmoVest",bActive=false)
    PerkSkills(6)=(Name="BodyArmor",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_BodyArmor",bActive=false)
    PerkSkills(7)=(Name="Cripple",Increment=0,Rank=0,StartingValue=0.7,MaxValue=0.7,ModifierValue=0,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_Cripple",bActive=false)
    PerkSkills(8)=(Name="SWATEnforcer",Increment=0,Rank=0,StartingValue=1,MaxValue=1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_SWATEnforcer",bActive=false)
    PerkSkills(9)=(Name="RapidAssault",Increment=0,Rank=0,StartingValue=2,MaxValue=2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_RapidAssault",bActive=false)
    ZedTimeModifyingStates(0)=WeaponFiring
    ZedTimeModifyingStates(1)=WeaponBurstFiring
    ZedTimeModifyingStates(2)=WeaponSingleFiring
    PrimaryWeaponDef=Class'KFWeapDef_MP7'
    KnifeWeaponDef=Class'KFWeapDef_Knife_SWAT'
    GrenadeWeaponDef=Class'KFWeapDef_Grenade_SWAT'
    AutoBuyLoadOutPath(0)=class'KFWeapDef_MP7'
    AutoBuyLoadOutPath(1)=class'KFWeapDef_MP5RAS'
    AutoBuyLoadOutPath(2)=class'KFWeapDef_P90'
    AutoBuyLoadOutPath(3)=class'KFWeapDef_Kriss'
    HeadshotAccuracyHandicap=-3
}