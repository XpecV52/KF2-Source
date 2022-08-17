//=============================================================================
// KFPerk_Berserker
//=============================================================================
// The berserker perk class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Christian "schneidzekk" Schneider
//=============================================================================

class KFPerk_Berserker extends KFPerk
	native;



 


 


  



 



 




 



 




 



 



 



 



 



 





 


 



 







#linenumber 14

var	const				PerkSkill 	BerserkerDamage;					// 25% increase in Berserker weapon damage, plus 1% each additional level. Max 50%
var	const				PerkSkill	MeleeAttackSpeed;              		// 5% increase in melee attack speed - Max 30%
var const				PerkSkill	Movement;                 			// 10% faster movement when wielding a melee weapon, plus +0.6% each level - Max 25%
var const				PerkSkill	DamageResistance;                   // 0% resistance to all damage – Max 25%
var const				PerkSkill	NightVision;

var 	const private 	int 		SmallRadiusSizeSQ;
var 		private		bool		bBlockActive;
var 		private		bool		bParryActive;
var const 	private  	float 		ParryDuration;
var const 	private  	float 		ParrySpeed;
var const 	private  	float 		FuriousDefenderSpeed;
var const 	private 	float 		SmashKnockdownMultiplier;

// Events to play when parry skill is activated / deactivated
var AkEvent ParrySkillSoundModeStart;
var AkEvent ParrySkillSoundModeStop;

enum EBerserkPerkSkills
{
	EBerserkerPoisonResistance,			// Poison does 40% less damage
	EBerserkerSonicResistance,			// Sonic does 40% less damage
	EBerserkerVampire,					// 5% more health per kill
	EBerserkerFortitude,				// Give yourself a better chance: Increase Maximum and Starting Health by 100%
	EBerserkerFuriousDefender,			// Attack 15% fasterHard attack does 15% more damage
	EBerserkerBlock,					// Blocking an attack will make your next attack do 50% more damage
	EBerserkerParry,					// Parry an attack will increase attack speed by 20% for 10 sec
	EBerserkerSmash,					// Hard attacks do 30% more damage and increase knockdown incap by 100%
	EBerserkerSpartan,					// 50% attack speed with Berserker melee weapons Parry will cause knockdown - move in realtime
	EBerserkerMenace					// Stun power increased 100% to head hits Stumble power increased by 100% - move in realtime
};

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/*********************************************************************************************
* @name	 Perk init and spawning
******************************************************************************************** */

/** (Server) Modify Instigator settings based on selected perk */
function ApplySkillsToPawn()
{
	super.ApplySkillsToPawn();

	if( OwnerPawn != none )
	{
		OwnerPawn.bMovesFastInZedTime = IsFastInZedTime();
	}
}

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
simulated function ModifyDamageGiven( out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx )
{
	local KFWeapon MyKFWeapon;
	local float TempDamage;

	TempDamage = InDamage;

	if( DamageCauser != none )
	{
		if( DamageCauser.IsA( 'Weapon' ) )
		{
			MyKFWeapon = KFWeapon(DamageCauser);
		}
		else if( DamageCauser.IsA( 'Projectile' ) )
		{
			MyKFWeapon = KFWeapon(DamageCauser.Owner);
		}

		if( (MyKFWeapon != none && IsWeaponOnPerk( MyKFWeapon )) || IsDamageTypeOnPerk( DamageType ) )
		{
			TempDamage += (InDamage * GetPassiveValue( BerserkerDamage,  CurrentLevel )) - InDamage;

			if( MyKFWeapon.IsMeleeWeapon() && GetBlockActive() )
			{
				TempDamage += (InDamage * (1 + GetSkillValue( PerkSkills[EBerserkerBlock] ))) - InDamage;
				bBlockActive = false;
			}
		}
	}

	;
	InDamage = Round( TempDamage );
}

/**
 * @brief Some perk skills modify the melee attack speed
 *
 * @param InDuration delay inbetween attacks
 */
