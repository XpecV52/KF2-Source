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

	class'KFPawn_MonsterBoss'.static.PlayBossEntranceTheatrics(self);
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
	if( !IsHealAllowed() )
	{
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
				if( IsDoingSpecialMove() && !IsDoingSpecialMove(SM_PlayerZedMove_Q) )
				{
					EndSpecialMove();
				}
				bAutoHealed = true;
				DoSpecialMove( SM_PlayerZedMove_Q, true );
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

/** Returns TRUE if we're aiming with the husk cannon */
simulated function bool UseAdjustedControllerSensitivity()
{
	return IsDoingSpecialMove( SM_PlayerZedMove_RMB ) || IsDoingSpecialMove( SM_PlayerZedMove_MMB );
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

defaultproperties
{
   LowHealthThreshold=0.300000
   HealThreshold=0.500000
   AutoHealThreshold=0.250000
   SummonChildrenDuration=10.000000
   CloakCharges=60
   LowHealthMsg="Health Is Critical! Heal Now!"
   NoHealsRemainingMsg="No Heals Remaining"
   NoMortarTargetsMsg="No Valid Mortar Targets"
   Begin Object Class=AkComponent Name=CloakedAkComponent0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:CloakedAkComponent0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="CloakedAkComponent0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:CloakedAkComponent0'
   End Object
   CloakedAkComponent=CloakedAkComponent0
   Begin Object Class=StaticMeshComponent Name=KFSyringeStaticMeshComponent1 Archetype=StaticMeshComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:KFSyringeStaticMeshComponent1'
      StaticMesh=StaticMesh'ZED_Patriarch_MESH.CHR_Patriarch_Syringe'
      Materials(0)=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_M'
      ReplacementPrimitive=None
      MaxDrawDistance=4000.000000
      CachedMaxDrawDistance=4000.000000
      bAcceptsDynamicDecals=False
      bUseOnePassLightingOnTranslucency=True
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnServer=False
      Rotation=(Pitch=16384,Yaw=0,Roll=0)
      PerObjectShadowCullDistance=4000.000000
      bAllowPerObjectShadows=True
      Name="KFSyringeStaticMeshComponent1"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:KFSyringeStaticMeshComponent1'
   End Object
   HealingSyringeMeshes(0)=KFSyringeStaticMeshComponent1
   Begin Object Class=StaticMeshComponent Name=KFSyringeStaticMeshComponent2 Archetype=StaticMeshComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:KFSyringeStaticMeshComponent2'
      StaticMesh=StaticMesh'ZED_Patriarch_MESH.CHR_Patriarch_Syringe'
      Materials(0)=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_M'
      ReplacementPrimitive=None
      MaxDrawDistance=4000.000000
      CachedMaxDrawDistance=4000.000000
      bAcceptsDynamicDecals=False
      bUseOnePassLightingOnTranslucency=True
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnServer=False
      Rotation=(Pitch=16384,Yaw=0,Roll=0)
      PerObjectShadowCullDistance=4000.000000
      bAllowPerObjectShadows=True
      Name="KFSyringeStaticMeshComponent2"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:KFSyringeStaticMeshComponent2'
   End Object
   HealingSyringeMeshes(1)=KFSyringeStaticMeshComponent2
   Begin Object Class=StaticMeshComponent Name=KFSyringeStaticMeshComponent3 Archetype=StaticMeshComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:KFSyringeStaticMeshComponent3'
      StaticMesh=StaticMesh'ZED_Patriarch_MESH.CHR_Patriarch_Syringe'
      Materials(0)=MaterialInstanceConstant'ZED_Patriarch_MAT.ZED_Patriarch_M'
      ReplacementPrimitive=None
      MaxDrawDistance=4000.000000
      CachedMaxDrawDistance=4000.000000
      bAcceptsDynamicDecals=False
      bUseOnePassLightingOnTranslucency=True
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnServer=False
      Rotation=(Pitch=16384,Yaw=0,Roll=0)
      PerObjectShadowCullDistance=4000.000000
      bAllowPerObjectShadows=True
      Name="KFSyringeStaticMeshComponent3"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:KFSyringeStaticMeshComponent3'
   End Object
   HealingSyringeMeshes(2)=KFSyringeStaticMeshComponent3
   BattlePhases(0)=(TentacleDamage=10,HealAmounts=(1.000000))
   BattlePhases(1)=(HealAmounts=(1.000000))
   BattlePhases(2)=(HealAmounts=(0.900000))
   BattlePhases(3)=(bCanSummonMinions=True)
   MissileProjectileClass=Class'kfgamecontent.KFProj_Missile_Patriarch_Versus'
   MaxMortarRangeSQ=6250000.000000
   bVersusZed=True
   ThirdPersonViewOffset=(OffsetHigh=(X=-200.000000,Y=90.000000,Z=45.000000),OffsetMid=(X=-185.000000,Y=110.000000,Z=45.000000),OffsetLow=(X=-220.000000,Y=130.000000,Z=55.000000))
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedPatriarch:MeleeHelper_0'
      BaseDamage=25.000000
      MyDamageType=Class'kfgamecontent.KFDT_Bludgeon_Patriarch'
      MomentumTransfer=40000.000000
      MaxHitRange=375.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedPatriarch:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedPatriarch_Versus:MeleeHelper_0'
   XPValues(0)=2500.000000
   MoveListGamepadScheme(0)=SM_PlayerZedMove_RMB
   MoveListGamepadScheme(1)=SM_PlayerZedMove_Q
   MoveListGamepadScheme(2)=SM_PlayerZedMove_LMB
   MoveListGamepadScheme(3)=SM_PlayerZedMove_V
   MoveListGamepadScheme(4)=SM_PlayerZedMove_G
   MoveListGamepadScheme(5)=SM_PlayerZedMove_MMB
   MoveListGamepadScheme(6)=SM_PlayerZedMove_V
   SpecialMoveCooldowns(0)=(CoolDownTime=0.500000,SMHandle=SM_PlayerZedMove_LMB,SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Generic-HeavyMelee',NameLocalizationKey="Melee")
   SpecialMoveCooldowns(1)=(CoolDownTime=4.000000,SMHandle=SM_PlayerZedMove_RMB,SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Patriarch-MiniGun',NameLocalizationKey="Minigun")
   SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,bShowOnHud=False)
   SpecialMoveCooldowns(3)=(CoolDownTime=5.000000,SMHandle=SM_PlayerZedMove_V,SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Patriarch-TentacleAttack',NameLocalizationKey="Grab")
   SpecialMoveCooldowns(4)=(CoolDownTime=5.000000,SMHandle=SM_PlayerZedMove_MMB,SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Patriarch-Rocket',NameLocalizationKey="Rocket")
   SpecialMoveCooldowns(5)=(CoolDownTime=6.000000,SMHandle=SM_PlayerZedMove_Q,SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Patriarch-Heal',Charges=3,NameLocalizationKey="Heal")
   SpecialMoveCooldowns(6)=(CoolDownTime=2.350000,SMHandle=SM_PlayerZedMove_G,SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Patriarch-MortarStrike',NameLocalizationKey="Mortar")
   SpecialMoveCooldowns(7)=(CoolDownTime=999.000000,SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Generic-Cloak',Charges=60)
   SpecialMoveCooldowns(8)=(CoolDownTime=1.000000,SMHandle=SM_Jump,SpecialMoveIcon=Texture2D'ZED_Patriarch_UI.ZED-VS_Icons_Generic-Jump',bShowOnHud=False)
   FootstepCameraShake=CameraShake'kfgamecontent.Default__KFPawn_ZedPatriarch_Versus:FootstepCameraShake0'
   Begin Object Class=AkComponent Name=SprintAkComponent0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:SprintAkComponent0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="SprintAkComponent0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:SprintAkComponent0'
   End Object
   SprintAkComponent=SprintAkComponent0
   Begin Object Class=AkComponent Name=HeadshotAkComponent0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:HeadshotAkComponent0'
      Name="HeadshotAkComponent0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:HeadshotAkComponent0'
   End Object
   HeadShotAkComponent=HeadshotAkComponent0
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bNeedsCrosshair=True
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedPatriarch:Afflictions_0'
      AfflictionClasses(0)=Class'KFGame.KFAffliction_EMPDisrupt'
      AfflictionClasses(1)=Class'kfgamecontent.KFAffliction_Fire_Patriarch'
      AfflictionClasses(2)=()
      AfflictionClasses(3)=()
      AfflictionClasses(4)=()
      AfflictionClasses(5)=()
      AfflictionClasses(6)=()
      AfflictionClasses(7)=()
      AfflictionClasses(8)=()
      AfflictionClasses(9)=()
      AfflictionClasses(10)=()
      AfflictionClasses(11)=()
      FireFullyCharredDuration=50.000000
      FireCharPercentThreshhold=0.350000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedPatriarch:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedPatriarch_Versus:Afflictions_0'
   IncapSettings(7)=(Duration=1.500000,Cooldown=8.500000,Vulnerability=(0.700000,0.700000,1.000000,0.700000))
   IncapSettings(8)=()
   IncapSettings(9)=()
   IncapSettings(10)=()
   IncapSettings(11)=()
   SprintSpeed=700.000000
   SprintStrafeSpeed=400.000000
   TeammateCollisionRadiusPercent=0.300000
   DefaultInventory(0)=Class'kfgamecontent.KFWeap_Minigun_Patriarch_Versus'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedPatriarch:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=Class'KFGame.KFSM_MeleeAttack'
      SpecialMoveClasses(2)=Class'KFGame.KFSM_DoorMeleeAttack'
      SpecialMoveClasses(3)=Class'KFGame.KFSM_Patriarch_Grapple'
      SpecialMoveClasses(4)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(10)=None
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=None
      SpecialMoveClasses(13)=Class'kfgamecontent.KFSM_Patriarch_Taunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=Class'KFGame.KFSM_Block'
      SpecialMoveClasses(18)=Class'kfgamecontent.KFSM_Patriarch_Heal'
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=None
      SpecialMoveClasses(21)=Class'kfgamecontent.KFSM_Patriarch_MortarAttack'
      SpecialMoveClasses(22)=Class'kfgamecontent.KFSM_Patriarch_MissileAttack'
      SpecialMoveClasses(23)=Class'kfgamecontent.KFSM_Patriarch_MinigunBarrage'
      SpecialMoveClasses(24)=None
      SpecialMoveClasses(25)=Class'kfgamecontent.KFSM_PlayerPatriarch_Melee'
      SpecialMoveClasses(26)=Class'kfgamecontent.KFSM_PlayerPatriarch_MinigunBarrage'
      SpecialMoveClasses(27)=Class'kfgamecontent.KFSM_PlayerPatriarch_TentacleGrab'
      SpecialMoveClasses(28)=Class'kfgamecontent.KFSM_PlayerPatriarch_MissileAttack'
      SpecialMoveClasses(29)=Class'kfgamecontent.KFSM_PlayerPatriarch_Heal'
      SpecialMoveClasses(30)=Class'kfgamecontent.KFSM_PlayerPatriarch_MortarAttack'
      SpecialMoveClasses(31)=None
      SpecialMoveClasses(32)=None
      SpecialMoveClasses(33)=None
      SpecialMoveClasses(34)=None
      SpecialMoveClasses(35)=None
      SpecialMoveClasses(36)=None
      SpecialMoveClasses(37)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedPatriarch:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedPatriarch_Versus:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedPatriarch:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedPatriarch:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedPatriarch_Versus:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   Health=1680
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:KFPawnSkeletalMeshComponent'
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
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=55.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedPatriarch:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   Components(8)=SprintAkComponent0
   Components(9)=HeadshotAkComponent0
   Components(10)=CloakedAkComponent0
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_ZedPatriarch_Versus"
   ObjectArchetype=KFPawn_ZedPatriarch'kfgamecontent.Default__KFPawn_ZedPatriarch'
}
