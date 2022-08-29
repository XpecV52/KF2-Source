//=============================================================================
// KFPerk_Support
//=============================================================================
// Support Perk
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFPerk_Support extends KFPerk
	hidecategories(Mobile, Object, Debug, Advanced, Physics, Actor, Attachment, Display)
	native;

//`include(KFOnlineStats.uci)

struct native sSuppliedPawnInfo
{
	var KFPawn_Human SuppliedPawn;
	var bool bSuppliedAmmo;
	var bool bSuppliedArmor;
};

/** Passives */
var private	const PerkSkill 					Ammo;       				// Increased ammo
var private const PerkSkill 					WeldingProficiency;         // Welding speed modifier
var	private const PerkSkill 					ShotgunDamage;              // Shotgun dmg modifier
var	private const PerkSkill 					ShotgunPenetration;			// Shotgun extra penetration Use INTs only
var	private const PerkSkill 					Strength;              

var	private		  Array<sSuppliedPawnInfo> 		SuppliedPawnList;
var	private const float 						BarrageFiringRate;
var	private const float 						ResupplyMaxSpareAmmoModifier;
var private const AkEvent						ReceivedAmmoSound;
var private const AkEvent 						ReceivedArmorSound;
var private const AkEvent						ReceivedAmmoAndArmorSound;

var private const name 							BoomstickClassName;

var	private	const array<Name>					AdditionalOnPerkDTNames;

var	private const int						    DoorRepairXP[4];            // Door repair XP per-difficulty

enum ESupportPerkSkills
{
	ESupportHighCapMags,
	ESupportTacticalReload,
	ESupportFortitude,
	ESupportSalvo,
	ESupportAPShot,
	ESupportTightChoke,
	ESupportResupply,
	ESupportConcussionRounds,
	ESupportPerforate,
	ESupportBarrage,
};

/*********************************************************************************************
* @name	 Perk init and spawning
******************************************************************************************** */
/**
 * @brief(Server) Modify Instigator settings based on selected perk
 */
function ApplySkillsToPawn()
{
	local KFGameReplicationInfo KFGRI;

	Super.ApplySkillsToPawn();

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	if (KFGRI == none && KFGRI.bTraderIsOpen)
	{
		return;
	}
	//ResetSupplier();
}

/**
 * We need to separate this from ApplySkillsToPawn() to avoid resetting weight limits (and losing weapons)
 * every time a skill or level is changed 
 */
function ApplyWeightLimits()
{
	local KFInventoryManager KFIM;

	KFIM = KFInventoryManager(OwnerPawn.InvManager);
	if( KFIM != none )
	{
		;
		KFIM.MaxCarryBlocks = KFIM.default.MaxCarryBlocks + GetExtraStrength( CurrentLevel );
		CheckForOverWeight( KFIM );
	}
}

/**
 * @brief Calculates the additional carry blocks per perk level
 *
 * @param Level Current perk level
 * @return additional blocks
 */
simulated private final static function float GetExtraStrength( int Level )
{
	return default.Strength.Increment * FFloor( float( Level ) / 5.f );
}


/**
 * @brief Sets up the supplier skill
 */
simulated final private function ResetSupplier()
{
	if( MyPRI != none && IsSupplierActive() )
	{
		if( SuppliedPawnList.Length > 0 )
		{
			SuppliedPawnList.Remove( 0, SuppliedPawnList.Length );
		}

		MyPRI.PerkSupplyLevel = IsResupplyActive() ? 2 : 1;

		if( InteractionTrigger != none )
		{
			InteractionTrigger.Destroy();
			InteractionTrigger = none;
		}

		if( CheckOwnerPawn() )
		{
			InteractionTrigger = Spawn( class'KFUsablePerkTrigger', OwnerPawn,, OwnerPawn.Location, OwnerPawn.Rotation,, true );
			InteractionTrigger.SetBase( OwnerPawn );
			InteractionTrigger.SetInteractionIndex( IMT_ReceiveAmmo );
			OwnerPC.SetPendingInteractionMessage();
		}
	}
	else if( InteractionTrigger != none )
	{
		InteractionTrigger.Destroy();
	}
}