simulated function ModifyMeleeAttackSpeed( out float InDuration, KFWeapon KFW )
{
	local float TempDuration;

	if( KFW == none || !KFW.IsMeleeWeapon() )
	{
		return;
	}

	TempDuration = InDuration;

	TempDuration -= TempDuration * GetPassiveValue( MeleeAttackSpeed, CurrentLevel );

	if( IsSpartanActive() )
	{
		TempDuration -= TempDuration * GetSkillValue( PerkSkills[EBerserkerSpartan] );
	}

	if( GetParryActive() )
	{
		TempDuration -= TempDuration * ParrySpeed;
	}

	if( IsFuriousDefenderActive() )
	{
		TempDuration -= TempDuration * GetSkillValue( PerkSkills[EBerserkerFuriousDefender] );
	}

	;
	InDuration = TempDuration;
}

/**
 * @brief Weapons and perk skills can affect the jog/sprint speed
 *
 * @param Speed jog/sprint speed
 */
simulated function ModifySpeed( out float Speed )
{
	local KFWeapon MyKFWeapon;
	local KFInventoryManager KFIM;

	MyKFWeapon = GetOwnerWeapon();
	if( MyKFWeapon == none && CheckOwnerPawn() )
	{
		KFIM = KFInventoryManager(OwnerPawn.InvManager);
		if( KFIM != none && KFIM.PendingWeapon != none )
		{
			MyKFWeapon = KFWeapon(KFIM.PendingWeapon);
		}
	}

	if( MyKFWeapon != none && MyKFWeapon.IsMeleeWeapon() )
	{
		;
		Speed *= GetPassiveValue( Movement,  CurrentLevel );
	}
}

/**
 * @brief Modifies the damage taken
 *
 * @param InDamage damage
 * @param DamageType the damage type used (optional)
 */
function ModifyDamageTaken( out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy )
{
	local float TempDamage;

	TempDamage = InDamage;

	if( IsPoisonResistanceActive() && ClassIsChildOf( Damagetype,  class'KFDT_Toxic' ) )
	{
		TempDamage -= InDamage * GetSkillValue( PerkSkills[EBerserkerPoisonResistance] );
	}

	if( IsSonicResistanceActive() && ClassIsChildOf( Damagetype,  class'KFDT_Sonic' ) )
			{
		TempDamage -= InDamage * GetSkillValue( PerkSkills[EBerserkerSonicResistance] );
			}

	TempDamage -= InDamage * GetPassiveValue( DamageResistance,  CurrentLevel );

	;
	InDamage = Round( TempDamage );
}

function ModifyBloatBileDoT( out float DoTScaler )
{
	super.ModifyBloatBileDoT( DoTScaler );

	;
	DotScaler -= GetSkillValue( PerkSkills[EBerserkerPoisonResistance] );
}

simulated static function GetPassiveStrings( out array<string> PassiveValues, out array<string> Increments, byte Level )
{
	PassiveValues[0] = Round((GetPassiveValue( default.BerserkerDamage, Level ) * 100) - 100) $ "%";
	PassiveValues[1] = Round(GetPassiveValue( default.MeleeAttackSpeed, Level ) * 100) $ "%";
	PassiveValues[2] = Round((GetPassiveValue( default.Movement, Level ) - 1) * 100) $ "%";
	PassiveValues[3] = Round((GetPassiveValue(default.DamageResistance, Level)) * 100) $ "%";
	PassiveValues[4] = "";
	PassiveValues[5] = "";

	Increments[0] = "[" @ ("25% + " $ Int(default.BerserkerDamage.Increment * 100))  $"% /" @ default.LevelString @ "]";
	Increments[1] = "[" @ "5% + 0." $ int(default.MeleeAttackSpeed.Increment * 1000)  $ "% /" @ default.LevelString @ "]";
	Increments[2] = "[" @ "10% + 0." $ int(default.Movement.Increment * 1000) $ "% /" @ default.LevelString @ "]";
	Increments[3] = "[" @ (Int(default.DamageResistance.Increment * 100))  $"% /" @ default.LevelString @ "]";
	Increments[4] = "";
	Increments[5] = "";
}

