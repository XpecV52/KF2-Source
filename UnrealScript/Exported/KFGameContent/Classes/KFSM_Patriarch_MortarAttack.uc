//=============================================================================
// KFSM_Patriarch_MortarAttack
//=============================================================================
// Patriarch's triple missile mortar attack
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_Patriarch_MortarAttack extends KFSM_Patriarch_MissileAttack
	dependsOn(KFAIController_ZedPatriarch);

/** Determines if a barrage attack should be done */
var bool bIsBarrage;

/** Barrage attempts */
var int NumBarrages, MaxBarrages;

/** Barrage fire animation name */
var Name BarrageFireAnimName;

/** Notification called when Special Move starts */
function SpecialMoveStarted( bool bForced, Name PrevMove )
{
	super.SpecialMoveStarted( bForced, PrevMove );

	bIsBarrage = ( MyPatPawn.SpecialMoveFlags == 2 );

	if( bIsBarrage )
	{
		AnimName = BarrageFireAnimName;
	}

	NumBarrages = 0;

	// Do pre-mortar prep if needed
	MyPatPawn.PreMortarAttack();
}

/** Retrieve the projectile class */
function class<KFProj_Missile_Patriarch> GetProjectileClass()
{
	return MyPatPawn.GetMortarClass();
}

/** Retrieves the aim direction and target location for each missile */
function GetAimDirAndTargetLoc( int MissileNum, vector MissileLoc, rotator MissileRot, out vector AimDir, out vector TargetLoc )
{
	MyPatPawn.GetMortarAimDirAndTargetLoc( MissileNum, MissileLoc, MissileRot, AimDir, TargetLoc, InitialMissileSpeed );
}

/** Play the fire animation */
function PlayFireAnimation()
{
	local AnimNodeSequence AnimNodeSeq;

	if( MyPatPawn == none )
	{
		return;
	}

	if( bIsBarrage )
	{
		BlendOutTime = 0.f;
	}

	bUseRootMotion = false;
	DisableRootMotion();
	MyPatPawn.RotationRate = MissileFireRotationRate;
	PlaySpecialMoveAnim( AnimName, EAS_UpperBody, 0.f, BlendOutTime, 1.f );

	// Force animation to first frame so we have an accurate fire start point
	AnimNodeSeq = MyPatPawn.BodyStanceNodes[EAS_UpperBody].GetCustomAnimNodeSeq();
	if( AnimNodeSeq != none )
	{
		AnimNodeSeq.SetPosition( 0.f, false );
	}

	// Shoot some missiles on the server
	if( MyPatPawn.Role == ROLE_Authority )
	{
		FireMissiles();
	}

	// Play our fire sound
	MyPatPawn.PostAkEventOnBone( FireSound, 'BarrelSpinner', true, true );

	// Zero movement
	MyPatPawn.ZeroMovementVariables();
	if( bIsBarrage && !MyPatPawn.IsTimerActive(nameOf(Timer_FireBarrage), self) )
	{
		MyPatPawn.SetTimer( 0.75f, true, nameOf(Timer_FireBarrage), self );
	}
}

/** Fire our three missiles */
function FireMissiles()
{
	if( MyPatPawn != none )
	{
		if( !bIsBarrage )
		{
			MyPatPawn.ClearMortarTargets();
			MyPatPawn.CollectMortarTargets( true, true );
		}

		MyPatPawn.CollectMortarTargets();

		if( MyPatPawn.MortarTargets.Length == 0 )
		{
			MyPatPawn.EndSpecialMove();
			return;
		}
	}

	super.FireMissiles();

	MyPatPawn.ClearMortarTargets();
}

/** Fires off another mortar barrage */
function Timer_FireBarrage()
{
	NumBarrages++;

	MyPatPawn.CollectMortarTargets( true, true );

	if( NumBarrages >= MaxBarrages )
	{
		MyPatPawn.ClearTimer( nameOf(Timer_FireBarrage), self );
		bIsBarrage = false;
		AnimName = default.AnimName;
		BlendOutTime = default.BlendOutTime;
	}

	PlayFireAnimation();
}

/** Plays subsequent animations in the barrage */
function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
	if( MyPatPawn.IsTimerActive(nameOf(Timer_FireBarrage), self) )
	{
		return;
	}

	super.AnimEndNotify( SeqNode, PlayedTime, ExcessTime );
}

/** Special move ended */
function SpecialMoveEnded( Name PrevMove, Name NextMove )
{
	if( MyPatPawn != none )
	{
		MyPatPawn.ClearTimer( nameOf(Timer_FireBarrage), self );
		MyPatPawn.RotationRate = MyPatPawn.default.RotationRate;
		MyPatPawn.ClearMortarTargets();
	}

	Super.SpecialMoveEnded( PrevMove, NextMove );
}

defaultproperties
{
   MaxBarrages=5
   BarrageFireAnimName="Mortar_rapidfire"
   MissileClass=Class'kfgamecontent.KFProj_Mortar_Patriarch'
   LoadAnimNames(0)="Mortar_TO_Load"
   LoadAnimNames(1)="Mortar_TO_LoadQ"
   bAllowGunTracking=False
   bMissileFlocking=False
   SeekDelay=0.100000
   SeekForce=25.000000
   FireSound=AkEvent'WW_ZED_Patriarch.Play_Mortar_Shot'
   AnimName="Mortar_Shoot"
   bDisableSteering=True
   bDisableTurnInPlace=True
   Handle="KFSM_Patriarch_MortarAttack"
   Name="Default__KFSM_Patriarch_MortarAttack"
   ObjectArchetype=KFSM_Patriarch_MissileAttack'kfgamecontent.Default__KFSM_Patriarch_MissileAttack'
}
