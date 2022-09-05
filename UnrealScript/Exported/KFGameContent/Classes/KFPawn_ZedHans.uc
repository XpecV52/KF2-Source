//=============================================================================
// KFPawn_ZedHans
//=============================================================================
// Hans Boss Pawn Class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedHans extends KFPawn_ZedHansBase;

var() AnimSet MeleeAnimSet;
var() AnimSet GunsAnimSet;

/** SkelControl guns to the hip so they don't move when we play aims or additives */
var SkelControlSingleBone RightHolsterSkelCtrl;
var SkelControlSingleBone LeftHolsterSkelCtrl;

/** Explosion burst template to use for surrounded AoE nerve gas attack */
var KFGameExplosion NerveGasExplosiveBlastTemplate;

/** Lingering explosion template to use for surrounded AoE nerve gas attack */
var KFGameExplosion NerveGasAttackTemplate;

/** The damage type to use when sprinting and bumping zeds */
var class<KFDamageType> HeavyBumpDamageType;

/** Info for minion wave spawning */
struct ProjectileTossInfo
{
    /** The toss velocity used to throw the projectile*/
    var	vector				TossVelocity;
    /** The location the projectile was spawned from*/
    var	vector				TossFromLocation;
    /** The location the projectile was tossed to*/
    var	vector				TossTargetLocation;
    /** The speed the projectile was tossed at*/
    var	float				TossSpeed;
    /** The Z percent the projectile was tossed at*/
    var	float				TossZPct;
    /** The time the projectile was thrown at*/
    var	float				TossTime;
};

/** Waves to summon at each stage by difficulty level*/
var	ProjectileTossInfo				CachedGoodGrenadeToss;

/** Events for looping ambient breathing like Darth Vader */
var AkEvent AmbientBreathingEvent;
var AkEvent LowHealthAmbientBreathingEvent;

/** Restricts how often tickdialog can be called */
var float TickDialogInterval;

/** Backpack vent particle system (used when in hunt and heal mode) */
var ParticleSystem					BackPackSmokeEffectTemplate;
var ParticleSystemComponent 		BackPackSmokePSC;

/*********************************************************************************************
* Battle damage phases
**********************************************************************************************/
var name BattlePhaseLightFrontSocketName;
var name BattlePhaseLightBackSocketName;
var transient PointLightComponent BattlePhaseLightTemplateGreen;
var transient PointLightComponent BattlePhaseLightTemplateYellow;
var transient PointLightComponent BattlePhaseLightTemplateRed;
var transient PointLightComponent BattlePhaseLightTemplateBlinking;
var transient PointLightComponent BattlePhaseLightFront;
var transient PointLightComponent BattlePhaseLightBack;

var LinearColor BattlePhaseGlowColorParamGreen;
var LinearColor BattlePhaseGlowColorParamYellow;
var LinearColor BattlePhaseGlowColorParamRed;
var LinearColor BattlePhaseGlowColorParamBlinking;

var name BattleDamageFXSocketName_LegR;
var name BattleDamageFXSocketName_LegL;
var name BattleDamageFXSocketName_ArmR;
var name BattleDamageFXSocketName_ArmL;
var name BattleDamageFXSocketName_Chest;
var name BattleDamageFXSocketName_TorsoR;
var name BattleDamageFXSocketName_TorsoL;
var name BattleDamageFXSocketName_Back;

var ParticleSystemComponent BattleDamagePSC_LegR;
var ParticleSystemComponent BattleDamagePSC_LegL;
var ParticleSystemComponent BattleDamagePSC_ArmR;
var ParticleSystemComponent BattleDamagePSC_ArmL;
var ParticleSystemComponent BattleDamagePSC_Chest;
var ParticleSystemComponent BattleDamagePSC_TorsoR;
var ParticleSystemComponent BattleDamagePSC_TorsoL;
var ParticleSystemComponent BattleDamagePSC_Back;

var ParticleSystem BattleDamageFX_Sparks_Low;
var ParticleSystem BattleDamageFX_Sparks_Mid;
var ParticleSystem BattleDamageFX_Sparks_High;
var ParticleSystem BattleDamageFX_Sparks_Chest_Mid;
var ParticleSystem BattleDamageFX_Sparks_Chest_High;
var ParticleSystem BattleDamageFX_Sparks_Back_Mid;
var ParticleSystem BattleDamageFX_Sparks_Back_High;
var ParticleSystem BattleDamageFX_Blood_Mid;
var ParticleSystem BattleDamageFX_Blood_High;

/** Shield */
var float LastShieldHealthPct;
var ParticleSystem InvulnerableShieldFX;
var ParticleSystemComponent InvulnerableShieldPSC;
var name ShieldSocketName;

var KFSkinTypeEffects ShieldImpactEffects;
var KFGameExplosion ShieldShatterExplosionTemplate;

var const color ShieldColorGreen;
var const color ShieldCoreColorGreen;
var const color ShieldColorYellow;
var const color ShieldCoreColorYellow;
var const color ShieldColorOrange;
var const color ShieldCoreColorOrange;
var const color ShieldColorRed;
var const color ShieldCoreColorRed;

simulated event ReplicatedEvent(name VarName)
{
	if( VarName == nameof(bGunsEquipped) )
	{
		// Replicated for the case when SM_ChangeWeapons is skipped on the client.
		// If the special move is in progress, delay until SpecialMoveEnded
		if ( SpecialMove != SM_ChangeStance )
		{
			SetWeaponStance(bGunsEquipped);
		}
	}
    else
    {
        Super.ReplicatedEvent(VarName);
    }
}

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	// Give Hans his weapon
	AddDefaultInventory();

	// PostBeginPlay is called before we do our first audio update, so we need to set a valid initial position so the ambient sound works right
    AmbientAkComponent.CachedObjectPosition = Location;
	SetPawnAmbientSound( AmbientBreathingEvent );

	// Disable the KFPawn optimization because Hans uses weapon bones to spawn projectiles :(
	// @todo: Do something else to get the bones like ForceUpdateSkel() or SetForceRefPose()
	if ( WorldInfo.NetMode == NM_DedicatedServer )
	{
		Mesh.bPauseAnims = false;
	}

    // Start the dialog timer
    if( WorldInfo.NetMode != NM_Client )
    {
        SetTimer( 2.f, false, nameOf(Timer_TickHansDialog) );
    }
}

/** Cache weapon holster skel controls */
simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	Super.PostInitAnimTree(SkelComp);

	RightHolsterSkelCtrl = SkelControlSingleBone(SkelComp.FindSkelControl('RightWeapon_Hip'));
	LeftHolsterSkelCtrl = SkelControlSingleBone(SkelComp.FindSkelControl('LeftWeapon_Hip'));
}

/** Setup animation and ragdoll here */
simulated function SetCharacterAnimationInfo()
{
	Super.SetCharacterAnimationInfo();

	// Hack so that designers can set Hans' melee and gun animsets from editor archetype
	// Assumes archetype animsets slot 3 is melee and slot 4 is gun
	// Assigns them and then then removes them from pawn animsets
	if (Mesh.AnimSets.Length == 5)
	{
		MeleeAnimSet = Mesh.AnimSets[3];
		GunsAnimSet = Mesh.AnimSets[4];
		Mesh.AnimSets.Remove(3, 2);
	}

	// Initialize weapon type AnimSet
	SetWeaponStance(bGunsEquipped, true);
}

