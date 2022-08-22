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

var	const				PerkSkill 	BerserkerDamage;
var const				PerkSkill	DamageResistance;                   // 0% resistance to all damage â€“ Max 25%
var const				PerkSkill	NightVision;

var const 	private 	float 		NinjaSprintModifer;
var const 	private 	float		SmashStumbleModifier;
var const 	private 	int 		SmallRadiusSizeSQ;
var 		private		bool		bParryActive;
var const 	private  	float 		ParryDuration;
var const 	private  	float 		ParrySpeed;
var const 	private  	float 		FurySpeed;
var const 	private 	float 		SmashKnockdownMultiplier;
var const 	private 	float 		SpartanZedTimeResistance;
var const 	private 	float 		SpeedDamageModifier;
var const 	private 	float 		SmashHeadDamageModifier;
var const 	private 	float 		VampireAttackSpeedModifier;
var const	private		float		ParryDamageReduction;
var const	private		int			RageRadius;
var const	private		float		RageFleeDuration;
var const	private		int			RageFleeDistance;
var const	private		int			RageDialogEvent;

// Events to play when parry skill is activated / deactivated
var AkEvent ParrySkillSoundModeStart;
var AkEvent ParrySkillSoundModeStop;

enum EBerserkPerkSkills
{
	EBerserkerFortitude,
	EBerserkerNinja,
	EBerserkerVampire,
	EBerserkerSpeed,
	EBerserkerResistance,
	EBerserkerParry,
	EBerserkerSmash,
	EBerserkerFury,
	EBerserkerRage,
	EBerserkerSpartan
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

/**
 * @brief Modifies skill related attributes
 */
simulated protected event PostSkillUpdate()
{
	super.PostSkillUpdate();

	// enable tick if we have the regeneration skill
	SetTickIsDisabled( !IsNinjaActive() );
}

/**
 * @brief script tick (server)
  *
 * @param DeltaTime time since the last tick
 */
event Tick( float DeltaTime )
{
	super.Tick( DeltaTime );

	if( IsNinjaActive() )
	{
		TickRegen( DeltaTime );
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

		;
		if( (MyKFWeapon != none && IsWeaponOnPerk( MyKFWeapon )) || IsDamageTypeOnPerk( DamageType ) )
		{
			TempDamage += InDamage * GetPassiveValue( BerserkerDamage,  CurrentLevel );
			if( IsSpeedActive() )
			{
				TempDamage += InDamage * static.GetSpeedDamageModifier();
				;
			}

			if( IsParryActive() )
			{
				TempDamage += InDamage * GetSkillValue( PerkSkills[EBerserkerParry] );
				;
			}

			if( HitZoneIdx == HZI_HEAD && IsSmashActive() )
			{
				TempDamage += InDamage * static.GetSmashHeadDamageModifier();
				;
			}
		}
	}

	;
	InDamage = Round( TempDamage );
}

/**
 * @brief Some perk skills modify the melee attack speed
 *
 * @param InDuration delay in between attacks
 */
simulated function ModifyMeleeAttackSpeed( out float InDuration, KFWeapon KFW )
{
	local float TempDuration;

	if( KFW == none || !KFW.IsMeleeWeapon() )
	{
		return;
	}

	TempDuration = InDuration;

	if( IsSpeedActive() )
	{
		;
		TempDuration -= InDuration * GetSkillValue( PerkSkills[EBerserkerSpeed] );
		;
	}

	if( GetParryActive() )
	{
		;
		TempDuration -= InDuration * ParrySpeed;
		;
	}

	if( IsFuryActive() && KFW.CurrentFireMode == 0 )
	{
		;
		TempDuration -= InDuration * GetFurySpeed();
		;
	}

	if( IsVampireActive() )
	{
		;
		TempDuration -= InDuration * static.GetVampireAttackSpeedModifier();
		;
	}

	;
	InDuration = TempDuration;
}

simulated final static function float GetFurySpeed()
{
	return default.FurySpeed;
}

/**
 * @brief Weapons and perk skills can affect the jog/sprint speed
 *
 * @param Speed jog speed
 */
simulated function ModifySpeed( out float Speed )
{
	local KFWeapon MyKFWeapon;
	local KFInventoryManager KFIM;

	if( !IsNinjaActive() )
	{
		return;
	}

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
		Speed += Speed * GetSkillValue( PerkSkills[EBerserkerNinja] );
	}
}

/**
 * @brief Weapons and perk skills can affect the jog/sprint speed
 *
 * @param Speed sprint speed
 */
