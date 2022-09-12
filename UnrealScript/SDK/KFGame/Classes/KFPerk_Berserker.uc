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

//`include(KFOnlineStats.uci)

var	const				PerkSkill 	BerserkerDamage;
var const				PerkSkill	DamageResistance;                   // 0% resistance to all damage – Max 25%
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

/** The last time a zed was bumped using battering ram */
var float LastBumpTime;
/** The unique list of actors that have been bumped before the last cooldown reset */
var array<Actor> CurrentBumpedActors;

cpptext
{
	// specific abilities
	virtual UBOOL UseBlueMeleeTrails();
	virtual UBOOL UseRedMeleeTrails();
}

/*********************************************************************************************
* @name	 Perk init and spawning
******************************************************************************************** */

/** (Server) Modify Instigator settings based on selected perk */
function ApplySkillsToPawn()
{
	super.ApplySkillsToPawn();

	if( OwnerPawn != none )
	{
		OwnerPawn.bMovesFastInZedTime = IsFastInZedTime() || IsSWATEnforcerActiveForWeekly();
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
	//clear parry
	ParryTimer();
}

function ClearPerkEffects()
{
	ParryTimer();
	Super.ClearPerkEffects();
}

reliable client function ClientClearPerkEffects()
{
	if (Role != ROLE_Authority)
	{
		super.ClientClearPerkEffects();

		ParryTimer();
	}
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

simulated event float GetZedTimeSpeedScale()
{
	return GetZedTimeSpeedScaleForColliseum();
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

	super.ModifyDamageGiven(InDamage, DamageCauser, MyKFPM, DamageInstigator, DamageType, HitZoneIdx);

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

		`QALog( GetFuncName() @ "Base damage:" @ InDamage , bLogPerk);
		if( (MyKFWeapon != none && IsWeaponOnPerk( MyKFWeapon,, self.class )) || IsDamageTypeOnPerk( DamageType ) )
		{
			TempDamage += InDamage * GetPassiveValue( BerserkerDamage,  CurrentLevel );
			if( IsSpeedActive() )
			{
				TempDamage += InDamage * static.GetSpeedDamageModifier();
				`QALog( GetFuncName() @ "Speed extra damage:" @  InDamage * static.GetSpeedDamageModifier(), bLogPerk);
			}

			if( GetParryActive() )
			{
				TempDamage += InDamage * GetSkillValue( PerkSkills[EBerserkerParry] );
				`QALog( GetFuncName() @ "Parry extra damage:" @  InDamage * GetSkillValue( PerkSkills[EBerserkerParry] ), bLogPerk);
			}

			if( HitZoneIdx == HZI_HEAD && IsSmashActive() )
			{
				TempDamage += InDamage * static.GetSmashHeadDamageModifier();
				`QALog( GetFuncName() @ "Smash head hit extra damage:" @  InDamage * static.GetSmashHeadDamageModifier(), bLogPerk);
			}
		}
	}

	`QALog( "Total Damage Given" @ MyKFWeapon @ GetPercentage(InDamage, Round(TempDamage)) @ "Start/End" @ InDamage @ Round(TempDamage), bLogPerk );
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
		`QALog("Speed reduced the attack delay duration by:" @ TempDuration * GetSkillValue( PerkSkills[EBerserkerSpeed] ), bLogPerk);
		TempDuration -= InDuration * GetSkillValue( PerkSkills[EBerserkerSpeed] );
		`QALog( "Speed Melee Attack Speed pct" @ GetSkillValue( PerkSkills[EBerserkerSpeed] ) @ InDuration @ TempDuration, bLogPerk );
	}

	if( GetParryActive() )
	{
		`QALog("Parry reduced the attack delay duration by:" @ TempDuration * ParrySpeed, bLogPerk);
		TempDuration -= InDuration * ParrySpeed;
		`QALog( "Parry Melee Attack Speed pct" @ ParrySpeed, bLogPerk );
	}

	if( IsFuryActive() && KFW.CurrentFireMode == 0 )
	{
		`QALog("Fury reduced the attack delay duration by:" @ TempDuration * GetSkillValue( PerkSkills[EBerserkerFury] ), bLogPerk);
		TempDuration -= InDuration * GetFurySpeed();
		`QALog( "Fury Melee Attack Speed pct" @ GetFurySpeed(), bLogPerk );
	}

	if( IsVampireActive() )
	{
		`QALog("Vampire reduced the attack delay duration by:" @ TempDuration * static.GetVampireAttackSpeedModifier(), bLogPerk);
		TempDuration -= InDuration * static.GetVampireAttackSpeedModifier();
		`QALog( "Vampire Melee Attack Speed pct" @ static.GetVampireAttackSpeedModifier(), bLogPerk );
	}

	`QALog( "Total, Melee Attack Speed" @ GetPercentage( InDuration, TempDuration ) @ "Start/End" @ InDuration @ TempDuration, bLogPerk );
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

	if (MyKFWeapon != none &&
		(MyKFWeapon.IsMeleeWeapon() || IsWeaponOnPerk(MyKFWeapon,, self.class)))
	{
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

	if (MyKFWeapon != none &&
		(MyKFWeapon.IsMeleeWeapon() || IsWeaponOnPerk(MyKFWeapon,, self.class)))
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
		`QALog( "Parry DamageResistance =" @ InDamage * static.GetParryDamageModifier(), bLogPerk );
	}

	TempDamage -= InDamage * GetPassiveDamageResistance( CurrentLevel );

	`QALog( "Total DamageResistance" @ DamageType @ GetPercentage( InDamage, Round( TempDamage ) ) @ "Start/End" @ InDamage @ TempDamage, bLogPerk );
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

	`QALog( "BloatBile DotScaler" @ GetPercentage( DoTScaler, DoTScaler - GetSkillValue( PerkSkills[EBerserkerResistance] ) ),bLogPerk );
	DotScaler -= GetSkillValue( PerkSkills[EBerserkerResistance] );
}

simulated static function GetPassiveStrings( out array<string> PassiveValues, out array<string> Increments, byte Level )
{
	PassiveValues[0] = Round(GetPassiveValue( default.BerserkerDamage, Level ) * 100) $ "%";
	PassiveValues[1] = Round(GetPassiveDamageResistance( Level ) * 100) $ "%";
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
		`QALog( "Health passive + Fortitude health" @ InHealth, bLogPerk );
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
		`QALog( "Vampire, HealDamage" @ GetSkillValue( PerkSkills[EBerserkerVampire] ), bLogPerk );
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
		`QALog( GetFuncName() @ "Smash extra damage:" @  InDamage * GetSkillValue( PerkSkills[EBerserkerSmash] ), bLogPerk);
	}

	`QALog( "Total Hard Atk Dmg" @ GetPercentage( InDamage, TempDamage != InDamage ? Round( TempDamage ) : InDamage ) @ "Start/End" @ InDamage @ ( TempDamage != InDamage ? Round( TempDamage ) : InDamage ), bLogPerk );
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
	if( IsSmashActive() && IsDamageTypeOnPerk(DamageType) )
	{
        return static.GetSmashStumbleModifier();
	}

	return 0.f;
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
	local Pawn OtherPawn;
	local KFPlayerController KFPC;
	local KFPowerUp PowerUp;
	local KFAIController KFAIC;
	local KFGameInfo GameInfo;
	local bool bScaredAI;
	local bool bCannotBeHealed;

	if( IsRageActive() && OwnerPawn != none )
	{
		KFPC = KFPlayerController(OwnerPawn.Controller);
		if( KFPC != none )
		{
			PowerUp = KFPC.GetPowerUp();
			bCannotBeHealed = (PowerUp != none && !PowerUp.CanBeHealedWhilePowerUpIsActive);

			GameInfo = KFGameInfo(WorldInfo.Game);
			if(GameInfo != none)
			{
				bCannotBeHealed = bCannotBeHealed ||(GameInfo.OutbreakEvent != none && GameInfo.OutbreakEvent.ActiveEvent.bCannotBeHealed);
			}
		}

		if( bCannotBeHealed == false )
		{
			OwnerPawn.Health += OwnerPawn.HealthMax * GetSkillValue( PerkSkills[EBerserkerRage] );
			OwnerPawn.Health = Min( OwnerPawn.Health, OwnerPawn.HealthMax );
		}

		foreach WorldInfo.AllPawns( class'Pawn', OtherPawn, OwnerPawn.Location, static.GetRageRadius() )
		{
			KFAIC = KFAIController(OtherPawn.Controller);
			if( KFAIC != none )
			{
				KFAIC.DoPauseAI( static.GetRageFleeDuration(), true, false, true);
				//KFAIC.DoFleeFrom( OwnerPawn, static.GetRageFleeDuration(), static.GetRageFleeDistance(),, true );
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

	if( IsWeaponOnPerk( W,, self.class ) && ZedTimeModifyingStates.Find( StateName ) != INDEX_NONE )
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
	return PerkSkills[EBerserkerFortitude].bActive && IsPerkLevelAllowed(EBerserkerFortitude);
}

/**
 * @brief Checks if the ninja skill is active
 *
 * @return true if we have the skill enabled
 */
simulated final private function bool IsNinjaActive()
{
	return PerkSkills[EBerserkerNinja].bActive && IsPerkLevelAllowed(EBerserkerNinja);
}


/**
 * @brief Checks if the Vampire skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private function bool IsVampireActive()
{
	return PerkSkills[EBerserkerVampire].bActive && IsPerkLevelAllowed(EBerserkerVampire);
}


/**
 * @brief Checks if the Speed skill is active
 *
 * @return true if we have the skill enabled
 */
simulated final private function bool IsSpeedActive()
{
	return PerkSkills[EBerserkerSpeed].bActive && IsPerkLevelAllowed(EBerserkerSpeed);
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
	return PerkSkills[EBerserkerParry].bActive && IsPerkLevelAllowed(EBerserkerParry);
}

/**
 * @brief Checks if the resistance skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsResistanceActive()
{
	return PerkSkills[EBerserkerResistance].bActive && IsPerkLevelAllowed(EBerserkerResistance);
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
	return PerkSkills[EBerserkerSmash].bActive && IsPerkLevelAllowed(EBerserkerSmash);
}

/**
 * @brief Checks if the fury skill is active
 *
 * @return true if we have the skill enabled
 */
final simulated private function bool IsFuryActive()
{
	return PerkSkills[EBerserkerFury].bActive && IsPerkLevelAllowed(EBerserkerFury);
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
	return PerkSkills[EBerserkerRage].bActive && WorldInfo.TimeDilation < 1.f && IsPerkLevelAllowed(EBerserkerRage) && !ShouldDisableZedTimeSkillsForWeekly();
}

/**
 * @brief Checks if the Spartan skill is active and if we are in zed time
 *
 * @return true if we have the skill enabled
 */
simulated final private event bool IsSpartanActive()
{
	return PerkSkills[EBerserkerSpartan].bActive && WorldInfo.TimeDilation < 1.f && IsPerkLevelAllowed(EBerserkerSpartan) && !ShouldDisableZedTimeSkillsForWeekly();
}

simulated private event bool CouldSpartanBeActive()
{
	return PerkSkills[EBerserkerSpartan].bActive && IsPerkLevelAllowed(EBerserkerSpartan) && !ShouldDisableZedTimeSkillsForWeekly();
}

/**
 * @brief Spartan resists zed time. You move at normal speed.
 *
 * @return true if Spartan are active
 */
simulated function bool IsFastInZedTime()
{
	return PerkSkills[EBerserkerSpartan].bActive && IsPerkLevelAllowed(EBerserkerSpartan) && !ShouldDisableZedTimeSkillsForWeekly();
}

simulated function bool IsFastInZedTimeOutbreak()
{
	return ShouldDisableZedTimeSkillsForWeekly();
}

/**
 * @brief Checks if we should be using instigator for time dilation
 *      while in zed time.  Specific to Spartan mode for Berserker.
 *
 * @return true if Spartan is active
 */
simulated event bool ShouldUseFastInstigatorDilation(KFWeapon Weap)
{
    if (PerkSkills[EBerserkerSpartan].bActive && Weap != none && IsPerkLevelAllowed(EBerserkerSpartan) && !ShouldDisableZedTimeSkillsForWeekly())
    {
        return Weap.GetWeaponPerkClass(default.Class) == default.Class;
    }

    return false;
}

/*********************************************************************************************
* @name	 Special Weekly Modes
********************************************************************************************* */

simulated event float GetZedTimeSpeedScaleForColliseum()
{
	return IsSWATEnforcerActiveForWeekly() ? class'KFPerk_Swat'.default.SWATEnforcerZedTimeSpeedScale : 1.f;
}

function bool ShouldDisableZedTimeSkillsForWeekly()
{
	return MyKFGI != none && MyKFGI.OutbreakEvent != none && MyKFGI.OutbreakEvent.ActiveEvent.bColliseumSkillConditionsActive;
}

function bool IsSWATEnforcerActiveForWeekly()
{
	return MyKFGI != none && MyKFGI.OutbreakEvent != none && MyKFGI.OutbreakEvent.ActiveEvent.bColliseumSkillConditionsActive;
}

simulated function bool ShouldKnockDownOnBump()
{
	return IsSWATEnforcerActiveForWeekly() && WorldInfo.TimeDilation < 1.f;
}

simulated function OnBump(Actor BumpedActor, KFPawn_Human BumpInstigator, vector BumpedVelocity, rotator BumpedRotation)
{
	local KFPawn_Monster KFPM;
	local bool CanBump;

	if (ShouldKnockDownOnBump() && Normal(BumpedVelocity) dot Vector(BumpedRotation) > 0.7f)
	{
		KFPM = KFPawn_Monster(BumpedActor);
		if (KFPM != none)
		{
			// cooldown so that the same zed can't be bumped multiple frames back to back
			//	especially relevant if they can't be knocked down or stumbled so the player is always bumping them
			if (WorldInfo.TimeSeconds - LastBumpTime > class'KFPerk_Swat'.default.BumpCooldown)
			{
				CurrentBumpedActors.length = 0;
				CurrentBumpedActors.AddItem(BumpedActor);
				CanBump = true;
			}
			// if still within the cooldown time, can still bump the actor as long as it hasn't been bumped yet
			else if (CurrentBumpedActors.Find(BumpedActor) == INDEX_NONE)
			{
				CurrentBumpedActors.AddItem(BumpedActor);
				CanBump = true;
			}

			LastBumpTime = WorldInfo.TimeSeconds;

			if (CanBump)
			{
				if (KFPM.IsHeadless())
				{
					KFPM.TakeDamage(KFPM.HealthMax, BumpInstigator.Controller, BumpInstigator.Location,
						Normal(vector(BumpedRotation)) * class'KFPerk_Swat'.default.BumpMomentum, class'KFPerk_Swat'.default.BumpDamageType);
				}
				else
				{
					KFPM.TakeDamage(class'KFPerk_Swat'.default.BumpDamageAmount, BumpInstigator.Controller, BumpInstigator.Location,
						Normal(vector(BumpedRotation)) * class'KFPerk_Swat'.default.BumpMomentum, class'KFPerk_Swat'.default.BumpDamageType);
					KFPM.Knockdown(BumpedVelocity * 3, vect(1, 1, 1), KFPM.Location, 1000, 100);
				}
			}
		}
	}
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

static function PrepareExplosive( Pawn ProjOwner, KFProjectile Proj, optional float AuxRadiusMod = 1.0f, optional float AuxDmgMod = 1.0f )
{
    local KFPlayerController KFPC;
    local KFPerk InstigatorPerk;

    if( ProjOwner != none )
    {
	    // Change the radius and damage based on the perk
	    if( ProjOwner.Role == ROLE_Authority )
	    {
	    	KFPC = KFPlayerController( ProjOwner.Controller );
	    	if( KFPC != none )
	    	{
		        InstigatorPerk = KFPC.GetPerk();
		        Proj.ExplosionTemplate.DamageRadius *= InstigatorPerk.GetAoERadiusModifier() * AuxRadiusMod;
		    }
	    }
	}
}


DefaultProperties
{
	ParryDuration=10.f
	ParrySpeed=0.05
	FurySpeed=0.05
	NinjaSprintModifer=0.25
	SmashStumbleModifier=2.f
	SpartanZedTimeResistance=1.f 			//Attack speed zed time resistance
	SpeedDamageModifier=0.2
	SmashHeadDamageModifier=0.25
	VampireAttackSpeedModifier=0.2f
	ParryDamageReduction=0.4f //0.75
	RageRadius=1000 //300
	RageFleeDuration=5.f //3
	RageFleeDistance=2500 //5000
	RageDialogEvent=229

	RegenerationInterval=1
	RegenerationAmount=2

	ZedTimeModifyingStates(0)="MeleeChainAttacking"
	ZedTimeModifyingStates(1)="MeleeAttackBasic"
	ZedTimeModifyingStates(2)="MeleeHeavyAttacking"
	ZedTimeModifyingStates(3)="MeleeSustained"
	ZedTimeModifyingStates(4)="WeaponFiring"

	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Berserker'

	ProgressStatID=STATID_Bsrk_Progress
	PerkBuildStatID=STATID_Bsrk_Build

	SecondaryXPModifier(0)=6
	SecondaryXPModifier(1)=8
	SecondaryXPModifier(2)=10
	SecondaryXPModifier(3)=14
	SmallRadiusSizeSQ=40000

	PrimaryWeaponDef=class'KFWeapDef_Crovel'
	KnifeWeaponDef=class'KFweapDef_Knife_Berserker'
	GrenadeWeaponDef=class'KFWeapDef_Grenade_Berserker'

	BerserkerDamage=(Name="Berserker Damage",Increment=0.01,Rank=0,StartingValue=0.f,MaxValue=0.25)
	DamageResistance=(Name="Damage Resistance",Increment=0.03f,Rank=0,StartingValue=0.f,MaxValue=0.15f)
	NightVision=(Name="Night Vision",Increment=0.f,Rank=0,StartingValue=0.f,MaxValue=0.f)

	PerkSkills(EBerserkerFortitude)=(Name="Fortitude",IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Fortitude",Increment=0.f,Rank=0,StartingValue=1.0,MaxValue=1.0) //0.75
	PerkSkills(EBerserkerNinja)=(Name="Ninja",IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Ninja",Increment=0.f,Rank=0,StartingValue=0.2f,MaxValue=0.2f)
	PerkSkills(EBerserkerVampire)=(Name="Vampire",IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Vampire",Increment=0.f,Rank=0,StartingValue=4.f,MaxValue=4.f)
	PerkSkills(EBerserkerSpeed)=(Name="Speed",IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Speed",Increment=0.f,Rank=0,StartingValue=0.2f,MaxValue=0.2f)
	PerkSkills(EBerserkerResistance)=(Name="Resistance",IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_PoisonResistance",Increment=0.f,Rank=0,StartingValue=0.25f,MaxValue=0.25f) //0.2
	PerkSkills(EBerserkerParry)=(Name="Parry",IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Parry",Increment=0.f,Rank=0,StartingValue=0.35,MaxValue=0.35)
	PerkSkills(EBerserkerSmash)=(Name="Smash",IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Smash",Increment=0.f,Rank=0,StartingValue=0.5f,MaxValue=0.5f)
	PerkSkills(EBerserkerFury)=(Name="Fury",IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Intimidate",Increment=0.f,Rank=0,StartingValue=0.3f,MaxValue=0.3f)
	PerkSkills(EBerserkerRage)=(Name="Rage",IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Menace",Increment=0.f,Rank=0,StartingValue=0.5,MaxValue=0.5)
	PerkSkills(EBerserkerSpartan)=(Name="Spartan",IconPath="UI_PerkTalent_TEX.berserker.UI_Talents_Berserker_Flash",Increment=0.f,Rank=0,StartingValue=0.f,MaxValue=0.f)

	ParrySkillSoundModeStart=AkEvent'WW_GLO_Runtime.Play_Beserker_Parry_Mode'
	ParrySkillSoundModeStop=AkEvent'WW_GLO_Runtime.Stop_Beserker_Parry_Mode'

    // Skill tracking
	HitAccuracyHandicap=2.5
	HeadshotAccuracyHandicap=-2.0
	AutoBuyLoadOutPath=(class'KFWeapDef_Crovel', class'KFWeapDef_Katana', class'KFWeapDef_Pulverizer', class'KFWeapDef_Eviscerator', class'KFWeapDef_AbominationAxe')

	// Prestige Rewards
	PrestigeRewardItemIconPaths[0]="WEP_SkinSet_Prestige01_Item_TEX.knives.BerserkerKnife_PrestigePrecious_Mint_large"
	PrestigeRewardItemIconPaths[1]="WEP_SkinSet_Prestige02_Item_TEX.tier01.Crovel_PrestigePrecious_Mint_large"
	PrestigeRewardItemIconPaths[2]="WEP_skinset_prestige03_itemtex.tier02.Katana_PrestigePrecious_Mint_large"
	PrestigeRewardItemIconPaths[3]="wep_skinset_prestige04_itemtex.tier03.Pulverizer_PrestigePrecious_Mint_Large"
	PrestigeRewardItemIconPaths[4]="WEP_SkinSet_Prestige05_Item_TEX.tier04.Eviscerator_PrestigePrecious_Mint_large"
}