/** Called when hans is switching between melee & ranged */
simulated function SetWeaponStance(bool bInEquipWeapons, optional bool bForce)
{
	local byte WeapAnimSetIdx;
	local bool bUsingGunAnimSet;

	// the weapon anim set appends to the end of the character base set
	WeapAnimSetIdx = CharacterArch.AnimSets.Length;

	// Since bAreGunsEquipped is replicated the client can check AnimSets to find out if bWasAlreadyEquipped
	if ( Mesh.AnimSets.Length > WeapAnimSetIdx && Mesh.AnimSets[WeapAnimSetIdx] == GunsAnimSet )
	{
		bUsingGunAnimSet = true;
	}

	if ( bUsingGunAnimSet != bInEquipWeapons || bForce )
	{
		bGunsEquipped = bInEquipWeapons;

		if ( bGunsEquipped )
		{
			Mesh.AnimSets[WeapAnimSetIdx] = GunsAnimSet;
			// If equipping guns at the same time as UpdateAnimations, then override
			// SkelControl's BlendOutTime so that it matches with animation
			RightHolsterSkelCtrl.SetSkelControlStrength(0.f, 0.f);
			LeftHolsterSkelCtrl.SetSkelControlStrength(0.f, 0.f);

			PlayExtraVFX('GunMode');
		}
		else
		{
			Mesh.AnimSets[WeapAnimSetIdx] = MeleeAnimSet;
			// Use SkelControl's default, editor set, BlendInTime
			RightHolsterSkelCtrl.SetSkelControlActive(true);
			LeftHolsterSkelCtrl.SetSkelControlActive(true);

			StopExtraVFX('GunMode');
		}

		// Apply new anim set and refresh animtree
		Mesh.UpdateAnimations();
	}
}

function SetSprinting( bool bNewSprintStatus )
{
    local bool bWasSprinting;

    bWasSprinting = bIsSprinting;

	super.SetSprinting( bNewSprintStatus );

	if( !bIsSprinting && !bNewSprintStatus && bWasSprinting != bIsSprinting )
	{
        // Make Hans delay for a moment after finishing sprinting
        if( MyHansController != none )
        {
            MyHansController.LastAttackMoveFinishTime = WorldInfo.TimeSeconds;
        }
	}
}


/*********************************************************************************************
* Attack phase related
********************************************************************************************* */

/** Called by PawnAnimInfo when determining whether an attack with bSpecializedMode TRUE can be performed. This makes the
	Hans use attacks from his PawnAnimInfo that are configured as "specialized" only if he's in the right battle phase. */
simulated function bool ShouldPlaySpecialMeleeAnims()
{
	return BattlePhases[CurrentBattlePhase -1].bCanFrenzy;
}

/*********************************************************************************************
* Animation Notifies
**********************************************************************************************/

/** Animation notify for Hans's right-hand grenade throw */
simulated function ANIMNOTIFY_TossGrenade_RightHand()
{
	StartThrowingGrenade( false );
}

/** Animation notify for Hans's left-hand grenade throw */
simulated function ANIMNOTIFY_TossGrenade_LeftHand()
{
	StartThrowingGrenade( true );
}

/** AnimNotify which triggers an explosive AoE blast */
simulated function ANIMNOTIFY_AoEBlast()
{
    local KFExplosionActor ExplosionActor;

    // spawn initial nerve gas burst explosion
    ExplosionActor = Spawn( class'KFExplosionActor', self,, Location, rotator(vect(0,0,1)) );
    if( ExplosionActor != none )
    {
        ExplosionActor.Explode( NerveGasExplosiveBlastTemplate );
    }
}

/** AnimNotify which starts during Hans's AoE melee attack */
simulated function ANIMNOTIFY_AoENerveGas()
{
    local KFExplosion_HansNerveGasGrenade ExplosionActor;

    // spawn nerve gas explosion using nerve gas grenade class defaults
    if( NerveGasGrenadeClass != none )
    {
        ExplosionActor = KFExplosion_HansNerveGasGrenade( Spawn(NerveGasGrenadeClass.default.ExplosionActorClass, self,, mesh.GetBoneLocation('Root'), rotator(vect(0,0,1))) );
        if( ExplosionActor != none )
        {
            ExplosionActor.bDoFullDamage = true;
            ExplosionActor.MaxTime = 4.f;
            ExplosionActor.Interval = 0.5f;
            ExplosionActor.Explode( NerveGasAttackTemplate );
        }
    }
}

/*********************************************************************************************
* Grenade Tossing
**********************************************************************************************/

/** Find a good velocity to throw a grenade at to hit our enemy, and cache it for later use. Returns true if we found a good place */
function bool CacheGrenadeThrowLocation( optional bool bLeftHand )
{
    local vector StartThrowLocation, TargetLocation, UsedEnemyLocation;
	local name HandSocketName;
	local vector TossVelocity, Extent, Offset;
	local bool bFoundVel;
	local float XYExtent, ZExtent;
	local float TossZPct;
	local bool bUsingCachedValues;
	local class<KFProj_Grenade> UsedGrenadeClass;
    local int RandIdx, i;
    local array<TrackedEnemyInfo> TargetCandidates;

    if( !bLeftHand )
    {
        HandSocketName = RightHandSocketName;
    }
    else
    {
        HandSocketName = LeftHandSocketName;
    }

    Mesh.GetSocketWorldLocationAndRotation( HandSocketName, StartThrowLocation );

    // Set a default grenade class in case one hasn't been set yet (like when Hans is calling this function to figure out if he wants to attack)
    if( ActiveGrenadeClass == none )
    {
        UsedGrenadeClass = ExplosiveGrenadeClass;
    }
    else
    {
        UsedGrenadeClass = ExplosiveGrenadeClass;
    }

    // Randomly throw the grenades at other enemies :)
    if( MyHansController != none && MyHansController.RecentlySeenEnemyList.Length > 0 )
    {
    	// Validate targets to throw grenades at
        for( i = MyHansController.RecentlySeenEnemyList.Length-1; i >= 0; i-- )
    	{
            if( MyHansController.RecentlySeenEnemyList[i].TrackedEnemy == none
                || !MyHansController.RecentlySeenEnemyList[i].TrackedEnemy.IsAliveAndWell()
                || !MyHansController.RecentlySeenEnemyList[i].TrackedEnemy.CanAITargetThisPawn(MyHansController) )
            {
                MyHansController.RecentlySeenEnemyList.Remove(i,1);
                continue;
            }
            else if( !NeedToTurnEx(MyHansController.RecentlySeenEnemyList[i].LastVisibleLocation, 0.0) )
            {
                TargetCandidates[TargetCandidates.Length] = MyHansController.RecentlySeenEnemyList[i];
            }
    	}

    	// Clear out this pawn if it was the last one we fired at and it was engaged recently
        for( i = TargetCandidates.Length-1; i >= 0; i-- )
    	{
            if( TargetCandidates.Length > 1 && TargetCandidates[i].TrackedEnemy == MyHansController.LastRecentlySeenEnemyGrenaded
                && (WorldInfo.TimeSeconds - TargetCandidates[i].LastTimeGrenadeAttacked) < 5.0 )
            {
                TargetCandidates.Remove(i,1);
            }
    	}

        // Debug drawing of our view area for selecting grenade targets
    	// Get camera location/rotation
//    	MyHansController.GetPlayerViewPoint( CamLoc, CamRot );
//    	GetAxes( CamRot, X, Y, Z );
//      FlushPersistentDebugLines();
//    	DrawDebugCone(CamLoc,X,500.0, Acos(0.0), Acos(0.0),16,MakeColor(0,255,0,255),true);

        // Get a random visible enemy to pitch a grenade at
        if( TargetCandidates.Length > 0 )
        {
            RandIdx = Rand(TargetCandidates.Length);
            //`log("Selected random grenade target index "$RandIdx$" Pawn: "$TargetCandidates[RandIdx].TrackedEnemy);
            UsedEnemyLocation = TargetCandidates[RandIdx].LastVisibleLocation;
            // Store that we recently planned to pitch a nade at this guy
            MyHansController.LastRecentlySeenEnemyGrenaded = TargetCandidates[RandIdx].TrackedEnemy;
            MyHansController.RecentlySeenEnemyList[RandIdx].LastTimeGrenadeAttacked = WorldInfo.TimeSeconds;
        }
        else
        {
            UsedEnemyLocation = MyKFAIC.Enemy.Location;
        }
    }
    else
    {
        UsedEnemyLocation = MyKFAIC.Enemy.Location;
    }

	/** Lead my target a little */
	Offset = UsedGrenadeClass.static.StaticGetTimeToLocation( UsedEnemyLocation, StartThrowLocation, MyKFAIC ) * MyKFAIC.Enemy.Velocity;

    TargetLocation = UsedEnemyLocation + Offset;
	/** Grenade collision extent */
	XYExtent = UsedGrenadeClass.default.CylinderComponent.CollisionRadius;
	ZExtent = UsedGrenadeClass.default.CylinderComponent.CollisionHeight;

	Extent.X = XYExtent;
	Extent.Y = XYExtent;
	Extent.Z = ZExtent;

    // Try a normal throw
    TossZPct = 0.55;
    bFoundVel = SuggestTossVelocity(TossVelocity, TargetLocation, StartThrowLocation, UsedGrenadeClass.default.Speed,, TossZPct, Extent);

    // Try a high throw
    if( !bFoundVel )
    {
         TossZPct = 0.85;
         bFoundVel = SuggestTossVelocity(TossVelocity, TargetLocation, StartThrowLocation, UsedGrenadeClass.default.Speed,, TossZPct, Extent);
    }

    // Scale resulting toss velocity a little
    // @NOTE: TossVelocity() is pretty shitty. Does not really give accurate velocity predictions. -MattF
    if( Velocity == vect(0,0,0) )
    {
        // Scale velocity down 10% if enemy is standing still
        TossVelocity *= 0.9f;
    }
    TossVelocity.X *= 0.75f;
    TossVelocity.Y *= 0.75f;

    // Add velocity modifier. We're scaling this up because we want the grenade to explode
    // around the time the player runs over it.
    TossVelocity += MyKFAIC.Enemy.Velocity * 1.5f;

    // Subtract our own velocity
    TossVelocity -= Velocity;

    // Used cached grenade throw values if we can't find any good ones
    if( !bFoundVel && (WorldInfo.TimeSeconds - CachedGoodGrenadeToss.TossTime) < 5.0 )
    {
        TossVelocity = CachedGoodGrenadeToss.TossVelocity;
        TargetLocation = CachedGoodGrenadeToss.TossTargetLocation;
        bUsingCachedValues = true;
        //`log("Using Cached values to throw a grenade Timesince: "$`TimeSince(CachedGoodGrenadeToss.TossTime));
    }

	if( bFoundVel || bUsingCachedValues )
	{
        // Only cache the values if this is an actual good real throw
        if( !bUsingCachedValues )
        {
            CachedGoodGrenadeToss.TossVelocity = TossVelocity;
            CachedGoodGrenadeToss.TossFromLocation = StartThrowLocation;
            CachedGoodGrenadeToss.TossTargetLocation = TargetLocation;
            CachedGoodGrenadeToss.TossSpeed = UsedGrenadeClass.default.Speed*1.2f;
            CachedGoodGrenadeToss.TossZPct = TossZPct;
            CachedGoodGrenadeToss.TossTime = WorldInfo.TimeSeconds;
        }

		return true;
	}

	return false;
}