/*********************************************************************************************
* @name	 Passives
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
simulated function ModifyDamageGiven( out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx )
{
	local KFWeapon KFW;
	local float TempDamage;

	TempDamage = InDamage;
	;
	

	TempDamage = InDamage;

	if( DamageCauser != none )
	{
		KFW = GetWeaponFromDamageCauser( DamageCauser );
	}

	if( ((KFW != none && IsWeaponOnPerk( KFW,, self.class )) || (DamageType != none && IsDamageTypeOnPerk( DamageType ))) &&
		!ClassIsChildOf( DamageType, class'KFDT_Explosive' )  )
	{		
		TempDamage += InDamage * GetPassiveValue( ShotgunDamage, CurrentLevel );
		;

		if( IsSalvoActive() )
		{
			TempDamage += InDamage * GetSkillValue( PerkSkills[ESupportSalvo] );
			;
		}
	}

	;
	InDamage = Round( TempDamage );
}

/** Welding Proficiency - faster welding/unwelding */
/**
 * @brief Modifies the welding speed
 *
 * @param FastenRate how much faster do we weld
 * @param UnfastenRate how much faster do we unweld
 *
  */
simulated function ModifyWeldingRate( out float FastenRate, out float UnfastenRate )
{
	local float WeldingModifier;

	WeldingModifier = GetPassiveValue( WeldingProficiency, CurrentLevel );
	FastenRate *= WeldingModifier;
	UnFastenRate *= WeldingModifier;
	;
}

/**
 * @brief the higher the level the more can we penetrate
 *
 * @param Level current perk level
 * @param DamageType the use weapon's damage type
 * @param bForce
 * @return the additional penetrations
 */
simulated function float GetPenetrationModifier( byte Level, class<KFDamageType> DamageType, optional bool bForce  )
{
    local float PenetrationPower;
    // Only buff damage types that are associated with support
    if( !bForce && (DamageType == none || !IsDamageTypeOnPerk( Damagetype )) )
    {
        return 0;
    }

    PenetrationPower = IsAPShotActive() ? GetSkillValue( PerkSkills[ESupportAPShot] ) : 0.f;
    PenetrationPower = IsPerforateActive() ? GetSkillValue( PerkSkills[ESupportPerforate] ) : PenetrationPower;
    ;

    return PenetrationPower + GetPassiveValue( ShotgunPenetration, Level );
}

simulated function bool IgnoresPenetrationDmgReduction()
{ 
	return IsPerforateActive();
}

/*********************************************************************************************
* @name	 Selectable skills
********************************************************************************************* */
/**
 * @brief Modifies mag capacity and count
 *
 * @param KFW the weapon
 * @param MagazineCapacity modified mag capacity
 * @param WeaponPerkClass the weapon's associated perk class (optional)
 */
simulated function ModifyMagSizeAndNumber( KFWeapon KFW, out byte MagazineCapacity, optional array< Class<KFPerk> > WeaponPerkClass, optional bool bSecondary=false, optional name WeaponClassName)
{
	local float TempCapacity;

	TempCapacity = MagazineCapacity;

	if( !bSecondary && IsWeaponOnPerk( KFW, WeaponPerkClass, self.class ) && (KFW == none || !KFW.bNoMagazine) &&
		WeaponClassName != BoomstickClassName )
	{
		if( IsHighCapMagsMagActive() )
		{
			TempCapacity += MagazineCapacity * GetSkillValue( PerkSkills[ESupportHighCapMags] );
		}
	}

	MagazineCapacity = Round(TempCapacity);
}

/**
 * @brief Modifies starting spare ammo
 *
 * @param KFW The weapon
 * @param PrimarySpareAmmo ammo amount
 * @param TraderItem the weapon's associated trader item info
 */
