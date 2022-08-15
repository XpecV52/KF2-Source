//=============================================================================
// KFPerk
//=============================================================================
// Collects stats for in dialog and after action review (AAR)
//	//http://dictionary.reference.com/browse/ephemeral
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class EphemeralMatchStats extends Object within KFPlayerController
	dependson(KFGFxObject_TraderItems);



















	const MATCH_EVENT_HEADSHOT 		= 0;

	const MATCH_EVENT_DOSH_EARNED 		= 1;

	const MATCH_EVENT_DAMAGE_DEALT 	= 2;

	const MATCH_EVENT_DAMAGE_TAKEN 	= 3;

	const MATCH_EVENT_HEAL_GIVEN 		= 4;

	const MATCH_EVENT_HEAL_RECEIVED 	= 5;

	 
	
	const MATCH_EVENT_MAX_EVENTID 	= 0x0000FFFF;































































	















#linenumber 15;


var bool bShowMatchStatsLogging;

struct TopWeaponReplicationInfo
{
	var byte TopWeapon1;
	var byte TopWeapon2;
	var byte TopWeapon3;

	var Vector TopWeapon1Info; //x - damage dealt y - headshots z - Large Zed kills
	var Vector TopWeapon2Info;
	var Vector TopWeapon3Info;

	structdefaultproperties
	{
		TopWeapon1=255
		TopWeapon2=255
		TopWeapon3=255
	}
};

struct AARAward
{
	var name IconPath;
	var string TitleIdentifier;			//used for localization localized when sent to menu
	var string DescriptionIdentifier; 	//used for localization localized when sent to menu
	var string ValueIdentifier;		//used for localization localized when sent to menu
	var int DisplayValue;
	var bool bHighLight;
	var PlayerReplicationInfo PRI; //WhoEarned this award
};

var array<AARAward> TeamAwardList;

enum ETeamAwards
{
	ETA_MedicineMaster,
	ETA_ZedSlayer,
	ETA_Enforcer,
	ETA_Destroyer,
	ETA_GiantSlayer,
	ETA_MoneyBags,
	ETA_HeadPopper,
	ETA_Dominator
};

enum EPersonalBests
{
	EPB_KnifeKills,  //single player
	EPB_PistolKills, //single player
	EPB_HeadShots,
	EPB_Healing,
	EPB_Kills,
	EPB_Assists,
	EPB_LargeZedKill,
	EPB_Dosh,
	EPB_DoorWelding
};

var array<AARAward> PersonalBestList;

var TopWeaponReplicationInfo TWRI;

/**********************************************
// @Dialogue
**********************************************/
var int 	ZedsKilledLastWave;

/**********************************************
// @AAR
**********************************************/
//From Vector 1 on WaveReplicationInfo
var int		TotalHeadShots;		//AAR			// Take to client side
var int		TotalDoshEarned;     //dialog		1
var int		TotalDamageDealt; 	//AAR //Client

//From Vector 2 on WaveReplicationInfo
var int		TotalDamageTaken; //dialog
var int 	TotalAmountHealGiven; //dialog
var int 	TotalAmountHealReceived; //dialog

var int		TotalLargeZedKills;

var bool bKilledBoss;

struct ZedKillType
{
	var Class<KFPawn_Monster> MonsterClass;
	var int KillCount;
};

struct WeaponDamage
{
	var byte 	DamageTypeID;
	var int 	DamageAmount;
	var int 	HeadShots;
	var int 	LargeZedKills;
	var int 	Kills; //This var is client side only

	StructDefaultProperties
	{
		DamageTypeID=255
	}
};

struct PerkXPGain
{
	var Class<KFPerk> PerkClass;
	var int XPDelta;
	var int SecondaryXPGain;
	var float StartXPPercentage;
	var int StartLevel;
};

var array<PerkXPGain> PerkXPList;
var array<WeaponDamage> WeaponDamageList;
var array<ZedKillType> ZedKillsArray;

var array<Name> AARWeaponList;

function RecordIntStat(int StatID, int Value)
{
	switch (StatID)
	{
		case MATCH_EVENT_HEADSHOT:
			IncrementHeadShotsInWave(Value);
			break;
	
		case MATCH_EVENT_DOSH_EARNED:
			IncrementDoshEarnedInWave(Value);
			break;

		case MATCH_EVENT_DAMAGE_DEALT:
			IncrementDamageDealtInWave(Value);
			break;

		case MATCH_EVENT_DAMAGE_TAKEN:
			IncrementDamageTakenInWave(Value);
			break;

		case MATCH_EVENT_HEAL_GIVEN:
			IncrementHealGivenInWave(Value);
			break;

		case MATCH_EVENT_HEAL_RECEIVED:
			IncrementHealReceivedInWave(Value);
			break;
	}
}

//var Vector 	VectData1; //used for compressing data //X:HeadShots Y:Dosh Earned Z:Damage Dealt
//var Vector 	VectData2;	//used for compressing data //Damage Taken, Heals Received, Heals Given

function IncrementHeadShotsInWave(int Delta)
{
	PWRI.VectData1.X += Delta;
}

function int GetHeadShotsInWave()
{
	return PWRI.VectData1.X;
}

function IncrementDoshEarnedInWave(int Delta)
{
	PWRI.VectData1.Y += Delta;
}

function int GetDoshEarnedInWave()
{
	return PWRI.VectData1.Y;
}

