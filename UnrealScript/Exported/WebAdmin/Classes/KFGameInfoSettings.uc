/**
 * Generic settings for all builtin gametypes
 *
 * Copyright (C) 2011,2014 Tripwire Interactive LLC
 *
 * @author  Michiel 'elmuerte' Hendriks
 */
class KFGameInfoSettings extends WebAdminSettings;








































	

















	








	




	


























	









	




	




	























	












#linenumber 10




























































var class<KFGameInfo> KFGameInfoClass;

var GameInfo gameinfo;

function setCurrentGameInfo(GameInfo instance)
{
	if (instance != none)
	{
		if (!ClassIsChildOf(instance.class, KFGameInfoClass))
		{
			return;
		}
	}
	super.setCurrentGameInfo(instance);
	gameinfo = instance;
	// reload values
	if (gameinfo != none)
	{
		initSettings();
	}
}

function cleanupSettings()
{
	gameinfo = none;
	super.cleanupSettings();
}

function initSettings()
{
	if (KFGameInfoClass == none) return;
 	if (KFGameInfo (gameinfo) != none){SetIntPropertyByName( 'GameStartDelay', KFGameInfo (gameinfo).GameStartDelay);}else {SetIntPropertyByName( 'GameStartDelay', KFGameInfoClass.default.GameStartDelay);};
 	if (KFGameInfo (gameinfo) != none){SetIntPropertyByName( 'ReadyUpDelay', KFGameInfo (gameinfo).ReadyUpDelay);}else {SetIntPropertyByName( 'ReadyUpDelay', KFGameInfoClass.default.ReadyUpDelay);};
 	if (KFGameInfo (gameinfo) != none){SetIntPropertyByName( 'EndOfGameDelay', KFGameInfo (gameinfo).EndOfGameDelay);}else {SetIntPropertyByName( 'EndOfGameDelay', KFGameInfoClass.default.EndOfGameDelay);};
	if (KFGameInfo (gameinfo) != none){SetIntPropertyByName( 'bDisablePickups', int(KFGameInfo (gameinfo).bDisablePickups));}else {SetIntPropertyByName( 'bDisablePickups', int(KFGameInfoClass.default.bDisablePickups));};
//	`GIV_SetBoolPropertyByName('bEnableObjectives', bEnableObjectives);
//	`GIV_SetBoolPropertyByName('bEnableCoopObjectives', bEnableCoopObjectives);
}

function saveSettings()
{
	saveInternal();
	if (gameinfo != none) {
		gameinfo.SaveConfig();
	}
	KFGameInfoClass.static.StaticSaveConfig();
}

protected function saveInternal()
{
	local int val;
	if (KFGameInfoClass == none) return;
	GetIntPropertyByName( 'GameStartDelay', KFGameInfoClass.default.GameStartDelay);if (KFGameInfo (gameinfo) != none){GetIntPropertyByName( 'GameStartDelay', KFGameInfo (gameinfo).GameStartDelay);};
 	GetIntPropertyByName( 'ReadyUpDelay', KFGameInfoClass.default.ReadyUpDelay);if (KFGameInfo (gameinfo) != none){GetIntPropertyByName( 'ReadyUpDelay', KFGameInfo (gameinfo).ReadyUpDelay);};
 	GetIntPropertyByName( 'EndOfGameDelay', KFGameInfoClass.default.EndOfGameDelay);if (KFGameInfo (gameinfo) != none){GetIntPropertyByName( 'EndOfGameDelay', KFGameInfo (gameinfo).EndOfGameDelay);};
	if (GetIntPropertyByName( 'bDisablePickups', val)){KFGameInfoClass.default.bDisablePickups = val != 0;if (KFGameInfo (gameinfo) != none){KFGameInfo (gameinfo).bDisablePickups = val != 0;}};
//	`GIV_GetBoolPropertyByName('bEnableObjectives', bEnableObjectives);
//	`GIV_GetBoolPropertyByName('bEnableCoopObjectives', bEnableCoopObjectives);
}

defaultproperties
{
   KFGameInfoClass=Class'KFGame.KFGameInfo'
   SettingsGroups(0)=(GroupID="Rules",DisplayName="Rules",pMax=100)
   SettingsGroups(1)=(GroupID="Game",DisplayName="Game",pMin=100,pMax=200)
   SettingsGroups(2)=(GroupID="Advanced",DisplayName="Advanced",pMin=1000,pMax=1100)
   Properties(0)=(PropertyId=1,Data=(Type=SDT_Int32))
   Properties(1)=(PropertyId=2,Data=(Type=SDT_Int32))
   Properties(2)=(PropertyId=3,Data=(Type=SDT_Int32))
   Properties(3)=(PropertyId=4,Data=(Type=SDT_Int32))
   PropertyMappings(0)=(Id=1,Name="EndOfGameDelay",ColumnHeaderText="End Of Game Delay",MappingType=PVMT_Ranged,MaxVal=9999.000000,RangeIncrement=5.000000)
   PropertyMappings(1)=(Id=2,Name="GameStartDelay",ColumnHeaderText="Game Start Delay",MappingType=PVMT_Ranged,MaxVal=9999.000000,RangeIncrement=5.000000)
   PropertyMappings(2)=(Id=3,Name="ReadyUpDelay",ColumnHeaderText="Ready Up Delay",MappingType=PVMT_Ranged,MaxVal=9999.000000,RangeIncrement=5.000000)
   PropertyMappings(3)=(Id=4,Name="bDisablePickups",ColumnHeaderText="Pickups",MappingType=PVMT_IdMapped,ValueMappings=((Name="Enabled"),(Id=1,Name="Disabled")))
   PropertyMappings(4)=(ColumnHeaderText="Objectives",ValueMappings=((Name="Disabled"),(Name="Enabled")))
   PropertyMappings(5)=(ColumnHeaderText="Coop Objectives",ValueMappings=((Name="Disabled"),(Name="Enabled")))
   Name="Default__KFGameInfoSettings"
   ObjectArchetype=WebAdminSettings'webadmin.Default__WebAdminSettings'
}
