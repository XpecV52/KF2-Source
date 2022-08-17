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
	var class<KFWeaponDefinition> TopWeapon1;
	var class<KFWeaponDefinition> TopWeapon2;
	var class<KFWeaponDefinition> TopWeapon3;

	var Vector TopWeapon1Info; //x - damage dealt y - headshots z - Large Zed kills
	var Vector TopWeapon2Info;
	var Vector TopWeapon3Info;
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
	var class<KFWeaponDefinition> 	WeaponDef;
	var int 						DamageAmount;
	var int 						HeadShots;
	var int 						LargeZedKills;
	var int 						Kills; //This var is client side only
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
		RecordWeaponKill(KFDT.default.WeaponDef);
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
			WeaponIndex = KFPC.MatchStats.WeaponDamageList.Find('WeaponDef', KFDT.default.WeaponDef);
			if(WeaponIndex == INDEX_NONE)
			{
				TempWeaponDamage.WeaponDef = KFDT.default.WeaponDef;
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

static function RecordWeaponDamage(Controller InstigatedBy, class<KFWeaponDefinition> WeaponDef, int Damage, KFPawn TargetPawn, int HitZoneIdx)
{
	local KFPlayerController KFPC;

	if(InstigatedBy == none )
	{
		return;
	}

	KFPC = KFPlayerController(InstigatedBy);
	if(KFPC != none && KFPC.MatchStats != none)
	{
		KFPC.MatchStats.InternalRecordWeaponDamage(WeaponDef, Damage, TargetPawn, HitZoneIdx);
	}	
}

function RecordWeaponKill(class<KFWeaponDefinition> WeaponDef)
{
	local int WeaponIndex;
	local WeaponDamage TempWeaponDamage;

	WeaponIndex = WeaponDamageList.Find('WeaponDef', WeaponDef);
	if(WeaponIndex == INDEX_NONE)
	{
		TempWeaponDamage.WeaponDef = WeaponDef;
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
function InternalRecordWeaponDamage(class<KFWeaponDefinition> WeaponDef, int Damage, KFPawn TargetPawn, int HitZoneIdx)
{
	local int WeaponIndex;
	local WeaponDamage TempWeaponDamage;
	local bool bLargeZedKill;
	local bool bKilled;
	local int PreHealth;

	if(Role != ROLE_Authority || !TargetPawn.isA('KFPawn_Monster') )
	{
		return;
	}
	
	bKilled = TargetPawn.Health <= 0 && (TargetPawn.Health + Damage > 0);
	bLargeZedKill = bKilled && TargetPawn.IsLargeZed();

	WeaponIndex = WeaponDamageList.Find('WeaponDef', WeaponDef);
	if(WeaponIndex == INDEX_NONE)
	{
		TempWeaponDamage.WeaponDef = WeaponDef;
		WeaponIndex= WeaponDamageList.Length;
		WeaponDamageList.AddItem(TempWeaponDamage);
	}

	if(WeaponDamageList[WeaponIndex].WeaponDef == WeaponDef)
	{
		PreHealth = TargetPawn.Health + Damage;
		
		if ( TargetPawn.Health > 0 ) 
		{
			// damage has already been applied and zed is still standing, record it all
			RecordIntStat(MATCH_EVENT_DAMAGE_DEALT, Damage);
			WeaponDamageList[WeaponIndex].DamageAmount += Damage;
		}
		else if ( PreHealth > 0 ) 
		{
			// Zed has taken terminal damage, only record the difference to remove overkill counting
			RecordIntStat(MATCH_EVENT_DAMAGE_DEALT, PreHealth );
			WeaponDamageList[WeaponIndex].DamageAmount += PreHealth;
		}
		
		if(bLargeZedKill)
		{
			WeaponDamageList[WeaponIndex].LargeZedKills++;	
		}
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
				TWRI.TopWeapon1 = TopWeaponsArray[i].WeaponDef;
		
				TWRI.TopWeapon1Info.x = TopWeaponsArray[i].DamageAmount;
				TWRI.TopWeapon1Info.y = TopWeaponsArray[i].HeadShots;
				TWRI.TopWeapon1Info.z = TopWeaponsArray[i].LargeZedKills;	
				break;
		
			case 1:
				TWRI.TopWeapon2 = TopWeaponsArray[i].WeaponDef;
		
				TWRI.TopWeapon2Info.x = TopWeaponsArray[i].DamageAmount;
				TWRI.TopWeapon2Info.y = TopWeaponsArray[i].HeadShots;
				TWRI.TopWeapon2Info.z = TopWeaponsArray[i].LargeZedKills;	
				break;

			case 2:
				TWRI.TopWeapon3 = TopWeaponsArray[i].WeaponDef;
		
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
	if( TWRI.TopWeapon1 != none )
	{
		AddUnpackedWeaponToDamageList(TWRI.TopWeapon1, TWRI.TopWeapon1Info.x, TWRI.TopWeapon1Info.y, TWRI.TopWeapon1Info.z);
	}

	if( TWRI.TopWeapon2 != none )
	{
		AddUnpackedWeaponToDamageList(TWRI.TopWeapon2, TWRI.TopWeapon2Info.x, TWRI.TopWeapon2Info.y, TWRI.TopWeapon2Info.z);	
	}

	if( TWRI.TopWeapon3 != none )
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
function AddUnpackedWeaponToDamageList(class<KFWeaponDefinition> WeaponDef, int DamageAmount, int HeadShots, int LargeZedKills)
{
	local WeaponDamage TempWeaponDamage;
	local int WeaponIndex;

	WeaponIndex = WeaponDamageList.Find('WeaponDef', WeaponDef);
	if(WeaponIndex == INDEX_NONE)
	{
		TempWeaponDamage.DamageAmount = DamageAmount;
		TempWeaponDamage.HeadShots 		= HeadShots;
		TempWeaponDamage.LargeZedKills 	= LargeZedKills;

		WeaponDamageList.AddItem(TempWeaponDamage);
	}
	else
	{
		WeaponDamageList[WeaponIndex].WeaponDef 		= WeaponDef;
		WeaponDamageList[WeaponIndex].DamageAmount 		= DamageAmount;
		WeaponDamageList[WeaponIndex].HeadShots 		= HeadShots;
		WeaponDamageList[WeaponIndex].LargeZedKills 	= LargeZedKills;
	}
	
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
			if(WeaponDamageList[i].WeaponDef == None)
			{
				WeaponDamageList.Remove(i, 1);
				i -= 1;
			}
			else
			{
				TopWeaponList.AddItem(WeaponDamageList[i]);
			}
		}
		
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
	local int TotalPistolKills;

	// 9mm
	WeaponIndex = WeaponDamageList.Find('WeaponDef', class'KFWeapDef_9mm');
	if(WeaponIndex != INDEX_NONE)
	{
		TotalPistolKills += WeaponDamageList[WeaponIndex].Kills;
	}

	// Remington 1858
	WeaponIndex = WeaponDamageList.Find('WeaponDef', class'KFWeapDef_Remington1858');
	if(WeaponIndex != INDEX_NONE)
	{
		TotalPistolKills += WeaponDamageList[WeaponIndex].Kills;
	}

	// Colt 1911
	WeaponIndex = WeaponDamageList.Find('WeaponDef', class'KFWeapDef_Colt1911');
	if(WeaponIndex != INDEX_NONE)
	{
		TotalPistolKills += WeaponDamageList[WeaponIndex].Kills;
	}

	// Desert Eagle
	WeaponIndex = WeaponDamageList.Find('WeaponDef', class'KFWeapDef_Deagle');
	if(WeaponIndex != INDEX_NONE)
	{
		TotalPistolKills += WeaponDamageList[WeaponIndex].Kills;
	}

	// S&W .500 Magnum
	WeaponIndex = WeaponDamageList.Find('WeaponDef', class'KFWeapDef_SW500');
	if(WeaponIndex != INDEX_NONE)
	{
		TotalPistolKills += WeaponDamageList[WeaponIndex].Kills;
	}

	// Medic pistol
	WeaponIndex = WeaponDamageList.Find('WeaponDef', class'KFWeapDef_MedicPistol');
	if(WeaponIndex != INDEX_NONE)
	{
		TotalPistolKills += WeaponDamageList[WeaponIndex].Kills;
	}

	return TotalPistolKills;
}

function int GetKnifeKills()
{
	local int TotalKnifeKills, i;
	
	for (i = 0; i < WeaponDamageList.Length; i++)
	{
		if(WeaponDamageList[i].WeaponDef != none && class<KFweapDef_Knife_Base>(WeaponDamageList[i].WeaponDef) != none)
		{
			TotalKnifeKills += WeaponDamageList[i].Kills;
		}
	}

	return TotalKnifeKills;
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
   Name="Default__EphemeralMatchStats"
   ObjectArchetype=Object'Core.Default__Object'
}
