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
var private const	PerkSkill 		WeaponDamage;						// weapon dmg modifier
var private const	PerkSkill		CloakedEnemyDetection;              // Can see cloaked zeds x UUs far (100UUs = 100cm = 1m)
var private const	PerkSkill		ZedTimeExtension;                   // How many times a zed time ext can happen
var private const	PerkSkill		ReloadSpeed;		                // 2% increase every 5 levels (max 10% increase)
var private const	PerkSkill		CallOut;		                    // allow teammates to see cloaked units
var private const	PerkSkill		NightVision;                        // Night vision

var private const	float			RapidFireFiringRate;    			// Faster firing rate in %  NOTE:This is needed for combinations with the Skill: RapidFire (Damage and Rate)
var private const 	float 			BackupWeaponSwitchModifier;
var private const 	float			HollowPointRecoilModifier;
var private const 	float			HealthArmorModifier;

/** Temp HUD */
var 			Texture2d		WhiteMaterial;

enum ECommandoSkills
{
	ECommandoTacticalReload,
	ECommandoLargeMags,
	ECommandoBackup,
	ECommandoImpact,
	ECommandoHealthIncrease,
	ECommandoAmmoVest,
	ECommandoHollowPoints,
	ECommandoEatLead,
	ECommandoProfessional,
	ECommandoRapidFire
};

/** On spawn, modify owning pawn based on perk selection */
function SetPlayerDefaults( Pawn PlayerPawn )
{
	local float NewArmor;

	super.SetPlayerDefaults( PlayerPawn );

	if( OwnerPawn.Role == ROLE_Authority && IsHealthIncreaseActive() )
	{
		NewArmor = OwnerPawn.default.MaxArmor * static.GetHealthArmorModifier();
		OwnerPawn.AddArmor( Round( NewArmor ) );		
	}
}

/*********************************************************************************************
* @name	 Passive skills functions
********************************************************************************************* */

/**
 * @brief Modifies the damage dealt
  *
 * @param InDamage damage
 * @param DamageCauser weapon or projectile (optional)
 * @param MyKFPM the zed damaged (optional)
 * @param DamageInstigator responsible controller (optional)
 * @param class DamageType the damage type used (optional)
 */
simulated function ModifyDamageGiven( out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx )
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
			`QALog( "Backup Damage" @ KFW @ GetPercentage( InDamage, InDamage * GetSkillValue( PerkSkills[ECommandoBackup] )), bLogPerk );
			TempDamage += InDamage * GetSkillValue( PerkSkills[ECommandoBackup] );
		}

		if( IsWeaponOnPerk(KFW) )
		{
			if( IsHollowPointsActive() )
			{
				`QALog( "Hollow points DMG" @ KFW @ GetPercentage(InDamage, InDamage * GetSkillValue( PerkSkills[ECommandoHollowPoints] )), bLogPerk );
	    		TempDamage += InDamage * GetSkillValue( PerkSkills[ECommandoHollowPoints] );
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
 * @brief Calculates the additional ammo per perk level
 *
 * @param Level Current perk level
 * @return additional ammo
 */
simulated private final static function float GetExtraReloadSpeed( int Level )
{
	return default.ReloadSpeed.Increment * FFloor( float( Level ) / 5.f );
}

/**
 * @brief Modifies the reload speed for commando weapons
 *
 * @param ReloadDuration Length of the reload animation
 * @param GiveAmmoTime Time after the weapon actually gets some ammo
 */
simulated function float GetReloadRateScale( KFWeapon KFW )
{
	if( IsWeaponOnPerk( KFW ) )
	{
		return 1.f - GetExtraReloadSpeed( CurrentLevel );
	}

	return 1.f;
}

/**
 * @brief modifies the players health 1% per level
 *
 * @param InHealth health
 */
