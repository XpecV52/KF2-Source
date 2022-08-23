class KFGFxWidget_MenuBarVersus extends KFGFxWidget_MenuBar;

static function bool CanUseGearButton( PlayerController PC, KFGfxMoviePlayer_Manager GfxManager )
{
	return PC.PlayerReplicationInfo.GetTeamNum() != 255 && super.CanUseGearButton( PC, GfxManager );
}

defaultproperties
{
   Name="Default__KFGFxWidget_MenuBarVersus"
   ObjectArchetype=KFGFxWidget_MenuBar'KFGame.Default__KFGFxWidget_MenuBar'
}