/*********************************************************************************************
* @name	 Selectable skills functions
********************************************************************************************* */
/**
 * @brief Gets the Poison Resistance's resistance percentage
 * @return Poison resistance
 */
static final function float GetPoisonResistance()
{
	return GetSkillValue( default.PerkSkills[EBerserkerPoisonResistance] );
}

/**
 * @brief Adds health oints earnt by killing with the vampire skill
 *
 * @param KFPC Owning controller
 */
function AddVampireHealth( KFPlayerController KFPC, class<DamageType> DT )
{
	if( IsDamageTypeOnPerk( class<KFDamageType>(DT) ) && IsVampireActive() && KFPC.Pawn != none )
	{
		KFPC.Pawn.HealDamage( GetSkillValue( PerkSkills[EBerserkerVampire] ), KFPC, class'KFDT_Healing', false, false );
		;
	}
}

/**
 * @brief modifies the players health
 *
 * @param InHealth health
 */
function ModifyHealth( out int InHealth )
{
	if( IsFortitudeActive() )
	{
		InHealth *= GetSKillValue( PerkSkills[EBerserkerFortitude] );
		;
	}
}

/**
 * @brief Skills can effect the hard (seconday) melee attack damage
 *
 * @param int The damage to modify
 */
function ModifyHardAttackDamage( out int InDamage )
{
	local float TempDamage;

	TempDamage = InDamage;

	if( IsFuriousDefenderActive() )
	{
		TempDamage += InDamage * GetSkillValue( PerkSkills[EBerserkerFuriousDefender] );
		}

	if( IsSmashActive() )
		{
		TempDamage += InDamage * GetSkillValue( PerkSkills[EBerserkerSmash] );
	}

	;
	InDamage = TempDamage != InDamage ? Round( TempDamage ) : InDamage;
}

/**
 * @brief Skills can effect the light melee attack damage
 *
 * @param int The damage to modify
 */
function ModifyLightAttackDamage( out int InDamage )
{
	local float TempDamage;

	TempDamage = InDamage;

	if( IsParryActive() )
	{
		TempDamage *= 1 + GetSkillValue( PerkSkills[EBerserkerParry] );
	}

	;
	InDamage = TempDamage != InDamage ? FCeil( TempDamage ) : InDamage;
}

/**
 * @brief Called when the parry time ends
 */
simulated function ParryTimer()
{
	bParryActive = false;
	SetTickIsDisabled( true );

	if( OwnerPC != none )
	{
		OwnerPC.SetPerkEffect( false );
	}

	OwnerPC.PlaySoundBase( ParrySkillSoundModeStop, true );
}

/**
 * @brief Change this to effect intensity change when we have it
 *
 * @param float InDuration The effects duration
 */
function ModifyScreamEffectDuration( out float InDuration )
{
	if( IsSonicResistanceActive() )
	{
		;
		InDuration *= 1 - GetSkillValue( PerkSkills[EBerserkerSonicResistance]);
	}
}

/**
 * @brief Random chance to knockdown a zed with a melee weapon
 * @return true/false
 */
function float GetKnockdownPowerModifier( optional class<DamageType> DamageType, optional byte BodyPartt, optional bool bIsSprinting=false )
{
	local KFWeapon KFW;;

	KFW = GetOwnerWeapon();
	if( IsSmashActive() && KFW.IsMeleeWeapon() )
	{
		;
		return SmashKnockdownMultiplier;
	}

	return 1.f;
}

/**
 * @brief skills and weapons can modify the stumbling power
 * @return stumpling power modifier
 */
function float GetStumblePowerModifier( optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart )
{
	if( IsMenaceActive() )
	{
        ;
        return 1.f + GetSkillValue( PerkSkills[EBerserkerMenace] );
	}

	return 1.f;
}