function IncrementDamageDealtInWave(int Delta)
{
	PWRI.VectData1.Z += Delta;
}

function int GetDamageDealtInWave()
{
	return PWRI.VectData1.Z;
}

function IncrementDamageTakenInWave(int Delta)
{
	PWRI.VectData2.X += Delta;
}

function int GetDamageTakenInWave()
{
	return PWRI.VectData2.X;
}

function IncrementHealReceivedInWave(int Delta)
{
	PWRI.VectData2.Y += Delta;
}

function int GetHealReceivedInWave()
{
	return PWRI.VectData2.Y;
}

function IncrementHealGivenInWave(int Delta)
{
	PWRI.VectData2.Z += Delta;
}

function int GetHealGivenInWave()
{
	return PWRI.VectData2.Z;
}

//Called at the end of the wave. @Note - End of wave is also called with the loss condition is met.  This includes at trader time.  
function RecordWaveInfo()
{
	
		TotalHeadShots			+= GetHeadShotsInWave();
		TotalDoshEarned 		+= GetDoshEarnedInWave();
		TotalAmountHealGiven 	+= GetHealGivenInWave();
	    TotalAmountHealReceived	+= GetHealReceivedInWave();
	    TotalDamageTaken 		+= GetDamageTakenInWave();;
	    TotalDamageDealt 		+= GetDamageDealtInWave();
	if(IsLocalPlayerController())
	{
	    ResetLastWaveInfo();
	}
}

function RecordPerkXPGain(class<KFPerk> PerkClass, int XPDelta)
{
	local int index;
	local PerkXPGain TempPerkXPItem;
	
	index = PerkXPList.Find('PerkClass', PerkClass);

	if(index == INDEX_NONE)
	{
		TempPerkXPItem.PerkClass 			= PerkClass;

		TempPerkXPItem.StartLevel			= GetPerkLevelFromPerkList(PerkClass);
		TempPerkXPItem.StartXPPercentage	= GetPerkLevelProgressPercentage(PerkClass);
		TempPerkXPItem.XPDelta 				+= XPDelta;

		PerkXPList.AddItem(TempPerkXPItem);
	}
	else
	{
		PerkXPList[index].XPDelta += XPDelta;
	}
}

function RecordSecondaryXPGain(class<KFPerk> PerkClass, int XPDelta)
{
	local int index;
	
	index = PerkXPList.Find('PerkClass', PerkClass);
	if( index != INDEX_NONE )
	{
		PerkXPList[index].SecondaryXPGain += XPDelta;
	}
	
}

function RecordZedKill(Class<Pawn> PawnClass, class<DamageType> DT)
{
	local int index;
	local ZedKillType TempZedKillType;
	local class<KFDamageType> KFDT;
	local class<KFPawn_Monster> MonsterClass;

	MonsterClass = Class<KFPawn_Monster>(PawnClass);

	KFDT = class<KFDamageType>(DT);
	if(KFDT != none)
	{
		//record the kill to the weapon here
		RecordWeaponKill(KFDT.default.AARWeaponID);
	}

	if(MonsterClass != none)
	{
		if(MonsterClass.static.IsLargeZed())
		{
			TotalLargeZedKills++;
		}

		index = ZedKillsArray.Find('MonsterClass', MonsterClass);
		
		if(index == INDEX_NONE)
		{
			TempZedKillType.MonsterClass = MonsterClass;
			TempZedKillType.KillCount++;
			ZedKillsArray.AddItem(TempZedKillType);
		}
		else
		{
			ZedKillsArray[index].KillCount++;
		}
	}
}

static function RecordWeaponHeadShot(Controller InstigatedBy, class<DamageType> WeaponDamageType)
{
	local int WeaponIndex;
	local WeaponDamage TempWeaponDamage;
	local KFPlayerController KFPC;
	local Class<KFDamageType> KFDT;

	if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal(nameof(RecordWeaponHeadShot));

	KFPC = KFPlayerController(InstigatedBy);
	KFDT = class<KFDamageType>(WeaponDamageType);
	if(KFPC != none && KFPC.MatchStats != none)
	{
		if(KFPC!= none && KFPC.MatchStats != none ){KFPC.MatchStats.RecordIntStat(class'EphemeralMatchStats'.const.MATCH_EVENT_HEADSHOT,1);};
		if(KFDT != none)
		{
			WeaponIndex = KFPC.MatchStats.WeaponDamageList.Find('DamageTypeID', KFDT.default.AARWeaponID);
			if(WeaponIndex == INDEX_NONE)
			{
				TempWeaponDamage.DamageTypeID = KFDT.default.AARWeaponID;
				TempWeaponDamage.HeadShots++;
				KFPC.MatchStats.WeaponDamageList.AddItem(TempWeaponDamage);
			}
			else
			{
				KFPC.MatchStats.WeaponDamageList[WeaponIndex].HeadShots++;
			}	
		}
	}
}

static function RecordWeaponDamage(Controller InstigatedBy, Byte AARWeaponID, int Damage, KFPawn TargetPawn, int HitZoneIdx)
{
	local KFPlayerController KFPC;

	if(InstigatedBy == none )
	{
		return;
	}

	KFPC = KFPlayerController(InstigatedBy);
	if(KFPC != none && KFPC.MatchStats != none)
	{
		KFPC.MatchStats.InternalRecordWeaponDamage(AARWeaponID, Damage, TargetPawn, HitZoneIdx);
	}	
}

