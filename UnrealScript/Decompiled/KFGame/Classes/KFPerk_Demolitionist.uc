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
    EDemoGrenadeSupplier,
    EDemoOnContact,
    EDemoExplosiveResistance,
    EDemoSacrifice,
    EDemoDoorTraps,
    EDemoSirenResistance,
    EDemoOffPerk,
    EDemoOnPerk,
    EDemoNuke,
    EDemoConcussiveForce,
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
var string SacrificeExplosionDamageTypeName;
var string DoorTrapsExplosionDamageTypeName;
var array<name> NukeIgnoredProjectileNames;
var private const float NukeDamageModifier;
var private const float NukeRadiusModifier;
var AkEvent ConcussiveExplosionSound;
var private bool bUsedSacrifice;

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

    TempDamage = float(InDamage);
    if(DamageCauser != none)
    {
        KFW = GetWeaponFromDamageCauser(DamageCauser);
    }
    if(((KFW != none) && IsWeaponOnPerk(KFW)) || (DamageType != none) && IsDamageTypeOnPerk(DamageType))
    {
        TempDamage += ((float(InDamage) * (GetPassiveValue(ExplosiveDamage, CurrentLevel))) - float(InDamage));        
    }
    else
    {
        if(IsOffPerkActive())
        {
            TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[6])));
        }
    }
    InDamage = Round(TempDamage);
}

function ModifyDamageTaken(out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy)
{
    local float TempDamage;

    TempDamage = float(InDamage);
    if(ClassIsChildOf(DamageType, Class'KFDT_Explosive'))
    {
        TempDamage *= (float(1) - (GetPassiveValue(ExplosiveResistance, CurrentLevel)));
    }
    InDamage = Round(TempDamage);
}

simulated function ModifySpareAmmoAmount(KFWeapon KFW, out int PrimarySpareAmmo, const optional out STraderItem TraderItem)
{
    local class<KFPerk> WeaponPerkClass;
    local bool bUsesAmmo;

    if(KFW == none)
    {
        WeaponPerkClass = TraderItem.AssociatedPerkClass;
        bUsesAmmo = TraderItem.WeaponDef.static.UsesAmmo();        
    }
    else
    {
        WeaponPerkClass = KFW.AssociatedPerkClass;
        bUsesAmmo = KFW.UsesAmmo();
    }
    if(bUsesAmmo && IsWeaponOnPerk(KFW, WeaponPerkClass))
    {
        PrimarySpareAmmo += GetExtraAmmo(CurrentLevel);
    }
}

simulated function ModifyMaxSpareAmmoAmount(KFWeapon KFW, out int MaxSpareAmmo, const optional out STraderItem TraderItem)
{
    local class<KFPerk> WeaponPerkClass;
    local bool bUsesAmmo;

    if(KFW == none)
    {
        WeaponPerkClass = TraderItem.AssociatedPerkClass;
        bUsesAmmo = TraderItem.WeaponDef.static.UsesAmmo();        
    }
    else
    {
        WeaponPerkClass = KFW.AssociatedPerkClass;
        bUsesAmmo = KFW.UsesAmmo();
    }
    if(bUsesAmmo && IsWeaponOnPerk(KFW, WeaponPerkClass))
    {
        MaxSpareAmmo += GetExtraAmmo(CurrentLevel);
    }
}

