//=============================================================================
// KFPerk
//=============================================================================
// Base class for the KF2 perks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFPerk extends ReplicationInfo
	config(game)
	native
	nativereplication;

const KFMAX_Perks = 					10;

 
const VIEWID_KFGameStats =				1;

 
const STATID_None 			 =			0;

 
const STATID_Cmdo_Progress	 =			1;
const STATID_Cmdo_Build      =				2;

 
const STATID_Bsrk_Progress	 =			10;
const STATID_Bsrk_Build		 =			11;

 
const STATID_Sup_Progress	 =				20;
const STATID_Sup_Build		 =			21;
const STATID_Sup_WeldPoints	 =			22;

 
const STATID_Fire_Progress	 =			30;
const STATID_Fire_Build		 =			31;

 
const STATID_Medic_Progress		 =		40;
const STATID_Medic_Build	 =				41;
const STATID_Medic_HealPoints =				42;

 
const STATID_Shrp_Progress	 =			50;
const STATID_Shrp_Build		 =			51;

 
const STATID_Demo_Progress	=			60;
const STATID_Demo_Build		=			61;

 
const STATID_Surv_Progress	 =			70;
const STATID_Surv_Build		 =			71;

 
const STATID_Guns_Progress	 =			80;
const STATID_Guns_Build		 =			81;

 
const STATID_SWAT_Progress	 =			90;
const STATID_SWAT_Build		 =			91;

 
const STATID_Kills 			 =			200;
const STATID_StalkerKills 	 =			201;
const STATID_CrawlerKills 	 =			202;
const STATID_FleshpoundKills	 =			203;

 
const STATID_SpecialEventProgress =     300;
const STATID_WeeklyEventProgress =      301;
const STATID_DailyEventInfo =           302;
const STATID_DailyEventIDs =            303;
const STATID_DailyEventStats1 =         304;
const STATID_DailyEventStats2 =         305;

 
const STATID_DoshVaultTotal =           400;
const STATID_LastViewedDoshVaultTotal = 401;
const STATID_DoshVaultProgress =		402;

 
const STATID_AchievementPlaceholder	 =	500;

 
const STATID_AnalyticsPlaceholder	 =		800;

 
const STATID_PersonalBest_KnifeKills =		2000;
const STATID_PersonalBest_PistolKills	 =	2001;
const STATID_PersonalBest_HeadShots	 =		2002;
const STATID_PersonalBest_Healing	 =		2003;
const STATID_PersonalBest_Kills	 =		2004;
const STATID_PersonalBest_Assists =			2005;
const STATID_PersonalBest_LargeZedKill =	2006;
const STATID_PersonalBest_Dosh =			2007;

 
const STATID_MatchWins =					3000;

 
const STATID_DingoAchievementStart	= 4000;
const STATID_ACHIEVE_MrPerky5		= 4001;
const STATID_ACHIEVE_MrPerky10		= 4002;
const STATID_ACHIEVE_MrPerky15		= 4003;
const STATID_ACHIEVE_MrPerky20		= 4004;
const STATID_ACHIEVE_MrPerky25		= 4005;

const STATID_ACHIEVE_HardWins		= 4015;
const STATID_ACHIEVE_SuicidalWins	= 4016;
const STATID_ACHIEVE_HellWins		= 4017;

const STATID_ACHIEVE_VSZedWins		= 4009;
const STATID_ACHIEVE_VSHumanWins	= 4010;

const STATID_ACHIEVE_HoldOut			= 4011;
const STATID_ACHIEVE_DieVolter			= 4012;
const STATID_ACHIEVE_FleshPoundKill		= 4013;
const STATID_ACHIEVE_ShrikeKill			= 4014;
const STATID_ACHIEVE_SirenKill			= 4018;
const STATID_ACHIEVE_Benefactor			= 4019;
const STATID_ACHIEVE_HealTeam			= 4020;
const STATID_ACHIEVE_QuickOnTheTrigger	= 4033;

const STATID_ACHIEVE_CollectCatacolmbs		= 4021;
const STATID_ACHIEVE_BioticsCollectibles	= 4022;
const STATID_ACHIEVE_EvacsCollectibles		= 4023;
const STATID_ACHIEVE_OutpostCollectibles	= 4024;
const STATID_ACHIEVE_PrisonCollectibles		= 4025;
const STATID_ACHIEVE_ManorCollectibles		= 4026;
const STATID_ACHIEVE_ParisCollectibles		= 4027;
const STATID_ACHIEVE_FarmhouseCollectibles	= 4028;
const STATID_ACHIEVE_BlackForestCollectibles= 4029;
const STATID_ACHIEVE_ContainmentStationCollectibles	= 4030;
const STATID_ACHIEVE_InfernalRealmCollectibles		= 4031;
const STATID_ACHIEVE_HostileGroundsCollectibles		= 4032;
const STATID_ACHIEVE_ZedLandingCollectibles			= 4035;
const STATID_ACHIEVE_DescentCollectibles			= 4036;
const STATID_ACHIEVE_NukedCollectibles				= 4037;
const STATID_ACHIEVE_TragicKingdomCollectibles		= 4038;
const STATID_ACHIEVE_NightmareCollectibles			= 4039;
const STATID_ACHIEVE_KrampusCollectibles			= 4040;
const STATID_ACHIEVE_ArenaCollectibles				= 4041;
const STATID_ACHIEVE_PowercoreCollectibles			= 4042;
 
#linenumber 15

const	SKILLFLAG_0					= 0x1;
const	SKILLFLAG_1					= 0x2;
const	SKILLFLAG_2					= 0x4;
const	SKILLFLAG_3					= 0x8;
const 	SKILLFLAG_4					= 0x10;
const	SKILLFLAG_5					= 0x20;
const 	SKILLFLAG_6					= 0x40;
const 	SKILLFLAG_7					= 0x80;
const	SKILLFLAG_8					= 0x100;
const	SKILLFLAG_9					= 0x200;

const 	SKILL_NONE					= 0;
const 	SKILL_1						= 1;
const 	SKILL_2						= 2;

/** Stat ID of xp value for this perk */
var private const int 				ProgressStatID;
var private const int 				PerkBuildStatID;

/** Skill Tiers **/
const RANK_1_LEVEL		= 5;
const RANK_2_LEVEL		= 10;
const RANK_3_LEVEL		= 15;
const RANK_4_LEVEL		= 20;
const RANK_5_LEVEL		= 25;
const UNLOCK_INTERVAL	= 5;

var	const 	int						SecondaryXPModifier[4];
/*********************************************************************************************
* Localization
********************************************************************************************* */
var	localized 	string 	PerkName;