simulated function ModifySprintSpeed( out float Speed )
{
	local KFWeapon MyKFWeapon;
	local KFInventoryManager KFIM;

	if( !IsNinjaActive() )
	{
		return;
	}

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
		Speed += Speed * static.GetNinjaSprintModifier();
	}
}

simulated static final function float GetNinjaSprintModifier()
{
	return default.NinjaSprintModifer;
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

	if( InDamage <= 0 )
	{
		return;
	}
	
	TempDamage = InDamage;

	if( IsResistanceActive() )
	{
		TempDamage -= InDamage * GetSkillValue( PerkSkills[EBerserkerResistance] );
		if( ClassIsChildOf( Damagetype,  class'KFDT_Toxic' ) ||
			ClassIsChildOf( Damagetype,  class'KFDT_Sonic' ) )
		{
			TempDamage -= InDamage * GetSkillValue( PerkSkills[EBerserkerResistance] );
		}
	}

	if( GetParryActive() )
	{
		TempDamage -= InDamage * static.GetParryDamageModifier();
		;
	}

	TempDamage -= InDamage * GetPassiveDamageResistance( CurrentLevel );

	;
	InDamage = Round( TempDamage );
}

/**
 * @brief Calculates the additional ammo per perk level
 *
 * @param Level Current perk level
 * @return additional ammo
 */
simulated private final static function float GetPassiveDamageResistance( int Level )
{
	return default.DamageResistance.Increment * FFloor( float( Level ) / 5.f );
}

function ModifyBloatBileDoT( out float DoTScaler )
{
	super.ModifyBloatBileDoT( DoTScaler );

	;
	DotScaler -= GetSkillValue( PerkSkills[EBerserkerResistance] );
}

simulated static function GetPassiveStrings( out array<string> PassiveValues, out array<string> Increments, byte Level )
{
	PassiveValues[0] = Round(GetPassiveValue( default.BerserkerDamage, Level ) * 100) $ "%";
	PassiveValues[1] = Round((GetPassiveValue(default.DamageResistance, Level)) * 100) $ "%";
	PassiveValues[2] = "";
	PassiveValues[3] = "";

	Increments[0] = "[" @ Left( string( default.BerserkerDamage.Increment * 100 ), InStr(string(default.BerserkerDamage.Increment * 100), ".") + 2 )$"% /" @ default.LevelString @ "]";
	Increments[1] = "[" @ Left( string( default.DamageResistance.Increment * 100 ), InStr(string(default.DamageResistance.Increment * 100), ".") + 2 )$"% / 5" @ default.LevelString @ "]";
	Increments[2] = "";
	Increments[3] = "";
}

/*********************************************************************************************
* @name	 Selectable skills functions
********************************************************************************************* */

/**
 * @brief modifies the players health
 *
 * @param InHealth health
 */
function ModifyHealth( out int InHealth )
{
	local float TempHealth;

	TempHealth = InHealth;

	if( IsFortitudeActive() )
	{
		TempHealth += InHealth * GetSKillValue( PerkSkills[EBerserkerFortitude] );
		;
	}

	InHealth = Round( TempHealth );
}

/**
 * @brief Adds health points earned by killing with the vampire skill
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
 * @brief Skills can effect the hard (secondary) melee attack damage
 *
 * @param int The damage to modify
 */
function ModifyHardAttackDamage( out int InDamage )
{
	local float TempDamage;

	TempDamage = InDamage;

	if( IsSmashActive() )
	{
		TempDamage += InDamage * GetSkillValue( PerkSkills[EBerserkerSmash] );
		;
	}

	;
	InDamage = Round( TempDamage );
}

/**
 * @brief Skills can effect the light melee attack damage
 *
 * @param int The damage to modify
 */
function ModifyLightAttackDamage( out int InDamage )
{
	local float TempDamage;

	if( IsFuryActive() )
	{
		TempDamage = InDamage;
		TempDamage += InDamage * GetSkillValue( PerkSkills[EBerserkerFury] );
		InDamage = Round( TempDamage );
	}
}

/**
 * @brief Called when the parry time ends
 */
simulated function ParryTimer()
{
	bParryActive = false;
	SetTickIsDisabled( !IsNinjaActive() );

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
	if( IsResistanceActive() )
	{
		InDuration *= 1 - GetSkillValue( PerkSkills[EBerserkerResistance]);
	}
}


/**
 * @brief skills and weapons can modify the stumbling power
 * @return stumbling power modifier
 */