/** Start the process for throwing a grenade from the appropriate mesh socket */
function StartThrowingGrenade( optional bool bLeftHand )
{
	if( Health > 0 && IsThrowingGrenade() )
	{
		if( CacheGrenadeThrowLocation( bLeftHand ) )
		{
            ThrowGrenade();
		}
	}
}

/** Spawns a grenade projectile at the cached throw speed and location */
simulated function bool ThrowGrenade()
{
	local rotator DirToEnemy;
	local KFProj_Grenade MyGrenade;
	local float TossSpeed;

	MyGrenade = Spawn( ActiveGrenadeClass, self,, CachedGoodGrenadeToss.TossFromLocation );

	if( MyGrenade == none )
	{
        return false;
	}

	/** Found a trajectory that's good enough, so let the grenade fly */
	MyGrenade.Instigator			= self;
	MyGrenade.InstigatorController	= Controller;

	TossSpeed = VSize(CachedGoodGrenadeToss.TossVelocity);
	DirToEnemy = Rotator(normal(CachedGoodGrenadeToss.TossVelocity));
	DirToEnemy = AddGrenadeSpread(DirToEnemy);
	MyGrenade.Init( vector(DirToEnemy) );

	if( bDoingBarrage && BarrageTossCount == 0 && ActiveGrenadeClass == SmokeGrenadeClass )
	{
        // Hans is doing a smoke grenade barrage, throw one grenade straight down to obscure Hans
        MyGrenade.Velocity = vect(0,0,-1) * TossSpeed;
    }
    else
    {
        // Throw the grenade at the enemy
        MyGrenade.Velocity = vector(DirToEnemy) * TossSpeed;
    }

    // Store the last time we threw each type of grenade or barrage
    if( bDoingBarrage )
    {
        if( ActiveGrenadeClass == ExplosiveGrenadeClass )
        {
            LastHENadeBarrageTime = WorldInfo.TimeSeconds;
            LastOffensiveNadeTime = WorldInfo.TimeSeconds;
        }
        else if( ActiveGrenadeClass == NerveGasGrenadeClass )
        {
            LastNerveGasBarrageTime = WorldInfo.TimeSeconds;
            LastOffensiveNadeTime = WorldInfo.TimeSeconds;
        }
        else if( ActiveGrenadeClass == SmokeGrenadeClass )
        {
            // For now count a smoke grenade barrage as a smoke toss, so we don't immeditately toss a couple of smoke right after a barrage
            LastSmokeTossTime = WorldInfo.TimeSeconds;
        }
    }
    else
    {
        if( ActiveGrenadeClass == ExplosiveGrenadeClass )
        {
            LastHENadeTossTime = WorldInfo.TimeSeconds;
            LastOffensiveNadeTime = WorldInfo.TimeSeconds;
        }
        else if( ActiveGrenadeClass == NerveGasGrenadeClass )
        {
            LastNerveGasTossTime = WorldInfo.TimeSeconds;
            LastOffensiveNadeTime = WorldInfo.TimeSeconds;
        }
        else if( ActiveGrenadeClass == SmokeGrenadeClass )
        {
            LastSmokeTossTime = WorldInfo.TimeSeconds;
        }
    }

	BarrageTossCount++;

	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlaySpotGrenadeDialog( self );

	return true;
}

/**
 * Adds any fire spread offset to the passed in rotator
 * @param Aim the base aim direction
 * @return the adjusted aim direction
 */
simulated function rotator AddGrenadeSpread(rotator BaseAim)
{
	local vector X, Y, Z;
	local float RandY, RandZ;

	// Add in any spread.
	GetAxes(BaseAim, X, Y, Z);
	RandY = FRand() - 0.5;
	RandZ = Sqrt(0.5 - Square(RandY)) * (FRand() - 0.5);
	return rotator(X + RandY * GrenadeTossSpread.Y * Y + RandZ * GrenadeTossSpread.Z * Z);
}

/** Return true if busy throwing grenade(s) or using AICommand_ThrowGrenade */
function bool IsThrowingGrenade()
{
	if( Health <= 0 || MyKFAIC == none )
	{
		return false;
	}
	return IsDoingSpecialMove(SM_Hans_ThrowGrenade)
            || IsDoingSpecialMove(SM_Hans_GrenadeBarrage)
            || IsDoingSpecialMove(SM_Hans_GrenadeHalfBarrage)
		    || AICommand_ThrowGrenade(MyKFAIC.GetActiveCommand()) != none;
}


