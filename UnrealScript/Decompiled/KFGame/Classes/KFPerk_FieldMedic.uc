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

enum EMedicPerkSkills
{
    EMedicHealingSurge,
    EMedicSurvivalist,
    EMedicHealingSpeedBoost,
    EMedicCombatant,
    EMedicHealingDamageBoost,
    EMedicAcidicCompound,
    EMedicHealingShield,
    EMedicEnforcer,
    EMedicAirborneAgent,
    EMedicSlug,
    EMedicPerkSkills_MAX
};

var const PerkSkill HealerRecharge;
var const PerkSkill HealPotency;
var const PerkSkill BloatBileResistance;
var const PerkSkill MovementSpeed;
var const PerkSkill Armor;
var private const float SelfHealingSurgePct;
var private const float MaxSurvivalistResistance;
var private const float CombatantSpeedModifier;
var private const float MaxHealingSpeedBoost;
var private const float HealingSpeedBoostDuration;
var private const float MaxHealingDamageBoost;
var private const float HealingDamageBoostDuration;
var private const float MaxHealingShield;
var private const float HealingShieldDuration;
var private const ParticleSystem AAParticleSystem;
var private const float SnarePower;
var private KFGameExplosion AAExplosionTemplate;
var private const class<KFDamageType> AAExplosionDamageType;

simulated function ModifyHealerRechargeTime(out float RechargeRate)
{
    local float HealerRechargeTimeMod;

    HealerRechargeTimeMod = GetPassiveValue(HealerRecharge, GetLevel());
    RechargeRate /= HealerRechargeTimeMod;
}

function bool ModifyHealAmount(out float HealAmount)
{
    HealAmount *= (GetPassiveValue(HealPotency, GetLevel()));
    return IsHealingSurgeActive();
}

function ModifyDamageTaken(out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy)
{
    local float TempDamage, SurvivalistResistance;

    if(InDamage <= 0)
    {
        return;
    }
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
    if(IsSurvivalistActive())
    {
        SurvivalistResistance = float(OwnerPawn.HealthMax - OwnerPawn.Health) * (GetSkillValue(PerkSkills[1]));
        TempDamage -= (TempDamage * FMin(SurvivalistResistance, MaxSurvivalistResistance));
    }
    InDamage = Round(TempDamage);
}

simulated function ModifySpeed(out float Speed)
{
    local float TempSpeed;

    TempSpeed = Speed + (Speed * (GetPassiveValue(MovementSpeed, GetLevel())));
    if(IsCombatantActive())
    {
        TempSpeed += (Speed * GetComabatantSpeedModifier());
    }
    Speed = TempSpeed;
}

private static final simulated function float GetComabatantSpeedModifier()
{
    return default.CombatantSpeedModifier;
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
        TempHealth += (float(InHealth) * (GetSkillValue(PerkSkills[0])));
        InHealth = Round(TempHealth);
    }
}

simulated function float GetSelfHealingSurgePct()
{
    return default.SelfHealingSurgePct;
}

simulated function ModifyMagSizeAndNumber(KFWeapon KFW, out byte MagazineCapacity, optional array< class<KFPerk> > WeaponPerkClass, optional bool bSecondary, optional name WeaponClassName)
{
    local float TempCapacity;

    bSecondary = false;    
    TempCapacity = float(MagazineCapacity);
    if(((IsWeaponOnPerk(KFW, WeaponPerkClass, self.Class)) && (KFW == none) || !KFW.bNoMagazine) && !bSecondary)
    {
        if(IsCombatantActive())
        {
            TempCapacity += (float(MagazineCapacity) * (GetSkillValue(PerkSkills[3])));
        }
    }
    MagazineCapacity = byte(Round(TempCapacity));
}

simulated function bool GetHealingSpeedBoostActive()
{
    return IsHealingSpeedBoostActive();
}

static simulated function byte GetHealingSpeedBoost()
{
    return byte(GetSkillValue(default.PerkSkills[2]));
}

