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

defaultproperties
{
   Name="Default__KFGFxWidget_MenuBarVersus"
   ObjectArchetype=KFGFxWidget_MenuBar'KFGame.Default__KFGFxWidget_MenuBar'
}
