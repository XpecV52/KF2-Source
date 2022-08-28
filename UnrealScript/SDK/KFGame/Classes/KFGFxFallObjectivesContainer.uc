class KFGFxFallObjectivesContainer extends KFGFxSpecialEventObjectivesContainer;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
}

static function GetObjectiveProgressValues(int ObjectiveID, out int CurrentValue, out int MaxValue, out float PercentComplete)
{
	local KFPlayerController LocalKFPC;
	local int TempCurrentValue, TempMaxValue;

	//the only one we are using atm
	if (ObjectiveID != 2)
	{
		super.GetObjectiveProgressValues(ObjectiveID, CurrentValue, MaxValue, PercentComplete);
		return;
	}
	
	LocalKFPC = KFPlayerController(class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController());
	//we do not use objective id yet.
	LocalKFPC.GetSpecialEventKillsInfo(TempCurrentValue, TempMaxValue);

	MaxValue = TempMaxValue;
	CurrentValue = Clamp(TempCurrentValue, 0, MaxValue);
	PercentComplete = FClamp((float(CurrentValue) / float(MaxValue)), 0, 1.0f);
}

DefaultProperties
{
	
    ObjectiveIconURLs[0]="Halloween_UI.UI_Objectives_Halloween_Trap"
    ObjectiveIconURLs[1]="Halloween_UI.UI_Objectives_Halloween_Collectible"
    ObjectiveIconURLs[2]="Halloween_UI.UI_Objectives_Halloween_500ZEDs"
	ObjectiveIconURLs[3] = "Halloween_UI.UI_Objectives_Halloween_Wave25"
    ObjectiveIconURLs[4]="Halloween_UI.UI_Objectives_Halloween_HansKill"
	
    //defaults
	AllCompleteRewardIconURL="WEP_SkinSet_Halloween_Item_TEX.hans_mkb42h.MKB42_HalloweenPrecious_Mint"
    ChanceDropIconURLs[0]="CHR_CosmeticSet_Halloween_01_Item_TEX.hllwn_treat_ticket"
    ChanceDropIconURLs[1]="CHR_CosmeticSet_Halloween_01_Item_TEX.hllwn_treat_ticket_precious"
	IconURL="Halloween_UI.KF2_HalloweenHorrors2018_Logo_UIBanner"

	UsesProgressList[0] = false
	UsesProgressList[1] = false
	UsesProgressList[2] = true
	UsesProgressList[3] = false
	UsesProgressList[4] = false
}