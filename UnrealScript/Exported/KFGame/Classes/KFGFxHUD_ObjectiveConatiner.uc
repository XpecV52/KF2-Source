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

simulated function SetActive(bool bActive)
{
	SetVisible(bActive);
	if (bActive)
	{
		CurrentObjectiveInterface = KFGameReplicationInfo(GetPC().WorldInfo.GRI).ObjectiveInterface;
		if (CurrentObjectiveInterface != none)
		{
			SetFailState(CurrentObjectiveInterface.HasFailedObjective());
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
		UpdateActorCount();
	}
}

function UpdateActorCount()
{
	local GFxObject DataObject;

	if (CurrentObjectiveInterface.UsesMultipleActors())
	{
		DataObject = CreateObject("Object");;
		DataObject.SetString("textValue", CurrentObjectiveInterface.GetActorCount());
		SetObject("objectiveNumber", DataObject);
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

defaultproperties
{
   UpdateRate=0.100000
   Name="Default__KFGFxHUD_ObjectiveConatiner"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
