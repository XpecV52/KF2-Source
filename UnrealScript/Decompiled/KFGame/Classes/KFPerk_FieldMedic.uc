/*******************************************************************************
 * KFPerk_FieldMedic generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPerk_FieldMedic extends KFPerk
    native
    config(Game)
    hidecategories(Navigation,Movement,Collision);

const ToxicDartDamage = 15;
const AARangeSq = 250000;
const VaccinationResist = 0.25;

enum EMedicPerkSkills
{
    EMedicHealingSurge,
    EMedicEnforcer,
    EMedicCombatant,
    EMedicArmament,
    EMedicRegeneration,
    EMedicLacerate,
    EMedicVaccination,
    EMedicAcidicCompound,
    EMedicAirborneAgent,
    EMedicSedative,
    EMedicPerkSkills_MAX
};

/** Passive skills */
var() const PerkSkill HealerRecharge;
/** more potent medical injections per level (max 50%) */
var() const PerkSkill HealPotency;
/** 25% less damage from Bloat Bile */
var() const PerkSkill BloatBileResistance;
/** 1% increased movement speed every level (max 25%) */
var() const PerkSkill MovementSpeed;
/** 3% more armor each level (max 75%) */
var() const PerkSkill Armor;
var array<name> VaccinationResistableDamageTypeNames;

function SetPlayerDefaults(Pawn PlayerPawn)
{
    super.SetPlayerDefaults(PlayerPawn);
    if((OwnerPawn.Role == ROLE_Authority) && IsCombatantActive())
    {
        OwnerPawn.GiveMaxArmor();
    }
}

protected simulated event PostSkillUpdate()
{
    super.PostSkillUpdate();
    SetTickIsDisabled(!IsRegenerationActive());
}

function ModifyACDamage(out int InDamage)
{
    if(IsAcidicCompoundActive())
    {
        InDamage += 15;
    }
}

simulated function ModifyHealerRechargeTime(out float RechargeRate)
{
    local float HealerRechargeTimeMod;

    HealerRechargeTimeMod = GetPassiveValue(HealerRecharge, GetLevel());
    RechargeRate /= HealerRechargeTimeMod;
}

function bool ModifyHealAmount(out float HealAmount)
{
    HealAmount *= (GetPassiveValue(HealPotency, GetLevel()));
    if(IsArmamentActive())
    {
        HealAmount -= (PerkSkills[3].StartingValue * HealAmount);
    }
    return IsArmamentActive() || IsVaccinationActive();
}

function ModifyDamageTaken(out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy)
{
    local float TempDamage;

    TempDamage = float(InDamage);
    switch(DamageType.Name)
    {
        case 'KFDT_BloatPuke':
            TempDamage -= (TempDamage * (GetPassiveValue(BloatBileResistance, GetLevel())));
            FMax(TempDamage, 1);
            break;
        default:
            break;
    }
    InDamage = Round(TempDamage);
}

function ModifySpeed(out float Speed)
{
    Speed *= (GetPassiveValue(MovementSpeed, GetLevel()));
}

function ModifyArmor(out byte MaxArmor)
{
    local float TempArmor;

    TempArmor = float(MaxArmor);
    TempArmor *= (GetPassiveValue(Armor, GetLevel()));
    MaxArmor = byte(FCeil(TempArmor));
}

function ModifyHealth(out int InHealth)
{
    local float TempHealth;

    if(IsHealingSurgeActive())
    {
        TempHealth = float(InHealth);
        TempHealth *= FMin(PerkSkills[0].MaxValue, PerkSkills[0].StartingValue);
        InHealth = Round(TempHealth);
    }
}

simulated function ModifySpareAmmoAmount(KFWeapon KFW, out int PrimarySpareAmmo, const optional out STraderItem TraderItem)
{
    local float TempAmmo;
    local class<KFPerk> WeaponPerkClass;

    if(KFW == none)
    {
        WeaponPerkClass = TraderItem.AssociatedPerkClass;        
    }
    else
    {
        WeaponPerkClass = KFW.AssociatedPerkClass;
    }
    if(IsEnforcerActive() && (IsWeaponOnPerk(KFW, WeaponPerkClass)) || IsBackupWeapon(KFW))
    {
        TempAmmo = float(PrimarySpareAmmo);
        TempAmmo *= FMin(PerkSkills[1].StartingValue, PerkSkills[1].MaxValue);
        PrimarySpareAmmo = Round(TempAmmo);
    }
}

