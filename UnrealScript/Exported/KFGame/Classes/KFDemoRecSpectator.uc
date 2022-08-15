//=============================================================================
// KFDemoRecSpectator
//=============================================================================
// Specator class to support demo recording/playback functionality
// TODO: Can (and probably should) rename this to DemoRecSpecator after
// We get the UDK/UT stuff out of our build folder. Named it KFDemoRecSpectator
// For now to avoid class name conflicts. The functionality in this class
// also needs to be refined for KF2
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
// Portions based off of DemoRecSpectator Copyright 1998-2012 Epic Games, Inc.
// All Rights Reserved.
//=============================================================================

class KFDemoRecSpectator extends KFPlayerController;

var bool bFindPlayer;

/** local copy of RealViewTarget as the C++ code might clear it in some cases we don't want to for demo spectators */
var PlayerReplicationInfo MyRealViewTarget;

/** if set, camera rotation is always forced to viewtarget rotation */
var config bool bLockRotationToViewTarget;

/** If set, automatically switches players every AutoSwitchPlayerInterval seconds */
var config bool bAutoSwitchPlayers;

/** Interval to use if bAutoSwitchPlayers is TRUE */
var config float AutoSwitchPlayerInterval;

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	if ( PlayerReplicationInfo != None )
	{
		PlayerReplicationInfo.bOutOfLives = true;
	}
}

simulated event ReceivedPlayer()
{
	Super.ReceivedPlayer();

	// DemoRecSpectators don't go through the login process, so manually call ClientSetHUD()
	// so the spectator has it when playing back the demo
	if (Role == ROLE_Authority && WorldInfo.Game != None)
	{
		ClientSetHUD(WorldInfo.Game.HUDType);
	}
}

function InitPlayerReplicationInfo()
{
	Super.InitPlayerReplicationInfo();
	PlayerReplicationInfo.PlayerName = "DemoRecSpectator";
	PlayerReplicationInfo.bIsSpectator = true;
	PlayerReplicationInfo.bOnlySpectator = true;
	PlayerReplicationInfo.bOutOfLives = true;
	PlayerReplicationInfo.bWaitingPlayer = false;
}

/** Prevent Scaleform from hogging input so that RypelCam demo playback controls work */
function SetGFxHUD( KFGFxMoviePlayer_HUD NewGFxHud )
{
	super.SetGFxHUD( NewGFxHud );
	if( NewGFxHud != none )
	{
		NewGFxHud.bCaptureInput = false;
	}
}

exec function Slomo(float NewTimeDilation)
{
	WorldInfo.DemoPlayTimeDilation = NewTimeDilation;
}

exec function ViewClass( class<actor> aClass, optional bool bQuiet, optional bool bCheat )
{
	local actor other, first;
	local bool bFound;

	first = None;

	ForEach AllActors( aClass, other )
	{
		if ( bFound || (first == None) )
		{
			first = other;
			if ( bFound )
				break;
		}
		if ( other == ViewTarget )
			bFound = true;
	}

	if ( first != None )
	{
		SetViewTarget(first);
		//SetBehindView(ViewTarget != self);
	}
	else
		SetViewTarget(self);
}

//==== Called during demo playback ============================================

exec function DemoViewNextPlayer()
{
	local Pawn P, Pick;
	local bool bFound;

	// view next player
	foreach WorldInfo.AllPawns(class'Pawn', P)
	{
		if (P.PlayerReplicationInfo != None)
		{
			if (Pick == None)
			{
				Pick = P;
			}
			if (bFound)
			{
				Pick = P;
				break;
			}
			else
			{
				bFound = (RealViewTarget == P.PlayerReplicationInfo || ViewTarget == P);
			}
		}
	}

	SetViewTarget(Pick);
}

function SetViewTarget(Actor NewViewTarget, optional ViewTargetTransitionParams TransitionParams)
{
	Super.SetViewTarget(NewViewTarget, TransitionParams);

	// this check is so that a Pawn getting gibbed doesn't break finding that player again
	// must manually clear MyRealViewTarget when player controlled switch back to viewing self
	if (NewViewTarget != self)
	{
		MyRealViewTarget = RealViewTarget;
	}
}

unreliable server function ServerViewSelf(optional ViewTargetTransitionParams TransitionParams)
{
	Super.ServerViewSelf(TransitionParams);

	MyRealViewTarget = None;
}

reliable client function ClientSetRealViewTarget(PlayerReplicationInfo NewTarget)
{
	SetViewTarget(self); // will find Pawn from RealViewTarget next tick
	RealViewTarget = NewTarget;
	MyRealViewTarget = NewTarget;
	bFindPlayer = (NewTarget == None);
}

function bool SetPause(bool bPause, optional delegate<CanUnpause> CanUnpauseDelegate = CanUnpause)
{
	// allow the spectator to pause demo playback
	if (WorldInfo.NetMode == NM_Client)
	{
		WorldInfo.Pauser = (bPause) ? PlayerReplicationInfo : None;
		return true;
	}
	else
	{
		return false;
	}
}

exec function Pause()
{
	if (WorldInfo.NetMode == NM_Client)
	{
		ServerPause();
	}
}