struct native PassivePerk
{
	var localized string Title;
	var localized string Description;
	var string IconPath;
};
var array<PassivePerk> Passives;

var localized string SkillCatagories[5];
var localized string EXPAction1; //The first line description of how specific classes get EXP
var localized string EXPAction2; //The second line description of how specific classes get EXP
var localized string LevelString;

/** The location of this perks icon */
var Texture2D 		PerkIcon;
var array<string> 	ColumnOneIcons;
var array<string> 	ColumnTwoIcons;
var Texture2D 		InteractIcon;

var localized string WeaponDroppedMessage;
/*********************************************************************************************
* Skill related vars
********************************************************************************************* */
struct native PerkSkill
{
	var() 	editconst 			string			Name;
	var()	const				float			Increment;
	var		const				byte			Rank;
	var()	const				float			StartingValue;
	var()	const				float			MaxValue;
	var()	const				float			ModifierValue;
	var()   const 				string 			IconPath;
	var()						bool 			bActive;
};

var private const float 	AssistDoshModifier;

var array<PerkSkill> 		PerkSkills;

var 	protected	byte 	SelectedSkills[5];

var()	const	float		RegenerationInterval;			// Duration till next RegenerationAmount
var()	const	int			RegenerationAmount;             // Amount health given per RegenerationIntervall
var				float 		TimeUntilNextRegen;

var 	const 	float 		BarrageDamageModifier;
var 	const 	float 		FormidableDamageModifier;
var 	const 	float 		VaccinationDuration;

struct native BuffedPlayerInfo
{
	var()	int				PreBuffValue;
	var()	KFPawn_Human	BuffedPawn;
};

var 			array<BuffedPlayerInfo>		BuffedPlayerInfos;

// This trigger is created to allow other players to interact with your perk abilities
var 			KFUsablePerkTrigger 		InteractionTrigger;

var		const	array<Name>		ZedTimeModifyingStates;

var protected	array<byte>		BodyPartsCanStumble;
var protected	array<byte>		BodyPartsCanKnockDown;

/*********************************************************************************************
* Special abilities
********************************************************************************************* */
var 			bool		bCanSeeCloakedZeds;
var()	const	float		SignatureDamageScale;
var()	const	float		SignatureRecoilScale;

var				int			CurrentAbilityPoints;
var				byte		MaxAbilityPoints;

/*********************************************************************************************
* Temporary abilities
********************************************************************************************* */
var				bool 		bHasTempSkill_TacticalReload;

/*********************************************************************************************
* Shared Skills
********************************************************************************************* */
var()	const			PerkSkill			TacticalReload;				// Reload speed modifier Only set the StartValue
var 	protected const	class<KFDamageType>	ToxicDmgTypeClass;

/*********************************************************************************************
* Loading
********************************************************************************************* */
var	const 	protected	byte	CurrentLevel;
var	const 	protected	byte	CurrentPrestigeLevel;
var			int					SavedBuild;

/** Initialization */
var	const 	bool				bInitialized;

/*********************************************************************************************
* Inventory
********************************************************************************************* */

/** The weapon class string used to load the weapon class for this perk */
var class<KFWeaponDefinition> PrimaryWeaponDef;
var class<KFWeaponDefinition> SecondaryWeaponDef;

/** default starting knife */
var class<KFWeaponDefinition> KnifeWeaponDef;

/** perk specific grenade class */
var class<KFWeaponDefinition> GrenadeWeaponDef;

/** The grenade archetype for this perk. Don't set directly in defaultprops. Set the GrenadeClassName so it will be dynamically loaded */
var class<KFProj_Grenade> 		GrenadeClass;

/** The number of grenades this perk spawns with */
var int 						InitialGrenadeCount;

/** The maximum number of grenades this perk can carry */
var int							MaxGrenadeCount;

/** The backup weapon damage types */
var array<name>	BackupWeaponDamageTypeNames;

var array<class<KFWeaponDefinition> > AutoBuyLoadOutPath;

/*********************************************************************************************
* Player Skill Trakcing
********************************************************************************************* */

/** How much to handicap this perk when calculating the player's accuracy */
var float 						HitAccuracyHandicap;

/** How much to handicap this perk when calculating the player's headshot accuracy */
var float 						HeadshotAccuracyHandicap;

/*********************************************************************************************
* Caching
********************************************************************************************* */
var 		KFPlayerReplicationInfo	MyPRI;
var 		KFGameInfo 				MyKFGI;
var 		KFGameReplicationInfo	MyKFGRI;
var 		KFPlayerController		OwnerPC;
var 		KFPawn_Human			OwnerPawn;

/** Debugging */
var	config bool	bLogPerk;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if( bNetDirty && bNetOwner )
        CurrentLevel, CurrentPrestigeLevel;
}

/**
 * @brief Let's make sure we have an owner apwn
 * @return We have a pawn....
 */
simulated final protected native function bool CheckOwnerPawn();

/*********************************************************************************************
* @name Loading/Saving
********************************************************************************************* */

native final function LoadPerk();
native static final function LoadTierUnlockFromConfig(class<KFPerk> PerkClass, out byte bTierUnlocked, out int UnlockedPerkLevel);
native static final function LoadPerkData();
native static final function SaveTierUnlockToConfig(class<KFPerk> PerkClass, byte bTierUnlocked, int PerkLevel);
native final function SaveBuildToStats( Class<KFPerk> PerkClass, int NewPerkBuild );
native final function SavePerkDataToConfig( Class<KFPerk> PerkClass, int NewPerkBuild );
reliable server final private native event ServerSetPerkBuild( int NewPerkBuild, byte ClientLevel, byte ClientPrestigeLevel);
reliable client final private native event ClientACK( bool bSuccess, byte AckLevel, Int PerkBuild );

/*********************************************************************************************
* @name Static
********************************************************************************************* */

native static simulated function int GetProgressStatID();
native static simulated function int GetPerkBuildStatID();

final static function class<KFPerk> GetPerkClass()
{
	return default.class;
}

/** returns concatenated string for analytics logging */
function string DumpPerkLoadout()
{
	local int i;
	local string Ret;

	Ret = "";

	for( i=0; i<5; i++ )
	{
		Ret $= SelectedSkills[i];
	}

	return Ret;
}

/**
 * @brief Grabs the AssociatedPerkClass from an actor
 *
 * @param WeaponActor Weapon or projectile
 * @return Weapon used
 */