function DrawDebugOverheadText( KFHUDBase HUD, Out Vector2d ScreenPos )
{
	local Canvas			Canvas;
	local Vector			ScreenLoc;
	local bool				bShowAllCategories;

    Super.DrawDebugOverheadText( HUD, ScreenPos );

	if( !IsAliveAndWell() )
	{
		return;
	}

	Canvas = HUD.Canvas;
	ScreenLoc = Canvas.Project( Location + vect(0,0,1) * GetCollisionHeight() * 1.5f );
	if( ScreenLoc.X < 0 || ScreenLoc.X >= HUD.Canvas.ClipX || ScreenLoc.Y < 0 && ScreenLoc.Y >= HUD.Canvas.ClipY )
	{
		return;
	}

	if( HUD.ShouldDisplayDebug('All') )
	{
		bShowAllCategories = true;
	}

	if( MyHansController != none && (bShowAllCategories || HUD.ShouldDisplayDebug('RangedCombat')) )
	{
		MyHansController.DrawRangedAttackInfo( HUD );
	}
}

/*********************************************************************************************
* Dialog / Audio
**********************************************************************************************/
/** Returns (hardcoded) dialog event ID for when players kills this zed type */
function int GetKillerDialogID()
{
	return 67;//KILL_Boss
}

/** Returns (hardcoded) dialog event ID for when players spots this zed type */
function int GetSpotterDialogID()
{
	return 127;//SPOTZ_BossGeneric
}

/** Returns (hardcoded) dialog event ID for when trader gives advice to player who was killed by this zed type */
static function int GetTraderAdviceID()
{
	return 47;//TRAD_AdviceHans
}

/** Players dialog such as taunts at regular intervals */
function Timer_TickHansDialog()
{
    if( !IsAliveAndWell() )
    {
        return;
    }

    if( !IsDoingSpecialMove() )
    {
        if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayHansTickDialog( self );
    }

    SetTimer( TickDialogInterval, false, nameOf(Timer_TickHansDialog) );
}

/** Play music for this boss (overridden for each boss) */
function PlayBossMusic()
{
	if( KFGameInfo(WorldInfo.Game) != none )
	{
		KFGameInfo(WorldInfo.Game).ForceHansMusicTrack();
	}
}

/*********************************************************************************************
* Damage
**********************************************************************************************/
event TakeDamage(int Damage, Controller InstigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local float OldHealthPct;

	OldHealthPct = GetHealthPercentage();

	super.TakeDamage( Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser );

	// change ambient breathing event to "low health"
	if( OldHealthPct > 0.25f && GetHealthPercentage() <= 0.25f )
	{
		SetPawnAmbientSound( LowHealthAmbientBreathingEvent );
	}
}


event bool HealDamage(int Amount, Controller Healer, class<DamageType> DamageType, optional bool bCanRepairArmor=true, optional bool bMessageHealer=true)



{
	local bool retval;
	local float OldHealthPct;

	OldHealthPct = GetHealthPercentage();

	retval = super.HealDamage( Amount, Healer, DamageType );

	// change ambient breathing back to normal
	if( OldHealthPct <= 0.25f && GetHealthPercentage() > 0.25f )
	{
		SetPawnAmbientSound( AmbientBreathingEvent );
	}

	return retval;
}

/** Overridden so Hans doesn't get his head damaged while he is alive */
function TakeHitZoneDamage(float Damage, class<DamageType> DamageType, int HitZoneIdx, vector InstigatorLocation)
{
	// Only damage head if Hans is dead
    if( HitZoneIdx != HZI_HEAD || Health <= 0 )
	{
	   Super.TakeHitZoneDamage(Damage, DamageType, HitZoneIdx, InstigatorLocation);
	}
}

/** Overridden so that Hans head doesn't take gore damage while he's alive */
function bool CanInjureHitZone(class<DamageType> DamageType, int HitZoneIdx)
{
	local class<KFDamageType> KFDmgType;
	local name HitZoneName;

    if ( bPlayedDeath )
	{
		KFDmgType = class<KFDamageType>(DamageType);
		HitZoneName = HitZones[HitZoneIdx].ZoneName;
		if ( KFDmgType != none && KFDmgType.static.CanDismemberHitZone( HitZoneName ) )
		{
			return true;
		}
	}

	return false;
}

function class<KFDamageType> GetBumpAttackDamageType()
{
	return HeavyBumpDamageType;
}

/** Turns hunt and heal FX on or off */
simulated function SetHuntAndHealMode( bool bOn )
{
    super.SetHuntAndHealMode( bOn );

    if( WorldInfo.NetMode == NM_DedicatedServer )
    {
        return;
    }

    if( bOn )
    {
        PlayHuntAndHealModeFX();
    }
    else
    {
        StopHuntAndHealModeFX();
    }
}

/** Turns hunt and heal backpack vent smoke on */
simulated function PlayHuntAndHealModeFX()
{
    BackPackSmokePSC = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BackPackSmokeEffectTemplate, Mesh, BattleDamageFXSocketName_Back, true);

    InvulnerableShieldPSC = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(InvulnerableShieldFX, Mesh, ShieldSocketName, true);
    InvulnerableShieldPSC.SetAbsolute(false, true, true);
    if( ShieldHealthPctByte > 0 )
    {
        UpdateShieldColor();
    }
}

/** Updates the color of the shield based on its health */
simulated function UpdateShieldColor()
{
    local float ShieldHealthPct;

    // Not on dedicated servers
    if( WorldInfo.NetMode == NM_DedicatedServer )
    {
        return;
    }

    ShieldHealthPct = ByteToFloat( ShieldHealthPctByte );

    // Break the shield if it has no health left
    if( ShieldHealthPct == 0.f
        && InvulnerableShieldPSC != none
        && InvulnerableShieldPSC.bIsActive
        && InvulnerableShieldPSC.bAttached )
    {
        BreakShield();
    }
    else if( InvulnerableShieldPSC != none )
    {
        if( ShieldHealthPct >= 0.75f ) // Green
        {
            if( LastShieldHealthPct < 0.75f )
            {
                InvulnerableShieldPSC.SetVectorParameter( 'Shield_Color', MakeVectorFromColor(ShieldColorGreen) );
                InvulnerableShieldPSC.SetVectorParameter( 'Shield_CoreColor', MakeVectorFromColor(ShieldCoreColorGreen) );
            }
        }
        else if( ShieldHealthPct >= 0.5f ) // Yellow
        {
            if( LastShieldHealthPct >= 0.75f || LastShieldHealthPct < 0.5f )
            {
                InvulnerableShieldPSC.SetVectorParameter( 'Shield_Color', MakeVectorFromColor(ShieldColorYellow) );
                InvulnerableShieldPSC.SetVectorParameter( 'Shield_CoreColor', MakeVectorFromColor(ShieldCoreColorYellow) );
            }
        }
        else if( ShieldHealthPct >= 0.25f ) // Orange
        {
            if( LastShieldHealthPct >= 0.5f || LastShieldHealthPct < 0.25f )
            {
                InvulnerableShieldPSC.SetVectorParameter( 'Shield_Color', MakeVectorFromColor(ShieldColorOrange) );
                InvulnerableShieldPSC.SetVectorParameter( 'Shield_CoreColor', MakeVectorFromColor(ShieldCoreColorOrange) );
            }
        }
        else if( LastShieldHealthPct >= 0.25f ) // Red
        {
            InvulnerableShieldPSC.SetVectorParameter( 'Shield_Color', MakeVectorFromColor(ShieldColorRed) );
            InvulnerableShieldPSC.SetVectorParameter( 'Shield_CoreColor', MakeVectorFromColor(ShieldCoreColorRed) );
        }

        // Scale the invulnerable material param
        CharacterMICs[0].SetScalarParameterValue( 'Scalar_DamageResist', ShieldHealthPct );

        // Cache off so we know whether the material params need to change
        LastShieldHealthPct = ShieldHealthPct;

        UpdateShieldUIOnLocalController(LastShieldHealthPct);
    }
}