static simulated function byte GetMaxHealingSpeedBoost()
{
    return byte(default.MaxHealingSpeedBoost);
}

static simulated function float GetHealingSpeedBoostDuration()
{
    return default.HealingSpeedBoostDuration;
}

simulated function bool GetHealingDamageBoostActive()
{
    return IsHealingDamageBoostActive();
}

static simulated function byte GetHealingDamageBoost()
{
    return byte(GetSkillValue(default.PerkSkills[4]));
}

static simulated function byte GetMaxHealingDamageBoost()
{
    return byte(default.MaxHealingDamageBoost);
}

static simulated function float GetHealingDamageBoostDuration()
{
    return default.HealingDamageBoostDuration;
}

simulated function bool GetHealingShieldActive()
{
    return IsHealingShieldActive();
}

static simulated function byte GetHealingShield()
{
    return byte(GetSkillValue(default.PerkSkills[6]));
}

static simulated function byte GetMaxHealingShield()
{
    return byte(default.MaxHealingShield);
}

static simulated function float GetHealingShieldDuration()
{
    return default.HealingShieldDuration;
}

simulated function ModifyDamageGiven(out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx)
{
    local KFWeapon KFW;
    local float TempDamage, SlugSkillValue;

    TempDamage = float(InDamage);
    if(DamageCauser != none)
    {
        KFW = GetWeaponFromDamageCauser(DamageCauser);
    }
    if(KFW != none)
    {
        if(IsEnforcerActive() && IsWeaponOnPerk(KFW,, self.Class))
        {
            TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[7])));
        }
    }
    if(((IsSlugActive()) && DamageType != none) && ClassIsChildOf(DamageType, Class'KFDT_Toxic'))
    {
        SlugSkillValue = GetSkillValue(PerkSkills[9]);
        if(InDamage > 0)
        {
            SlugSkillValue *= float(InDamage);
        }
        TempDamage += SlugSkillValue;
    }
    InDamage = Round(TempDamage);
}

static function ModifyToxicDmg(out int ToxicDamage)
{
    local float TempDamage;

    TempDamage = float(ToxicDamage) * (GetSkillValue(default.PerkSkills[5]));
    ToxicDamage = FCeil(TempDamage);
}

function NotifyZedTimeStarted()
{
    if((IsAirborneAgentActive() && OwnerPawn != none) && OwnerPawn.IsAliveAndWell())
    {
        OwnerPawn.StartAirBorneAgentEvent();
    }
}

static simulated function KFGameExplosion GetAAExplosionTemplate()
{
    return default.AAExplosionTemplate;
}

static simulated function class<DamageType> GetAADamageTypeClass()
{
    return default.AAExplosionDamageType;
}

static simulated function class<KFExplosion_AirborneAgent> GetAAExplosionActorClass()
{
    return Class'KFExplosion_AirborneAgent';
}

static simulated function ParticleSystem GetAAEffect()
{
    return default.AAParticleSystem;
}

simulated function float GetSnarePowerModifier(optional class<DamageType> DamageType, optional byte HitZoneIdx)
{
    if(((IsSlugActive()) && DamageType != none) && IsDamageTypeOnPerk(class<KFDamageType>(DamageType)))
    {
        return default.SnarePower;
    }
    return 0;
}

private final function bool IsAirborneAgentActive()
{
    return PerkSkills[8].bActive && IsPerkLevelAllowed(8);
}

function bool IsAcidicCompoundActive()
{
    return PerkSkills[5].bActive && IsPerkLevelAllowed(5);
}

function bool IsToxicDmgActive()
{
    return (IsAcidicCompoundActive()) && IsWeaponOnPerk(GetOwnerWeapon(),, self.Class);
}

private final simulated function bool IsHealingSpeedBoostActive()
{
    return PerkSkills[2].bActive && IsPerkLevelAllowed(2);
}

