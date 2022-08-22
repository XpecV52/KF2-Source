class KFGFxHUD_PlayerMoveList extends GFxObject;

/** cached info for tick/update */
struct HUDMoveInfo
{
	var GFxObject GfxObj;

	var int 	AtkIndex;
	var float 	Cooldown;
	var int 	Charges;
	var int 	ButtonPriority;

	StructDefaultProperties
	{
		Cooldown=-1
		Charges=-1
		ButtonPriority=-1
	}
};

/** cached GfxObjects for perf */
var protected array<HUDMoveInfo> CurrentMoves;
/** Cached object array */
var protected GFxObject MoveListObjectArray;

var Texture2D ZedIconTexture;

var protected KFPawn_Monster MyKFPM;
var protected KFPlayerInput MyInput;

/*********************************************************************************************
 * @name	Controls
 ********************************************************************************************* */

/** information to look up Game Bind Actions by move */
var array<string> PlayerMoveKeyBinds;
/** Gamepad scheme (aligned to EPlayerZedGamepadMove) */
var array<string> GamepadMoveKeyBinds;

/** Listed of key names in order they should appear on HUD */
var array<name> GamepadKeyPriority;

/** Whether we're currently displaying gamepad controls */
var bool bUsingGamepadControls;

function InitializeHUD()
{
	MyKFPM = KFPawn_Monster(GetPC().Pawn);    
    MyInput = KFPlayerInput(GetPC().PlayerInput);

   // MoveListObjectArray = CreateArray();
    InitializeMoveList();
}

function ChangeOwner(KFPawn_Monster P)
{
	if ( P != None && P != MyKFPM )
	{
		MyKFPM = P;
		InitializeMoveList();
	}
}

function TickHud(float DeltaTime)
{
	if ( MyKFPM == none )
	{
		return;
	}

	// If user changed input devices re-initialize
	if ( MyInput != None && bUsingGamepadControls != MyInput.bUsingGamepad )
	{
		InitializeMoveList();
	}
	// otherwise, do a normal/fast update
	else
	{
		
		UpdateMoveList();
	}
}

/** Called once when a new pawn is possessed */
function InitializeMoveList()
{
	local int i, j;
	local GFxObject MoveObject;
	local Array<SpecialMoveCooldownInfo> AttackArray;
	local KeyBind MyKeyBind;
	local int LookupIndex;
	local int ButtonPriority;
	local HUDMoveInfo SavedMoveInfo;

	CurrentMoves.Remove(0, CurrentMoves.Length);
	AttackArray = MyKFPM.GetSpecialMoveCooldowns();
	
	//@TODO Find a better way to empty out the MoveListObjectArray (the method call here insures there are no phantom slots)
	MoveListObjectArray = CreateArray();
	
	for (i = 0; i < AttackArray.length; i++)
	{
		if( AttackArray[i].SMHandle != SM_None && AttackArray[i].bShowOnHud )
		{
			MoveObject = CreateObject("Object");

			//set icon
			if(AttackArray[i].SpecialMoveIcon != none)
			{
				MoveObject.SetString("image", "img://"$PathName(AttackArray[i].SpecialMoveIcon));
			}
			else
			{
				MoveObject.SetString("image", "img://"$PathName(ZedIconTexture));
			}
			
			//set key
			ButtonPriority = -1;
			bUsingGamepadControls = MyInput.bUsingGamepad;
			if ( bUsingGamepadControls )
			{
				// Find special move
				LookupIndex = MyKFPM.MoveListGamepadScheme.Find(AttackArray[i].SMHandle);
				if ( LookupIndex != INDEX_NONE )
				{
					MyInput.GetKeyBindFromCommand(MyKeyBind, GamepadMoveKeyBinds[LookupIndex], false);
					MoveObject.SetString("buttonString", MyInput.GetBindDisplayName(MyKeyBind) );
					ButtonPriority = GamepadKeyPriority.Find(MyKeyBind.Name);
				}
			}
			else
			{
				LookupIndex = AttackArray[i].SMHandle - SM_PlayerZedMove_LMB;
				if(LookupIndex >= 0 && LookupIndex < PlayerMoveKeyBinds.Length)
				{
					MyInput.GetKeyBindFromCommand(MyKeyBind, PlayerMoveKeyBinds[LookupIndex], false);
					MoveObject.SetString("buttonString", MyInput.GetBindDisplayName(MyKeyBind) );
				}
			}
							
			if(AttackArray[i].NameLocalizationKey != "")
			{
				MoveObject.SetString("moveName", Localize("ZedMoves", AttackArray[i].NameLocalizationKey, "KFGame"));		
			}

			// clear charges in case index changed (e.g. controller/keyboard sort)
			if ( AttackArray[i].Charges == -1 )
			{
				MoveObject.SetString("count", "" );
			}

			// cache for UpdateMoveList
			SavedMoveInfo.GfxObj = MoveObject;
			SavedMoveInfo.AtkIndex = i;
			SavedMoveInfo.ButtonPriority = ButtonPriority;

			// insert into sorted list
			for (j = 0; j < CurrentMoves.length; j++)
			{
				if ( ButtonPriority < CurrentMoves[j].ButtonPriority )
				{
					CurrentMoves.InsertItem(j, SavedMoveInfo);
					break;
				}
			}

			// otherwise add to end
			if ( j == CurrentMoves.Length )
			{
				CurrentMoves.AddItem(SavedMoveInfo);
			}
		}
	}

	// finally (after sorting) assign the ObjectArray
	BuildObjectArray();
}

