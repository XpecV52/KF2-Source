/*******************************************************************************
 * KFPerk_Commando generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPerk_Commando extends KFPerk
    native
    config(Game)
    hidecategories(Navigation,Movement,Collision,Mobile,Object,Debug,Advanced,Physics,Actor,Attachment,Display);

enum ECommandoSkills
{
    ECommandoTacticalReload,
    ECommandoLargeMags,
    ECommandoBackup,
    ECommandoImpact,
    ECommandoHealthIncrease,
    ECommandoAmmoVest,
    ECommandoHollowPoints,
    ECommandoEatLead,
    ECommandoProfessional,
    ECommandoRapidFire,
    ECommandoSkills_MAX
};

var private const PerkSkill WeaponDamage;
var private const PerkSkill CloakedEnemyDetection;
var private const PerkSkill ZedTimeExtension;
var private const PerkSkill ReloadSpeed;
var private const PerkSkill CallOut;
var private const PerkSkill NightVision;
var private const PerkSkill Recoil;
var private const float RapidFireFiringRate;
var private const float BackupWeaponSwitchModifier;
var private const float HealthArmorModifier;
var Texture2D WhiteMaterial;

function SetPlayerDefaults(Pawn PlayerPawn)
{
    local float NewArmor;

    super.SetPlayerDefaults(PlayerPawn);
    if((OwnerPawn.Role == ROLE_Authority) && IsHealthIncreaseActive())
    {
        NewArmor = float(OwnerPawn.default.MaxArmor) * GetHealthArmorModifier();
        OwnerPawn.AddArmor(Round(NewArmor));
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
    if((((KFW != none) && ((IsWeaponOnPerk(KFW,, self.Class)) || IsDual9mm(KFW)) || Is9mm(KFW)) || IsDoshinegun(KFW)) || (DamageType != none) && IsDamageTypeOnPerk(DamageType))
    {
        TempDamage += (float(InDamage) * (GetPassiveValue(WeaponDamage, CurrentLevel)));
        if(IsRapidFireActive())
        {
            TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[9])));
        }
    }
    if((KFW != none) && !DamageCauser.IsA('KFProj_Grenade'))
    {
        if(IsBackupActive() && (IsBackupWeapon(KFW)) || IsDual9mm(KFW))
        {
            TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[2])));
        }
        if(IsWeaponOnPerk(KFW,, self.Class))
        {
            if(IsHollowPointsActive())
            {
                TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[6])));
            }
        }
    }
    InDamage = FCeil(TempDamage);
}

simulated function float GetCloakDetectionRange()
{
    return GetPassiveValue(CloakedEnemyDetection, CurrentLevel);
}

static simulated function float GetZedTimeExtension(byte Level)
{
    if(Level >= 25)
    {
        return default.ZedTimeExtension.MaxValue;        
    }
    else
    {
        if(Level >= 20)
        {
            return default.ZedTimeExtension.StartingValue + (float(4) * default.ZedTimeExtension.Increment);            
        }
        else
        {
            if(Level >= 15)
            {
                return default.ZedTimeExtension.StartingValue + (float(3) * default.ZedTimeExtension.Increment);                
            }
            else
            {
                if(Level >= 10)
                {
                    return default.ZedTimeExtension.StartingValue + (float(2) * default.ZedTimeExtension.Increment);                    
                }
                else
                {
                    if(Level >= 5)
                    {
                        return default.ZedTimeExtension.StartingValue + default.ZedTimeExtension.Increment;
                    }
                }
            }
        }
    }
    return 1;
}

private static final simulated function float GetExtraReloadSpeed(int Level)
{
    return default.ReloadSpeed.Increment * float(FFloor(float(Level) / 5));
}

simulated function float GetReloadRateScale(KFWeapon KFW)
{
    if(IsWeaponOnPerk(KFW,, self.Class))
    {
        return 1 - GetExtraReloadSpeed(CurrentLevel);
    }
    return 1;
}

function ModifyHealth(out int InHealth)
{
    local float TempHealth;

    if(IsHealthIncreaseActive())
    {
        TempHealth = float(InHealth);
        TempHealth += (float(InHealth) * (GetSkillValue(PerkSkills[4])));
        InHealth = Round(TempHealth);
    }
}

function ModifyArmor(out byte MaxArmor)
{
    local float TempArmor;

    if(IsHealthIncreaseActive())
    {
        TempArmor = float(MaxArmor);
        TempArmor += (float(MaxArmor) * (GetSkillValue(PerkSkills[4])));
        MaxArmor = byte(Round(TempArmor));
    }
}

simulated function bool GetUsingTactialReload(KFWeapon KFW)
{
    return IsTacticalReloadActive() && ((IsWeaponOnPerk(KFW,, self.Class)) || IsBackupWeapon(KFW)) || IsDual9mm(KFW);
}

simulated function ModifyMagSizeAndNumber(KFWeapon KFW, out int MagazineCapacity, optional array< class<KFPerk> > WeaponPerkClass, optional bool bSecondary, optional name WeaponClassName)
{
    local float TempCapacity;

    bSecondary = false;    
    TempCapacity = float(MagazineCapacity);
    if(((!bSecondary || IsFAMAS(KFW)) && IsWeaponOnPerk(KFW, WeaponPerkClass, self.Class)) && (KFW == none) || !KFW.bNoMagazine)
    {
        if(IsLargeMagActive())
        {
            TempCapacity += (float(MagazineCapacity) * (GetSkillValue(PerkSkills[1])));
        }
        if(IsEatLeadActive())
        {
            TempCapacity += (float(MagazineCapacity) * (GetSkillValue(PerkSkills[7])));
        }
    }
    MagazineCapacity = Round(TempCapacity);
}

simulated function ModifyMaxSpareAmmoAmount(KFWeapon KFW, out int MaxSpareAmmo, const optional out STraderItem TraderItem, optional bool bSecondary)
{
    local float TempMaxSpareAmmoAmount;

    bSecondary = false;
    if(IsAmmoVestActive() && ((IsWeaponOnPerk(KFW, TraderItem.AssociatedPerkClasses, self.Class)) || IsBackupWeapon(KFW)) || IsDual9mm(KFW))
    {
        TempMaxSpareAmmoAmount = float(MaxSpareAmmo);
        TempMaxSpareAmmoAmount += (float(MaxSpareAmmo) * (GetSkillValue(PerkSkills[5])));
        MaxSpareAmmo = Round(TempMaxSpareAmmoAmount);
    }
}

private static final simulated function bool Is9mm(KFWeapon KFW)
{
    return ((KFW != none) && KFW.default.bIsBackupWeapon) && !KFW.IsMeleeWeapon();
}

simulated function float GetZedTimeModifier(KFWeapon W)
{
    local name StateName;

    StateName = W.GetStateName();
    if(IsProfessionalActive() && ((IsWeaponOnPerk(W,, self.Class)) || IsBackupWeapon(W)) || IsDual9mm(W))
    {
        if((StateName == 'Reloading') || StateName == 'AltReloading')
        {
            return 1;            
        }
        else
        {
            if((StateName == 'WeaponPuttingDown') || StateName == 'WeaponEquipping')
            {
                return 0.3;
            }
        }
    }
    if(((CouldRapidFireActive()) && ((Is9mm(W) || IsDual9mm(W)) || IsDoshinegun(W)) || IsWeaponOnPerk(W,, self.Class)) && (ZedTimeModifyingStates.Find(StateName != -1) || (IsFAMAS(W)) && StateName == 'FiringSecondaryState')
    {
        return RapidFireFiringRate;
    }
    return 0;
}

simulated function float GetZedTimeModifierForWindUp()
{
    if(CouldRapidFireActive())
    {
        return RapidFireFiringRate;
    }
    return 0;
}

function float GetStumblePowerModifier(optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart)
{
    local KFWeapon KFW;

    KFW = GetOwnerWeapon();
    if(IsImpactActive() && IsWeaponOnPerk(KFW,, self.Class))
    {
        return GetSkillValue(PerkSkills[3]);
    }
    return 0;
}

simulated function ModifyWeaponSwitchTime(out float ModifiedSwitchTime)
{
    if(IsBackupActive())
    {
        ModifiedSwitchTime -= (ModifiedSwitchTime * GetBackupWeaponSwitchModifier());
    }
}

static final simulated function float GetBackupWeaponSwitchModifier()
{
    return default.BackupWeaponSwitchModifier;
}

simulated function ModifyRecoil(out float CurrentRecoilModifier, KFWeapon KFW)
{
    if(IsWeaponOnPerk(KFW,, self.Class))
    {
        CurrentRecoilModifier *= (1 - (GetPassiveValue(Recoil, CurrentLevel)));
    }
}

private static final function float GetHealthArmorModifier()
{
    return default.HealthArmorModifier;
}

simulated function bool IsCallOutActive()
{
    return true;
}

simulated function bool HasNightVision()
{
    return true;
}

protected simulated function bool IsRapidFireActive()
{
    return (PerkSkills[9].bActive && WorldInfo.TimeDilation < 1) && IsPerkLevelAllowed(9);
}

protected simulated function bool CouldRapidFireActive()
{
    return PerkSkills[9].bActive && IsPerkLevelAllowed(9);
}

private final simulated function bool IsLargeMagActive()
{
    return PerkSkills[1].bActive && IsPerkLevelAllowed(1);
}

private final simulated function bool IsBackupActive()
{
    return PerkSkills[2].bActive && IsPerkLevelAllowed(2);
}

private final simulated function bool IsHollowPointsActive()
{
    return PerkSkills[6].bActive && IsPerkLevelAllowed(6);
}

private final simulated function bool IsTacticalReloadActive()
{
    return PerkSkills[0].bActive && IsPerkLevelAllowed(0);
}

private final function bool IsImpactActive()
{
    return PerkSkills[3].bActive && IsPerkLevelAllowed(3);
}

private final function bool IsHealthIncreaseActive()
{
    return PerkSkills[4].bActive && IsPerkLevelAllowed(4);
}

private final function bool IsEatLeadActive()
{
    return PerkSkills[7].bActive && IsPerkLevelAllowed(7);
}

private final function bool IsAmmoVestActive()
{
    return PerkSkills[5].bActive && IsPerkLevelAllowed(5);
}

private final simulated function bool IsProfessionalActive()
{
    return PerkSkills[8].bActive && IsPerkLevelAllowed(8);
}

static simulated function GetPassiveStrings(out array<string> PassiveValues, out array<string> Increments, byte Level)
{
    PassiveValues[0] = string(Round((GetPassiveValue(default.WeaponDamage, Level)) * float(100))) $ "%";
    PassiveValues[1] = string(Round((GetPassiveValue(default.CloakedEnemyDetection, Level)) / float(100))) $ "m";
    PassiveValues[2] = string(Round(GetZedTimeExtension(Level)));
    PassiveValues[3] = string(Round(GetExtraReloadSpeed(Level) * float(100))) $ "%";
    PassiveValues[4] = string(Round((GetPassiveValue(default.Recoil, Level)) * float(100))) $ "%";
    PassiveValues[5] = "";
    Increments[0] = ((("[" @ Left(string(default.WeaponDamage.Increment * float(100)), InStr(string(default.WeaponDamage.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[1] = ((((("[" @ string(int(default.CloakedEnemyDetection.StartingValue / float(100)))) @ "+") @ string(int(default.CloakedEnemyDetection.Increment / float(100)))) $ "m /") @ default.LevelString) @ "]";
    Increments[2] = ((((("[" @ string(Round(default.ZedTimeExtension.StartingValue))) @ "+") @ string(Round(default.ZedTimeExtension.Increment))) @ " / 5") @ default.LevelString) @ "]";
    Increments[3] = ((("[" @ Left(string(default.ReloadSpeed.Increment * float(100)), InStr(string(default.ReloadSpeed.Increment * float(100)), ".") + 2)) $ "% / 5") @ default.LevelString) @ "]";
    Increments[4] = ((("[" @ Left(string(default.Recoil.Increment * float(100)), InStr(string(default.Recoil.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[5] = "";
}

static simulated function int GetStalkerKillXP(byte Difficulty)
{
    return default.SecondaryXPModifier[Difficulty];
}

simulated function DrawSpecialPerkHUD(Canvas C)
{
    local KFPawn_Monster KFPM;
    local Vector ViewLocation, ViewDir;
    local float DetectionRangeSq, ThisDot, HealthBarLength, HealthbarHeight;

    if(CheckOwnerPawn())
    {
        DetectionRangeSq = Square(GetPassiveValue(CloakedEnemyDetection, CurrentLevel));
        HealthBarLength = FMin(50 * (float(C.SizeX) / 1024), 50);
        HealthbarHeight = FMin(6 * (float(C.SizeX) / 1024), 6);
        ViewLocation = OwnerPawn.GetPawnViewLocation();
        ViewDir = vector(OwnerPawn.GetViewRotation());
        foreach WorldInfo.AllPawns(Class'KFPawn_Monster', KFPM)
        {
            if(((!KFPM.CanShowHealth() || !KFPM.IsAliveAndWell()) || (WorldInfo.TimeSeconds - KFPM.Mesh.LastRenderTime) > 0.1) || VSizeSq(KFPM.Location - ViewLocation) > DetectionRangeSq)
            {
                continue;                
            }
            ThisDot = ViewDir Dot Normal(KFPM.Location - ViewLocation);
            if(ThisDot > 0)
            {
                DrawZedHealthbar(C, KFPM, ViewLocation, HealthbarHeight, HealthBarLength);
            }            
        }        
    }
}

simulated function DrawZedHealthbar(Canvas C, KFPawn_Monster KFPM, Vector CameraLocation, float HealthbarHeight, float HealthBarLength)
{
    local Vector ScreenPos, TargetLocation;
    local float HealthScale;

    if((KFPM.bCrawler && KFPM.Floor.Z <= -0.7) && KFPM.Physics == 8)
    {
        TargetLocation = KFPM.Location + (((vect(0, 0, -1) * KFPM.GetCollisionHeight()) * 1.2) * KFPM.CurrentBodyScale);        
    }
    else
    {
        TargetLocation = KFPM.Location + (((vect(0, 0, 1) * KFPM.GetCollisionHeight()) * 1.2) * KFPM.CurrentBodyScale);
    }
    ScreenPos = C.Project(TargetLocation);
    if((((ScreenPos.X < float(0)) || ScreenPos.X > float(C.SizeX)) || ScreenPos.Y < float(0)) || ScreenPos.Y > float(C.SizeY))
    {
        return;
    }
    if(Class'KFGameEngine'.static.FastTrace_PhysX(TargetLocation, CameraLocation))
    {
        HealthScale = FClamp(float(KFPM.Health) / float(KFPM.HealthMax), 0, 1);
        C.EnableStencilTest(true);
        C.SetDrawColor(0, 0, 0, 255);
        C.SetPos(ScreenPos.X - (HealthBarLength * 0.5), ScreenPos.Y);
        C.DrawTile(WhiteMaterial, HealthBarLength, HealthbarHeight, 0, 0, 32, 32);
        C.SetDrawColor(237, 8, 0, 255);
        C.SetPos((ScreenPos.X - (HealthBarLength * 0.5)) + 1, ScreenPos.Y + 1);
        C.DrawTile(WhiteMaterial, (HealthBarLength - 2) * HealthScale, HealthbarHeight - 2, 0, 0, 32, 32);
        C.EnableStencilTest(false);
    }
}

private final simulated function name LogTacticalReload()
{
    local KFWeapon KFW;

    KFW = GetOwnerWeapon();
    return KFW.GetReloadAnimName(GetUsingTactialReload(KFW));
}

simulated function LogPerkSkills()
{
    super.LogPerkSkills();
    if(bLogPerk)
    {
    }
}

defaultproperties
{
    WeaponDamage=(Name="Weapon Damage",Increment=0.01,Rank=0,StartingValue=0,MaxValue=0.25,ModifierValue=0,IconPath="",bActive=false)
    CloakedEnemyDetection=(Name="Cloaked Enemy Detection Range",Increment=200,Rank=0,StartingValue=1000,MaxValue=6000,ModifierValue=0,IconPath="",bActive=false)
    ZedTimeExtension=(Name="Zed Time Extension",Increment=1,Rank=0,StartingValue=1,MaxValue=6,ModifierValue=0,IconPath="",bActive=false)
    ReloadSpeed=(Name="Reload Speed",Increment=0.02,Rank=0,StartingValue=0,MaxValue=0.1,ModifierValue=0,IconPath="",bActive=false)
    CallOut=(Name="Call Out",Increment=2,Rank=0,StartingValue=0,MaxValue=50,ModifierValue=0,IconPath="",bActive=false)
    NightVision=(Name="Night Vision",Increment=0,Rank=0,StartingValue=0,MaxValue=0,ModifierValue=0,IconPath="",bActive=false)
    Recoil=(Name="Recoil",Increment=0.02,Rank=0,StartingValue=0,MaxValue=0.5,ModifierValue=0,IconPath="",bActive=false)
    RapidFireFiringRate=0.5
    BackupWeaponSwitchModifier=0.5
    HealthArmorModifier=0.25
    WhiteMaterial=Texture2D'EngineResources.WhiteSquareTexture'
    ProgressStatID=1
    PerkBuildStatID=2
    SecondaryXPModifier[0]=3
    SecondaryXPModifier[1]=5
    SecondaryXPModifier[2]=6
    SecondaryXPModifier[3]=9
    PerkName="Commando"
    Passives(0)=(Title="Perk Weapon Damage",Description="Perk weapon damage increases %x% per level",IconPath="")
    Passives(1)=(Title="Cloaked Enemy & Health Bar Detection",Description="Range of 5m plus %x%m per level",IconPath="")
    Passives(2)=(Title="Zed Time Refreshes",Description="Zed time increases %x% every 5 levels",IconPath="")
    Passives(3)=(Title="Reload Speed",Description="Perk weapon reload speed increases %x%% every 5 levels",IconPath="")
    Passives(4)=(Title="Recoil Reduction",Description="Decrease recoil %x% per level",IconPath="")
    Passives(5)=(Title="Call Out Cloaked Zeds",Description="Allow teammates to see cloaked units",IconPath="")
    SkillCatagories[0]="Ammo Management"
    SkillCatagories[1]="Tactics"
    SkillCatagories[2]="Survival"
    SkillCatagories[3]="Weapon Specialist"
    SkillCatagories[4]="Advanced Training"
    EXPAction1="Dealing Commando weapon damage"
    EXPAction2="Killing Stalkers with Commando weapons"
    PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Commando'
    PerkSkills(0)=(Name="TacticalReload",Increment=0,Rank=0,StartingValue=0,MaxValue=0,ModifierValue=0,IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_TacticalReload",bActive=false)
    PerkSkills(1)=(Name="LargeMags",Increment=0,Rank=0,StartingValue=0.5,MaxValue=0.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_LargeMag",bActive=false)
    PerkSkills(2)=(Name="Backup",Increment=0,Rank=0,StartingValue=0.85,MaxValue=0.85,ModifierValue=0,IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_Backup",bActive=false)
    PerkSkills(3)=(Name="Impact",Increment=0,Rank=0,StartingValue=1.5,MaxValue=1.5,ModifierValue=0,IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_Impact",bActive=false)
    PerkSkills(4)=(Name="HealthIncrease",Increment=0,Rank=0,StartingValue=0.25,MaxValue=0.25,ModifierValue=0,IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_HP",bActive=false)
    PerkSkills(5)=(Name="AmmoVest",Increment=0,Rank=0,StartingValue=0.2,MaxValue=0.2,ModifierValue=0,IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_AmmoVest",bActive=false)
    PerkSkills(6)=(Name="HollowPoints",Increment=0,Rank=0,StartingValue=0.3,MaxValue=0.3,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_SingleFire",bActive=false)
    PerkSkills(7)=(Name="EatLead",Increment=0,Rank=0,StartingValue=1,MaxValue=1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_AutoFire",bActive=false)
    PerkSkills(8)=(Name="Professional",Increment=0,Rank=0,StartingValue=0,MaxValue=0,ModifierValue=0,IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_Professional",bActive=false)
    PerkSkills(9)=(Name="RapidFire",Increment=0,Rank=0,StartingValue=0.03,MaxValue=0.03,ModifierValue=0,IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_RapidFire",bActive=false)
    ZedTimeModifyingStates(0)=WeaponFiring
    ZedTimeModifyingStates(1)=WeaponBurstFiring
    ZedTimeModifyingStates(2)=WeaponSingleFiring
    ZedTimeModifyingStates(3)=WeaponWindingUp
    bCanSeeCloakedZeds=true
    PrimaryWeaponDef=Class'KFWeapDef_AR15'
    GrenadeWeaponDef=Class'KFWeapDef_Grenade_Commando'
    AutoBuyLoadOutPath(0)=class'KFWeapDef_AR15'
    AutoBuyLoadOutPath(1)=class'KFWeapDef_Bullpup'
    AutoBuyLoadOutPath(2)=class'KFWeapDef_AK12'
    AutoBuyLoadOutPath(3)=class'KFWeapDef_SCAR'
    AutoBuyLoadOutPath(4)=class'KFWeapDef_MedicRifleGrenadeLauncher'
    HeadshotAccuracyHandicap=-3
    PrestigeRewardItemIconPaths(0)="WEP_SkinSet_Prestige01_Item_TEX.knives.CommandoKnife_PrestigePrecious_Mint_large"
    PrestigeRewardItemIconPaths(1)="WEP_SkinSet_Prestige02_Item_TEX.tier01.AR15_PrestigePrecious_Mint_large"
    PrestigeRewardItemIconPaths(2)="WEP_skinset_prestige03_itemtex.tier02.L85A2_PrestigePrecious_Mint_large"
    PrestigeRewardItemIconPaths(3)="wep_skinset_prestige04_itemtex.tier03.AK12_PrestigePrecious_Mint_Large"
    PrestigeRewardItemIconPaths(4)="WEP_SkinSet_Prestige05_Item_TEX.tier04.Scar_PrestigePrecious_Mint_large"
}