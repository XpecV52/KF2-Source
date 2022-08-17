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

defaultproperties
{
   InGamePartyWidgetClass=Class'KFGame.KFGFxWidget_PartyInGame_Versus'
   WidgetPaths(1)="../UI_Widgets/ButtonPromptWidget_SWF.swf"
   WidgetPaths(2)="../UI_Widgets/VersusLobbyWidget_SWF.swf"
   Name="Default__KFGFxMoviePlayer_Manager_Versus"
   ObjectArchetype=KFGFxMoviePlayer_Manager'KFGame.Default__KFGFxMoviePlayer_Manager'
}