function RecordWeaponKill(Byte AARWeaponID)
{
	local int WeaponIndex;
	local WeaponDamage TempWeaponDamage;

	WeaponIndex = WeaponDamageList.Find('DamageTypeID', AARWeaponID);
	if(WeaponIndex == INDEX_NONE)
	{
		TempWeaponDamage.DamageTypeID = AARWeaponID;
		TempWeaponDamage.Kills++;
		WeaponDamageList.AddItem(TempWeaponDamage);
	}
	else
	{
		WeaponDamageList[WeaponIndex].Kills++;
	}
}

/**
 * Record weapon damage 
 * Network: Server
 */								
function InternalRecordWeaponDamage(Byte AARWeaponID, int Damage, KFPawn TargetPawn, int HitZoneIdx)
{
	local int WeaponIndex;
	local WeaponDamage TempWeaponDamage;
	local bool bLargeZedKill;
	local bool bKilled;

	if(Role != ROLE_Authority || !TargetPawn.isA('KFPawn_Monster') )
	{
		return;
	}
	
	bKilled = TargetPawn.Health <= 0 && (TargetPawn.Health + Damage > 0);
	bLargeZedKill = bKilled && TargetPawn.IsLargeZed();

	WeaponIndex = WeaponDamageList.Find('DamageTypeID', AARWeaponID);
	if(WeaponIndex == INDEX_NONE)
	{
		TempWeaponDamage.DamageTypeID = AARWeaponID;
		WeaponIndex= WeaponDamageList.Length;
		WeaponDamageList.AddItem(TempWeaponDamage);
	}

	if(WeaponDamageList[WeaponIndex].DamageTypeID == AARWeaponID)
	{
		if(TargetPawn.Health + Damage > 0)
		{
			RecordIntStat(MATCH_EVENT_DAMAGE_DEALT, Damage);
			WeaponDamageList[WeaponIndex].DamageAmount += Damage;
		}
		if(bLargeZedKill)
		{
			WeaponDamageList[WeaponIndex].LargeZedKills++;	
		}
		return;
	}
}

/**
 * for sendig weapon stats to client
 * Network: Server
 */								
function PackTopWeapons()
{
	local array<WeaponDamage> TopWeaponsArray;
	local int i;

	GetTopWeapons(3, TopWeaponsArray);
	for (i = 0; i < 3; i++)
	{
		if( i >= TopWeaponsArray.length )
		{
			return;
		}		

		switch (i)
		{
			case 0:
				TWRI.TopWeapon1 = TopWeaponsArray[i].DamageTypeID;
		
				TWRI.TopWeapon1Info.x = TopWeaponsArray[i].DamageAmount;
				TWRI.TopWeapon1Info.y = TopWeaponsArray[i].HeadShots;
				TWRI.TopWeapon1Info.z = TopWeaponsArray[i].LargeZedKills;	
				break;
		
			case 1:
				TWRI.TopWeapon2 = TopWeaponsArray[i].DamageTypeID;
		
				TWRI.TopWeapon2Info.x = TopWeaponsArray[i].DamageAmount;
				TWRI.TopWeapon2Info.y = TopWeaponsArray[i].HeadShots;
				TWRI.TopWeapon2Info.z = TopWeaponsArray[i].LargeZedKills;	
				break;

			case 2:
				TWRI.TopWeapon3 = TopWeaponsArray[i].DamageTypeID;
		
				TWRI.TopWeapon3Info.x = TopWeaponsArray[i].DamageAmount;
				TWRI.TopWeapon3Info.y = TopWeaponsArray[i].HeadShots;
				TWRI.TopWeapon3Info.z = TopWeaponsArray[i].LargeZedKills;	
				break;				
		}
		
	}
}

/**
 * for translating weapon stats from packed struct
 * Network: Local Player
 */								
function UnpackTopWeapons(TopWeaponReplicationInfo TopWeapons)
{
	TWRI = TopWeapons;
	//We are a client so clear the top weapons
	if( TWRI.TopWeapon1 != 255)
	{
		AddUnpackedWeaponToDamageList(TWRI.TopWeapon1, TWRI.TopWeapon1Info.x, TWRI.TopWeapon1Info.y, TWRI.TopWeapon1Info.z);
	}

	if( TWRI.TopWeapon2 != 255)
	{
		AddUnpackedWeaponToDamageList(TWRI.TopWeapon2, TWRI.TopWeapon2Info.x, TWRI.TopWeapon2Info.y, TWRI.TopWeapon2Info.z);	
	}

	if( TWRI.TopWeapon3 != 255)
	{
		AddUnpackedWeaponToDamageList(TWRI.TopWeapon3, TWRI.TopWeapon3Info.x, TWRI.TopWeapon3Info.y, TWRI.TopWeapon3Info.z);
	}
}

function ProcessTopWeaponsStats()
{
	if( Role == ROLE_Authority )
	{	
		//Update struct to make it replicate
		PackTopWeapons();
		ReceiveTopWeapons(TWRI);
	}
}

/**
 * Add the weapons replicated by sever to client's list
 * Network: Local Player
 */								
