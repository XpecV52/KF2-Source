//=============================================================================
// KFPawn_ZedPatriarch_Versus
//=============================================================================
// Human controllable Patriarch pawn class for versus mode
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedPatriarch_Versus extends KFPawn_ZedPatriarch;

/** Cached controller */
var KFPlayerController MyKFPC;

/** The local player controller viewing this pawn */
var KFPlayerController ViewerPlayer;

/** The threshold at which to display a low health warning */
var float LowHealthThreshold;

/** Whether we've already warned of low health this phase */
var bool bWarnedLowHealthThisPhase;

/** used to keep track of heal message */
var bool bIsQuickHealMessageShowing;

/** Percentage of max health to allow healing at */
var private float HealThreshold;

/** Health threshold to perform an autoheal at */
var private float AutoHealThreshold;

/** Whether the Patriarch autohealed this phase or not */
var private bool bAutoHealed;

/** How long to summon children for */
var private float SummonChildrenDuration;

/** Determines if a summon has been done this phase yet */
var bool bSummonedThisPhase;

/** Number of charges left on our cloak */
var private repnotify byte CloakCharges;

/** Localized strings */
var localized string LowHealthMsg;
var localized string NoHealsRemainingMsg;
var localized string NoMortarTargetsMsg;

replication
{
	if( bNetOwner && bNetDirty )
		MyKFPC;

	if( bNetDirty )
		CloakCharges;
}

simulated event ReplicatedEvent( name VarName )
{
	if( VarName == nameOf(CloakCharges) )
	{
		if( IsLocallyControlled() )
		{
			UpdateCloakCharges();
		}
		return;
	}

	super.ReplicatedEvent( VarName );
}

function PossessedBy( Controller C, bool bVehicleTransition )
{
	super.PossessedBy(C, bVehicleTransition);

	ServerDoSpecialMove(SM_BossTheatrics);
	MyKFPC = KFPlayerController(C);

	// Start the cloak timer
	SetTimer( 2.f + fRand(), false, nameOf(Timer_EnableCloak) );	
}

/** Toggle cloaking material */
function SetCloaked(bool bNewCloaking)
{
	if( bNewCloaking && (IsDoingSpecialMove() || CloakCharges == 0) )
	{
		return;
	}

	super.SetCloaked(bNewCloaking);

	/*if(MyKFPC != none)
	{
		if(bIsCloaking)
		{
			MyKFPC.ClientEnterZedTime( true );
		}
		else
		{
			MyKFPC.ClientFadeOutZedTime();
		}
	}*/

	UpdateCloakedTimer();

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		UpdateCloakCharges();
	}
}

/** Starts or stops our cloaking timer */
function UpdateCloakedTimer()
{
	if( CloakCharges == 0 || !bIsCloaking )
	{
		if( IsTimerActive(nameOf(Timer_UpdateCloakCharge)) )
		{
			ClearTimer( nameOf(Timer_UpdateCloakCharge) );
		}
		return;
	}

	if( bIsCloaking )
	{
		if( !IsTimerActive(nameOf(Timer_UpdateCloakCharge)) )
		{
			SetTimer( 1.f, true, nameOf(Timer_UpdateCloakCharge) );
		}
	}
}

/** Runs every second to tick off our cloak charges */
function Timer_UpdateCloakCharge()
{
	CloakCharges = Max( CloakCharges - 1, 0 );

	if( CloakCharges == 0 )
	{
		SetCloaked( false );
		ClearTimer( nameOf(Timer_UpdateCloakCharge) );
	}

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		UpdateCloakCharges();
	}
}

/** Updates the number of cloak charges for UI */
private function UpdateCloakCharges()
{
	SpecialMoveCooldowns[7].Charges = CloakCharges;
}

/** Turns on the cloak after a specified amount of time */
function Timer_EnableCloak()
{
	SetCloaked( true );
}

