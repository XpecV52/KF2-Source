class KFGFxHUD_ObjectiveConatiner extends GFxObject;

function SetActive(bool bActive)
{
	SetBool("isActive", bActive);
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

//pass a value from 0-1
function SetCurrentProgress(float CurrentProgress)
{
	CurrentPRogress = Clamp(CurrentProgress, 0, 1);
	SetInt("currentProgress", 100 * CurrentProgress);
}

DefaultProperties
{

}