/**
 * @brief skills and weapons can modify the stun power
 * @return stun power modifier
 */
function float GetStunPowerModifier( optional class<DamageType> DamageType, optional byte HitZoneIdx )
{
	if( IsMenaceActive() && HitZoneIdx == HZI_HEAD )
	{
		;
        return 1.f +  GetSkillValue( PerkSkills[EBerserkerMenace] );
	}

    return 1.f;
}

/**
 * @brief Gets the small radius kill xp based on the difficulty
 *
 * @param Difficulty game difficulty
 * @return XP
 */
static function int GetSmallRadiusKillXP( byte Difficulty )
{
	return default.SecondaryXPModifier[Difficulty];
}

/**
 * @brief Gets the squared small kill radius
 *
 * @return UUs squared
 */
static function int GetSmallRadiusKillDistanceSQ()
{
	return default.SmallRadiusSizeSQ;
}

/**
 * @brief can the perk earn small radius kill xp
 * @return perk == berserker && DT is on perk
 */
function bool CanEarnSmallRadiusKillXP( class<DamageType> DT )
{
	return IsDamageTypeOnPerk( class<KFDamageType>(DT) ) || IsBackupDamageTypeOnPerk( DT );
}

function bool ShouldKnockdown()
{
	return IsSpartanActive();
}

simulated function float GetSirenScreamStrength()
{
	if( IsSonicResistanceActive() )
		{
		return GetSkillValue( PerkSkills[EBerserkerSonicResistance] );
	}

	return super.GetSirenScreamStrength();
}

/*********************************************************************************************
* @name	 Getters / Setters
********************************************************************************************* */

/**
 * @brief Checks if the Poison Resistance skill is active
 *
 * @return true if we have the skill enabled
 */
simulated final private function bool IsPoisonResistanceActive()
{
	return PerkSkills[EBerserkerPoisonResistance].bActive;
}

/**
 * @brief Checks if the Sonic Resistance skill is active
 *
 * @return true if we have the skill enabled
 */
simulated final private function bool IsSonicResistanceActive()
{
	return PerkSkills[EBerserkerSonicResistance].bActive;
}

/**
 * @brief Checks if the Vampire skill is active
 *
 * @return true if we have the skill enabled
 */
final private function bool IsVampireActive()
{
	return PerkSkills[EBerserkerVampire].bActive;
}

/**
 * @brief Checks if the fortitude skill is active
 *
 * @return true if we have the skill enabled
 */
final private function bool IsFortitudeActive()
{
	return PerkSkills[EBerserkerFortitude].bActive;
}

/**
 * @brief Player successfully blocked an attack, save it if Block skill active
 */
simulated function SetSuccessFullBlock()
{
	if( IsBlockActive() )
	{
		bBlockActive = true;
	}
}

/**
 * @brief Checks if the Block skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsBlockActive()
{
	return PerkSkills[EBerserkerBlock].bActive;
}

/**
 * @brief Check if conditions for the Block skill are true
 * @return true if blocked attack successfully earlier and Block skill active
 */
simulated function bool GetBlockActive()
{
	return IsBlockActive() && bBlockActive;
}

/**
 * @brief Player successfully parried an attack, save it if Parry skill active
 */
simulated function SetSuccessfullParry()
{
	if( IsParryActive() )
	{
		bParryActive = true;
		SetTickIsDisabled( false );
		SetTimer( ParryDuration, false, nameOf( ParryTimer ));

		if( OwnerPC != none )
		{
			OwnerPC.SetPerkEffect( true );
		}

		OwnerPC.PlaySoundBase( ParrySkillSoundModeStart, true );
	}
}

/**
 * @brief Checks if the Parry skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsParryActive()
{
	return PerkSkills[EBerserkerParry].bActive;
}

/**
 * @brief Check if conditions for the Parry skill are true
 * @return true if parried attack successfully earlier and Parry skill active
 */
