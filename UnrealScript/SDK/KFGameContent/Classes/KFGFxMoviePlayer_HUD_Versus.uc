class KFGFxMoviePlayer_HUD_Versus extends KFGFxMoviePlayer_HUD;

var KFGFxHUD_PlayerMoveList MoveListContainer;
var KFGFxHud_PlayerRosterWidget PlayerRoster;

function TickHud(float DeltaTime)
{
	super.TickHud(DeltaTime);

	if(moveListContainer != none)
	{
		moveListContainer.TickHud(DeltaTime);
	}

	if(PlayerRoster != none)
	{
		PlayerRoster.TickHud(DeltaTime);
	}
}

/** Ties the GFxClikWidget variables to the .swf components and handles events */
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
	switch(WidgetName)
	{
	case 'teamRoster':
		if(PlayerRoster == none)
		{
			PlayerRoster = KFGFxHud_PlayerRosterWidget(Widget);
			SetWidgetPathBinding( Widget, WidgetPath );
			PlayerRoster.InitializeHUD();
		}	
		break;
	case 'KickVoteWidget':
		if( KickVoteWidget == none )
		{
			KickVoteWidget = KFGFxWidget_KickVote(Widget);
			SetWidgetPathBinding( Widget, WidgetPath );
			KickVoteWidget.InitializeHUD();
		}
		break;
	case 'SpectatorInfoWidget':
		if( SpectatorInfoWidget == none )
		{
			SpectatorInfoWidget = KFGFxHUD_SpectatorInfo_Versus(Widget);
			SetWidgetPathBinding( Widget, WidgetPath );
			SpectatorInfoWidget.InitializeHUD();
		}
		break;
	case 'PlayerStatWidgetMC':
		if ( PlayerStatusContainer == none )
		{
			PlayerStatusContainer = KFGFxHUD_PlayerStatusVersus(Widget);
			SetWidgetPathBinding( Widget, WidgetPath );
			PlayerStatusContainer.InitializeHUD();
		}
		break;
	case 'PlayerBackpackWidget':
		if ( PlayerBackpackContainer == none )
		{
			PlayerBackpackContainer = KFGFxHUD_PlayerBackpack(Widget);
			SetWidgetPathBinding( Widget, WidgetPath );
			PlayerBackpackContainer.InitializeHUD();
		}
		break;
	case 'PriorityMsgWidget':
		if( PriorityMessageContainer == none)
		{
			PriorityMessageContainer = Widget;
			SetWidgetPathBinding( Widget, WidgetPath );
		}
		break;
	case 'BossNamePlate':
		if( BossNameplateContainer == none)
		{
			BossNameplateContainer = Widget;
			SetWidgetPathBinding( Widget, WidgetPath );
		}
		break;
	case 'interactionMsgWidget':
		if( InteractionMessageContainer == none)
		{
			InteractionMessageContainer = Widget;
			SetWidgetPathBinding( Widget, WidgetPath );
		}
		break;
	case 'WeaponSelectContainer':
		if ( WeaponSelectWidget == none )
		{
			WeaponSelectWidget = KFGFxHUD_WeaponSelectWidget(Widget);
			WeaponSelectWidget.RefreshWeaponSelect();
			WeaponSelectWidget.InitializeObject();
		}
		break;
	case 'CompassContainer':
		if ( TraderCompassWidget == none )
		{
			TraderCompassWidget = KFGFxHUD_TraderCompass(Widget);
			TraderCompassWidget.InitializeHUD();
			SetWidgetPathBinding( Widget, WidgetPath );
		}
		break;
	case 'moveListContainer':
		if ( MoveListContainer == none )
		{
			MoveListContainer = KFGFxHUD_PlayerMoveList(Widget);
			MoveListContainer.InitializeHUD();
			SetWidgetPathBinding( Widget, WidgetPath );
		}
		break;
	case 'WaveInfoContainer':
		if ( WaveInfoWidget == none )
		{
			WaveInfoWidget = KFGFxHUD_WaveInfo(Widget);
			WaveInfoWidget.InitializeHUD();
			SetWidgetPathBinding( Widget, WidgetPath );
		}
		break;
	case 'ScoreboardWidgetMC':
		if ( ScoreboardWidget == none )
		{
			ScoreboardWidget = KFGFxHUD_ScoreboardWidget(Widget);
			ScoreboardWidget.InitializeHUD();
			SetWidgetPathBinding( Widget, WidgetPath );
		}
		break;
	case 'ChatBoxWidget':
		if(!(class'WorldInfo'.static.IsPlayInEditor()))
		{
			if(HudChatBox == none)
			{
				HudChatBox = KFGFxHUD_ChatBoxWidget(Widget);
			}
		}
		break;
	case 'voipWidget':
		if(VOIPWidget == none)
		{
			VOIPWidget = KFGFxWidget_VOIPNotification(Widget);
		}
		break;
	case 'LevelUpNotificationWidget':
		if(LevelUpNotificationWidget == none)
		{
			LevelUpNotificationWidget = KFGFxWidget_LevelUpNotification(Widget);
			LevelUpNotificationWidget.InitializeHUD();
		}
		break;
	case 'VoiceCommsWidget':
		if(VoiceCommsWidget == none)
		{
			VoiceCommsWidget = KFGFxWidget_VoiceComms(Widget);
			VoiceCommsWidget.InitializeHUD();
		}
		break;
	case 'MusicNotification':
		if(MusicNotification == none)
		{
			MusicNotification = KFGFxWidget_MusicNotification(Widget);
			MusicNotification.InitializeHUD();
		}
		break;
	case 'NonCriticalMessageWidget':
		if(NonCriticalGameMessageWidget == none)
		{
			NonCriticalGameMessageWidget = KFGFxWidget_NonCriticalGameMessage(Widget);
		}
		break;
	case 'RhythmCounter':
		if(RhythmCounterWidget == none)
		{
			RhythmCounterWidget = KFGFxWidget_RhythmCounter(Widget);
		}
		break;
	}

	return true;
}

DefaultProperties
{
	MovieInfo=SwfMovie'UI_HUD.InGameHUD_ZED_SWF'
	WidgetBindings.Add((WidgetName="teamRoster",WidgetClass=class'KFGFxHud_PlayerRosterWidget'))
	WidgetBindings.Add((WidgetName="moveListContainer",WidgetClass=class'KFGFxHUD_PlayerMoveList'))
	WidgetBindings.Remove((WidgetName="PlayerStatWidgetMC",WidgetClass=class'KFGFxHUD_PlayerStatus'))
	WidgetBindings.Add((WidgetName="PlayerStatWidgetMC",WidgetClass=class'KFGFxHUD_PlayerStatusVersus'))
	WidgetBindings.Remove((WidgetName="SpectatorInfoWidget",WidgetClass=class'KFGFxHUD_SpectatorInfo'))
	WidgetBindings.Add((WidgetName="SpectatorInfoWidget",WidgetClass=class'KFGFxHUD_SpectatorInfo_Versus'))
}