simulated function UpdateShieldUIOnLocalController(float ShieldPercent)
{
    if(!KFPC.IsLocalController())
    {
        return;
    }

    if(KFPC != none && KFPC.MyGFxHUD != none && KFPC.MyGFxHUD.bossHealthBar != none)
    {
        KFPC.MyGFxHUD.bossHealthBar.UpdateBossShield(ShieldPercent);
    }
}


/** Creates a vector parameter from a standard color */
simulated function vector MakeVectorFromColor( color InColor )
{
    local LinearColor LinColor;
    local vector ColorVec;

    LinColor = ColorToLinearColor( InColor );
    ColorVec.X = LinColor.R;
    ColorVec.Y = LinColor.G;
    ColorVec.Z = LinColor.B;

    return ColorVec;
}

/** Breaks the shield */
simulated function BreakShield()
{
    local KFExplosionActor ExplosionActor;

    if( WorldInfo.NetMode != NM_DedicatedServer )
    {
        // Detach shield and zero out material params
        DetachShieldFX();
        CharacterMICs[0].SetScalarParameterValue( 'Scalar_DamageResist', 0.0 );

        // Spawn a shatter explosion
        ExplosionActor = Spawn( class'KFExplosionActor', self,, Location, rotator(vect(0,0,1)) );
        if( ExplosionActor != None )
        {
            ExplosionActor.Explode( ShieldShatterExplosionTemplate );
        }
    }

    super.BreakShield();
}

/** Turns hunt and heal backpack vent smoke off */
simulated function StopHuntAndHealModeFX()
{
	DetachEmitter( BackPackSmokePSC );
    DetachShieldFX();

	CharacterMICs[0].SetScalarParameterValue( 'Scalar_DamageResist', 0.0 );
}

simulated function DetachShieldFX()
{
    LastShieldHealthPct = 0.f;
    DetachEmitter( InvulnerableShieldPSC );
    UpdateShieldUIOnLocalController(LastShieldHealthPct);
}

/** Turns hunt and heal backpack vent smoke off on termination */
simulated function TerminateEffectsOnDeath()
{
    SetHuntAndHealMode( false );

    super.TerminateEffectsOnDeath();
}

/** Overloaded to call OnBattlePhaseChanged */
function IncrementBattlePhase()
{
	super.IncrementBattlePhase();

	OnBattlePhaseChanged();
}

/** Updates battle damage cosmetics */
simulated function OnBattlePhaseChanged()
{
    if( WorldInfo.NetMode == NM_DedicatedServer )
    {
        return;
    }
    super.OnBattlePhaseChanged();

    UpdateBattlePhaseLights();
    UpdateBattlePhaseMaterials();
    UpdateBattlePhaseParticles();
}

/** Updates dynamic lights based on battle phase */
simulated function UpdateBattlePhaseLights()
{
    local PointLightComponent LightTemplate;

    if( BattlePhaseLightFront != none )
    {
        BattlePhaseLightFront.DetachFromAny();
        BattlePhaseLightFront = none;
    }

    if( BattlePhaseLightBack != none )
    {
        BattlePhaseLightBack.DetachFromAny();
        BattlePhaseLightBack = none;
    }

    switch( CurrentBattlePhase )
    {
    case 1:
        LightTemplate = BattlePhaseLightTemplateGreen;
        break;

    case 2:
        LightTemplate = BattlePhaseLightTemplateYellow;
        break;

    case 3:
        LightTemplate = BattlePhaseLightTemplateRed;
        break;

    case 4:
		// don't activate lights after death
    	if( IsAliveAndWell() )
    	{
        	LightTemplate = BattlePhaseLightTemplateBlinking;
        }
        break;
    };

    if( LightTemplate != none )
    {
	    BattlePhaseLightFront = new(self) Class'PointLightComponent' (LightTemplate);
	    BattlePhaseLightBack = new(self) Class'PointLightComponent' (LightTemplate);
	}

    if( BattlePhaseLightFront != none )
    {
        Mesh.AttachComponentToSocket(BattlePhaseLightFront, BattlePhaseLightFrontSocketName);
        BattlePhaseLightFront.SetEnabled( true );
    }

    if( BattlePhaseLightBack != none )
    {
        Mesh.AttachComponentToSocket(BattlePhaseLightBack, BattlePhaseLightBackSocketName);
        BattlePhaseLightBack.SetEnabled( true );
    }
}

/** Updates battle damage on material instance based on battle phase */
simulated function UpdateBattlePhaseMaterials()
{
	local MaterialInstanceConstant MIC;

	MIC = CharacterMICs[0];

    switch( CurrentBattlePhase )
    {
    case 1:
        MIC.SetScalarParameterValue( 'Scalar_BattleGrime', 0.0 );
        MIC.SetScalarParameterValue( 'Scalar_Damage_Blood_Contrast', 1.0 );
        MIC.SetScalarParameterValue( 'Scalar_GlowFlashing', 0.0 );
        MIC.SetVectorParameterValue( 'Vector_GlowColor', BattlePhaseGlowColorParamGreen );
        break;

    case 2:
        MIC.SetScalarParameterValue( 'Scalar_BattleGrime', 0.25 );
        MIC.SetScalarParameterValue( 'Scalar_Damage_Blood_Contrast', 1.48 );
        MIC.SetScalarParameterValue( 'Scalar_GlowFlashing', 0.0 );
        MIC.SetVectorParameterValue( 'Vector_GlowColor', BattlePhaseGlowColorParamYellow );
        break;

    case 3:
        MIC.SetScalarParameterValue( 'Scalar_BattleGrime', 0.25 );
        MIC.SetScalarParameterValue( 'Scalar_Damage_Blood_Contrast', 1.49 );
        MIC.SetScalarParameterValue( 'Scalar_GlowFlashing', 0.0 );
        MIC.SetVectorParameterValue( 'Vector_GlowColor', BattlePhaseGlowColorParamRed );
        break;

    case 4:
        MIC.SetScalarParameterValue( 'Scalar_BattleGrime', 0.5 );
        MIC.SetScalarParameterValue( 'Scalar_Damage_Blood_Contrast', 1.6 );
		// don't activate blinking after death
        MIC.SetScalarParameterValue( 'Scalar_GlowFlashing', IsAliveAndWell() ? 1.0 : 0.0 );
        MIC.SetVectorParameterValue( 'Vector_GlowColor', BattlePhaseGlowColorParamBlinking );
        break;
    };
}