simulated function float GetArmorDiscountMod()
{
    if(IsCombatantActive())
    {
        return 1 - FMin(PerkSkills[2].StartingValue, PerkSkills[2].MaxValue);
    }
    return 1;
}

simulated function bool PerkNeedsTick()
{
    return IsRegenerationActive();
}

function bool RepairArmor(Pawn HealTarget)
{
    local KFPawn_Human KFPH;
    local float TempArmor;
    local bool bRepairedArmor;

    if(IsArmamentActive())
    {
        KFPH = KFPawn_Human(HealTarget);
        if((KFPH != none) && KFPH.Armor < KFPH.MaxArmor)
        {
            TempArmor = float(KFPH.MaxArmor) * PerkSkills[3].MaxValue;
            KFPH.AddArmor(Round(TempArmor));
            bRepairedArmor = true;
        }
    }
    if(IsVaccinationActive())
    {
        KFPH = KFPawn_Human(HealTarget);
        if(KFPH != none)
        {
            KFPH.EnableMedicVaccinationBuff();
            if(KFPH.Armor < KFPH.MaxArmor)
            {
                TempArmor = float(KFPH.MaxArmor) * FMin(PerkSkills[6].StartingValue, PerkSkills[6].MaxValue);
                KFPH.AddArmor(Round(TempArmor));
                bRepairedArmor = true;
            }
        }
    }
    return bRepairedArmor;
}

simulated function bool CanRepairArmor()
{
    return IsVaccinationActive() || IsArmamentActive();
}

static function ModifyBleedDmg(out int BleedDamage)
{
    local float TempDamage;

    TempDamage = float(BleedDamage) * FMin(default.PerkSkills[5].StartingValue, default.PerkSkills[5].MaxValue);
    BleedDamage = FCeil(TempDamage);
}

event Tick(float DeltaTime)
{
    super(Actor).Tick(DeltaTime);
    if(IsRegenerationActive())
    {
        TickRegen(DeltaTime);
    }
}

static function ModifyVaccinationDamage(out float InDamage, class<DamageType> dmgType, optional int MedicLevel)
{
    MedicLevel = -1;
    if(IsDmgTypeVaccinationResistable(dmgType))
    {
        if(MedicLevel == -1)
        {
            InDamage *= (float(1) - 0.25);            
        }
        else
        {
            InDamage -= (InDamage * FMin(default.BloatBileResistance.MaxValue - (default.BloatBileResistance.StartingValue * float(MedicLevel)), 0.25));
        }
    }
}

function CheckForAirborneAgent(KFPawn HealTarget, class<DamageType> DamType, int HealAmount)
{
    if(IsAirborneAgentActive())
    {
        GiveMedicAirborneAgentHealth(HealTarget, DamType, HealAmount);
    }
}

private final function GiveMedicAirborneAgentHealth(KFPawn HealTarget, class<DamageType> DamType, int HealAmount)
{
    local KFPawn KFP;
    local int RoundedExtraHealAmount;

    RoundedExtraHealAmount = FCeil(float(HealAmount) * FMin(PerkSkills[8].StartingValue, PerkSkills[8].MaxValue));
    foreach WorldInfo.AllPawns(Class'KFPawn', KFP)
    {
        if(((VSizeSq(KFP.Location - HealTarget.Location) <= float(250000)) && KFP.IsAliveAndWell()) && WorldInfo.GRI.OnSameTeam(HealTarget, KFP))
        {
            if(HealTarget == KFP)
            {
                KFP.HealDamage(RoundedExtraHealAmount, OwnerPawn.Controller, DamType);
                continue;
            }
            KFP.HealDamage(RoundedExtraHealAmount + HealAmount, OwnerPawn.Controller, DamType);
        }        
    }    
}

function bool ShouldSedate()
{
    return IsSedadtiveActive();
}