private static final simulated function int GetExtraAmmo(int Level)
{
    return int(default.ExplosiveAmmo.Increment * float(FFloor(float(Level) / 5)));
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
    if((MyPRI != none) && IsSupplierActive())
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

    if(SuppliedPawnList.Find(KFPH != -1)
    {
        return;
    }
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
    KFIM = KFInventoryManager(KFPH.InvManager);
    if(KFIM != none)
    {
        KFIM.AddGrenades(1);
    }
    SuppliedPawnList.AddItem(KFPH;
}

simulated function bool CanInteract(KFPawn_Human MyKFPH)
{
    return (IsSupplierActive()) && SuppliedPawnList.Find(MyKFPH == -1;
}

static simulated function ModifyExplosiveDamage(out float InDamage)
{
    InDamage -= (InDamage * GetSharedExplosiveResistance());
}

simulated function bool ShouldSacrifice()
{
    return IsSacrificeActive() && !bUsedSacrifice;
}

function NotifyPerkSacrificeExploded()
{
    bUsedSacrifice = true;
}

simulated function ModifyWeldingRate(out float FastenRate, out float UnfastenRate)
{
    local float WeldingModifier;

    if(IsDoorTrapsActive())
    {
        WeldingModifier = GetSkillValue(PerkSkills[4]);
        FastenRate *= (float(1) - WeldingModifier);
        UnfastenRate *= (float(1) - WeldingModifier);
    }
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
        KnockDownMultiplier += ((IsOnPerkActive()) ? GetSkillValue(PerkSkills[7]) : 0);
        KnockDownMultiplier += ((IsConcussiveForceActive()) ? GetSkillValue(PerkSkills[9]) : 0);
    }
    return KnockDownMultiplier;
}

function float GetStumblePowerModifier(optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart)
{
    if(IsOnPerkActive() && IsDamageTypeOnPerk(DamageType))
    {
        return 1 + (GetSkillValue(PerkSkills[7]));
    }
    return 1;
}

function float GetStunPowerModifier(optional class<DamageType> DamageType, optional byte HitZoneIdx)
{
    if(IsOnPerkActive() && IsDamageTypeOnPerk(class<KFDamageType>(DamageType)))
    {
        return 1 + (GetSkillValue(PerkSkills[7]));
    }
    return 1;
}

static simulated function bool ProjectileShouldNuke(KFProjectile Proj)
{
    return default.NukeIgnoredProjectileNames.Find(Proj.Class.Name == -1;
}

simulated function bool IsSupplierActive()
{
    return PerkSkills[0].bActive;
}

simulated function bool IsOnContactActive()
{
    return PerkSkills[1].bActive;
}

simulated function bool IsSharedExplosiveResistaneActive()
{
    return PerkSkills[2].bActive;
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

static function class<KFDamageType> GetSacrificeDamageTypeClass()
{
    local class<KFDamageType> DamageTypeClass;

    DamageTypeClass = class<KFDamageType>(DynamicLoadObject(default.SacrificeExplosionDamageTypeName, Class'Class'));
    return DamageTypeClass;
}

private final simulated function bool IsSacrificeActive()
{
    return PerkSkills[3].bActive;
}

private final simulated function bool IsDoorTrapsActive()
{
    return PerkSkills[4].bActive;
}

static function GameExplosion GetDoorTrapsExplosionTemplate()
{
    return default.DoorTrapExplosionTemplate;
}

static function class<KFDamageType> GetDoorTrapsDamageTypeClass()
{
    local class<KFDamageType> DamageTypeClass;

    DamageTypeClass = class<KFDamageType>(DynamicLoadObject(default.DoorTrapsExplosionDamageTypeName, Class'Class'));
    return DamageTypeClass;
}

private final simulated function bool IsSirenResistanceActive()
{
    return PerkSkills[5].bActive;
}

private final simulated function bool IsOnPerkActive()
{
    return PerkSkills[7].bActive;
}

private final simulated function bool IsOffPerkActive()
{
    return PerkSkills[6].bActive;
}

private final simulated function bool IsNukeActive()
{
    return PerkSkills[8].bActive;
}

static simulated function KFGameExplosion GetNukeExplosionTemplate()
{
    return default.NukeExplosionTemplate;
}

static simulated function class<GameExplosionActor> GetNukeExplosionActorClass()
{
    local class<GameExplosionActor> TempExplosionActorClass;

    TempExplosionActorClass = class<GameExplosionActor>(DynamicLoadObject(default.NukeExplosionActorClassName, Class'Class'));
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

private final simulated function bool IsConcussiveForceActive()
{
    return PerkSkills[9].bActive && WorldInfo.TimeDilation < 1;
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
    PassiveValues[0] = string(Round(((GetPassiveValue(default.ExplosiveDamage, Level)) * float(100)) - float(100))) $ "%";
    PassiveValues[1] = string(Round((GetPassiveValue(default.ExplosiveResistance, Level)) * float(100))) $ "%";
    PassiveValues[2] = string(GetExtraAmmo(Level));
    Increments[0] = ((("[" @ string(Round(default.ExplosiveDamage.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
    Increments[1] = (((((("[" @ string(Round(default.ExplosiveResistance.StartingValue * float(100)))) $ "%") @ "+") @ string(int(default.ExplosiveResistance.Increment * float(100)))) $ "% /") @ default.LevelString) @ "]";
    Increments[2] = ((("[" @ string(Round(default.ExplosiveAmmo.Increment))) @ "/ 5") @ default.LevelString) @ "]";
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
        LogInternal("Skill Tree");
        LogInternal("-GrenadeSupplier:" @ string(PerkSkills[0].bActive));
        LogInternal("-OnContact:" @ string(PerkSkills[1].bActive));
        LogInternal("-ExplosiveResistance:" @ string(PerkSkills[2].bActive));
        LogInternal("-Sacrifice:" @ string(PerkSkills[3].bActive));
        LogInternal("-DoorTraps:" @ string(PerkSkills[4].bActive));
        LogInternal("-SirenResistance:" @ string(PerkSkills[5].bActive));
        LogInternal("-OffPerk:" @ string(PerkSkills[6].bActive));
        LogInternal("-OnPerk:" @ string(PerkSkills[7].bActive));
        LogInternal("-Nuke:" @ string(PerkSkills[8].bActive));
        LogInternal("-ConcussiveForce:" @ string(PerkSkills[9].bActive));
    }
}

defaultproperties
{
    ExplosiveDamage=(Name="Explosive Damage",Increment=0.01,Rank=0,StartingValue=1,MaxValue=1.25,ModifierValue=0,IconPath="",bActive=false)
    ExplosiveResistance=(Name="Explosive Resistance",Increment=0.02,Rank=0,StartingValue=0.1,MaxValue=0.6,ModifierValue=0,IconPath="",bActive=false)
    ExplosiveAmmo=(Name="Explosive Ammo",Increment=1,Rank=0,StartingValue=0,MaxValue=5,ModifierValue=0,IconPath="",bActive=false)
    SharedExplosiveResistance=0.3
    ExplosiveResistableDamageTypeSuperClass=Class'KFDT_Explosive'
    ExplosiveResistanceRadius=500
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'WEP_Dynamite_ARCH.Dynamite_Explosion'
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
        Damage=15
        DamageRadius=450
        DamageFalloffExponent=0
        MyDamageType=Class'KFDT_Toxic_DemoNuke'
        KnockDownStrength=0
        MomentumTransferScale=1
        ExplosionSound=AkEvent'WW_GLO_Runtime.Play_WEP_Nuke_Explo'
        FractureMeshRadius=0
        FracturePartVel=0
        CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
    object end
    // Reference: KFGameExplosion'Default__KFPerk_Demolitionist.ExploTemplate1'
    NukeExplosionTemplate=ExploTemplate1
    begin object name=ExploTemplate2 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'WEP_Dynamite_ARCH.Dynamite_Explosion'
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
    SacrificeExplosionDamageTypeName="KFGameContent.KFDT_Explosive_Sacrifice"
    DoorTrapsExplosionDamageTypeName="KFGameContent.KFDT_Explosive_DoorTrap"
    NukeIgnoredProjectileNames(0)=KFProj_ExplosiveSubmunition_HX25
    NukeIgnoredProjectileNames(1)=KFProj_ExplosiveSubmunition_HX25_Nuke
    NukeDamageModifier=1.25
    NukeRadiusModifier=1.25
    ConcussiveExplosionSound=AkEvent'WW_GLO_Runtime.Play_WEP_Demo_Conc'
    ProgressStatID=60
    PerkBuildStatID=61
    SecondaryXPModifier[0]=10
    SecondaryXPModifier[1]=17
    SecondaryXPModifier[2]=21
    SecondaryXPModifier[3]=30
    PerkName="Demolitionist"
    Passives(0)=(Title="Perk Weapon Damage",Description="Perk weapon damage increased by %x%",IconPath="")
    Passives(1)=(Title="Explosive Resistance",Description="%x% resistance to explosive damage",IconPath="")
    Passives(2)=(Title="Extra Explosive Ammo",Description="%x% more starting explosive ammo",IconPath="")
    Passives(3)=(Title="",Description="",IconPath="")
    Passives(4)=(Title="",Description="",IconPath="")
    SkillCatagories[0]="Technique"
    SkillCatagories[1]="Resistance"
    SkillCatagories[2]="Advanced Techniques"
    SkillCatagories[3]="Weapon Techniques"
    SkillCatagories[4]="Advanced Explosives"
    EXPAction1="Dealing Demolitionist weapon damage"
    EXPAction2="Killing Fleshpounds with Demolitionist weapons"
    PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Demolition'
    InteractIcon=Texture2D'UI_World_TEX.Demolitionist_Supplier_HUD'
    PerkSkills(0)=(Name="GrenadeSupplier",Increment=0,Rank=0,StartingValue=0,MaxValue=0,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_GrenadeSupplier",bActive=false)
    PerkSkills(1)=(Name="OnContact",Increment=0,Rank=0,StartingValue=0,MaxValue=0,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_OnContact",bActive=false)
    PerkSkills(2)=(Name="ExplosiveResistance",Increment=0.02,Rank=0,StartingValue=0.1,MaxValue=0.6,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_ExplosiveResistance",bActive=false)
    PerkSkills(3)=(Name="Sacrifice",Increment=0,Rank=0,StartingValue=2,MaxValue=2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Sacrifice",bActive=false)
    PerkSkills(4)=(Name="DoorTraps",Increment=0,Rank=0,StartingValue=0.3,MaxValue=0.3,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_DoorTraps",bActive=false)
    PerkSkills(5)=(Name="SirenResistance",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_SirenResistance",bActive=false)
    PerkSkills(6)=(Name="OffPerk",Increment=0,Rank=0,StartingValue=0.1,MaxValue=0.1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_OffPerk",bActive=false)
    PerkSkills(7)=(Name="OnPerk",Increment=0,Rank=0,StartingValue=0.3,MaxValue=0.3,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_OnPerk",bActive=false)
    PerkSkills(8)=(Name="Nuke",Increment=0,Rank=0,StartingValue=1.03,MaxValue=1.03,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Nuke",bActive=false)
    PerkSkills(9)=(Name="ConcussiveForce",Increment=0,Rank=0,StartingValue=1,MaxValue=1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_ConcussiveForce",bActive=false)
    PrimaryWeaponDef=Class'KFWeapDef_HX25'
    KnifeWeaponDef=Class'KFWeapDef_Knife_Demo'
    GrenadeWeaponDef=Class'KFWeapDef_Grenade_Demo'
    HitAccuracyHandicap=2
}