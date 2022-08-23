/*******************************************************************************
 * KFGFxHUD_PlayerMoveList generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxHUD_PlayerMoveList extends GFxObject within GFxMoviePlayer;

struct HUDMoveInfo
{
    var GFxObject GfxObj;
    var int AtkIndex;
    var float Cooldown;
    var int Charges;
    var int ButtonPriority;

    structdefaultproperties
    {
        GfxObj=none
        AtkIndex=0
        Cooldown=-1
        Charges=-1
        ButtonPriority=-1
    }
};

var protected array<HUDMoveInfo> CurrentMoves;
var protected GFxObject MoveListObjectArray;
var Texture2D ZedIconTexture;
var protected KFPawn_Monster MyKFPM;
var protected KFPlayerInput MyInput;
var array<string> PlayerMoveKeyBinds;
var array<string> GamepadMoveKeyBinds;
var array<name> GamepadKeyPriority;
var bool bUsingGamepadControls;

function InitializeHUD()
{
    MyKFPM = KFPawn_Monster(Outer.GetPC().Pawn);
    MyInput = KFPlayerInput(Outer.GetPC().PlayerInput);
    InitializeMoveList();
}

function ChangeOwner(KFPawn_Monster P)
{
    if((P != none) && P != MyKFPM)
    {
        MyKFPM = P;
        InitializeMoveList();
    }
}

function TickHud(float DeltaTime)
{
    if(MyKFPM == none)
    {
        return;
    }
    if((MyInput != none) && bUsingGamepadControls != MyInput.bUsingGamepad)
    {
        InitializeMoveList();        
    }
    else
    {
        UpdateMoveList();
    }
}

function InitializeMoveList()
{
    local int I, J;
    local GFxObject MoveObject;
    local array<SpecialMoveCooldownInfo> AttackArray;
    local KeyBind MyKeyBind;
    local int LookupIndex, ButtonPriority;
    local HUDMoveInfo SavedMoveInfo;
    local string BindName;

    if(MyKFPM == none)
    {
        return;
    }
    CurrentMoves.Remove(0, CurrentMoves.Length;
    AttackArray = MyKFPM.GetSpecialMoveCooldowns();
    MoveListObjectArray = Outer.CreateArray();
    I = 0;
    J0x84:

    if(I < AttackArray.Length)
    {
        if((AttackArray[I].SMHandle != 0) && AttackArray[I].bShowOnHud)
        {
            MoveObject = Outer.CreateObject("Object");
            if(AttackArray[I].SpecialMoveIcon != none)
            {
                MoveObject.SetString("image", "img://" $ PathName(AttackArray[I].SpecialMoveIcon));                
            }
            else
            {
                MoveObject.SetString("image", "img://" $ PathName(ZedIconTexture));
            }
            ButtonPriority = -1;
            bUsingGamepadControls = MyInput.bUsingGamepad;
            if(bUsingGamepadControls)
            {
                LookupIndex = MyKFPM.MoveListGamepadScheme.Find(AttackArray[I].SMHandle;
                if(LookupIndex != -1)
                {
                    MyInput.GetKeyBindFromCommand(MyKeyBind, GamepadMoveKeyBinds[LookupIndex], false);
                    MoveObject.SetString("buttonString", MyInput.GetBindDisplayName(MyKeyBind));
                    ButtonPriority = GamepadKeyPriority.Find(MyKeyBind.Name;
                }                
            }
            else
            {
                LookupIndex = AttackArray[I].SMHandle - 23;
                if((LookupIndex >= 0) && LookupIndex < PlayerMoveKeyBinds.Length)
                {
                    MyInput.GetKeyBindFromCommand(MyKeyBind, PlayerMoveKeyBinds[LookupIndex], false);
                    BindName = MyInput.GetBindDisplayName(MyKeyBind);
                    if(BindName ~= "None")
                    {
                        MyInput.GetKeyBindFromCommand(MyKeyBind, GetAlternateBindName(PlayerMoveKeyBinds[LookupIndex]), false);
                        BindName = MyInput.GetBindDisplayName(MyKeyBind);
                    }
                    MoveObject.SetString("buttonString", BindName);
                }
            }
            if(AttackArray[I].NameLocalizationKey != "")
            {
                MoveObject.SetString("moveName", Localize("ZedMoves", AttackArray[I].NameLocalizationKey, "KFGame"));
            }
            if(AttackArray[I].Charges == -1)
            {
                MoveObject.SetString("count", "");
            }
            SavedMoveInfo.GfxObj = MoveObject;
            SavedMoveInfo.AtkIndex = I;
            SavedMoveInfo.ButtonPriority = ButtonPriority;
            J = 0;
            J0x674:

            if(J < CurrentMoves.Length)
            {
                if(ButtonPriority < CurrentMoves[J].ButtonPriority)
                {
                    CurrentMoves.InsertItem(J, SavedMoveInfo;
                    goto J0x6F0;
                }
                ++ J;
                goto J0x674;
            }
            J0x6F0:

            if(J == CurrentMoves.Length)
            {
                CurrentMoves.AddItem(SavedMoveInfo;
            }
        }
        ++ I;
        goto J0x84;
    }
    BuildObjectArray();
}

function string GetAlternateBindName(string OriginalName)
{
    if(OriginalName ~= "GBA_IronsightsToggle")
    {
        return "GBA_IronsightsHold";        
    }
    else
    {
        if(OriginalName ~= "GBA_SwitchFireMode")
        {
            return "GBA_AltFire";            
        }
        else
        {
            if(OriginalName ~= "GBA_QuickHeal")
            {
                return "GBA_Reload_GamePad";
            }
        }
    }
    return OriginalName;
}

function UpdateMoveList()
{
    local int I, Charges;
    local float Cooldown;
    local SpecialMoveCooldownInfo AttackInfo;
    local bool bUpdated;

    I = 0;
    J0x0B:

    if(I < CurrentMoves.Length)
    {
        AttackInfo = MyKFPM.SpecialMoveCooldowns[CurrentMoves[I].AtkIndex];
        Cooldown = MyKFPM.GetSpecialMoveCooldownPercent(AttackInfo);
        if(Cooldown != CurrentMoves[I].Cooldown)
        {
            CurrentMoves[I].GfxObj.SetFloat("progressPercent", Cooldown);
            CurrentMoves[I].Cooldown = Cooldown;
            bUpdated = true;
        }
        Charges = AttackInfo.Charges;
        if((Charges != -1) && Charges != CurrentMoves[I].Charges)
        {
            CurrentMoves[I].GfxObj.SetString("count", string(Charges));
            CurrentMoves[I].Charges = Charges;
            bUpdated = true;
        }
        ++ I;
        goto J0x0B;
    }
    if(bUpdated)
    {
        SetObject("Data", MoveListObjectArray);
    }
}

function BuildObjectArray()
{
    local int I;

    I = 0;
    J0x0B:

    if(I < CurrentMoves.Length)
    {
        MoveListObjectArray.SetElementObject(I, CurrentMoves[I].GfxObj);
        ++ I;
        goto J0x0B;
    }
    SetObject("Data", MoveListObjectArray);
}

function ClearMoveList()
{
    local int I;

    MyKFPM = none;
    CurrentMoves.Remove(0, CurrentMoves.Length;
    I = 0;
    J0x2C:

    if(I < 6)
    {
        MoveListObjectArray.SetElementObject(I, none);
        ++ I;
        goto J0x2C;
    }
    SetObject("Data", MoveListObjectArray);
}

defaultproperties
{
    PlayerMoveKeyBinds(0)="GBA_Fire"
    PlayerMoveKeyBinds(1)="GBA_IronsightsToggle"
    PlayerMoveKeyBinds(2)="GBA_TertiaryFire"
    PlayerMoveKeyBinds(3)="GBA_SwitchFireMode"
    PlayerMoveKeyBinds(4)="GBA_QuickHeal"
    PlayerMoveKeyBinds(5)="GBA_Grenade"
    GamepadMoveKeyBinds(0)="GBA_Fire"
    GamepadMoveKeyBinds(1)="GBA_AltFire_Gamepad"
    GamepadMoveKeyBinds(2)="GBA_Reload_Gamepad"
    GamepadMoveKeyBinds(3)="GBA_TertiaryFire"
    GamepadMoveKeyBinds(4)="GBA_Grenade"
    GamepadMoveKeyBinds(5)="GBA_IronsightsHold"
    GamepadMoveKeyBinds(6)="GBA_WeaponSelect_Gamepad"
    GamepadKeyPriority(0)=XboxTypeS_A
    GamepadKeyPriority(1)=XboxTypeS_X
    GamepadKeyPriority(2)=XboxTypeS_Y
    GamepadKeyPriority(3)=XboxTypeS_B
    GamepadKeyPriority(4)=XboxTypeS_LeftTrigger
    GamepadKeyPriority(5)=XboxTypeS_RightTrigger
    GamepadKeyPriority(6)=XboxTypeS_LeftShoulder
    GamepadKeyPriority(7)=XboxTypeS_RightShoulder
    GamepadKeyPriority(8)=XboxTypeS_RightThumbStick
}