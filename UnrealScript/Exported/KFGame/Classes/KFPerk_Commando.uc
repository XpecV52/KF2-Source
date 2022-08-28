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

//`include(KFOnlineStats.uci)

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

	if( (KFW != none && IsWeaponOnPerk( KFW,, self.class )) || (DamageType != none && IsDamageTypeOnPerk( DamageType )) )
	{
		TempDamage += InDamage * GetPassiveValue( WeaponDamage, CurrentLevel );
		if( IsRapidFireActive() )
		{
			;
			TempDamage +=  InDamage * GetSkillValue( PerkSkills[ECommandoRapidFire] );
		}
	}

	//Specific exclusion of grenades here so as not to cause issues in other areas of the code that would have required more extensive changes.
	//		Basically, GetWeaponFromDamageCauser should never have been returning the equipped weapon for grenades, but now that we
	//		have the perks so tied into using that, it's easier to just specifically fix commando here.
	if( KFW != none && !DamageCauser.IsA('KFProj_Grenade'))
	{
		if( IsBackupActive() && IsBackupWeapon( KFW ) )
		{
			;
			TempDamage += InDamage * GetSkillValue( PerkSkills[ECommandoBackup] );
		}

		if( IsWeaponOnPerk( KFW,, self.class ) )
		{
			if( IsHollowPointsActive() )
			{
				;
	    		TempDamage += InDamage * GetSkillValue( PerkSkills[ECommandoHollowPoints] );
			}
		}
	}

	;
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
	if( IsWeaponOnPerk( KFW,, self.class ) )
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
		;
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
	return ( IsTacticalReloadActive() && (IsWeaponOnPerk( KFW,, self.class ) || IsBackupWeapon( KFW )) );
}

/**
 * @brief Modifies mag capacity and count
 *
 * @param KFW the weapon
 * @param MagazineCapacity modified mag capacity
 * @param WeaponPerkClass the weapon's associated perk class (optional)
 */
simulated function ModifyMagSizeAndNumber( KFWeapon KFW, out byte MagazineCapacity, optional array< Class<KFPerk> > WeaponPerkClass, optional bool bSecondary=false, optional name WeaponClassname )
{
	local float TempCapacity;

	TempCapacity = MagazineCapacity;

	if( !bSecondary && IsWeaponOnPerk( KFW, WeaponPerkClass, self.class ) && (KFW == none || !KFW.bNoMagazine) )
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

	if( IsAmmoVestActive() && (IsWeaponOnPerk( KFW, TraderItem.AssociatedPerkClasses, self.class ) ||
		IsBackupWeapon( KFW )) )
	{
		TempMaxSpareAmmoAmount = MaxSpareAmmo;
		TempMaxSpareAmmoAmount += MaxSpareAmmo * GetSkillValue( PerkSkills[ECommandoAmmoVest] );
		MaxSpareAmmo = Round( TempMaxSpareAmmoAmount );
	}
}

static simulated private function bool Is9mm( KFWeapon KFW )
{
	return KFW != none && KFW.default.bIsBackupWeapon && !KFW.IsMeleeWeapon();
}

/**
 * @brief Skills can modify the zed time time dilation
 *
 * @param StateName used weapon's state
 * @return time dilation modifier
 */
simulated function float GetZedTimeModifier( KFWeapon W )
{
	local name StateName;
	StateName = W.GetStateName();

	if( IsProfessionalActive() && (IsWeaponOnPerk( W,, self.class ) || IsBackupWeapon( W )) )
	{
		if( StateName == 'Reloading' ||
			StateName == 'AltReloading' )
		{
			return 1.f;
		}
		else if( StateName == 'WeaponPuttingDown' || StateName == 'WeaponEquipping' )
		{
			return 0.3f;
		}
	}

	if( CouldRapidFireActive() && (Is9mm(W) || IsWeaponOnPerk( W,, self.class )) && ZedTimeModifyingStates.Find( StateName ) != INDEX_NONE )
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
	if( IsImpactActive() && IsWeaponOnPerk( KFW,, self.class ) )
	{
		return GetSkillValue( PerkSkills[ECommandoImpact] );
	}

	return 0.f;
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
		;
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
	if( IsWeaponOnPerk( KFW,, self.class ) && IsHollowPointsActive() )
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
	return PerkSkills[ECommandoRapidFire].bActive && WorldInfo.TimeDilation < 1.f && IsPerkLevelAllowed(ECommandoRapidFire);
}

simulated protected function bool CouldRapidFireActive()
{
	return PerkSkills[ECommandoRapidFire].bActive && IsPerkLevelAllowed(ECommandoRapidFire);
}

/**
 * @brief Checks if large mag skill is active
 *
 * @return true/false
 */
simulated final private function bool IsLargeMagActive()
{
	return PerkSkills[ECommandoLargeMags].bActive && IsPerkLevelAllowed(ECommandoLargeMags);
}

/**
 * @brief Checks if backup damage skill is active
 *
 * @return true/false
 */