simulated function ModifySpareAmmoAmount( KFWeapon KFW, out int PrimarySpareAmmo, optional const out STraderItem TraderItem, optional bool bSecondary )
{
	local float TempSpareAmmoAmount;
	local array< class<KFPerk> > WeaponPerkClass;

	if(KFW == none)
	{
		WeaponPerkClass = TraderItem.AssociatedPerkClasses;
	}
	else
	{
		WeaponPerkClass = KFW.GetAssociatedPerkClasses();
	}
	
	if( IsWeaponOnPerk( KFW, WeaponPerkClass, self.class ) )
	{
		TempSpareAmmoAmount = PrimarySpareAmmo;
		TempSpareAmmoAmount += PrimarySpareAmmo * GetPassiveValue( Ammo, CurrentLevel );
		PrimarySpareAmmo = Round( TempSpareAmmoAmount );
	}
}

/**
 * @brief Modifies the max spare ammo
 *
 * @param KFW The weapon
 * @param PrimarySpareAmmo ammo amount
 * @param TraderItem the weapon's associated trader item info
 */
simulated function ModifyMaxSpareAmmoAmount( KFWeapon KFW, out int MaxSpareAmmo, optional const out STraderItem TraderItem, optional bool bSecondary=false )
{
	local float TempMaxSpareAmmoAmount;
	local array< class<KFPerk> > WeaponPerkClass;

	if(KFW == none)
	{
		WeaponPerkClass = TraderItem.AssociatedPerkClasses;
	}
	else
	{
		WeaponPerkClass = KFW.GetAssociatedPerkClasses();
	}
	
	if( IsWeaponOnPerk( KFW, WeaponPerkClass, self.class ) && MaxSpareAmmo > 0 )
	{
		TempMaxSpareAmmoAmount = MaxSpareAmmo;
		TempMaxSpareAmmoAmount += MaxSpareAmmo * GetPassiveValue( Ammo, CurrentLevel );
		 ;

		if( IsResupplyActive() )
		{
			TempMaxSpareAmmoAmount += MaxSpareAmmo * GetResupplyMaxSpareAmmoModifier();
			;
		}

		MaxSpareAmmo = Round( TempMaxSpareAmmoAmount );
	}
}

simulated private static function float GetResupplyMaxSpareAmmoModifier()
{
	return default.ResupplyMaxSpareAmmoModifier;
}

/**
 * @brief Should the tactical reload skill adjust the reload speed
 *
 * @param KFW weapon in use
 * @return true/false
 */
simulated function bool GetUsingTactialReload( KFWeapon KFW )
{
	return IsTacticalReloadActive() && (IsWeaponOnPerk( KFW,, self.class ) || IsBackupWeapon( KFW ));
}

/**
 * @brief modifies the players health
 *
 * @param InHealth health
  */
function ModifyHealth( out int InHealth )
{
	local float TempHealth;

	if( IsFortitudeActive() )
	{
		TempHealth = InHealth;
		TempHealth += InHealth * GetSkillValue( PerkSkills[ESupportFortitude] );
		InHealth = FCeil( TempHealth );
	}
}

simulated function float GetTightChokeModifier()
{ 
	if( IsTightChokeActive() )
	{
		return GetSkillValue( PerkSkills[ESupportTightChoke] );
	}

	return super.GetTightChokeModifier();
}

/**
 * @brief skills and weapons can modify the stumbling power
 * @return stumbling power modifier
 */
function float GetStumblePowerModifier( optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart )
{
	if( IsWeaponOnPerk( GetOwnerWeapon(),, self.class ) && IsConcussionRoundsActive() )
	{
		return GetSkillValue( PerkSkills[ESupportConcussionRounds] );
	}

	return 0.f;
}

/**
 * @brief General interaction with another pawn, here: give ammo
 *
 * @param KFPH Pawn to interact with
 */