function AddUnpackedWeaponToDamageList(byte WeaponID, int DamageAmount, int HeadShots, int LargeZedKills)
{
	local WeaponDamage TempWeaponDamage;
	local int WeaponIndex;

	WeaponIndex = WeaponDamageList.Find('DamageTypeID', WeaponID);
	if(WeaponIndex == INDEX_NONE)
	{
		TempWeaponDamage.DamageAmount = DamageAmount;
		TempWeaponDamage.HeadShots 		= HeadShots;
		TempWeaponDamage.LargeZedKills 	= LargeZedKills;

		WeaponDamageList.AddItem(TempWeaponDamage);
	}
	else
	{
		WeaponDamageList[WeaponIndex].DamageTypeID 	= WeaponID;
		WeaponDamageList[WeaponIndex].DamageAmount 	= DamageAmount;
		WeaponDamageList[WeaponIndex].HeadShots 		= HeadShots;
		WeaponDamageList[WeaponIndex].LargeZedKills 	= LargeZedKills;
	}
	
}

/**
 * for reading the weapon stats back
 * Network: Local Player
 */								
function GetWeaponInfo(name WeaponName, out string LocalizeWeaponName, out string WeaponIconSource)
{
	local KFGameReplicationInfo KFGRI;
	local KFGFxObject_TraderItems TraderItems;
	local array<SPerkTraderList> TraderItemList;
	local int i, j;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	if(KFGRI == none && KFGRI.TraderItems == none)
	{
		return;
	}



	TraderItems = KFGRI.TraderItems;
	TraderItemList = TraderItems.TraderItemList;
	//Get the perk
	for (i = 0; i < TraderItemList.length; i++)
	{
		if(TraderItemList[i].GrenadeItem.ClassName == WeaponName)
		{
			//Grenade Item
			TraderItems.GetGrenadeItemInfo(TraderItemList[i].PerkClass, "KFGameContent."$WeaponName, LocalizeWeaponName, WeaponIconSource );
			return;
		}

		//For each weapon item
		for (j = 0; j < TraderItemList[i].ItemList.length; j++)
		{
			//Add name to list
			if(TraderItemList[i].ItemList[j].ClassName == WeaponName)
			{
				TraderItems.GetItemInfo(TraderItemList[i].ItemList[j].AssociatedPerkClass, "KFGameContent."$WeaponName, LocalizeWeaponName, WeaponIconSource );
				return;
			}
		}
	}

	//Fince the item was not found on a perk list, it must be an off perk item.
	TraderItems.GetOffPerkItem("KFGameContent."$WeaponName, LocalizeWeaponName, WeaponIconSource );
}

function GetTopWeapons(int AmountToGrab, out array<WeaponDamage> TopWeaponList)
{
	local int i;
	//Sort
	WeaponDamageList.Sort(SortWeapons);

	//Grab first 3 in list (Top 3)
	for (i = 0; i < WeaponDamageList.length; i++)
	{
		if(i < AmountToGrab)
		{
			if(WeaponDamageList[i].DamageTypeID == 255)
			{
				WeaponDamageList.Remove(i--, 1);
			}
			else
			{
				TopWeaponList.AddItem(WeaponDamageList[i]);
			}
		}
		
	}
}
											//AAR INDEX
function ResolveLocalizedWeaponNameAndIcon(Byte WeaponDamageItemID, out string LocalizedWeaponName, out string WeaponIconSource)
{
	local name WeaponName;

	if(WeaponDamageItemID < AARWeaponList.length)
	{
		WeaponName = AARWeaponList[WeaponDamageItemID];
		GetWeaponInfo(WeaponName, LocalizedWeaponName, WeaponIconSource);
	}
}

delegate int SortXP(PerkXPGain A, PerkXPGain B)
{
	return A.XPDelta < B.XPDelta ? -1 : 0;
}

delegate int SortWeapons(WeaponDamage A, WeaponDamage B)
{
	return A.DamageAmount < B.DamageAmount ? -1 : 0;
}

/**
 * 
 * Network: Server Only
 */								
static function ProcessPostGameStats()
{
	local int i,j;
	local Array<KFPlayerController> KFPCArray;
	local KFPlayerController KFPC;
	local WorldInfo WI;
	local AARAward TempAwardObject;

	WI = Class'WorldInfo'.Static.GetWorldInfo();

	foreach WI.AllControllers(class'KFPlayerController', KFPC)
	{
		if(KFPC != none)
		{
			KFPCArray.AddItem(KFPC);

			KFPC.MatchStats.ProcessTopWeaponsStats();
		}
	}		
		
	for (i = 0; i < ETA_Max; i++)
	{
		GetTeamAward(ETeamAwards(i), TempAwardObject, KFPCArray);
		for (j = 0; j < KFPCArray.Length; j++)
		{
			KFPCArray[j].ClientReceiveAwardInfo(i, TempAwardObject.PRI, TempAwardObject.DisplayValue);		
		}
		TempAwardObject.PRI = none;
		TempAwardObject.DisplayValue = 0;
	}
}

static function SendMapOptionsAndOpenAARMenu()
{
	local WorldInfo WI;
	local KFPlayerController KFPC;
	local KFPlayerReplicationInfo KFPRI;
	local KFGameInfo KFGI;
	local int i;

	WI = Class'WorldInfo'.Static.GetWorldInfo();

	KFGI = KFGameInfo(WI.Game);

	foreach WI.AllControllers(class'KFPlayerController', KFPC)
	{
		KFPRI = KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo);
		for (i = 0; i < KFGI.GameMapCycles[KFGI.ActiveMapCycle].Maps.length; i++)
	    {	
			if(KFPRI != none)
			{
				KFPRI.RecieveAARMapOption(KFGI.GameMapCycles[KFGI.ActiveMapCycle].Maps[i]);
			}
		}
		KFPC.ClientOpenPostGameMenu();
	}
}