/** Update our barrel spin skel control */
simulated event Tick( float DeltaTime )
{
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		// Cache off our viewer player
		if( ViewerPlayer == none )
		{
			ViewerPlayer = KFPlayerController( WorldInfo.GetALocalPlayerController() );
		}

		UpdateHealAvailable();
		UpdateCloakIconState();
	}

	super.Tick( DeltaTime );
}

/** Updates our gun tracking skeletal control */
simulated function UpdateGunTrackingSkelCtrl( float DeltaTime )
{
	local rotator ViewRot;

	// Track the player with the gun arm
	if( GunTrackingSkelCtrl != none )
	{
		if( bGunTracking )
		{
			ViewRot = GetViewRotation();
			if( Role < ROLE_Authority && !IsLocallyControlled() )
			{
				ViewRot.Pitch = NormalizeRotAxis( RemoteViewPitch << 8 );
			}
			GunTrackingSkelCtrl.DesiredTargetLocation = GetPawnViewLocation() + vector(ViewRot) * 5000.f;
			GunTrackingSkelCtrl.InterpolateTargetLocation( DeltaTime );
		}
		else
		{
			GunTrackingSkelCtrl.SetSkelControlActive( false );
		}
	}
}

/** Gets the minimum cloaked amount based on the viewer */
simulated protected function float GetMinCloakPct()
{
	if( ViewerPlayer != none && (ViewerPlayer.GetTeamNum() == GetTeamNum() || ViewerPlayer.PlayerReplicationInfo.bOnlySpectator) )
	{
		return 0.4f;
	}

	return super.GetMinCloakPct();
}

/** Updates the HUD interaction message and heal icon to show current heal capability */
private function UpdateHealAvailable()
{
	if( IsHealAllowed() )
	{
		if(MyKFPC != none && !bIsQuickHealMessageShowing)
		{
			bIsQuickHealMessageShowing = true;
			MyKFPC.ReceiveLocalizedMessage(class'KFLocalMessage_Interaction', IMT_HealSelfWarning);
			SpecialMoveCooldowns[5].LastUsedTime = 0;
		}
	}
	else 
	{
		if( bIsQuickHealMessageShowing )
		{
			bIsQuickHealMessageShowing = false;
 			MyKFPC.ReceiveLocalizedMessage(class'KFLocalMessage_Interaction', IMT_None);
		}

		//extend the cooldown of heal here
		SpecialMoveCooldowns[5].LastUsedTime = WorldInfo.TimeSeconds;
	}
}

/** Updates the state of the cloaking icon */
private function UpdateCloakIconState()
{
	if( SpecialMoveCooldowns[7].Charges == 0 )
	{
		SpecialMoveCooldowns[7].LastUsedTime = WorldInfo.TimeSeconds;
	}
	else
	{
		SpecialMoveCooldowns[7].LastUsedTime = 0;		
	}
}

/** If true, we have enough heal charges remaining to execute a heal */
private function bool IsHealAllowed()
{
	return (GetHealthPercentage() < HealThreshold && SpecialMoveCooldowns[5].Charges > 0);
}

/** Retrieves the aim direction and target location for each missile. Called from SpecialMove */
function GetMissileAimDirAndTargetLoc( int MissileNum, vector MissileLoc, rotator MissileRot, out vector AimDir, out vector TargetLoc )
{
    local PlayerController PC;
	local vector HitLocation, HitNormal;
    local vector TraceStart, TraceEnd;
    local Actor HitActor;

    PC = PlayerController(Controller);
    if( PC == none )
    {
        return;
    }

    TraceStart = PC.PlayerCamera.CameraCache.POV.Location;
    TraceEnd = PC.PlayerCamera.CameraCache.POV.Location + vector(PC.PlayerCamera.CameraCache.POV.Rotation)*10000.f;

    HitActor = Trace( HitLocation, HitNormal, TraceEnd, TraceStart, TRUE,,, TRACEFLAG_Bullet );

    if( HitActor != none )
    {
        AimDir = Normal(HitLocation - MissileLoc);
        TargetLoc = HitLocation;
    }
    else
    {
		AimDir = Normal( TraceEnd - MissileLoc);
		TargetLoc = TraceEnd;
	}
}