auto state Spectating
{
	function BeginState(Name PreviousStateName)
	{
		super.BeginState(PreviousStateName);

		if( bAutoSwitchPlayers )
		{
			SetTimer( AutoSwitchPlayerInterval, true, nameof( DemoViewNextPlayer ) );
		}
	}

	exec function StartFire(optional byte FireModeNum)
	{
//		SetBehindView(true);
		DemoViewNextPlayer();
	}

	/** used to start out the demo view on the local player - should be called when recording, not playback */
	function SendInitialViewTarget()
	{
		local PlayerController PC;

		foreach LocalPlayerControllers(class'PlayerController', PC)
		{
			if (!PC.PlayerReplicationInfo.bOnlySpectator)
			{
				ClientSetRealViewTarget(PC.PlayerReplicationInfo);
				return;
			}
		}
		// send None so demo playback knows it should just pick the first Pawn it can find
		ClientSetRealViewTarget(None);
	}

	simulated event GetPlayerViewPoint(out vector CameraLocation, out rotator CameraRotation)
	{
		Global.GetPlayerViewPoint(CameraLocation, CameraRotation);
	}

//	exec function BehindView()
//	{
//		SetBehindView(!bBehindView);
//	}

	event PlayerTick( float DeltaTime )
	{
		local Pawn P;

		Global.PlayerTick( DeltaTime );

		// attempt to find a player to view.
		if (Role == ROLE_AutonomousProxy)
		{
			if (RealViewTarget == None && MyRealViewTarget != None)
			{
				RealViewTarget = MyRealViewTarget;
			}

			if ((RealViewTarget==None || RealViewTarget==PlayerReplicationInfo) && bFindPlayer)
			{
				DemoViewNextPlayer();
				if (RealViewTarget != None && RealViewTarget != PlayerReplicationInfo)
				{
					bFindPlayer = false;
				}
			}
			else
			{
				// reacquire ViewTarget if the player switched Pawns
				if ( RealViewTarget != None && RealViewTarget != PlayerReplicationInfo &&
					(Pawn(ViewTarget) == None || Pawn(ViewTarget).PlayerReplicationInfo != RealViewTarget) )
				{
					foreach WorldInfo.AllPawns(class'Pawn', P)
					{
						if (P.PlayerReplicationInfo == RealViewTarget)
						{
							SetViewTarget(P);
							break;
						}
					}
				}
			}

			if (Pawn(ViewTarget) != None)
			{
				TargetViewRotation = ViewTarget.Rotation;
				TargetViewRotation.Pitch = Pawn(ViewTarget).RemoteViewPitch << 8;
			}
		}
	}
Begin:
	if (Role == ROLE_Authority)
	{
		// it takes two ticks to guarantee that all the relevant actors have been recorded into the demo
		// (necessary for the reference in ClientSetRealViewTarget()'s parameter to be valid during playback)
		Sleep(0.0);
		Sleep(0.0);
		SendInitialViewTarget();
	}
}

simulated event GetPlayerViewPoint(out vector CameraLocation, out rotator CameraRotation)
{
//	bFreeCamera = (!bLockRotationToViewTarget && (bBehindView || Vehicle(ViewTarget) != None));
	Super.GetPlayerViewPoint(CameraLocation, CameraRotation);
}

function UpdateRotation(float DeltaTime)
{
	local rotator NewRotation;

	if (bLockRotationToViewTarget)
	{
		SetRotation(ViewTarget.Rotation);
	}
	else
	{
		Super.UpdateRotation(DeltaTime);
	}

	if (Rotation.Roll != 0)
	{
		NewRotation = Rotation;
		NewRotation.Roll = 0;
		SetRotation(NewRotation);
	}
}

defaultproperties
{
   Begin Object Class=AkComponent Name=AkComponent_0 Archetype=AkComponent'KFGame.Default__KFPlayerController:AkComponent_0'
      BoneName="Root"
      bStopWhenOwnerDestroyed=True
      Name="AkComponent_0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPlayerController:AkComponent_0'
   End Object
   StingerAkComponent=AkComponent_0
   Begin Object Class=PointLightComponent Name=AmplificationLightTemplate_0 Archetype=PointLightComponent'KFGame.Default__KFPlayerController:AmplificationLightTemplate_0'
      Radius=200.000000
      bAIIgnoreLuminosity=True
      Brightness=0.020000
      CastShadows=False
      CastStaticShadows=False
      bDisableSpecular=True
      LightingChannels=(Outdoor=True)
      Name="AmplificationLightTemplate_0"
      ObjectArchetype=PointLightComponent'KFGame.Default__KFPlayerController:AmplificationLightTemplate_0'
   End Object
   AmplificationLightTemplate=AmplificationLightTemplate_0
   Begin Object Class=PointLightComponent Name=NVGLightTemplate_0 Archetype=PointLightComponent'KFGame.Default__KFPlayerController:NVGLightTemplate_0'
      Radius=800.000000
      bAIIgnoreLuminosity=True
      Brightness=0.050000
      bEnabled=False
      CastShadows=False
      CastStaticShadows=False
      bDisableSpecular=True
      LightingChannels=(Outdoor=True)
      Name="NVGLightTemplate_0"
      ObjectArchetype=PointLightComponent'KFGame.Default__KFPlayerController:NVGLightTemplate_0'
   End Object
   NVGLightTemplate=NVGLightTemplate_0
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPlayerController:CollisionCylinder'
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPlayerController:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AkComponent_0
   RemoteRole=ROLE_AutonomousProxy
   bDemoOwner=True
   CollisionComponent=CollisionCylinder
   Name="Default__KFDemoRecSpectator"
   ObjectArchetype=KFPlayerController'KFGame.Default__KFPlayerController'
}