function GetPersonalBests(out Array<AARAward> PersonalBests)
{
	//Kills with a Knife
	PersonalBests.AddItem( GivePersonalBestKnifeKills() );
	//Kills with a Pistol
	PersonalBests.AddItem( GivePersonalBestPistolKills() );
	//Healing (derived from heals to others, only)
	PersonalBests.AddItem( GivePersonalBestHealing() );
	//Kills
	PersonalBests.AddItem( GivePersonalBestKills() );
	//Assists
	PersonalBests.AddItem( GivePersonalBestAssists() );
	//Large Zed Kills
	PersonalBests.AddItem( GivePersonalBestLargeZedKills() );
	//Dosh Earned
	PersonalBests.AddItem( GivePersonalBestDoshEarned() );
	//Headshots
	PersonalBests.AddItem( GivePersonalBestHeadShots() );
}

function int GetPistolKills()
{
	local int WeaponIndex;

	WeaponIndex = WeaponDamageList.Find('DamageTypeID', 0);
	if(WeaponIndex != INDEX_NONE)
	{
		return WeaponDamageList[WeaponIndex].Kills;
	}

	return 0;
}

function int GetKnifeKills()
{
	local int WeaponIndex;
	
	WeaponIndex = WeaponDamageList.Find('DamageTypeID', 3);
	if(WeaponIndex != INDEX_NONE)
	{
		return WeaponDamageList[WeaponIndex].Kills;
	}

	return 0;
}

//solo
function AARAward GivePersonalBestKnifeKills()
{
	local int Value,KnifeKills;
	Value = GetPersonalBest(EPB_KnifeKills);
	KnifeKills = GetKnifeKills();

	if(Value < KnifeKills)
	{
		PersonalBestList[EPB_KnifeKills].DisplayValue = KnifeKills;
		PersonalBestList[EPB_KnifeKills].bHighLight = true;
		
		SavePersonalBest(EPB_KnifeKills,KnifeKills);
	}
	else
	{
		PersonalBestList[EPB_KnifeKills].DisplayValue = Value;
	}

	return PersonalBestList[EPB_KnifeKills];
}

//solo
function AARAward GivePersonalBestPistolKills()
{
	local int Value, PistolKills;
	Value = GetPersonalBest(EPB_PistolKills);
	PistolKills = GetPistolKills();

	if(Value < PistolKills)
	{
		PersonalBestList[EPB_PistolKills].DisplayValue = PistolKills;
		PersonalBestList[EPB_PistolKills].bHighLight = true;
		
		SavePersonalBest(EPB_PistolKills,PistolKills);
	}
	else
	{
		PersonalBestList[EPB_PistolKills].DisplayValue = Value;
	}

	return PersonalBestList[EPB_PistolKills];
}


//solo/multiplayer
function AARAward GivePersonalBestHeadShots()
{
	local int Value;
	Value = GetPersonalBest(EPB_HeadShots);
	
	if(Value < TotalHeadShots)
	{
		PersonalBestList[EPB_HeadShots].DisplayValue = TotalHeadShots;
		PersonalBestList[EPB_HeadShots].bHighLight = true;
		
		SavePersonalBest(EPB_HeadShots,TotalHeadShots);
	}
	else
	{
		PersonalBestList[EPB_HeadShots].DisplayValue = Value;
	}

	return PersonalBestList[EPB_HeadShots];
}

//multiplayer
function AARAward GivePersonalBestHealing()
{
	local int Value;
	Value = GetPersonalBest(EPB_Healing);
	
	if(Value < TotalAmountHealGiven)
	{
		PersonalBestList[EPB_Healing].DisplayValue = TotalAmountHealGiven;
		PersonalBestList[EPB_Healing].bHighLight = true;
		
		SavePersonalBest(EPB_Healing,TotalAmountHealGiven);
	}
	else
	{
		PersonalBestList[EPB_Healing].DisplayValue = Value;
	}

	return PersonalBestList[EPB_Healing];
}

//multiplayer
function AARAward GivePersonalBestLargeZedKills()
{
	local int Value;
	Value = GetPersonalBest(EPB_LargeZedKill);

	if(Value < TotalLargeZedKills)
	{
		PersonalBestList[EPB_LargeZedKill].DisplayValue = TotalLargeZedKills;
		PersonalBestList[EPB_LargeZedKill].bHighLight = true;
		
		SavePersonalBest(EPB_LargeZedKill,TotalLargeZedKills);
	}
	else
	{
		PersonalBestList[EPB_LargeZedKill].DisplayValue = Value;
	}

	return PersonalBestList[EPB_LargeZedKill];
}

//multiplayer
function AARAward GivePersonalBestDoshEarned()
{
	local int Value;

	Value = GetPersonalBest(EPB_Dosh);

	if(Value < TotalDoshEarned)
	{
		PersonalBestList[EPB_Dosh].DisplayValue = TotalDoshEarned;
		PersonalBestList[EPB_Dosh].bHighLight = true;
		
		SavePersonalBest(EPB_Dosh,TotalDoshEarned);
	}
	else
	{
		PersonalBestList[EPB_Dosh].DisplayValue = Value;
	}

	return PersonalBestList[EPB_Dosh];
}