/** Updates battle damage emitters based on battle phase */
simulated function UpdateBattlePhaseParticles()
{
	switch( CurrentBattlePhase )
	{
	case 1:
		// no emitters
		break;

	case 2:
		DetachEmitter( BattleDamagePSC_LegR );
		DetachEmitter( BattleDamagePSC_ArmL );
		DetachEmitter( BattleDamagePSC_Chest );

		BattleDamagePSC_LegR = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Sparks_Low, Mesh, BattleDamageFXSocketName_LegR, true);
		BattleDamagePSC_ArmL = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Sparks_Low, Mesh, BattleDamageFXSocketName_ArmL, true);
		BattleDamagePSC_Chest = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Sparks_Low, Mesh, BattleDamageFXSocketName_Chest, true);
		break;

	case 3:
		DetachEmitter( BattleDamagePSC_LegR );
		DetachEmitter( BattleDamagePSC_LegL );
		DetachEmitter( BattleDamagePSC_ArmR );
		DetachEmitter( BattleDamagePSC_ArmL );
		DetachEmitter( BattleDamagePSC_Chest );
		DetachEmitter( BattleDamagePSC_TorsoR );
		DetachEmitter( BattleDamagePSC_TorsoL );
		DetachEmitter( BattleDamagePSC_Back );

		BattleDamagePSC_LegR = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Sparks_Mid, Mesh, BattleDamageFXSocketName_LegR, true);
		BattleDamagePSC_LegL = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Sparks_Low, Mesh, BattleDamageFXSocketName_LegL, true);
		BattleDamagePSC_ArmR = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Sparks_Low, Mesh, BattleDamageFXSocketName_ArmR, true);
		BattleDamagePSC_ArmL = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Sparks_Mid, Mesh, BattleDamageFXSocketName_ArmL, true);
		BattleDamagePSC_Chest = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Sparks_Chest_Mid, Mesh, BattleDamageFXSocketName_Chest, true);
		BattleDamagePSC_TorsoR = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Blood_Mid, Mesh, BattleDamageFXSocketName_TorsoR, true);
		BattleDamagePSC_TorsoL = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Blood_Mid, Mesh, BattleDamageFXSocketName_TorsoL, true);
		BattleDamagePSC_Back = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Sparks_Back_Mid, Mesh, BattleDamageFXSocketName_Back, true);
		break;

	case 4:
		DetachEmitter( BattleDamagePSC_LegR );
		DetachEmitter( BattleDamagePSC_LegL );
		DetachEmitter( BattleDamagePSC_ArmR );
		DetachEmitter( BattleDamagePSC_ArmL );
		DetachEmitter( BattleDamagePSC_Chest );
		DetachEmitter( BattleDamagePSC_TorsoR );
		DetachEmitter( BattleDamagePSC_TorsoL );
		DetachEmitter( BattleDamagePSC_Back );

		// don't spawn emitters after death
		if( IsAliveAndWell() )
		{
			BattleDamagePSC_LegR = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Sparks_High, Mesh, BattleDamageFXSocketName_LegR, true);
			BattleDamagePSC_LegL = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Sparks_High, Mesh, BattleDamageFXSocketName_LegL, true);
			BattleDamagePSC_ArmR = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Sparks_High, Mesh, BattleDamageFXSocketName_ArmR, true);
			BattleDamagePSC_ArmL = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Sparks_High, Mesh, BattleDamageFXSocketName_ArmL, true);
			BattleDamagePSC_Chest = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Sparks_Chest_High, Mesh, BattleDamageFXSocketName_Chest, true);
			BattleDamagePSC_TorsoR = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Blood_High, Mesh, BattleDamageFXSocketName_TorsoR, true);
			BattleDamagePSC_TorsoL = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Blood_High, Mesh, BattleDamageFXSocketName_TorsoL, true);
			BattleDamagePSC_Back = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BattleDamageFX_Sparks_Back_High, Mesh, BattleDamageFXSocketName_Back, true);
		}
		break;
	};
}

/** Gets skin effects associated with hit zone (allows pawns to override) */
simulated function KFSkinTypeEffects GetHitZoneSkinTypeEffects( int HitZoneIdx )
{
    if( bInHuntAndHealMode && ShieldHealthPctByte > 0 )
    {
        return ShieldImpactEffects;
    }
    else
    {
        return super.GetHitZoneSkinTypeEffects( HitZoneIdx );
    }
}

