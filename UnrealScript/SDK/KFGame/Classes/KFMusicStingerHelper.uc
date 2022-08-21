class KFMusicStingerHelper extends Object;

var AkEvent		RoundWonStinger;
var AkEvent 	RoundLostStinger;
var AkEvent		MatchWonStinger;
var AkEvent 	MatchLostStinger;
var AkEvent		WaveStartStinger;
var AkEvent		WaveCompletedStinger;
var AkEvent 	ObjectiveWonStinger;
var AkEvent		ObjectiveLostStinger;
var AkEvent		PlayerDiedStinger;
var AkEvent		LevelUpStinger;
var AkEvent		TierUnlockedStinger;

var AkEvent		TeammateDeathStinger;
var AkEvent		ZedKillHumanStinger;
var AkEvent		ZedPlayerKilledStinger;
var AkEvent		ZedPlayerSuicideStinger;

static simulated function PlayTeammateDeathStinger( PlayerController P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController( P );
	if( KFPC == none )
		return;

	// allow match won stinger to interrupt others
	KFPC.StingerAkComponent.StopEvents();
	KFPC.StingerAkComponent.PlayEvent( default.TeammateDeathStinger );
}

static simulated function PlayZedKillHumanStinger( PlayerController P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController( P );
	if( KFPC == none )
		return;

	// allow match won stinger to interrupt others
	KFPC.StingerAkComponent.StopEvents();
	KFPC.StingerAkComponent.PlayEvent( default.ZedKillHumanStinger );
}

static simulated function PlayZedPlayerKilledStinger( PlayerController P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController( P );
	if( KFPC == none )
		return;

	// allow match won stinger to interrupt others
	KFPC.StingerAkComponent.StopEvents();
	KFPC.StingerAkComponent.PlayEvent( default.ZedPlayerKilledStinger );
}

static simulated function PlayZedPlayerSuicideStinger( PlayerController P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController( P );
	if( KFPC == none )
		return;

	// allow match won stinger to interrupt others
	KFPC.StingerAkComponent.StopEvents();
	KFPC.StingerAkComponent.PlayEvent( default.ZedPlayerSuicideStinger );
}

static simulated function PlayRoundWonStinger( PlayerController P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController( P );
	if( KFPC == none )
		return;

	// allow match won stinger to interrupt others
	KFPC.StingerAkComponent.StopEvents();
	KFPC.StingerAkComponent.PlayEvent( default.RoundWonStinger );
}

static simulated function PlayRoundLostStinger( PlayerController P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController( P );
	if( KFPC == none )
		return;

	// allow player match lost stinger to interrupt others
	KFPC.StingerAkComponent.StopEvents();
	KFPC.StingerAkComponent.PlayEvent( default.RoundLostStinger );
}

static simulated function PlayMatchWonStinger( PlayerController P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController( P );
	if( KFPC == none )
		return;

	// allow match won stinger to interrupt others
	KFPC.StingerAkComponent.StopEvents();
	KFPC.StingerAkComponent.PlayEvent( default.MatchWonStinger );
}

static simulated function PlayMatchLostStinger( PlayerController P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController( P );
	if( KFPC == none )
		return;

	// allow player match lost stinger to interrupt others
	KFPC.StingerAkComponent.StopEvents();
	KFPC.StingerAkComponent.PlayEvent( default.MatchLostStinger );
}

static simulated function PlayWaveStartStinger( PlayerController P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController( P );
	if( KFPC == none )
		return;

	// allow player wave complete stinger to interrupt others
	KFPC.StingerAkComponent.StopEvents();
	KFPC.StingerAkComponent.PlayEvent( default.WaveStartStinger );
}

static simulated function PlayWaveCompletedStinger( PlayerController P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController( P );
	if( KFPC == none )
		return;

	// allow player wave complete stinger to interrupt others
	KFPC.StingerAkComponent.StopEvents();
	KFPC.StingerAkComponent.PlayEvent( default.WaveCompletedStinger );
}

static simulated function PlayObjectiveWonStinger( PlayerController P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController( P );
	if( KFPC == none )
		return;

	if( KFPC.StingerAkComponent.IsPlaying() )
		return;

	KFPC.StingerAkComponent.PlayEvent( default.ObjectiveWonStinger );
}

static simulated function PlayObjectiveLostStinger( PlayerController P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController( P );
	if( KFPC == none )
		return;

	if( KFPC.StingerAkComponent.IsPlaying() )
		return;

	KFPC.StingerAkComponent.PlayEvent( default.ObjectiveLostStinger );
}

static simulated function PlayLevelUpStinger( PlayerController P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController( P );
	if( KFPC == none )
		return;

	if( KFPC.StingerAkComponent.IsPlaying() )
		return;

	KFPC.StingerAkComponent.PlayEvent( default.LevelUpStinger );
}

static simulated function PlayTierUnlockedStinger( PlayerController P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController( P );
	if( KFPC == none )
		return;

	if( KFPC.StingerAkComponent.IsPlaying() )
		return;

	KFPC.StingerAkComponent.PlayEvent( default.TierUnlockedStinger );
}

static simulated function PlayPlayerDiedStinger( PlayerController P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController( P );
	if( KFPC == none )
		return;

	// allow player died stinger to interrupt others
	KFPC.StingerAkComponent.StopEvents();
	KFPC.StingerAkComponent.PlayEvent( default.PlayerDiedStinger );
}

defaultproperties
{
	WaveStartStinger=AkEvent'WW_UI_Menu.Play_UI_Alert_Wave_Incoming'
	RoundWonStinger=AkEvent'WW_UI_Menu.Play_Round_Won'
	RoundLostStinger=AkEvent'WW_UI_Menu.Play_Round_Lost'
	MatchWonStinger=AkEvent'WW_MSTG_Global.Play_MSTG_BossKilled'
	MatchLostStinger=AkEvent'WW_MSTG_Global.Play_MSTG_TeamWipedOut'
	WaveCompletedStinger=AkEvent'WW_MSTG_Global.Play_MSTG_WaveComplete'
	ObjectiveWonStinger=AkEvent'WW_MSTG_Global.Play_MSTG_ObjectiveComplete'
	ObjectiveLostStinger=AkEvent'WW_MSTG_Global.Play_MSTG_ObjectiveFailed'
	PlayerDiedStinger=AkEvent'WW_MSTG_Global.Play_MSTG_PlayerDeath'
	LevelUpStinger=AkEvent'WW_MSTG_Global.Play_MSTG_LevelUp_XP'
	TierUnlockedStinger=AkEvent'WW_MSTG_Global.Play_MSTG_LevelUp_KeyXP'

	TeammateDeathStinger=AkEvent'WW_UI_Menu.Play_Teammate_Death'
	ZedKillHumanStinger=AkEvent'WW_UI_Menu.Play_Zed_Kill_Human'
	ZedPlayerKilledStinger=AkEvent'WW_UI_Menu.Play_Zed_Player_Killed'
	ZedPlayerSuicideStinger=AkEvent'WW_UI_Menu.Play_Zed_Player_Suicide'
}
