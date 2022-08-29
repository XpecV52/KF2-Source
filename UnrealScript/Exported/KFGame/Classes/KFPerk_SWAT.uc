//=============================================================================
// KFPerk_SWAT
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Chris "schneidzekk" Schneider
//=============================================================================

class KFPerk_SWAT extends KFPerk
	native;

//`include(KFOnlineStats.uci)

/** Passives */
var	private const PerkSkill 				WeaponDamage;						// 1% increased Perk weapon damage per level (max 25%)
var private	const PerkSkill					BulletResistance;
var private	const PerkSkill					MagSize;
var private	const PerkSkill					WeaponSwitchSpeed;

var private const float						RapidAssaultFiringRate;    			// Faster firing rate in %  NOTE:This is needed for combinations with the Skill: RapidAssault (Stumble Power and Rate)
var private const float 					SnarePower;
var private const float 					TacticalMovementBobDamp;
var private const class<KFWeaponDefinition>	BackupSecondaryWeaponDef;

/** Percentage of how much armor should be damaged when the heavy armor skill is active */
var private const float 					HeavyArmorAbsorptionPct;

var float                                   CurrentHealthPenalty;

/** Selectable skills */
enum ESWATPerkSkills
{
	ESWAT_HeavyArmor,
	ESWAT_TacticalMovement,
	ESWAT_Backup,
	ESWAT_TacticalReload,
	ESWAT_SpecialAmmunition,
	ESWAT_AmmoVest,
	ESWAT_BodyArmor,
	ESWAT_Cripple,
	ESWAT_SWATEnforcer,
	ESWAT_RapidAssault
};

replication
{
    if (bNetDirty)
        CurrentHealthPenalty;
}

/*********************************************************************************************
* @name	 Perk init and spawning
******************************************************************************************** */

/** On spawn, modify owning pawn based on perk selection */
function SetPlayerDefaults( Pawn PlayerPawn )
{
	local float NewArmor;

	super.SetPlayerDefaults( PlayerPawn );

	if( OwnerPawn.Role == ROLE_Authority )
	{
		if( IsHeavyArmorActive() )
		{
			NewArmor += OwnerPawn.default.MaxArmor * GetSKillValue( PerkSkills[ESWAT_HeavyArmor] );
		}

		if( IsBodyArmorActive() )
		{
			NewArmor += OwnerPawn.default.MaxArmor * GetSKillValue( PerkSkills[ESWAT_BodyArmor] );
		}

		OwnerPawn.AddArmor( Round( NewArmor ) );
	}
}

/** (Server) Modify Instigator settings based on selected perk */
function ApplySkillsToPawn()
{
	super.ApplySkillsToPawn();

	if( OwnerPawn != none )
	{
		OwnerPawn.bMovesFastInZedTime = IsSWATEnforcerActive();
	}
}

/* Returns the secondary weapon's class path for this perk */
simulated function string GetSecondaryWeaponClassPath()
{
	return IsBackupActive() ? BackupSecondaryWeaponDef.default.WeaponClassPath : SecondaryWeaponDef.default.WeaponClassPath;
}

/*********************************************************************************************
* @name	 Passives
********************************************************************************************* */
/**
 * @brief Modifies the damage taken
 *
 * @param InDamage damage
 * @param DamageType the damage type used (optional)
 */
function ModifyDamageTaken( out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy )
{
	local float TempDamage;

	if( InDamage <= 0 )
	{
		return;
	}

	TempDamage = InDamage;

	if( ClassIsChildOf( DamageType, class'KFDT_Ballistic' ) )
	{
		TempDamage -= InDamage * GetPassiveValue( BulletResistance, CurrentLevel );
	}

	;
	InDamage = Round( TempDamage );
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

	if( !bSecondary && !Is9mm( KFW ) && IsWeaponOnPerk( KFW, WeaponPerkClass, self.class ) && (KFW == none || !KFW.bNoMagazine) )
	{
		TempCapacity += MagazineCapacity * GetPassiveValue( MagSize, CurrentLevel );
	}

	MagazineCapacity = Round(TempCapacity);
}

