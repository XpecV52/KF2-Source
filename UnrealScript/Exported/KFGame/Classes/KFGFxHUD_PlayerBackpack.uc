//=============================================================================
// KFGFxInGameHUD_PlayerBackpack
//=============================================================================
// HUD container that stores information about the player's Weapon & Equipment, dosh, etc.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Alex Quick 5/15/2014
//=============================================================================

class KFGFxHUD_PlayerBackpack extends GFxObject;

/** Cached KFPlayerController */
var KFPlayerController 				MyKFPC;
// Player's dosh amount as of the last tick
var int								LastDosh;
// Number of bullets in the  current magazine
var int 							LastSpareAmmo;
var int                             LastMagazineAmmo;
var bool                            bUsesAmmo;
//
var int                             LastFlashlightBattery;
//
var int                             LastGrenades;
// Amount of secondary ammo
var int                             LastSecondaryAmmo;
var bool                            bWasUsingAltFireMode;
var bool                            bUsesSecondaryAmmo;

var class<KFPerk> LastPerkClass;
var KFWeapon LastWeapon;

function InitializeHUD()
{
	MyKFPC = KFPlayerController(GetPC());
}

function TickHud(float DeltaTime)
{
        UpdateDosh();
        UpdateGrenades();
        UpdateWeapon();
        UpdateFlashlight();   
}

function UpdateDosh()
{
    local int CurrentDosh;
    local int DeltaDosh;

    if (MyKFPC.PlayerReplicationInfo != none)
    {
        CurrentDosh = MyKFPC.PlayerReplicationInfo.Score;

        // Update the dosh
        if (CurrentDosh != LastDosh )
        {
            DeltaDosh = CurrentDosh - LastDosh;
            SetInt("backpackDosh" ,DeltaDosh);
            LastDosh = CurrentDosh;
        }
    }
}

function UpdateGrenades()
{
    local KFInventoryManager MyKFInvManager;
    local int CurrentGrenades;

	if(MyKFPC == None)
	{
		return;
	}
    if(MyKFPC.Pawn != none)
    {
        MyKFInvManager = KFInventoryManager(MyKFPC.Pawn.InvManager);
        if(MyKFInvManager != none)
        {
            CurrentGrenades = MyKFInvManager.GrenadeCount;
        }
    }
    //Update the icon the for grenade type.
    if(MyKFPC.GetPerk() != none)
    {
        if(  LastPerkClass != MyKFPC.GetPerk().Class )
        {
            SetString("backpackGrenadeType", "img://"$MyKFPC.CurrentPerk.GrenadeClass.default.UITexture.GetPackageName()$"."$MyKFPC.CurrentPerk.GrenadeClass.default.UITexture.Name);
            LastPerkClass = MyKFPC.CurrentPerk.Class;
        }  
    }
    // Update the grenades count value
    if(CurrentGrenades != LastGrenades)
	{
        SetInt("backpackGrenades" , CurrentGrenades);
        LastGrenades = CurrentGrenades;
	}
}

function UpdateWeapon()
{
	local int CurrentSpareAmmo;
	local int CurrentMagazineAmmo;
    local int CurrentSecondaryAmmo;
    local KFWeapon CurrentWeapon;

    if(MyKFPC != none && MyKFPC.Pawn != none)
    {
        CurrentWeapon = KFWeapon(MyKFPC.Pawn.Weapon);
        if(CurrentWeapon != none)
        {
            // If we changed weapons
            if( LastWeapon == none || LastWeapon != CurrentWeapon )
            {
                LastWeapon = CurrentWeapon;
                RefreshWeapon(CurrentWeapon);
            }
            else if( bWasUsingAltFireMode != CurrentWeapon.bUseAltFireMode )
            {
                UpdateFireModeIcon(CurrentWeapon);
            }

            if (bUsesAmmo)
            {
                // Update the ammo in the weapon's magazine
                CurrentMagazineAmmo = CurrentWeapon.AmmoCount[0];

                if ( CurrentMagazineAmmo != LastMagazineAmmo )
            	{
                    SetInt("weaponMagazineAmmo" , CurrentMagazineAmmo);
                    LastMagazineAmmo  = CurrentMagazineAmmo;
            	}

                // Update the spare ammo (whatever is not in the magazine)
                CurrentSpareAmmo = CurrentWeapon.GetSpareAmmoForHUD();
                if ( CurrentSpareAmmo != LastSpareAmmo )
            	{
                    SetInt("backpackStoredAmmo" , CurrentSpareAmmo);
                    LastSpareAmmo  = CurrentSpareAmmo;
            	}
            }

            if (bUsesSecondaryAmmo)
            {
                CurrentSecondaryAmmo = CurrentWeapon.AmmoCount[1];
                if (CurrentSecondaryAmmo != LastSecondaryAmmo)
                {
                    SetInt("secondaryAmmo" , CurrentSecondaryAmmo);
                    LastSecondaryAmmo = CurrentSecondaryAmmo;
                }
            }
        }
    }
}

function UpdateFireModeIcon( KFWeapon CurrentWeapon )
{
    local byte NewFireModeIndex;

    NewFireModeIndex = CurrentWeapon.bUseAltFireMode ? CurrentWeapon.ALTFIRE_FIREMODE : CurrentWeapon.DEFAULT_FIREMODE;
     // Update Fire Mode Icons
    if( Len(CurrentWeapon.FireModeIconPaths[NewFireModeIndex]) > 0)
    {
        SetString("firemodeIcon", "img://"$CurrentWeapon.FireModeIconPaths[NewFireModeIndex].GetPackageName()$"."$CurrentWeapon.FireModeIconPaths[NewFireModeIndex]);
    }
    bWasUsingAltFireMode = CurrentWeapon.bUseAltFireMode;
}

function RefreshWeapon(KFWeapon CurrentWeapon)
{
    bUsesAmmo = CurrentWeapon.UsesAmmo();
    SetBool("bUsesAmmo", bUsesAmmo);

    bUsesSecondaryAmmo = CurrentWeapon.UsesSecondaryAmmo();
    SetBool("bUsesSecondaryAmmo", bUsesSecondaryAmmo);
    if( bUsesSecondaryAmmo )
    {
        SetString("secondaryIcon", "img://"$CurrentWeapon.SecondaryAmmoTexture.GetPackageName()$"."$CurrentWeapon.SecondaryAmmoTexture);
    }
    UpdateFireModeIcon(CurrentWeapon);
}

function UpdateFlashlight()
{
	local KFPawn_Human MyKFP;
    local int CurrentFlashlightBattery;
    if(MyKFPC != none &&  MyKFPC.Pawn != none)
    {
        MyKFP = KFPawn_Human(MyKFPC.Pawn);
        if ( MyKFP != none )
        {
            CurrentFlashlightBattery = MyKFP.BatteryCharge;
            if ( CurrentFlashlightBattery != LastFlashlightBattery )
            {
                SetFlashlightBattery(CurrentFlashlightBattery, MyKFP.bFlashlightOn);
                LastFlashlightBattery = CurrentFlashlightBattery;
            }
        }
    }
}

function SetFlashlightBattery( int BatteryCharge, bool bIsOn )
{
    ActionscriptVoid( "setFlashlightBattery" );
}

defaultproperties
{
   Name="Default__KFGFxHUD_PlayerBackpack"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
