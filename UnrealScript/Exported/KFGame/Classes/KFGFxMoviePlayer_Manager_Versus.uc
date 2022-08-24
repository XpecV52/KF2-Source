class KFGFxMoviePlayer_Manager_Versus extends KFGFxMoviePlayer_Manager;

function ClientRecieveNewTeam()
{
	if(bMenusOpen)
	{
		if(CurrentMenu != none && CurrentMenu == GearMenu)
		{
			OpenMenu(UI_Start);
		}
		UpdateMenuBar();
	}
}


event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
	switch (WidgetName)
	{
		case ( 'MenuBarWidget' ):
			if ( MenuBarWidget == none )
			{
		        MenuBarWidget = KFGFxWidget_MenuBarVersus( Widget );
		        MenuBarWidget.InitializeMenu( self );
		        MenuBarWidget.InitializeCurrentMenu(UI_Start);
			}
		break;
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
   WidgetBindings(21)=(WidgetName="ButtonPromptWidgetContainer",WidgetClass=Class'KFGame.KFGFxWidget_ButtonPrompt')
   WidgetBindings(22)=(WidgetName="MenuBarWidget",WidgetClass=Class'KFGame.KFGFxWidget_MenuBarVersus')
   Name="Default__KFGFxMoviePlayer_Manager_Versus"
   ObjectArchetype=KFGFxMoviePlayer_Manager'KFGame.Default__KFGFxMoviePlayer_Manager'
}
