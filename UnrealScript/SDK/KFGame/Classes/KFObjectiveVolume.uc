//=============================================================================
// KFObjectiveVolume
//=============================================================================
// The objective's start volume
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFObjectiveVolume extends Volume
	native
	notplaceable
	dependsOn(KFObjective)
	implements(KFInterface_Usable);

var 	KFObjective						CurObjective;				//Reference to the objective
var		array<PlayerReplicationInfo>    ObjPlayerPRIs;
var()	StaticMeshComponent				ObjectiveMesh;
var 	bool							bDebugObjectiveVolume;

simulated event PostBeginPlay()
{
   	`log("[OBJECTIVE VOLUME]" @ GetFuncName(), bDebugObjectiveVolume);
	Super.PostBeginPlay();

	/* Hide the volume when the game starts */
    Hide();
}

/* Set the active objective */
simulated function InitVolume(KFObjective CurrentObjective)
{
	`log("[OBJECTIVE VOLUME]" @ GetFuncName(), bDebugObjectiveVolume);
	CurObjective = CurrentObjective;
}

simulated function Unhide()
{
	`log("[OBJECTIVE VOLUME]" @ GetFuncName(), bDebugObjectiveVolume);
	SetHidden(false);
}

simulated function Hide()
{
	`log("[OBJECTIVE VOLUME]" @ GetFuncName(), bDebugObjectiveVolume);
	SetHidden(true);
}

/* We are done */
simulated function ShutDownVolume()
{
	local KFPawn_Human KFPH;
	local KFPlayerController KFPC;

	`log("[OBJECTIVE VOLUME]" @ GetFuncName(), bDebugObjectiveVolume);
	Hide();
	CurObjective = none;

	// Hide any objective volume notifications
	foreach TouchingActors(class'KFPawn_Human', KFPH)
	{
		if( KFPH.IsAliveAndWell() && KFPH.Controller != none )
		{
			KFPC = KFPlayerController(KFPH.Controller);
			if( KFPC != none && KFPC.Pawn != none )
			{
				class'KFPlayerController'.static.UpdateInteractionMessages( KFPC.Pawn );
			}
		}
	}
}

/* returns how many objective players are currently in the volume  */
simulated function int GetNumPlayersActive()
{
	local KFPawn_Human KFPH;
	local KFPlayerReplicationInfo KFPRI;
	local int Num;

	foreach TouchingActors(class'KFPawn_Human', KFPH)
	{
		if( KFPH.IsAliveAndWell() )
		{
			KFPRI = KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo);
			if( KFPRI != none && CurObjective.IsObjectivePlayer(KFPRI) )
			{
				Num++;
			}
		}
	}
    `log("[OBJECTIVE VOLUME]" @ GetFuncName() @ "Players ready:" @ Num, bDebugObjectiveVolume);
	return Num;
}

/* Create the emitter that shows the way to the us */
simulated function ShowObjectivePath()
{
	local KFPlayerController KFPC;
	local KFGameReplicationInfo KFGRI;
	local KFEmit_ObjectivePath Path;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	if( KFGRI != none && CurObjective != none && KFGRI.CurrentObjective == CurObjective &&
 		CurObjective.ShouldShowObjPath() )
	{
		foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
		{
			KFPC.FindPathTo(Location);
			Path = Spawn(class'KFEmit_ObjectivePath', KFPC,, KFPC.Pawn.Location);

			// instead of using the routecache for the last waypoint, use the trader pod mesh
			Path.SetDestination(Location);

			KFPC.SetTimer(2.0, false, nameof(ShowObjectivePath), self);
		}
	}
}

simulated function bool GetIsUsable( Pawn User )
{
	local KFPawn_Human KFPH;

	KFPH = KFPawn_Human( User );
	return ObjectiveIsValid( KFPH );
}

function int GetInteractionIndex()
{
	return IMT_AcceptObjective;
}

function bool UsedBy(Pawn User)
{
	local KFPlayerController KFPC;
	
	if( GetIsUsable( User ) )
	{
		KFPC = KFPlayerController(User.Controller);
		if( KFPC != none )
		{
			KFPC.ServerAcceptObj();
		}
	}
	return false;
}

event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	local KFPawn_Human KFPH;
	super.Touch(Other, OtherComp, HitLocation, HitNormal);

	KFPH = KFPawn_Human(Other);
	if( !ObjectiveIsValid( KFPH ) )
	{
		return;
	}
	
	class'KFPlayerController'.static.UpdateInteractionMessages( Other );
}

event UnTouch( Actor Other )
{
	local KFPawn_Human KFPH;

	super.UnTouch( Other );

	KFPH = KFPawn_Human(Other);
	if( !ObjectiveIsValid( KFPH ) )
	{
		return;
	}

	class'KFPlayerController'.static.UpdateInteractionMessages( Other );
}

function bool ObjectiveIsValid( KFPawn_Human KFPH )
{
	if( KFPH == none || CurObjective == none ||
		(CurObjective != none && CurObjective.ObjectiveState > OS_PreStart) ||
		(KFPH != none && CurObjective.ActiveObjectivePlayers.Find(KFPH.PlayerReplicationInfo) != INDEX_NONE) )
	{
		return false;
	}
	return true;
}

DefaultProperties
{
	bPawnsOnly=true
	bDebugObjectiveVolume=false

	Begin Object Class=StaticMeshComponent Name=MeshComponent
	   	bAllowApproximateOcclusion=TRUE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
		StaticMesh=StaticMesh'UI_Objectives_World_MESH.Default_Objective_Cube'
		bForceDirectLightMap=TRUE
		bUsePrecomputedShadows=TRUE
		// Collision
		BlockActors=false
		BlockZeroExtent=false
		BlockNonZeroExtent=true
		BlockRigidBody=false
		AlwaysLoadOnClient=True
		AlwaysLoadOnServer=True
		bDisableAllRigidBody=true
		// Lighting
		CastShadow=false
		bCastDynamicShadow=false
		bCastStaticShadow=false
	End Object
	ObjectiveMesh=MeshComponent
	Components.Add(MeshComponent)

	bStatic=false
	bHidden=false
}
