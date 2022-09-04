/*******************************************************************************
 * KFZedArmorInfo generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFZedArmorInfo extends Object within KFPawn_Monster
    abstract;

struct ArmorZoneInfo
{
    var name ArmorZoneName;
    var array<name> AffectedHitZones;
    var bool bAffectedByFrontDamage;
    var bool bAffectedByBackDamage;
    var name SocketName;
    var int ArmorHealth;
    var int ObliterateDmgThreshold;
    var transient int ArmorHealthMax;
    var ParticleSystem ExplosionTemplate;
    var AkEvent ExplosionSFXTemplate;
    var array<name> BonesToHideOnExplode;
    var array<name> BonesToShowOnExplode;
    var Texture2D ZoneIcon;

    structdefaultproperties
    {
        ArmorZoneName=None
        AffectedHitZones=none
        bAffectedByFrontDamage=true
        bAffectedByBackDamage=true
        SocketName=None
        ArmorHealth=0
        ObliterateDmgThreshold=2147483647
        ArmorHealthMax=0
        ExplosionTemplate=none
        ExplosionSFXTemplate=none
        BonesToHideOnExplode=none
        BonesToShowOnExplode=none
        ZoneIcon=none
    }
};

var array<ArmorZoneInfo> ArmorZones;
var float ArmorScale;
var array<DamageModifierInfo> ArmorDamageTypeModifiers;

function byte GetArmorZonePctByte(int ZoneIdx)
{
    return FloatToByte(float(ArmorZones[ZoneIdx].ArmorHealth) / float(ArmorZones[ZoneIdx].ArmorHealthMax));
}

function InitArmor()
{
    local KFGameInfo KFGI;
    local float HealthMod, HeadHealthMod;
    local int I, J;

    KFGI = KFGameInfo(Outer.WorldInfo.Game);
    if(KFGI != none)
    {
        HealthMod = 1;
        HeadHealthMod = 1;
        KFGI.DifficultyInfo.GetAIHealthModifier(Outer, float(KFGI.GetModifiedGameDifficulty()), byte(KFGI.GetLivingPlayerCount()), HealthMod, HeadHealthMod);
        I = 0;
        J0x110:

        if(I < ArmorZones.Length)
        {
            ArmorZones[I].ArmorHealth *= HealthMod;
            ArmorZones[I].ArmorHealthMax = ArmorZones[I].ArmorHealth;
            Outer.RepArmorPct[I] = GetArmorZonePctByte(I);
            ++ I;
            goto J0x110;
        }
    }
    I = 0;
    J0x1FB:

    if(I < ArmorZones.Length)
    {
        J = 0;
        J0x21E:

        if(J < ArmorZones[I].BonesToShowOnExplode.Length)
        {
            Outer.Mesh.HideBoneByName(ArmorZones[I].BonesToShowOnExplode[J], 2);
            ++ J;
            goto J0x21E;
        }
        ++ I;
        goto J0x1FB;
    }
    UpdateArmorUI();
}

function ExplodeArmor(int ArmorZoneIdx)
{
    if(bool(Outer.ArmorZoneStatus & (1 << ArmorZoneIdx)))
    {
        ArmorZones[ArmorZoneIdx].ArmorHealth = 0;
        Outer.RepArmorPct[ArmorZoneIdx] = 0;
        Outer.ArmorZoneStatus = byte(Outer.ArmorZoneStatus ^ (1 << ArmorZoneIdx));
        UpdateArmorPiece(ArmorZoneIdx);
    }
}

simulated function UpdateArmorPieces()
{
    local int I, UpdatedZones;

    if(Outer.WorldInfo.NetMode != NM_DedicatedServer)
    {
        UpdatedZones = Outer.ArmorZoneStatus ^ Outer.PreviousArmorZoneStatus;
        I = 0;
        J0x95:

        if(I < ArmorZones.Length)
        {
            if(bool(UpdatedZones & (1 << I)))
            {
                UpdateArmorPiece(I);
            }
            ++ I;
            goto J0x95;
        }
        UpdateArmorUI();
    }
    Outer.PreviousArmorZoneStatus = Outer.ArmorZoneStatus;
}

simulated function UpdateArmorPiece(int PieceIdx)
{
    local Vector SocketLocation;
    local Rotator SocketRotation;
    local KFCharacterInfo_Monster MonsterArch;
    local int I;

    Outer.Mesh.GetSocketWorldLocationAndRotation(default.ArmorZones[PieceIdx].SocketName, SocketLocation, SocketRotation);
    Outer.PlaySoundBase(default.ArmorZones[PieceIdx].ExplosionSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
    if(Outer.WorldInfo.NetMode != NM_DedicatedServer)
    {
        MonsterArch = Outer.GetCharacterMonsterInfo();
        if(MonsterArch.ExtraVFX.Length > PieceIdx)
        {
            Outer.WorldInfo.MyEmitterPool.SpawnEmitter(MonsterArch.ExtraVFX[PieceIdx].VFX, SocketLocation, SocketRotation);
        }
    }
    I = 0;
    J0x201:

    if(I < ArmorZones[PieceIdx].BonesToHideOnExplode.Length)
    {
        Outer.BonesToHidePostAsyncWork.AddItem(ArmorZones[PieceIdx].BonesToHideOnExplode[I];
        ++ I;
        goto J0x201;
    }
    I = 0;
    J0x2A1:

    if(I < ArmorZones[PieceIdx].BonesToShowOnExplode.Length)
    {
        Outer.BonesToShowPostAsyncWork.AddItem(ArmorZones[PieceIdx].BonesToShowOnExplode[I];
        ++ I;
        goto J0x2A1;
    }
    if((Outer.BonesToHidePostAsyncWork.Length > 0) || Outer.BonesToShowPostAsyncWork.Length > 0)
    {
        Outer.SetTickGroup(2);
    }
}

simulated function UpdateArmorUI()
{
    local SCompressedArmorInfo CompressedArmorInfoList[3];
    local int I;
    local KFPlayerController KFPC;

    if(!Outer.IsABoss())
    {
        return;
    }
    KFPC = KFPlayerController(Outer.GetALocalPlayerController());
    if(KFPC == none)
    {
        return;
    }
    I = 0;
    J0x74:

    if(I < ArmorZones.Length)
    {
        CompressedArmorInfoList[I].Percentage = ByteToFloat(Outer.RepArmorPct[I]);
        CompressedArmorInfoList[I].IconTexture = default.ArmorZones[I].ZoneIcon;
        ++ I;
        goto J0x74;
    }
    if((KFPC.myGfxHUD != none) && KFPC.myGfxHUD.bossHealthBar != none)
    {
        KFPC.myGfxHUD.bossHealthBar.UpdateArmorUI(CompressedArmorInfoList);
    }
}

function SetShieldScale(float InScale)
{
    local int I;

    ArmorScale = InScale;
    I = 0;
    J0x1E:

    if(I < ArmorZones.Length)
    {
        ArmorZones[I].ArmorHealth *= InScale;
        ArmorZones[I].ArmorHealthMax = ArmorZones[I].ArmorHealth;
        Outer.RepArmorPct[I] = GetArmorZonePctByte(I);
        ++ I;
        goto J0x1E;
    }
}

function int GetArmorZoneIndex(name BoneName, Vector DamagerSource)
{
    local int HitZoneIdx, I;
    local bool bFrontDamage, bBackDamage;

    bFrontDamage = ((DamagerSource - Outer.Location) Dot vector(Outer.Rotation)) > float(0);
    bBackDamage = !bFrontDamage;
    HitZoneIdx = Outer.HitZones.Find('ZoneName', BoneName;
    if(HitZoneIdx >= 0)
    {
        I = 0;
        J0xCA:

        if(I < ArmorZones.Length)
        {
            if(ArmorZones[I].AffectedHitZones.Find(Outer.HitZones[HitZoneIdx].ZoneName != -1)
            {
                if((ArmorZones[I].bAffectedByFrontDamage && bFrontDamage) || ArmorZones[I].bAffectedByBackDamage && bBackDamage)
                {
                    return I;
                }
            }
            ++ I;
            goto J0xCA;
        }
    }
    return -1;
}

function TakeArmorZoneDamage(int ZoneIdx, int InDamage, out int outDamage)
{
    InDamage = Min(ArmorZones[ZoneIdx].ArmorHealth, InDamage);
    ArmorZones[ZoneIdx].ArmorHealth -= InDamage;
    outDamage = Max(0, outDamage - InDamage);
    Outer.RepArmorPct[ZoneIdx] = GetArmorZonePctByte(ZoneIdx);
    if(ArmorZones[ZoneIdx].ArmorHealth <= 0)
    {
        Outer.ZedExplodeArmor(ZoneIdx, ArmorZones[ZoneIdx].ArmorZoneName);
    }
    UpdateArmorUI();
}

function AdjustBoneDamage(out int InDamage, name BoneName, Vector DamagerSource, class<DamageType> DamageType)
{
    local int ArmorZoneIdx, ModDmgMax, ModDmgRem, ObliterateDamage;
    local float Modifier;

    Modifier = GetArmorDamageTypeModifier(DamageType);
    ModDmgMax = int(float(InDamage) * Modifier);
    ModDmgRem = ModDmgMax;
    ArmorZoneIdx = GetArmorZoneIndex(BoneName, DamagerSource);
    if((ArmorZoneIdx != -1) && ArmorZones[ArmorZoneIdx].ArmorHealth > 0)
    {
        if(ModDmgMax >= ArmorZones[ArmorZoneIdx].ObliterateDmgThreshold)
        {
            ObliterateDamage = ArmorZones[ArmorZoneIdx].ArmorHealth;
            TakeArmorZoneDamage(ArmorZoneIdx, ObliterateDamage, ObliterateDamage);            
        }
        else
        {
            TakeArmorZoneDamage(ArmorZoneIdx, ModDmgRem, ModDmgRem);
        }
    }
    InDamage = int(float(ModDmgRem) / Modifier);
}

function AdjustNonBoneDamage(out int InDamage, class<DamageType> DamageType)
{
    local int I, NumValidZones, ModDmgMax, ModDmgRem, PrevModDmgRem, ModDmgToDo;

    local float Modifier;

    Modifier = GetArmorDamageTypeModifier(DamageType);
    ModDmgMax = int(float(InDamage) * Modifier);
    ModDmgRem = ModDmgMax;
    J0x52:

    PrevModDmgRem = ModDmgRem;
    NumValidZones = 0;
    I = 0;
    J0x7B:

    if(I < ArmorZones.Length)
    {
        if(ArmorZones[I].ArmorHealth > 0)
        {
            ++ NumValidZones;
        }
        ++ I;
        goto J0x7B;
    }
    if(NumValidZones > 0)
    {
        ModDmgToDo = Max(1, ModDmgRem / NumValidZones);
        I = 0;
        J0x113:

        if((I < ArmorZones.Length) && ModDmgRem > 0)
        {
            if(ArmorZones[I].ArmorHealth > 0)
            {
                TakeArmorZoneDamage(I, ModDmgToDo, ModDmgRem);
            }
            ++ I;
            goto J0x113;
        }
    }
    if(!((ModDmgRem == 0) || PrevModDmgRem == ModDmgRem))
        goto J0x52;
    InDamage = int(float(ModDmgRem) / Modifier);
}

function float GetArmorDamageTypeModifier(class<DamageType> DT)
{
    local int I, DifficultyIdx;
    local float DamageModifier;

    I = ArmorDamageTypeModifiers.Length - 1;
    J0x17:

    if(I >= 0)
    {
        if(ClassIsChildOf(DT, ArmorDamageTypeModifiers[I].DamageType))
        {
            if((Outer.WorldInfo.Game != none) && ArmorDamageTypeModifiers[I].DamageScale.Length > 1)
            {
                DifficultyIdx = Min(Outer.WorldInfo.Game.GetModifiedGameDifficulty(), ArmorDamageTypeModifiers[I].DamageScale.Length);
                DamageModifier = ArmorDamageTypeModifiers[I].DamageScale[DifficultyIdx];                
            }
            else
            {
                DamageModifier = ArmorDamageTypeModifiers[I].DamageScale[0];
            }
            if(DamageModifier < 1)
            {
                DamageModifier = FMax(Lerp(1, DamageModifier, Outer.GameResistancePct), 0);
            }
            return DamageModifier;
        }
        -- I;
        goto J0x17;
    }
    return 1;
}

function ExplodeAllArmor()
{
    local int I, outDamage;

    I = 0;
    J0x0B:

    if(I < ArmorZones.Length)
    {
        TakeArmorZoneDamage(I, ArmorZones[I].ArmorHealth, outDamage);
        ++ I;
        goto J0x0B;
    }
}
