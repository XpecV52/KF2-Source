//=============================================================================
// KFPerk_Commando
//=============================================================================
// The commando perk class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFPerk_Commando extends KFPerk
	hidecategories(Mobile, Object, Debug, Advanced, Physics, Actor, Attachment, Display)
	native;

`include(KFOnlineStats.uci)

//Passives
var		const	PerkSkill 		WeaponDamage;						// weapon dmg modifier
var 	const	PerkSkill		CloakedEnemyDetection;              // Can see cloaked zeds x UUs far (100UUs = 100cm = 1m)
var 	const	PerkSkill		HealthBarDetection;                 // Can see zed's health x UUs far (100UUs = 100cm = 1m)
var 	const	PerkSkill		ZedTimeExtension;                   // How many times a zed time ext can happen
var 	const	PerkSkill		ExtraHealth;                        // 0 - 50 HP based on level
var 	const	PerkSkill		NightVision;                        // Night vision

var 	const	float			RapidFireFiringRate;    			// Faster firing rate in %  NOTE:This is needed for combinations with the Skill: RapidFire (Damage and Rate)

/** Temp HUD */
var 			Texture2d		WhiteMaterial;

enum ECommandoSkills
{
	ECommandoLargeMags,
	ECommandoBackup,
	ECommandoImpact,
	ECommandoTacticalReload,
	ECommandoLeadership,
	ECommandoCallOut,
	ECommandoSingleFire,
	ECommandoAutoFire,
	ECommandoRapidFire,
	ECommandoProfessional
};

/*********************************************************************************************
* @name	 Passive skills functions
********************************************************************************************* */

/**
 * @brief Modifes the damage dealt
  *
 * @param InDamage damage
 * @param DamageCauser weapon or projectile (optional)
 * @param MyKFPM the zed damaged (optional)
 * @param DamageInstigator responsible controller (optional)
 * @param class DamageType the damage type used (optional)
 */
simulated function ModifyDamageGiven(out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType)
{
	local KFWeapon KFW;
	local float TempDamage;

	TempDamage = InDamage;

	if( DamageCauser != none )
	{
		KFW = GetWeaponFromDamageCauser( DamageCauser );
	}

	if( (KFW != none && IsWeaponOnPerk( KFW )) || (DamageType != none && IsDamageTypeOnPerk( DamageType )) )
	{
		TempDamage += InDamage * GetPassiveValue( WeaponDamage, CurrentLevel );
		if( IsRapidFireActive() )
		{
			`QALog( "RapidFire Damage" @ KFW @ GetPercentage( InDamage, InDamage * GetSkillValue( PerkSkills[ECommandoRapidFire] )), bLogPerk );
			TempDamage +=  InDamage * GetSkillValue( PerkSkills[ECommandoRapidFire] );
		}
	}

	if( KFW != none )
	{
		if( IsBackupActive() && IsBackupWeapon( KFW ) )
		{
			TempDamage += InDamage * GetSkillValue( PerkSkills[ECommandoBackup] );
		}

		if( IsWeaponOnPerk(KFW) )
		{
			if( IsSingleFireActive() && KFW.GetStateName() == 'WeaponSingleFiring' )
			{
				`QALog( "SingleFire DMG" @ KFW @ GetPercentage(InDamage, InDamage * GetSkillValue( PerkSkills[ECommandoSingleFire] )), bLogPerk );
	    		TempDamage += InDamage * GetSkillValue( PerkSkills[ECommandoSingleFire] );
			}

			if( IsAutoFireActive() && (KFW.GetStateName() == 'WeaponBurstFiring' || KFW.GetStateName() == 'WeaponFiring') )
			{
				`QALog( "BurstFire DMG" @ KFW @ GetPercentage(InDamage, InDamage * GetSkillValue( PerkSkills[ECommandoAutoFire] )), bLogPerk );
	       		TempDamage += InDamage * GetSkillValue( PerkSkills[ECommandoAutoFire] );
			}
		}
	}

	`QALog( "Total Damage Given" @ DamageType @ KFW @ GetPercentage( InDamage, FCeil(TempDamage) ), bLogPerk );
	InDamage = FCeil(TempDamage);
}

/**
 * @brief how far away we can see stalkers
 *
 * @return range in UUs
 */
simulated function float GetCloakDetectionRange()
{
	return GetPassiveValue( CloakedEnemyDetection, CurrentLevel );
}

/**
 * @brief How long can we extend zed time?
 * @details Zed time extended by 1 second starting at level 0
 *			and every milestone level thereafter to a maximum of 5 seconds
 * @param Level the perk's level
 * @return zed time extension in seconds
 */
simulated static function float GetZedTimeExtension( byte Level )
{
	if( Level >= RANK_5_LEVEL )
	{
		return default.ZedTimeExtension.MaxValue;
	}
	else if( Level >= RANK_4_LEVEL )
	{
		return default.ZedTimeExtension.StartingValue + 4 * default.ZedTimeExtension.Increment;
	}
	else if( Level >= RANK_3_LEVEL )
	{
		return default.ZedTimeExtension.StartingValue + 3 * default.ZedTimeExtension.Increment;
	}
	else if( Level >= RANK_2_LEVEL )
	{
		return default.ZedTimeExtension.StartingValue + 2 * default.ZedTimeExtension.Increment;
	}
	else if( Level >= RANK_1_LEVEL )
	{
		return default.ZedTimeExtension.StartingValue + default.ZedTimeExtension.Increment;
	}

	return 1.0f;
}

/**
 * @brief modifies the players health 1% per level
 *
 * @param InHealth health
 */
function ModifyHealth( out int InHealth )
{
	InHealth += GetPassiveValue( ExtraHealth, GetLevel() );
	`QALog( "Health Increase" @ InHealth, bLogPerk );
}

