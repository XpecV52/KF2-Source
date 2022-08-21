/*******************************************************************************
 * KFGFxHUD_PlayerMoveList generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxHUD_PlayerMoveList extends GFxObject within GFxMoviePlayer;

var KFPawn_Monster MyKFPM;
var Texture2D ZedIConTexture;
var private KFPlayerInput KFInput;

function InitializeHUD()
{
    MyKFPM = KFPawn_Monster(Outer.GetPC().Pawn);
    KFInput = KFPlayerInput(Outer.GetPC().PlayerInput);
    LocalizeText();
}

function LocalizeText();

function TickHud(float DeltaTime)
{
    if(MyKFPM != none)
    {
        UpdateMoveList();
    }
}

function ClearMovieList()
{
    local GFxObject ObjectArray;
    local int I;

    ObjectArray = Outer.CreateArray();
    I = 0;
    J0x34:

    if(I < 6)
    {
        ObjectArray.SetElementObject(I, none);
        ++ I;
        goto J0x34;
    }
    SetObject("Data", ObjectArray);
}

function UpdateMoveList()
{
    local int I, MoveCount;
    local GFxObject MoveObject, ObjectArray;
    local array<SpecialMoveCooldownInfo> AttackArray;
    local KeyBind MyKeyBind;
    local PlayerController PC;

    PC = Outer.GetPC();
    if((PC == none) || KFInput == none)
    {
        return;
    }
    AttackArray = MyKFPM.GetSpecialMoveCooldowns();
    if(AttackArray.Length == 0)
    {
        return;
    }
    MoveCount = 0;
    ObjectArray = Outer.CreateArray();
    I = 0;
    J0xC5:

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
                MoveObject.SetString("image", "img://" $ PathName(ZedIConTexture));
            }
            MoveObject.SetFloat("progressPercent", MyKFPM.GetSpecialMoveCooldownPercent(AttackArray[I]));
            KFInput.GetKeyBindFromCommand(MyKeyBind, AttackArray[I].GBA_Name, false);
            if(AttackArray[I].GBA_Name != "")
            {
                MoveObject.SetString("buttonString", KFInput.GetBindDisplayName(MyKeyBind));
            }
            if(AttackArray[I].Charges != -1)
            {
                MoveObject.SetString("count", string(AttackArray[I].Charges));
            }
            if(AttackArray[I].NameLocalizationKey != "")
            {
                MoveObject.SetString("moveName", Localize("ZedMoves", AttackArray[I].NameLocalizationKey, "KFGame"));
            }
            ObjectArray.SetElementObject(MoveCount, MoveObject);
            ++ MoveCount;
        }
        ++ I;
        goto J0xC5;
    }
    SetObject("Data", ObjectArray);
}
