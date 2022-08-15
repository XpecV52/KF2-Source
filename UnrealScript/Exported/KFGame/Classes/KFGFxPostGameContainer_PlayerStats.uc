//=============================================================================
// KFGFxPostGameContainer_PlayerStats
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 05/19/2015
//=============================================================================

class KFGFxPostGameContainer_PlayerStats extends KFGFxObject_Container
	dependson(EphemeralMatchStats);
































































































	















#linenumber 14;

var localized string AchievementsString, ZedKillsString, TopWeaponsString;
var localized string KnifeString;
var string PlayerStatsString;
var int ItemCount;

//==============================================================
// Initialization
//==============================================================
function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );
	LocalizeText();
	SetPlayerStats();
}

function LocalizeText()
{
	local GFxObject TextObject;

	TextObject = CreateObject("Object");

	TextObject.SetString("achievement", 	AchievementsString);
	TextObject.SetString("playerStats", 	PlayerStatsString);
	TextObject.SetString("zedKills", 	ZedKillsString);
	TextObject.SetString("topWeapons", 	TopWeaponsString);

	SetObject("localizedText", TextObject);
}

function SetPlayerStats()
{
	local GFxObject ObjectArray, ObjectArrayAdvancedStats, ObjectTopWeaponsList;
	local KFPlayerReplicationInfo KFPRI;
	local KFPlayerController KFPC;
	local int i;
	local int TopWeaponCount;
	local array<WeaponDamage> TopWeaponList;
	local EphemeralMatchStats StatCollector;
	local string TempWeaponName, TempIconSource;

	ItemCount = 0;

	KFPRI = KFPlayerReplicationInfo(GetPC().PlayerReplicationInfo);

	KFPC = KFPlayerController(GetPC());

	if(KFPRI != none && KFPC != none)
	{
		StatCollector = KFPC.MatchStats;

		ObjectArray = CreateArray();
		ObjectArrayAdvancedStats = CreateArray();
		ObjectTopWeaponsList = CreateArray();

		ObjectArray.SetElementObject(ItemCount, MakeTextObject("Total Dosh Earned:", String(Max(StatCollector.TotalDoshEarned, 0)) ));
		//ObjectArray.SetElementObject(ItemCount, MakeTextObject("Total Healing Given:", String(StatCollector.TotalAmountHealGiven) ));
		//ObjectArray.SetElementObject(ItemCount, MakeTextObject("Total Healing Received", String(StatCollector.TotalAmountHealReceived) ));
		ObjectArray.SetElementObject(ItemCount, MakeTextObject("Total Kills:", String(KFPRI.Kills) ));
		ObjectArray.SetElementObject(ItemCount, MakeTextObject("Large Zed Kills:", String(StatCollector.TotalLargeZedKills) ));
		ObjectArray.SetElementObject(ItemCount, MakeTextObject("Assists:", String(KFPRI.Assists) ));
		ObjectArray.SetElementObject(ItemCount, MakeTextObject("HeadShots:", String(StatCollector.TotalHeadShots) ));
		ObjectArray.SetElementObject(ItemCount, MakeTextObject("Total Damage Dealt:", String(StatCollector.TotalDamageDealt) ));
		//ObjectArray.SetElementObject(ItemCount, MakeTextObject("Total Damage Received:", String(StatCollector.TotalDamageTaken) ));
		
		//weapons
		StatCollector.GetTopWeapons(3, TopWeaponList);		

		TopWeaponCount = 0;
		for (i = 0; i < TopWeaponList.length; i++)
		{
			StatCollector.ResolveLocalizedWeaponNameAndIcon( TopWeaponList[i].DamageTypeID, TempWeaponName, TempIconSource);

			//Special case for knives at the moment since they all share the same damage type -ZG
			if(TopWeaponList[i].DamageTypeID == 3)
			{
				TempWeaponName = KnifeString;
			}

			ObjectTopWeaponsList.SetElementObject(TopWeaponCount,MakeWeaponObject(TempWeaponName, TempIconSource, TopWeaponList[i].DamageAmount, TopWeaponList[i].HeadShots, TopWeaponList[i].LargeZedKills) );	
			TopWeaponCount++;
			//clear the string so we do not get duplicate values
			TempWeaponName = "";
			TempIconSource = "";
		}
		
		for(i = 0; i < StatCollector.ZedKillsArray.length; i++)
		{
			ObjectArrayAdvancedStats.SetElementObject(i, MakeZedKillObject(StatCollector.ZedKillsArray[i].MonsterClass, String(StatCollector.ZedKillsArray[i].KillCount) ));
		}
	}

	SetObject("topWeapons", ObjectTopWeaponsList);
	SetObject("playerGeneralStats", ObjectArray);
	SetObject("playerAdvancedStats", ObjectArrayAdvancedStats);
}

function GFxObject MakeTextObject(String PrimaryText, String SecondaryText)
{
	local GFxObject TempObject;

	TempObject = CreateObject("Object");

	TempObject.SetString("typeString", 		"STAT");
	TempObject.SetString("title", 	PrimaryText);
	TempObject.SetString("value", 	SecondaryText);

	ItemCount++;

	return TempObject;
}

function GFxObject MakeZedKillObject(Class<KFPawn_Monster> MonsterClass, String SecondaryText)
{
	local GFxObject TempObject;
	local string MonsterName;

	MonsterName = Localize("Zeds", String(MonsterClass.Name), "KFGame");

	TempObject = CreateObject("Object");

	TempObject.SetString("typeString", 		"ZED_KILL");
	TempObject.SetString("title", 	MonsterName);
	TempObject.SetString("value", 	SecondaryText);
	TempObject.SetBool("bSkipAnim", true);
	ItemCount++;

	return TempObject;
}

function GFxObject MakeWeaponObject( string WeaponName, string WeaponIcon, int WeaponDamage, int HeadShotsWithWeapon, int LargeZedKillsWithWeapon )
{
	local GFxObject TempObject;
	
	TempObject = CreateObject("Object");
	TempObject.SetString("typeString", 		"TopWeapon");
	TempObject.SetString("weaponName", 		WeaponName);
	TempObject.SetString("weaponIcon", 		"img://"$WeaponIcon);

	TempObject.SetString("damageText", 			"DAMAGE DEALT:");
	TempObject.SetString("headshotsText", 		"HEADSHOTS:");
	TempObject.SetString("largeZedText", 		"LARGE ZED KILLS:");

	TempObject.SetInt("damage", 		WeaponDamage);
	TempObject.SetInt("headshots", 		HeadShotsWithWeapon);
	TempObject.SetInt("largeZed", 		LargeZedKillsWithWeapon);

	return TempObject;
}


function GFxObject MakeAwardObject()
{
	
}

/*function SetMapOptions(array Maplist)
{
	SetObject("mapChoices", mapList);
}*/

defaultproperties
{
   AchievementsString="Achievements"
   ZedKillsString="ZED KILLS"
   TopWeaponsString="TOP WEAPONS"
   KnifeString="Knife"
   Name="Default__KFGFxPostGameContainer_PlayerStats"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