/** Called each tick to update modified values */
function UpdateMoveList()
{
	local int i;
	local int Charges;
	local float Cooldown;
	local SpecialMoveCooldownInfo AttackInfo;
	local bool bUpdated;

	for (i = 0; i < CurrentMoves.length; i++)
	{
		AttackInfo = MyKFPM.SpecialMoveCooldowns[CurrentMoves[i].AtkIndex];

		Cooldown = MyKFPM.GetSpecialMoveCooldownPercent(AttackInfo);
		if ( Cooldown != CurrentMoves[i].Cooldown )
		{
			CurrentMoves[i].GfxObj.SetFloat("progressPercent", Cooldown);
			CurrentMoves[i].Cooldown = Cooldown;
			bUpdated = true;
		}

		Charges = AttackInfo.Charges;
		if( Charges != -1 && Charges != CurrentMoves[i].Charges )
		{
			CurrentMoves[i].GfxObj.SetString("count", string(Charges) );
			CurrentMoves[i].Charges = Charges;
			bUpdated = true;
		}
	}

	if ( bUpdated )
	{
		SetObject("Data", MoveListObjectArray);
	}
}

/** Rebuild the ObjectArray */
function BuildObjectArray()
{
	local int i;

	for (i = 0; i < CurrentMoves.length; i++)
	{
		MoveListObjectArray.SetElementObject(i, CurrentMoves[i].GfxObj);
	}

	SetObject("Data", MoveListObjectArray);
}

function ClearMoveList()
{
	local int i; 

	MyKFPM = None;
	CurrentMoves.Remove(0, CurrentMoves.Length);

	for (i = 0; i < 6; i++)
	{
		MoveListObjectArray.SetElementObject(i, None);	
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
   GamepadKeyPriority(0)="XboxTypeS_A"
   GamepadKeyPriority(1)="XboxTypeS_X"
   GamepadKeyPriority(2)="XboxTypeS_Y"
   GamepadKeyPriority(3)="XboxTypeS_B"
   GamepadKeyPriority(4)="XboxTypeS_LeftTrigger"
   GamepadKeyPriority(5)="XboxTypeS_RightTrigger"
   GamepadKeyPriority(6)="XboxTypeS_LeftShoulder"
   GamepadKeyPriority(7)="XboxTypeS_RightShoulder"
   GamepadKeyPriority(8)="XboxTypeS_RightThumbStick"
   Name="Default__KFGFxHUD_PlayerMoveList"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
