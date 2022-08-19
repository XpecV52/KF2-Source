/*******************************************************************************
 * KFPerk generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPerk extends ReplicationInfo
    native
    nativereplication
    config(Game)
    hidecategories(Navigation,Movement,Collision);

const SKILLFLAG = 0x1;
const SKILLFLAG_1 = 0x2;
const SKILLFLAG_2 = 0x4;
const SKILLFLAG_3 = 0x8;
const SKILLFLAG_4 = 0x10;
const SKILLFLAG_5 = 0x20;
const SKILLFLAG_6 = 0x40;
const SKILLFLAG_7 = 0x80;
const SKILLFLAG_8 = 0x100;
const SKILLFLAG_9 = 0x200;
const SKILL_NONE = 0;
const Skill_1 = 1;
const Skill_2 = 2;
const RANK_1_LEVEL = 5;
const RANK_2_LEVEL = 10;
const RANK_3_LEVEL = 15;
const RANK_4_LEVEL = 20;
const RANK_5_LEVEL = 25;
const UNLOCK_INTERVAL = 5;

struct native PassivePerk
{
    var const localized string Title;
    var const localized string Description;
    var string IconPath;

    structdefaultproperties
    {
        Title=""
        Description=""
        IconPath=""
    }
};

struct native PerkSkill
{
    /** Skill related vars */
    var() editconst string Name;
    /** Skill related vars */
    var() const float Increment;
    var const byte Rank;
    /** Skill related vars */
    var() const float StartingValue;
    /** Skill related vars */
    var() const float MaxValue;
    /** Skill related vars */
    var() const float ModifierValue;
    /** Skill related vars */
    var() const string IconPath;
    /** Skill related vars */
    var() bool bActive;

    structdefaultproperties
    {
        Name=""
        Increment=0
        Rank=0
        StartingValue=0
        MaxValue=0
        ModifierValue=0
        IconPath=""
        bActive=false
    }
};

struct native BuffedPlayerInfo
{
    var() int PreBuffValue;
    var() KFPawn_Human BuffedPawn;

    structdefaultproperties
    {
        PreBuffValue=0
        BuffedPawn=none
    }
};

var private const int ProgressStatID;
var private const int PerkBuildStatID;
var const int SecondaryXPModifier[4];
var const localized string PerkName;
var array<PassivePerk> Passives;
var const localized string SkillCatagories[5];
var const localized string EXPAction1;
var const localized string EXPAction2;
var const localized string LevelString;
var Texture2D PerkIcon;
var array<string> ColumnOneIcons;
var array<string> ColumnTwoIcons;
var Texture2D InteractIcon;
var const localized string WeaponDroppedMessage;
var array<PerkSkill> PerkSkills;
var protected byte SelectedSkills[5];
var byte MaxAbilityPoints;
var protected const byte CurrentLevel;
var protected const byte CurrentPrestigeLevel;
/** Duration till next RegenerationAmount */
var() const float RegenerationInterval;
/** Amount health given per RegenerationIntervall */
var() const int RegenerationAmount;
var float TimeUntilNextRegen;
var const float BarrageDamageModifier;
var const float FormidableDamageModifier;
var const float VaccinationDuration;
var array<BuffedPlayerInfo> BuffedPlayerInfos;
var KFUsablePerkTrigger InteractionTrigger;
var const array<name> ZedTimeModifyingStates;
var bool bCanSeeCloakedZeds;
var bool bHasTempSkill_TacticalReload;
var const bool bInitialized;
var config bool bLogPerk;
var() const float SignatureDamageScale;
var() const float SignatureRecoilScale;
var int CurrentAbilityPoints;
/** Shared Skills */
var() const PerkSkill TacticalReload;
var protected const class<KFDamageType> BleedDmgTypeClass;
var int SavedBuild;
var class<KFWeaponDefinition> PrimaryWeaponDef;
var class<KFWeaponDefinition> SecondaryWeaponDef;
var class<KFWeaponDefinition> KnifeWeaponDef;
var class<KFWeaponDefinition> GrenadeWeaponDef;
var class<KFProj_Grenade> GrenadeClass;
var int InitialGrenadeCount;
var int MaxGrenadeCount;
var array<name> BackupWeaponDamageTypeNames;
var float HitAccuracyHandicap;
var float HeadshotAccuracyHandicap;
var KFPlayerReplicationInfo MyPRI;
var KFGameInfo MyKFGI;
var KFGameReplicationInfo MyKFGRI;
var KFPlayerController OwnerPC;
var KFPawn_Human OwnerPawn;

