class KFGFxHUD_ObjectiveConatiner extends GFxObject;

var float UpdateRate;
var KFInterface_MapObjective CurrentObjectiveInterface;

var Texture2d LastIcon;

var KFPlayerController KFPC;

var name SoundThemeName;
var name SoundCueName;

var float LastProgress;
var bool bLastMissionCritical;

function InitializeHUD()
{
	KFPC = KFPlayerController(GetPC());
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
			UpdateActorCount();
			UpdateIcon();
			SetCompleted(CurrentObjectiveInterface.IsComplete());
			SetMissionCritical(CurrentObjectiveInterface.GetIsMissionCritical());
		}
	}
	else
	{
		CurrentObjectiveInterface = none;
		//hide actor count
		GetObject("objectiveNumberMC").SetVisible(false);
	}
	//SetBool("isActive", bActive); //nothing supporting this atm
}

function SetCompleted(bool bComplete)
{
	Setbool("completeStatus", bComplete);
	//play sound queue
	if (KFPC != none && KFPC.MyGFxHUD != none && bComplete)
	{
		KFPC.MyGFxHUD.PlaySoundFromTheme(SoundCueName, SoundThemeName);
	}
}

function SetMissionCritical(bool bMissionCritical)
{
	bMissionCritical = false; //not using this for now
	if (bMissionCritical != bLastMissionCritical)
	{
		Setbool("missionCriticalStatus", bMissionCritical);
		bLastMissionCritical = bMissionCritical;
	}	
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
		if (LastIcon != CurrentObjectiveInterface.GetIcon())
		{
			UpdateIcon();
		}
		SetMissionCritical(CurrentObjectiveInterface.GetIsMissionCritical());
	}
}

function UpdateIcon()
{
	LastIcon = CurrentObjectiveInterface.GetIcon();
	SetCurrentIcon(PathName(LastIcon));
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
	if (LastProgress != CurrentProgress)
	{
		CurrentProgress = FClamp(CurrentProgress, 0, 1);
		LastProgress = CurrentProgress;
		SetInt("currentProgress", 100 * CurrentProgress);
		SetCompleted(CurrentObjectiveInterface.IsComplete());
	}
}

DefaultProperties
{
	LastProgress=-0.0f
	UpdateRate=0.1f

	SoundThemeName=UI
	SoundCueName=TraderTime_Countdown
}