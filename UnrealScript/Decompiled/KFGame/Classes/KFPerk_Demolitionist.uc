/*******************************************************************************
 * KFPerk_Demolitionist generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPerk_Demolitionist extends KFPerk
    native
    config(Game)
    hidecategories(Navigation,Movement,Collision);

enum EDemoSkills
{
    EDemoDamage,
    EDemoTacticalReload,
    EDemoDirectHit,
    EDemoAmmo,
    EDemoSirenResistance,
    EDemoAoE,
    EDemoCriticalHit,
    EDemoConcussiveForce,
    EDemoNuke,
    EDemoProfessional,
    EDemoSkills_MAX
};

var const PerkSkill ExplosiveDamage;
var const PerkSkill ExplosiveResistance;
var const PerkSkill ExplosiveAmmo;
var array<KFPawn_Human> SuppliedPawnList;
var private const float SharedExplosiveResistance;
var private const class<DamageType> ExplosiveResistableDamageTypeSuperClass;
var private const float ExplosiveResistanceRadius;
var KFGameExplosion SacrificeExplosionTemplate;
var KFGameExplosion NukeExplosionTemplate;
var KFGameExplosion DoorTrapExplosionTemplate;
var string NukeExplosionActorClassName;
var string NukeExplosionDamageTypeName;
var string NukeProjectileClassName;
var array<name> NukeIgnoredProjectileNames;
var private const float NukeDamageModifier;
var private const float NukeRadiusModifier;
var AkEvent ConcussiveExplosionSound;
var private const float AoeDamageModifier;
var private const int LingeringNukePoisonDamage;
var private const array<name> PassiveExtraAmmoIgnoredClassNames;
var private const array<name> ExtraAmmoIgnoredClassNames;
var private const array<name> OnlySecondaryAmmoWeapons;
var private const array<name> DamageIgnoredDTs;
var private const float DaZedEMPPower;
var private const float ProfessionalAoEModifier;
var private bool bUsedSacrifice;
var private const class<KFDamageType> LingeringNukeDamageType;

function ApplySkillsToPawn()
{
    super.ApplySkillsToPawn();
    if(MyPRI != none)
    {
        MyPRI.bNukeActive = IsNukeActive();
        MyPRI.bConcussiveActive = IsConcussiveForceActive();
    }
    ResetSupplier();
}

function OnWaveEnded()
{
    super.OnWaveEnded();
    bUsedSacrifice = false;
    ResetSupplier();
}

simulated function ModifyDamageGiven(out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx)
{
    local KFWeapon KFW;
    local float TempDamage;

    if((DamageType != none) && IsDamageIgnoredDT(DamageType))
    {
        return;
    }
    TempDamage = float(InDamage);
    if(DamageCauser != none)
    {
        KFW = GetWeaponFromDamageCauser(DamageCauser);
    }
    if(((KFW != none) && IsWeaponOnPerk(KFW)) || (DamageType != none) && IsDamageTypeOnPerk(DamageType))
    {
        TempDamage += (float(InDamage) * (GetPassiveValue(ExplosiveDamage, CurrentLevel)));
        if(IsDamageActive())
        {
            TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[0])));
        }
        if(((IsDirectHitActive()) && DamageType != none) && IsDamageTypeOnPerk(DamageType))
        {
            if(DamageType.IsA('KFDT_Ballistic_Shell'))
            {
                TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[2])));
            }
        }
        if(((IsCriticalHitActive()) && MyKFPM != none) && IsCriticalHitZone(MyKFPM, HitZoneIdx))
        {
            TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[6])));
        }
        if(IsAoEActive())
        {
            TempDamage -= (float(InDamage) * (GetAeODamageModifier()));
        }
    }
    InDamage = Round(TempDamage);
}

protected static function bool IsDamageIgnoredDT(class<KFDamageType> KFDT)
{
    return default.DamageIgnoredDTs.Find(KFDT.Name != -1;
}

protected function bool IsCriticalHitZone(KFPawn TestPawn, int HitZoneIndex)
{
    if(((TestPawn != none) && HitZoneIndex >= 0) && HitZoneIndex < TestPawn.HitZones.Length)
    {
        return TestPawn.HitZones[HitZoneIndex].DmgScale > 1;
    }
    return false;
}

static function bool IsDamageTypeOnPerk(class<KFDamageType> KFDT)
{
    if((KFDT != none) && IsDamageIgnoredDT(KFDT))
    {
        return false;
    }
    return super.IsDamageTypeOnPerk(KFDT);
}

function ModifyDamageTaken(out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy)
{
    local float TempDamage;

    if(InDamage <= 0)
    {
        return;
    }
    TempDamage = float(InDamage);
    if(ClassIsChildOf(DamageType, Class'KFDT_Explosive'))
    {
        TempDamage *= (float(1) - (GetPassiveValue(ExplosiveResistance, CurrentLevel)));
    }
    InDamage = Round(TempDamage);
}

simulated function ModifySpareAmmoAmount(KFWeapon KFW, out int PrimarySpareAmmo, const optional out STraderItem TraderItem, optional bool bSecondary)
{
    local class<KFPerk> WeaponPerkClass;
    local bool bUsesAmmo;
    local name WeaponClassName;

    bSecondary = false;
    if(KFW == none)
    {
        WeaponPerkClass = TraderItem.AssociatedPerkClass;
        bUsesAmmo = TraderItem.WeaponDef.static.UsesAmmo();
        WeaponClassName = TraderItem.ClassName;        
    }
    else
    {
        WeaponPerkClass = KFW.AssociatedPerkClass;
        bUsesAmmo = KFW.UsesAmmo();
        WeaponClassName = KFW.Class.Name;
    }
    if(bUsesAmmo)
    {
        GivePassiveExtraAmmo(PrimarySpareAmmo, KFW, WeaponPerkClass, WeaponClassName, bSecondary);
        GiveAmmoExtraAmmo(PrimarySpareAmmo, KFW, WeaponPerkClass, WeaponClassName, bSecondary);
    }
}

private final simulated function GivePassiveExtraAmmo(out int PrimarySpareAmmo, KFWeapon KFW, class<KFPerk> WeaponPerkClass, name WeaponClassName, optional bool bSecondary)
{
    bSecondary = false;
    if((ShouldGiveOnlySecondaryAmmo(WeaponClassName)) && !bSecondary)
    {
        return;
    }
    if((IsWeaponOnPerk(KFW, WeaponPerkClass)) && PassiveExtraAmmoIgnoredClassNames.Find(WeaponClassName == -1)
    {
        PrimarySpareAmmo += GetExtraAmmo(CurrentLevel);
    }
}

private final simulated function GiveAmmoExtraAmmo(out int PrimarySpareAmmo, KFWeapon KFW, class<KFPerk> WeaponPerkClass, name WeaponClassName, optional bool bSecondary)
{
    bSecondary = false;
    if((ShouldGiveOnlySecondaryAmmo(WeaponClassName)) && !bSecondary)
    {
        return;
    }
    if((IsWeaponOnPerk(KFW, WeaponPerkClass)) && ExtraAmmoIgnoredClassNames.Find(WeaponClassName == -1)
    {
        PrimarySpareAmmo += (GetAmmoExtraAmmo());
    }
}

simulated function bool ShouldGiveOnlySecondaryAmmo(name WeaponClassName)
{
    return OnlySecondaryAmmoWeapons.Find(WeaponClassName != -1;
}

simulated function ModifyMaxSpareAmmoAmount(KFWeapon KFW, out int MaxSpareAmmo, const optional out STraderItem TraderItem, optional bool bSecondary)
{
    local class<KFPerk> WeaponPerkClass;
    local bool bUsesAmmo;
    local name WeaponClassName;

    bSecondary = false;
    if(KFW == none)
    {
        WeaponPerkClass = TraderItem.AssociatedPerkClass;
        bUsesAmmo = TraderItem.WeaponDef.static.UsesAmmo();
        WeaponClassName = TraderItem.ClassName;        
    }
    else
    {
        WeaponPerkClass = KFW.AssociatedPerkClass;
        bUsesAmmo = KFW.UsesAmmo();
        WeaponClassName = KFW.Class.Name;
    }
    if(bUsesAmmo)
    {
        GivePassiveExtraAmmo(MaxSpareAmmo, KFW, WeaponPerkClass, WeaponClassName, bSecondary);
        GiveAmmoExtraAmmo(MaxSpareAmmo, KFW, WeaponPerkClass, WeaponClassName, bSecondary);
    }
}

private static final simulated function int GetExtraAmmo(int Level)
{
    return int(default.ExplosiveAmmo.Increment * float(FFloor(float(Level) / 5)));
}

simulated function float GetAeORadiusModifier()
{
    local float RadiusModifier;

    RadiusModifier = ((IsAoEActive()) ? GetSkillValue(PerkSkills[5]) : 1);
    RadiusModifier = ((IsProfessionalActive()) ? RadiusModifier + default.ProfessionalAoEModifier : RadiusModifier);
    return RadiusModifier;
}

simulated function float GetAeODamageModifier()
{
    return ((IsAoEActive()) ? default.AoeDamageModifier : 1);
}

protected simulated function int GetAmmoExtraAmmo()
{
    return int(((IsAmmoActive()) ? GetSkillValue(PerkSkills[3]) : 0));
}

simulated function bool GetUsingTactialReload(KFWeapon KFW)
{
    return (IsTacticalReloadActive()) && (IsWeaponOnPerk(KFW)) || IsBackupWeapon(KFW);
}

private final simulated function ResetSupplier()
{
    if(MyPRI != none)
    {
        if(SuppliedPawnList.Length > 0)
        {
            SuppliedPawnList.Remove(0, SuppliedPawnList.Length;
        }
    }
    if(MyPRI != none)
    {
        if(SuppliedPawnList.Length > 0)
        {
            SuppliedPawnList.Remove(0, SuppliedPawnList.Length;
        }
        MyPRI.bPerkCanSupply = true;
        if(InteractionTrigger != none)
        {
            InteractionTrigger.Destroy();
            InteractionTrigger = none;
        }
        if(CheckOwnerPawn())
        {
            InteractionTrigger = Spawn(Class'KFUsablePerkTrigger', OwnerPawn,, OwnerPawn.Location, OwnerPawn.Rotation,, true);
            InteractionTrigger.SetBase(OwnerPawn);
            InteractionTrigger.SetInteractionIndex(3);
            OwnerPC.SetPendingInteractionMessage();
        }        
    }
    else
    {
        if(InteractionTrigger != none)
        {
            InteractionTrigger.Destroy();
        }
    }
}

simulated function Interact(KFPawn_Human KFPH)
{
    local KFInventoryManager KFIM;
    local KFPlayerController KFPC;
    local KFPlayerReplicationInfo OwnerPRI, UserPRI;
    local bool bReceivedGrenades;

    if(SuppliedPawnList.Find(KFPH != -1)
    {
        return;
    }
    KFIM = KFInventoryManager(KFPH.InvManager);
    if(KFIM != none)
    {
        bReceivedGrenades = KFIM.AddGrenades(1);
    }
    if(bReceivedGrenades)
    {
        SuppliedPawnList.AddItem(KFPH;
        if(Role == ROLE_Authority)
        {
            KFPC = KFPlayerController(KFPH.Controller);
            if(KFPC != none)
            {
                OwnerPC.ReceiveLocalizedMessage(Class'KFLocalMessage_Game', 18, KFPC.PlayerReplicationInfo);
                KFPC.ReceiveLocalizedMessage(Class'KFLocalMessage_Game', 17, OwnerPC.PlayerReplicationInfo);
                UserPRI = KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo);
                OwnerPRI = KFPlayerReplicationInfo(OwnerPC.PlayerReplicationInfo);
                if((UserPRI != none) && OwnerPRI != none)
                {
                    UserPRI.MarkSupplierOwnerUsed(OwnerPRI);
                }
            }
        }
    }
}

simulated function bool CanInteract(KFPawn_Human MyKFPH)
{
    return SuppliedPawnList.Find(MyKFPH == -1;
}

simulated function bool ShouldSacrifice()
{
    return IsSacrificeActive() && !bUsedSacrifice;
}

function NotifyPerkSacrificeExploded()
{
    bUsedSacrifice = true;
}

static simulated function ModifyExplosiveDamage(out float InDamage)
{
    InDamage -= (InDamage * GetSharedExplosiveResistance());
}

simulated function bool CanExplosiveWeld()
{
    return IsDoorTrapsActive();
}

simulated function bool ShouldRandSirenResist()
{
    return IsSirenResistanceActive();
}

function float GetKnockdownPowerModifier(optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting)
{
    local float KnockDownMultiplier;

    bIsSprinting = false;
    KnockDownMultiplier = 1;
    if(IsDamageTypeOnPerk(class<KFDamageType>(DamageType)))
    {
        if(IsConcussiveForceActive())
        {
            KnockDownMultiplier += (GetSkillValue(PerkSkills[7]));
        }
        if(IsTacticalReloadActive())
        {
            KnockDownMultiplier += (GetSkillValue(PerkSkills[1]));
        }
    }
    return KnockDownMultiplier;
}

function float GetStumblePowerModifier(optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart)
{
    local float StumbleMultiplier;

    StumbleMultiplier = 1;
    if(IsConcussiveForceActive() && IsDamageTypeOnPerk(DamageType))
    {
        StumbleMultiplier += (GetSkillValue(PerkSkills[7]));
    }
    return StumbleMultiplier;
}

function float GetStunPowerModifier(optional class<DamageType> DamageType, optional byte HitZoneIdx)
{
    local float StunMultiplier;

    StunMultiplier = 1;
    if(IsConcussiveForceActive() && IsDamageTypeOnPerk(class<KFDamageType>(DamageType)))
    {
        StunMultiplier += (GetSkillValue(PerkSkills[7]));
    }
    return StunMultiplier;
}

function float GetReactionModifier(optional class<KFDamageType> DamageType)
{
    local float ReactionMultiplier;

    ReactionMultiplier = 1;
    if(IsConcussiveForceActive() && IsDamageTypeOnPerk(DamageType))
    {
        ReactionMultiplier += (GetSkillValue(PerkSkills[7]));
    }
    return ReactionMultiplier;
}

static simulated function bool ProjectileShouldNuke(KFProjectile Proj)
{
    return default.NukeIgnoredProjectileNames.Find(Proj.Class.Name == -1;
}

simulated function bool DoorShouldNuke()
{
    return IsNukeActive() && WorldInfo.TimeDilation < 1;
}

simulated function bool ShouldNeverDud()
{
    return (IsNukeActive() || IsProfessionalActive()) && WorldInfo.TimeDilation < 1;
}

simulated function float GetZedTimeModifier(KFWeapon W)
{
    local name StateName;

    StateName = W.GetStateName();
    if(IsProfessionalActive() && IsWeaponOnPerk(W))
    {
        if(ZedTimeModifyingStates.Find(StateName != -1)
        {
            return GetSkillValue(PerkSkills[9]);
        }
    }
    return 0;
}

simulated function bool IsDamageActive()
{
    return PerkSkills[0].bActive;
}

simulated function bool IsTacticalReloadActive()
{
    return PerkSkills[1].bActive;
}

simulated function bool IsDirectHitActive()
{
    return PerkSkills[2].bActive;
}

simulated function bool IsAmmoActive()
{
    return PerkSkills[3].bActive;
}

simulated function bool IsAoEActive()
{
    return PerkSkills[5].bActive;
}

simulated function bool IsCriticalHitActive()
{
    return PerkSkills[6].bActive;
}

private final simulated function bool IsProfessionalActive()
{
    return PerkSkills[9].bActive && WorldInfo.TimeDilation < 1;
}

private static final simulated function float GetSharedExplosiveResistance()
{
    return default.SharedExplosiveResistance;
}

static simulated function float GetExplosiveResistanceRadius()
{
    return default.ExplosiveResistanceRadius;
}

static function bool IsDmgTypeExplosiveResistable(class<DamageType> dmgType)
{
    return ClassIsChildOf(dmgType, default.ExplosiveResistableDamageTypeSuperClass);
}

static function GameExplosion GetSacrificeExplosionTemplate()
{
    return default.SacrificeExplosionTemplate;
}

private final simulated function bool IsDoorTrapsActive()
{
    return true;
}

private final simulated function bool IsSacrificeActive()
{
    return true;
}

static function GameExplosion GetDoorTrapsExplosionTemplate()
{
    return default.DoorTrapExplosionTemplate;
}

private final simulated function bool IsSirenResistanceActive()
{
    return PerkSkills[4].bActive;
}

private final simulated function bool IsNukeActive()
{
    return PerkSkills[8].bActive;
}

static simulated function KFGameExplosion GetNukeExplosionTemplate()
{
    return default.NukeExplosionTemplate;
}

static simulated function class<KFExplosionActor> GetNukeExplosionActorClass()
{
    local class<KFExplosionActor> TempExplosionActorClass;

    TempExplosionActorClass = class<KFExplosionActor>(DynamicLoadObject(default.NukeExplosionActorClassName, Class'Class'));
    return TempExplosionActorClass;
}

static simulated function class<KFProjectile> GetNukeProjectileClass()
{
    local class<KFProjectile> ProjectileClass;

    ProjectileClass = class<KFProjectile>(DynamicLoadObject(default.NukeProjectileClassName, Class'Class'));
    return ProjectileClass;
}

static function float GetNukeDamageModifier()
{
    return default.NukeDamageModifier;
}

static function float GetNukeRadiusModifier()
{
    return default.NukeRadiusModifier;
}

static function int GetLingeringPoisonDamage()
{
    return default.LingeringNukePoisonDamage;
}

static function class<KFDamageType> GetLingeringDamageType()
{
    return default.LingeringNukeDamageType;
}

private final simulated function bool IsConcussiveForceActive()
{
    return PerkSkills[7].bActive;
}

static final simulated function AkEvent GetConcussiveExplosionSound()
{
    return default.ConcussiveExplosionSound;
}

static simulated function int GetFleshpoundKillXP(byte Difficulty)
{
    return default.SecondaryXPModifier[Difficulty];
}

static simulated function GetPassiveStrings(out array<string> PassiveValues, out array<string> Increments, byte Level)
{
    PassiveValues[0] = string(Round((GetPassiveValue(default.ExplosiveDamage, Level)) * float(100))) $ "%";
    PassiveValues[1] = string(Round((GetPassiveValue(default.ExplosiveResistance, Level)) * float(100))) $ "%";
    PassiveValues[2] = string(GetExtraAmmo(Level));
    PassiveValues[3] = "";
    PassiveValues[4] = "";
    PassiveValues[5] = "";
    Increments[0] = ((("[" @ string(Round(default.ExplosiveDamage.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
    Increments[1] = (((((("[" @ string(Round(default.ExplosiveResistance.StartingValue * float(100)))) $ "%") @ "+") @ string(int(default.ExplosiveResistance.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
    Increments[2] = ((("[" @ string(Round(default.ExplosiveAmmo.Increment))) @ "/ 5") @ default.LevelString) @ "]";
    Increments[3] = "";
    Increments[4] = "";
    Increments[5] = "";
}

simulated function LogPerkSkills()
{
    super.LogPerkSkills();
    if(bLogPerk)
    {
        LogInternal("PASSIVE PERKS");
        LogInternal(("-ExplosiveDamage:" @ string(GetPassiveValue(ExplosiveDamage, GetLevel()))) $ "%");
        LogInternal(("-ExplosiveResistance:" @ string(GetPassiveValue(ExplosiveResistance, GetLevel()))) $ "%");
        LogInternal(("-ExplosiveAmmo:" @ string(GetExtraAmmo(GetLevel()))) $ "%");
    }
}

defaultproperties
{
    ExplosiveDamage=(Name="Explosive Damage",Increment=0.01,Rank=0,StartingValue=0,MaxValue=0.25,ModifierValue=0,IconPath="",bActive=false)
    ExplosiveResistance=(Name="Explosive Resistance",Increment=0.02,Rank=0,StartingValue=0.1,MaxValue=0.6,ModifierValue=0,IconPath="",bActive=false)
    ExplosiveAmmo=(Name="Explosive Ammo",Increment=1,Rank=0,StartingValue=0,MaxValue=5,ModifierValue=0,IconPath="",bActive=false)
    SharedExplosiveResistance=0.3
    ExplosiveResistableDamageTypeSuperClass=Class'KFDT_Explosive'
    ExplosiveResistanceRadius=500
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'WEP_Dynamite_ARCH.Dynamite_Explosion'
        MyDamageType=Class'KFDT_Explosive_Sacrifice'
        KnockDownRadius=100
        KnockDownStrength=10
        ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_Frag.Play_WEP_EXP_Grenade_Frag_Explosion'
        FractureMeshRadius=500
        CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
        CamShakeFalloff=0.5
    object end
    // Reference: KFGameExplosion'Default__KFPerk_Demolitionist.ExploTemplate0'
    SacrificeExplosionTemplate=ExploTemplate0
    begin object name=ExploTemplate1 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.Nuke_Explosion'
        Damage=45
        DamageRadius=450
        MyDamageType=Class'KFDT_Toxic_DemoNuke'
        KnockDownStrength=0
        MomentumTransferScale=1
        ExplosionSound=AkEvent'WW_GLO_Runtime.Play_WEP_Nuke_Explo'
        CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
        CamShakeInnerRadius=200
        CamShakeFalloff=1.5
    object end
    // Reference: KFGameExplosion'Default__KFPerk_Demolitionist.ExploTemplate1'
    NukeExplosionTemplate=ExploTemplate1
    begin object name=ExploTemplate2 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'WEP_Dynamite_ARCH.Dynamite_Explosion'
        DamageRadius=1000
        MyDamageType=Class'KFDT_Explosive_DoorTrap'
        KnockDownRadius=100
        KnockDownStrength=10
        ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_Frag.Play_WEP_EXP_Grenade_Frag_Explosion'
        FractureMeshRadius=500
        CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
        CamShakeFalloff=0.5
    object end
    // Reference: KFGameExplosion'Default__KFPerk_Demolitionist.ExploTemplate2'
    DoorTrapExplosionTemplate=ExploTemplate2
    NukeExplosionActorClassName="KFGameContent.KFExplosion_Nuke"
    NukeProjectileClassName="KFGameContent.KFProj_ExplosiveSubmunition_HX25_Nuke"
    NukeIgnoredProjectileNames(0)=KFProj_ExplosiveSubmunition_HX25
    NukeIgnoredProjectileNames(1)=KFProj_ExplosiveSubmunition_HX25_Nuke
    NukeDamageModifier=1.5
    NukeRadiusModifier=1.35
    ConcussiveExplosionSound=AkEvent'WW_GLO_Runtime.Play_WEP_Demo_Conc'
    AoeDamageModifier=0.3
    LingeringNukePoisonDamage=20
    PassiveExtraAmmoIgnoredClassNames(0)=KFProj_DynamiteGrenade
    ExtraAmmoIgnoredClassNames(0)=KFProj_DynamiteGrenade
    ExtraAmmoIgnoredClassNames(1)=KFWeap_Thrown_C4
    OnlySecondaryAmmoWeapons(0)=KFWeap_AssaultRifle_M16M203
    DamageIgnoredDTs(0)=KFDT_Ballistic_M16M203
    DamageIgnoredDTs(1)=KFDT_Bludgeon_M16M203
    ProfessionalAoEModifier=0.25
    LingeringNukeDamageType=Class'KFDT_DemoNuke_Toxic_Lingering'
    ProgressStatID=60
    PerkBuildStatID=61
    SecondaryXPModifier[0]=10
    SecondaryXPModifier[1]=17
    SecondaryXPModifier[2]=21
    SecondaryXPModifier[3]=30
    PerkName="Demolitionist"
    Passives(0)=(Title="Perk Weapon Damage",Description="Perk weapon damage increases %x% per level",IconPath="")
    Passives(1)=(Title="Explosive Resistance",Description="Explosive resistance gains 10% and increases %x% per level",IconPath="")
    Passives(2)=(Title="Extra Explosive Ammo",Description="Explosive ammo increases %x% every five levels",IconPath="")
    Passives(3)=(Title="+Grenade Supplier",Description="Teammates can get one grenade from you each wave",IconPath="")
    Passives(4)=(Title="+Door Traps",Description="Doors you weld will explode when destroyed",IconPath="")
    Passives(5)=(Title="Reactive Armor",Description="When first reduced to 0 Health your armor will explode and leave you with 1 Health",IconPath="")
    SkillCatagories[0]="Technique"
    SkillCatagories[1]="Explosives"
    SkillCatagories[2]="Advanced Techniques"
    SkillCatagories[3]="Weapon Techniques"
    SkillCatagories[4]="Advanced Explosives"
    EXPAction1="Dealing Demolitionist weapon damage"
    EXPAction2="Killing Fleshpounds with Demolitionist weapons"
    PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Demolition'
    InteractIcon=Texture2D'UI_World_TEX.Demolitionist_Supplier_HUD'
    PerkSkills(0)=(Name="Damage",Increment=0,Rank=0,StartingValue=0.25,MaxValue=0.25,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_GrenadeSupplier",bActive=false)
    PerkSkills(1)=(Name="Speed",Increment=0,Rank=0,StartingValue=0.1,MaxValue=0.1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Speed",bActive=false)
    PerkSkills(2)=(Name="DirectHit",Increment=0,Rank=0,StartingValue=0.25,MaxValue=0.25,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_ExplosiveResistance",bActive=false)
    PerkSkills(3)=(Name="Ammo",Increment=0,Rank=0,StartingValue=5,MaxValue=5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Ammo",bActive=false)
    PerkSkills(4)=(Name="SirenResistance",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_SirenResistance",bActive=false)
    PerkSkills(5)=(Name="AreaOfEffect",Increment=0,Rank=0,StartingValue=1.5,MaxValue=1.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_AoE",bActive=false)
    PerkSkills(6)=(Name="CriticalHit",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Crit",bActive=false)
    PerkSkills(7)=(Name="ConcussiveForce",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_ConcussiveForce",bActive=false)
    PerkSkills(8)=(Name="Nuke",Increment=0,Rank=0,StartingValue=1.03,MaxValue=1.03,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Nuke",bActive=false)
    PerkSkills(9)=(Name="Professional",Increment=0,Rank=0,StartingValue=0.9,MaxValue=0.9,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Professional",bActive=false)
    ZedTimeModifyingStates(0)=WeaponFiring
    ZedTimeModifyingStates(1)=WeaponBurstFiring
    ZedTimeModifyingStates(2)=WeaponSingleFiring
    ZedTimeModifyingStates(3)=Reloading
    ZedTimeModifyingStates(4)=WeaponSingleFireAndReload
    ZedTimeModifyingStates(5)=FiringSecondaryState
    ZedTimeModifyingStates(6)=AltReloading
    PrimaryWeaponDef=Class'KFWeapDef_HX25'
    KnifeWeaponDef=Class'KFWeapDef_Knife_Demo'
    GrenadeWeaponDef=Class'KFWeapDef_Grenade_Demo'
    AutoBuyLoadOutPath(0)=class'KFWeapDef_HX25'
    AutoBuyLoadOutPath(1)=class'KFWeapDef_M79'
    AutoBuyLoadOutPath(2)=class'KFWeapDef_M16M203'
    AutoBuyLoadOutPath(3)=class'KFWeapDef_RPG7'
    HitAccuracyHandicap=2
}