replication
{
     if(bNetDirty && bNetOwner)
        CurrentLevel;
}

// Export UKFPerk::execCheckOwnerPawn(FFrame&, void* const)
protected native final simulated function bool CheckOwnerPawn();

// Export UKFPerk::execLoadPerk(FFrame&, void* const)
native final function LoadPerk();

// Export UKFPerk::execLoadTierUnlockFromConfig(FFrame&, void* const)
native static final function LoadTierUnlockFromConfig(class<KFPerk> PerkClass, out byte bTierUnlocked, out int UnlockedPerkLevel);

// Export UKFPerk::execLoadPerkData(FFrame&, void* const)
native static final function LoadPerkData();

// Export UKFPerk::execSaveTierUnlockToConfig(FFrame&, void* const)
native static final function SaveTierUnlockToConfig(class<KFPerk> PerkClass, byte bTierUnlocked, int PerkLevel);

// Export UKFPerk::execSaveBuildToStats(FFrame&, void* const)
native final function SaveBuildToStats(class<KFPerk> PerkClass, int NewPerkBuild);

// Export UKFPerk::execSavePerkDataToConfig(FFrame&, void* const)
native final function SavePerkDataToConfig(class<KFPerk> PerkClass, int NewPerkBuild);

// Export UKFPerk::execServerSetPerkBuild(FFrame&, void* const)
private reliable server native final event ServerSetPerkBuild(int NewPerkBuild, byte ClientLevel);

// Export UKFPerk::execClientACK(FFrame&, void* const)
private reliable client native final simulated event ClientACK(bool bSuccess, byte AckLevel, int PerkBuild);

// Export UKFPerk::execGetProgressStatID(FFrame&, void* const)
native static simulated function int GetProgressStatID();

// Export UKFPerk::execGetPerkBuildStatID(FFrame&, void* const)
native static simulated function int GetPerkBuildStatID();

static final function class<KFPerk> GetPerkClass()
{
    return default.Class;
}

function string DumpPerkLoadout()
{
    local int I;
    local string Ret;

    Ret = "";
    I = 0;
    J0x17:

    if(I < 5)
    {        
        Ret $= string(SelectedSkills[I]);
        ++ I;
        goto J0x17;
    }
    return Ret;
}

static function KFWeapon GetWeaponFromDamageCauser(Actor WeaponActor)
{
    local KFWeapon KFW;

    if(WeaponActor != none)
    {
        if(WeaponActor.IsA('Weapon'))
        {
            KFW = KFWeapon(WeaponActor);            
        }
        else
        {
            if(WeaponActor.IsA('Projectile'))
            {
                KFW = KFWeapon(WeaponActor.Owner);                
            }
            else
            {
                if(WeaponActor.IsA('KFSprayActor'))
                {
                    KFW = KFWeapon(WeaponActor.Base);
                }
            }
        }
        return KFW;
    }
    return none;
}

static function class<KFPerk> GetPerkFromDamageCauser(Actor WeaponActor)
{
    local KFWeapon KFW;
    local KFProjectile KFPrj;

    KFW = KFWeapon(WeaponActor);
    KFPrj = KFProjectile(WeaponActor);
    if((WeaponActor != none) && KFW == none)
    {
        if((KFPrj != none) && KFPrj.AssociatedPerkClass == none)
        {
            KFW = KFWeapon(WeaponActor.Owner);            
        }
        else
        {
            if(KFPrj != none)
            {
                return GetPerkFromProjectile(WeaponActor);                
            }
            else
            {
                if(WeaponActor.IsA('SprayActor_Flame'))
                {
                    return Class'KFPerk_Firebug';                    
                }
                else
                {
                    if(WeaponActor.IsA('KFDoorActor'))
                    {
                        return Class'KFPerk_Demolitionist';
                    }
                }
            }
        }
    }
    if(KFW != none)
    {
        return KFW.default.AssociatedPerkClass;
    }
    return none;
}

static function class<KFPerk> GetPerkFromProjectile(Actor WeaponActor)
{
    local KFProjectile Proj;

    Proj = KFProjectile(WeaponActor);
    if(Proj != none)
    {
        return Proj.default.AssociatedPerkClass;
    }
    return none;
}

static simulated function bool IsWeaponOnPerk(KFWeapon W, optional class<KFPerk> WeaponPerkClass)
{
    if(W != none)
    {
        return W.default.AssociatedPerkClass == default.Class;        
    }
    else
    {
        if(WeaponPerkClass != none)
        {
            return WeaponPerkClass == default.Class;
        }
    }
    return false;
}

