/*******************************************************************************
 * KFGFxHUD_WeaponSelectWidget generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxHUD_WeaponSelectWidget extends GFxObject within GFxMoviePlayer;

const MAX_WEAPON_GROUPS = 4;

var bool bChangingWeapons;
var const localized string PrimaryString;
var const localized string EquiptmentString;
var const localized string MeleeString;
var const localized string SecondaryString;
var const localized string ThrowString;
var string ThrowGBA;
var byte LastRefreshInvCount;

function InitializeObject()
{
    SetWeaponCategories();
    SetString("throwString", ThrowString);
    SetThowButton();
}

simulated function RefreshWeaponSelect()
{
    local byte I;

    I = 0;
    J0x0C:

    if(I < 4)
    {
        UpdateWeaponGroupOnHUD(I);
        ++ I;
        goto J0x0C;
    }
    SetThowButton();
}

function SetThowButton()
{
    local KFPlayerInput KFPI;
    local KeyBind BoundKey;

    KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
    if(KFPI != none)
    {
        KFPI.GetKeyBindFromCommand(BoundKey, ThrowGBA, false);
        SetString("throwButton", string(BoundKey.Name));
    }
}

simulated function UpdateWeaponGroupOnHUD(byte GroupIndex)
{
    local Inventory Inv;
    local KFWeapon KFW;
    local array<KFWeapon> WeaponGroup;

    if((Outer.GetPC().Pawn == none) || Outer.GetPC().Pawn.InvManager == none)
    {
        return;
    }
    Inv = Outer.GetPC().Pawn.InvManager.InventoryChain;
    J0xF5:

    if(Inv != none)
    {
        KFW = KFWeapon(Inv);
        if((KFW != none) && KFW.InventoryGroup == GroupIndex)
        {
            WeaponGroup.AddItem(KFW;
        }
        Inv = Inv.Inventory;
        goto J0xF5;
    }
    SetWeaponGroupList(WeaponGroup, GroupIndex);
}

simulated function SetWeaponGroupList(out array<KFWeapon> WeaponList, byte GroupIndex)
{
    local byte I;
    local GFxObject DataProvider, TempObj;
    local bool bUsesAmmo;

    DataProvider = Outer.CreateArray();
    if(DataProvider == none)
    {
        return;
    }
    I = 0;
    J0x46:

    if(I < WeaponList.Length)
    {
        TempObj = Outer.CreateObject("Object");
        if(WeaponList[I].CurrentWeaponUpgradeIndex > 0)
        {
            TempObj.SetString("weaponName", WeaponList[I].ItemName);            
        }
        else
        {
            TempObj.SetString("weaponName", WeaponList[I].ItemName);
        }
        TempObj.SetInt("weaponTier", WeaponList[I].CurrentWeaponUpgradeIndex);
        TempObj.SetString("texturePath", "img://" $ PathName(WeaponList[I].WeaponSelectTexture));
        TempObj.SetInt("ammoCount", WeaponList[I].AmmoCount[0]);
        TempObj.SetInt("spareAmmoCount", WeaponList[I].SpareAmmoCount[0]);
        TempObj.SetBool("bUsesSecondaryAmmo", WeaponList[I].UsesSecondaryAmmo() && WeaponList[I].bCanRefillSecondaryAmmo);
        TempObj.SetBool("bEnabled", WeaponList[I].HasAnyAmmo());
        if(WeaponList[I].UsesSecondaryAmmo() && WeaponList[I].bCanRefillSecondaryAmmo)
        {
            TempObj.SetBool("bCanRefillSecondaryAmmo", WeaponList[I].SpareAmmoCapacity[1] > 0);
            TempObj.SetInt("secondaryAmmoCount", WeaponList[I].AmmoCount[1]);
            TempObj.SetInt("secondarySpareAmmoCount", WeaponList[I].SpareAmmoCount[1]);
        }
        TempObj.SetBool("throwable", WeaponList[I].CanThrow());
        bUsesAmmo = WeaponList[I].UsesAmmo();
        TempObj.SetBool("bUsesAmmo", bUsesAmmo);
        DataProvider.SetElementObject(I, TempObj);
        ++ I;
        goto J0x46;
    }
    SetWeaponList(DataProvider, GroupIndex);
}

simulated function SetWeaponList(GFxObject WeaponList, int GroupIndex)
{
    ActionScriptVoid("setWeaponList");
}

function SetSelectedWeapon(int GroupIndex, int SelectedIndex)
{
    if(!KFPlayerInput(Outer.GetPC().PlayerInput).bQuickWeaponSelect && !bChangingWeapons)
    {
        bChangingWeapons = true;
    }
    SendWeaponIndex(GroupIndex, SelectedIndex);
}

function Weapon GetSelectedWeapon()
{
    return Outer.GetPC().Pawn.InvManager.PendingWeapon;
}

function UpdateIndex()
{
    ActionScriptVoid("updateIndex");
    bChangingWeapons = false;
}

function Hide()
{
    SetWeaponSwitchStayOpen(false);
    FadeOut();
}

function SetWeaponCategories()
{
    local GFxObject CategoriesObj;

    CategoriesObj = Outer.CreateObject("Object");
    CategoriesObj.SetString("Primary", PrimaryString);
    CategoriesObj.SetString("Backup", SecondaryString);
    CategoriesObj.SetString("Melee", MeleeString);
    CategoriesObj.SetString("Equipment", EquiptmentString);
    SetObject("weaponCategories", CategoriesObj);
}

function SendWeaponIndex(int GroupIndex, int SelectedIndex)
{
    ActionScriptVoid("setSelectedIndex");
}

function ShowOnlyHUDGroup(byte GroupIndex)
{
    UpdateWeaponGroupOnHUD(GroupIndex);
    ActionScriptVoid("showOnlyHUDGroup");
}

function ShowAllHUDGroups()
{
    ActionScriptVoid("showAllHUDGroups");
}

function RefreshTimer()
{
    local Inventory Inv;
    local int InvCount;
    local KFInventoryManager KFIM;

    Inv = Outer.GetPC().Pawn.InvManager.InventoryChain;
    J0x68:

    if(Inv != none)
    {
        ++ InvCount;
        Inv = Inv.Inventory;
        goto J0x68;
    }
    if(InvCount != LastRefreshInvCount)
    {
        RefreshWeaponSelect();
        if(Outer.GetPC().Pawn.InvManager != none)
        {
            KFIM = KFInventoryManager(Outer.GetPC().Pawn.InvManager);
            if(KFIM != none)
            {
                KFIM.UpdateHUD();
            }
        }
    }
    LastRefreshInvCount = byte(InvCount);
}

function SetWeaponSwitchStayOpen(bool bStayOpen)
{
    local Inventory Inv;

    if(bStayOpen)
    {
        LastRefreshInvCount = 0;
        Inv = Outer.GetPC().Pawn.InvManager.InventoryChain;
        J0x81:

        if(Inv != none)
        {
            ++ LastRefreshInvCount;
            Inv = Inv.Inventory;
            goto J0x81;
        }
        Outer.GetPC().SetTimer(0.33, true, 'RefreshTimer', self);        
    }
    else
    {
        Outer.GetPC().ClearTimer('RefreshTimer', self);
    }
    SetBool("bStayOpen", bStayOpen);
}

function FadeOut()
{
    bChangingWeapons = false;
}

defaultproperties
{
    PrimaryString="PRIMARY"
    EquiptmentString="EQUIPMENT"
    MeleeString="MELEE"
    SecondaryString="SECONDARY"
    ThrowString="THROW WEAPON"
    ThrowGBA="GBA_AltFire_Gamepad"
}