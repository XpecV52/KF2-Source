/*******************************************************************************
 * KFPerk_Sharpshooter generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPerk_Sharpshooter extends KFPerk
    native
    config(Game)
    hidecategories(Navigation,Movement,Collision);

enum ESharpshooterPerkSkills
{
    ESharpshooterStationaryAim,
    ESharpshooterTrigger,
    ESharpshooterCrouchAim,
    ESharpshooterStun,
    ESharpshooterRhythmMethod,
    ESharpshooterTacticalReload,
    ESharpshooterScoped,
    ESharpshooterAmmoPouch,
    ESharpshooterZTKnockdown,
    ESharpshooterZTStun,
    ESharpshooterPerkSkills_MAX
};

var private const PerkSkill HeadshotDamage;
var private const PerkSkill Recoil;
var private const PerkSkill WeaponSwitchSpeed;
var private const AkEvent RhythmMethodSoundReset;
var private const AkEvent RhythmMethodSoundHit;
var private const AkEvent RhythmMethodSoundTop;
var private const name RhytmMethodRTPCName;
var private int HeadShotComboCount;
var private int HeadShotComboCountDisplay;
var private const float HeadShotCountdownIntervall;
var private const int MaxHeadShotComboCount;
var private const float CameraViewShakeScale;
var private const float TriggerMovementSpeedModifier;
var private const float CrouchAimMovementSpeedModifier;
var private const float CrouchAimReloadSpeedModifier;
var private const array<name> AdditionalOnPerkWeaponNames;
var private const array<name> AdditionalOnPerkDTNames;
var float SkillZedTimeChance;
var private transient bool bWasHeadshot;

static simulated function GetPassiveStrings(out array<string> PassiveValues, out array<string> Increments, byte Level)
{
    PassiveValues[0] = string(Round((GetPassiveValue(default.HeadshotDamage, Level)) * float(100))) $ "%";
    PassiveValues[1] = string(Round((GetPassiveValue(default.Recoil, Level)) * float(100))) $ "%";
    PassiveValues[2] = string(Round((GetPassiveValue(default.WeaponSwitchSpeed, Level)) * float(100))) $ "%";
    PassiveValues[3] = "";
    PassiveValues[4] = "";
    Increments[0] = ((("[" @ Left(string(default.HeadshotDamage.Increment * float(100)), InStr(string(default.HeadshotDamage.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[1] = ((("[" @ Left(string(default.Recoil.Increment * float(100)), InStr(string(default.Recoil.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[2] = ((("[" @ Left(string(default.WeaponSwitchSpeed.Increment * float(100)), InStr(string(default.WeaponSwitchSpeed.Increment * float(100)), ".") + 2)) $ "% /") @ default.LevelString) @ "]";
    Increments[3] = "";
    Increments[4] = "";
}

static simulated function int GetHeadshotXP(byte Difficulty)
{
    return default.SecondaryXPModifier[Difficulty];
}

simulated function ModifySpeed(out float Speed)
{
    if(IsTriggerActive())
    {
        Speed += (Speed * GetTriggerMovementSpeedModifier());
    }
    if(IsCrouchAimActive(GetOwnerWeapon()))
    {
        Speed += (Speed * GetCrouchAimMovementSpeedModifier());
    }
}

simulated function ModifyWeaponSwitchTime(out float ModifiedSwitchTime)
{
    ModifiedSwitchTime *= (1 - (GetPassiveValue(WeaponSwitchSpeed, CurrentLevel)));
}

simulated function ModifyDamageGiven(out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx)
{
    local KFWeapon KFW;
    local float TempDamage;

    bWasHeadshot = false;
    TempDamage = float(InDamage);
    if(DamageCauser != none)
    {
        KFW = GetWeaponFromDamageCauser(DamageCauser);
    }
    if(((KFW != none) && IsWeaponOnPerk(KFW,, self.Class)) || (DamageType != none) && IsDamageTypeOnPerk(DamageType))
    {
        if((MyKFPM != none) && HitZoneIdx == 0)
        {
            bWasHeadshot = true;
            TempDamage += (float(InDamage) * (GetPassiveValue(HeadshotDamage, CurrentLevel)));
            if(GetScopedActive(KFW))
            {
                TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[6])));
            }
            if((IsZTKnockdownActive()) || IsZTStunActive())
            {
                if(MyKFGI != none)
                {
                    MyKFGI.DramaticEvent(SkillZedTimeChance);
                }
            }
            if(GetZTKnockdownActive())
            {
                TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[8])));
            }
        }
        if((IsStationaryAimActive()) && VSizeSq(OwnerPawn.Velocity) <= float(0))
        {
            TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[0])));
        }
        if(IsCrouchAimActive(GetOwnerWeapon()))
        {
            TempDamage += (float(InDamage) * (GetSkillValue(PerkSkills[2])));
        }
        if((IsRhythmMethodActive()) && HeadShotComboCount > 0)
        {
            TempDamage += ((float(InDamage) * (GetSkillValue(PerkSkills[4]))) * float(HeadShotComboCount));
        }
    }
    InDamage = FCeil(TempDamage);
}

simulated function ModifyRateOfFire(out float InRate, KFWeapon KFW)
{
    if(((IsTriggerActive()) && IsWeaponOnPerk(KFW,, self.Class)) && KFW.CurrentFireMode != 4)
    {
        InRate -= (InRate * (GetSkillValue(PerkSkills[1])));
    }
}

simulated function float GetReloadRateScale(KFWeapon KFW)
{
    if(IsCrouchAimActive(KFW))
    {
        return 1 - GetCrouchAimReloadSpeedModifier();
    }
    return 1;
}

simulated function ModifyRecoil(out float CurrentRecoilModifier, KFWeapon KFW)
{
    if(IsWeaponOnPerk(KFW,, self.Class))
    {
        CurrentRecoilModifier -= (CurrentRecoilModifier * (GetPassiveValue(Recoil, CurrentLevel)));
        if(GetScopedActive(KFW))
        {
            CurrentRecoilModifier -= (CurrentRecoilModifier * (GetSkillValue(PerkSkills[6])));
        }
    }
}

simulated event float GetCameraViewShakeModifier(KFWeapon OwnerWeapon)
{
    if(GetScopedActive(OwnerWeapon))
    {
        return GetCameraViewShakeScale();
    }
    return 1;
}

static final simulated function float GetCameraViewShakeScale()
{
    return default.CameraViewShakeScale;
}

simulated function ModifyMaxSpareAmmoAmount(KFWeapon KFW, out int MaxSpareAmmo, const optional out STraderItem TraderItem, optional bool bSecondary)
{
    local float TempMaxSpareAmmoAmount;

    bSecondary = false;
    if((IsAmmoPouchActive()) && IsWeaponOnPerk(KFW, TraderItem.AssociatedPerkClasses, self.Class, TraderItem.ClassName))
    {
        TempMaxSpareAmmoAmount = float(MaxSpareAmmo);
        TempMaxSpareAmmoAmount += (TempMaxSpareAmmoAmount * (GetSkillValue(PerkSkills[7])));
        MaxSpareAmmo = Round(TempMaxSpareAmmoAmount);
    }
}

protected simulated event PostSkillUpdate()
{
    if(IsAmmoPouchActive())
    {
        MaxGrenadeCount = int(float(default.MaxGrenadeCount) + (float(default.MaxGrenadeCount) * (GetSkillValue(PerkSkills[7]))));        
    }
    else
    {
        MaxGrenadeCount = default.MaxGrenadeCount;
    }
    super.PostSkillUpdate();
    SetTickIsDisabled(!IsRhythmMethodActive());
    if(Role == ROLE_Authority)
    {
        if(IsRhythmMethodActive())
        {
            ServerClearHeadShotsCombo();
        }
    }
}

event Destroyed()
{
    if(Role == ROLE_Authority)
    {
        ServerClearHeadShotsCombo();
    }
}

simulated function bool GetUsingTactialReload(KFWeapon KFW)
{
    return (IsTacticalReloadActive()) && ((IsWeaponOnPerk(KFW,, self.Class)) || IsBackupWeapon(KFW)) || IsDual9mm(KFW);
}

function float GetStunPowerModifier(optional class<DamageType> DamageType, optional byte HitZoneIdx)
{
    if((IsDamageTypeOnPerk(class<KFDamageType>(DamageType))) && IsStunActive())
    {
        return GetSkillValue(PerkSkills[3]);
    }
    return 0;
}

function bool IsStunGuaranteed(optional class<DamageType> DamageType, optional byte HitZoneIdx)
{
    if((IsDamageTypeOnPerk(class<KFDamageType>(DamageType))) && GetZTStunActive())
    {
        return bWasHeadshot;
    }
    return false;
}

function bool IsStationaryAimActive()
{
    return PerkSkills[0].bActive && IsPerkLevelAllowed(0);
}

simulated function bool IsTriggerActive()
{
    return PerkSkills[1].bActive && IsPerkLevelAllowed(1);
}

simulated function bool IsCrouchAimActive(KFWeapon W)
{
    return (((PerkSkills[2].bActive && CheckOwnerPawn()) && OwnerPawn.bIsCrouched) && IsWeaponOnPerk(W,, self.Class)) && IsPerkLevelAllowed(2);
}

simulated function bool IsStunActive()
{
    return PerkSkills[3].bActive && IsPerkLevelAllowed(3);
}

simulated function bool IsRhythmMethodActive()
{
    return PerkSkills[4].bActive && IsPerkLevelAllowed(4);
}

simulated function bool IsTacticalReloadActive()
{
    return PerkSkills[5].bActive && IsPerkLevelAllowed(5);
}

simulated function bool IsScopedActive()
{
    return PerkSkills[6].bActive && IsPerkLevelAllowed(6);
}

simulated function bool GetScopedActive(KFWeapon KFW)
{
    return ((IsScopedActive()) && KFW != none) && KFW.bUsingSights;
}

simulated function bool IsAmmoPouchActive()
{
    return PerkSkills[7].bActive && IsPerkLevelAllowed(7);
}

simulated function bool IsZTKnockdownActive()
{
    return PerkSkills[8].bActive && IsPerkLevelAllowed(8);
}

simulated function bool GetZTKnockdownActive()
{
    return (IsZTKnockdownActive()) && WorldInfo.TimeDilation < 1;
}

simulated function bool IsZTStunActive()
{
    return PerkSkills[9].bActive && IsPerkLevelAllowed(9);
}

simulated function bool GetZTStunActive()
{
    return (IsZTStunActive()) && WorldInfo.TimeDilation < 1;
}

static function int GetMaxHeadShotComboCount()
{
    return default.MaxHeadShotComboCount;
}

function AddToHeadShotCombo(class<KFDamageType> KFDT, KFPawn_Monster KFPM)
{
    if(IsDamageTypeOnPerk(KFDT))
    {
        ++ HeadShotComboCount;
        ++ HeadShotComboCountDisplay;
        HeadShotComboCount = Min(HeadShotComboCount, MaxHeadShotComboCount);
        HeadShotMessage(byte(HeadShotComboCount), byte(HeadShotComboCountDisplay),, KFPM);
        SetTimer(HeadShotCountdownIntervall, true, 'SubstractHeadShotCombo');
    }
}

function UpdatePerkHeadShots(ImpactInfo Impact, class<DamageType> DamageType, int NumHit)
{
    local int HitZoneIdx;
    local KFPawn_Monster KFPM;

    if(!IsRhythmMethodActive())
    {
        return;
    }
    KFPM = KFPawn_Monster(Impact.HitActor);
    if((KFPM != none) && !KFPM.bIsHeadless)
    {
        HitZoneIdx = KFPM.HitZones.Find('ZoneName', Impact.HitInfo.BoneName;
        if(((HitZoneIdx == 0) && KFPM != none) && KFPM.IsAliveAndWell())
        {
            AddToHeadShotCombo(class<KFDamageType>(DamageType), KFPM);
        }
    }
}

reliable client simulated function HeadShotMessage(byte HeadShotNum, byte DisplayValue, optional bool bMissed, optional KFPawn_Monster KFPM)
{
    local int I;
    local AkEvent TempAkEvent;

    bMissed = false;    
    if(((OwnerPC == none) || OwnerPC.myGfxHUD == none) || !IsRhythmMethodActive())
    {
        return;
    }
    I = HeadShotNum;
    OwnerPC.UpdateRhythmCounterWidget(DisplayValue, MaxHeadShotComboCount);
    switch(I)
    {
        case 0:
            TempAkEvent = RhythmMethodSoundReset;
            break;
        case 1:
        case 2:
        case 3:
        case 4:
            if(!bMissed)
            {
                TempAkEvent = RhythmMethodSoundHit;
            }
            break;
        case 5:
            if(!bMissed)
            {
                TempAkEvent = RhythmMethodSoundTop;
                I = 6;
            }
            break;
        default:
            break;
    }
    if(TempAkEvent != none)
    {
        OwnerPC.PlayRMEffect(TempAkEvent, RhytmMethodRTPCName, I);
    }
}

function SubstractHeadShotCombo()
{
    if((IsRhythmMethodActive()) && HeadShotComboCount > 0)
    {
        -- HeadShotComboCount;
        HeadShotComboCountDisplay = HeadShotComboCount;
        HeadShotMessage(byte(HeadShotComboCount), byte(HeadShotComboCountDisplay), true);        
    }
    else
    {
        if(HeadShotComboCount <= 0)
        {
            ClearTimer('SubstractHeadShotCombo');
        }
    }
}

private reliable server final function ServerClearHeadShotsCombo()
{
    HeadShotComboCountDisplay = 0;
    HeadShotComboCount = 0;
    HeadShotMessage(byte(HeadShotComboCount), byte(HeadShotComboCountDisplay));
    ClearTimer('SubstractHeadShotCombo');
}

simulated event bool GetIsHeadShotComboActive()
{
    return IsRhythmMethodActive();
}

private static final simulated function float GetTriggerMovementSpeedModifier()
{
    return default.TriggerMovementSpeedModifier;
}

private static final simulated function float GetCrouchAimMovementSpeedModifier()
{
    return default.CrouchAimMovementSpeedModifier;
}

private static final simulated function float GetCrouchAimReloadSpeedModifier()
{
    return default.CrouchAimReloadSpeedModifier;
}

static function bool IsDamageTypeOnPerk(class<KFDamageType> KFDT)
{
    if((KFDT != none) && default.AdditionalOnPerkDTNames.Find(KFDT.Name != -1)
    {
        return true;
    }
    return super.IsDamageTypeOnPerk(KFDT);
}

static simulated function bool IsWeaponOnPerk(KFWeapon W, optional array< class<KFPerk> > WeaponPerkClass, optional class<KFPerk> InstigatorPerkClass, optional name WeaponClassName)
{
    if((W != none) && default.AdditionalOnPerkWeaponNames.Find(W.Class.Name != -1)
    {
        return true;        
    }
    else
    {
        if((WeaponClassName != 'None') && default.AdditionalOnPerkWeaponNames.Find(WeaponClassName != -1)
        {
            return true;
        }
    }
    return super.IsWeaponOnPerk(W, WeaponPerkClass, InstigatorPerkClass, WeaponClassName);
}

defaultproperties
{
    HeadshotDamage=(Name="Headshot Damage",Increment=0.01,Rank=0,StartingValue=0,MaxValue=0.25,ModifierValue=0,IconPath="",bActive=false)
    Recoil=(Name="Recoil",Increment=0.01,Rank=0,StartingValue=0,MaxValue=0.25,ModifierValue=0,IconPath="",bActive=false)
    WeaponSwitchSpeed=(Name="Weapon Switch Speed",Increment=0.02,Rank=0,StartingValue=0,MaxValue=0.5,ModifierValue=0,IconPath="",bActive=false)
    RhythmMethodSoundReset=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Reset'
    RhythmMethodSoundHit=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Hit'
    RhythmMethodSoundTop=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Top'
    RhytmMethodRTPCName=R_Method
    HeadShotCountdownIntervall=2
    MaxHeadShotComboCount=5
    CameraViewShakeScale=0.5
    TriggerMovementSpeedModifier=0.1
    CrouchAimMovementSpeedModifier=0.5
    CrouchAimReloadSpeedModifier=0.2
    AdditionalOnPerkWeaponNames(0)=KFWeap_Pistol_9mm
    AdditionalOnPerkWeaponNames(1)=KFWeap_Pistol_Dual9mm
    AdditionalOnPerkWeaponNames(2)=KFWeap_Revolver_Rem1858
    AdditionalOnPerkWeaponNames(3)=KFWeap_Revolver_SW500
    AdditionalOnPerkDTNames(0)=KFDT_Ballistic_9mm
    AdditionalOnPerkDTNames(1)=KFDT_Ballistic_SW500
    AdditionalOnPerkDTNames(2)=KFDT_Ballistic_Rem1858
    SkillZedTimeChance=0.05
    ProgressStatID=50
    PerkBuildStatID=51
    SecondaryXPModifier[1]=1
    SecondaryXPModifier[2]=1
    SecondaryXPModifier[3]=1
    PerkName="Sharpshooter"
    Passives(0)=(Title="Headshot Damage",Description="Increase headshot damage %x% per level",IconPath="")
    Passives(1)=(Title="Recoil Reduction",Description="Decrease recoil %x% per level",IconPath="")
    Passives(2)=(Title="Weapon Switch",Description="Increase weapon switch speed %x% per level",IconPath="")
    Passives(3)=(Title="",Description="",IconPath="")
    Passives(4)=(Title="",Description="",IconPath="")
    SkillCatagories[0]="Movement"
    SkillCatagories[1]="Basic Technique"
    SkillCatagories[2]="Skill"
    SkillCatagories[3]="Equipment"
    SkillCatagories[4]="Master Techniques"
    EXPAction1="Dealing Sharpshooter weapon damage"
    EXPAction2="Head shots with Sharpshooter weapons"
    PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Sharpshooter'
    AssistDoshModifier=1.1
    PerkSkills(0)=(Name="StationaryAim",Increment=0,Rank=0,StartingValue=0.25,MaxValue=0.25,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_StationaryAim",bActive=false)
    PerkSkills(1)=(Name="Trigger",Increment=0,Rank=0,StartingValue=0.25,MaxValue=0.25,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_Trigger",bActive=false)
    PerkSkills(2)=(Name="CrouchAim",Increment=0,Rank=0,StartingValue=0.3,MaxValue=0.3,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_CrouchAim",bActive=false)
    PerkSkills(3)=(Name="Stun",Increment=0,Rank=0,StartingValue=1,MaxValue=1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_Stun",bActive=false)
    PerkSkills(4)=(Name="RhythmMethod",Increment=0,Rank=0,StartingValue=0.1,MaxValue=0.1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_RackUmUp",bActive=false)
    PerkSkills(5)=(Name="TacticalReload",Increment=0,Rank=0,StartingValue=0,MaxValue=0,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_TacticalReload",bActive=false)
    PerkSkills(6)=(Name="Scoped",Increment=0,Rank=0,StartingValue=0.1,MaxValue=0.1,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_Scoped",bActive=false)
    PerkSkills(7)=(Name="AmmoPouch",Increment=0,Rank=0,StartingValue=0.25,MaxValue=0.25,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_AmmoPouch",bActive=false)
    PerkSkills(8)=(Name="ZTKnockdown",Increment=0,Rank=0,StartingValue=0.35,MaxValue=0.35,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_ZED-KnockDown",bActive=false)
    PerkSkills(9)=(Name="ZTStun",Increment=0,Rank=0,StartingValue=4,MaxValue=4,ModifierValue=0,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_ZED-Stun",bActive=false)
    ZedTimeModifyingStates(0)=WeaponFiring
    ZedTimeModifyingStates(1)=WeaponBurstFiring
    ZedTimeModifyingStates(2)=WeaponSingleFiring
    ZedTimeModifyingStates(3)=CompoundBowCharge
    PrimaryWeaponDef=Class'KFWeapDef_Winchester1894'
    KnifeWeaponDef=Class'KFWeapDef_Knife_SharpShooter'
    GrenadeWeaponDef=Class'KFWeapDef_Grenade_Sharpshooter'
    AutoBuyLoadOutPath(0)=class'KFWeapDef_Winchester1894'
    AutoBuyLoadOutPath(1)=class'KFWeapDef_Crossbow'
    AutoBuyLoadOutPath(2)=class'KFWeapDef_M14EBR'
    AutoBuyLoadOutPath(3)=class'KFWeapDef_RailGun'
    AutoBuyLoadOutPath(4)=class'KFWeapDef_M99'
    HitAccuracyHandicap=-9
    HeadshotAccuracyHandicap=-16
    PrestigeRewardItemIconPaths(0)="WEP_SkinSet_Prestige01_Item_TEX.knives.SharpshooterKnife_PrestigePrecious_Mint_large"
    PrestigeRewardItemIconPaths(1)="WEP_SkinSet_Prestige02_Item_TEX.tier01.Winchester1894_PrestigePrecious_Mint_large"
    PrestigeRewardItemIconPaths(2)="WEP_skinset_prestige03_itemtex.tier02.Crossbow_PrestigePrecious_Mint_large"
    PrestigeRewardItemIconPaths(3)="wep_skinset_prestige04_itemtex.tier03.M14EBR_PrestigePrecious_Mint_Large"
    PrestigeRewardItemIconPaths(4)="WEP_SkinSet_Prestige05_Item_TEX.tier04.Railgun_PrestigePrecious_Mint_large"
}