static function bool IsDamageTypeOnPerk(class<KFDamageType> KFDT)
{
    if(KFDT != none)
    {
        return KFDT.default.ModifierPerkList.Find(default.Class > -1;
    }
    return false;
}

static function bool IsBackupDamageTypeOnPerk(class<DamageType> DT)
{
    if(DT != none)
    {
        return default.BackupWeaponDamageTypeNames.Find(DT.Name > -1;
    }
    return false;
}

static function bool IsDamageTypeOnThisPerk(class<KFDamageType> KFDT, class<KFPerk> PerkClass)
{
    return KFDT.default.ModifierPerkList.Find(PerkClass > -1;
}

static function MultiplySecondaryXPPoints(out int XP, byte Difficulty)
{
    XP *= float(default.SecondaryXPModifier[Difficulty]);
}

static function bool IsBackupWeapon(KFWeapon KFW)
{
    return KFW.default.bIsBackupWeapon;
}

// Export UKFPerk::execGetLevel(FFrame&, void* const)
native simulated function byte GetLevel();

// Export UKFPerk::execSetLevel(FFrame&, void* const)
native simulated function SetLevel(byte NewLevel);

event PerkLevelUpdated()
{
    if(MyKFGI != none)
    {
        MyKFGI.GameConductor.UpdateAveragePerkRank();
    }
}

simulated event UpdateSkills()
{
    local byte I, SkillIndex;

    I = 0;
    J0x0C:

    if(I < 5)
    {
        SkillIndex = byte(I * 2);
        if(SkillIndex < PerkSkills.Length)
        {
            PerkSkills[SkillIndex].bActive = SelectedSkills[I] == 1;
            PerkSkills[SkillIndex + 1].bActive = SelectedSkills[I] == 2;
        }
        ++ I;
        goto J0x0C;
    }
    PostSkillUpdate();
    ApplySkillsToPawn();
}

simulated event UpdatePerkBuild(const out byte InSelectedSkills[5], class<KFPerk> PerkClass)
{
    local int NewPerkBuild;

    if(Controller(Owner).IsLocalController())
    {
        PackPerkBuild(NewPerkBuild, InSelectedSkills);
        ServerSetPerkBuild(NewPerkBuild, CurrentLevel);
        SaveBuildToStats(PerkClass, NewPerkBuild);
        SavePerkDataToConfig(PerkClass, NewPerkBuild);
    }
}

simulated event PackPerkBuild(out int NewPerkBuild, const out byte SelectedSkillsHolder[5])
{
    PackSkill(NewPerkBuild, SelectedSkillsHolder[0], 1, 2);
    PackSkill(NewPerkBuild, SelectedSkillsHolder[1], 4, 8);
    PackSkill(NewPerkBuild, SelectedSkillsHolder[2], 16, 32);
    PackSkill(NewPerkBuild, SelectedSkillsHolder[3], 64, 128);
    PackSkill(NewPerkBuild, SelectedSkillsHolder[4], 256, 512);
}

simulated event PackSkill(out int NewPerkBuild, byte SkillIndex, int SkillFlag1, int SkillFlag2)
{
    if(SkillIndex == 1)
    {
        NewPerkBuild = NewPerkBuild | SkillFlag1;        
    }
    else
    {
        if(SkillIndex == 2)
        {
            NewPerkBuild = NewPerkBuild | SkillFlag2;
        }
    }
}

simulated event SetPerkBuild(int NewPerkBuild)
{
    if(SavedBuild != NewPerkBuild)
    {
        SavedBuild = NewPerkBuild;
    }
    UnpackSkill(CurrentLevel, NewPerkBuild, 0, 1, 2, SelectedSkills);
    UnpackSkill(CurrentLevel, NewPerkBuild, 1, 4, 8, SelectedSkills);
    UnpackSkill(CurrentLevel, NewPerkBuild, 2, 16, 32, SelectedSkills);
    UnpackSkill(CurrentLevel, NewPerkBuild, 3, 64, 128, SelectedSkills);
    UnpackSkill(CurrentLevel, NewPerkBuild, 4, 256, 512, SelectedSkills);
    UpdateSkills();
}

simulated event GetUnpackedSkillsArray(class<KFPerk> PerkClass, int NewPerkBuild, out byte SelectedSkillsHolder[5])
{
    local byte PerkLevel;

    if(OwnerPC == none)
    {
        OwnerPC = KFPlayerController(Owner);
    }
    PerkLevel = OwnerPC.GetPerkLevelFromPerkList(PerkClass);
    UnpackSkill(PerkLevel, NewPerkBuild, 0, 1, 2, SelectedSkillsHolder);
    UnpackSkill(PerkLevel, NewPerkBuild, 1, 4, 8, SelectedSkillsHolder);
    UnpackSkill(PerkLevel, NewPerkBuild, 2, 16, 32, SelectedSkillsHolder);
    UnpackSkill(PerkLevel, NewPerkBuild, 3, 64, 128, SelectedSkillsHolder);
    UnpackSkill(PerkLevel, NewPerkBuild, 4, 256, 512, SelectedSkillsHolder);
}

simulated function UnpackSkill(byte PerkLevel, int NewPerkBuild, byte SkillTier, int SkillFlag1, int SkillFlag2, out byte SelectedSkillsHolder[5])
{
    local int SkillUnlockLevel;

    SkillUnlockLevel = 5 + (5 * SkillTier);
    if(SkillUnlockLevel <= PerkLevel)
    {
        if((NewPerkBuild & SkillFlag1) > 0)
        {
            SelectedSkillsHolder[SkillTier] = 1;            
        }
        else
        {
            if((NewPerkBuild & SkillFlag2) > 0)
            {
                SelectedSkillsHolder[SkillTier] = 2;                
            }
            else
            {
                SelectedSkillsHolder[SkillTier] = 1;
            }
        }        
    }
    else
    {
        SelectedSkillsHolder[SkillTier] = 0;
    }
}

protected simulated event PostSkillUpdate()
{
    local Inventory Inv;
    local KFWeapon KFW;
    local KFPawn_Human KFP;

    if(OwnerPC == none)
    {
        OwnerPC = KFPlayerController(Owner);
    }
    KFP = KFPawn_Human(OwnerPC.Pawn);
    if((KFP != none) && KFP.InvManager != none)
    {
        Inv = KFP.InvManager.InventoryChain;
        J0xCE:

        if(Inv != none)
        {
            KFW = KFWeapon(Inv);
            if(KFW != none)
            {
                KFW.ReInitializeAmmoCounts(self);
            }
            Inv = Inv.Inventory;
            goto J0xCE;
        }
    }
    PerkSetOwnerHealthAndArmor(false);
    ApplySkillsToPawn();
}

static simulated function GetPassiveStrings(out array<string> PassiveValues, out array<string> Increments, byte Level);

static simulated function float GetSkillValue(const PerkSkill Skill)
{
    return FMin(Skill.MaxValue, Skill.StartingValue);
}

static simulated function float GetPassiveValue(const out PerkSkill Skill, byte Level, optional float Divider)
{
    Divider = 1;
    return FMin(Skill.MaxValue, Skill.StartingValue + ((float(Level) * Skill.Increment) / Divider));
}

static simulated event string GetPerkIconPath()
{
    local string PerkIconPath;

    PerkIconPath = PathName(default.PerkIcon);
    return PerkIconPath;
}

simulated event PreBeginPlay()
{
    GrenadeClass = class<KFProj_Grenade>(DynamicLoadObject(GrenadeWeaponDef.default.WeaponClassPath, Class'Class'));
    PerkIcon = Texture2D(DynamicLoadObject(GetPerkIconPath(), Class'Texture2D'));
    MyKFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if(WorldInfo.Game != none)
    {
        MyKFGI = KFGameInfo(WorldInfo.Game);
    }
}

function SetPlayerDefaults(Pawn PlayerPawn)
{
    OwnerPawn = KFPawn_Human(PlayerPawn);
    bForceNetUpdate = true;
    OwnerPC = KFPlayerController(Owner);
    if(OwnerPC != none)
    {
        MyPRI = KFPlayerReplicationInfo(OwnerPC.PlayerReplicationInfo);
    }
    PerkSetOwnerHealthAndArmor(true);
    ApplySkillsToPawn();
}

event NotifyPerkModified()
{
    PostLevelUp();
}

private final simulated function PerkSetOwnerHealthAndArmor(optional bool bModifyHealth)
{
    if(Role != ROLE_Authority)
    {
        return;
    }
    if(CheckOwnerPawn())
    {
        if(bModifyHealth)
        {
            OwnerPawn.Health = OwnerPawn.default.Health;
            ModifyHealth(OwnerPawn.Health);
        }
        OwnerPawn.HealthMax = OwnerPawn.default.Health;
        ModifyHealth(OwnerPawn.HealthMax);
        OwnerPawn.Health = Min(OwnerPawn.Health, OwnerPawn.HealthMax);
        if(OwnerPC == none)
        {
            OwnerPC = KFPlayerController(Owner);
        }
        MyPRI = KFPlayerReplicationInfo(OwnerPC.PlayerReplicationInfo);
        if(MyPRI != none)
        {
            MyPRI.PlayerHealth = byte(OwnerPawn.Health);
            MyPRI.PlayerHealthPercent = FloatToByte(float(OwnerPawn.Health) / float(OwnerPawn.HealthMax));
        }
        OwnerPawn.MaxArmor = OwnerPawn.default.MaxArmor;
        ModifyArmor(OwnerPawn.MaxArmor);
        OwnerPawn.Armor = byte(Min(OwnerPawn.Armor, OwnerPawn.MaxArmor));
    }
}

function ApplySkillsToPawn()
{
    local KFInventoryManager KFIM;

    if(CheckOwnerPawn())
    {
        OwnerPawn.UpdateGroundSpeed();
        OwnerPawn.bMovesFastInZedTime = false;
        if(MyPRI == none)
        {
            MyPRI = KFPlayerReplicationInfo(OwnerPawn.PlayerReplicationInfo);
        }
        MyPRI.bExtraFireRange = false;
        MyPRI.bSplashActive = false;
        MyPRI.bNukeActive = false;
        MyPRI.bConcussiveActive = false;
        MyPRI.bPerkCanSupply = false;
        KFIM = KFInventoryManager(OwnerPawn.InvManager);
        if(KFIM != none)
        {
            KFIM.MaxCarryBlocks = KFIM.default.MaxCarryBlocks;
            CheckForOverWeight(KFIM);
        }
    }
}

simulated function NotifyPawnTeamChanged()
{
    OwnerPC = KFPlayerController(Owner);
    if(OwnerPC != none)
    {
        MyPRI = KFPlayerReplicationInfo(OwnerPC.PlayerReplicationInfo);
    }
}

simulated event PostLevelUp()
{
    PerkSetOwnerHealthAndArmor();
    PostSkillUpdate();
    ApplySkillsToPawn();
}

function AddDefaultInventory(KFPawn P)
{
    local KFInventoryManager KFIM;

    if((P != none) && P.InvManager != none)
    {
        KFIM = KFInventoryManager(P.InvManager);
        if(KFIM != none)
        {
            KFIM.GiveInitialGrenadeCount();
        }
        P.DefaultInventory.AddItem(class<Weapon>(DynamicLoadObject(PrimaryWeaponDef.default.WeaponClassPath, Class'Class'));
        P.DefaultInventory.AddItem(class<Weapon>(DynamicLoadObject(KnifeWeaponDef.default.WeaponClassPath, Class'Class'));
    }
}

simulated function class<KFProj_Grenade> GetGrenadeClass()
{
    return GrenadeClass;
}

simulated function bool PerkNeedsTick()
{
    return false;
}

protected function CheckForOverWeight(KFInventoryManager KFIM)
{
    local int OverWeight, BestWeight;
    local Inventory Inv;
    local KFWeapon BestWeapon, KFW;
    local array< class<KFWeapon> > DroppedWeaponClasses;
    local string TempString;
    local bool bDone;

    if(KFIM.CurrentCarryBlocks > KFIM.MaxCarryBlocks)
    {
        OverWeight = KFIM.CurrentCarryBlocks - KFIM.MaxCarryBlocks;
        Inv = OwnerPawn.InvManager.InventoryChain;
        J0xCE:

        if(Inv != none)
        {
            KFW = KFWeapon(Inv);
            if((KFW != none) && KFW.CanThrow())
            {
                if(KFW.InventorySize == OverWeight)
                {
                    DroppedWeaponClasses.AddItem(KFW.Class;
                    OwnerPawn.TossInventory(KFW);
                    bDone = true;                    
                }
                else
                {
                    if(((BestWeight < 1) || BestWeapon == none) || (KFW.InventorySize > OverWeight) && (KFW.InventorySize - OverWeight) < BestWeight)
                    {
                        BestWeight = KFW.InventorySize - OverWeight;
                        BestWeapon = KFW;
                    }
                }
            }
            Inv = Inv.Inventory;
            goto J0xCE;
        }
        if(!bDone)
        {
            if(BestWeapon == none)
            {
                Inv = OwnerPawn.InvManager.InventoryChain;
                J0x316:

                if(Inv != none)
                {
                    KFW = KFWeapon(Inv);
                    if((KFW != none) && KFW.CanThrow())
                    {
                        DroppedWeaponClasses.AddItem(KFW.Class;
                        OwnerPawn.TossInventory(KFW);
                        if(KFIM.CurrentCarryBlocks <= KFIM.MaxCarryBlocks)
                        {
                            goto J0x43B;
                        }
                    }
                    Inv = Inv.Inventory;
                    goto J0x316;
                }
                J0x43B:
                
            }
            else
            {
                DroppedWeaponClasses.AddItem(KFW.Class;
                OwnerPawn.TossInventory(Inv);
            }
        }
        TempString = BuildDroppedMessageString(DroppedWeaponClasses);
        OwnerPC.ClientMessage(Repl(WeaponDroppedMessage, "%%%%", TempString));
    }
}

protected function string BuildDroppedMessageString(array< class<KFWeapon> > DroppedWeaponClasses)
{
    local int I;
    local string TempString;

    I = 0;
    J0x0B:

    if(I < DroppedWeaponClasses.Length)
    {
        TempString = TempString @ DroppedWeaponClasses[I].default.ItemName;
        ++ I;
        goto J0x0B;
    }
    return TempString;
}

simulated function float GetCloakDetectionRange()
{
    return 0;
}

simulated function float GetAwarenessDamageScale()
{
    return 1;
}

simulated function float GetSuppressingFireSnareScale()
{
    return 1;
}

simulated function float GetReloadRateScale(KFWeapon KFW)
{
    return 1;
}

function ModifySpeed(out float Speed);

simulated function ModifyRecoil(out float CurrentRecoilModifier, KFWeapon KFW);

function ModifyDamageGiven(out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx);

function ModifyDamageTaken(out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy);

simulated function ModifyMagSizeAndNumber(KFWeapon KFW, out int MagazineCapacity, optional class<KFPerk> WeaponPerkClass);

simulated function ModifySpareAmmoAmount(KFWeapon KFW, out int PrimarySpareAmmo, const optional out STraderItem TraderItem);

simulated function MaximizeSpareAmmoAmount(class<KFPerk> WeaponPerkClass, out int PrimarySpareAmmo, int MaxPrimarySpareAmmo);

simulated function ModifyMaxSpareAmmoAmount(KFWeapon KFW, out int MaxSpareAmmo, const optional out STraderItem TraderItem);

simulated function bool ShouldMagSizeModifySpareAmmo(KFWeapon KFW, optional class<KFPerk> WeaponPerkClass)
{
    return false;
}

function ModifyHealth(out int InHealth);

static simulated function float GetZedTimeExtension(byte Level)
{
    return 1;
}

function float GetKnockdownPowerModifier(optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting)
{
    bIsSprinting = false;
    return 1;
}

function float GetStumblePowerModifier(optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart)
{
    return 1;
}

function float GetStunPowerModifier(optional class<DamageType> DamageType, optional byte HitZoneIdx)
{
    return 1;
}

simulated function ModifyWeldingRate(out float FastenRate, out float UnfastenRate);

simulated function bool CanInteract(KFPawn_Human KFPH)
{
    return false;
}

simulated function Interact(KFPawn_Human KFPH);

simulated function float GetPenetrationModifier(byte Level, class<KFDamageType> DamageType, optional bool bForce);

static function float GetBarrageDamageModifier()
{
    return default.BarrageDamageModifier;
}

simulated function bool IsCallOutActive()
{
    return false;
}

simulated function bool IsShootAndMoveActive()
{
    return false;
}

simulated function bool HasNightVision()
{
    return false;
}

protected simulated function bool IsRapidFireActive()
{
    return false;
}

simulated function float GetZedTimeModifier(KFWeapon W)
{
    return 0;
}

simulated function ModifySpread(out float InSpread);

function ModifyMeleeAttackSpeed(out float InDuration, KFWeapon KFW);

function ModifyScreamEffectDuration(out float InDuration);

function bool CanNotBeGrabbed()
{
    return false;
}

function bool CanEarnSmallRadiusKillXP(class<DamageType> DT)
{
    return false;
}

function ModifyHardAttackDamage(out int InDamage);

function ModifyLightAttackDamage(out int InDamaghe);

simulated function SetSuccessfullBlock();

simulated function SetSuccessfullParry();

function AddVampireHealth(KFPlayerController KFPC, class<DamageType> DT);

function bool ShouldKnockdown();

function bool IsUnAffectedByZedTime()
{
    return false;
}

function bool IsAcidicCompoundActive()
{
    return false;
}

function ModifyHealerRechargeTime(out float RechargeRate);

function bool ModifyHealAmount(out float HealAmount)
{
    return false;
}

function ModifyArmor(out byte MaxArmor);

simulated function float GetArmorDiscountMod()
{
    return 1;
}

function bool RepairArmor(Pawn HealTarget);

function bool IsBleedDmgActive()
{
    return false;
}

static function class<KFDamageType> GetBleedDmgTypeClass()
{
    return default.BleedDmgTypeClass;
}

static function ModifyBleedDmg(out int BleedDamage);

static final function float GetVaccinationDuration()
{
    return default.VaccinationDuration;
}

static function ModifyVaccinationDamage(out float InDamage, class<DamageType> dmgType, optional int MedicLevel)
{
    MedicLevel = -1;
}

function CheckForAirborneAgent(KFPawn HealTarget, class<DamageType> DamType, int HealAmount);

function bool ShouldSedate()
{
    return false;
}

function ModifyACDamage(out int InDamage);

simulated function bool CanRepairArmor()
{
    return false;
}

simulated function float GetSirenScreamStrength()
{
    return 1;
}

simulated function bool IsFlarotovActive()
{
    return false;
}

function ModifyDoTScaler(out float DoTScaler, optional class<KFDamageType> KFDT);

function bool GetFireStumble(optional KFPawn KFP, optional class<DamageType> DamageType)
{
    return false;
}

function bool CanSpreadNapalm()
{
    return false;
}

function bool CouldBeZedShrapnel(class<KFDamageType> KFDT)
{
    return false;
}

simulated function bool ShouldShrapnel()
{
    return false;
}

simulated function float GetSplashDamageModifier()
{
    return 1;
}

simulated function bool IsRangeActive()
{
    return false;
}

simulated function bool IsOnContactActive()
{
    return false;
}

simulated function bool IsSharedExplosiveResistaneActive()
{
    return false;
}

simulated function bool ShouldSacrifice()
{
    return false;
}

simulated function bool ShouldRandSirenResist()
{
    return false;
}

simulated function bool CanExplosiveWeld()
{
    return false;
}

simulated function bool GetIsUberAmmoActive(KFWeapon KFW)
{
    return false;
}

function UpdatePerkHeadShots(ImpactInfo Impact, class<DamageType> DamageType, int NumHit);

function AddToHeadShotCombo(class<KFDamageType> KFDT, KFPawn_Monster KFPM);

function ResetHeadShotCombo();

simulated event bool GetIsHeadShotComboActive()
{
    return false;
}

private reliable server final event ServerResetHeadShotCombo();

simulated function ModifyRateOfFire(out float InRate, KFWeapon KFW);

simulated event float GetIronSightSpeedModifier(KFWeapon KFW)
{
    return 1;
}

simulated function ModifyWeaponSwitchTime(out float ModifiedSwitchTime);

simulated function bool ShouldInstantlySwitchWeapon(KFWeapon KFW)
{
    return false;
}

simulated function ModifyWeaponBopDamping(out float BobDamping, KFWeapon PawnWeapon);

function string GetModifierString(byte ModifierIndex)
{
    return "";
}

function ModifyBloatBileDoT(out float DoTScaler)
{
    if(OwnerPawn.bHasMedicVaccinationBuff)
    {
        DoTScaler -= Class'KFPerk_Berserker'.static.GetPoisonResistance();
    }
}

function KFWeapon GetOwnerWeapon()
{
    local KFWeapon KFW;

    if(CheckOwnerPawn())
    {
        KFW = KFWeapon(OwnerPawn.Weapon);
        if(KFW != none)
        {
            return KFW;
        }
    }
    return none;
}

function OnWaveEnded()
{
    if(WorldInfo.Role < ROLE_Authority)
    {
        return;
    }
    ClientOnWaveEnded();
}

protected reliable client simulated function ClientOnWaveEnded()
{
    if(MyPRI == none)
    {
        MyPRI = KFPlayerReplicationInfo(OwnerPawn.PlayerReplicationInfo);
    }
    MyPRI.ResetSupplierUsed();
}

simulated function bool GetUsingTactialReload(KFWeapon KFW)
{
    return false;
}

function DrawSpecialPerkHUD(Canvas C);

function NotifyZedTimeStarted();

function NotifyZedTimeEnded();

simulated event KFPawn_Human GetOwnerPawn()
{
    local KFPawn_Human KFPH;

    OwnerPC = KFPlayerController(Owner);
    if(OwnerPC != none)
    {
        KFPH = KFPawn_Human(OwnerPC.Pawn);
        if(KFPH != none)
        {
            return KFPH;
        }
    }
    return none;
}

function TickRegen(float DeltaTime)
{
    local int OldHealth;
    local KFPlayerReplicationInfo KFPRI;

    TimeUntilNextRegen -= DeltaTime;
    if(TimeUntilNextRegen <= 0)
    {
        if(CheckOwnerPawn() && OwnerPawn.Health < OwnerPawn.HealthMax)
        {
            OldHealth = OwnerPawn.Health;
            OwnerPawn.Health = Min(OwnerPawn.Health + RegenerationAmount, OwnerPawn.HealthMax);
            KFPRI = KFPlayerReplicationInfo(OwnerPawn.PlayerReplicationInfo);
            if(KFPRI != none)
            {
                KFPRI.PlayerHealth = byte(OwnerPawn.Health);
                KFPRI.PlayerHealthPercent = FloatToByte(float(OwnerPawn.Health) / float(OwnerPawn.HealthMax));
            }
            if((float(OldHealth) <= (float(OwnerPawn.HealthMax) * 0.25)) && float(OwnerPawn.Health) >= (float(OwnerPawn.HealthMax) * 0.25))
            {
                KFPlayerController(OwnerPawn.Controller).ReceiveLocalizedMessage(Class'KFLocalMessage_Interaction', 0);
            }
        }
        TimeUntilNextRegen = RegenerationInterval;
    }
}

simulated function class<EmitterCameraLensEffectBase> GetPerkLensEffect(class<KFDamageType> dmgType)
{
    return dmgType.default.CameraLensEffectTemplate;
}

static simulated function Texture2D GetInteractIcon()
{
    return default.InteractIcon;
}

simulated function float GetPercentage(float OriginalValue, float NewValue)
{
    if(OriginalValue == float(0))
    {
        return -1;
    }
    return (NewValue - OriginalValue) / OriginalValue;
}

unreliable server function ServerLogPerks()
{
    local KFPlayerController KFPC;
    local KFPerk MyPerk;

    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        MyPerk = KFPC.CurrentPerk;
        if(MyPerk != none)
        {
            MyPerk.LogPerkSkills();
            if(!KFPC.IsLocalPlayerController())
            {
                MyPerk.ClientLogPerks();
            }
        }        
    }    
}

unreliable client simulated function ClientLogPerks()
{
    LogPerkSkills();
}

simulated function LogPerkSkills()
{
    local int TierUnlockLevel, I;

    LogInternal(" ==================================== ");
    LogInternal((MyPRI.PlayerName @ PerkName) @ string(GetLevel()));
    LogInternal(" ** SKILLS ** ");
    I = 0;
    J0x83:

    if(I < 5)
    {
        TierUnlockLevel = 5 + (5 * I);
        if(GetLevel() >= TierUnlockLevel)
        {
            LogInternal(("-Unlocked Skill Category:" @ string(I)) @ SkillCatagories[I]);
            LogInternal("--Selected Skill:" @ string(SelectedSkills[I]));
        }
        ++ I;
        goto J0x83;
    }
}

simulated function FormatPerkSkills();

simulated function PlayerDied();

defaultproperties
{
    ProgressStatID=-1
    SecondaryXPModifier=1
    Passives(0)=(Title="",Description="",IconPath="")
    Passives(1)=(Title="",Description="",IconPath="")
    Passives(2)=(Title="",Description="",IconPath="")
    Passives(3)=(Title="",Description="",IconPath="")
    Passives(4)=(Title="",Description="",IconPath="")
    LevelString="Level"
    PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Berserker'
    WeaponDroppedMessage="You dropped%%%% because of your new carrying capacity!"
    CurrentLevel=255
    RegenerationInterval=1
    BarrageDamageModifier=1.15
    FormidableDamageModifier=0.75
    SignatureDamageScale=1
    BleedDmgTypeClass=Class'KFDT_Bleeding'
    SecondaryWeaponDef=Class'KFWeapDef_9mm'
    KnifeWeaponDef=Class'KFWeapDef_Knife_Commando'
    GrenadeWeaponDef=Class'KFWeapDef_Grenade_Berserker'
    InitialGrenadeCount=2
    MaxGrenadeCount=5
    BackupWeaponDamageTypeNames(0)=KFDT_Ballistic_9mm
    BackupWeaponDamageTypeNames(1)=KFDT_Slashing_Knife
    bTickIsDisabled=true
    bOnlyRelevantToOwner=true
    bAlwaysRelevant=false
    NetUpdateFrequency=1
}