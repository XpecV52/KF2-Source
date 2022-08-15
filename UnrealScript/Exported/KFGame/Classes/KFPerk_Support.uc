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



 


 


  



 



 




 



 




 



 



 



 



 



 





 


 



 







#linenumber 14

/** Passives */
var()	const		PerkSkill 					WeldingProficiency;         // Welding speed modifier
var()	const		PerkSkill 					ShotgunDamage;              // Shotgun dmg modifier
var()	const		PerkSkill 					ShotgunPenetration;			// Shotgun extra penetration Use INTs only
var()	const		PerkSkill 					GrenadeDamage;              // Grenade dmg modifier

var					Array<KFPawn_Human> 		SuppliedPawnList;

var 				int 						SafeguardRangeSQ;

enum ESupportPerkSkills
{
	ESupportAmmo,
	ESupportSupplier,
	ESupportFortitude,
	ESupportRegeneration,
	ESupportBombard,
	ESupportTacticalReload,
	ESupportStrength,
	ESupportTenacity,
	ESupportSafeguard,
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
		if( IsStrengthActive() )
		{
			;
			KFIM.MaxCarryBlocks = KFIM.default.MaxCarryBlocks + PerkSkills[ESupportStrength].StartingValue ;
		}
	}

	InitSupplier();
}

/**
 * @brief Sets up the supllier skill
 */