simulated function Interact( KFPawn_Human KFPH )
{
	local KFWeapon KFW;
	local int Idx, MagCount;
	local KFPlayerController KFPC;
	local KFPlayerReplicationInfo UserPRI, OwnerPRI;
	local bool bCanSupplyAmmo, bCanSupplyArmor;
	local bool bReceivedAmmo, bReceivedArmor;
	local sSuppliedPawnInfo SuppliedPawnInfo;
	
	// Do nothing if supplier isn't active
	if( !IsSupplierActive() )
	{
		return;
	}

	bCanSupplyAmmo = true;
	bCanSupplyArmor = true;
	Idx = SuppliedPawnList.Find( 'SuppliedPawn', KFPH );
	if( Idx != INDEX_NONE )
	{
		bCanSupplyAmmo = !SuppliedPawnList[Idx].bSuppliedAmmo;
		bCanSupplyArmor = !SuppliedPawnList[Idx].bSuppliedArmor;
		if( !bCanSupplyAmmo && !bCanSupplyArmor )
		{
			return;
		}
	}

	if( bCanSupplyAmmo )
	{
		foreach KFPH.InvManager.InventoryActors( class'KFWeapon', KFW )
		{
			if( KFW.static.DenyPerkResupply() )
			{
				continue;
			}

			// resupply 1 mag for every 5 initial mags
			MagCount = Max( KFW.InitialSpareMags[0] / 1.5, 1 ); // 3, 1
			;
			bReceivedAmmo = (KFW.AddAmmo( MagCount * KFW.MagazineCapacity[0] * (IsResupplyActive() ? 1.3f : 1.0f) ) > 0 ) ? true : bReceivedAmmo;

	        if( KFW.CanRefillSecondaryAmmo() )
	        {
	        	// resupply 1 mag for every 5 initial mags
	        	;

	        	// If our secondary ammo isn't mag-based (like the Eviscerator), restore a portion of max ammo instead
	        	bReceivedAmmo = (KFW.AddSecondaryAmmo( Max(KFW.AmmoPickupScale[1] * (IsResupplyActive() ? 1.3f : 1.0f) * KFW.MagazineCapacity[1], 1) ) > 0) ? true : bReceivedAmmo;
	        }
		}
	}
	
	if( bCanSupplyArmor && IsResupplyActive() && KFPH.Armor != KFPH.GetMaxArmor() )
	{
		KFPH.AddArmor( KFPH.MaxArmor * GetSkillValue( PerkSkills[ESupportResupply] ) );
		bReceivedArmor = true;
	}

	// Add to array (if necessary) and flag as supplied as needed
	if( bReceivedArmor || bReceivedAmmo )
	{
		if( Idx == INDEX_NONE )
		{
			SuppliedPawnInfo.SuppliedPawn = KFPH;
			SuppliedPawnInfo.bSuppliedAmmo = bReceivedAmmo;
			SuppliedPawnInfo.bSuppliedArmor = bReceivedArmor;
			Idx = SuppliedPawnList.Length;
			SuppliedPawnList.AddItem( SuppliedPawnInfo );
		}
		else
		{
			SuppliedPawnList[Idx].bSuppliedAmmo = SuppliedPawnList[Idx].bSuppliedAmmo || bReceivedAmmo;
			SuppliedPawnList[Idx].bSuppliedArmor = SuppliedPawnList[Idx].bSuppliedArmor || bReceivedArmor;
		}

		if( Role == ROLE_Authority )
		{
			KFPC = KFPlayerController( KFPH.Controller );
			if( bReceivedAmmo )
			{
				OwnerPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', bReceivedArmor ? GMT_GaveAmmoAndArmorTo : GMT_GaveAmmoTo, KFPC.PlayerReplicationInfo );
				KFPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', bReceivedArmor ? GMT_ReceivedAmmoAndArmorFrom : GMT_ReceivedAmmoFrom, OwnerPC.PlayerReplicationInfo );
			}
			else if( bReceivedArmor )
			{
				OwnerPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_GaveArmorTo, KFPC.PlayerReplicationInfo );
				KFPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_ReceivedArmorFrom, OwnerPC.PlayerReplicationInfo );
			}

			UserPRI = KFPlayerReplicationInfo( KFPC.PlayerReplicationInfo );
			OwnerPRI = KFPlayerReplicationInfo( OwnerPC.PlayerReplicationInfo );
			if( UserPRI != none && OwnerPRI != none )
			{
				UserPRI.MarkSupplierOwnerUsed( OwnerPRI, SuppliedPawnList[Idx].bSuppliedAmmo, SuppliedPawnList[Idx].bSuppliedArmor );
			}
		}
	}
	else if( Role == ROLE_Authority )
	{
		KFPC = KFPlayerController( KFPH.Controller );
		if( IsResupplyActive() )
		{
			KFPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_AmmoAndArmorAreFull, OwnerPC.PlayerReplicationInfo );
		}
		else
		{
			KFPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_AmmoIsFull, OwnerPC.PlayerReplicationInfo );			
		}
	}
}

