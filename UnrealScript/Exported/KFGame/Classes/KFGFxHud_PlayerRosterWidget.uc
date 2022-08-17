class KFGFxHud_PlayerRosterWidget extends GFxObject;

var PlayerReplicationInfo MyPRI;

function InitializeHUD()
{
	MyPRI = GetPC().PlayerReplicationInfo;
}

function TickHud(float DeltaTime)
{
	UpdatePlayerData();
}


function UpdatePlayerData()
{
	local GFxObject DataProvider,TempData;
	local int i, PlayerIndex;
    local KFPlayerReplicationinfo KFPRI;
    local KFPlayerController KFPC;
    

    local KFGameReplicationInfo KFGRI;
    local array<KFPlayerReplicationinfo> CurrentPlayerList;
    
    KFGRI = KFGameReplicationInfo(GetPC().Worldinfo.GRI);

    if(KFGRI == none)
    {
        return;
    }

    if(MyPRI == none)
    {
    	return;
    }

    PlayerIndex = 0;


    KFGRI.GetKFPRIArray(CurrentPlayerList);

    KFPC = KFPlayerController(GetPC());

    DataProvider = CreateArray();
	for(i = 0 ; i < CurrentPlayerList.length; i ++)
    {
    	if(CurrentPlayerList[i].GetTeamNum() == MyPRI.GetTeamNum() && MyPRI != CurrentPlayerList[i])
    	{
    		KFPRI = CurrentPlayerList[i];
	        TempData  = CreateObject("Object");

	        TempData.SetString("playerIcon",  KFPC.GetSteamAvatar(KFPRI.UniqueId));
            if(KFPRI.CharPortrait != none)
            {
                TempData.SetString("zedIcon",  "img://"$PathName(KFPRI.CharPortrait));
            }

	        TempData.SetFloat("health", ByteToFloat(KFPRI.PlayerHealthPercent) * 100);  
	        DataProvider.SetElementObject(PlayerIndex,TempData);
	        PlayerIndex++;
    	}
        
    }

    SetObject("data", DataProvider);
}

defaultproperties
{
   Name="Default__KFGFxHud_PlayerRosterWidget"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
