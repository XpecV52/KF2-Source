/*******************************************************************************
 * KFGFxHUD_WeaponSelectWidget generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxHUD_WeaponSelectWidget extends GFxObject within GFxMoviePlayer;

const MAX_WEAPON_GROUPS = 4;
const KEYBOARD_STATE = "keyboard";
const CONTROLLER_STATE = "controller";

var string CurrentState;
var bool bChangingWeapons;
var const localized string PrimaryString;
var const localized string EquiptmentString;
var const localized string MeleeString;
var const localized string SecondaryString;

function InitializeObject()
{
    SetWeaponCategories();
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
    I = 0;
    J0x35:

    if(I < WeaponList.Length)
    {
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("weaponName", WeaponList[I].ItemName);
        TempObj.SetString("texturePath", (("img://" $ string(WeaponList[I].UITexture.GetPackageName())) $ ".") $ string(WeaponList[I].UITexture.Name));
        TempObj.SetInt("ammoCount", WeaponList[I].AmmoCount[0]);
        TempObj.SetInt("spareAmmoCount", WeaponList[I].SpareAmmoCount[0]);
        bUsesAmmo = WeaponList[I].UsesAmmo();
        TempObj.SetBool("bUsesAmmo", bUsesAmmo);
        DataProvider.SetElementObject(I, TempObj);
        ++ I;
        goto J0x35;
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

function UpdateIndex()
{
    ActionScriptVoid("updateIndex");
    bChangingWeapons = false;
}

function SetState(string StrState)
{
    if(CurrentState != StrState)
    {
        CurrentState = StrState;
        ActionScriptVoid("setState");
    }
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
    local bool bIsUsingGamepad;

    bIsUsingGamepad = Class'KFPlayerInput'.static.GetUsingGamepad(Outer.GetPC());
    if(bIsUsingGamepad)
    {
        SetState("controller");        
    }
    else
    {
        SetState("keyboard");
    }
    ActionScriptVoid("setSelectedIndex");
}

function ShowOnlyHUDGroup(byte GroupIndex)
{
    ActionScriptVoid("showOnlyHUDGroup");
}

function ShowAllHUDGroups()
{
    ActionScriptVoid("showAllHUDGroups");
}

function SetWeaponSwitchStayOpen(bool bStayOpen)
{
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
}