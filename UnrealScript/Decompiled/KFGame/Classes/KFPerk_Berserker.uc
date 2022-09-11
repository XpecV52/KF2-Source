/*******************************************************************************
 * KFPerk_Berserker generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPerk_Berserker extends KFPerk
    native
    config(Game)
    hidecategories(Navigation,Movement,Collision);

enum EBerserkPerkSkills
{
    EBerserkerFortitude,
    EBerserkerNinja,
    EBerserkerVampire,
    EBerserkerSpeed,
    EBerserkerResistance,
    EBerserkerParry,
    EBerserkerSmash,
    EBerserkerFury,
    EBerserkerRage,
    EBerserkerSpartan,
    EBerserkPerkSkills_MAX
};

var const PerkSkill BerserkerDamage;
var const PerkSkill DamageResistance;
var const PerkSkill NightVision;
var private const float NinjaSprintModifer;
var private const float SmashStumbleModifier;
var private const int SmallRadiusSizeSQ;
var private bool bParryActive;
var private const float ParryDuration;
var private const float ParrySpeed;
var private const float FurySpeed;
var private const float SmashKnockdownMultiplier;
var private const float SpartanZedTimeResistance;
var private const float SpeedDamageModifier;
var private const float SmashHeadDamageModifier;
var private const float VampireAttackSpeedModifier;
var private const float ParryDamageReduction;
var private const int RageRadius;
var private const float RageFleeDuration;
var private const int RageFleeDistance;
var private const int RageDialogEvent;
var AkEvent ParrySkillSoundModeStart;
var AkEvent ParrySkillSoundModeStop;

function ApplySkillsToPawn()
{
    super.ApplySkillsToPawn();
    if(OwnerPawn != none)
    {
        OwnerPawn.bMovesFastInZedTime = IsFastInZedTime();
    }
}

protected simulated event PostSkillUpdate()
{
    super.PostSkillUpdate();
    SetTickIsDisabled(!IsNinjaActive());
    ParryTimer();
}

function ClearPerkEffects()
{
    ParryTimer();
    super.ClearPerkEffects();
}

reliable client simulated function ClientClearPerkEffects()
{
    if(Role != ROLE_Authority)
    {
        super.ClientClearPerkEffects();
        ParryTimer();
    }
}

event Tick(float DeltaTime)
{
    super(Actor).Tick(DeltaTime);
    if(IsNinjaActive())
    {
        TickRegen(DeltaTime);
    }
}

simulated function ModifyDamageGiven(out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx)
{
    local KFWeapon MyKFWeapon;
    local float TempDamage;

    TempDamage = float(InDamage);
    if(DamageCauser != none)
    {
        if(DamageCauser.IsA('Weapon'))
        {
            MyKFWeapon = KFWeapon(DamageCauser);            
        }
        else
        {
            if(DamageCauser.IsA('Projectile'))
            {
                MyKFWeapon = KFWeapon(DamageCauser.Owner);
            }
        }
        if(((MyKFWeapon != none) && IsWeaponOnPerk(MyKFWeapon,, self.Class)) || IsDamageTypeOnPerk(DamageType))
        {
            TempDamage += (float(InDamage) * (GetPassiveValue(BerserkerDamage, CurrentLevel)));
            if(IsSpeedActive())
            {
                TempDamage += (float(InDamage) * GetSpeedDamageModifier());
            }
            if(GetParryActive())
            {
                TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[5])));
            }
            if((HitZoneIdx == 0) && IsSmashActive())
            {
                TempDamage += (float(InDamage) * GetSmashHeadDamageModifier());
            }
        }
    }
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
    if(IsSpeedActive())
    {
        TempDuration -= (InDuration * (GetSkillValue(PerkSkills[3])));
    }
    if(GetParryActive())
    {
        TempDuration -= (InDuration * ParrySpeed);
    }
    if(IsFuryActive() && KFW.CurrentFireMode == 0)
    {
        TempDuration -= (InDuration * GetFurySpeed());
    }
    if(IsVampireActive())
    {
        TempDuration -= (InDuration * GetVampireAttackSpeedModifier());
    }
    InDuration = TempDuration;
}

static final simulated function float GetFurySpeed()
{
    return default.FurySpeed;
}

simulated function ModifySpeed(out float Speed)
{
    local KFWeapon MyKFWeapon;
    local KFInventoryManager KFIM;

    if(!IsNinjaActive())
    {
        return;
    }
    MyKFWeapon = GetOwnerWeapon();
    if((MyKFWeapon == none) && CheckOwnerPawn())
    {
        KFIM = KFInventoryManager(OwnerPawn.InvManager);
        if((KFIM != none) && KFIM.PendingWeapon != none)
        {
            MyKFWeapon = KFWeapon(KFIM.PendingWeapon);
        }
    }
    if((MyKFWeapon != none) && MyKFWeapon.IsMeleeWeapon() || IsWeaponOnPerk(MyKFWeapon,, self.Class))
    {
        Speed += (Speed * (GetSkillValue(PerkSkills[1])));
    }
}

simulated function ModifySprintSpeed(out float Speed)
{
    local KFWeapon MyKFWeapon;
    local KFInventoryManager KFIM;

    if(!IsNinjaActive())
    {
        return;
    }
    MyKFWeapon = GetOwnerWeapon();
    if((MyKFWeapon == none) && CheckOwnerPawn())
    {
        KFIM = KFInventoryManager(OwnerPawn.InvManager);
        if((KFIM != none) && KFIM.PendingWeapon != none)
        {
            MyKFWeapon = KFWeapon(KFIM.PendingWeapon);
        }
    }
    if((MyKFWeapon != none) && MyKFWeapon.IsMeleeWeapon() || IsWeaponOnPerk(MyKFWeapon,, self.Class))
    {
        Speed += (Speed * GetNinjaSprintModifier());
    }
}

static final simulated function float GetNinjaSprintModifier()
{
    return default.NinjaSprintModifer;
}

function ModifyDamageTaken(out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy)
{
    local float TempDamage;

    if(InDamage <= 0)
    {
        return;
    }
    TempDamage = float(InDamage);
    if(IsResistanceActive())
    {
        TempDamage -= (float(InDamage) * (GetSkillValue(PerkSkills[4])));
        if(ClassIsChildOf(DamageType, Class'KFDT_Toxic') || ClassIsChildOf(DamageType, Class'KFDT_Sonic'))
        {
            TempDamage -= (float(InDamage) * (GetSkillValue(PerkSkills[4])));
        }
    }
    if(GetParryActive())
    {
        TempDamage -= (float(InDamage) * GetParryDamageModifier());
    }
    TempDamage -= (float(InDamage) * GetPassiveDamageResistance(CurrentLevel));
    InDamage = Round(TempDamage);
}

private static final simulated function float GetPassiveDamageResistance(int Level)
{
    return default.DamageResistance.Increment * float(FFloor(float(Level) / 5));
}

function ModifyBloatBileDoT(out float DoTScaler)
{
    super.ModifyBloatBileDoT(DoTScaler);
    DoTScaler -= (GetSkillValue(PerkSkills[4]));
}

static simulated function GetPassiveStrings(out array<string> PassiveValues, out array<string> Increments, byte Level)
{
    PassiveValues[0] = string(Round((GetPassiveValue(default.BerserkerDamage, Level)) * float(100))) $ "%";
    PassiveValues[1] = string(Round(GetPassiveDamageResistance(Level) * float(100))) $ "%";
    PassiveValues[2] = "";
    PassiveValues[3] = "";
    Increments[0] = ((("[" @ Left(string(default.BerserkerDamage.Increment * float(100)), InStr(string(default.BerserkerDamage.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[1] = ((("[" @ Left(string(default.DamageResistance.Increment * float(100)), InStr(string(default.DamageResistance.Increment * float(100)), ".") + 2)) $ "% / 5") @ default.LevelString) @ "]";
    Increments[2] = "";
    Increments[3] = "";
}

function ModifyHealth(out int InHealth)
{
    local float TempHealth;

    TempHealth = float(InHealth);
    if(IsFortitudeActive())
    {
        TempHealth += (float(InHealth) * (GetSkillValue(PerkSkills[0])));
    }
    InHealth = Round(TempHealth);
}

function AddVampireHealth(KFPlayerController KFPC, class<DamageType> DT)
{
    if(((IsDamageTypeOnPerk(class<KFDamageType>(DT))) && IsVampireActive()) && KFPC.Pawn != none)
    {
        KFPC.Pawn.HealDamage(int(GetSkillValue(PerkSkills[2])), KFPC, Class'KFDT_Healing', false, false);
    }
}

function ModifyHardAttackDamage(out int InDamage)
{
    local float TempDamage;

    TempDamage = float(InDamage);
    if(IsSmashActive())
    {
        TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[6])));
    }
    InDamage = Round(TempDamage);
}

function ModifyLightAttackDamage(out int InDamage)
{
    local float TempDamage;

    if(IsFuryActive())
    {
        TempDamage = float(InDamage);
        TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[7])));
        InDamage = Round(TempDamage);
    }
}

simulated function ParryTimer()
{
    bParryActive = false;
    SetTickIsDisabled(!IsNinjaActive());
    if(OwnerPC != none)
    {
        OwnerPC.SetPerkEffect(false);
    }
    OwnerPC.PlaySoundBase(ParrySkillSoundModeStop, true);
}

function ModifyScreamEffectDuration(out float InDuration)
{
    if(IsResistanceActive())
    {
        InDuration *= (float(1) - (GetSkillValue(PerkSkills[4])));
    }
}

function float GetStumblePowerModifier(optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart)
{
    if(IsSmashActive() && IsDamageTypeOnPerk(DamageType))
    {
        return GetSmashStumbleModifier();
    }
    return 0;
}

static final function float GetSmashStumbleModifier()
{
    return default.SmashStumbleModifier;
}

static function int GetSmallRadiusKillXP(byte Difficulty)
{
    return default.SecondaryXPModifier[Difficulty];
}

static function int GetSmallRadiusKillDistanceSQ()
{
    return default.SmallRadiusSizeSQ;
}

function bool CanEarnSmallRadiusKillXP(class<DamageType> DT)
{
    return (IsDamageTypeOnPerk(class<KFDamageType>(DT))) || IsBackupDamageTypeOnPerk(DT);
}

simulated function float GetSirenScreamStrength()
{
    if(IsResistanceActive())
    {
        return 1 - (GetSkillValue(PerkSkills[4]));
    }
    return super.GetSirenScreamStrength();
}

function NotifyZedTimeStarted()
{
    local Pawn OtherPawn;
    local KFPlayerController KFPC;
    local KFPowerUp PowerUp;
    local KFAIController KFAIC;
    local bool bScaredAI, bCannotBeHealed;

    if(IsRageActive() && OwnerPawn != none)
    {
        KFPC = KFPlayerController(OwnerPawn.Controller);
        if(KFPC != none)
        {
            PowerUp = KFPC.GetPowerUp();
            bCannotBeHealed = (PowerUp != none) && !PowerUp.CanBeHealedWhilePowerUpIsActive;
        }
        if(bCannotBeHealed == false)
        {
            OwnerPawn.Health += int(float(OwnerPawn.HealthMax) * (GetSkillValue(PerkSkills[8])));
            OwnerPawn.Health = Min(OwnerPawn.Health, OwnerPawn.HealthMax);
        }
        foreach WorldInfo.AllPawns(Class'Pawn', OtherPawn, OwnerPawn.Location, float(GetRageRadius()))
        {
            KFAIC = KFAIController(OtherPawn.Controller);
            if(KFAIC != none)
            {
                KFAIC.DoPauseAI(GetRageFleeDuration(), true, false, true);
                bScaredAI = true;
                continue;
            }
            continue;                        
        }        
        if(bScaredAI)
        {
            KFGameInfo(Owner.WorldInfo.Game).DialogManager.PlayDialogEvent(OwnerPawn, RageDialogEvent);
        }
    }
}

private static final function int GetRageRadius()
{
    return default.RageRadius;
}

private static final function float GetRageFleeDuration()
{
    return default.RageFleeDuration;
}

private static final function int GetRageFleeDistance()
{
    return default.RageFleeDistance;
}

simulated function float GetZedTimeModifier(KFWeapon W)
{
    local name StateName;

    StateName = W.GetStateName();
    if((IsWeaponOnPerk(W,, self.Class)) && ZedTimeModifyingStates.Find(StateName != -1)
    {
        if(CouldSpartanBeActive())
        {
            return default.SpartanZedTimeResistance;
        }
    }
    return 0;
}

private static final function float GetSpeedDamageModifier()
{
    return default.SpeedDamageModifier;
}

private static final function float GetSmashHeadDamageModifier()
{
    return default.SmashHeadDamageModifier;
}

private static final function float GetVampireAttackSpeedModifier()
{
    return default.VampireAttackSpeedModifier;
}

private static final function float GetParryDamageModifier()
{
    return default.ParryDamageReduction;
}

private final function bool IsFortitudeActive()
{
    return PerkSkills[0].bActive && IsPerkLevelAllowed(0);
}

private final simulated function bool IsNinjaActive()
{
    return PerkSkills[1].bActive && IsPerkLevelAllowed(1);
}

private final simulated function bool IsVampireActive()
{
    return PerkSkills[2].bActive && IsPerkLevelAllowed(2);
}

private final simulated function bool IsSpeedActive()
{
    return PerkSkills[3].bActive && IsPerkLevelAllowed(3);
}

simulated function bool PerkNeedsTick()
{
    return IsNinjaActive();
}

simulated function SetSuccessfullParry()
{
    if(IsParryActive())
    {
        bParryActive = true;
        SetTickIsDisabled(false);
        SetTimer(ParryDuration, false, 'ParryTimer');
        if(OwnerPC != none)
        {
            OwnerPC.SetPerkEffect(true);
        }
        OwnerPC.PlaySoundBase(ParrySkillSoundModeStart, true);
    }
}

simulated function bool IsParryActive()
{
    return PerkSkills[5].bActive && IsPerkLevelAllowed(5);
}

simulated function bool IsResistanceActive()
{
    return PerkSkills[4].bActive && IsPerkLevelAllowed(4);
}

simulated event bool GetParryActive()
{
    return (IsParryActive()) && bParryActive;
}

simulated function bool HasNightVision()
{
    return true;
}

protected final simulated event bool IsSmashActive()
{
    return PerkSkills[6].bActive && IsPerkLevelAllowed(6);
}

private final simulated function bool IsFuryActive()
{
    return PerkSkills[7].bActive && IsPerkLevelAllowed(7);
}

function bool CanNotBeGrabbed()
{
    return true;
}

private final simulated event bool IsRageActive()
{
    return (PerkSkills[8].bActive && WorldInfo.TimeDilation < 1) && IsPerkLevelAllowed(8);
}

private final simulated event bool IsSpartanActive()
{
    return (PerkSkills[9].bActive && WorldInfo.TimeDilation < 1) && IsPerkLevelAllowed(9);
}

private final simulated event bool CouldSpartanBeActive()
{
    return PerkSkills[9].bActive && IsPerkLevelAllowed(9);
}

simulated function bool IsFastInZedTime()
{
    return PerkSkills[9].bActive && IsPerkLevelAllowed(9);
}

simulated event bool ShouldUseFastInstigatorDilation(KFWeapon Weap)
{
    if((PerkSkills[9].bActive && Weap != none) && IsPerkLevelAllowed(9))
    {
        return Weap.GetWeaponPerkClass(default.Class) == default.Class;
    }
    return false;
}

simulated function class<EmitterCameraLensEffectBase> GetPerkLensEffect(class<KFDamageType> dmgType)
{
    if(ClassIsChildOf(dmgType, Class'KFDT_Toxic'))
    {
        return ((IsResistanceActive()) ? dmgType.default.AltCameraLensEffectTemplate : super.GetPerkLensEffect(dmgType));
    }
    return super.GetPerkLensEffect(dmgType);
}

simulated function LogPerkSkills()
{
    super.LogPerkSkills();
    if(bLogPerk)
    {
    }
}

static function PrepareExplosive(Pawn ProjOwner, KFProjectile Proj, optional float AuxRadiusMod, optional float AuxDmgMod)
{
    local KFPlayerController KFPC;
    local KFPerk InstigatorPerk;

    AuxRadiusMod = 1;
    AuxDmgMod = 1;
    if(ProjOwner != none)
    {
        if(ProjOwner.Role == ROLE_Authority)
        {
            KFPC = KFPlayerController(ProjOwner.Controller);
            if(KFPC != none)
            {
                InstigatorPerk = KFPC.GetPerk();
                Proj.ExplosionTemplate.DamageRadius *= (InstigatorPerk.GetAoERadiusModifier() * AuxRadiusMod);
            }
        }
    }
}

defaultproperties
{
    BerserkerDamage=(Name="Berserker Damage",Increment=0.01,Rank=0,StartingValue=0,MaxValue=0.25,ModifierValue=0,IconPath="",bActive=false)
    DamageResistance=(Name="Damage Resistance",Increment=0.03,Rank=0,StartingValue=0,MaxValue=0.15,ModifierValue=0,IconPath="",bActive=false)
    NightVision=(Name="Night Vision",Increment=0,Rank=0,StartingValue=0,MaxValue=0,ModifierValue=0,IconPath="",bActive=false)
    NinjaSprintModifer=0.25
    SmashStumbleModifier=2
    SmallRadiusSizeSQ=40000
    ParryDuration=10
    ParrySpeed=0.05
    FurySpeed=0.05
    SpartanZedTimeResistance=1
    SpeedDamageModifier=0.2
    SmashHeadDamageModifier=0.25
    VampireAttackSpeedModifier=0.2
    ParryDamageReduction=0.4
    RageRadius=1000
    RageFleeDuration=5
    RageFleeDistance=2500
    RageDialogEvent=229
    ParrySkillSoundModeStart=AkEvent'WW_GLO_Runtime.Play_Beserker_Parry_Mode'
    ParrySkillSoundModeStop=AkEvent'WW_GLO_Runtime.Stop_Beserker_Parry_Mode'
    ProgressStatID=10
    PerkBuildStatID=11
    SecondaryXPModifier[0]=6
    SecondaryXPModifier[1]=8
    SecondaryXPModifier[2]=10
    SecondaryXPModifier[3]=14
    PerkName="Berserker"
    Passives(0)=(Title="Berserker Damage",Description="Perk weapon damage increases x%x per level",IconPath="")
    Passives(1)=(Title="Damage Resistance",Description="Damage resistance increases x%x every 5 levels",IconPath="")
    Passives(2)=(Title="Night Vision Capability",Description="Flashlight - AND Night Vision Goggles",IconPath="")
    Passives(3)=(Title="Clots cannot grab you",Description="Clots can't hold on to a Berserker",IconPath="")
    Passives(4)=(Title="",Description="",IconPath="")
    SkillCatagories[0]="Survival"
    SkillCatagories[1]="Combat"
    SkillCatagories[2]="Close Combat"
    SkillCatagories[3]="Power"
    SkillCatagories[4]="Advanced Training"
    EXPAction1="Dealing Berserker weapon damage"
    EXPAction2="Killing Zeds near a player with a Berserker weapon"
    PerkSkills(0)=(Name="Fortitude",Increment=0,Rank=0,StartingValue=0.75,MaxValue=0.75,ModifierValue=0,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Fortitude",bActive=false)
    PerkSkills(1)=(Name="Ninja",Increment=0,Rank=0,StartingValue=0.2,MaxValue=0.2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Ninja",bActive=false)
    PerkSkills(2)=(Name="Vampire",Increment=0,Rank=0,StartingValue=4,MaxValue=4,ModifierValue=0,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Vampire",bActive=false)
    PerkSkills(3)=(Name="Speed",Increment=0,Rank=0,StartingValue=0.2,MaxValue=0.2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Speed",bActive=false)
    PerkSkills(4)=(Name="Resistance",Increment=0,Rank=0,StartingValue=0.2,MaxValue=0.2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_PoisonResistance",bActive=false)
    PerkSkills(5)=(Name="Parry",Increment=0,Rank=0,StartingValue=0.35,MaxValue=0.35,ModifierValue=0,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Parry",bActive=false)
    PerkSkills(6)=(Name="Smash",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Smash",bActive=false)
    PerkSkills(7)=(Name="Fury",Increment=0,Rank=0,StartingValue=0.3,MaxValue=0.3,ModifierValue=0,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Intimidate",bActive=false)
    PerkSkills(8)=(Name="Rage",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Menace",bActive=false)
    PerkSkills(9)=(Name="Spartan",Increment=0,Rank=0,StartingValue=0,MaxValue=0,ModifierValue=0,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Flash",bActive=false)
    RegenerationAmount=2
    ZedTimeModifyingStates(0)=MeleeChainAttacking
    ZedTimeModifyingStates(1)=MeleeAttackBasic
    ZedTimeModifyingStates(2)=MeleeHeavyAttacking
    ZedTimeModifyingStates(3)=MeleeSustained
    ZedTimeModifyingStates(4)=WeaponFiring
    PrimaryWeaponDef=Class'KFWeapDef_Crovel'
    KnifeWeaponDef=Class'KFweapDef_Knife_Berserker'
    AutoBuyLoadOutPath(0)=class'KFWeapDef_Crovel'
    AutoBuyLoadOutPath(1)=class'KFWeapDef_Katana'
    AutoBuyLoadOutPath(2)=class'KFWeapDef_Pulverizer'
    AutoBuyLoadOutPath(3)=class'KFWeapDef_Eviscerator'
    AutoBuyLoadOutPath(4)=class'KFWeapDef_AbominationAxe'
    HitAccuracyHandicap=2.5
    HeadshotAccuracyHandicap=-2
    PrestigeRewardItemIconPaths(0)="WEP_SkinSet_Prestige01_Item_TEX.knives.BerserkerKnife_PrestigePrecious_Mint_large"
    PrestigeRewardItemIconPaths(1)="WEP_SkinSet_Prestige02_Item_TEX.tier01.Crovel_PrestigePrecious_Mint_large"
    PrestigeRewardItemIconPaths(2)="WEP_skinset_prestige03_itemtex.tier02.Katana_PrestigePrecious_Mint_large"
    PrestigeRewardItemIconPaths(3)="wep_skinset_prestige04_itemtex.tier03.Pulverizer_PrestigePrecious_Mint_Large"
    PrestigeRewardItemIconPaths(4)="WEP_SkinSet_Prestige05_Item_TEX.tier04.Eviscerator_PrestigePrecious_Mint_large"
}