static function KFWeapon GetWeaponFromDamageCauser( Actor WeaponActor )
{
	local KFWeapon KFW;

	if( WeaponActor != none )
	{
		if( WeaponActor.IsA('Weapon') )
		{
			KFW = KFWeapon(WeaponActor);
		}
		else if( WeaponActor.IsA('Projectile') )
		{
			KFW = KFWeapon(WeaponActor.Owner);
		}
		else if( WeaponActor.IsA('KFSprayActor') )
		{
			KFW = KFWeapon(WeaponActor.Base);
		}

		return KFW;
	}

	return none;
}

/**
 * @brief Grabs the AssociatedPerkClass from an actor
 *
 * @param WeaponActor The used weapon or projectile
 * @return the weapon's or projectile's perk class
 */
static function class<KFPerk> GetPerkFromDamageCauser( Actor WeaponActor, class<KFPerk> InstigatorPerkClass )
{
	local KFWeapon KFW;
	local KFProjectile KFPrj;

	KFW = KFWeapon(WeaponActor);
	KFPrj = KFProjectile(WeaponActor);

	if( WeaponActor != none && KFW == none )
	{
		if( KFPrj != none && KFPrj.AssociatedPerkClass == none )
		{
			KFW = KFWeapon(WeaponActor.Owner);
		}
		else if( KFPrj != none )
		{
			return GetPerkFromProjectile( WeaponActor );
		}
		else if( WeaponActor.IsA( 'SprayActor_Flame' ) )
			{
			return class'KFPerk_Firebug';
		}
		else if( WeaponActor.IsA( 'KFDoorActor' ) )
				{
			return class'KFPerk_Demolitionist';
			}
		}

		if( KFW != none ) // avoid accessed none if killed from cheat (killzeds, etc.)
		{
			return KFW.static.GetWeaponPerkClass( InstigatorPerkClass );
		}

	return none;
}

static function class<KFPerk> GetPerkFromProjectile( Actor WeaponActor  )
{
	local KFProjectile Proj;

	Proj = KFProjectile(WeaponActor);
	if( Proj != none )
	{
		return Proj.default.AssociatedPerkClass;
	}

	return none;
}

/**
 * @brief Returns true if the weapon is associated with this perk
 * @details Uses WeaponPerkClass if we do not have a spawned weapon (such as in the trader menu)
 *
 * @param W the weapon
 * @param WeaponPerkClass weapon's perk class (optional)
 *
 * @return true/false
 */
static simulated function bool IsWeaponOnPerk( KFWeapon W, optional array < class<KFPerk> > WeaponPerkClass, optional class<KFPerk> InstigatorPerkClass, optional name WeaponClassName )
{
	if( W != none )
	{
		return W.static.AllowedForAllPerks() || W.static.GetWeaponPerkClass( InstigatorPerkClass ) == default.Class;
	}
	else if( WeaponPerkClass.length > 0 )
	{
		return WeaponPerkClass.Find(default.Class) != INDEX_NONE;
	}

	return false;
}

/**
 * @brief DamageType on perk?
 *
 * @param KFDT The damage type
 * @return true/false
 */
static function bool IsDamageTypeOnPerk( class<KFDamageType> KFDT )
{
	if( KFDT != none )
	{
		return KFDT.default.ModifierPerkList.Find( default.class ) > INDEX_NONE;
	}

	return false;
}

/**
 * @brief Checks if a damage type is from valid perk backup weapon
 *
 * @param DT the damage type
 * @return true if valid damage type
 */
static function bool IsBackupDamageTypeOnPerk( class<DamageType> DT )
{
	if( DT != none )
	{
		return default.BackupWeaponDamageTypeNames.Find( DT.name ) > INDEX_NONE;
	}

	return false;
}

/**
 * @brief DamageType on passed in perk?
 *
 * @param KFDT The damage type
 * @param PerkClass The perk we are chking for
 * @return true/false
 */
static function bool IsDamageTypeOnThisPerk( class<KFDamageType> KFDT, class<KFPerk> PerkClass )
{
	if( KFDT != none )
	{
		return KFDT.default.ModifierPerkList.Find( PerkClass ) > INDEX_NONE ;
	}

	return false;
}

/**
 * @brief Multiplies the XP to get the right amount for a certain perk
 *
 * @param XP XP modified
 */
static function MultiplySecondaryXPPoints( out int XP, byte Difficulty )
{
	XP *= default.SecondaryXPModifier[Difficulty];
}

/**
 * @brief Return if a weapon qualifies a as backup weapon (9mm etc)
 *
 * @param KFW Weapon to check
 * @return true if backup weapon
 */
static function bool IsBackupWeapon( KFWeapon KFW )
{
	return KFW != none && KFW.default.bIsBackupWeapon;
}

/*********************************************************************************************
* @name	 Build / Level Management - Apply and save the updated build and level
********************************************************************************************* */
simulated function int GetCurrentPrestigeLevel()
{
	return CurrentPrestigeLevel;
}

/**
 * @brief Gets the perk's level
 * @return The perk's level
 */
simulated native function byte GetLevel();

/**
 * @brief Sets a perk's level
  *
 * @param NewLevel The new level
  */
simulated native function SetLevel( byte NewLevel );


simulated native function byte GetPrestigeLevel(byte NewLevel);
simulated native function SetPrestigeLevel(byte NewLevel);
static native final function int GetPrestigeRewardID(class<KFPerk> PerkClass, byte NewLvl);

/** Whether or not the passed in perk level is active.
 *      Value will be 0-9, which then should be converted to
 *      0-4 and compared against the GRI max value.
 */
simulated function bool IsPerkLevelAllowed(int PerkIndex)
{
    if (MyKFGRI != none)
    {
        return (PerkIndex / 2) <= MyKFGRI.MaxPerkLevel;
    }

    return true;
}

/**
 * @brief Callback that lets the perk know that its rank has been set or updated
 */
event PerkLevelUpdated()
{
    if( MyKFGI != none )
    {
        MyKFGI.GameConductor.UpdateAveragePerkRank();
    }
}

/**
 * @brief Applies the active skills and abilities to the perk
 */
simulated event UpdateSkills()
{
	local byte i, SkillIndex;

	// Apply perk skills
	for( i = 0; i < 5; i++ )
	{
		SkillIndex = i * 2;
		if( SkillIndex < PerkSkills.length )
		{
			PerkSkills[SkillIndex].bActive = SelectedSkills[i] == Skill_1;  //1
			PerkSkills[SkillIndex+1].bActive = SelectedSkills[i] == Skill_2;//2
		}
	}

	//At this point, pending skill changes have been applied.  Reset Pending Build to -1
	PostSkillUpdate();
	ApplySkillsToPawn();
}

/**
 * @brief Updates the selected perk
 * @details  Updates selected skills, packs them, sends it to the server, and saves to the cloud
 *
 * @param InSelectedSkills The skill array
 * @param PerkClass The perk's class
 */