function ModifyHealth( out int InHealth )
{
	local float TempHealth;

	if( IsHealthIncreaseActive() )
	{
		TempHealth = InHealth;
		TempHealth += InHealth * GetSkillValue( PerkSkills[ECommandoHealthIncrease] );
		InHealth = Round(TempHealth);
		`QALog( "Health Increase" @ InHealth, bLogPerk );
	}
}

/**
 * @brief Modifies the pawn's MaxArmor
 *
 * @param MaxArmor the maximum armor value
 */
function ModifyArmor( out byte MaxArmor )
{
	local float TempArmor;

	if( IsHealthIncreaseActive() )
	{
		TempArmor = MaxArmor;
		TempArmor += MaxArmor * GetSkillValue( PerkSkills[ECommandoHealthIncrease] );
		MaxArmor = Round( TempArmor );
	}
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
simulated function ModifyMagSizeAndNumber( KFWeapon KFW, out byte MagazineCapacity, optional Class<KFPerk> WeaponPerkClass, optional bool bSecondary=false )
{
	local float TempCapacity;

	TempCapacity = MagazineCapacity;

	if( IsWeaponOnPerk( KFW, WeaponPerkClass ) && (KFW == none || !KFW.bNoMagazine) )
	{
		if( KFW != none )
		{
			if( IsLargeMagActive() )
			{
				TempCapacity += MagazineCapacity * GetSkillValue( PerkSkills[ECommandoLargeMags] );
			}

			if( IsEatLeadActive() )
			{				
	       		TempCapacity += MagazineCapacity * GetSkillValue( PerkSkills[ECommandoEatLead] );
			}
		}
	}

	MagazineCapacity = Round(TempCapacity);
}

/**
 * @brief Modifies the max spare ammo
 *
 * @param KFW The weapon
 * @param MaxSpareAmmo ammo amount
 * @param TraderItem the weapon's associated trader item info
 */
simulated function ModifyMaxSpareAmmoAmount( KFWeapon KFW, out int MaxSpareAmmo, optional const out STraderItem TraderItem, optional bool bSecondary=false )
{
	local float TempMaxSpareAmmoAmount;

	if( IsAmmoVestActive() && (IsWeaponOnPerk( KFW, TraderItem.AssociatedPerkClass ) ||
		IsBackupWeapon( KFW )) )
	{
		TempMaxSpareAmmoAmount = MaxSpareAmmo;
		TempMaxSpareAmmoAmount += MaxSpareAmmo * GetSkillValue( PerkSkills[ECommandoAmmoVest] );
		MaxSpareAmmo = Round( TempMaxSpareAmmoAmount );
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

	if( IsProfessionalActive() && IsWeaponOnPerk( W ) )
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

	if( IsWeaponOnPerk( W ) && CouldRapidFireActive() && ZedTimeModifyingStates.Find( StateName ) != INDEX_NONE )
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

/**
 * @brief The Backup skill modifies the weapon switch speed
 *
 * @param ModifiedSwitchTime Duration of putting down or equipping the weapon
 */
simulated function ModifyWeaponSwitchTime( out float ModifiedSwitchTime )
{
	if( IsBackupActive() )
	{
		`QALog( "Backup switch weapon increase:" @ GetPercentage( ModifiedSwitchTime,  ModifiedSwitchTime * GetBackupWeaponSwitchModifier() ), bLogPerk );
		ModifiedSwitchTime -= ModifiedSwitchTime * static.GetBackupWeaponSwitchModifier();
	}
}

simulated final static function float GetBackupWeaponSwitchModifier()
{
	return default.BackupWeaponSwitchModifier;
}

/**
 * @brief Modifies the weapon's recoil
 *
 * @param CurrentRecoilModifier percent recoil lowered
 */
simulated function ModifyRecoil( out float CurrentRecoilModifier, KFWeapon KFW )
{
	if( IsWeaponOnPerk( KFW ) && IsHollowPointsActive() )
	{
		CurrentRecoilModifier -= CurrentRecoilModifier * GetHollowPointRecoilModifier();
	}
}

simulated static final function float GetHollowPointRecoilModifier()
{
	return default.HollowPointRecoilModifier;
}