//multiplayer
function AARAward GivePersonalBestKills()
{
	local int Value;

	Value = GetPersonalBest(EPB_Kills);

	if(Value < PlayerReplicationInfo.Kills)
	{
		PersonalBestList[EPB_Kills].DisplayValue = PlayerReplicationInfo.Kills;
		PersonalBestList[EPB_Kills].bHighLight = true;
		
		SavePersonalBest(EPB_Kills,PlayerReplicationInfo.Kills);
	}
	else
	{
		PersonalBestList[EPB_Kills].DisplayValue = Value;
	}

	return PersonalBestList[EPB_Kills];
}

//multiplayer
function AARAward GivePersonalBestAssists()
{
	local int Value;
	local KFPlayerReplicationInfo KFPRI;

	KFPRI = KFPlayerReplicationInfo(PlayerReplicationInfo);

	Value = GetPersonalBest(EPB_Assists);

	if(Value < KFPRI.Assists)
	{
		PersonalBestList[EPB_Assists].DisplayValue = KFPRI.Assists;
		PersonalBestList[EPB_Assists].bHighLight = true;
		
		SavePersonalBest(EPB_Assists,KFPRI.Assists);
	}
	else
	{
		PersonalBestList[EPB_Assists].DisplayValue = Value;
	}

	return PersonalBestList[EPB_Assists];
}

//multiplayer
function AARAward GivePersonalBestDoorWelding()
{
	local int Value;

	Value = GetPersonalBest(EPB_DoorWelding);

	if(true)
	{
		PersonalBestList[EPB_DoorWelding].DisplayValue = Value;
		PersonalBestList[EPB_DoorWelding].bHighLight = true;
		
		SavePersonalBest(EPB_DoorWelding,Value);
	}
	else
	{
		PersonalBestList[EPB_DoorWelding].DisplayValue = Value;
	}

	return PersonalBestList[EPB_DoorWelding];
}

static function GetTeamAward(ETeamAwards AwardIndex, out AARAward TempAwardObject, const out Array<KFPlayerController> KFPCArray)
{
	switch (AwardIndex)
	{
		case ETA_MedicineMaster:
		if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal("Attempting to get ETA_MedicineMaster");
			Give_MedicineMaster(TempAwardObject, KFPCArray);
			break;
		case ETA_ZedSlayer:
		if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal("Attempting to get ETA_ZedSlayer");
			Give_ZedSlayer(TempAwardObject, KFPCArray);
			break;
		case ETA_Enforcer:
		if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal("Attempting to get ETA_Enforcer");
			Give_Enforcer(TempAwardObject, KFPCArray);
			break;
		case ETA_Destroyer:
		if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal("Attempting to get ETA_Destroyer");
			Give_Destroyer(TempAwardObject, KFPCArray);
			break;
		case ETA_GiantSlayer:
		if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal("Attempting to get ETA_GiantSlayer");
			Give_GiantSlayer(TempAwardObject, KFPCArray);
			break;
		case ETA_MoneyBags:
		if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal("Attempting to get ETA_MoneyBags");
			Give_MoneyBags(TempAwardObject, KFPCArray);
			break;
		case ETA_HeadPopper:
		if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal("Attempting to get ETA_HeadPopper");
			Give_HeadPopper(TempAwardObject, KFPCArray);
			break;
		case ETA_Dominator:
		if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal("Attempting to get ETA_Dominator");
			Give_Dominator(TempAwardObject, KFPCArray);
			break;			
	}
}

//most healing
static function Give_MedicineMaster(out AARAward outAward, const out Array<KFPlayerController> KFPCArray)
{
	local int i;

	For(i = 0; i < KFPCArray.Length; i++)
	{
		if(KFPCArray[i].MatchStats != none)
		{
			if(KFPCArray[i].MatchStats.TotalAmountHealGiven > outAward.DisplayValue)
			{
				outAward.PRI = KFPCArray[i].PlayerReplicationInfo;
				outAward.DisplayValue = KFPCArray[i].MatchStats.TotalAmountHealGiven;
				//Gives away award
				if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal(KFPCArray[i].PlayerReplicationInfo.PlayerName @KFPCArray[i].MatchStats.TotalAmountHealGiven);
			}
		}
	}
}

//most zed kills
static function Give_ZedSlayer(out AARAward outAward, const out Array<KFPlayerController> KFPCArray)
{
	local KFPlayerReplicationInfo KFPRI;
	local int i;

	For(i = 0; i < KFPCArray.Length; i++)
	{
		KFPRI = KFPlayerReplicationInfo(KFPCArray[i].PlayerReplicationInfo);
		if(KFPRI.Kills > outAward.DisplayValue)
		{
			outAward.PRI = KFPRI;
			outAward.DisplayValue = KFPRI.Kills;
			if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal(KFPCArray[i].PlayerReplicationInfo.PlayerName @KFPRI.Kills);
		}
	}
}

//most assists
static function Give_Enforcer(out AARAward outAward, const out Array<KFPlayerController> KFPCArray)
{
	local KFplayerReplicationInfo KFPRI;
	local int i;

	For(i = 0; i < KFPCArray.Length; i++)
	{
		KFPRI = KFPlayerReplicationInfo(KFPCArray[i].PlayerReplicationInfo);
		if(KFPRI.Assists > outAward.DisplayValue)
		{
			outAward.PRI = KFPRI;
			outAward.DisplayValue = KFPRI.Assists;
			if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal(KFPCArray[i].PlayerReplicationInfo.PlayerName @KFPRI.Assists);
		}
	}
}