simulated event UpdatePerkBuild( const out byte InSelectedSkills[5], class<KFPerk> PerkClass)
{
	local int NewPerkBuild;

	if( Controller(Owner).IsLocalController() )
	{
  		PackPerkBuild( NewPerkBuild, InSelectedSkills );
		ServerSetPerkBuild( NewPerkBuild, CurrentLevel, CurrentPrestigeLevel);
		SaveBuildToStats( PerkClass, NewPerkBuild );
		SavePerkDataToConfig( PerkClass, NewPerkBuild );
	}
}

/**
 * @brief Packs the slected skills into an int
 *
 * @param NewPerkBuild The new packed perk build
 * @param SelectedSkillsHolder Array of the perk's skills
 */
simulated event PackPerkBuild( out int NewPerkBuild, const out byte SelectedSkillsHolder[5] )
{
	PackSkill( NewPerkBuild, SelectedSkillsHolder[0], SKILLFLAG_0, SKILLFLAG_1 );
	PackSkill( NewPerkBuild, SelectedSkillsHolder[1], SKILLFLAG_2, SKILLFLAG_3 );
	PackSkill( NewPerkBuild, SelectedSkillsHolder[2], SKILLFLAG_4, SKILLFLAG_5 );
	PackSkill( NewPerkBuild, SelectedSkillsHolder[3], SKILLFLAG_6, SKILLFLAG_7 );
	PackSkill( NewPerkBuild, SelectedSkillsHolder[4], SKILLFLAG_8, SKILLFLAG_9 );
}

/**
 * @brief Packs 2 skills into an updated perk build int
 *
 * @param NewPerkBuild The updated perk build
 * @param SkillIndex Skil pair (0-4)
 * @param SkillFlag1 "left" skill
 * @param SkillFlag2 "right" skill Chris: This is kinda redundant @fixme?
 */
simulated event PackSkill( out int NewPerkBuild, byte SkillIndex, int SkillFlag1, int SkillFlag2 )
{
	if( SkillIndex == SKILL_1 )
	{
		NewPerkBuild = NewPerkBuild | SkillFlag1;
	}
	else if( SkillIndex == SKILL_2 )
	{
		NewPerkBuild = NewPerkBuild | SkillFlag2;
	}
}

/**
 * @brief Set the bytes for SelectedSkills and AbilityRanks on initialization of the perk
 *
 * @param NewPerkBuild The new passed in perk build
 */
simulated event SetPerkBuild( int NewPerkBuild )
{
	if( SavedBuild != NewPerkBuild )
	{
		SavedBuild = NewPerkBuild;
    }

	UnpackSkill( CurrentLevel, NewPerkBuild, 0, SKILLFLAG_0, SKILLFLAG_1, SelectedSkills );
    UnpackSkill( CurrentLevel, NewPerkBuild, 1, SKILLFLAG_2, SKILLFLAG_3, SelectedSkills );
    UnpackSkill( CurrentLevel, NewPerkBuild, 2, SKILLFLAG_4, SKILLFLAG_5, SelectedSkills );
    UnpackSkill( CurrentLevel, NewPerkBuild, 3, SKILLFLAG_6, SKILLFLAG_7, SelectedSkills );
    UnpackSkill( CurrentLevel, NewPerkBuild, 4, SKILLFLAG_8, SKILLFLAG_9, SelectedSkills );

   	UpdateSkills();
}

/**
 * @brief Get an unpacked array of skills
 *
 * @param PerkClass The perk class
 * @param NewPerkBuild passed in packed perk build
 * @param SelectedSkillsHolder array of skills
 */
simulated event GetUnpackedSkillsArray( Class<KFPerk> PerkClass, int NewPerkBuild,  out byte SelectedSkillsHolder[5] )
{
	local Byte PerkLevel;

	if( OwnerPC == none )
	{
		OwnerPC = KFPlayerController(Owner);
	}

	PerkLevel = OwnerPC.GetPerkLevelFromPerkList( PerkClass );

	UnpackSkill( PerkLevel, NewPerkBuild, 0, SKILLFLAG_0, SKILLFLAG_1, SelectedSkillsHolder );
	UnpackSkill( PerkLevel, NewPerkBuild, 1, SKILLFLAG_2, SKILLFLAG_3, SelectedSkillsHolder );
	UnpackSkill( PerkLevel, NewPerkBuild, 2, SKILLFLAG_4, SKILLFLAG_5, SelectedSkillsHolder );
	UnpackSkill( PerkLevel, NewPerkBuild, 3, SKILLFLAG_6, SKILLFLAG_7, SelectedSkillsHolder );
	UnpackSkill( PerkLevel, NewPerkBuild, 4, SKILLFLAG_8, SKILLFLAG_9, SelectedSkillsHolder );
}

/**
 * @brief Unpacks an individual skill from the SelectedSkills array to use
 *
 * @param PerkLevel Current perk level
 * @param NewPerkBuild The new perk build
 * @param SkillTier Skil pair (0-4)
 */
simulated function UnpackSkill( byte PerkLevel, int NewPerkBuild, byte SkillTier, int SkillFlag1, int SkillFlag2, out byte SelectedSkillsHolder[5] )
{
	local int SkillUnlockLevel;
	SkillUnlockLevel = RANK_1_LEVEL + UNLOCK_INTERVAL * SkillTier;

	if( SkillUnlockLevel <= PerkLevel )
	{
		if( (NewPerkBuild & SkillFlag1) > 0 )
		{
			SelectedSkillsHolder[SkillTier] = SKILL_1;
		}
		else if( (NewPerkBuild & SkillFlag2) > 0 )
		{
			SelectedSkillsHolder[SkillTier] = SKILL_2;
		}
		// If we've unlocked this skill, autoset it to 1
		else
		{
	        SelectedSkillsHolder[SkillTier] = SKILL_1;
		}
	}
	else
	{
		SelectedSkillsHolder[SkillTier] = SKILL_NONE;
	}
}

/**
 * @brief Applies skill specific changes after new skills were selected
  */
simulated protected event PostSkillUpdate()
{
	local Inventory Inv;
   	local KFWeapon KFW;
	local KFPawn_Human KFP;

    if( OwnerPC == none )
    {
    	OwnerPC = KFPlayerController(Owner);
    }

    KFP = KFPawn_Human(OwnerPC.Pawn);
    if( KFP != none && KFP.InvManager != none )
    {
		for( Inv = KFP.InvManager.InventoryChain; Inv != none; Inv = Inv.Inventory )
		{
			KFW = KFWeapon(Inv);
			if( KFW != none )
			{
				// Reinitialize ammo counts
				KFW.ReInitializeAmmoCounts(self);
	     	}
		}
	}

	PerkSetOwnerHealthAndArmor( false );
	ApplySkillsToPawn();
}