/*********************************************************************************************
* @name	 Selectable skills functions
********************************************************************************************* */

/**
 * @brief Should the tactical reload skill adjust the reload speed
 *
 * @param KFW weapon in use
 * @return true/false
 */
simulated function bool GetUsingTactialReload( KFWeapon KFW )
{
	return ( IsTacticalReloadActive() && (IsWeaponOnPerk( KFW ) || IsBackupWeapon( KFW )) );
}

/**
 * @brief Modifies mag capacity and count
 *
 * @param KFW the weapon
 * @param MagazineCapacity modified mag capacity
 * @param WeaponPerkClass the weapon's associated perk class (optional)
 */
simulated function ModifyMagSizeAndNumber( KFWeapon KFW, out int MagazineCapacity, optional Class<KFPerk> WeaponPerkClass )
{
	if( IsWeaponOnPerk( KFW, WeaponPerkClass ) && IsLargeMagActive() && (KFW == none || !KFW.bNoMagazine) )
	{
		if( KFW != none )
		{
			MagazineCapacity *= 1 + GetSkillValue( PerkSkills[ECommandoLargeMags] );
		}
	}
}

/**
 * @brief Skills can modify the zed time time delation
 *
 * @param StateName used weapon's state
 * @return time dilation modifier
 */
simulated function float GetZedTimeModifier( KFWeapon W )
{
	local name StateName;
	StateName = W.GetStateName();

	if( IsProfessionalActive() )
	{
		if( StateName == 'Reloading' )
		{
			return 1.f;
		}
		else if( StateName == 'WeaponPuttingDown' || StateName == 'WeaponEquipping' )
		{
			return 0.3f;
		}
	}

	if( IsRapidFireActive() && ZedTimeModifyingStates.Find( StateName ) != INDEX_NONE )
	{
		return RapidFireFiringRate;
	}

	return 0.f;
}

/**
 * @brief skills and weapons can modify the stumbling power
 * @return stumpling power modifier
 */
function float GetStumblePowerModifier( optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart )
{
	local KFWeapon KFW;

	KFW = GetOwnerWeapon();
	if( IsImpactActive() && IsWeaponOnPerk( KFW ) )
	{
		return 1.f + GetSkillValue( PerkSkills[ECommandoImpact] );
	}

	return 1.f;
}

static simulated function float GetLeadshipRateReduction()
{
	return GetSkillValue( default.PerkSkills[ECommandoLeadership] );
}

/*********************************************************************************************
* @name	Getters
********************************************************************************************* */
/**
 * @brief Checks if call out skill is active
 *
 * @return true/false
 */
simulated function bool IsCallOutActive()
{
	return PerkSkills[ECommandoCallOut].bActive;
}