private static function float GetHealthArmorModifier()
{
	return default.HealthArmorModifier;
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
	return true;
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

simulated protected function bool CouldRapidFireActive()
{
	return PerkSkills[ECommandoRapidFire].bActive;
}

/**
 * @brief Checks if large mag skill is active
 *
 * @return true/false
 */
simulated final private function bool IsLargeMagActive()
{
	return PerkSkills[ECommandoLargeMags].bActive;
}

/**
 * @brief Checks if backup damage skill is active
 *
 * @return true/false
 */
simulated final private function bool IsBackupActive()
{
	return PerkSkills[ECommandoBackup].bActive;
}

/**
 * @brief Checks if Hollow Points skill is active
 *
 * @return true/false
 */
simulated private function bool IsHollowPointsActive()
{
	return PerkSkills[ECommandoHollowPoints].bActive;
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
 * @brief Checks if impact skill is active
 *
 * @return true/false
 */
final private function bool IsImpactActive()
{
	return PerkSkills[ECommandoImpact].bActive;
}

/**
 * @brief Checks if health increase skill is active
 *
 * @return true/false
 */
final private function bool IsHealthIncreaseActive()
{
	return PerkSkills[ECommandoHealthIncrease].bActive;
}

/**
 * @brief Checks if auto fire skill is active
 *
 * @return true/false
 */
final private function bool IsEatLeadActive()
{
	return PerkSkills[ECommandoEatLead].bActive;
}

/**
 * @brief Checks if ammo vest skill is active
 *
 * @return true/false
 */
final private function bool IsAmmoVestActive()
{
	return PerkSkills[ECommandoAmmoVest].bActive;
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
	PassiveValues[2] = Round( GetZedTimeExtension( Level )) $ "sec";
	PassiveValues[3] = Round( GetExtraReloadSpeed( Level ) * 100 ) $ "%";
	PassiveValues[4] = "";
	PassiveValues[5] = "";

	Increments[0] = "["@Left( string( default.WeaponDamage.Increment * 100 ), InStr(string(default.WeaponDamage.Increment * 100), ".") + 2 ) 	$"% /" @default.LevelString @"]";
	Increments[1] = "["@ Int(default.CloakedEnemyDetection.StartingValue / 100 ) @"+" @Int(default.CloakedEnemyDetection.Increment / 100 ) 		$"m /" @default.LevelString @"]";
	Increments[2] = "["@Left( string( default.ZedTimeExtension.StartingValue ), InStr(string(default.ZedTimeExtension.StartingValue ), ".") + 2 )@"+" 
						@Left( string( default.ZedTimeExtension.Increment ), InStr(string(default.ZedTimeExtension.Increment ), ".") + 2 )		@"sec / 5" @default.LevelString @"]";
	Increments[3] = "["@Left( string( default.ReloadSpeed.Increment * 100 ), InStr(string(default.ReloadSpeed.Increment * 100), ".") + 2 ) 		$ "% / 5" @ default.LevelString @ "]";
	Increments[4] = "";
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
		DetectionRangeSq = Square( GetPassiveValue( CloakedEnemyDetection, CurrentLevel ) );

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
		C.DrawTile(WhiteMaterial, HealthbarLength, HealthbarHeight, 0, 0, 32, 32);

		C.SetDrawColor(237, 8, 0, 255);
		C.SetPos(ScreenPos.X - HealthBarLength * 0.5 + 1.0, ScreenPos.Y + 1.0);
		C.DrawTile(WhiteMaterial, (HealthBarLength - 2.0) * HealthScale, HealthbarHeight - 2.0, 0, 0, 32, 32);
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
   	BackupWeaponSwitchModifier=0.5
   	HollowPointRecoilModifier=0.5
   	HealthArmorModifier=0.25

   	ZedTimeModifyingStates(0)="WeaponFiring"
   	ZedTimeModifyingStates(1)="WeaponBurstFiring"
   	ZedTimeModifyingStates(2)="WeaponSingleFiring"

	SecondaryXPModifier(0)=3
	SecondaryXPModifier(1)=5
	SecondaryXPModifier(2)=6
	SecondaryXPModifier(3)=9

	WhiteMaterial=Texture2D'EngineResources.WhiteSquareTexture'

	WeaponDamage=(Name="Weapon Damage",Increment=0.01,Rank=0,StartingValue=0.0f,MaxValue=0.25)
	CloakedEnemyDetection=(Name="Cloaked Enemy Detection Range",Increment=200.f,Rank=0,StartingValue=1000.f,MaxValue=6000.f)
	ZedTimeExtension=(Name="Zed Time Extension",Increment=1.f,Rank=0,StartingValue=1.f,MaxValue=6.f)
	ReloadSpeed=(Name="Reload Speed",Increment=0.02,Rank=0,StartingValue=0.0f,MaxValue=0.10)
	CallOut=(Name="Call Out",Increment=2.f,Rank=0,StartingValue=0.f,MaxValue=50.f)
	NightVision=(Name="Night Vision",Increment=0.f,Rank=0,StartingValue=0.f,MaxValue=0.f)

	PerkSkills(ECommandoTacticalReload)=(Name="TacticalReload",IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_TacticalReload",Increment=0.f,Rank=0,StartingValue=0.f,MaxValue=0.f)
	PerkSkills(ECommandoLargeMags)=(Name="LargeMags",IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_LargeMag",Increment=0.f,Rank=0,StartingValue=0.5f,MaxValue=0.5f)
	PerkSkills(ECommandoBackup)=(Name="Backup",IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_Backup",Increment=0.f,Rank=0,StartingValue=1.1f,MaxValue=1.1f)
	PerkSkills(ECommandoImpact)=(Name="Impact",IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_Impact",Increment=0.f,Rank=0,StartingValue=1.5,MaxValue=1.5)
	PerkSkills(ECommandoHealthIncrease)=(Name="HealthIncrease",IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_HP",Increment=0.f,Rank=0,StartingValue=0.25,MaxValue=0.25)
	PerkSkills(ECommandoAmmoVest)=(Name="AmmoVest",IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_AmmoVest",Increment=0.f,Rank=0,StartingValue=0.2f,MaxValue=0.2f)
	PerkSkills(ECommandoHollowPoints)=(Name="HollowPoints",IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_SingleFire",Increment=0.f,Rank=0,StartingValue=0.3f,MaxValue=0.3f)
	PerkSkills(ECommandoEatLead)=(Name="EatLead",IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_AutoFire",Increment=0.f,Rank=0,StartingValue=1.0f,MaxValue=1.0f) //0.5
	PerkSkills(ECommandoProfessional)=(Name="Professional",IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_Professional")
	PerkSkills(ECommandoRapidFire)=(Name="RapidFire",IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_RapidFire",Increment=0.f,Rank=0,StartingValue=0.03,MaxValue=0.03)
	

    // Skill tracking
	HitAccuracyHandicap=0.0
	HeadshotAccuracyHandicap=-3.0
	AutoBuyLoadOutPath=(class'KFWeapDef_AR15', class'KFWeapDef_Bullpup', class'KFWeapDef_AK12', class'KFWeapDef_SCAR')
}