simulated static function GetPassiveStrings( out array<string> PassiveValues, out array<string> Increments, byte Level );

static simulated function float GetSkillValue( const PerkSkill Skill )
{
	return FMin( Skill.MaxValue, Skill.StartingValue );
}

static simulated function float GetPassiveValue( const out PerkSkill Skill, byte Level, optional float Divider=1.f)
{
	return FMin(Skill.MaxValue, Skill.StartingValue +  (float(Level) * Skill.Increment) / Divider);
}

static simulated event string GetPerkIconPath()
{
	local string PerkIconPath;

	PerkIconPath = PathName(default.PerkIcon);

	return PerkIconPath;
}

simulated final function int GetSavedBuild()
{
	return SavedBuild;
}
/*********************************************************************************************
* @name	 Spawning
********************************************************************************************* */

/** Called immediately before gameplay begins. */
simulated event PreBeginPlay()
{
    // Set the grenade class for this perk
    GrenadeClass = class<KFProj_Grenade>(DynamicLoadObject(GrenadeWeaponDef.default.WeaponClassPath, class'Class'));
    PerkIcon = Texture2D(DynamicLoadObject(GetPerkIconPath(), class'Texture2D'));

	MyKFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if( WorldInfo.Game != None )
	{
		MyKFGI = KFGameInfo(WorldInfo.Game);
	}

	if( OwnerPC == none )
    {
    	OwnerPC = KFPlayerController(Owner);
    }

	if( OwnerPC != none )
	{
		OwnerPC.SetPerkEffect( false );
	}
}

/** On spawn, modify owning pawn based on perk selection */
function SetPlayerDefaults(Pawn PlayerPawn)
{
	OwnerPawn = KFPawn_Human(PlayerPawn);
	bForceNetUpdate = TRUE;

	OwnerPC = KFPlayerController(Owner);
    if( OwnerPC != none )
    {
    	MyPRI = KFPlayerReplicationInfo(OwnerPC.PlayerReplicationInfo);
    }

    PerkSetOwnerHealthAndArmor( true );

	// apply all other pawn changes
	ApplySkillsToPawn();
}

/** On perk customization or change, modify owning pawn based on perk selection */
event NotifyPerkModified()
{
	PostLevelUp();
}

private simulated final function PerkSetOwnerHealthAndArmor( optional bool bModifyHealth )
{
	// don't allow clients to set health, since health/healthmax/playerhealth/playerhealthpercent is replicated
	if( Role != ROLE_Authority )
	{
		return;
	}

	if( CheckOwnerPawn() )
	{
		if( bModifyHealth )
		{
			OwnerPawn.Health = OwnerPawn.default.Health;
			ModifyHealth( OwnerPawn.Health );
		}

		OwnerPawn.HealthMax = OwnerPawn.default.Health;
		ModifyHealth( OwnerPawn.HealthMax );
		OwnerPawn.Health = Min( OwnerPawn.Health, OwnerPawn.HealthMax );

		if( OwnerPC == none )
		{
			OwnerPC = KFPlayerController(Owner);
		}

		MyPRI = KFPlayerReplicationInfo(OwnerPC.PlayerReplicationInfo);
		if( MyPRI != none )
		{
			MyPRI.PlayerHealth = OwnerPawn.Health;
			MyPRI.PlayerHealthPercent = FloatToByte( float(OwnerPawn.Health) / float(OwnerPawn.HealthMax) );
		}

		OwnerPawn.MaxArmor = OwnerPawn.default.MaxArmor;
		ModifyArmor( OwnerPawn.MaxArmor );
		OwnerPawn.Armor = Min( OwnerPawn.Armor,  OwnerPawn.MaxArmor );
	}
}

/** (Server) Modify Instigator settings based on selected perk */
function ApplySkillsToPawn()
{
	if( CheckOwnerPawn() )
	{
		OwnerPawn.UpdateGroundSpeed();
		OwnerPawn.bMovesFastInZedTime = false;

		if( MyPRI == none )
		{
			MyPRI = KFPlayerReplicationInfo(OwnerPawn.PlayerReplicationInfo);
		}

		MyPRI.bExtraFireRange = false;
		MyPRI.bSplashActive = false;
		MyPRI.bNukeActive = false;
		MyPRI.bConcussiveActive = false;
		MyPRI.PerkSupplyLevel = 0;

		ApplyWeightLimits();
	}
}

/**
 * We need to separate this from ApplySkillsToPawn() to avoid resetting weight limits (and losing weapons)
 * every time a skill or level is changed
 */
function ApplyWeightLimits()
{
	local KFInventoryManager KFIM;

	KFIM = KFInventoryManager( OwnerPawn.InvManager );
	if( KFIM != none )
	{
		KFIM.MaxCarryBlocks = KFIM.default.MaxCarryBlocks;
		CheckForOverWeight( KFIM );
	}
}

simulated function NotifyPawnTeamChanged()
{
	// @note: Instigator is not replicated yet so we're using Controller.Pawn
	//	Could add a repnotify and cache the pawn as soon we as get an instigator

	// Cache all the things
    OwnerPC = KFPlayerController(Owner);
    if( OwnerPC != none )
    {
    	MyPRI = KFPlayerReplicationInfo(OwnerPC.PlayerReplicationInfo);
    }
}

// Update pawn skills, abilities etc after a level up/change.
simulated event PostLevelUp()
{
	PerkSetOwnerHealthAndArmor();
	PostSkillUpdate();
	ApplySkillsToPawn();
}

/*********************************************************************************************
* @name	 Inventory
********************************************************************************************* */

/** @see GameInfo.AddDefaultInventory */
function AddDefaultInventory( KFPawn P )
{
	local KFInventoryManager KFIM;

	if( P != none && P.InvManager != none )
	{
		KFIM = KFInventoryManager(P.InvManager);
		if( KFIM != none )
		{
			//Grenades added on spawn
			KFIM.GiveInitialGrenadeCount();
		}

        if (KFGameInfo(WorldInfo.Game) != none)
        {
            if (KFGameInfo(WorldInfo.Game).AllowPrimaryWeapon(GetPrimaryWeaponClassPath()))
            {
                P.DefaultInventory.AddItem(class<Weapon>(DynamicLoadObject(GetPrimaryWeaponClassPath(), class'Class')));
            }
        }
        else
        {
            P.DefaultInventory.AddItem(class<Weapon>(DynamicLoadObject(GetPrimaryWeaponClassPath(), class'Class')));
        }
		// Secondary weapon is spawned through the pawn unless we want an additional one  not anymore
		P.DefaultInventory.AddItem(class<Weapon>(DynamicLoadObject(GetSecondaryWeaponClassPath(), class'Class')));
		P.DefaultInventory.AddItem(class<Weapon>(DynamicLoadObject(GetKnifeWeaponClassPath(), class'Class')));
	}
}