/** Retrieves the aim direction and target location for each mortar. Called from SpecialMove */
function GetMortarAimDirAndTargetLoc( int MissileNum, vector MissileLoc, rotator MissileRot, out vector AimDir, out vector TargetLoc, out float MissileSpeed )
{
	local Patriarch_MortarTarget MissileTarget;
	local vector X,Y,Z;

	GetAxes( MissileRot, X,Y,Z );

	// Each missile can possibly target a separate player
	MissileTarget = GetMortarTarget(MissileNum);

	// Aim at the feet
	TargetLoc = MissileTarget.TargetPawn.Location + (vect(0,0,-1)*MissileTarget.TargetPawn.GetCollisionHeight());

	// Nudge the spread a tiny bit to make the missiles less concentrated on a single point
	AimDir = Normal( vect(0,0,1) + Normal(MissileTarget.TargetVelocity) );

	// Set the missile speed
	MissileSpeed = VSize( MissileTarget.TargetVelocity );
}

/** Allows pawn to do any pre-mortar attack prep */
function PreMortarAttack()
{
	ClearMortarTargets();
	CollectMortarTargets( true, true );
	CollectMortarTargets();
}

/** Tries to set our mortar targets */
function bool CollectMortarTargets( optional bool bInitialTarget, optional bool bForceInitialTarget )
{
	local int NumTargets;
	local KFPawn_Human KFP;
	local float TargetDistSQ;
	local vector MortarVelocity, MortarStartLoc, TargetLoc, TargetProjection;
	
   	MortarStartLoc = Location + vect(0,0,1)*GetCollisionHeight();
    NumTargets = bInitialTarget ? 0 : 1;
    foreach WorldInfo.AllPawns( class'KFPawn_Human', KFP )
	{
		if( !KFP.IsAliveAndWell() || MortarTargets.Find('TargetPawn', KFP) != INDEX_NONE )
		{
			continue;
		}

		// Make sure target is in range
		TargetLoc = KFP.Location + (vect(0,0,-1)*(KFP.GetCollisionHeight()*0.8f));
		TargetProjection = MortarStartLoc - TargetLoc;
		TargetDistSQ = VSizeSQ( TargetProjection );
		if( TargetDistSQ > MinMortarRangeSQ && TargetDistSQ < MaxMortarRangeSQ )
		{
			TargetLoc += Normal(TargetProjection)*KFP.GetCollisionRadius();
			if( SuggestTossVelocity(MortarVelocity, TargetLoc, MortarStartLoc, MortarProjectileClass.default.Speed, 500.f, 1.f, vect(0,0,0),, GetGravityZ()*0.8f) )
			{
				// Make sure upward arc path is clear
				if( !FastTrace(MortarStartLoc + (Normal(vect(0,0,1) + (Normal(TargetLoc - MortarStartLoc)*0.9f))*fMax(VSize(MortarVelocity)*0.55f, 800.f)), MortarStartLoc,, true) )
				{
					continue;
				}

				MortarTargets.Insert( NumTargets, 1 );
				MortarTargets[NumTargets].TargetPawn = KFP;
				MortarTargets[NumTargets].TargetVelocity = MortarVelocity;

				if( bInitialTarget || NumTargets == 2 )
				{
					return true;
				}

				NumTargets++;
			}
		}
	}

	return false;
}

/** Clears mortar targets */
function ClearMortarTargets()
{
	MortarTargets.Length = 0;
}

/** Increment Patriarch to the next battle phase */
function IncrementBattlePhase()
{
	super.IncrementBattlePhase();

	bSummonedThisPhase = false;
}

