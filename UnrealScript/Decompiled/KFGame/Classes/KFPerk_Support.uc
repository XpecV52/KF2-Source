/*******************************************************************************
 * KFPerk_Support generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPerk_Support extends KFPerk
    native
    config(Game)
    hidecategories(Navigation,Movement,Collision,Mobile,Object,Debug,Advanced,Physics,Actor,Attachment,Display);

enum ESupportPerkSkills
{
    ESupportHighCapMags,
    ESupportTacticalReload,
    ESupportFortitude,
    ESupportSalvo,
    ESupportAPShot,
    ESupportTightChoke,
    ESupportResupply,
    ESupportConcussionRounds,
    ESupportPerforate,
    ESupportBarrage,
    ESupportPerkSkills_MAX
};

struct native sSuppliedPawnInfo
{
    var KFPawn_Human SuppliedPawn;
    var bool bSuppliedAmmo;
    var bool bSuppliedArmor;

    structdefaultproperties
    {
        SuppliedPawn=none
        bSuppliedAmmo=false
        bSuppliedArmor=false
    }
};

var private const PerkSkill Ammo;
var private const PerkSkill WeldingProficiency;
var private const PerkSkill ShotgunDamage;
var private const PerkSkill ShotgunPenetration;
var private const PerkSkill Strength;
var private array<sSuppliedPawnInfo> SuppliedPawnList;
var private const float BarrageFiringRate;
var private const float ResupplyMaxSpareAmmoModifier;
var private const AkEvent ReceivedAmmoSound;
var private const AkEvent ReceivedArmorSound;
var private const AkEvent ReceivedAmmoAndArmorSound;

function ApplySkillsToPawn()
{
    local KFInventoryManager KFIM;

    super.ApplySkillsToPawn();
    if(OwnerPawn != none)
    {
        KFIM = KFInventoryManager(OwnerPawn.InvManager);
        if(KFIM != none)
        {
            KFIM.MaxCarryBlocks = byte(float(KFIM.default.MaxCarryBlocks) + GetExtraStrength(CurrentLevel));
        }
    }
    ResetSupplier();
}

private static final simulated function float GetExtraStrength(int Level)
{
    return default.Strength.Increment * float(FFloor(float(Level) / 5));
}

private final simulated function ResetSupplier()
{
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
            InteractionTrigger.SetInteractionIndex(2);
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

simulated function ModifyDamageGiven(out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx)
{
    local KFWeapon KFW;
    local float TempDamage;

    TempDamage = float(InDamage);
    TempDamage = float(InDamage);
    if(DamageCauser != none)
    {
        KFW = GetWeaponFromDamageCauser(DamageCauser);
    }
    if((((KFW != none) && IsWeaponOnPerk(KFW)) || (DamageType != none) && IsDamageTypeOnPerk(DamageType)) && !ClassIsChildOf(DamageType, Class'KFDT_Explosive'))
    {
        TempDamage += (float(InDamage) * (GetPassiveValue(ShotgunDamage, CurrentLevel)));
        if(IsSalvoActive())
        {
            TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[3])));
        }
    }
    InDamage = Round(TempDamage);
}

simulated function ModifyWeldingRate(out float FastenRate, out float UnfastenRate)
{
    local float WeldingModifier;

    WeldingModifier = GetPassiveValue(WeldingProficiency, CurrentLevel);
    FastenRate *= WeldingModifier;
    UnfastenRate *= WeldingModifier;
}

simulated function float GetPenetrationModifier(byte Level, class<KFDamageType> DamageType, optional bool bForce)
{
    local float PenetrationPower;

    if(!bForce && (DamageType == none) || !IsDamageTypeOnPerk(DamageType))
    {
        return 0;
    }
    PenetrationPower = ((IsAPShotActive()) ? GetSkillValue(PerkSkills[4]) : 0);
    PenetrationPower = ((IsPerforateActive()) ? GetSkillValue(PerkSkills[8]) : PenetrationPower);
    return PenetrationPower + (GetPassiveValue(ShotgunPenetration, Level));
}

simulated function bool IgnoresPenetrationDmgReduction()
{
    return IsPerforateActive();
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
            if(IsHighCapMagsMagActive())
            {
                TempCapacity += (float(MagazineCapacity) * (GetSkillValue(PerkSkills[0])));
            }
        }
    }
    MagazineCapacity = byte(Round(TempCapacity));
}

simulated function ModifySpareAmmoAmount(KFWeapon KFW, out int PrimarySpareAmmo, const optional out STraderItem TraderItem, optional bool bSecondary)
{
    local float TempSpareAmmoAmount;
    local class<KFPerk> WeaponPerkClass;

    WeaponPerkClass = ((KFW == none) ? TraderItem.AssociatedPerkClass : KFW.AssociatedPerkClass);
    if(IsWeaponOnPerk(KFW, WeaponPerkClass))
    {
        TempSpareAmmoAmount = float(PrimarySpareAmmo);
        TempSpareAmmoAmount += (float(PrimarySpareAmmo) * (GetPassiveValue(Ammo, CurrentLevel)));
        PrimarySpareAmmo = Round(TempSpareAmmoAmount);
    }
}

simulated function ModifyMaxSpareAmmoAmount(KFWeapon KFW, out int MaxSpareAmmo, const optional out STraderItem TraderItem, optional bool bSecondary)
{
    local float TempMaxSpareAmmoAmount;
    local class<KFPerk> WeaponPerkClass;

    bSecondary = false;
    WeaponPerkClass = ((KFW == none) ? TraderItem.AssociatedPerkClass : KFW.AssociatedPerkClass);
    if((IsWeaponOnPerk(KFW, WeaponPerkClass)) && MaxSpareAmmo > 0)
    {
        TempMaxSpareAmmoAmount = float(MaxSpareAmmo);
        TempMaxSpareAmmoAmount += (float(MaxSpareAmmo) * (GetPassiveValue(Ammo, CurrentLevel)));
        if(IsResupplyActive())
        {
            TempMaxSpareAmmoAmount += (float(MaxSpareAmmo) * GetResupplyMaxSpareAmmoModifier());
        }
        MaxSpareAmmo = Round(TempMaxSpareAmmoAmount);
    }
}

private static final simulated function float GetResupplyMaxSpareAmmoModifier()
{
    return default.ResupplyMaxSpareAmmoModifier;
}

simulated function bool GetUsingTactialReload(KFWeapon KFW)
{
    return IsTacticalReloadActive() && (IsWeaponOnPerk(KFW)) || IsBackupWeapon(KFW);
}

function ModifyHealth(out int InHealth)
{
    local float TempHealth;

    if(IsFortitudeActive())
    {
        TempHealth = float(InHealth);
        TempHealth += (float(InHealth) * (GetSkillValue(PerkSkills[2])));
        InHealth = FCeil(TempHealth);
    }
}

simulated function float GetTightChokeModifier()
{
    if(IsTightChokeActive())
    {
        return GetSkillValue(PerkSkills[5]);
    }
    return super.GetTightChokeModifier();
}

function float GetStumblePowerModifier(optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart)
{
    if((IsWeaponOnPerk(GetOwnerWeapon())) && IsConcussionRoundsActive())
    {
        return 1 + (GetSkillValue(PerkSkills[7]));
    }
    return 1;
}

simulated function Interact(KFPawn_Human KFPH)
{
    local KFWeapon KFW;
    local int Idx, MagCount;
    local KFPlayerController KFPC;
    local KFPlayerReplicationInfo UserPRI, OwnerPRI;
    local bool bCanSupplyAmmo, bCanSupplyArmor, bReceivedAmmo, bReceivedArmor;
    local sSuppliedPawnInfo SuppliedPawnInfo;

    if(!IsSupplierActive())
    {
        return;
    }
    bCanSupplyAmmo = true;
    bCanSupplyArmor = true;
    Idx = SuppliedPawnList.Find('SuppliedPawn', KFPH;
    if(Idx != -1)
    {
        bCanSupplyAmmo = !SuppliedPawnList[Idx].bSuppliedAmmo;
        bCanSupplyArmor = !SuppliedPawnList[Idx].bSuppliedArmor;
        if(!bCanSupplyAmmo && !bCanSupplyArmor)
        {
            return;
        }
    }
    if(bCanSupplyAmmo)
    {
        foreach KFPH.InvManager.InventoryActors(Class'KFWeapon', KFW)
        {
            if(KFW.DenyPerkResupply())
            {
                continue;                
            }
            MagCount = Max(int(float(KFW.InitialSpareMags[0]) / 1.5), 1);
            bReceivedAmmo = ((KFW.AddAmmo(MagCount * KFW.MagazineCapacity[0]) > 0) ? true : bReceivedAmmo);
            if(KFW.CanRefillSecondaryAmmo())
            {
                bReceivedAmmo = ((KFW.AddSecondaryAmmo(Max(KFW.InitialSpareMags[1] / 3, 1)) > 0) ? true : bReceivedAmmo);
            }            
        }        
    }
    if((bCanSupplyArmor && IsResupplyActive()) && KFPH.Armor != KFPH.GetMaxArmor())
    {
        KFPH.AddArmor(int(float(KFPH.MaxArmor) * (GetSkillValue(PerkSkills[6]))));
        bReceivedArmor = true;
    }
    if(bReceivedArmor || bReceivedAmmo)
    {
        if(Idx == -1)
        {
            SuppliedPawnInfo.SuppliedPawn = KFPH;
            SuppliedPawnInfo.bSuppliedAmmo = bReceivedAmmo;
            SuppliedPawnInfo.bSuppliedArmor = bReceivedArmor;
            SuppliedPawnList.AddItem(SuppliedPawnInfo;            
        }
        else
        {
            SuppliedPawnList[Idx].bSuppliedAmmo = SuppliedPawnList[Idx].bSuppliedAmmo || bReceivedAmmo;
            SuppliedPawnList[Idx].bSuppliedArmor = SuppliedPawnList[Idx].bSuppliedArmor || bReceivedArmor;
        }
        if(Role == ROLE_Authority)
        {
            KFPC = KFPlayerController(KFPH.Controller);
            if(bReceivedAmmo)
            {
                OwnerPC.ReceiveLocalizedMessage(Class'KFLocalMessage_Game', ((bReceivedArmor) ? 2 : 0), KFPC.PlayerReplicationInfo);
                KFPC.ReceiveLocalizedMessage(Class'KFLocalMessage_Game', ((bReceivedArmor) ? 5 : 3), OwnerPC.PlayerReplicationInfo);                
            }
            else
            {
                if(bReceivedArmor)
                {
                    OwnerPC.ReceiveLocalizedMessage(Class'KFLocalMessage_Game', 1, KFPC.PlayerReplicationInfo);
                    KFPC.ReceiveLocalizedMessage(Class'KFLocalMessage_Game', 4, OwnerPC.PlayerReplicationInfo);
                }
            }
            UserPRI = KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo);
            OwnerPRI = KFPlayerReplicationInfo(OwnerPC.PlayerReplicationInfo);
            if((UserPRI != none) && OwnerPRI != none)
            {
                UserPRI.MarkSupplierOwnerUsed(OwnerPRI, bReceivedAmmo, bReceivedArmor);
            }
        }        
    }
    else
    {
        if(Role == ROLE_Authority)
        {
            KFPC = KFPlayerController(KFPH.Controller);
            if(IsResupplyActive())
            {
                KFPC.ReceiveLocalizedMessage(Class'KFLocalMessage_Game', 15, OwnerPC.PlayerReplicationInfo);                
            }
            else
            {
                KFPC.ReceiveLocalizedMessage(Class'KFLocalMessage_Game', 14, OwnerPC.PlayerReplicationInfo);
            }
        }
    }
}

simulated function bool CanInteract(KFPawn_Human MyKFPH)
{
    local int Idx;

    if(IsSupplierActive())
    {
        Idx = SuppliedPawnList.Find('SuppliedPawn', MyKFPH;
        if(Idx == -1)
        {
            return true;
        }
        if(IsResupplyActive() && !SuppliedPawnList[Idx].bSuppliedArmor)
        {
            return true;
        }
        return !SuppliedPawnList[Idx].bSuppliedAmmo;
    }
}

static simulated function AkEvent GetReceivedAmmoSound()
{
    return default.ReceivedAmmoSound;
}

static simulated function AkEvent GetReceivedArmorSound()
{
    return default.ReceivedArmorSound;
}

static simulated function AkEvent GetReceivedAmmoAndArmorSound()
{
    return default.ReceivedAmmoAndArmorSound;
}

simulated function float GetZedTimeModifier(KFWeapon W)
{
    local name StateName;

    StateName = W.GetStateName();
    if(((IsWeaponOnPerk(W)) && CouldBarrageActive()) && ZedTimeModifyingStates.Find(StateName != -1)
    {
        return BarrageFiringRate;
    }
    return 0;
}

function OnWaveEnded()
{
    super.OnWaveEnded();
    ResetSupplier();
}

static simulated function GetPassiveStrings(out array<string> PassiveValues, out array<string> Increments, byte Level)
{
    PassiveValues[0] = string(Round(((GetPassiveValue(default.WeldingProficiency, Level)) - float(1)) * float(100))) $ "%";
    PassiveValues[1] = string(Round((GetPassiveValue(default.ShotgunDamage, Level)) * float(100))) $ "%";
    PassiveValues[2] = string(Round((GetPassiveValue(default.ShotgunPenetration, Level)) * float(100))) $ "%";
    PassiveValues[3] = string(Round((GetPassiveValue(default.Ammo, Level)) * float(100))) $ "%";
    PassiveValues[4] = "";
    PassiveValues[5] = "";
    Increments[0] = ((("[" @ Left(string(default.WeldingProficiency.Increment * float(100)), InStr(string(default.WeldingProficiency.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[1] = ((("[" @ Left(string(default.ShotgunDamage.Increment * float(100)), InStr(string(default.ShotgunDamage.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[2] = ((("[" @ Left(string(default.ShotgunPenetration.Increment * float(100)), InStr(string(default.ShotgunPenetration.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[3] = ((("[" @ Left(string(default.Ammo.Increment * float(100)), InStr(string(default.Ammo.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[4] = "";
    Increments[5] = "";
}

simulated function bool IsSupplierActive()
{
    return true;
}

private final function bool IsBarrageActive()
{
    return PerkSkills[9].bActive && WorldInfo.TimeDilation < 1;
}

private final simulated function bool CouldBarrageActive()
{
    return PerkSkills[9].bActive;
}

private final simulated function bool IsHighCapMagsMagActive()
{
    return PerkSkills[0].bActive;
}

private final function bool IsFortitudeActive()
{
    return PerkSkills[2].bActive;
}

private final function bool IsSalvoActive()
{
    return PerkSkills[3].bActive;
}

private final simulated function bool IsAPShotActive()
{
    return PerkSkills[4].bActive;
}

private final function bool IsTightChokeActive()
{
    return PerkSkills[5].bActive;
}

private final simulated function bool IsTacticalReloadActive()
{
    return PerkSkills[1].bActive;
}

private final function bool IsConcussionRoundsActive()
{
    return PerkSkills[7].bActive;
}

private final function bool IsResupplyActive()
{
    return PerkSkills[6].bActive;
}

private final simulated function bool IsPerforateActive()
{
    return PerkSkills[8].bActive && WorldInfo.TimeDilation < 1;
}

// Export UKFPerk_Support::execCanRepairDoors(FFrame&, void* const)
native function bool CanRepairDoors();

private final simulated function name LogTacticalReload()
{
    local KFWeapon KFW;

    KFW = GetOwnerWeapon();
    if(KFW != none)
    {
        return KFW.GetReloadAnimName(GetUsingTactialReload(KFW));
    }
    return 'None';
}

simulated function LogPerkSkills()
{
    super.LogPerkSkills();
    if(bLogPerk)
    {
    }
}

simulated function PlayerDied()
{
    super.PlayerDied();
    if(InteractionTrigger != none)
    {
        InteractionTrigger.DestroyTrigger();
    }
}

defaultproperties
{
    Ammo=(Name="Ammo",Increment=0.02,Rank=0,StartingValue=0,MaxValue=0.5,ModifierValue=0,IconPath="",bActive=false)
    WeldingProficiency=(Name="Welding Proficiency",Increment=0.03,Rank=0,StartingValue=1,MaxValue=1.75,ModifierValue=0,IconPath="",bActive=false)
    ShotgunDamage=(Name="Shotgun Damage",Increment=0.01,Rank=0,StartingValue=0,MaxValue=0.25,ModifierValue=0,IconPath="",bActive=false)
    ShotgunPenetration=(Name="Shotgun Penetration",Increment=0.2,Rank=0,StartingValue=0,MaxValue=5,ModifierValue=0,IconPath="",bActive=false)
    Strength=(Name="Strength",Increment=1,Rank=0,StartingValue=0,MaxValue=5,ModifierValue=0,IconPath="",bActive=false)
    BarrageFiringRate=0.9
    ResupplyMaxSpareAmmoModifier=0.2
    ReceivedAmmoSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Ammo'
    ReceivedArmorSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Armor'
    ReceivedAmmoAndArmorSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Armor'
    ProgressStatID=20
    PerkBuildStatID=21
    SecondaryXPModifier[0]=6
    SecondaryXPModifier[1]=8
    SecondaryXPModifier[2]=10
    SecondaryXPModifier[3]=14
    PerkName="Support"
    Passives(0)=(Title="Welding Proficiency",Description="Welding speed increased by %x% per level",IconPath="")
    Passives(1)=(Title="Shotgun Damage",Description="Perk weapon damage increased by %x% per level",IconPath="")
    Passives(2)=(Title="Shotgun Penetration",Description="Perk weapon penetration power increased by %x% per level",IconPath="")
    Passives(3)=(Title="Ammo",Description="Ammo increased by 15% plus %x% per level",IconPath="")
    Passives(4)=(Title="Strength",Description="Weight capacity increased by 1 every 5 levels",IconPath="")
    Passives(5)=(Title="Ammo Backpack + Door repair",Description="Once per round players can get ammo from backpack - repair destroyed doors",IconPath="")
    SkillCatagories[0]="Ammo Management"
    SkillCatagories[1]="Training"
    SkillCatagories[2]="Firepower"
    SkillCatagories[3]="Logistics"
    SkillCatagories[4]="Advanced Training"
    EXPAction1="Dealing Support weapon damage"
    EXPAction2="Welding doors"
    PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Support'
    InteractIcon=Texture2D'UI_World_TEX.Support_Supplier_HUD'
    PerkSkills(0)=(Name="HighCapMags",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.support.UI_Talents_Support_HighCapacityMags",bActive=false)
    PerkSkills(1)=(Name="TacticalReload",Increment=0,Rank=0,StartingValue=0.8,MaxValue=0,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_TacticalReload",bActive=false)
    PerkSkills(2)=(Name="Fortitude",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Fortitude",bActive=false)
    PerkSkills(3)=(Name="Salvo",Increment=0,Rank=0,StartingValue=0.3,MaxValue=0.3,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Salvo",bActive=false)
    PerkSkills(4)=(Name="APShot",Increment=0,Rank=0,StartingValue=4,MaxValue=4,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_ArmorPiercing",bActive=false)
    PerkSkills(5)=(Name="TightChoke",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_TightChoke",bActive=false)
    PerkSkills(6)=(Name="Resupply",Increment=0,Rank=0,StartingValue=0.2,MaxValue=0.2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_ResupplyPack",bActive=false)
    PerkSkills(7)=(Name="ConcussionRounds",Increment=0,Rank=0,StartingValue=1.5,MaxValue=1.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_ConcussionRounds",bActive=false)
    PerkSkills(8)=(Name="Perforate",Increment=0,Rank=0,StartingValue=40,MaxValue=40,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Penetrator",bActive=false)
    PerkSkills(9)=(Name="Barrage",Increment=0,Rank=0,StartingValue=5,MaxValue=5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Barrage",bActive=false)
    ZedTimeModifyingStates(0)=WeaponFiring
    ZedTimeModifyingStates(1)=WeaponBurstFiring
    ZedTimeModifyingStates(2)=WeaponSingleFiring
    PrimaryWeaponDef=Class'KFWeapDef_MB500'
    KnifeWeaponDef=Class'KFWeapDef_Knife_Support'
    GrenadeWeaponDef=Class'KFWeapDef_Grenade_Support'
    AutoBuyLoadOutPath(0)=class'KFWeapDef_MB500'
    AutoBuyLoadOutPath(1)=class'KFWeapDef_DoubleBarrel'
    AutoBuyLoadOutPath(2)=class'KFWeapDef_M4'
    AutoBuyLoadOutPath(3)=class'KFWeapDef_AA12'
    HitAccuracyHandicap=-6
    HeadshotAccuracyHandicap=-3
}