//most damage
static function Give_Destroyer(out AARAward outAward, const out Array<KFPlayerController> KFPCArray)
{
	local int i;

	For(i = 0; i < KFPCArray.Length; i++)
	{
		if(KFPCArray[i].MatchStats != none)
		{
			if(KFPCArray[i].MatchStats.TotalDamageDealt > outAward.DisplayValue)
			{
				outAward.PRI = KFPCArray[i].PlayerReplicationInfo;
				outAward.DisplayValue = KFPCArray[i].MatchStats.TotalDamageDealt;
				if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal(KFPCArray[i].PlayerReplicationInfo.PlayerName @KFPCArray[i].MatchStats.TotalDamageDealt);
			}
		}
	}
}

//most large zed kills
static function Give_GiantSlayer(out AARAward outAward, const out Array<KFPlayerController> KFPCArray)
{
	local int i;

	For(i = 0; i < KFPCArray.Length; i++)
	{
		if(KFPCArray[i].MatchStats != none)
		{
			if(KFPCArray[i].MatchStats.TotalLargeZedKills > outAward.DisplayValue)
			{
				outAward.PRI = KFPCArray[i].PlayerReplicationInfo;
				outAward.DisplayValue = KFPCArray[i].MatchStats.TotalLargeZedKills;
				if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal(KFPCArray[i].PlayerReplicationInfo.PlayerName @KFPCArray[i].MatchStats.TotalLargeZedKills);
			}
		}
	}
}

//most dosh earned
static function Give_MoneyBags(out AARAward outAward, const out Array<KFPlayerController> KFPCArray)
{
	local int i;

	For(i = 0; i < KFPCArray.Length; i++)
	{
		if(KFPCArray[i].MatchStats != none)
		{
			if(KFPCArray[i].MatchStats.TotalDoshEarned > outAward.DisplayValue)
			{
				outAward.PRI = KFPCArray[i].PlayerReplicationInfo;
				outAward.DisplayValue = KFPCArray[i].MatchStats.TotalDoshEarned;
				if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal(KFPCArray[i].PlayerReplicationInfo.PlayerName @KFPCArray[i].MatchStats.TotalDoshEarned);
			}
		}
	}
}

//most head shots
static function Give_HeadPopper(out AARAward outAward, const out Array<KFPlayerController> KFPCArray)
{
	local int i;

	For(i = 0; i < KFPCArray.Length; i++)
	{
		if(KFPCArray[i].MatchStats != none)
		{
			if(KFPCArray[i].MatchStats.TotalHeadShots > outAward.DisplayValue)
			{
				outAward.PRI = KFPCArray[i].PlayerReplicationInfo;
				outAward.DisplayValue = KFPCArray[i].MatchStats.TotalHeadShots;
				if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal(KFPCArray[i].PlayerReplicationInfo.PlayerName @KFPCArray[i].MatchStats.TotalHeadShots);
			}
		}
	}
}

//Final hit on boss
static function Give_Dominator(out AARAward outAward, const out Array<KFPlayerController> KFPCArray)
{
	local int i;
	For(i = 0; i < KFPCArray.Length; i++)
	{
		if(KFPCArray[i].MatchStats != none)
		{
			if(KFPCArray[i].MatchStats.bKilledBoss)
			{
				outAward.PRI = KFPCArray[i].PlayerReplicationInfo;
				outAward.DisplayValue = 1;
				if (class'EphemeralMatchStats'.default.bShowMatchStatsLogging) LogInternal(KFPCArray[i].PlayerReplicationInfo.PlayerName @"Killed boss");
				return;
			}
		}
	}
}

function ReceiveAwardInfo(byte AwardID, PlayerReplicationInfo PRI, int Value)
{
	TeamAwardList[AwardID].PRI = PRI;
	TeamAwardList[AwardID].DisplayValue = Value;
}