simulated final private function bool IsBackupActive()
{
	return PerkSkills[ECommandoBackup].bActive && IsPerkLevelAllowed(ECommandoBackup);
}

/**
 * @brief Checks if Hollow Points skill is active
 *
 * @return true/false
 */
simulated private function bool IsHollowPointsActive()
{
	return PerkSkills[ECommandoHollowPoints].bActive && IsPerkLevelAllowed(ECommandoHollowPoints);
}

/**
 * @brief Checks if tactical reload skill is active (client & server)
 *
 * @return true/false
 */
simulated final private function bool IsTacticalReloadActive()
{
	return PerkSkills[ECommandoTacticalReload].bActive && IsPerkLevelAllowed(ECommandoTacticalReload);
}

/**
 * @brief Checks if impact skill is active
 *
 * @return true/false
 */
final private function bool IsImpactActive()
{
	return PerkSkills[ECommandoImpact].bActive && IsPerkLevelAllowed(ECommandoImpact);
}

/**
 * @brief Checks if health increase skill is active
 *
 * @return true/false
 */
final private function bool IsHealthIncreaseActive()
{
	return PerkSkills[ECommandoHealthIncrease].bActive && IsPerkLevelAllowed(ECommandoHealthIncrease);
}

/**
 * @brief Checks if auto fire skill is active
 *
 * @return true/false
 */
final private function bool IsEatLeadActive()
{
	return PerkSkills[ECommandoEatLead].bActive && IsPerkLevelAllowed(ECommandoEatLead);
}

/**
 * @brief Checks if ammo vest skill is active
 *
 * @return true/false
 */
final private function bool IsAmmoVestActive()
{
	return PerkSkills[ECommandoAmmoVest].bActive && IsPerkLevelAllowed(ECommandoAmmoVest);
}

/**
 * @brief Checks if professional skill is active
 *
 * @return true/false
 */
simulated final private function bool IsProfessionalActive()
{
	return PerkSkills[ECommandoProfessional].bActive && IsPerkLevelAllowed(ECommandoProfessional);
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
	local vector ViewLocation, ViewDir;
	local float DetectionRangeSq, ThisDot;
	local float HealthBarLength, HealthbarHeight;

	if( CheckOwnerPawn() )
	{
		DetectionRangeSq = Square( GetPassiveValue(CloakedEnemyDetection, CurrentLevel) );

		HealthbarLength = FMin( 50.f * (float(C.SizeX) / 1024.f), 50.f );
		HealthbarHeight = FMin( 6.f * (float(C.SizeX) / 1024.f), 6.f );

		ViewLocation = OwnerPawn.GetPawnViewLocation();
		ViewDir = vector( OwnerPawn.GetViewRotation() );

		foreach WorldInfo.AllPawns( class'KFPawn_Monster', KFPM )
		{
			if( !KFPM.CanShowHealth()
				|| !KFPM.IsAliveAndWell()
				|| (WorldInfo.TimeSeconds - KFPM.Mesh.LastRenderTime) > 0.1f
				|| VSizeSQ(KFPM.Location - OwnerPawn.Location) > DetectionRangeSq )
			{
				continue;
			}

			ThisDot = ViewDir dot Normal( KFPM.Location - OwnerPawn.Location );
			if( ThisDot > 0.f )
			{
				DrawZedHealthbar( C, KFPM, ViewLocation, HealthbarHeight, HealthbarLength );
			}
		}
	}
}