simulated event bool GetParryActive()
{
	return IsParryActive() && bParryActive;
}

/**
 * @brief Checks if the night vision skill is active
 * @return true if we have the skill enabled
 */
simulated function bool HasNightVision()
{
	return true;
}

/**
 * @brief Checks if the Furious Defender skill is active
 *
 * @return true if we have the skill enabled
 */
simulated final private function bool IsFuriousDefenderActive()
{
	return PerkSkills[EBerserkerFuriousDefender].bActive;
}

/**
 * @brief Checks if the Smash skill is active
 *
 * @return true if we have the skill enabled
 */
final private function bool IsSmashActive()
{
	return PerkSkills[EBerserkerSmash].bActive;
}

/**
 * @brief Checks if the player can be grabbed by clots
 *
 * @return true if we are ungrabbable
 */
function bool CanNotBeGrabbed()
{
	return true;
}

/**
 * @brief Checks if the menace skill is active and if we are in zed time
 *
 * @return true if we have the skill enabled
 */
simulated final private event bool IsSpartanActive()
{
	return PerkSkills[EBerserkerSpartan].bActive && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief Checks if the menace skill is active and if we are in zed time
 *
 * @return true if we have the skill enabled
 */
simulated final private event bool IsMenaceActive()
{
	return PerkSkills[EBerserkerMenace].bActive && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief Menace and Spartan resist zed time. You move at normal speed.
 *
 * @return true if Menace or Spartan are active
 */
function bool IsFastInZedTime()
{
	return PerkSkills[EBerserkerMenace].bActive || PerkSkills[EBerserkerSpartan].bActive;
}

/*********************************************************************************************
* @name	  UI / HUD
********************************************************************************************* */
simulated function class<EmitterCameraLensEffectBase> GetPerkLensEffect( class<KFDamageType> DmgType )
{
	if( ClassIsChildOf( DmgType,  class'KFDT_Toxic' ) )
	{
		return IsPoisonResistanceActive() ? DmgType.default.AltCameraLensEffectTemplate : super.GetPerkLensEffect( DmgType );
	}

	return super.GetPerkLensEffect( DmgType );
}

/*********************************************************************************************
* @name	 Logging / debug
********************************************************************************************* */

/** QA Logging - Report Perk Info */
simulated function LogPerkSkills()
{
	super.LogPerkSkills();

	if ( bLogPerk )
	{
		LogInternal("PASSIVE PERKS");
		LogInternal("-Berserker Damage:" @ (GetPassiveValue(BerserkerDamage, CurrentLevel) - 1) * 100 $"%");
		LogInternal("-MeleeAttackSpeed:" @ GetPassiveValue(default.MeleeAttackSpeed, CurrentLevel) * 100 $"%");
		LogInternal("-Movement:" @ (GetPassiveValue(default.Movement, CurrentLevel) - 1) * 100 $"%");
		LogInternal("-DamageResistance:" @ (GetPassiveValue(default.DamageResistance, CurrentLevel)) * 100 $"%");

	    LogInternal("Skill Tree");
	    LogInternal("PoisonResistance" @ PerkSkills[EBerserkerPoisonResistance].bActive);
	    LogInternal("SonicResistance" @ PerkSkills[EBerserkerSonicResistance].bActive);
	    LogInternal("Vampire" @ PerkSkills[EBerserkerVampire].bActive);
	    LogInternal("Fortitude" @ PerkSkills[EBerserkerFortitude].bActive);
	    LogInternal("FuriousDefender" @ PerkSkills[EBerserkerFuriousDefender].bActive);
	    LogInternal("Block" @ PerkSkills[EBerserkerBlock].bActive);
	    LogInternal("Parry" @ PerkSkills[EBerserkerParry].bActive);
	    LogInternal("Smash" @ PerkSkills[EBerserkerSmash].bActive);
	    LogInternal("Spartan" @ PerkSkills[EBerserkerSpartan].bActive);
	    LogInternal("Menace" @ PerkSkills[EBerserkerMenace].bActive);
	}
}

defaultproperties
{
   BerserkerDamage=(Name="Berserker Damage",Increment=0.010000,StartingValue=1.250000,MaxValue=1.500000)
   MeleeAttackSpeed=(Name="Melee Attack Speed",Increment=0.008000,StartingValue=0.050000,MaxValue=0.250000)
   Movement=(Name="Movement",Increment=0.006000,StartingValue=1.100000,MaxValue=1.250000)
   DamageResistance=(Name="Damage Resistance",Increment=0.010000,MaxValue=0.250000)
   NightVision=(Name="Night Vision")
   SmallRadiusSizeSQ=40000
   ParryDuration=4.000000
   ParrySpeed=0.150000
   FuriousDefenderSpeed=0.100000
   SmashKnockdownMultiplier=2.000000
   ParrySkillSoundModeStart=AkEvent'WW_GLO_Runtime.Play_Beserker_Parry_Mode'
   ParrySkillSoundModeStop=AkEvent'WW_GLO_Runtime.Stop_Beserker_Parry_Mode'
   ProgressStatID=10
   PerkBuildStatID=11
   SecondaryXPModifier(0)=6
   SecondaryXPModifier(1)=8
   SecondaryXPModifier(2)=10
   SecondaryXPModifier(3)=14
   PerkName="Berserker"
   Passives(0)=(Title="Perk Weapon Damage",Description="25% increase in Berserker weapon damage, plus x%x each level")
   Passives(1)=(Title="Melee Attack Speed",Description="0% increase in melee attack speed, increasing x%x per level")
   Passives(2)=(Title="Melee Move Speed",Description="10% faster movement when wielding a melee weapon, plus x%x each level")
   Passives(3)=(Title="Damage Resistance",Description="Incoming damage reduced by %x%")
   Passives(4)=(Title="+Night Vision Capability",Description="Flashlights - AND Night Vision Goggles")
   Passives(5)=(Title="+Clots cannot grab you",Description="Clots can't hold on to a Berserker.")
   SkillCatagories(0)="Resistance"
   SkillCatagories(1)="Survival"
   SkillCatagories(2)="Close Combat"
   SkillCatagories(3)="Power"
   SkillCatagories(4)="Advanced Training"
   EXPAction1="Dealing Berserker weapon damage"
   EXPAction2="Kill zeds near a player with a Perk weapon"
   PerkSkills(0)=(Name="PoisonResistance",StartingValue=0.400000,MaxValue=0.400000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_PoisonResistance")
   PerkSkills(1)=(Name="SonicResistance",StartingValue=0.400000,MaxValue=0.400000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_SonicResistance")
   PerkSkills(2)=(Name="Vampire",StartingValue=4.000000,MaxValue=4.000000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Vampire")
   PerkSkills(3)=(Name="Fortitude",StartingValue=1.750000,MaxValue=1.750000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Fortitude")
   PerkSkills(4)=(Name="FuriousDefender",StartingValue=0.200000,MaxValue=0.200000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_FuriousDefender")
   PerkSkills(5)=(Name="Block",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Block")
   PerkSkills(6)=(Name="Parry",StartingValue=0.150000,MaxValue=0.150000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Parry")
   PerkSkills(7)=(Name="Smash",StartingValue=0.250000,MaxValue=0.250000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Smash")
   PerkSkills(8)=(Name="Spartan",StartingValue=0.700000,MaxValue=0.700000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Spartan")
   PerkSkills(9)=(Name="Menace",StartingValue=1.000000,MaxValue=1.000000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Menace")
   PrimaryWeaponDef=Class'KFGame.KFWeapDef_Crovel'
   KnifeWeaponDef=Class'KFGame.KFweapDef_Knife_Berserker'
   HitAccuracyHandicap=2.500000
   HeadshotAccuracyHandicap=-2.000000
   Name="Default__KFPerk_Berserker"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
