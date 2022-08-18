class KFGFxWidget_MenuBarVersus extends KFGFxWidget_MenuBar;

function bool CanUseGearButton()
{
	if( GetPC().Pawn != none && !Manager.bAfterLobby && GetPC().PlayerReplicationInfo.GetTeamNum() != 255 ||
		class'WorldInfo'.static.IsMenuLevel() )
	{
		return true;
	}
	return false;
}