simulated function DrawZedHealthbar(Canvas C, KFPawn_Monster KFPM, vector CameraLocation, float HealthbarHeight, float HealthbarLength )
{
	local vector ScreenPos, TargetLocation;
	local float HealthScale;

	if( KFPM.bCrawler && KFPM.Floor.Z <=  -0.7f && KFPM.Physics == PHYS_Spider )
	{
		TargetLocation = KFPM.Location + vect(0,0,-1) * KFPM.GetCollisionHeight() * 1.2 * KFPM.CurrentBodyScale;
	}
	else
	{
		TargetLocation = KFPM.Location + vect(0,0,1) * KFPM.GetCollisionHeight() * 1.2 * KFPM.CurrentBodyScale;
	}

	ScreenPos = C.Project( TargetLocation );
	if( ScreenPos.X < 0 || ScreenPos.X > C.SizeX || ScreenPos.Y < 0 || ScreenPos.Y > C.SizeY )
	{
		return;
	}

	if( class'KFGameEngine'.static.FastTrace_PhysX(TargetLocation, CameraLocation) )
	{
		HealthScale = FClamp( float(KFPM.Health) / float(KFPM.HealthMax), 0.f, 1.f );

		C.EnableStencilTest( true );
		C.SetDrawColor(0, 0, 0, 255);
		C.SetPos( ScreenPos.X - HealthBarLength * 0.5, ScreenPos.Y );
		C.DrawTile( WhiteMaterial, HealthbarLength, HealthbarHeight, 0, 0, 32, 32 );

		C.SetDrawColor( 237, 8, 0, 255 );
		C.SetPos( ScreenPos.X - HealthBarLength * 0.5 + 1.0, ScreenPos.Y + 1.0 );
		C.DrawTile( WhiteMaterial, (HealthBarLength - 2.0) * HealthScale, HealthbarHeight - 2.0, 0, 0, 32, 32 );
		C.EnableStencilTest( false );
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

defaultproperties
{
   WeaponDamage=(Name="Weapon Damage",Increment=0.010000,MaxValue=0.250000)
   CloakedEnemyDetection=(Name="Cloaked Enemy Detection Range",Increment=200.000000,StartingValue=1000.000000,MaxValue=6000.000000)
   ZedTimeExtension=(Name="Zed Time Extension",Increment=1.000000,StartingValue=1.000000,MaxValue=6.000000)
   ReloadSpeed=(Name="Reload Speed",Increment=0.020000,MaxValue=0.100000)
   CallOut=(Name="Call Out",Increment=2.000000,MaxValue=50.000000)
   NightVision=(Name="Night Vision")
   RapidFireFiringRate=0.500000
   BackupWeaponSwitchModifier=0.500000
   HollowPointRecoilModifier=0.500000
   HealthArmorModifier=0.250000
   WhiteMaterial=Texture2D'EngineResources.WhiteSquareTexture'
   ProgressStatID=1
   PerkBuildStatID=2
   SecondaryXPModifier(0)=3
   SecondaryXPModifier(1)=5
   SecondaryXPModifier(2)=6
   SecondaryXPModifier(3)=9
   PerkName="Commando"
   Passives(0)=(Title="Perk Weapon Damage",Description="Perk weapon damage increases %x% per level")
   Passives(1)=(Title="Cloaked Enemy & Health Bar Detection",Description="Range of 5m plus %x%m per level")
   Passives(2)=(Title="Zed Time Extension",Description="Zed time increases %x% every 5 levels")
   Passives(3)=(Title="Reload Speed",Description="Perk weapon reload speed increases %x%% every 5 levels")
   Passives(4)=(Title="Night Vision Capability",Description="Flashlights - AND Night Vision Goggles")
   Passives(5)=(Title="Call Out Cloaked Zeds",Description="Allow teammates to see cloaked units")
   SkillCatagories(0)="Ammo Management"
   SkillCatagories(1)="Tactics"
   SkillCatagories(2)="Survival"
   SkillCatagories(3)="Weapon Specialist"
   SkillCatagories(4)="Advanced Training"
   EXPAction1="Dealing Commando weapon damage"
   EXPAction2="Killing Stalkers with Commando weapons"
   PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Commando'
   PerkSkills(0)=(Name="TacticalReload",IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_TacticalReload")
   PerkSkills(1)=(Name="LargeMags",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_LargeMag")
   PerkSkills(2)=(Name="Backup",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_Backup")
   PerkSkills(3)=(Name="Impact",StartingValue=1.500000,MaxValue=1.500000,IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_Impact")
   PerkSkills(4)=(Name="HealthIncrease",StartingValue=0.250000,MaxValue=0.250000,IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_HP")
   PerkSkills(5)=(Name="AmmoVest",StartingValue=0.200000,MaxValue=0.200000,IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_AmmoVest")
   PerkSkills(6)=(Name="HollowPoints",StartingValue=0.300000,MaxValue=0.300000,IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_SingleFire")
   PerkSkills(7)=(Name="EatLead",StartingValue=1.000000,MaxValue=1.000000,IconPath="UI_PerkTalent_TEX.Commando.UI_Talents_Commando_AutoFire")
   PerkSkills(8)=(Name="Professional",IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_Professional")
   PerkSkills(9)=(Name="RapidFire",StartingValue=0.030000,MaxValue=0.030000,IconPath="UI_PerkTalent_TEX.commando.UI_Talents_Commando_RapidFire")
   ZedTimeModifyingStates(0)="WeaponFiring"
   ZedTimeModifyingStates(1)="WeaponBurstFiring"
   ZedTimeModifyingStates(2)="WeaponSingleFiring"
   bCanSeeCloakedZeds=True
   PrimaryWeaponDef=Class'KFGame.KFWeapDef_AR15'
   GrenadeWeaponDef=Class'KFGame.KFWeapDef_Grenade_Commando'
   AutoBuyLoadOutPath(0)=Class'KFGame.KFWeapDef_AR15'
   AutoBuyLoadOutPath(1)=Class'KFGame.KFWeapDef_Bullpup'
   AutoBuyLoadOutPath(2)=Class'KFGame.KFWeapDef_AK12'
   AutoBuyLoadOutPath(3)=Class'KFGame.KFWeapDef_SCAR'
   HeadshotAccuracyHandicap=-3.000000
   PrestigeRewardItemIconPaths(0)="WEP_SkinSet_Prestige01_Item_TEX.knives.CommandoKnife_PrestigePrecious_Mint_large"
   Name="Default__KFPerk_Commando"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