simulated final private function InitSupplier()
{
	if( MyPRI != none )
	{
		if( SuppliedPawnList.Length > 0 )
		{
			SuppliedPawnList.Remove( 0, SuppliedPawnList.Length );
		}
	}

	if( IsSupplierActive() )
	{
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

/**
 * @brief Modifies skill related attributes
 */
simulated protected event PostSkillUpdate()
{
	super.PostSkillUpdate();

	// enable tick if we have the regeneration skill
	SetTickIsDisabled( !IsRegenerationActive() );
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
simulated function ModifyDamageGiven( out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType )
{
	local KFWeapon MyKFWeapon;
	local float TempDamage, BaseDamage;
	local float ShotgunDamageMod;

	TempDamage = InDamage;
	BaseDamage = TempDamage;

	if( DamageCauser != none )
	{
		if( DamageCauser.IsA( 'KFProj_Grenade ') )
		{
			TempDamage += BaseDamage * GetPassiveValue( GrenadeDamage, CurrentLevel );
		}
		else if( DamageInstigator != none && DamageInstigator.Pawn != none )
		{
			MyKFWeapon = KFWeapon(DamageInstigator.Pawn.Weapon);
			if( MyKFWeapon != none )
			{
				if( IsWeaponOnPerk( MyKFWeapon ) && IsDamageTypeOnPerk( DamageType ) )
				{
					ShotgunDamageMod = GetPassiveValue( ShotgunDamage, CurrentLevel );
					TempDamage = ShotgunDamageMod > 0 ? TempDamage += BaseDamage * ShotgunDamageMod : TempDamage;

					if( IsTenacityActive() )
					{
						TempDamage += BaseDamage * PerkSkills[ESupportTenacity].StartingValue;
					}
				}
			}
		}

		if( IsBarrageActive() )
		{
			TempDamage += BaseDamage * PerkSkills[ESupportBarrage].StartingValue;
		}
	}
	;
	InDamage = FCeil( TempDamage );
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

	;
	FastenRate *= WeldingModifier;
	UnFastenRate *= WeldingModifier;
}

/**
 * @brief the higher the level the more can we penetrate
 *
 * @param Level current perk level
 * @param DamageType the use dweapon's damage type
 * @param bForce
 * @return the additional penetrations
 */
static simulated function float GetPenetrationModifier( byte Level, class<KFDamageType> DamageType, optional bool bForce  )
{
    // Only buff damage types that are associated with support
    if( !bForce && (DamageType == none || !IsDamageTypeOnPerk( Damagetype )) )
    {
        return 0;
    }

    return GetPassiveValue( default.ShotgunPenetration, Level );
}

/*********************************************************************************************
* @name	 Selectable skills
********************************************************************************************* */
/**
 * @brief Modifies starting spare ammo
 *
 * @param KFW The weapon
 * @param PrimarySpareAmmo ammo amount
 * @param TraderItem the weapon's associated trader item info
 */
simulated function ModifySpareAmmoAmount( KFWeapon KFW, out int PrimarySpareAmmo, optional const out STraderItem TraderItem)
{
	local float TempSpareAmmoAmount;
	local class<KFPerk> WeaponPerkClass;

	if( KFW == none )
	{
		WeaponPerkClass = TraderItem.AssociatedPerkClass;
	}
	else
	{
		WeaponPerkClass = KFW.AssociatedPerkClass;
	}
	
	if( IsAmmoActive() && IsWeaponOnPerk( KFW, WeaponPerkClass ) )
	{
		TempSpareAmmoAmount = PrimarySpareAmmo;
		;
		TempSpareAmmoAmount *= PerkSkills[ESupportAmmo].StartingValue;
		PrimarySpareAmmo = Round( TempSpareAmmoAmount );
	}
}

/**
 * @brief Modidies the max spare ammo
 *
 * @param KFW The weapon
 * @param PrimarySpareAmmo ammo amount
 * @param TraderItem the weapon's associated trader item info
 */
simulated function ModifyMaxSpareAmmoAmount( KFWeapon KFW, out int MaxSpareAmmo, optional const out STraderItem TraderItem)
{
	local float TempMaxSpareAmmoAmount;
	local class<KFPerk> WeaponPerkClass;

	if( KFW == none )
	{
		WeaponPerkClass = TraderItem.AssociatedPerkClass;
	}
	else
	{
		WeaponPerkClass = KFW.AssociatedPerkClass;
	}

	if( IsAmmoActive() && IsWeaponOnPerk( KFW, WeaponPerkClass ) )
	{
		TempMaxSpareAmmoAmount = MaxSpareAmmo;
		TempMaxSpareAmmoAmount *= PerkSkills[ESupportAmmo].StartingValue;
		MaxSpareAmmo = Round( TempMaxSpareAmmoAmount );
	}
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
		;
		TempHealth *= PerkSkills[ESupportFortitude].StartingValue;
		InHealth = FCeil( TempHealth );
	}
}

/**
 * @brief Player entering zed time, Server only
 */
function NotifyZedTimeStarted()
{
	if( IsSafeguardActive() || IsBarrageActive() )
	{
		CheckOwnerPawn();
		GivePlayerBuffs();

		if( IsSafeguardActive() && !OwnerPawn.bHasSupportSafeguardBuff )
		{
			;
			OwnerPawn.SetSupportSafeguardBuff( true );
			OwnerPawn.AddArmor( PerkSkills[ESupportSafeGuard].StartingValue * OwnerPawn.MaxArmor );
		}

		if( IsBarrageActive() && !OwnerPawn.bHasSupportBarrageBuff )
		{
			OwnerPawn.SetSupportBarrageBuff( true );
		}
	}
}

/**
 * @brief Player exiting zed time, Server only
 */
function NotifyZedTimeEnded()
{
	if( IsSafeguardActive() || IsBarrageActive() )
	{
		ResetPlayerBuffs();
		CheckOwnerPawn();

		if( IsSafeguardActive() && OwnerPawn.bHasSupportSafeguardBuff )
		{
			OwnerPawn.SetSupportSafeguardBuff( false );
		}

		if( IsBarrageActive() && OwnerPawn.bHasSupportBarrageBuff )
		{
			OwnerPawn.SetSupportBarrageBuff( false );
		}
	}
}

/**
 * @brief gives other players temporarily additional buffs
 */
function GivePlayerBuffs()
{
	local KFPawn_Human OtherPawn;

	if( CheckOwnerPawn() && OwnerPawn.IsAliveAndWell() )
	{
		foreach WorldInfo.Allpawns(class'KFPawn_Human', OtherPawn)
		{
			if( OtherPawn != OwnerPawn && VSizeSQ(OtherPawn.Location - OwnerPawn.Location) <= SafeguardRangeSQ )
			{
				if( IsSafeguardActive() && !OtherPawn.bHasSupportSafeguardBuff )
				{
					OtherPawn.SetSupportSafeguardBuff( true );
					BuffedPlayerInfos.Insert( 0, 1 );
					BuffedPlayerInfos[0].BuffedPawn = OtherPawn;
					OtherPawn.AddArmor( PerkSkills[ESupportSafeGuard].StartingValue * OtherPawn.MaxArmor );
					;
				}
				else if( IsBarrageActive() && !OtherPawn.bHasSupportBarrageBuff )
				{
					OtherPawn.SetSupportBarrageBuff( true );
					BuffedPlayerInfos.Insert( 0, 1 );
					BuffedPlayerInfos[0].BuffedPawn = OtherPawn;
				}
			}
		}
	}
}

/**
 * @brief removes temporary buffs
 */
function ResetPlayerBuffs()
{
	local int i;

	for( i = 0; i < BuffedPlayerInfos.Length; i++ )
	{
		if( IsSafeguardActive() )
		{
			BuffedPlayerInfos[i].BuffedPawn.SetSupportSafeguardBuff( false );
		}
		
		if( IsBarrageActive() )
		{
			BuffedPlayerInfos[i].BuffedPawn.SetSupportBarrageBuff( false );
		}
	}

	BuffedPlayerInfos.Remove( 0, BuffedPlayerInfos.Length );
}

/**
 * @brief skills and weapons can modify the stumbling power
 * @return stumpling power modifier
 */
function float GetStumblePowerModifier( optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier )
{
	if( IsWeaponOnPerk( GetOwnerWeapon() ) && IsBombardActive() )
	{
		return 1.f + PerkSkills[ESupportBombard].StartingValue;
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

	if( SuppliedPawnList.Find( KFPH ) != INDEX_NONE )
	{
		return;
	}

	if( Role == ROLE_Authority )
	{
		KFPC = KFPlayerController(KFPH.Controller);
		OwnerPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_GaveAmmoTo, KFPC.PlayerReplicationInfo );
		KFPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_ReceivedAmmoFrom, OwnerPC.PlayerReplicationInfo );
	}

	foreach KFPH.InvManager.InventoryActors( class'KFWeapon', KFW )
	{
		if( KFW.static.IsInventoryWeapon() )
		{
			continue;
		}

		// resupply 1 mag for every 5 initial mags
		MagCount = Max( KFW.InitialSpareMags[0] / 3, 1 );
		;
		KFW.AddAmmo( MagCount * KFW.MagazineCapacity[0] );

        if( KFW.CanRefillSecondaryAmmo() )
        {
        	// resupply 1 mag for every 5 initial mags
        	;
        	KFW.AddSecondaryAmmo( Max( KFW.InitialSpareMags[1] / 3, 1 ) );
        }
	}

	SuppliedPawnList.AddItem( KFPH );
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

/**
 * @brief Do we need to tick the perk?
 *
 * @return true if perk needs to be ticked
 */
simulated function bool PerkNeedsTick()
{
	return IsRegenerationActive();
}

/**
 * @brief script tick (server)
  *
 * @param DeltaTime time since the last tick
 */
event Tick( float DeltaTime )
{
	super.Tick( DeltaTime );

	if( IsRegenerationActive() )
	{
		TickRegen( DeltaTime );
	}
}

/**
 * @brief Reset the perk to the defaults
 */
event ResetPerk()
{
	super.ResetPerk();
	InitSupplier();
}

/**
 * @brief Client version of ResetPerk()
 */
reliable protected client function ClientResetPerk()
{
	super.ClientResetPerk();
	InitSupplier();
}

simulated static function GetPassiveStrings( out array<string> PassiveValues, out array<string> Increments, byte Level )
{
	PassiveValues[0] = Round( (GetPassiveValue( default.WeldingProficiency, Level ) - 1) * 100) $ "%";
	PassiveValues[1] = Round( GetPassiveValue( default.ShotgunDamage, Level ) * 100) $ "%";
	PassiveValues[2] = Round( GetPassiveValue( default.ShotgunPenetration, Level ) * 100) $ "%";
	PassiveValues[3] = Round( GetPassiveValue( default.GrenadeDamage, Level ) * 100) $ "%";

	Increments[0] = "[" @ (Int(default.WeldingProficiency.Increment * 100))  $ "% /" @ default.LevelString @ "]";
	Increments[1] = "[" @ (Int(default.ShotgunDamage.Increment * 100))  $ "% /" @ default.LevelString @ "]";
	Increments[2] = "[" @ (Int(default.ShotgunPenetration.Increment * 100))  $"% /" @ default.LevelString @ "]";
	Increments[3] = "[" @ (Int(default.GrenadeDamage.Increment * 100))  $ "% /" @ default.LevelString @ "]";
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
	return PerkSkills[ESupportSupplier].bActive;
}

/**
 * @brief Checks if the barrage skill is active and if we are in zed time
 *
 * @return true if we have the skill enabled
 */
final private function bool IsBarrageActive()
{
	return PerkSkills[ESupportBarrage].bActive && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief Checks if the ammo skill is active
 *
 * @return true if we have the skill enabled
 */
final simulated private function bool IsAmmoActive()
{
	return PerkSkills[ESupportAmmo].bActive;
}

/**
 * @brief Checks if the fortitude skill is active
 *
 * @return true if we have the skill enabled
 */
final private function bool IsFortitudeActive()
{
	return PerkSkills[ESupportFortitude].bActive;
}

/**
 * @brief Checks if the regeneration skill is active
 *
 * @return true if we have the skill enabled
 */
final private function bool IsRegenerationActive()
{
	return PerkSkills[ESupportRegeneration].bActive;
}

/**
 * @brief Checks if the bombard skill is active
 *
 * @return true if we have the skill enabled
 */
final private function bool IsBombardActive()
{
	return PerkSkills[ESupportBombard].bActive;
}

/**
 * @brief Checks if the tactical reload skill is active (client and server)
 *
 * @return true/false
 */
simulated final private function bool IsTacticalReloadActive()
{
	return PerkSkills[ESupportTacticalReload].bActive;
}

/**
 * @brief Checks if the strength skill is active
 *
 * @return true/false
 */
final private function bool IsStrengthActive()
{
	return PerkSkills[ESupportStrength].bActive;
}

/**
 * @brief Checks if the tenacity skill is active
 *
 * @return true/false
 */
final private function bool IsTenacityActive()
{
	return PerkSkills[ESupportTenacity].bActive;
}

/**
 * @brief Checks if the safeguard skill is active
 *
 * @return true/false
 */
final private function bool IsSafeguardActive()
{
	return PerkSkills[ESupportSafeguard].bActive;
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
		LogInternal("PASSIVE PERKS");
		LogInternal("-Welding Modifier:" @ (GetPassiveValue(WeldingProficiency, CurrentLevel) - 1) *100 $"%");
		LogInternal("-Shotgun Damage Modifier:" @ (GetPassiveValue(ShotgunDamage, CurrentLevel) - 1) *100 $"%");
		LogInternal("-Shotgun Penetration Modifier:" @ GetPassiveValue(default.ShotgunPenetration, CurrentLevel));
		LogInternal("-Grenade Damage Modifier:" @ GetPassiveValue(GrenadeDamage, CurrentLevel, 100.f)*100 $"%");

	    LogInternal("Skill Tree");
	    LogInternal("-Ammo:" @ PerkSkills[ESupportTacticalReload].bActive);
		LogInternal("-Supplier:" @ IsSupplierActive()) ;
		LogInternal("-Fortitude:" @ PerkSkills[ESupportFortitude].bActive);
		LogInternal("-Regeneration:" @ PerkSkills[ESupportRegeneration].bActive);
		LogInternal("-Bombard:" @ PerkSkills[ESupportBombard].bActive);
		LogInternal("-Tactical Reload:" @ PerkSkills[ESupportTacticalReload].bActive @ LogTacticalReload());
		LogInternal("-Strength:" @ PerkSkills[ESupportStrength].bActive);
		LogInternal("-Tenacity:" @ PerkSkills[ESupportTenacity].bActive);
		LogInternal("-Safeguard:" @ PerkSkills[ESupportSafeguard].bActive);
		LogInternal("-Barrage:" @ PerkSkills[ESupportBarrage].bActive);
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
   WeldingProficiency=(Name="Welding Proficiency",Increment=0.020000,StartingValue=1.000000,MaxValue=1.500000)
   ShotgunDamage=(Name="Shotgun Damage",Increment=0.010000,MaxValue=0.250000)
   ShotgunPenetration=(Name="Shotgun Penetration",Increment=0.250000,MaxValue=6.250000)
   GrenadeDamage=(Name="Grenade Damage",Increment=0.020000,MaxValue=0.500000)
   SafeguardRangeSQ=1000000
   ProgressStatID=20
   PerkBuildStatID=21
   SecondaryXPModifier(0)=6
   SecondaryXPModifier(1)=8
   SecondaryXPModifier(2)=10
   SecondaryXPModifier(3)=14
   PerkName="Support"
   Passives(0)=(Title="Welding Proficiency",Description="Welding speed increased by %x%")
   Passives(1)=(Title="Perk Weapon Damage",Description="Perk weapon damage increased by %x%")
   Passives(2)=(Title="Perk Weapon Penetration",Description="Every level, Perk weapons gain %x% increased penetration power")
   Passives(3)=(Title="Grenade Damage",Description="Grenade damage increased by %x%")
   Passives(4)=()
   SkillCatagories(0)="Weapon Handling"
   SkillCatagories(1)="Fitness"
   SkillCatagories(2)="Supply"
   SkillCatagories(3)="Endurance"
   SkillCatagories(4)="Advanced Training"
   EXPAction1="Dealing Support weapon damage"
   EXPAction2="Welding doors"
   PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Support'
   PerkSkills(0)=(Name="Ammo",StartingValue=1.200000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Ammo")
   PerkSkills(1)=(Name="Supplier",StartingValue=1.150000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Supplier")
   PerkSkills(2)=(Name="Fortitude",StartingValue=1.500000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Fortitude")
   PerkSkills(3)=(Name="Regeneration",StartingValue=0.150000,MaxValue=0.150000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Regeneration")
   PerkSkills(4)=(Name="Bombard",StartingValue=0.600000,MaxValue=0.600000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Bombard")
   PerkSkills(5)=(Name="TacticalReload",StartingValue=0.800000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_TacticalReload")
   PerkSkills(6)=(Name="Strength",StartingValue=5.000000,MaxValue=5.000000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Strength")
   PerkSkills(7)=(Name="Tenacity",StartingValue=0.100000,MaxValue=0.100000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Tenacity")
   PerkSkills(8)=(Name="Safeguard",StartingValue=0.050000,MaxValue=0.050000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Safeguard")
   PerkSkills(9)=(Name="Barrage",StartingValue=0.150000,MaxValue=0.150000,IconPath="UI_PerkTalent_TEX.Support.UI_Talents_Support_Barrage")
   RegenerationInterval=2.500000
   RegenerationAmount=4
   PrimaryWeaponClassName="KFGameContent.KFWeap_Shotgun_MB500"
   MeleeWeaponClassName="KFGameContent.KFWeap_Knife_Support"
   Name="Default__KFPerk_Support"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