/* Returns the grenade class for this perk */
simulated function class< KFProj_Grenade > GetGrenadeClass()
{
    return GrenadeClass;
}

/* Returns the primary weapon's class path for this perk */
simulated function string GetPrimaryWeaponClassPath()
{
    return PrimaryWeaponDef.default.WeaponClassPath;
}

/* Returns the secondary weapon's class path for this perk */
simulated function string GetSecondaryWeaponClassPath()
{
    return SecondaryWeaponDef.default.WeaponClassPath;
}

/* Returns the knife's class path for this perk */
simulated function string GetKnifeWeaponClassPath()
{
    return KnifeWeaponDef.default.WeaponClassPath;
}

simulated function bool PerkNeedsTick(){ return false; }

/**
 * @brief Checks if the carrying cpacity has changed and drops weapons if needed
 *
 * @param KFIM The inventory manager
  */
protected function CheckForOverWeight( KFInventoryManager KFIM )
{
	local int OverWeight, BestWeight;
	local Inventory Inv;
	local KFWeapon BestWeapon, KFW;
	local array<class<KFWeapon> > DroppedWeaponClasses;
	local string TempString;
	local bool bDone;

	if( KFIM.CurrentCarryBlocks > KFIM.MaxCarryBlocks )
	{
		OverWeight = KFIM.CurrentCarryBlocks - KFIM.MaxCarryBlocks;

		for( Inv = OwnerPawn.InvManager.InventoryChain; Inv != none; Inv = Inv.Inventory )
		{
			KFW = KFWeapon(Inv);
			if( KFW != none && KFW.CanThrow() )
			{
				if( KFW.InventorySize == OverWeight )
				{
					DroppedWeaponClasses.AddItem( KFW.class );
					OwnerPawn.TossInventory( KFW );
					bDone = true;
				}
				else if( (BestWeight < 1 || BestWeapon == none) ||
						 (KFW.InventorySize > Overweight &&
						 KFW.InventorySize - Overweight < BestWeight) )
				{
					BestWeight = KFW.InventorySize - Overweight;
					BestWeapon = KFW;
				}
	     	}
		}

		if( !bDone )
		{
			if( BestWeapon == none )
			{
				for( Inv = OwnerPawn.InvManager.InventoryChain; Inv != none; Inv = Inv.Inventory )
				{
					KFW = KFWeapon(Inv);
					if( KFW != none && KFW.CanThrow() )
					{
						DroppedWeaponClasses.AddItem( KFW.class );
						OwnerPawn.TossInventory( KFW );

						if( KFIM.CurrentCarryBlocks <= KFIM.MaxCarryBlocks )
						{
							break;
						}
					}
				}
			}
			else
			{
				DroppedWeaponClasses.AddItem( BestWeapon.class );
				OwnerPawn.TossInventory( BestWeapon );
			}
		}

		TempString = BuildDroppedMessageString( DroppedWeaponClasses );
		OwnerPC.ClientMessage( Repl( WeaponDroppedMessage, "%%%%", TempString ));
	}
}

protected function string BuildDroppedMessageString( array<class<KFWeapon> > DroppedWeaponClasses )
{
	local int i;
	local String TempString;

	for( i = 0; i < DroppedWeaponClasses.Length; i++ )
	{
		TempString = TempString @ DroppedWeaponClasses[i].default.ItemName;
	}

	return TempString;
}

/*********************************************************************************************
* @name	 Gameplay
********************************************************************************************* */

/** old stuff, kept it to find old hook locations */
simulated function float GetCloakDetectionRange(){ return 0.0f; }
//simulated function float GetHealthBarDetectionRange(){ return 1.0f; }
simulated function float GetAwarenessDamageScale(){ return 1.0f; }
simulated function float GetSuppressingFireSnareScale(){ return 1.0f; }

/** shared functions */
/** Tactical Reload - Reloading rate increased */
simulated function float GetReloadRateScale(KFWeapon KFW) {return 1.f;}
/** Movement - all movement speeds increased */
simulated function ModifySpeed( out float Speed );
simulated function ModifySprintSpeed( out float Speed ){ ModifySpeed( Speed ); }
function FinalizeSpeedVariables();
/** Kickback - recaoil bonus */
simulated function ModifyRecoil( out float CurrentRecoilModifier, KFWeapon KFW );
/** Allow perk to adjust damage given */
function ModifyDamageGiven( out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx );
function ModifyDamageTaken( out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy );
/** Ammunition capacity and mag count increased */
simulated function ModifyMagSizeAndNumber( KFWeapon KFW, out byte MagazineCapacity, optional array< Class<KFPerk> > WeaponPerkClass, optional bool bSecondary=false, optional name WeaponClassname );
/** Update our weapons spare ammo count, *Use WeaponPerkClass for the trader when no weapon actually exists */
simulated function ModifySpareAmmoAmount( KFWeapon KFW, out int PrimarySpareAmmo, optional const out STraderItem TraderItem, optional bool bSecondary=false );
/** Set our weapon's spare ammo to maximum (needed another function besides ModifySpareAmmoAmount because we need to be able to specify maximum somehow) */
simulated function MaximizeSpareAmmoAmount( array< Class<KFPerk> > WeaponPerkClass, out int PrimarySpareAmmo, int MaxPrimarySpareAmmo );
/** Update our weapons Max spare ammo count, *Use WeaponPerkClass for the trader when no weapon actually exists */
simulated function ModifyMaxSpareAmmoAmount( KFWeapon KFW, out int MaxSpareAmmo, optional const out STraderItem TraderItem, optional bool bSecondary=false );
/** Determines if a modified magazine size affects the spare ammo capacity of a weapon */
simulated function bool ShouldMagSizeModifySpareAmmo( KFWeapon KFW, optional Class<KFPerk> WeaponPerkClass ) { return false; }
/** Fortitude - max health goes up*/
function ModifyHealth( out int InHealth );
static simulated function float GetZedTimeExtension( byte Level ){ return 1.0f; }
function float GetKnockdownPowerModifier( optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting=false ){ return 0.f; }
function float GetStumblePowerModifier( optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart ){ return 0.f; }
function float GetStunPowerModifier( optional class<DamageType> DamageType, optional byte HitZoneIdx ){ return 0.f; }
function float GetReactionModifier( optional class<KFDamageType> DamageType ){ return 1.f; }
simulated function float GetSnarePowerModifier( optional class<DamageType> DamageType, optional byte HitZoneIdx ){ return 1.f; }
function GameExplosion GetExplosionTemplate(){ return none; }
function bool ShouldGetAllTheXP(){ return false; }

