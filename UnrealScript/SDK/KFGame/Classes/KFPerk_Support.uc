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

`include(KFOnlineStats.uci)

/** Passives */
var private	const PerkSkill 					Ammo;       				// Increased ammo
var private const PerkSkill 					WeldingProficiency;         // Welding speed modifier
var	private const PerkSkill 					ShotgunDamage;              // Shotgun dmg modifier
var	private const PerkSkill 					ShotgunPenetration;			// Shotgun extra penetration Use INTs only
var	private const PerkSkill 					Strength;              

var	private		  Array<KFPawn_Human> 			SuppliedPawnList;
var	private const float 						BarrageFiringRate;
var	private const float 						ResupplyMaxSpareAmmoModifier;
var private const AkEvent						ReceivedAmmoSound;
var private const AkEvent						ReceivedAmmoAndArmorSound;

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
	local KFInventoryManager KFIM;

	Super.ApplySkillsToPawn();

	KFIM = KFInventoryManager(OwnerPawn.InvManager);
	if( KFIM != none )
	{
		`QALog( "Strength Mod" @ GetPercentage(KFIM.MaxCarryBlocks, KFIM.default.MaxCarryBlocks + GetExtraStrength( CurrentLevel )), bLogPerk );
		KFIM.MaxCarryBlocks = KFIM.default.MaxCarryBlocks + GetExtraStrength( CurrentLevel );
	}

	ResetSupplier();
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

		MyPRI.bPerkCanSupply = true;

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
	`QALog( GetFuncName() @ "BaseDamage =" @ InDamage, bLogPerk );
	

	TempDamage = InDamage;

	if( DamageCauser != none )
	{
		KFW = GetWeaponFromDamageCauser( DamageCauser );
	}

	if( ((KFW != none && IsWeaponOnPerk( KFW )) || (DamageType != none && IsDamageTypeOnPerk( DamageType ))) &&
		!ClassIsChildOf( DamageType, class'KFDT_Explosive' )  )
	{		
		TempDamage += InDamage * GetPassiveValue( ShotgunDamage, CurrentLevel );
		`QALog( GetFuncName() @ "+ Extra Shotgun Damage =" @ TempDamage, bLogPerk );

		if( IsSalvoActive() )
		{
			TempDamage += InDamage * GetSkillValue( PerkSkills[ESupportSalvo] );
			`QALog( GetFuncName() @ "+ Salvo Damage =" @ TempDamage, bLogPerk );
		}
	}

	`QALog( "Total Damage Given" @ Damagetype @ KFW @ GetPercentage( InDamage, Round(TempDamage) ), bLogPerk );
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
	`QALog( "Welding Modifier" @ WeldingModifier, bLogPerk );
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
    `QALog( "PenetrationPower" @ PenetrationPower + GetPassiveValue( ShotgunPenetration, Level ), bLogPerk );

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
simulated function ModifyMagSizeAndNumber( KFWeapon KFW, out byte MagazineCapacity, optional Class<KFPerk> WeaponPerkClass, optional bool bSecondary=false )
{
	local float TempCapacity;

	TempCapacity = MagazineCapacity;

	if( IsWeaponOnPerk( KFW, WeaponPerkClass ) && (KFW == none || !KFW.bNoMagazine) )
	{
		if( KFW != none )
		{
			if( IsHighCapMagsMagActive() )
			{
				TempCapacity += MagazineCapacity * GetSkillValue( PerkSkills[ESupportHighCapMags] );
			}
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
	local class<KFPerk> WeaponPerkClass;

	WeaponPerkClass = (KFW == none) ? TraderItem.AssociatedPerkClass : KFW.AssociatedPerkClass;
	if( IsWeaponOnPerk( KFW, WeaponPerkClass ) )
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
	local class<KFPerk> WeaponPerkClass;

	WeaponPerkClass = (KFW == none) ? TraderItem.AssociatedPerkClass : KFW.AssociatedPerkClass;
	if( IsWeaponOnPerk( KFW, WeaponPerkClass ) && MaxSpareAmmo > 0 )
	{
		TempMaxSpareAmmoAmount = MaxSpareAmmo;
		TempMaxSpareAmmoAmount += MaxSpareAmmo * GetPassiveValue( Ammo, CurrentLevel );
		 `QALog( "Ammo Passive, MaxSpareAmmo = +" @ (MaxSpareAmmo + MaxSpareAmmo * GetPassiveValue( Ammo, CurrentLevel )) / MaxSpareAmmo $ "%", bLogPerk );


		if( IsResupplyActive() )
		{
			TempMaxSpareAmmoAmount += MaxSpareAmmo * GetResupplyMaxSpareAmmoModifier();
			`QALog( "Resupply skill, MaxSpareAmmo = +" @ (MaxSpareAmmo + MaxSpareAmmo * GetResupplyMaxSpareAmmoModifier()) / MaxSpareAmmo $ "%", bLogPerk );
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
	return IsTacticalReloadActive() && (IsWeaponOnPerk( KFW ) || IsBackupWeapon( KFW ));
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
	if( IsWeaponOnPerk( GetOwnerWeapon() ) && IsConcussionRoundsActive() )
	{
		return 1.f + GetSkillValue( PerkSkills[ESupportConcussionRounds] );
	}

	return 1.f;
}

/**
 * @brief General interaction with another pawn, here: give ammo
 *
 * @param KFPH Pawn to interact with
 */
simulated function Interact( KFPawn_Human KFPH )
{
	local KFWeapon KFW;
	local int MagCount;
	local KFPlayerController KFPC;
	local KFPlayerReplicationInfo UserPRI, OwnerPRI;
	local bool bReceivedAmmo;
	
	if( SuppliedPawnList.Find( KFPH ) != INDEX_NONE || !IsSupplierActive() )
	{
		return;
	}

	foreach KFPH.InvManager.InventoryActors( class'KFWeapon', KFW )
	{
		if( KFW.static.DenyPerkResupply() )
		{
			continue;
		}

		// resupply 1 mag for every 5 initial mags
		MagCount = Max( KFW.InitialSpareMags[0] / 1.5, 1 ); // 3, 1
		`QALog( "Supply Ammo Primary Weapon " @ KFW @ MagCount * KFW.MagazineCapacity[0], bLogPerk );
		bReceivedAmmo = (KFW.AddAmmo( MagCount * KFW.MagazineCapacity[0] ) > 0 ) ? true : bReceivedAmmo;

        if( KFW.CanRefillSecondaryAmmo() )
        {
        	// resupply 1 mag for every 5 initial mags
        	`QALog( "Supply Ammo Secondary Weapon" @ KFW @ Max( KFW.InitialSpareMags[1] / 3, 1 ), bLogPerk );
        	bReceivedAmmo = (KFW.AddSecondaryAmmo( Max( KFW.InitialSpareMags[1] / 3, 1 ) ) > 0) ? true : bReceivedAmmo;
        }
	}
	
	if( IsResupplyActive() )
	{
		KFPH.AddArmor( KFPH.MaxArmor * GetSkillValue( PerkSkills[ESupportResupply] ) );
	}

	if( bReceivedAmmo ) 
	{
		if( Role == ROLE_Authority )
		{
			KFPC = KFPlayerController(KFPH.Controller);
			OwnerPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_GaveAmmoTo, KFPC.PlayerReplicationInfo );
			KFPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', IsResupplyActive() ? GMT_ReceivedAmmoAndArmor : GMT_ReceivedAmmoFrom, OwnerPC.PlayerReplicationInfo );

			UserPRI = KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo);
			OwnerPRI = KFPlayerReplicationInfo(OwnerPC.PlayerReplicationInfo);
			if( UserPRI != none && OwnerPRI != none )
			{
				UserPRI.MarkSupplierOwnerUsed( OwnerPRI );
			}
		}

		SuppliedPawnList.AddItem( KFPH );
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
	return IsSupplierActive() && SuppliedPawnList.Find( MyKFPH ) == INDEX_NONE;
}

simulated static function AKEvent GetReceivedAmmoSound()
{
	return default.ReceivedAmmoSound;
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

	if( IsWeaponOnPerk( W ) && CouldBarrageActive() && 
		ZedTimeModifyingStates.Find( StateName ) != INDEX_NONE )
	{
		return BarrageFiringRate;
	}

	return 0.f;
}


/**
 * @brief Reset the perk to the defaults
 */
function OnWaveEnded()
{
	super.OnWaveEnded();
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
	return PerkSkills[ESupportBarrage].bActive && WorldInfo.TimeDilation < 1.f;
}

simulated private function bool CouldBarrageActive()
{
	return PerkSkills[ECommandoRapidFire].bActive;
}

/**
 * @brief Checks if the ammo skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private function bool IsHighCapMagsMagActive()
{
	return PerkSkills[ESupportHighCapMags].bActive;
}

/**
 * @brief Checks if the fortitude skill is active
 *
 * @return true if we have the skill enabled
 */
private function bool IsFortitudeActive()
{
	return PerkSkills[ESupportFortitude].bActive;
}

/**
 * @brief Checks if the Salvo skill is active
 *
 * @return true if we have the skill enabled
 */
private function bool IsSalvoActive()
{
	return PerkSkills[ESupportSalvo].bActive;
}

/**
 * @brief Checks if the Armor Piercing Shot skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private function bool IsAPShotActive()
{
	return PerkSkills[ESupportAPShot].bActive;
}

/**
 * @brief Checks if the Tight Choke skill is active
 *
 * @return true if we have the skill enabled
 */
private function bool IsTightChokeActive()
{
	return PerkSkills[ESupportTightChoke].bActive;
}

/**
 * @brief Checks if the tactical reload skill is active (client and server)
 *
 * @return true/false
 */
simulated private function bool IsTacticalReloadActive()
{
	return PerkSkills[ESupportTacticalReload].bActive;
}

/**
 * @brief Checks if the Concussion Rounds skill is active
 *
 * @return true/false
 */
private function bool IsConcussionRoundsActive()
{
	return PerkSkills[ESupportConcussionRounds].bActive;
}

/**
 * @brief Checks if the Resupply skill is active
 *
 * @return true/false
 */
private function bool IsResupplyActive()
{
	return PerkSkills[ESupportResupply].bActive;
}

/**
 * @brief Checks if the Perforate skill is active
 *
 * @return true/false
 */
simulated private function bool IsPerforateActive()
{
	return PerkSkills[ESupportPerforate].bActive && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief Checks if we can repair doors
 *
 * @return true/false
 */
native function bool CanRepairDoors();

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

DefaultProperties
{
	ProgressStatID=`STATID_Sup_Progress
	PerkBuildStatID=`STATID_Sup_Build

	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Support'
	InteractIcon=Texture2D'UI_World_TEX.Support_Supplier_HUD'

	PrimaryWeaponDef=class'KFWeapDef_MB500'
	KnifeWeaponDef=class'KFWeapDef_Knife_Support'
	GrenadeWeaponDef=class'KFWeapDef_Grenade_Support'

	BarrageFiringRate=0.9f
	ResupplyMaxSpareAmmoModifier=0.20 //0.15

	ReceivedAmmoSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Ammo'
	ReceivedAmmoAndArmorSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Armor'

	Ammo=(Name="Ammo",Increment=0.02f,Rank=0,StartingValue=0.0,MaxValue=0.5f) //0.4
	WeldingProficiency=(Name="Welding Proficiency",Increment=0.03f,Rank=0,StartingValue=1.f,MaxValue=1.75f) //1.5
	ShotgunDamage=(Name="Shotgun Damage",Increment=0.01f,Rank=0,StartingValue=0.f,MaxValue=0.25f)
	ShotgunPenetration=(Name="Shotgun Penetration",Increment=0.20,Rank=0,StartingValue=0.0f,MaxValue=5.0f) //6.25
	Strength=(Name="Strength",Increment=1.f,Rank=0,StartingValue=0.f,MaxValue=5.f)

	PerkSkills(ESupportHighCapMags)=(Name="HighCapMags",IconPath="UI_PerkTalent_TEX.support.UI_Talents_Support_HighCapacityMags",Increment=0.f,Rank=0,StartingValue=0.5,MaxValue=0.5) //0.25
	PerkSkills(ESupportTacticalReload)=(Name="TacticalReload",IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_TacticalReload",Increment=0.f,Rank=0,StartingValue=0.8f,MaxValue=0.f)
	PerkSkills(ESupportFortitude)=(Name="Fortitude",IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Fortitude",Increment=0.f,Rank=0,StartingValue=0.5f,MaxValue=0.5f)
	PerkSkills(ESupportSalvo)=(Name="Salvo",IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Salvo",Increment=0.f,Rank=0,StartingValue=0.3f,MaxValue=0.3f)
	PerkSkills(ESupportAPShot)=(Name="APShot",IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_ArmorPiercing",Increment=0.f,Rank=0,StartingValue=4.f,MaxValue=4.f) //3
	PerkSkills(ESupportTightChoke)=(Name="TightChoke",IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_TightChoke",Increment=0.f,Rank=0,StartingValue=0.5f,MaxValue=0.5f) //0.7
	PerkSkills(ESupportResupply)=(Name="Resupply",IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_ResupplyPack",Increment=0.f ,Rank=0,StartingValue=0.2f,MaxValue=0.2f)
	PerkSkills(ESupportConcussionRounds)=(Name="ConcussionRounds",IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_ConcussionRounds",Increment=0.f,Rank=0,StartingValue=1.5f,MaxValue=1.5f)
	PerkSkills(ESupportPerforate)=(Name="Perforate",IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Penetrator",Increment=0.f,Rank=0,StartingValue=40.f,MaxValue=40.f)
	PerkSkills(ESupportBarrage)=(Name="Barrage",IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Barrage",Increment=0.f,Rank=0,StartingValue=5.f,MaxValue=5.f)

	SecondaryXPModifier[0]=6
	SecondaryXPModifier[1]=8
	SecondaryXPModifier[2]=10
	SecondaryXPModifier[3]=14

    // Skill tracking
	HitAccuracyHandicap=-6.0
	HeadshotAccuracyHandicap=-3.0
	AutoBuyLoadOutPath=(class'KFWeapDef_MB500', class'KFWeapDef_DoubleBarrel', class'KFWeapDef_M4', class'KFWeapDef_AA12')

	ZedTimeModifyingStates(0)="WeaponFiring"
   	ZedTimeModifyingStates(1)="WeaponBurstFiring"
   	ZedTimeModifyingStates(2)="WeaponSingleFiring"
}
