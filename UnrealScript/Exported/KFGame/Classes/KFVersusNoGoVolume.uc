//=============================================================================
// KFVersusNoGoVolume
//=============================================================================
// Volume which can spawn pawns inside of it and show transient spawn marker
// actors in the editor.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFVersusNoGoVolume extends PostProcessVolume
	native
	placeable;

/** Actors to unhide while in this volume */
var() array<StaticMeshActor> NoGoWallActors;

/** True while NoGo effects/meshes are showing */
var transient bool bIsActive;

/** Last time we performed a touching actors test */
var transient float LastTouchingCheckTime;

/** Initial delay before we start "motivating" the player to move */
var() float NoGoHurtStartDelay <ClampMin=10.0 | ClampMax=120.0>;

/** The damage type used to hurt griefing players */
var transient class<KFDamageType> NoGoDamageType;

/** Damage dealing interval */
var transient float NoGoHurtInterval;

/** Notify local player controller when toggled */
private native function NotifyNoGoActive( bool bNewActive, float HurtStartDelay);

/**
 * This touch is a bit unusual because we care about locally controlled players.  For example,
 * we're not handling the case of re-possessing a pawn already in the volume.  PostProcessVolumes
 * have a solution for this, but it's fairly invovled.
 */
simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	if ( !bIsActive && WorldInfo.NetMode != NM_DedicatedServer )
	{
		// If the actor just spawned it may not have a controller yet, so
		// we have to delay one frame to test properly.
		if ( Other.CreationTime == WorldInfo.TimeSeconds )
		{
			if (bDebug) LogInternal(GetFuncName()@"delaying touch test on spawn for a valid controller");
			Other.SetTimer(0.01, false, nameof(CheckActivate), self);
		}
		else
		{
			CheckActivate();
		}
	}
}

/** Test touching actors on Touch() event or just after */
simulated function CheckActivate()
{
	if ( !bIsActive && IsLocalPlayerTouching() )
	{
		SetActive(true);
	}
}

/** Returns true if there is a local player controller in this volume */
simulated function bool IsLocalPlayerTouching()
{
	local Pawn P;
	local PlayerController LocalPC;

	LocalPC = GetALocalPlayerController();
	LastTouchingCheckTime = WorldInfo.TimeSeconds;

	foreach TouchingActors(class'Pawn', P)
	{
		if( P.Controller != None && P.Controller == LocalPC )
		{
			return true;
		}
	}

	return false;
}

/** Toggle on/off local NoGo effects and meshes */
private simulated function SetActive(bool bNewActive)
{
	local int i;

	bIsActive = bNewActive;

	for (i = 0; i < NoGoWallActors.Length; ++i)
	{
		NoGoWallActors[i].SetHidden(!bIsActive);
	}

	// toggle tick on/off for UnTouch check interval 
	SetTickIsDisabled(!bIsActive);

	// notify local player controller for hurt damage
	NotifyNoGoActive( bIsActive, NoGoHurtStartDelay );

	if (bDebug) LogInternal(GetFuncName()@"called with"@bNewActive@bTickIsDisabled);
}

/** 
 * While active tick is uses to handle an UnTouch check interval.  Can't rely just on UnTouch() events
 * events because the controller can be detached while the pawn is still touching (e.g. death)
*/
simulated event Tick(float DeltaTime)
{
	if ( (WorldInfo.TimeSeconds - LastTouchingCheckTime) > 0.5f )
	{
		if ( !IsLocalPlayerTouching() )
		{
			SetActive(false);
		}
	}
}

/**
 * @brief Returns the volumes damage type class
 * @return Damagetype
 */
static final function class<KFDamageType> GetNoGoDTClass()
{
	return default.NoGoDamageType;
}

/**
 * @brief Returns the time between damage is dealed
 * @return Hurt interval
 */
static final function float GetNoGoHurtInterval()
{
	return default.NoGoHurtInterval;
}

defaultproperties
{
   NoGoHurtStartDelay=60.000000
   bPawnsOnly=True
   BrushColor=(B=100,G=255,R=100,A=255)
   bColored=True
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__PostProcessVolume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__PostProcessVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_TouchAllButWeapons
   bCollideActors=True
   CollisionComponent=BrushComponent0
   Name="Default__KFVersusNoGoVolume"
   ObjectArchetype=PostProcessVolume'Engine.Default__PostProcessVolume'
}