/**
 * @brief Can other pawns interact with us?
 *
 * @param MyKFPH the other pawn
 * @return true/false
 */
simulated function bool CanInteract( KFPawn_HUman MyKFPH )
{
	local int Idx;

	if( IsSupplierActive() )
	{
		Idx = SuppliedPawnList.Find( 'SuppliedPawn', MyKFPH );

		// Pawn hasn't gotten anything from us yet
		if( Idx == INDEX_NONE )
		{
			return true;
		}

		// Resupply is active and pawn hasn't gotten armor yet
		if( IsResupplyActive() && !SuppliedPawnList[Idx].bSuppliedArmor )
		{
			return true;
		}

		// Pawn hasn't gotten ammo
		return !SuppliedPawnList[Idx].bSuppliedAmmo;
	}
}

simulated static function AKEvent GetReceivedAmmoSound()
{
	return default.ReceivedAmmoSound;
}

simulated static function AKEvent GetReceivedArmorSound()
{
	return default.ReceivedArmorSound;
}

simulated static function AKEvent GetReceivedAmmoAndArmorSound()
{
	return default.ReceivedAmmoAndArmorSound;
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

	if( IsWeaponOnPerk( W,, self.class ) && CouldBarrageActive() && 
		ZedTimeModifyingStates.Find( StateName ) != INDEX_NONE )
	{
		return BarrageFiringRate;
	}

	return 0.f;
}

/**
* @brief Resets certain perk values on wave start/end
*/
function OnWaveStart()
{
	Super.OnWaveStart();
	ResetSupplier();
}

simulated static function GetPassiveStrings( out array<string> PassiveValues, out array<string> Increments, byte Level )
{
	PassiveValues[0] = Round( (GetPassiveValue( default.WeldingProficiency, Level ) - 1) * 100) $ "%";
	PassiveValues[1] = Round( GetPassiveValue( default.ShotgunDamage, Level ) * 100) $ "%";
	PassiveValues[2] = Round( GetPassiveValue( default.ShotgunPenetration, Level ) * 100) $ "%";
	PassiveValues[3] = Round( GetPassiveValue( default.Ammo, Level ) * 100) $ "%";
	PassiveValues[4] = "";
	PassiveValues[5] = "";

	Increments[0] = "[" @ Left( string( default.WeldingProficiency.Increment * 100 ), InStr(string(default.WeldingProficiency.Increment * 100), ".") + 2 )	$ "% /" @ default.LevelString @ "]";
	Increments[1] = "[" @ Left( string( default.ShotgunDamage.Increment * 100 ), InStr(string(default.ShotgunDamage.Increment * 100), ".") + 2 )			$ "% /" @ default.LevelString @ "]";
	Increments[2] = "[" @ Left( string( default.ShotgunPenetration.Increment * 100 ), InStr(string(default.ShotgunPenetration.Increment * 100), ".") + 2 )	$ "% /" @ default.LevelString @ "]";
	Increments[3] = "[" @ Left( string( default.Ammo.Increment * 100 ), InStr(string(default.Ammo.Increment * 100), ".") + 2 )								$ "% /" @ default.LevelString @ "]";
	Increments[4] = "";
	Increments[5] = "";
}

