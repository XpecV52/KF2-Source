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

function ReceivePawn(KFPawn NewPawn)
{
	super.ReceivePawn(NewPawn);

	if(MoveListContainer != none)
	{
		MoveListContainer.ChangeOwner(KFPawn_Monster(NewPawn));
	}
}

function PawnDied()
{
	super.PawnDied();
	if(MoveListContainer != none)
	{
		MoveListContainer.ClearMoveList();
	}
}

defaultproperties
{
   MovieInfo=SwfMovie'UI_HUD.InGameHUD_ZED_SWF'
   WidgetBindings(1)=(WidgetName="PlayerBackpackWidget",WidgetClass=Class'KFGame.KFGFxHUD_PlayerBackpack')
   WidgetBindings(2)=(WidgetName="PriorityMsgWidget",WidgetClass=Class'GFxUI.GFxObject')
   WidgetBindings(3)=(WidgetName="BossNamePlate",WidgetClass=Class'GFxUI.GFxObject')
   WidgetBindings(4)=(WidgetName="interactionMsgWidget")
   WidgetBindings(5)=(WidgetName="ControllerWeaponSelectContainer",WidgetClass=Class'KFGame.KFGFxHUD_WeaponSelectWidget')
   WidgetBindings(6)=(WidgetName="WeaponSelectContainer",WidgetClass=Class'KFGame.KFGFxHUD_WeaponSelectWidget')
   WidgetBindings(7)=(WidgetName="CompassContainer",WidgetClass=Class'KFGame.KFGFxHUD_TraderCompass')
   WidgetBindings(8)=(WidgetName="WaveInfoContainer",WidgetClass=Class'KFGame.KFGFxHUD_WaveInfo')
   WidgetBindings(9)=(WidgetName="ChatBoxWidget",WidgetClass=Class'KFGame.KFGFxHUD_ChatBoxWidget')
   WidgetBindings(10)=(WidgetName="VOIPWidget",WidgetClass=Class'KFGame.KFGFxWidget_VOIPNotification')
   WidgetBindings(11)=(WidgetName="LevelUpNotificationWidget",WidgetClass=Class'KFGame.KFGFxWidget_LevelUpNotification')
   WidgetBindings(12)=(WidgetName="VoiceCommsWidget",WidgetClass=Class'KFGame.KFGFxWidget_VoiceComms')
   WidgetBindings(13)=(WidgetName="KickVoteWidget",WidgetClass=Class'KFGame.KFGFxWidget_KickVote')
   WidgetBindings(14)=(WidgetName="MusicNotification",WidgetClass=Class'KFGame.KFGFxWidget_MusicNotification')
   WidgetBindings(15)=(WidgetName="NonCriticalMessageWidget",WidgetClass=Class'KFGame.KFGFxWidget_NonCriticalGameMessage')
   WidgetBindings(16)=(WidgetName="InviteMessageWidget",WidgetClass=Class'KFGame.KFGFxWidget_NonCriticalGameMessage')
   WidgetBindings(17)=(WidgetName="RhythmCounter",WidgetClass=Class'KFGame.KFGFxWidget_RhythmCounter')
   WidgetBindings(18)=(WidgetName="bossHealthBar",WidgetClass=Class'KFGame.KFGFxWidget_BossHealthBar')
   WidgetBindings(19)=(WidgetName="MapTextWidget",WidgetClass=Class'KFGame.KFGFxWidget_MapText')
   WidgetBindings(20)=(WidgetName="counterMapTextWidget",WidgetClass=Class'KFGame.KFGFxWidget_MapCounterText')
   WidgetBindings(21)=(WidgetName="teamRoster",WidgetClass=Class'KFGame.KFGFxHud_PlayerRosterWidget')
   WidgetBindings(22)=(WidgetName="MoveListContainer",WidgetClass=Class'KFGame.KFGFxHUD_PlayerMoveList')
   WidgetBindings(23)=(WidgetName="PlayerStatWidgetMC",WidgetClass=Class'kfgamecontent.KFGFxHUD_PlayerStatusVersus')
   WidgetBindings(24)=(WidgetName="SpectatorInfoWidget",WidgetClass=Class'KFGame.KFGFxHUD_SpectatorInfo_Versus')
   Name="Default__KFGFxMoviePlayer_HUD_Versus"
   ObjectArchetype=KFGFxMoviePlayer_HUD'KFGame.Default__KFGFxMoviePlayer_HUD'
}