/**
 * @brief The Quick Switch skill modifies the weapon switch speed
 *
 * @param ModifiedSwitchTime Duration of putting down or equipping the weapon
 */
simulated function ModifyWeaponSwitchTime( out float ModifiedSwitchTime )
{
	;
	ModifiedSwitchTime *= 1.f - GetPassiveValue( WeaponSwitchSpeed, CurrentLevel );
}

/*********************************************************************************************
* @name	 Selectable skills functions
********************************************************************************************* */

/**
 * @brief Checks if the player can be grabbed by clots
 *
 * @return true if we are not grabbable
 */
function bool CanNotBeGrabbed()
{
	return IsHeavyArmorActive();
}

simulated function bool HasHeavyArmor()
{
	return IsHeavyArmorActive();
}

static simulated private function bool Is9mm( KFWeapon KFW )
{
	return KFW != none && KFW.default.bIsBackupWeapon && !KFW.IsMeleeWeapon();
}

/**
 * @brief The Tactical Movement skill lets you move quicker in iron sights
 *
 * @param KFW Weapon equipped
 * @return Speed modifier
 */
simulated event float GetIronSightSpeedModifier( KFWeapon KFW )
{
	if( IsTacticalMovementActive() && (Is9mm( KFW ) || IsWeaponOnPerk( KFW,, self.class )) )
	{
		;
		return  GetSkillValue( PerkSkills[ESWAT_TacticalMovement] );
	}

	return 1.f;
}

/**
 * @brief Triggered via KFPawn_Human.UpdateGroundSpeed.  Update any speed-related variables that need to be set when
 *              the pawn's allowed ground speed changes.
 */
function FinalizeSpeedVariables()
{
    super.FinalizeSpeedVariables();
	if(OwnerPawn != none)
	{
		CurrentHealthPenalty = 1 - OwnerPawn.LowHealthSpeedPenalty;
	}
}

/**
 * @brief The Tactical Movement skill lets you move quicker in iron sights
 *
 * @param KFW Weapon equipped
 * @return Speed modifier
 */
simulated event float GetCrouchSpeedModifier( KFWeapon KFW )
{
	if( IsTacticalMovementActive() && (Is9mm( KFW ) || IsWeaponOnPerk( KFW,, self.class )) )
	{
		;
		return  GetSkillValue( PerkSkills[ESWAT_TacticalMovement] ) * CurrentHealthPenalty;
	}

	return 1.f;
}

simulated function ModifyWeaponBopDamping( out float BobDamping, KFWeapon PawnWeapon )
{
	If( IsTacticalMovementActive() && (Is9mm( PawnWeapon ) || IsWeaponOnPerk( PawnWeapon,, self.class )) )
	{
		BobDamping *= default.TacticalMovementBobDamp;
	}
}

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

	if( KFW != none )
	{
		if( IsBackupActive() && IsBackupWeapon( KFW ) )
		{
			;
			TempDamage += InDamage * GetSkillValue( PerkSkills[ESWAT_Backup] );
		}
		else if( IsWeaponOnPerk( KFW,, self.class ) || (DamageType != none && IsDamageTypeOnPerk(DamageType)) )
		{
			;
			TempDamage *= GetPassiveValue( WeaponDamage, CurrentLevel );
		}
	}

	;
	InDamage = Round(TempDamage);
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

	if( IsAmmoVestActive() && !Is9mm(KFW) && IsWeaponOnPerk( KFW, TraderItem.AssociatedPerkClasses, self.class ) )
	{
		TempMaxSpareAmmoAmount = MaxSpareAmmo;
		TempMaxSpareAmmoAmount += MaxSpareAmmo * GetSkillValue( PerkSkills[ESWAT_AmmoVest] );
		MaxSpareAmmo = Round( TempMaxSpareAmmoAmount );
	}
}

simulated static function float GetSnareSpeedModifier()
{
	return default.PerkSkills[ESWAT_Cripple].StartingValue;
}

simulated function float GetSnarePowerModifier( optional class<DamageType> DamageType, optional byte HitZoneIdx )
{
	if( IsCrippleActive() && DamageType != none && IsDamageTypeOnPerk( class<KFDamageType>(DamageType) ) )
	{
		return default.SnarePower;
	}

	return 0.f;
}