defaultproperties
{
   MeleeAnimSet=AnimSet'ZED_Hans_ANIM.Hans_Melee_Master'
   GunsAnimSet=AnimSet'ZED_Hans_ANIM.Hans_Gun_Master'
   NerveGasExplosiveBlastTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedHans:ExploTemplate0'
   NerveGasAttackTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedHans:ExploTemplate1'
   HeavyBumpDamageType=Class'kfgamecontent.KFDT_HeavyZedBump'
   AmbientBreathingEvent=AkEvent'WW_VOX_NPC_HansVolter.Play_HANS_Breathing_Base'
   LowHealthAmbientBreathingEvent=AkEvent'WW_VOX_NPC_HansVolter.Play_HANS_BreathHurt_Base'
   TickDialogInterval=0.500000
   BackPackSmokeEffectTemplate=ParticleSystem'ZED_Hans_EMIT.FX_Life_Drain_Smoke_01'
   BattlePhaseLightFrontSocketName="Light_Front"
   BattlePhaseLightBackSocketName="Light_Back"
   BattlePhaseGlowColorParamGreen=(R=0.100000,G=1.000000,B=0.000000,A=1.000000)
   BattlePhaseGlowColorParamYellow=(R=1.000000,G=0.500000,B=0.000000,A=1.000000)
   BattlePhaseGlowColorParamRed=(R=1.000000,G=0.100000,B=0.000000,A=1.000000)
   BattlePhaseGlowColorParamBlinking=(R=2.000000,G=0.000000,B=0.000000,A=1.000000)
   BattleDamageFXSocketName_LegR="LegVent_R"
   BattleDamageFXSocketName_LegL="LegVent_L"
   BattleDamageFXSocketName_ArmR="ArmVent_R"
   BattleDamageFXSocketName_ArmL="ArmVent_L"
   BattleDamageFXSocketName_Chest="Chest_FX"
   BattleDamageFXSocketName_TorsoR="Implant_FX_R"
   BattleDamageFXSocketName_TorsoL="Implant_FX_L"
   BattleDamageFXSocketName_Back="BackPackVent"
   BattleDamageFX_Sparks_Low=ParticleSystem'ZED_Hans_EMIT.FX_Hans_Sparks_LowD_01'
   BattleDamageFX_Sparks_Mid=ParticleSystem'ZED_Hans_EMIT.FX_Hans_Sparks_MidD_01'
   BattleDamageFX_Sparks_High=ParticleSystem'ZED_Hans_EMIT.FX_Hans_Sparks_HighD_01'
   BattleDamageFX_Sparks_Chest_Mid=ParticleSystem'ZED_Hans_EMIT.FX_Chest_electricity_HighD_01'
   BattleDamageFX_Sparks_Chest_High=ParticleSystem'ZED_Hans_EMIT.FX_Hans_Paralyze_01'
   BattleDamageFX_Sparks_Back_Mid=ParticleSystem'ZED_Hans_EMIT.FX_Back_sparks_MidD_01'
   BattleDamageFX_Sparks_Back_High=ParticleSystem'ZED_Hans_EMIT.FX_Back_sparks_HighD_01'
   BattleDamageFX_Blood_Mid=ParticleSystem'ZED_Hans_EMIT.FX_Hans_Blood_Spray_02'
   BattleDamageFX_Blood_High=ParticleSystem'ZED_Hans_EMIT.FX_Hans_Blood_Spray_01'
   InvulnerableShieldFX=ParticleSystem'ZED_Hans_EMIT.FX_Hans_Hunt_Shield'
   ShieldSocketName="hips"
   ShieldImpactEffects=KFSkinTypeEffects_InvulnerabilityShield'kfgamecontent.Default__KFPawn_ZedHans:ShieldEffects'
   ShieldShatterExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedHans:ShatterExploTemplate0'
   ShieldColorGreen=(B=50,G=255,R=50,A=0)
   ShieldCoreColorGreen=(B=0,G=255,R=0,A=0)
   ShieldColorYellow=(B=20,G=255,R=255,A=0)
   ShieldCoreColorYellow=(B=0,G=255,R=255,A=0)
   ShieldColorOrange=(B=10,G=110,R=255,A=0)
   ShieldCoreColorOrange=(B=0,G=105,R=255,A=0)
   ShieldColorRed=(B=20,G=20,R=255,A=0)
   ShieldCoreColorRed=(B=10,G=10,R=255,A=0)
   BattlePhases(0)=(bSprintingBehavior=False,GlobalOffensiveNadePhaseCooldown=25.000000,bCanTossNerveGas=True,bCanUseGuns=True,GunAttackPhaseCooldown=0.000000,GunAttackLengthPhase=99999.000000,bCanMoveWhileThrowingGrenades=(False,False,False,False),HealThresholds=(0.600000,0.600000,0.600000,0.600000),HealAmounts=(0.325000,0.325000,0.325000,0.325000),MaxShieldHealth=(686,980,1400,1820))
   BattlePhases(1)=(GlobalOffensiveNadePhaseCooldown=25.000000,bCanTossNerveGas=True,NerveGasTossPhaseCooldown=20.000000,bCanUseGuns=True,GunAttackLengthPhase=10.000000,bCanTossGrenade=True,HENadeTossPhaseCooldown=20.000000,bCanMoveWhileThrowingGrenades=(False,False,False,True),HealThresholds=(0.410000,0.410000,0.410000,0.410000),HealAmounts=(0.275000,0.275000,0.275000,0.275000),MaxShieldHealth=(860,1225,1750,2275))
   BattlePhases(2)=(bCanFrenzy=True,GlobalOffensiveNadePhaseCooldown=20.000000,bCanBarrageNerveGas=True,bCanUseGuns=True,GunAttackLengthPhase=5.000000,bCanTossGrenade=True,bCanMoveWhileThrowingGrenades=(False,False,True,True),HealThresholds=(0.250000,0.250000,0.250000,0.250000),HealAmounts=(0.125000,0.125000,0.125000,0.125000),MaxShieldHealth=(1030,1470,2100,2730))
   BattlePhases(3)=(bCanFrenzy=True,GlobalOffensiveNadePhaseCooldown=10.000000,bCanUseGuns=True,GunAttackPhaseCooldown=30.000000,GunAttackLengthPhase=4.000000,bCanBarrageGrenades=True,bCanMoveWhileThrowingGrenades=(False,False,True,True))
   ExplosiveGrenadeClass=Class'kfgamecontent.KFProj_HansHEGrenade'
   SeasonalExplosiveGrenadeClasses(0)=Class'kfgamecontent.KFProj_HansHEGrenade'
   SeasonalExplosiveGrenadeClasses(1)=Class'kfgamecontent.KFProj_HansHEGrenade'
   SeasonalExplosiveGrenadeClasses(2)=Class'kfgamecontent.KFProj_HansHEGrenade'
   SeasonalExplosiveGrenadeClasses(3)=Class'kfgamecontent.KFProj_HansHEGrenade_Halloween'
   SeasonalExplosiveGrenadeClasses(4)=Class'kfgamecontent.KFProj_HansHEGrenade'
   NerveGasGrenadeClass=Class'kfgamecontent.KFProj_HansNerveGasGrenade'
   SeasonalNerveGasGrenadeClasses(0)=Class'kfgamecontent.KFProj_HansNerveGasGrenade'
   SeasonalNerveGasGrenadeClasses(1)=Class'kfgamecontent.KFProj_HansNerveGasGrenade'
   SeasonalNerveGasGrenadeClasses(2)=Class'kfgamecontent.KFProj_HansNerveGasGrenade'
   SeasonalNerveGasGrenadeClasses(3)=Class'kfgamecontent.KFProj_HansNerveGasGrenade_Halloween'
   SeasonalNerveGasGrenadeClasses(4)=Class'kfgamecontent.KFProj_HansNerveGasGrenade'
   SmokeGrenadeClass=Class'kfgamecontent.KFProj_HansSmokeGrenade'
   SeasonalSmokeGrenadeClasses(0)=Class'kfgamecontent.KFProj_HansSmokeGrenade'
   SeasonalSmokeGrenadeClasses(1)=Class'kfgamecontent.KFProj_HansSmokeGrenade'
   SeasonalSmokeGrenadeClasses(2)=Class'kfgamecontent.KFProj_HansSmokeGrenade'
   SeasonalSmokeGrenadeClasses(3)=Class'kfgamecontent.KFProj_HansSmokeGrenade_Halloween'
   SeasonalSmokeGrenadeClasses(4)=Class'kfgamecontent.KFProj_HansSmokeGrenade'
   RightHandSocketName="RightHandSocket"
   LeftHandSocketName="LeftHandSocket"
   GrenadeTossSpread=(X=0.000000,Y=0.200000,Z=0.040000)
   SmokeTossCooldown=5.000000
   SummonWaves(0)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Hans_Minions_Normal_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Hans_Minions_Normal_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Hans_Minions_Normal_Three')
   SummonWaves(1)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Hans_Minions_Hard_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Hans_Minions_Hard_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Hans_Minions_Hard_Three')
   SummonWaves(2)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Hans_Minions_Suicidal_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Hans_Minions_Suicidal_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Hans_Minions_Suicidal_Three')
   SummonWaves(3)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Hans_Minions_HOE_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Hans_Minions_HOE_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Special.Hans_Minions_HOE_Three')
   NumMinionsToSpawn=(X=1.000000,Y=18.000000)
   CurrentBattlePhase=1
   BossCaptionStrings(0)="When seriously injured Hans puts a shield up while he seeks a victim to drain health from. If you destroy this shield he cannot heal!"
   BossCaptionStrings(1)="Watch his power core: Hans is more aggressive as it changes color."
   BossCaptionStrings(2)="Aim for his emissive power core. It is a vulnerable zone."
   BossCaptionStrings(3)="Gas from Hans' grenades clings to you, like Bloat bile. Try to avoid it!"
   BossCaptionStrings(4)="His slashing attacks are too strong to parry. You'll still take full damage."
   BossCaptionStrings(5)="Watch for red grenade warning indicators, which may help you spot where they land."
   BossCaptionStrings(6)="When Hans pulls out his guns, stay out of the line of sight. Obvious, but important!"
   bLargeZed=True
   bCanGrabAttack=True
   MonsterArchPath="ZED_ARCH.ZED_Hans_Archetype"
   HeadlessBleedOutTime=6.000000
   ParryResistance=4
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_ZedHansBase:MeleeHelper_0'
      BaseDamage=70.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_Hans'
      MomentumTransfer=40000.000000
      MaxHitRange=275.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFPawn_ZedHansBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedHans:MeleeHelper_0'
   DoshValue=500
   XPValues(0)=1291.000000
   XPValues(1)=1694.000000
   XPValues(2)=1790.000000
   XPValues(3)=1843.000000
   WeakSpotSocketNames(1)="Chest_FX"
   WeakSpotSocketNames(2)="WeakPointSocket1"
   DamageTypeModifiers(0)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(0.800000))
   DamageTypeModifiers(1)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle',DamageScale=(0.800000))
   DamageTypeModifiers(2)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun',DamageScale=(0.800000))
   DamageTypeModifiers(3)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun',DamageScale=(0.800000))
   DamageTypeModifiers(4)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle',DamageScale=(0.900000))
   DamageTypeModifiers(5)=(DamageType=Class'KFGame.KFDT_Slashing')
   DamageTypeModifiers(6)=(DamageType=Class'KFGame.KFDT_Bludgeon')
   DamageTypeModifiers(7)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(1.100000))
   DamageTypeModifiers(8)=(DamageType=Class'KFGame.KFDT_Microwave')
   DamageTypeModifiers(9)=(DamageType=Class'KFGame.KFDT_Explosive')
   DamageTypeModifiers(10)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=(0.800000))
   DamageTypeModifiers(11)=(DamageType=Class'KFGame.KFDT_Toxic',DamageScale=(0.100000))
   DamageTypeModifiers(12)=(DamageType=Class'kfgamecontent.KFDT_Explosive_RPG7',DamageScale=(1.200000))
   DamageTypeModifiers(13)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_RailGun',DamageScale=(0.900000))
   DamageTypeModifiers(14)=(DamageType=Class'KFGame.KFDT_Toxic_HRGHealthrower',DamageScale=(0.900000))
   DifficultySettings=Class'kfgamecontent.KFDifficulty_Hans'
   BumpDamageType=Class'KFGame.KFDT_NPCBump_Large'
   Begin Object Class=AkComponent Name=SprintAkComponent0 Archetype=AkComponent'KFGame.Default__KFPawn_ZedHansBase:SprintAkComponent0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="SprintAkComponent0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_ZedHansBase:SprintAkComponent0'
   End Object
   SprintAkComponent=SprintAkComponent0
   Begin Object Class=AkComponent Name=HeadshotAkComponent0 Archetype=AkComponent'KFGame.Default__KFPawn_ZedHansBase:HeadshotAkComponent0'
      Name="HeadshotAkComponent0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_ZedHansBase:HeadshotAkComponent0'
   End Object
   HeadShotAkComponent=HeadshotAkComponent0
   OnDeathAchievementID=133
   PawnAnimInfo=KFPawnAnimInfo'ZED_Hans_ANIM.Hans_AnimGroup'
   LocalizationKey="KFPawn_ZedHans"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_ZedHansBase:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_ZedHansBase:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bEnableAimOffset=True
   HitZones(0)=(GoreHealth=2147483647,DmgScale=1.200000)
   HitZones(1)=()
   HitZones(2)=()
   HitZones(3)=(DmgScale=1.050000,SkinID=2)
   HitZones(4)=(SkinID=3)
   HitZones(5)=(GoreHealth=20,DmgScale=0.200000,SkinID=3)
   HitZones(6)=(DmgScale=0.200000,SkinID=3)
   HitZones(7)=(SkinID=3)
   HitZones(8)=(GoreHealth=20,DmgScale=0.200000,SkinID=3)
   HitZones(9)=(BoneName="LeftForearm",DmgScale=0.200000,Limb=BP_LeftArm,SkinID=3)
   HitZones(10)=()
   HitZones(11)=()
   HitZones(12)=(SkinID=3)
   HitZones(13)=(SkinID=3)
   HitZones(14)=()
   HitZones(15)=(SkinID=3)
   HitZones(16)=(SkinID=3)
   HitZones(17)=()
   HitZones(18)=(ZoneName="Armor",BoneName="Spine2",GoreHealth=2147483647,DmgScale=0.800000,Limb=BP_Special,SkinID=3)
   PenetrationResistance=4.000000
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'KFGame.Default__KFPawn_ZedHansBase:Afflictions_0'
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'KFGame.Default__KFPawn_ZedHansBase:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedHans:Afflictions_0'
   IncapSettings(0)=(Duration=2.500000,Cooldown=10.000000,Vulnerability=(0.950000))
   IncapSettings(1)=(Duration=1.200000,Cooldown=15.000000,Vulnerability=(0.650000))
   IncapSettings(2)=(Cooldown=2.000000,Vulnerability=(0.500000,0.950000,0.500000,0.500000,0.750000))
   IncapSettings(3)=(Cooldown=1.700000,Vulnerability=(0.100000,0.100000,0.100000,0.100000,0.500000))
   IncapSettings(4)=(Cooldown=10.000000,Vulnerability=(0.100000,0.300000,0.100000,0.100000,0.400000))
   IncapSettings(5)=(Duration=1.250000,Cooldown=17.000000,Vulnerability=(0.100000,0.550000,0.100000,0.100000,0.550000))
   IncapSettings(6)=(Vulnerability=(0.000000))
   IncapSettings(7)=(Duration=3.000000,Cooldown=10.500000,Vulnerability=(1.000000,2.000000,1.000000,1.000000,2.000000))
   IncapSettings(8)=(Cooldown=20.000000,Vulnerability=(0.100000,0.400000,0.100000,0.100000,0.250000))
   IncapSettings(9)=(Duration=1.000000,Cooldown=10.000000,Vulnerability=(0.500000))
   IncapSettings(10)=(Duration=3.000000,Cooldown=10.000000,Vulnerability=(0.080000))
   IncapSettings(11)=(Cooldown=10.000000,Vulnerability=(0.200000))
   KnockdownImpulseScale=1.000000
   SprintSpeed=675.000000
   DefaultInventory(0)=Class'kfgamecontent.KFWeap_AssaultRifle_DualMKb42_Hans'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_ZedHansBase:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_ZedHansBase:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_ZedHansBase:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=Class'KFGame.KFSM_MeleeAttack'
      SpecialMoveClasses(2)=Class'KFGame.KFSM_DoorMeleeAttack'
      SpecialMoveClasses(3)=Class'kfgamecontent.KFSM_GrappleAttack_Hans'
      SpecialMoveClasses(4)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(10)=None
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=None
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=Class'kfgamecontent.KFSM_Evade_Fear'
      SpecialMoveClasses(17)=Class'KFGame.KFSM_Block'
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=None
      SpecialMoveClasses(21)=None
      SpecialMoveClasses(22)=None
      SpecialMoveClasses(23)=None
      SpecialMoveClasses(24)=None
      SpecialMoveClasses(25)=None
      SpecialMoveClasses(26)=None
      SpecialMoveClasses(27)=None
      SpecialMoveClasses(28)=None
      SpecialMoveClasses(29)=None
      SpecialMoveClasses(30)=None
      SpecialMoveClasses(31)=None
      SpecialMoveClasses(32)=None
      SpecialMoveClasses(33)=None
      SpecialMoveClasses(34)=None
      SpecialMoveClasses(35)=None
      SpecialMoveClasses(36)=None
      SpecialMoveClasses(37)=None
      SpecialMoveClasses(38)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      SpecialMoveClasses(39)=Class'kfgamecontent.KFSM_Hans_WeaponSwitch'
      SpecialMoveClasses(40)=Class'kfgamecontent.KFSM_Hans_ThrowGrenade'
      SpecialMoveClasses(41)=Class'kfgamecontent.KFSM_Hans_GrenadeHalfBarrage'
      SpecialMoveClasses(42)=Class'kfgamecontent.KFSM_Hans_GrenadeBarrage'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_ZedHansBase:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedHans:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'KFGame.Default__KFPawn_ZedHansBase:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_ZedHansBase:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'KFGame.Default__KFPawn_ZedHansBase:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_ZedHansBase:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_ZedHansBase:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_ZedHansBase:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedHans:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_ZedHansBase:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_ZedHansBase:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_ZedHansBase:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_ZedHansBase:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   DamageRecoveryTimeHeavy=0.700000
   DamageRecoveryTimeMedium=0.850000
   Mass=275.000000
   GroundSpeed=285.000000
   Health=7420
   ControllerClass=Class'KFGame.KFAIController_Hans'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_ZedHansBase:KFPawnSkeletalMeshComponent'
      WireframeColor=(B=0,G=255,R=255,A=255)
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      bChartDistanceFactor=True
      ReplacementPrimitive=None
      RBChannel=RBCC_Pawn
      RBDominanceGroup=20
      bOwnerNoSee=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      CollideActors=True
      BlockZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,Pawn=True,Vehicle=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-86.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=2500.000000
      bAllowPerObjectShadows=True
      TickGroup=TG_DuringAsyncWork
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_ZedHansBase:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPawn_ZedHansBase:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=55.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPawn_ZedHansBase:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPawn_ZedHansBase:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPawn_ZedHansBase:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPawn_ZedHansBase:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPawn_ZedHansBase:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   Components(8)=SprintAkComponent0
   Components(9)=HeadshotAkComponent0
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=50000,Yaw=50000,Roll=50000)
   Name="Default__KFPawn_ZedHans"
   ObjectArchetype=KFPawn_ZedHansBase'KFGame.Default__KFPawn_ZedHansBase'
}