/** Support functions */
/** Welding Proficiency - faster welding/unwelding */
simulated function ModifyWeldingRate( out float FastenRate, out float UnfastenRate );
simulated function bool CanInteract( KFPawn_Human KFPH ){ return false; }
simulated function Interact( KFPawn_Human KFPH );
simulated function float GetPenetrationModifier( byte Level, class<KFDamageType> DamageType, optional bool bForce );
static function float GetBarrageDamageModifier(){ return default.BarrageDamageModifier; }
simulated function float GetTightChokeModifier(){ return 1.f; }

/** Commando functions */
simulated function bool IsCallOutActive(){ return false; }
simulated function bool IsShootAndMoveActive(){ return false; }
simulated function bool HasNightVision(){ return false; }
simulated protected function bool IsRapidFireActive(){ return false; }
simulated function float GetZedTimeModifier( KFWeapon W ){ return 0.f; }
simulated function ModifySpread( out float InSpread );

/** Berserker functions */
function ModifyMeleeAttackSpeed( out float InDuration, KFWeapon KFW );
function ModifyScreamEffectDuration( out float InDuration );
function bool CanNotBeGrabbed(){ return false; }
function bool CanEarnSmallRadiusKillXP( class<DamageType> DT ){ return false; }
function ModifyHardAttackDamage( out int InDamage );
function ModifyLightAttackDamage( out int InDamaghe );
simulated function SetSuccessfullBlock();
simulated function SetSuccessfullParry();
function AddVampireHealth( KFPlayerController KFPC, class<DamageType> DT );
function bool ShouldKnockdown();
function bool IsUnAffectedByZedTime(){ return false; }
simulated event bool ShouldUseFastInstigatorDilation(KFWeapon Weap){ return false; }

/** Medic functions */
function ModifyHealerRechargeTime( out float RechargeRate );
function bool ModifyHealAmount( out float HealAmount ){ return false; };
function ModifyArmor( out byte MaxArmor );
simulated function float GetArmorDiscountMod(){ return 1; }
native function bool CanRepairDoors();
function bool RepairArmor( Pawn HealTarget );
function bool IsToxicDmgActive() { return false; }
static function class<KFDamageType> GetToxicDmgTypeClass(){ return default.ToxicDmgTypeClass; }
static function ModifyToxicDmg( out int ToxicDamage );
simulated function float GetSirenScreamStrength(){ return 1.f; }
simulated function bool IsHealingSurgeActive(){ return false; }
simulated function float GetSelfHealingSurgePct(){ return 0.f; }
simulated function bool GetHealingSpeedBoostActive(){ return false; }
simulated function bool GetHealingDamageBoostActive(){ return false; }
simulated function bool GetHealingShieldActive(){ return false; }
simulated function bool IsSlugActive(){ return false; }


/** Firebug functions */
simulated function bool IsFlarotovActive(){ return false; }
function ModifyDoTScaler( out float DoTScaler, optional class<KFDamageType> KFDT, optional bool bNapalmInfected );
function bool GetFireStumble( optional KFPawn KFP, optional class<DamageType> DamageType ){ return false; }
function bool CanSpreadNapalm(){ return false; }
function bool CouldBeZedShrapnel( class<KFDamageType> KFDT ){ return false; }
simulated function bool ShouldShrapnel(){ return  false; }
simulated function float GetSplashDamageModifier(){ return 1.f; }
simulated function bool IsRangeActive(){ return false; }

/** Demo functions */
simulated function bool IsOnContactActive(){ return false; }
simulated function bool IsSharedExplosiveResistaneActive(){ return false; }
simulated function bool ShouldSacrifice(){ return false; }
simulated function bool ShouldRandSirenResist(){ return false; }
simulated function bool CanExplosiveWeld(){ return false; }
simulated function float GetAoERadiusModifier(){ return 1.f; }
simulated function float GetAoEDamageModifier(){ return 1.f; }
simulated function bool DoorShouldNuke(){ return false; }
simulated function bool ShouldGetDaZeD( class<KFDamageType> DamageType ){ return false; }
simulated function float GetDaZedEMPPower(){ return 0; }
simulated function bool ShouldNeverDud(){ return false; }
simulated function SetLastHX25NukeTime( float NewTime );
simulated function float GetLastHX25NukeTime() { return 0.f; }

/** "Rack 'em Up" perk skill functions (Gunslinger, Sharpshooter) */
simulated function bool GetIsUberAmmoActive( KFWeapon KFW ){ return false; }
function UpdatePerkHeadShots( ImpactInfo Impact, class<DamageType> DamageType, int NumHit );
function AddToHeadShotCombo( class<KFDamageType> KFDT, KFPawn_Monster KFPM );
function ResetHeadShotCombo();
simulated event bool GetIsHeadShotComboActive(){ return false; }
reliable private final server event ServerResetHeadShotCombo();
simulated function ModifyRateOfFire( out float InRate, KFWeapon KFW );
simulated event float GetIronSightSpeedModifier( KFWeapon KFW ){ return 1.f; }
simulated function ModifyWeaponSwitchTime( out float ModifiedSwitchTime );
simulated function bool ShouldInstantlySwitchWeapon( KFWeapon KFW ){ return false; }
simulated function ModifyWeaponBopDamping( out float BobDamping, KFWeapon PawnWeapon );
simulated event float GetCameraViewShakeModifier( KFWeapon OwnerWeapon ){ return 1.f; }
simulated function bool IgnoresPenetrationDmgReduction(){ return false; }

/** SWAT functions */
simulated event float GetCrouchSpeedModifier( KFWeapon KFW ) { return 1.f; }
simulated function bool HasHeavyArmor(){ return false; }
simulated function bool ShouldKnockDownOnBump(){ return false; }
simulated function int GetArmorDamageAmount( int AbsorbedAmt ) { return AbsorbedAmt; }


static function ModifyAssistDosh( out int EarnedDosh )
{
	local float TempDosh;

	TempDosh = EarnedDosh;
	TempDosh *= GetAssistDoshModifer();
	EarnedDosh = Round( TempDosh );
}

protected static function float GetAssistDoshModifer()
{
	return default.AssistDoshModifier;
}

function string GetModifierString( byte ModifierIndex )
{
	return "";
}

function ModifyBloatBileDoT( out float DoTScaler );