/**
 * @brief DamageType on perk?
 *
 * @param KFDT The damage type
 * @return true/false
 */
static function bool IsDamageTypeOnPerk( class<KFDamageType> KFDT )
{
	if( KFDT != none && default.AdditionalOnPerkDTNames.Find( KFDT.name ) != INDEX_NONE )
	{
		return true;
	}

	return super.IsDamageTypeOnPerk( KFDT );
}

/*********************************************************************************************
* @name	 Getters
********************************************************************************************* */
/**
 * @brief Checks if the supplier skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsSupplierActive()
{
	return true;
}

/**
 * @brief Checks if the barrage skill is active and if we are in zed time
 *
 * @return true if we have the skill enabled
 */
private function bool IsBarrageActive()
{
	return PerkSkills[ESupportBarrage].bActive && WorldInfo.TimeDilation < 1.f && IsPerkLevelAllowed(ESupportBarrage);
}

simulated private function bool CouldBarrageActive()
{
	return PerkSkills[ESupportBarrage].bActive && IsPerkLevelAllowed(ESupportBarrage);
}

/**
 * @brief Checks if the ammo skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private function bool IsHighCapMagsMagActive()
{
	return PerkSkills[ESupportHighCapMags].bActive && IsPerkLevelAllowed(ESupportHighCapMags);
}

/**
 * @brief Checks if the fortitude skill is active
 *
 * @return true if we have the skill enabled
 */
private function bool IsFortitudeActive()
{
	return PerkSkills[ESupportFortitude].bActive && IsPerkLevelAllowed(ESupportFortitude);
}

/**
 * @brief Checks if the Salvo skill is active
 *
 * @return true if we have the skill enabled
 */
private function bool IsSalvoActive()
{
	return PerkSkills[ESupportSalvo].bActive && IsPerkLevelAllowed(ESupportSalvo);
}

/**
 * @brief Checks if the Armor Piercing Shot skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private function bool IsAPShotActive()
{
	return PerkSkills[ESupportAPShot].bActive && IsPerkLevelAllowed(ESupportAPShot);
}

/**
 * @brief Checks if the Tight Choke skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private function bool IsTightChokeActive()
{
	return PerkSkills[ESupportTightChoke].bActive && IsPerkLevelAllowed(ESupportTightChoke);
}

/**
 * @brief Checks if the tactical reload skill is active (client and server)
 *
 * @return true/false
 */
simulated private function bool IsTacticalReloadActive()
{
	return PerkSkills[ESupportTacticalReload].bActive && IsPerkLevelAllowed(ESupportTacticalReload);
}

/**
 * @brief Checks if the Concussion Rounds skill is active
 *
 * @return true/false
 */
private function bool IsConcussionRoundsActive()
{
	return PerkSkills[ESupportConcussionRounds].bActive && IsPerkLevelAllowed(ESupportConcussionRounds);
}

/**
 * @brief Checks if the Resupply skill is active
 *
 * @return true/false
 */
simulated private function bool IsResupplyActive()
{
	return PerkSkills[ESupportResupply].bActive && IsPerkLevelAllowed(ESupportResupply);
}

/**
 * @brief Checks if the Perforate skill is active
 *
 * @return true/false
 */
simulated private function bool IsPerforateActive()
{
	return PerkSkills[ESupportPerforate].bActive && WorldInfo.TimeDilation < 1.f && IsPerkLevelAllowed(ESupportPerforate);
}

/**
 * @brief Checks if we can repair doors
 *
 * @return true/false
 */