/**
 * @brief Modifies the pawn's MaxArmor
 *
 * @param MaxArmor the maximum armor value
 */
function ModifyArmor( out byte MaxArmor )
{
	local float TempArmor;

	if( IsBodyArmorActive() )
	{
		TempArmor = MaxArmor;
		TempArmor += TempArmor * GetSkillValue( PerkSkills[ESWAT_BodyArmor] );
		;
		MaxArmor = Round( TempArmor );
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
	if( IsRapidAssaultActive() && (Is9mm(W) || IsWeaponOnPerk( W,, self.class )) )
	{
		if( ZedTimeModifyingStates.Find( StateName ) != INDEX_NONE )
		{
			;
			return RapidAssaultFiringRate;
		}
	}

	return 0.f;
}

/**
 * @brief skills and weapons can modify the stumbling power
 * @return stumbling power modifier
 */
function float GetStumblePowerModifier( optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart )
{
	local KFWeapon KFW;
	local float StumbleModifier;

	StumbleModifier = 0.f;

	KFW = GetOwnerWeapon();
	if( IsSpecialAmmunitionActive() && (Is9mm(KFW) || IsWeaponOnPerk( KFW,, self.class )) )
	{
		StumbleModifier += GetSkillValue( PerkSkills[ESWAT_SpecialAmmunition] );
		;
	}

	if( IsRapidAssaultActive() )
	{
		StumbleModifier += GetSkillValue( PerkSkills[ESWAT_RapidAssault] );
		;
	}


	return StumbleModifier;
}

/**
 * @brief Checks if Rapid Assault is selected and if the weapon is on perk
 *
 * @param KFW Weapon used
 * @return true or false
 */
simulated function bool GetIsUberAmmoActive( KFWeapon KFW )
{
	return IsRapidAssaultActive() && (Is9mm(KFW) || IsWeaponOnPerk( KFW,, self.class ));
}

simulated function bool ShouldKnockDownOnBump()
{
	return IsSWATEnforcerActive() && WorldInfo.TimeDilation < 1.f;
}

simulated function int GetArmorDamageAmount( int AbsorbedAmt )
{
	if( HasHeavyArmor() )
	{
		return Max( Round(AbsorbedAmt * HeavyArmorAbsorptionPct), 1 );
	}

	return AbsorbedAmt;
}

/*********************************************************************************************
* @name	 Getters etc
********************************************************************************************* */

/**
 * @brief Checks if the Riot Shield skill is active
 *
 * @return true/false
 */
simulated function bool IsHeavyArmorActive()
{
	return PerkSkills[ESWAT_HeavyArmor].bActive && IsPerkLevelAllowed(ESWAT_HeavyArmor);
}


/**
 * @brief Checks if the Tactical Movement skill is active
 *
 * @return true/false
 */
simulated function bool IsTacticalMovementActive()
{
	return PerkSkills[ESWAT_TacticalMovement].bActive && IsPerkLevelAllowed(ESWAT_TacticalMovement);
}

/**
 * @brief Checks if backup damage skill is active
 *
 * @return true/false
 */
simulated private function bool IsBackupActive()
{
	return PerkSkills[ESWAT_Backup].bActive && IsPerkLevelAllowed(ESWAT_Backup);
}

/**
 * @brief Checks if tactical reload skill is active (client & server)
 *
 * @return true/false
 */
simulated private function bool IsTacticalReloadActive()
{
	return PerkSkills[ESWAT_TacticalReload].bActive && IsPerkLevelAllowed(ESWAT_TacticalReload);
}

/**
 * @brief Should the tactical reload skill adjust the reload speed
 *
 * @param KFW weapon in use
 * @return true/false
 */
simulated function bool GetUsingTactialReload( KFWeapon KFW )
{
	return ( IsTacticalReloadActive() && (Is9mm(KFW) || IsWeaponOnPerk( KFW,, self.class )) );
}

/**
 * @brief Checks if Special Ammunition skill is active
 *
 * @return true/false
 */
simulated function bool IsSpecialAmmunitionActive()
{
	return PerkSkills[ESWAT_SpecialAmmunition].bActive && IsPerkLevelAllowed(ESWAT_SpecialAmmunition);
}

/**
 * @brief Checks if Ammo Vest skill is active
 *
 * @return true/false
 */
final simulated private function bool IsAmmoVestActive()
{
	return PerkSkills[ESWAT_AmmoVest].bActive && IsPerkLevelAllowed(ESWAT_AmmoVest);
}

/**
 * @brief Checks if Body Armor skill is active
 *
 * @return true/false
 */
final private function bool IsBodyArmorActive()
{
	return PerkSkills[ESWAT_BodyArmor].bActive && IsPerkLevelAllowed(ESWAT_BodyArmor);
}

/**
 * @brief Checks if the Cripple skill is active
 *
 * @return true/false
 */
final private function bool IsCrippleActive()
{
	return PerkSkills[ESWAT_Cripple].bActive && IsPerkLevelAllowed(ESWAT_Cripple);
}

/**
 * @brief Menace and Spartan resist zed time. You move at normal speed.
 *
 * @return true if Menace or Spartan are active
 */
function bool IsSWATEnforcerActive()
{
	return PerkSkills[ESWAT_SWATEnforcer].bActive && IsPerkLevelAllowed(ESWAT_SWATEnforcer);
}

/**
 * @brief Rapid Assault resists zed time. You shoot at normal speed.
 *
 * @return true if Menace or Spartan are active
 */
simulated function bool IsRapidAssaultActive()
{
	return PerkSkills[ESWAT_RapidAssault].bActive && WorldInfo.TimeDilation < 1.f && IsPerkLevelAllowed(ESWAT_RapidAssault);
}

/*********************************************************************************************
* @name	 Hud/UI/Stats/Exp
********************************************************************************************* */

/**
 * @brief how much XP is earned by a stalker kill depending on the game's difficulty
 *
 * @param Difficulty current game difficulty
 * @return XP earned
 */
simulated static function int GetClotKillXP( byte Difficulty )
{
	return default.SecondaryXPModifier[Difficulty];
}

simulated static function GetPassiveStrings( out array<string> PassiveValues, out array<string> Increments, byte Level )
{
	PassiveValues[0] = Round( GetPassiveValue( default.WeaponDamage, Level ) * 100 - 100 ) $ "%";
	PassiveValues[1] = Round( GetPassiveValue( default.BulletResistance, Level) * 100 ) $ "%";
	PassiveValues[2] = Round( GetPassiveValue( default.MagSize, Level ) * 100 ) $ "%";		// Divide by 100 to convert unreal units to meters
	PassiveValues[3] = Round( GetPassiveValue( default.WeaponSwitchSpeed, Level) * 100 ) $ "%";
	PassiveValues[4] = "";

	Increments[0] = "[" @ Left( string( default.WeaponDamage.Increment * 100 ), InStr(string(default.WeaponDamage.Increment * 100), ".") + 2 ) $ "% /" @ default.LevelString @ "]";
	Increments[1] = "[" @ "5% +" @ Round( default.BulletResistance.Increment * 100 ) $ "% /" @ default.LevelString @"]";
	Increments[2] = "[" @ Round( default.MagSize.Increment * 100 )  $"% /" @default.LevelString @"]";
	Increments[3] = "[" @ Round( default.WeaponSwitchSpeed.Increment *100 )  $"% /" @ default.LevelString @"]";
	Increments[4] = "";
}

defaultproperties
{
   WeaponDamage=(Name="Weapon Damage",Increment=0.010000,StartingValue=1.000000,MaxValue=1.250000)
   BulletResistance=(Name="Bullet Resistance",Increment=0.010000,StartingValue=0.050000,MaxValue=0.300000)
   MagSize=(Name="Increased Mag Size",Increment=0.040000,MaxValue=1.000000)
   WeaponSwitchSpeed=(Name="Weapon Switch Speed",Increment=0.010000,MaxValue=0.250000)
   RapidAssaultFiringRate=0.510000
   SnarePower=9.000000
   TacticalMovementBobDamp=1.110000
   BackupSecondaryWeaponDef=Class'KFGame.KFWeapDef_9mmDual'
   HeavyArmorAbsorptionPct=0.650000
   ProgressStatID=90
   PerkBuildStatID=91
   SecondaryXPModifier(0)=2
   SecondaryXPModifier(1)=3
   SecondaryXPModifier(2)=4
   SecondaryXPModifier(3)=7
   PerkName="SWAT"
   Passives(0)=(Title="Perk Weapon Damage",Description="Increase perk weapon damage %x% per level")
   Passives(1)=(Title="Bullet Resistance",Description="Increase resistance to projectile damage 5%, increases %x% each level")
   Passives(2)=(Title="Increased Mag Size",Description="Increase magazine size %x% per level")
   Passives(3)=(Title="Weapon Switch Speed",Description="Increase weapon switch speed %x% per level")
   Passives(4)=()
   SkillCatagories(0)="Specialization"
   SkillCatagories(1)="Assault Techniques"
   SkillCatagories(2)="Equipment"
   SkillCatagories(3)="Defensive Techniques"
   SkillCatagories(4)="Specialist Training"
   EXPAction1="Dealing SWAT weapon damage"
   EXPAction2="Killing Clots with SWAT weapons"
   PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_SWAT'
   PerkSkills(0)=(Name="HeavyArmor",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_HeavyArmor")
   PerkSkills(1)=(Name="TacticalMovement",StartingValue=2.500000,MaxValue=2.500000,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_TacticalMovement")
   PerkSkills(2)=(Name="Backup",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_Backup")
   PerkSkills(3)=(Name="TacticalReload",StartingValue=2.000000,MaxValue=2.000000,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_TacticalReload")
   PerkSkills(4)=(Name="SpecialAmmunition",StartingValue=2.000000,MaxValue=2.000000,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_SpecialAmmunition")
   PerkSkills(5)=(Name="AmmoVest",StartingValue=0.300000,MaxValue=0.300000,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_AmmoVest")
   PerkSkills(6)=(Name="BodyArmor",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_BodyArmor")
   PerkSkills(7)=(Name="Cripple",StartingValue=0.700000,MaxValue=0.700000,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_Cripple")
   PerkSkills(8)=(Name="SWATEnforcer",StartingValue=1.000000,MaxValue=1.000000,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_SWATEnforcer")
   PerkSkills(9)=(Name="RapidAssault",StartingValue=1.000000,MaxValue=1.000000,IconPath="UI_PerkTalent_TEX.SWAT.UI_Talents_SWAT_RapidAssault")
   ZedTimeModifyingStates(0)="WeaponFiring"
   ZedTimeModifyingStates(1)="WeaponBurstFiring"
   ZedTimeModifyingStates(2)="WeaponSingleFiring"
   PrimaryWeaponDef=Class'KFGame.KFWeapDef_MP7'
   KnifeWeaponDef=Class'KFGame.KFWeapDef_Knife_SWAT'
   GrenadeWeaponDef=Class'KFGame.KFWeapDef_Grenade_SWAT'
   AutoBuyLoadOutPath(0)=Class'KFGame.KFWeapDef_MP7'
   AutoBuyLoadOutPath(1)=Class'KFGame.KFWeapDef_MP5RAS'
   AutoBuyLoadOutPath(2)=Class'KFGame.KFWeapDef_P90'
   AutoBuyLoadOutPath(3)=Class'KFGame.KFWeapDef_Kriss'
   HeadshotAccuracyHandicap=-3.000000
   PrestigeRewardItemIconPaths(0)="WEP_SkinSet_Prestige01_Item_TEX.knives.SWATKnife_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(1)="WEP_SkinSet_Prestige02_Item_TEX.tier01.MP7_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(2)="WEP_skinset_prestige03_itemtex.tier02.MP5RAS_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(3)="wep_skinset_prestige04_itemtex.tier03.HecklerKochUMP_PrestigePrecious_Mint_large"
   Name="Default__KFPerk_SWAT"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