/** Check health percentage to see if we should summon children or allow healing */
private function CheckHealth()
{
	local float HealthPct;

	HealthPct = GetHealthPercentage();

	if( HealthPct < HealThreshold )
	{
		if( Role == ROLE_Authority )
		{
			//SummonChildren();

			// Perform an autoheal if necessary
			if( SpecialMoveCooldowns[5].Charges > 0 && HealthPct <= AutoHealThreshold )
			{
				if( IsDoingSpecialMove() && !IsDoingSpecialMove(SM_PlayerZedSpecial3) )
				{
					EndSpecialMove();
				}
				bAutoHealed = true;
				DoSpecialMove( SM_PlayerZedSpecial3, true );
			}
		}

		if( !bWarnedLowHealthThisPhase && IsLocallyControlled() && MyKFPC.MyGFxHUD != none && HealthPct <= LowHealthThreshold && SpecialMoveCooldowns[5].Charges > 0 )
		{
			bWarnedLowHealthThisPhase = true;
			MyKFPC.MyGFxHUD.ShowNonCriticalMessage( LowHealthMsg );
		}
	}
}

/** Called from KFSpecialMove::SpecialMoveEnded */
simulated function NotifySpecialMoveEnded( KFSpecialMove FinishedMove, ESpecialMove SMHandle )
{
	super.NotifySpecialMoveEnded( FinishedMove, SMHandle );

	if( Role == ROLE_Authority )
	{
		SetTimer( 2.f + fRand(), false, nameOf(Timer_EnableCloak) );
	}
}

/** Overriden to set the Patriarch to feel mode when his health passes a certain threshold */
function NotifyTakeHit(Controller InstigatedBy, vector HitLocation, int Damage, class<DamageType> DamageType, vector Momentum, Actor DamageCauser)
{
	Super.NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum, DamageCauser);

	CheckHealth();
}

/** Notification from the heal specialmove that we performed a successful heal */
function NotifyHealed()
{
	// Reset low health warning
	bWarnedLowHealthThisPhase = false;

	// Reduce our number of heals by 1
	--SpecialMoveCooldowns[5].Charges;

	// Reset our cloak charges
	CloakCharges = bAutoHealed ? byte( float(default.CloakCharges) * 0.75f ) : default.CloakCharges;
	SpecialMoveCooldowns[7].Charges = CloakCharges;

	// Reset autoheal status
	bAutoHealed = false;	
}

/** Allow humans to draw a positional icon to find us when we're uncloaked */
simulated function bool ShouldDrawBossIcon()
{
	return !(bIsCloaking);
}

/*********************************************************************************************
* Zed Summoning
**********************************************************************************************/

/** Summon some children */
singular function SummonChildren()
{
	if( !bSummonedThisPhase )
	{
		super.SummonChildren();

		bSummonedThisPhase = true;
		SetTimer( SummonChildrenDuration, false, nameOf(Timer_StopSummoningChildren) );

		SetFleeAndHealMode( true );
	}
}

/** Stop summoning children */
function Timer_StopSummoningChildren()
{
	KFGameInfo(WorldInfo.Game).SpawnManager.StopSummoningBossMinions();
}