private final simulated function bool IsHealingDamageBoostActive()
{
    return PerkSkills[4].bActive && IsPerkLevelAllowed(4);
}

private final simulated function bool IsHealingShieldActive()
{
    return PerkSkills[6].bActive && IsPerkLevelAllowed(6);
}

private final simulated function bool IsCombatantActive()
{
    return PerkSkills[3].bActive && IsPerkLevelAllowed(3);
}

private final simulated function bool IsEnforcerActive()
{
    return PerkSkills[7].bActive && IsPerkLevelAllowed(7);
}

simulated function bool IsHealingSurgeActive()
{
    return PerkSkills[0].bActive && IsPerkLevelAllowed(0);
}

simulated function bool IsSurvivalistActive()
{
    return PerkSkills[1].bActive && IsPerkLevelAllowed(1);
}

simulated function bool IsSlugActive()
{
    return (PerkSkills[9].bActive && WorldInfo.TimeDilation < 1) && IsPerkLevelAllowed(9);
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
    Increments[0] = ((("[" @ Left(string(default.HealerRecharge.Increment * float(100)), InStr(string(default.HealerRecharge.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[1] = ((("[" @ Left(string(default.HealPotency.Increment * float(100)), InStr(string(default.HealPotency.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[2] = ((("[" @ Left(string(default.BloatBileResistance.Increment * float(100)), InStr(string(default.BloatBileResistance.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[3] = ((("[" @ Left(string(default.MovementSpeed.Increment * float(100)), 3)) $ "% /") @ default.LevelString) @ "]";
    Increments[4] = ((("[" @ Left(string(default.Armor.Increment * float(100)), InStr(string(default.Armor.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
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
    }
}

defaultproperties
{
    HealerRecharge=(Name="Healer Recharge",Increment=0.08,Rank=0,StartingValue=1,MaxValue=3,ModifierValue=0,IconPath="",bActive=false)
    HealPotency=(Name="Healer Potency",Increment=0.02,Rank=0,StartingValue=1,MaxValue=1.5,ModifierValue=0,IconPath="",bActive=false)
    BloatBileResistance=(Name="Bloat Bile Resistance",Increment=0.02,Rank=0,StartingValue=0,MaxValue=0.5,ModifierValue=0,IconPath="",bActive=false)
    MovementSpeed=(Name="Movement Speed",Increment=0.004,Rank=0,StartingValue=0,MaxValue=0.1,ModifierValue=0,IconPath="",bActive=false)
    Armor=(Name="Armor",Increment=0.03,Rank=0,StartingValue=1,MaxValue=1.75,ModifierValue=0,IconPath="",bActive=false)
    SelfHealingSurgePct=0.1
    MaxSurvivalistResistance=0.5
    CombatantSpeedModifier=0.1
    MaxHealingSpeedBoost=30
    HealingSpeedBoostDuration=5
    MaxHealingDamageBoost=20
    HealingDamageBoostDuration=5
    MaxHealingShield=30
    HealingShieldDuration=5
    AAParticleSystem=ParticleSystem'FX_Impacts_EMIT.FX_Medic_Airborne_Agent_01'
    SnarePower=100
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.Medic_Perk_Explosion'
        Damage=50
        DamageRadius=350
        DamageFalloffExponent=0
        KnockDownStrength=0
        MomentumTransferScale=0
        ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_Medic.Play_WEP_EXP_Grenade_Medic_Explosion'
        FractureMeshRadius=0
        FracturePartVel=0
        CamShake=none
        CamShakeInnerRadius=0
        CamShakeOuterRadius=0
    object end
    // Reference: KFGameExplosion'Default__KFPerk_FieldMedic.ExploTemplate0'
    AAExplosionTemplate=ExploTemplate0
    AAExplosionDamageType=Class'KFDT_Toxic_MedicGrenade'
    ProgressStatID=40
    PerkBuildStatID=41
    SecondaryXPModifier[0]=4
    SecondaryXPModifier[1]=4
    SecondaryXPModifier[2]=4
    SecondaryXPModifier[3]=4
    PerkName="Field Medic"
    Passives(0)=(Title="Syringe Recharge Rate",Description="Increase syringe recharge rate %x% per level",IconPath="")
    Passives(1)=(Title="Syringe Potency",Description="Increase Health restored by syringe %x% per level",IconPath="")
    Passives(2)=(Title="Bloat Bile Resistance",Description="Decrease damage from poison %x% per level",IconPath="")
    Passives(3)=(Title="Movement Speed",Description="Increase movement speed %x% every five levels",IconPath="")
    Passives(4)=(Title="Armor Bonus",Description="Increase Armor %x% per level",IconPath="")
    SkillCatagories[0]="Conditioning"
    SkillCatagories[1]="Movement"
    SkillCatagories[2]="Damage"
    SkillCatagories[3]="Combat Technician"
    SkillCatagories[4]="Advanced Tech"
    EXPAction1="Dealing Field Medic weapon damage"
    EXPAction2="Healing teammates"
    PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Medic'
    PerkSkills(0)=(Name="HealingSurge",Increment=0,Rank=0,StartingValue=0.25,MaxValue=0.25,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Medic.UI_Talents_Medic_HealingSurge",bActive=false)
    PerkSkills(1)=(Name="Survivalist",Increment=0,Rank=0,StartingValue=0.01,MaxValue=0.01,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Resilience",bActive=false)
    PerkSkills(2)=(Name="HealingSpeedBoost",Increment=0,Rank=0,StartingValue=10,MaxValue=10,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_AdrenalineShot",bActive=false)
    PerkSkills(3)=(Name="Combatant",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_CombatantDoctor",bActive=false)
    PerkSkills(4)=(Name="HealingDamageBoost",Increment=0,Rank=0,StartingValue=5,MaxValue=5,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_FocusInjection",bActive=false)
    PerkSkills(5)=(Name="AcidicCompound",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_AcidicRounds",bActive=false)
    PerkSkills(6)=(Name="HealingShield",Increment=0,Rank=0,StartingValue=10,MaxValue=10,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_CoagulantBooster",bActive=false)
    PerkSkills(7)=(Name="Enforcer",Increment=0,Rank=0,StartingValue=0.2,MaxValue=0.2,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_BattleSurgeon",bActive=false)
    PerkSkills(8)=(Name="AirborneAgent",Increment=0,Rank=0,StartingValue=0.2,MaxValue=0.2,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_AirborneAgent",bActive=false)
    PerkSkills(9)=(Name="Sedative",Increment=0,Rank=0,StartingValue=10,MaxValue=10,ModifierValue=0,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Zedative",bActive=false)
    VaccinationDuration=10
    ToxicDmgTypeClass=Class'KFDT_Toxic_AcidicRounds'
    PrimaryWeaponDef=Class'KFWeapDef_MedicPistol'
    KnifeWeaponDef=Class'KFWeapDef_Knife_Medic'
    GrenadeWeaponDef=Class'KFWeapDef_Grenade_Medic'
    AutoBuyLoadOutPath(0)=class'KFWeapDef_MedicPistol'
    AutoBuyLoadOutPath(1)=class'KFWeapDef_MedicSMG'
    AutoBuyLoadOutPath(2)=class'KFWeapDef_MedicShotgun'
    AutoBuyLoadOutPath(3)=class'KFWeapDef_MedicRifle'
    HitAccuracyHandicap=5
    HeadshotAccuracyHandicap=-0.75
    PrestigeRewardItemIconPaths(0)="WEP_SkinSet_Prestige01_Item_TEX.knives.MedicKnife_PrestigePrecious_Mint_large"
    PrestigeRewardItemIconPaths(1)="WEP_SkinSet_Prestige02_Item_TEX.tier01.MedicPistol_PrestigePrecious_Mint_large"
}