/**
 * @brief Checks if night vision skill is active
 *
 * @return true/false
 */
simulated function bool HasNightVision()
{
	return true;
}

/**
 * @brief Checks if rapid fire skill is active and if we are in zed time
 *
 * @return true/false
 */
simulated protected function bool IsRapidFireActive()
{
	return PerkSkills[ECommandoRapidFire].bActive && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief Checks if large mag skill is active
 *
 * @return true/false
 */
final private simulated function bool IsLargeMagActive()
{
	return PerkSkills[ECommandoLargeMags].bActive;
}

/**
 * @brief Checks if backup damage skill is active
 *
 * @return true/false
 */
final private function bool IsBackupActive()
{
	return PerkSkills[ECommandoBackup].bActive;
}

/**
 * @brief Checks if single fire skill is active
 *
 * @return true/false
 */
final private function bool IsSingleFireActive()
{
	return PerkSkills[ECommandoSingleFire].bActive;
}

/**
 * @brief Checks if tactical reload skill is active (client & server)
 *
 * @return true/false
 */
simulated final private function bool IsTacticalReloadActive()
{
	return PerkSkills[ECommandoTacticalReload].bActive;
}

/**
 * @brief Checks if the Leadership skill is active
 *
 * @return true/false
 */
simulated function bool IsLeadershipActive()
{
	return PerkSkills[ECommandoLeadership].bActive;
}

/**
 * @brief Checks if impact skill is active
 *
 * @return true/false
 */
final private function bool IsImpactActive()
{
	return PerkSkills[ECommandoImpact].bActive;
}

/**
 * @brief Checks if auto fire skill is active
 *
 * @return true/false
 */
final private function bool IsAutoFireActive()
{
	return PerkSkills[ECommandoAutoFire].bActive;
}

/**
 * @brief Checks if professional skill is active
 *
 * @return true/false
 */
simulated final private function bool IsProfessionalActive()
{
	return PerkSkills[ECommandoProfessional].bActive;
}

/*********************************************************************************************
* @name	 Hud/UI
********************************************************************************************* */

simulated static function GetPassiveStrings( out array<string> PassiveValues, out array<string> Increments, byte Level )
{
	PassiveValues[0] = Round( GetPassiveValue( default.WeaponDamage, Level) * 100 ) $ "%";
	PassiveValues[1] = Round( GetPassiveValue( default.CloakedEnemyDetection, Level ) / 100 ) $ "m";		// Divide by 100 to convert unreal units to meters
	PassiveValues[2] = Round( GetPassiveValue( default.HealthBarDetection, Level ) / 100 ) $ "m";	// Divide by 100 to convert unreal units to meters
	PassiveValues[3] = Round( GetZedTimeExtension( Level )) $ "sec";
	PassiveValues[4] = Round( GetPassiveValue( default.ExtraHealth, Level ) ) $ "%";
	PassiveValues[5] = "";

	Increments[0] = "["@Int(default.WeaponDamage.Increment * 100)  $"% /" @default.LevelString @"]";
	Increments[1] = "["@Int(default.CloakedEnemyDetection.Increment / 100)  $"m /" @default.LevelString @"]";
	Increments[2] = "["@Int(default.HealthBarDetection.Increment / 100)  $"m /" @default.LevelString @"]";
	Increments[3] = "["@Int(default.ZedTimeExtension.StartingValue) @"+" @Int(default.ZedTimeExtension.Increment)   @"sec / 5" @default.LevelString @"]";
	Increments[4] = "["@Int(default.ExtraHealth.Increment)  $"% /" @default.LevelString @"]";
	Increments[5] = "";
}

/*********************************************************************************************
* @name	 Stats/XP
********************************************************************************************* */

/**
 * @brief how much XP is earned by a stalker kill depending on the game's difficulty
 *
 * @param Difficulty current game difficulty
 * @return XP earned
 */
simulated static function int GetStalkerKillXP( byte Difficulty )
{
	return default.SecondaryXPModifier[Difficulty];
}

/*********************************************************************************************
* @name	 Temp Hud things
********************************************************************************************* */
simulated function DrawSpecialPerkHUD(Canvas C)
{
	local KFPawn_Monster KFPM;
	local float DetectionRangeSq, ThisDot;

	if( CheckOwnerPawn() )
	{
		DetectionRangeSq = Square( GetPassiveValue( HealthBarDetection, CurrentLevel ) );

		foreach WorldInfo.AllPawns(class'KFPawn_Monster', KFPM)
		{
			ThisDot = Normal(vector(OwnerPawn.GetViewRotation())) dot Normal(KFPM.Location - OwnerPawn.Location);
			if( KFPM.IsAliveAndWell() && KFPM.bShowHealth && DetectionRangeSq >= VSizeSq(KFPM.Location - OwnerPawn.Location) && ThisDot > 0  )
			{
				DrawZedHealthbar( C, KFPM );
			}
		}
	}
}

simulated function DrawZedHealthbar(Canvas C, KFPawn_Monster KFPM)
{
	local vector ScreenPos, TargetLocation, CameraLocation;
	local float HealthBarLength, HealthbarHeight, HealthScale;

	CheckOwnerPawn();

	CameraLocation = OwnerPawn.GetPawnViewLocation();

	HealthbarLength = FMin(50.f * (float(C.SizeX) / 1024.f), 50.f);
	HealthbarHeight = FMin(6.f * (float(C.SizeX) / 1024.f), 6.f);
	HealthScale = float(KFPM.Health) / float(KFPM.HealthMax);

	if( KFPM.bCrawler && KFPM.Floor.Z <=  -0.7f && KFPM.Physics == PHYS_Spider )
	{
		TargetLocation = KFPM.Location + vect(0,0,-1) * KFPM.GetCollisionHeight() * 1.2;
	}
	else
	{
		TargetLocation = KFPM.Location + vect(0,0,1) * KFPM.GetCollisionHeight() * 1.2;
	}

	ScreenPos = C.Project(TargetLocation);
	if( ScreenPos.X < 0 || ScreenPos.X > C.SizeX || ScreenPos.Y < 0 || ScreenPos.Y > C.SizeY )
	{
		return;
	}

	if( FastTrace(TargetLocation,  CameraLocation) )
	{
		C.EnableStencilTest(true);
		C.SetDrawColor(0, 0, 0, 255);
		C.SetPos(ScreenPos.X - HealthBarLength * 0.5, ScreenPos.Y);
		C.DrawTileStretched(WhiteMaterial, HealthbarLength, HealthbarHeight, 0, 0, 32, 32);

		C.SetDrawColor(237, 8, 0, 255);
		C.SetPos(ScreenPos.X - HealthBarLength * 0.5 + 1.0, ScreenPos.Y + 1.0);
		C.DrawTileStretched(WhiteMaterial, (HealthBarLength - 2.0) * HealthScale, HealthbarHeight - 2.0, 0, 0, 32, 32);
		C.EnableStencilTest(false);
	}
}

/*********************************************************************************************
* @name	 Logging / debug
********************************************************************************************* */

/** Log What type of reload the weapon would use given ammo count */
private simulated function name LogTacticalReload()
{
	local KFWeapon KFW;

	KFW = GetOwnerWeapon();

    return KFW.GetReloadAnimName( GetUsingTactialReload(KFW) );
}
/** QA Logging - Report Perk Info */
simulated function LogPerkSkills()
{
	super.LogPerkSkills();

	if( bLogPerk )
	{
/**		`log( "PASSIVE PERKS" );
		`log( "-Weapon Damage Modifier:" @ GetPassiveValue( WeaponDamage, CurrentLevel ) * 100 $"%" );
		`log( "-Cloak Detection Range:" @ GetPassiveValue(CloakedEnemyDetection, CurrentLevel)/100 @"Meters" );
		`log( "-Health Bar Detection Range:" @ GetPassiveValue(HealthBarDetection, CurrentLevel) /100 @"Meters" );
		`log( "-ZED Time Extension:" @ GetZedTimeExtension( CurrentLevel ) @"Seconds" );
		`log( "-Health Increase:" @ GetPassiveValue(ExtraHealth, CurrentLevel) $"%" );

	    `log( "Skill Tree" );
	    `log( "-Nightvision Active:" @ HasNightVision() );
	    `log( "-Call Active:" @ IsCallOutActive() );
	    `log( "-Large Mags:" @ PerkSkills[ECommandoLargeMags].bActive );
	    `log( "-Backup:" @ PerkSkills[DECommandoBackup.bActive );
	    `log( "-Single Fire:" @ PerkSkills[ECommandoSingleFire].bActive );
	    `log( "-Tactical Reload:" @ PerkSkills[ECommandoTacticalReload].bActive @ LogTacticalReload() );
	    `log( "-Impact:" @ PerkSkills[ECommandoImpact].bActive );
	    `log( "-Autofire:" @ PerkSkills[ECommandoAutoFireDamage].bActive );
	    `log( "-Rapid Fire:" @ PerkSkills[ECommandoRapidFireDamage].bActive );
	    `log( "-Professional:" @ PerkSkills[ECommandoProfessional].bActive );*/
	}
}

DefaultProperties
{
   	bCanSeeCloakedZeds=true

	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Commando'
   	ProgressStatID=`STATID_Cmdo_Progress
   	PerkBuildStatID=`STATID_Cmdo_Build

   	PrimaryWeaponDef=class'KFWeapDef_AR15'
	KnifeWeaponDef=class'KFweapDef_Knife_Commando'
	GrenadeWeaponDef=class'KFWeapDef_Grenade_Commando'

   	RapidFireFiringRate=0.5f

   	ZedTimeModifyingStates(0)="WeaponFiring"
   	ZedTimeModifyingStates(1)="WeaponBurstFiring"
   	ZedTimeModifyingStates(2)="WeaponSingleFiring"

	SecondaryXPModifier(0)=3
	SecondaryXPModifier(1)=5
	SecondaryXPModifier(2)=6
	SecondaryXPModifier(3)=9

	WhiteMaterial=Texture2D'EngineResources.WhiteSquareTexture'

	WeaponDamage=(Name="Weapon Damage",Increment=0.01f,Rank=0,StartingValue=0.0f,MaxValue=0.25f)
	CloakedEnemyDetection=(Name="Cloacked Enemy Detection Range",Increment=200.f,Rank=0,StartingValue=0.f,MaxValue=5000.f)
	HealthBarDetection=(Name="Health Bar Detection Range",Increment=200.f,Rank=0,StartingValue=0.f,MaxValue=5000.f)
	ZedTimeExtension=(Name="Zed Time Extension",Increment=1.f,Rank=0,StartingValue=1.f,MaxValue=6.f)
	ExtraHealth=(Name="Extra Health",Increment=2.f,Rank=0,StartingValue=0.f,MaxValue=50.f)
	NightVision=(Name="Night Vision",Increment=0.f,Rank=0,StartingValue=0.f,MaxValue=0.f)

	PerkSkills(ECommandoLargeMags)=(Name="LargeMags",IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_LargeMag",Increment=0.f,Rank=0,StartingValue=0.5f,MaxValue=0.5f)
	PerkSkills(ECommandoBackup)=(Name="Backup",IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_Backup",Increment=0.f,Rank=0,StartingValue=0.6f,MaxValue=0.6f)
	PerkSkills(ECommandoImpact)=(Name="Impact",IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_Impact",Increment=0.f,Rank=0,StartingValue=0.3f,MaxValue=0.3f)
	PerkSkills(ECommandoTacticalReload)=(Name="TacticalReload",IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_TacticalReload",Increment=0.f,Rank=0,StartingValue=0.f,MaxValue=0.f)
	PerkSkills(ECommandoLeadership)=(Name="Leadership",IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_Nightvision",Increment=0.f,Rank=0,StartingValue=0.1f,MaxValue=0.1f)	
	PerkSkills(ECommandoCallOut)=(Name="CallOut",IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_CallOut")
	PerkSkills(ECommandoSingleFire)=(Name="SingleFire",IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_SingleFire",Increment=0.f,Rank=0,StartingValue=0.2f,MaxValue=0.2f)
	PerkSkills(ECommandoAutoFire)=(Name="Autofire",IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_AutoFire",Increment=0.f,Rank=0,StartingValue=0.2f,MaxValue=0.2f)
	PerkSkills(ECommandoRapidFire)=(Name="RapidFire",IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_RapidFire",Increment=0.f,Rank=0,StartingValue=0.03,MaxValue=0.03)
	PerkSkills(ECommandoProfessional)=(Name="Professional",IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_Professional")
}