native function bool CanRepairDoors();

/**
 */
static function GetDoorRepairXP(out int XP, byte Difficulty)
{
    XP = default.DoorRepairXP[Difficulty];
}

/*********************************************************************************************
* @name	 Logging / debug
********************************************************************************************* */

/** Log What type of reload the weapon would use given ammo count */
private simulated function name LogTacticalReload()
{
	local KFWeapon KFW;

	KFW = GetOwnerWeapon();
	if( KFW != none )
	{
    	return KFW.GetReloadAnimName( GetUsingTactialReload(KFW) );
    }

    return '';
}
/** QA Logging - Report Perk Info */
simulated function LogPerkSkills()
{
	super.LogPerkSkills();

	if( bLogPerk )
	{
/**		`log( "PASSIVE PERKS" );
		`log( "-Welding Modifier:" @ (GetPassiveValue(WeldingProficiency, CurrentLevel) - 1) *100 $"%" );
		`log( "-Shotgun Damage Modifier:" @ (GetPassiveValue(ShotgunDamage, CurrentLevel) - 1) *100 $"%" );
		`log( "-Shotgun Penetration Modifier:" @ GetPassiveValue(default.ShotgunPenetration, CurrentLevel) );
		`log( "-Grenade Damage Modifier:" @ GetPassiveValue(GrenadeDamage, CurrentLevel, 100.f)*100 $"%" );

	    `log( "Skill Tree" );
	    `log( "-Ammo:" @ PerkSkills[ESupportTacticalReload].bActive );
		`log( "-Supplier:" @ IsSupplierActive()) ;
		`log( "-Fortitude:" @ PerkSkills[ESupportFortitude].bActive );
		`log( "-Regeneration:" @ PerkSkills[ESupportRegeneration].bActive );
		`log( "-Bombard:" @ PerkSkills[ESupportBombard].bActive );
		`log( "-Tactical Reload:" @ PerkSkills[ESupportTacticalReload].bActive @ LogTacticalReload() );
		`log( "-Strength:" @ PerkSkills[ESupportStrength].bActive );
		`log( "-Tenacity:" @ PerkSkills[ESupportTenacity].bActive );
		`log( "-Safeguard:" @ PerkSkills[ESupportSafeguard].bActive );
		`log( "-Barrage:" @ PerkSkills[ESupportBarrage].bActive );*/
	}
}

simulated function PlayerDied()
{
	super.PlayerDied();

	if(InteractionTrigger != none)
	{
		InteractionTrigger.DestroyTrigger();
	}
}

