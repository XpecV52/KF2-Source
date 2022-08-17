class KFGFxMoviePlayer_Manager_Versus extends KFGFxMoviePlayer_Manager;

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
	switch (WidgetName)
	{
		case ( 'partyWidget' ):
			if ( PartyWidget == none )
			{
	        	PartyWidget = KFGFxWidget_PartyInGame_Versus( Widget );
	        	if(GetPC().WorldInfo.GRI != none)
	        	{
	        		PartyWidget.StartCountdown(KFGameReplicationInfo(GetPC().WorldInfo.GRI).RemainingTime, false);
	        	}
		    	PartyWidget.Manager = self;
		        PartyWidget.InitializeWidget();
			}
		break;				
	}
	
	return super.WidgetInitialized(WidgetName, WidgetPath, Widget);
}

DefaultProperties
{
	InGamePartyWidgetClass=class'KFGFxWidget_PartyInGame_Versus'
	WidgetPaths.Remove("../UI_Widgets/PartyWidget_SWF.swf")
	WidgetPaths.Add("../UI_Widgets/VersusLobbyWidget_SWF.swf")
}