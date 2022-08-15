//=============================================================================
// KFTraderTrigger
//=============================================================================
// Trigger used to start Trader interaction
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFTraderTrigger extends Trigger_PawnsOnly
	config(Game)
	native
	implements(KFInterface_Usable);

/** reference to actor to play open/close animations */
var() SkeletalMeshActor	TraderMeshActor;

/** Anim to play when trader is opened or closed (play reverse) */
var() name OpenAnimName;
/** Looping anim to play while trader is open */
var() name IdleLoopAnimName;

/** current state of the trader */
var	transient bool  bOpened;

/** Debugging */
var	config bool bLogTrader;
var	const float DistanceOffNavMeshTheTragerIsAllowedToBe;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** KFInterface_Usable */
simulated function bool GetIsUsable( Pawn User )
{
	return bOpened;
}

/** KFInterface_Usable */
function int GetInteractionIndex()
{
	return IMT_UseTrader;
}

/** HUD and Dialog */
event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	local Pawn P;

	if (bLogTrader) LogInternal("KFTrigger_Trader::Touch! Trader:" @ self);

	Super.Touch(Other, OtherComp, HitLocation, HitNormal);

	class'KFPlayerController'.static.UpdateInteractionMessages( Other );
	P = Pawn(Other);
	if ( P != None )
	{
		// no KFTraderDialogManager object on dedicated server, so use static function
		class'KFTraderDialogManager'.static.PlayApproachTraderDialog( P.Controller );
	}
}

/** HUD */
event UnTouch(Actor Other)
{
	super.UnTouch( Other );
	class'KFPlayerController'.static.UpdateInteractionMessages( Other );
}

/** Handles trigger interaction */
function bool UsedBy(Pawn User)
{
	local KFPawn_Human KFPH;
	local KFPlayerController KFPC;

   	if (bLogTrader) LogInternal("KFTrigger_Trader::UsedBy! Trader:" @ self);

 	KFPH = KFPawn_Human(User);

	if ( KFPH == none  )
	{
		return false;
	}

	KFPC = KFPlayerController(User.Controller);

	if ( KFPC != none )
	{
		KFPC.OpenTraderMenu();
	}

	return false;
}

/** Open shop at the start of trader time */
simulated function OpenTrader()
{
	local float AnimDuration;

	SetCollision(true, false);
	bOpened = true;

	if ( WorldInfo.NetMode != NM_DedicatedServer)
	{
		if ( TraderMeshActor != None )
		{
			TraderMeshActor.SkeletalMeshComponent.PlayAnim(OpenAnimName);
			AnimDuration = TraderMeshActor.SkeletalMeshComponent.GetAnimLength(OpenAnimName);
			// Need to run this timer on the GRI since this trigger doesn't tick on clients.
			WorldInfo.GRI.SetTimer(AnimDuration, false, nameof(StartTraderLoopAnim), self);
		}

		ShowTraderPath();
	}
}

/** Play a looping animation on the active trader mesh */
simulated function StartTraderLoopAnim()
{
	if ( WorldInfo.NetMode != NM_DedicatedServer && TraderMeshActor != None && bOpened )
	{
		TraderMeshActor.SkeletalMeshComponent.PlayAnim(IdleLoopAnimName,,true);
	}
}

/** Spawn emitter path to the active trader */
simulated function ShowTraderPath()
{
	local KFPlayerController KFPC;
	local KFGameReplicationInfo KFGRI;
	local KFEmit_TraderPath Path;
	local Actor nodePathRoot;
	local bool bPathFound;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	if ( KFGRI != none && KFGRI.OpenedTrader == self && bCollideActors )
	{
		foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
		{
			nodePathRoot = KFPC.FindPathToward(self);
			if( nodePathRoot != none )
			{
				bPathFound = true;
			}
			else
			{
				bPathFound = false;
			}

			if( bPathFound )
			{
				Path = Spawn(class'KFEmit_TraderPath', KFPC,, KFPC.Pawn.Location);

				// instead of using the routecache for the last waypoint, use the trader pod mesh
				Path.SetDestination(TraderMeshActor != None ? TraderMeshActor.Location + vect(0,0,100): Location);
			}
			else
			{
				if( class'KFEmit_TraderPath'.default.bShowEmitPathDebugArtifacts )
				{
					DrawDebugLine( KFPC.Pawn.Location, Location, 255, 0, 0, true);
				}
				if (bLogTrader) LogInternal("ShowTraderPath - No Path Found, KFGRI.OpenedTrader: " @ KFGRI.OpenedTrader @ " trader trigger loc: " @ Location @ " - player loc: " @ KFPC.Pawn.Location);
			}

			KFPC.SetTimer(2.0, false, nameof(ShowTraderPath), self);
		}
	}
}

/** Close shop when trader time is over */
simulated function CloseTrader()
{
	local KFPlayerController KFPC;

	SetCollision(false, false);
	bOpened = false;

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if ( TraderMeshActor != None )
		{
			TraderMeshActor.SkeletalMeshComponent.PlayAnim(OpenAnimName,,,,, true);
		}
		foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
		{
		 	KFPC.CloseTraderMenu();
		 	if( KFPC.Pawn != none )
		 	{
				class'KFPlayerController'.static.UpdateInteractionMessages( KFPC.Pawn );
			}
		}
	}
}

/** Called by CheatManager */
simulated function HideTraderPath()
{
	local KFPlayerController KFPC;
	foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		KFPC.ClearTimer(nameof(ShowTraderPath), self);
	}
}

defaultproperties
{
   OpenAnimName="Open"
   IdleLoopAnimName="Printing"
   DistanceOffNavMeshTheTragerIsAllowedToBe=500.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Trigger_PawnsOnly:CollisionCylinder'
      CollisionHeight=160.000000
      CollisionRadius=400.000000
      bAlwaysRenderIfSelected=True
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__Trigger_PawnsOnly:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Trigger_PawnsOnly:Sprite'
      Sprite=Texture2D'EditorResources.S_Trigger'
      SpriteCategoryName="Triggers"
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Trigger_PawnsOnly:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   CollisionType=COLLIDE_NoCollision
   bCollideActors=False
   CollisionComponent=CollisionCylinder
   Name="Default__KFTraderTrigger"
   ObjectArchetype=Trigger_PawnsOnly'Engine.Default__Trigger_PawnsOnly'
}