defaultproperties
{
   Ammo=(Name="Ammo",Increment=0.010000,MaxValue=0.250000)
   WeldingProficiency=(Name="Welding Proficiency",Increment=0.030000,StartingValue=1.000000,MaxValue=1.750000)
   ShotgunDamage=(Name="Shotgun Damage",Increment=0.010000,MaxValue=0.250000)
   ShotgunPenetration=(Name="Shotgun Penetration",Increment=0.200000,MaxValue=5.000000)
   Strength=(Name="Strength",Increment=1.000000,MaxValue=5.000000)
   BarrageFiringRate=0.900000
   ResupplyMaxSpareAmmoModifier=0.200000
   ReceivedAmmoSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Ammo'
   ReceivedArmorSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Armor'
   ReceivedAmmoAndArmorSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Armor'
   BoomstickClassName="KFWeap_Shotgun_DoubleBarrel"
   AdditionalOnPerkDTNames(0)="KFDT_Ballistic_Shotgun_Medic"
   AdditionalOnPerkDTNames(1)="KFDT_Ballistic_DragonsBreath"
   AdditionalOnPerkDTNames(2)="KFDT_Ballistic_NailShotgun"
   DoorRepairXP(0)=18
   DoorRepairXP(1)=24
   DoorRepairXP(2)=30
   DoorRepairXP(3)=42
   ProgressStatID=20
   PerkBuildStatID=21
   SecondaryXPModifier(0)=8
   SecondaryXPModifier(1)=8
   SecondaryXPModifier(2)=8
   SecondaryXPModifier(3)=8
   PerkName="Support"
   Passives(0)=(Title="Welding Proficiency",Description="Welding speed increased by %x% per level")
   Passives(1)=(Title="Shotgun Damage",Description="Perk weapon damage increased by %x% per level")
   Passives(2)=(Title="Shotgun Penetration",Description="Perk weapon penetration power increased by %x% per level")
   Passives(3)=(Title="Ammo",Description="Ammo increased by 15% plus %x% per level")
   Passives(4)=(Title="Increased Weight Capacity",Description="Weight capacity increased by 1 every 5 levels")
   Passives(5)=(Title="Ammo Backpack + Door repair",Description="Once per round players can get ammo from backpack - repair destroyed doors")
   SkillCatagories(0)="Ammo Management"
   SkillCatagories(1)="Training"
   SkillCatagories(2)="Firepower"
   SkillCatagories(3)="Logistics"
   SkillCatagories(4)="Advanced Training"
   EXPAction1="Dealing Support weapon damage"
   EXPAction2="Welding doors"
   PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Support'
   InteractIcon=Texture2D'UI_World_TEX.Support_Supplier_HUD'
   PerkSkills(0)=(Name="HighCapMags",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.support.UI_Talents_Support_HighCapacityMags")
   PerkSkills(1)=(Name="TacticalReload",StartingValue=0.800000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_TacticalReload")
   PerkSkills(2)=(Name="Fortitude",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Fortitude")
   PerkSkills(3)=(Name="Salvo",StartingValue=0.300000,MaxValue=0.300000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Salvo")
   PerkSkills(4)=(Name="APShot",StartingValue=4.000000,MaxValue=4.000000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_ArmorPiercing")
   PerkSkills(5)=(Name="TightChoke",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_TightChoke")
   PerkSkills(6)=(Name="Resupply",StartingValue=0.200000,MaxValue=0.200000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_ResupplyPack")
   PerkSkills(7)=(Name="ConcussionRounds",StartingValue=1.500000,MaxValue=1.500000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_ConcussionRounds")
   PerkSkills(8)=(Name="Perforate",StartingValue=40.000000,MaxValue=40.000000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Penetrator")
   PerkSkills(9)=(Name="Barrage",StartingValue=5.000000,MaxValue=5.000000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Barrage")
   ZedTimeModifyingStates(0)="WeaponFiring"
   ZedTimeModifyingStates(1)="WeaponBurstFiring"
   ZedTimeModifyingStates(2)="WeaponSingleFiring"
   ZedTimeModifyingStates(3)="WeaponAltFiring"
   PrimaryWeaponDef=Class'KFGame.KFWeapDef_MB500'
   KnifeWeaponDef=Class'KFGame.KFWeapDef_Knife_Support'
   GrenadeWeaponDef=Class'KFGame.KFWeapDef_Grenade_Support'
   AutoBuyLoadOutPath(0)=Class'KFGame.KFWeapDef_MB500'
   AutoBuyLoadOutPath(1)=Class'KFGame.KFWeapDef_DoubleBarrel'
   AutoBuyLoadOutPath(2)=Class'KFGame.KFWeapDef_M4'
   AutoBuyLoadOutPath(3)=Class'KFGame.KFWeapDef_AA12'
   HitAccuracyHandicap=-6.000000
   HeadshotAccuracyHandicap=-3.000000
   PrestigeRewardItemIconPaths(0)="WEP_SkinSet_Prestige01_Item_TEX.knives.SupportKnife_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(1)="WEP_SkinSet_Prestige02_Item_TEX.tier01.MB500_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(2)="WEP_skinset_prestige03_itemtex.tier02.Boomstick_PrestigePrecious_Mint_large"
   Name="Default__KFPerk_Support"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