defaultproperties
{
   TeamAwardList(0)=(IconPath="UI_Award_Team.UI_Award_Team-Healing",TitleIdentifier="MedicineMaster",ValueIdentifier="MedicineMasterValue")
   TeamAwardList(1)=(IconPath="UI_Award_Team.UI_Award_Team-Kills",TitleIdentifier="ZedSlayer",ValueIdentifier="ZedSlayerValue")
   TeamAwardList(2)=(IconPath="UI_Award_Team.UI_Award_Team-Assists",TitleIdentifier="Enforcer",ValueIdentifier="EnforcerValue")
   TeamAwardList(3)=(IconPath="UI_Award_Team.UI_Award_Team-Damage",TitleIdentifier="Destroyer",ValueIdentifier="DestroyerValue")
   TeamAwardList(4)=(IconPath="UI_Award_Team.UI_Award_Team-Giants",TitleIdentifier="GiantSlayer",ValueIdentifier="GiantSlayerValue")
   TeamAwardList(5)=(IconPath="UI_Award_Team.UI_Award_Team-Dosh",TitleIdentifier="MoneyBags",ValueIdentifier="MoneyBagsValue")
   TeamAwardList(6)=(IconPath="UI_Award_Team.UI_Award_Team-Headshots",TitleIdentifier="HeadPopper",ValueIdentifier="HeadPopperValue")
   TeamAwardList(7)=(IconPath="UI_Award_Team.UI_Award_Team-BossKO",TitleIdentifier="Dominator",ValueIdentifier="DominatorValue")
   PersonalBestList(0)=(IconPath="UI_Award_PersonalSolo.UI_Award_PersonalSolo-Knife",TitleIdentifier="EPB_KnifeKills",ValueIdentifier="EPB_KnifeKillsValue")
   PersonalBestList(1)=(IconPath="UI_Award_PersonalSolo.UI_Award_PersonalSolo-Pistol",TitleIdentifier="EPB_PistolKills",ValueIdentifier="EPB_PistolKillsValue")
   PersonalBestList(2)=(IconPath="UI_Award_PersonalMulti.UI_Award_PersonalMulti-Headshots",TitleIdentifier="EPB_HeadShots",ValueIdentifier="EPB_HeadShotsValue")
   PersonalBestList(3)=(IconPath="UI_Award_PersonalMulti.UI_Award_PersonalMulti-Healing",TitleIdentifier="EPB_Healing",ValueIdentifier="EPB_HealingValue")
   PersonalBestList(4)=(IconPath="UI_Award_PersonalMulti.UI_Award_PersonalMulti-Kills",TitleIdentifier="EPB_Kills",ValueIdentifier="EPB_KillsValue")
   PersonalBestList(5)=(IconPath="UI_Award_PersonalMulti.UI_Award_PersonalMulti-Assists",TitleIdentifier="EPB_Assists",ValueIdentifier="EPB_AssistsValue")
   PersonalBestList(6)=(IconPath="UI_Award_PersonalMulti.UI_Award_PersonalMulti-Giants",TitleIdentifier="EPB_LargeZedKill",ValueIdentifier="EPB_LargeZedKillValue")
   PersonalBestList(7)=(IconPath="UI_Award_PersonalMulti.UI_Award_PersonalMulti-Dosh",TitleIdentifier="EPB_Dosh",ValueIdentifier="EPB_DoshValue")
   PersonalBestList(8)=(IconPath="ui_weaponselect_tex.UI_WeaponSelect_Welder",TitleIdentifier="EPB_DoorWelding",ValueIdentifier="EPB_DoorWeldingValue")
   TWRI=(TopWeapon1=255,TopWeapon2=255,TopWeapon3=255)
   AARWeaponList(0)="KFWeap_Pistol_9mm"
   AARWeaponList(1)="KFWeap_Pistol_Dual9mm"
   AARWeaponList(2)="KFWeap_Edged_Katana"
   AARWeaponList(3)="KFWeap_Knife_Commando"
   AARWeaponList(4)="KFWeap_Blunt_Crovel"
   AARWeaponList(5)="KFWeap_Shotgun_Nailgun"
   AARWeaponList(6)="KFWeap_Blunt_Pulverizer"
   AARWeaponList(7)="KFWeap_Eviscerator"
   AARWeaponList(8)="KFProj_EMPGrenade"
   AARWeaponList(9)="KFProj_HEGrenade"
   AARWeaponList(10)="KFWeap_AssaultRifle_AR15"
   AARWeaponList(11)="KFWeap_AssaultRifle_Bullpup"
   AARWeaponList(12)="KFWeap_AssaultRifle_AK12"
   AARWeaponList(13)="KFWeap_AssaultRifle_SCAR"
   AARWeaponList(14)="KFProj_DynamiteGrenade"
   AARWeaponList(15)="KFWeap_GrenadeLauncher_HX25"
   AARWeaponList(16)="KFWeap_Thrown_C4"
   AARWeaponList(17)="KFWeap_GrenadeLauncher_M79"
   AARWeaponList(18)="KFWeap_RocketLauncher_RPG7"
   AARWeaponList(19)="KFProj_MedicGrenade"
   AARWeaponList(20)="KFWeap_Knife_FieldMedic"
   AARWeaponList(21)="KFWeap_Pistol_Medic"
   AARWeaponList(22)="KFWeap_SMG_Medic"
   AARWeaponList(23)="KFWeap_Shotgun_Medic"
   AARWeaponList(24)="KFWeap_AssaultRifle_Medic"
   AARWeaponList(25)="NA"
   AARWeaponList(26)="KFWeap_Pistol_Deagle"
   AARWeaponList(27)="NA"
   AARWeaponList(28)="NA"
   AARWeaponList(29)="NA"
   AARWeaponList(30)="NA"
   AARWeaponList(31)="NA"
   AARWeaponList(32)="NA"
   AARWeaponList(33)="NA"
   AARWeaponList(34)="NA"
   AARWeaponList(35)="KFProj_FragGrenade"
   AARWeaponList(36)="KFWeap_Shotgun_MB500"
   AARWeaponList(37)="KFWeap_Shotgun_DoubleBarrel"
   AARWeaponList(38)="KFWeap_Shotgun_M4"
   AARWeaponList(39)="KFWeap_Shotgun_AA12"
   AARWeaponList(40)="NA"
   AARWeaponList(41)="KFWeap_SMG_P90"
   AARWeaponList(42)="NA"
   AARWeaponList(43)="NA"
   AARWeaponList(44)="NA"
   AARWeaponList(45)="KFProj_MolotovGrenade"
   AARWeaponList(46)="KFWeap_Flame_CaulkBurn"
   AARWeaponList(47)="KFWeap_Shotgun_DragonsBreath"
   AARWeaponList(48)="KFWeap_Flame_Flamethrower"
   AARWeaponList(49)="KFWeap_Beam_Microwave"
   AARWeaponList(50)="KFWeap_Edged_Zweihander"
   Name="Default__EphemeralMatchStats"
   ObjectArchetype=Object'Core.Default__Object'
}