function float GetStumblePowerModifier( optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart )
{
	if( IsSmashActive() )
	{ 
        return 1.f + static.GetSmashStumbleModifier();
	}

	return 1.f;
}

 final static function float GetSmashStumbleModifier()
 {
 	return default.SmashStumbleModifier;
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

simulated function float GetSirenScreamStrength()
{
	if( IsResistanceActive() )
	{
		return 1 - GetSkillValue( PerkSkills[EBerserkerResistance] );
	}

	return super.GetSirenScreamStrength();
}

function NotifyZedTimeStarted()
{
	local Pawn P;
	local KFAIController KFAIC;
	local bool bScaredAI;

	if( IsRageActive() && OwnerPawn != none )
	{
		OwnerPawn.Health += OwnerPawn.HealthMax * GetSkillValue( PerkSkills[EBerserkerRage] );
		OwnerPawn.Health = Min( OwnerPawn.Health, OwnerPawn.HealthMax );

		foreach WorldInfo.AllPawns( class'Pawn', P, OwnerPawn.Location, static.GetRageRadius() )
		{
			KFAIC = KFAIController(P.Controller);
			if( KFAIC != none )
			{
				KFAIC.DoFleeFrom( OwnerPawn, static.GetRageFleeDuration(), static.GetRageFleeDistance() );
				bScaredAI = true;
			}
			else
			{
				continue;
			}
		}

		if( bScaredAI )
		{
			KFGameInfo(Owner.WorldInfo.Game).DialogManager.PlayDialogEvent( OwnerPawn, RageDialogEvent );
		}
	}
}

private static function int GetRageRadius()
{
	return default.RageRadius;
}

private static function float GetRageFleeDuration()
{
	return default.RageFleeDuration;
}

private static function int GetRageFleeDistance()
{
	return default.RageFleeDistance;
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

	;

	if( IsWeaponOnPerk( W ) && ZedTimeModifyingStates.Find( StateName ) != INDEX_NONE )
	{
		if( CouldSpartanBeActive() )
		{
			return default.SpartanZedTimeResistance;
		}
	}

	return 0.f;
}

private static function float GetSpeedDamageModifier()
{
	return default.SpeedDamageModifier;
}

private static function float GetSmashHeadDamageModifier()
{
	return default.SmashHeadDamageModifier;
}

private static function float GetVampireAttackSpeedModifier()
{
	return default.VampireAttackSpeedModifier;
}

private static function float GetParryDamageModifier()
{
	return default.ParryDamageReduction;
}
/*********************************************************************************************
* @name	 Getters / Setters
********************************************************************************************* */


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
 * @brief Checks if the ninja skill is active
 *
 * @return true if we have the skill enabled
 */
simulated final private function bool IsNinjaActive()
{
	return PerkSkills[EBerserkerNinja].bActive;
}


/**
 * @brief Checks if the Vampire skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private function bool IsVampireActive()
{
	return PerkSkills[EBerserkerVampire].bActive;
}


/**
 * @brief Checks if the Speed skill is active
 *
 * @return true if we have the skill enabled
 */
simulated final private function bool IsSpeedActive()
{
	return PerkSkills[EBerserkerSpeed].bActive;
}

/**
 * @brief Do we need to tick the perk?
 *
 * @return true if perk needs to be ticked
 */
simulated function bool PerkNeedsTick()
{
	return IsNinjaActive();
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
 * @brief Checks if the resistance skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsResistanceActive()
{
	return PerkSkills[EBerserkerResistance].bActive;
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
 * @brief Checks if the Smash skill is active
 *
 * @return true if we have the skill enabled
 */
final simulated protected event bool IsSmashActive()
{
	return PerkSkills[EBerserkerSmash].bActive;
}

/**
 * @brief Checks if the fury skill is active
 *
 * @return true if we have the skill enabled
 */
final simulated private function bool IsFuryActive()
{
	return PerkSkills[EBerserkerFury].bActive;
}

/**
 * @brief Checks if the player can be grabbed by clots
 *
 * @return true if we are not grabbable
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
simulated private event bool IsRageActive()
{
	return PerkSkills[EBerserkerRage].bActive && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief Checks if the Spartan skill is active and if we are in zed time
 *
 * @return true if we have the skill enabled
 */
simulated final private event bool IsSpartanActive()
{
	return PerkSkills[EBerserkerSpartan].bActive && WorldInfo.TimeDilation < 1.f;
}

simulated private event bool CouldSpartanBeActive()
{
	return PerkSkills[EBerserkerSpartan].bActive;
}

/**
 * @brief Spartan resists zed time. You move at normal speed.
 *
 * @return true if Spartan are active
 */
simulated function bool IsFastInZedTime()
{
	return PerkSkills[EBerserkerSpartan].bActive;
}

/*********************************************************************************************
* @name	  UI / HUD
********************************************************************************************* */
simulated function class<EmitterCameraLensEffectBase> GetPerkLensEffect( class<KFDamageType> DmgType )
{
	if( ClassIsChildOf( DmgType,  class'KFDT_Toxic' ) )
	{
		return IsResistanceActive() ? DmgType.default.AltCameraLensEffectTemplate : super.GetPerkLensEffect( DmgType );
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
	}
}

defaultproperties
{
   BerserkerDamage=(Name="Berserker Damage",Increment=0.010000,MaxValue=0.250000)
   DamageResistance=(Name="Damage Resistance",Increment=0.020000,MaxValue=0.100000)
   NightVision=(Name="Night Vision")
   NinjaSprintModifer=0.250000
   SmashStumbleModifier=2.000000
   SmallRadiusSizeSQ=40000
   ParryDuration=10.000000
   ParrySpeed=0.050000
   FurySpeed=0.050000
   SpartanZedTimeResistance=1.000000
   SpeedDamageModifier=0.200000
   SmashHeadDamageModifier=0.250000
   VampireAttackSpeedModifier=0.200000
   ParryDamageReduction=0.400000
   RageRadius=650
   RageFleeDuration=3.000000
   RageFleeDistance=2500
   RageDialogEvent=229
   ParrySkillSoundModeStart=AkEvent'WW_GLO_Runtime.Play_Beserker_Parry_Mode'
   ParrySkillSoundModeStop=AkEvent'WW_GLO_Runtime.Stop_Beserker_Parry_Mode'
   ProgressStatID=10
   PerkBuildStatID=11
   SecondaryXPModifier(0)=6
   SecondaryXPModifier(1)=8
   SecondaryXPModifier(2)=10
   SecondaryXPModifier(3)=14
   PerkName="Berserker"
   Passives(0)=(Title="Berserker Damage",Description="Perk weapon damage increases x%x per level")
   Passives(1)=(Title="Damage Resistance",Description="Damage resistance increases x%x every 5 levels")
   Passives(2)=(Title="+Night Vision Capability",Description="Flashlight - AND Night Vision Goggles")
   Passives(3)=(Title="+Clots cannot grab you",Description="Clots can't hold on to a Berserker")
   Passives(4)=()
   SkillCatagories(0)="Survival"
   SkillCatagories(1)="Combat"
   SkillCatagories(2)="Close Combat"
   SkillCatagories(3)="Power"
   SkillCatagories(4)="Advanced Training"
   EXPAction1="Dealing Berserker weapon damage"
   EXPAction2="Killing Zeds near a player with a Berserker weapon"
   PerkSkills(0)=(Name="Fortitude",StartingValue=0.750000,MaxValue=0.750000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Fortitude")
   PerkSkills(1)=(Name="Ninja",StartingValue=0.200000,MaxValue=0.200000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Ninja")
   PerkSkills(2)=(Name="Vampire",StartingValue=4.000000,MaxValue=4.000000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Vampire")
   PerkSkills(3)=(Name="Speed",StartingValue=0.200000,MaxValue=0.200000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Speed")
   PerkSkills(4)=(Name="Resistance",StartingValue=0.200000,MaxValue=0.200000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_PoisonResistance")
   PerkSkills(5)=(Name="Parry",StartingValue=0.350000,MaxValue=0.350000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Parry")
   PerkSkills(6)=(Name="Smash",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Smash")
   PerkSkills(7)=(Name="Fury",StartingValue=0.300000,MaxValue=0.300000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Intimidate")
   PerkSkills(8)=(Name="Rage",StartingValue=0.250000,MaxValue=0.250000,IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Menace")
   PerkSkills(9)=(Name="Spartan",IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Flash")
   RegenerationAmount=2
   ZedTimeModifyingStates(0)="MeleeChainAttacking"
   ZedTimeModifyingStates(1)="MeleeAttackBasic"
   ZedTimeModifyingStates(2)="MeleeHeavyAttacking"
   ZedTimeModifyingStates(3)="MeleeSustained"
   ZedTimeModifyingStates(4)="WeaponFiring"
   PrimaryWeaponDef=Class'KFGame.KFWeapDef_Crovel'
   KnifeWeaponDef=Class'KFGame.KFweapDef_Knife_Berserker'
   AutoBuyLoadOutPath(0)=Class'KFGame.KFWeapDef_Crovel'
   AutoBuyLoadOutPath(1)=Class'KFGame.KFWeapDef_Nailgun'
   AutoBuyLoadOutPath(2)=Class'KFGame.KFWeapDef_Pulverizer'
   AutoBuyLoadOutPath(3)=Class'KFGame.KFWeapDef_Eviscerator'
   HitAccuracyHandicap=2.500000
   HeadshotAccuracyHandicap=-2.000000
   Name="Default__KFPerk_Berserker"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