/** other shared getters */
simulated function KFWeapon GetOwnerWeapon()
{
	if( CheckOwnerPawn() )
	{
		if( OwnerPawn.Weapon != none )
		{
			return KFWeapon( OwnerPawn.Weapon );
		}
	}

	return none;
}

/**
 * @brief Resets certain perk values on wave start/end
 */
function OnWaveEnded();

function OnWaveStart();

simulated function bool GetUsingTactialReload( KFWeapon KFW )
{
	return false;
}

function DrawSpecialPerkHUD( Canvas C );

/** Player entering/exiting zed time, Server only */
function NotifyZedTimeStarted();
function NotifyZedTimeEnded();

simulated event KFPawn_Human GetOwnerPawn()
{
	local KFPawn_Human KFPH;

	OwnerPC = KFPlayerController(Owner);
	if( OwnerPC != none )
	{
		KFPH = KFPawn_Human(OwnerPC.Pawn);
		if( KFPH != none )
		{
			return KFPH;
		}
	}

	return none;
}

protected function bool HitShouldStumble( byte BodyPart )
{
	return BodyPartsCanStumble.Find( BodyPart ) != INDEX_NONE;
}

protected function bool HitShouldKnockdown( byte BodyPart )
{
	return BodyPartsCanKnockDown.Find( BodyPart ) != INDEX_NONE;
}

function bool ShouldAutosellWeapon(class<KFWeaponDefinition> DefClass)
{
    return AutoBuyLoadOutPath.Find(DefClass) == INDEX_NONE;
}

/*********************************************************************************************
* @name	 Common Skills
********************************************************************************************* */

function TickRegen( float DeltaTime )
{
	local int OldHealth;
	local KFPlayerReplicationInfo KFPRI;

	TimeUntilNextRegen -= DeltaTime;
	if( TimeUntilNextRegen <= 0.f )
	{
		if( CheckOwnerPawn() && OwnerPawn.Health < OwnerPawn.HealthMax )
		{
			OldHealth = OwnerPawn.Health;
			;
			OwnerPawn.Health = Min(OwnerPawn.Health + RegenerationAmount, OwnerPawn.HealthMax);

			KFPRI = KFPlayerReplicationInfo(OwnerPawn.PlayerReplicationInfo);
			if( KFPRI != none )
			{
				KFPRI.PlayerHealth = OwnerPawn.Health;
				KFPRI.PlayerHealthPercent = FloatToByte( float(OwnerPawn.Health) / float(OwnerPawn.HealthMax) );;
			}

			if( OldHealth <= OwnerPawn.HealthMax * 0.25f && OwnerPawn.Health >= OwnerPawn.HealthMax * 0.25f )
		 	{
		 		KFPlayerController(OwnerPawn.Controller).ReceiveLocalizedMessage(class'KFLocalMessage_Interaction', IMT_None);
		 	}

            if (KFGameInfo(WorldInfo.Game) != none)
            {
                KFGameInfo(WorldInfo.Game).PassiveHeal(OwnerPawn.Health - OldHealth, OldHealth, OwnerPawn.Controller, OwnerPawn);
            }
		}

		TimeUntilNextRegen = RegenerationInterval;
	}
}

/*********************************************************************************************
* @name	 UI / HUD
********************************************************************************************* */
simulated function class<EmitterCameraLensEffectBase> GetPerkLensEffect( class<KFDamageType> DmgType )
{
	return DmgType.default.CameraLensEffectTemplate;
}

static simulated function Texture2d GetInteractIcon()
{
	return default.InteractIcon;
}

simulated function string GetGrenadeImagePath()
{
	return default.GrenadeWeaponDef.Static.GetImagePath();
}

simulated function class<KFWeaponDefinition> GetGrenadeWeaponDef()
{
	return default.GrenadeWeaponDef;
}

/*********************************************************************************************
* @name	 Debug
********************************************************************************************* */

/** QA Function for logging percentage change in values */
simulated function float GetPercentage( float OriginalValue, float NewValue )
{
	if( OriginalValue == 0 )
	{
		return -1;
	}

	return (NewValue - OriginalValue) / OriginalValue;
}

unreliable server function ServerLogPerks()
{
	local KFPlayerController KFPC;
	local KFPerk MyPerk;

	foreach WorldInfo.AllControllers( class'KFPlayerController', KFPC )
	{
		MyPerk = KFPC.CurrentPerk;

		if( MyPerk != none )
		{
			MyPerk.LogPerkSkills();

			if( !KFPC.IsLocalPlayerController() )
			{
				MyPerk.ClientLogPerks();
			}
		}
	}
}

unreliable client function ClientLogPerks()
{
	LogPerkSkills();
}

simulated function LogPerkSkills()
{
	local int TierUnlockLevel;
	local int i;

	LogInternal(" ==================================== ");
  	LogInternal(MyPRI.PlayerName @ PerkName @ GetLevel());
	LogInternal(" ** SKILLS ** ");
	for( i = 0; i < 5; i++ )
	{
       	TierUnlockLevel = RANK_1_LEVEL + UNLOCK_INTERVAL * i;

       	if( GetLevel() >= TierUnlockLevel )
       	{
       		LogInternal("-Unlocked Skill Category:" @ i @ SkillCatagories[i]);
       		LogInternal("--Selected Skill:" @ SelectedSkills[i]);
       	}
	}
}

simulated function FormatPerkSkills()
{

}

simulated function PlayerDied(){}

defaultproperties
{
   ProgressStatID=-1
   SecondaryXPModifier(0)=1
   LevelString="Level"
   PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Berserker'
   WeaponDroppedMessage="You dropped%%%% because of your new carrying capacity!"
   AssistDoshModifier=1.000000
   CurrentLevel=255
   RegenerationInterval=1.000000
   BarrageDamageModifier=1.150000
   FormidableDamageModifier=0.750000
   SignatureDamageScale=1.000000
   ToxicDmgTypeClass=Class'KFGame.KFDT_Toxic'
   SecondaryWeaponDef=Class'KFGame.KFWeapDef_9mm'
   KnifeWeaponDef=Class'KFGame.KFWeapDef_Knife_Commando'
   GrenadeWeaponDef=Class'KFGame.KFWeapDef_Grenade_Berserker'
   InitialGrenadeCount=2
   MaxGrenadeCount=5
   BackupWeaponDamageTypeNames(0)="KFDT_Ballistic_9mm"
   BackupWeaponDamageTypeNames(1)="KFDT_Slashing_Knife"
   bTickIsDisabled=True
   bOnlyRelevantToOwner=True
   bAlwaysRelevant=False
   NetUpdateFrequency=1.000000
   Name="Default__KFPerk"
   ObjectArchetype=ReplicationInfo'Engine.Default__ReplicationInfo'
}