static function bool IsDmgTypeVaccinationResistable(class<DamageType> dmgType)
{
    return default.VaccinationResistableDamageTypeNames.Find(dmgType.Name != -1;
}

private final function bool IsSedadtiveActive()
{
    return PerkSkills[9].bActive && WorldInfo.TimeDilation < 1;
}

private final function bool IsAirborneAgentActive()
{
    return PerkSkills[8].bActive && WorldInfo.TimeDilation < 1;
}

function bool IsAcidicCompoundActive()
{
    return PerkSkills[7].bActive;
}

function bool IsBleedDmgActive()
{
    return IsLacerateActive() && IsWeaponOnPerk(GetOwnerWeapon());
}

private final simulated function bool IsEnforcerActive()
{
    return PerkSkills[1].bActive;
}

private final simulated function bool IsCombatantActive()
{
    return PerkSkills[2].bActive;
}

private final function bool IsRegenerationActive()
{
    return PerkSkills[4].bActive;
}

private final function bool IsHealingSurgeActive()
{
    return PerkSkills[0].bActive;
}

private final simulated function bool IsArmamentActive()
{
    return PerkSkills[3].bActive;
}

private final function bool IsLacerateActive()
{
    return PerkSkills[5].bActive;
}

private final simulated function bool IsVaccinationActive()
{
    return PerkSkills[6].bActive;
}

simulated function class<EmitterCameraLensEffectBase> GetPerkLensEffect(class<KFDamageType> dmgType)
{
    if(ClassIsChildOf(dmgType, Class'KFDT_Toxic'))
    {
        return dmgType.default.AltCameraLensEffectTemplate;
    }
    return super.GetPerkLensEffect(dmgType);
}

static simulated function GetPassiveStrings(out array<string> PassiveValues, out array<string> Increments, byte Level)
{
    PassiveValues[0] = string(Round((default.HealerRecharge.Increment * float(Level)) * float(100))) $ "%";
    PassiveValues[1] = string(Round((default.HealPotency.Increment * float(Level)) * float(100))) $ "%";
    PassiveValues[2] = string(Round((default.BloatBileResistance.Increment * float(Level)) * float(100))) $ "%";
    PassiveValues[3] = string(Round((default.MovementSpeed.Increment * float(Level)) * float(100))) $ "%";
    PassiveValues[4] = string(Round((default.Armor.Increment * float(Level)) * float(100))) $ "%";
    Increments[0] = ((("[" @ string(Round(default.HealerRecharge.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
    Increments[1] = ((("[" @ string(Round(default.HealPotency.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
    Increments[2] = ((("[" @ string(Round(default.BloatBileResistance.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
    Increments[3] = ((("[" @ string(Round(default.MovementSpeed.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
    Increments[4] = ((("[" @ string(Round(default.Armor.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
}

simulated function LogPerkSkills()
{
    super.LogPerkSkills();
    if(bLogPerk)
    {
        LogInternal("PASSIVE PERKS");
        LogInternal(("-HealerRecharge:" @ string(int((HealerRecharge.Increment * float(GetLevel())) * float(100)))) $ "%");
        LogInternal(("-HealPotency:" @ string(int((HealPotency.Increment * float(GetLevel())) * float(100)))) $ "%");
        LogInternal(("-BloatBileResistance:" @ string(int((BloatBileResistance.Increment * float(GetLevel())) * float(100)))) $ "%");
        LogInternal(("-MovementSpeed:" @ string(int((MovementSpeed.Increment * float(GetLevel())) * float(100)))) $ "%");
        LogInternal(("-Armor:" @ string(int((Armor.Increment * float(GetLevel())) * float(100)))) $ "%");
        LogInternal("Skill Tree");
        LogInternal("-HealingSurge:" @ string(PerkSkills[0].bActive));
        LogInternal("-Enforcer:" @ string(PerkSkills[1].bActive));
        LogInternal("-Combatant:" @ string(PerkSkills[2].bActive));
        LogInternal("-ArmamentHealth:" @ string(PerkSkills[3].bActive));
        LogInternal("-Regeneration:" @ string(PerkSkills[4].bActive));
        LogInternal("-Lacerate:" @ string(PerkSkills[5].bActive));
        LogInternal("-Vaccination:" @ string(PerkSkills[6].bActive));
        LogInternal("-AcidicCompound:" @ string(PerkSkills[7].bActive));
        LogInternal("-AirborneAgent:" @ string(PerkSkills[8].bActive));
        LogInternal("-Sedative:" @ string(PerkSkills[9].bActive));
    }
}

defaultproperties
{
    HealerRecharge=(Name="Healer Recharge",Increment=0.08,Rank=0,StartingValue=1,MaxValue=3,ModifierValue=0,IconPath="",bActive=false)
    HealPotency=(Name="Healer Recharge",Increment=0.02,Rank=0,StartingValue=1,MaxValue=1.5,ModifierValue=0,IconPath="",bActive=false)
    BloatBileResistance=(Name="Bloat Bile Resistance",Increment=0.02,Rank=0,StartingValue=0,MaxValue=0.5,ModifierValue=0,IconPath="",bActive=false)
    MovementSpeed=(Name="Movement Speed",Increment=0.01,Rank=0,StartingValue=1,MaxValue=1.25,ModifierValue=0,IconPath="",bActive=false)
    Armor=(Name="Armor",Increment=0.03,Rank=0,StartingValue=1,MaxValue=1.75,ModifierValue=0,IconPath="",bActive=false)
    VaccinationResistableDamageTypeNames(0)=KFDT_BloatPuke
    VaccinationResistableDamageTypeNames(1)=KFDT_Toxic
    ProgressStatID=40
    PerkBuildStatID=41
    SecondaryXPModifier[0]=2
    SecondaryXPModifier[1]=2
    SecondaryXPModifier[2]=3
    SecondaryXPModifier[3]=4
    PerkName="Field Medic"
    Passives(0)=(Title="Syringe Recharge Rate",Description="%x% increase in weapon damage",IconPath="")
    Passives(1)=(Title="Syringe Potency",Description="Cloaked detection increased by %x%",IconPath="")
    Passives(2)=(Title="Bloat Bile Resistance",Description="Health bar detection increased by %x%",IconPath="")
    Passives(3)=(Title="Movement Speed",Description="Zed time lasts %x%",IconPath="")
    Passives(4)=(Title="Armor Bonus",Description="Health increased by %x%",IconPath="")
    SkillCatagories[0]="Conditioning"
    SkillCatagories[1]="Medical Technician"
    SkillCatagories[2]="Weapon Handling"
    SkillCatagories[3]="Combat Technician"
    SkillCatagories[4]="Advanced Training"
    EXPAction1="Dealing Medic weapon damage"
    EXPAction2="Healing team-mates"
    PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Medic'
    PerkSkills(0)=(Name="HealingSurge",Increment=0,Rank=0,StartingValue=1.2,MaxValue=1.2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Medic.UI_Talents_Medic_HealingSurge",bActive=false)
    PerkSkills(1)=(Name="Enforcer",Increment=0,Rank=0,StartingValue=1.2,MaxValue=1.2,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Enforcer",bActive=false)
    PerkSkills(2)=(Name="Combatant",Increment=0,Rank=0,StartingValue=0.6,MaxValue=0.6,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Combatant",bActive=false)
    PerkSkills(3)=(Name="Armament",Increment=0,Rank=0,StartingValue=0.25,MaxValue=0.01,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Armament",bActive=false)
    PerkSkills(4)=(Name="Regeneration",Increment=0,Rank=0,StartingValue=0.02,MaxValue=0.02,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Regenerate",bActive=false)
    PerkSkills(5)=(Name="Lacerate",Increment=0,Rank=0,StartingValue=0.02,MaxValue=0.02,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Lacerate",bActive=false)
    PerkSkills(6)=(Name="VaccinationArmor",Increment=0,Rank=0,StartingValue=0.02,MaxValue=0.02,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Vaccination",bActive=false)
    PerkSkills(7)=(Name="VaccinationDamageMod",Increment=0,Rank=0,StartingValue=0.75,MaxValue=0.75,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_AcidicCompound",bActive=false)
    PerkSkills(8)=(Name="AirborneAgent",Increment=0,Rank=0,StartingValue=0.2,MaxValue=0.2,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_AirborneAgent",bActive=false)
    PerkSkills(9)=(Name="Sedative",Increment=0,Rank=0,StartingValue=0,MaxValue=0,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Anesthetist",bActive=false)
    RegenerationInterval=5
    RegenerationAmount=2
    VaccinationDuration=10
    PrimaryWeaponDef=Class'KFWeapDef_MedicPistol'
    KnifeWeaponDef=Class'KFWeapDef_Knife_Medic'
    GrenadeWeaponDef=Class'KFWeapDef_Grenade_Medic'
}