DefaultProperties
{
	bVersusZed=true
	TeammateCollisionRadiusPercent=0.30

	LocalizationKey=KFPawn_ZedPatriarch

	bNeedsCrosshair=true
	SummonChildrenDuration=10.f
	HealThreshold=0.5f
	AutoHealThreshold=0.25f
	LowHealthThreshold=0.3f
	Health=2540

	SprintSpeed=700.f
	SprintStrafeSpeed=400.f
	GroundSpeed=260.f

	DifficultyDamageMod=1.25

	Begin Object Name=MeleeHelper_0
		BaseDamage=55.f //45.f
		MaxHitRange=375.f
		MomentumTransfer=40000.f
		MyDamageType=class'KFDT_Bludgeon_Patriarch'
	End Object
	MeleeAttackHelper=MeleeHelper_0

    DefaultInventory(0)=class'KFWeap_Minigun_Patriarch_Versus'

	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_PlayerZedAttack1)=class'KFSM_PlayerPatriarch_Melee'
		SpecialMoveClasses(SM_PlayerZedAttack2)=class'KFSM_PlayerPatriarch_MinigunBarrage'
		SpecialMoveClasses(SM_PlayerZedSpecial1)=class'KFSM_PlayerPatriarch_TentacleGrab'
		SpecialMoveClasses(SM_PlayerZedSpecial2)=class'KFSM_PlayerPatriarch_MissileAttack'
		SpecialMoveClasses(SM_PlayerZedSpecial3)=class'KFSM_PlayerPatriarch_Heal'
		SpecialMoveClasses(SM_PlayerZedSpecial4)=class'KFSM_PlayerPatriarch_MortarAttack'
		SpecialMoveClasses(SM_Taunt)=class'KFSM_Patriarch_Taunt'
	End Object

	// Gun stance cooldowns
	SpecialMoveCooldowns(0)=(SMHandle=SM_PlayerZedAttack1,		CooldownTime=0.5f,	SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Generic-HeavyMelee', GBA_Name="GBA_Fire",NameLocalizationKey="Melee")
	SpecialMoveCooldowns(1)=(SMHandle=SM_PlayerZedAttack2,		CooldownTime=4.0f,	SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Patriarch-MiniGun', GBA_Name="GBA_IronsightsToggle", ALT_GBA_Name="GBA_IronsightsHold",NameLocalizationKey="Minigun")
	SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,					CooldownTime=0.0f,	GBA_Name="GBA_Reload",bShowOnHud=false))
	SpecialMoveCooldowns(3)=(SMHandle=SM_PlayerZedSpecial1,		CooldownTime=5.0f,	SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Patriarch-TentacleAttack', GBA_Name="GBA_TertiaryFire",NameLocalizationKey="Grab")
	SpecialMoveCooldowns(4)=(SMHandle=SM_PlayerZedSpecial2,		CooldownTime=5.0f,	SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Patriarch-Rocket', GBA_Name="GBA_SwitchFireMode",NameLocalizationKey="Rocket")
	SpecialMoveCooldowns(5)=(SMHandle=SM_PlayerZedSpecial3,		CooldownTime=6.f,	SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Patriarch-Heal', GBA_Name="GBA_QuickHeal", Charges=3,NameLocalizationKey="Heal")
	SpecialMoveCooldowns(6)=(SMHandle=SM_PlayerZedSpecial4,		CooldownTime=2.35f,	SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Patriarch-MortarStrike', GBA_Name="GBA_Grenade",NameLocalizationKey="Mortar")
	SpecialMoveCooldowns(7)=(SMHandle=SM_Custom1,				CooldownTime=999.f,	SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Generic-Cloak', Charges=60)
	SpecialMoveCooldowns.Add((SMHandle=SM_Jump,					CooldownTime=1.0f,	SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Generic-Jump', GBA_Name="GBA_Jump",bShowOnHud=false)) // Jump always at end of array

	BattlePhases(0)={(HealAmounts={(1.0f)},
					  TentacleDamage=10,
					  bCanSummonMinions=true)}
	BattlePhases(1)={(HealAmounts={(1.0f)},
					  TentacleDamage=10,
					  bCanSummonMinions=true)}
	BattlePhases(2)={(HealAmounts={(0.9f)},
					  TentacleDamage=10,
					  bCanSummonMinions=true)}
	BattlePhases(3)={(TentacleDamage=10,
					  bCanSummonMinions=true)}

	MissileProjectileClass=class'KFProj_Missile_Patriarch_Versus'
	MortarProjectileClass=class'KFProj_Mortar_Patriarch'

	MinMortarRangeSQ=160000.f
	MaxMortarRangeSQ=6250000.f

	CloakCharges=60

	//defaults
	ThirdPersonViewOffset={(
		OffsetHigh=(X=-200,Y=90,Z=45),
		OffsetLow=(X=-220,Y=130,Z=55),
		OffsetMid=(X=-185,Y=110,Z=45),
		)}
}
