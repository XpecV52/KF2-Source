class KFGFxHUD_ObjectiveConatiner extends GFxObject;

var float UpdateRate;
var KFInterface_MapObjective CurrentObjectiveInterface;

function InitializeHUD()
{
	SetVisible(false);
	LocalizeContainer();
}

function LocalizeContainer()
{
	local GFxObject TextObject;

	TextObject = CreateObject("Object");

	TextObject.SetString("failedString", Localize("Objectives", "FailedString", "KFGame"));

	SetObject("localizedText", TextObject);
}

function SetActive(bool bActive)
{
	SetVisible(bActive);
	if (bActive)
	{
		CurrentObjectiveInterface = KFGameReplicationInfo(GetPC().WorldInfo.GRI).ObjectiveInterface;
		if (CurrentObjectiveInterface != none)
		{	
			SetFailState(CurrentObjectiveInterface.GetProgress() <= 0);
			SetCurrentProgress(CurrentObjectiveInterface.GetProgress());
			SetCurrentIcon(PathName(CurrentObjectiveInterface.GetIcon()));
		}
	}
	else
	{
		CurrentObjectiveInterface = none;
	}
	//SetBool("isActive", bActive); //nothing supporting this atm
}

function SetCurrentIcon(string iconPath)
{
	if(iconPath == "")
	{
		SetString("currentIcon", "");	
	}
	else
	{
		SetString("currentIcon", "img://"$iconPath);
	}
}

function TickHud(float DeltaTime)
{
	if (CurrentObjectiveInterface != none)
	{
		SetCurrentProgress(CurrentObjectiveInterface.GetProgress());
		SetInt("rewardValue", CurrentObjectiveInterface.GetDoshReward());
		//UpdateRequirements();
	}
}

function UpdateRequirements()
{
	/*local GFxObject DataObject;
	if (CurrentObjectiveInterface != none && CurrentObjectiveInterface.UsesProgress())
	{
		DataObject = CreateObject("Object");
		
	}*/
}

function SetFailState(bool bFailed)
{
	local GFxObject DataObject;

	DataObject = CreateObject("Object");

	DataObject.SetBool("bFailed", bFailed);
	DataObject.SetString("failedString", bFailed ? Localize("Objectives", "FailedString", "KFGame") : "");
	SetObject("failed", DataObject);
	if(bFailed)
	{
		//GetPC().SetTimer(10.0f, false, nameof(ClearObjectiveUI), self); //leave this out for now
	}
}

function ClearObjectiveUI()
{
	SetActive(false);
}

//pass a value from 0-1
function SetCurrentProgress(float CurrentProgress)
{
	CurrentPRogress = FClamp(CurrentProgress, 0, 1);
	SetInt("currentProgress", 100 * CurrentProgress);
}

DefaultProperties
{
	UpdateRate=0.1f
}