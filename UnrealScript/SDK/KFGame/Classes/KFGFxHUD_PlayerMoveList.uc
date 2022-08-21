class KFGFxHUD_PlayerMoveList extends GFxObject;

var KFPawn_Monster MyKFPM;
var Texture2D ZedIConTexture;

var private KFPlayerInput KFInput;

function InitializeHUD()
{
	MyKFPM = KFPawn_Monster(GetPC().Pawn);    
    KFInput = KFPlayerInput(GetPC().PlayerInput);

    LocalizeText();
}

function LocalizeText()
{
	//nothing to localize
}

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
	local int i; 

	ObjectArray=CreateArray();

	for (i = 0; i < 6; i++)
	{
		ObjectArray.SetElementObject(i, None);	
	}
	
	SetObject("Data", ObjectArray);
}

function UpdateMoveList()
{
	local int i, MoveCount;
	local GFxObject MoveObject,ObjectArray;
	local Array<SpecialMoveCooldownInfo> AttackArray;
	local KeyBind MyKeyBind;
	local PlayerController PC;

	PC = GetPC();

	if (PC == None || KFInput == none)
	{
		return;
	}

	AttackArray = MyKFPM.GetSpecialMoveCooldowns();

	if(AttackArray.length == 0)
	{
		return;
	}
	
	MoveCount=0;

	ObjectArray=CreateArray();

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
				MoveObject.SetString("image", "img://"$PathName(ZedIConTexture));
			}
			
			//set percent
			MoveObject.SetFloat("progressPercent", MyKFPM.GetSpecialMoveCooldownPercent(AttackArray[i]));
			//set key
			KFInput.GetKeyBindFromCommand(MyKeyBind, AttackArray[i].GBA_Name, false);

			if(AttackArray[i].GBA_Name != "")
			{
				MoveObject.SetString("buttonString", KFInput.GetBindDisplayName(MyKeyBind) );
			}
							
			if(AttackArray[i].Charges != -1)
			{
				MoveObject.SetString("count", string(AttackArray[i].Charges) );
			}

			if(AttackArray[i].NameLocalizationKey != "")
			{
				MoveObject.SetString("moveName", Localize("ZedMoves", AttackArray[i].NameLocalizationKey, "KFGame"));		
			}
		
			ObjectArray.SetElementObject(MoveCount, MoveObject);

			MoveCount++;
		}
	}
	
	SetObject("Data", ObjectArray);
}

DefaultProperties
{
	//defaults
	
}