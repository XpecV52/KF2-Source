//=============================================================================
// KFPawn_ZedCrawler
//=============================================================================
// Crawler
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedCrawler extends KFPawn_Monster;

var actor LastBumpLevelActor;
var float LastBumpLevelTime;

/**
 * PossessedBy() - Called when a new controller possesses this pawn
 *
 * @param	C	Controller taking possession of this pawn
 * @param	bVehicleTransition	Legacy, true if pawn is transitioning from vehicle to on-foot (or vice-versa)
 */
function PossessedBy( Controller C, bool bVehicleTransition )
{
	super.PossessedBy( C, bVehicleTransition );
	LastBumpLevelActor = none;
	if( KFAIController_ZedCrawler(MyKFAIC) != none )
	{
		KFAIController_ZedCrawler(MyKFAIC).OriginalMeshTranslation = Mesh.Translation;
	}
}

// Disabled for Early Access 1/14/15 as part of disabling wall walking - Ramm
//simulated event BaseChange()
//{
//	Super.BaseChange();
//
//	if( Base != None && Pawn(Base) == none ) // Added pawn check 3/18
//	{
//		if (Role == ROLE_Authority)
//		{
//			ReplicatedFloor = Floor;
//		}
//		else
//		{
//			Floor = ReplicatedFloor;
//		}
//	}
//}

/**
 * SpecialMoveTo() - Called by NavigationPoint SuggestMovePreparation event,
 * provides option for pawn to do something special (but not necessarily a real
 * KFSpecialMove) for this reachspec.
 *
 * @param	Start	Starting node
 * @param	End		Ending node
 * @param	Next	Which node is currently next (need to check if Start != End)
 */
// Disabled for Early Access 1/14/15 as part of disabling wall walking - Ramm
//function bool SpecialMoveTo( NavigationPoint Start, NavigationPoint End, Actor Next )
//{
//	local ReachSpec	CurrentPath;
//	local vector EndLocation;
//	local AICommand ActiveCommand;
////	local int i;
//	//local KFDebugLines KFDL;
//
//	if( Start == End  )
//	{
//		return false;
//	}
//
//	CurrentPath = Start.GetReachSpecTo( End );
//	if( CurrentPath == none )
//	{
//		`AILog_Ext( GetFuncName()$"() WARNING - Can't find ReachSpec from start "$Start$" to End "$End$" (Next: "$Next$")", 'Crawler', MyKFAIC );
//	}
//	EndLocation = CurrentPath.End.Actor.Location;
//	`AILog_Ext( GetFuncName()$" CurrentPath: "$CurrentPath$" Start: "$Start$" End: "$End$" Next: "$Next$" Phys: "$GetPhysicsName()$" Velocity: "$VSize(Velocity)$" Dist From Start "$VSize(Start.Location - Location)$" Dist From End: "$VSize(End.Location - Location), 'Crawler', MyKFAIC );
//	`AILog_Ext( GetFuncName()$" MoveGoal: "$MyKFAIC.MoveGoal$" Dist from: "$VSize(MyKFAIC.MoveGoal.Location - Location), 'Crawler', MyKFAIC );
//
//	if( CurrentPath.BlockedBy != none )
//	{
//		`log( "CurrentPath "$CurrentPath$" blockedBy was "$CurrentPath.BlockedBy );
//	}
//
//	if( WallToFloorReachSpec(CurrentPath) != none && WallToFloorReachSpec(CurrentPath).bJumpDownTo ) // && !End.IsA('KFWallPathNode') )
//	{
//		MyKFAIC.AIActionStatus = "Falling from wall using "$CurrentPath$" ("$Start$")";
//		SetPhysics( PHYS_Falling );
//		return false;
//	}
//	// JC: Temp
//	if( !NavigationPoint(CurrentPath.End.Actor).bWallNode && CurrentPath.Start.bWallNode )
//	{
//		if( (Location.Z - EndLocation.Z > 0.f) && ((Location.Z - EndLocation.Z) <= KFWallPathNode(CurrentPath.End.Actor).MaxDropFromWallDistance) )
//		{
//			if( VSize2D(EndLocation - Location) <=  KFWallPathNode(CurrentPath.End.Actor).Max2DDistToFloorNodes )
//			{
//				MyKFAIC.AIActionStatus = "Falling from wall using "$CurrentPath$" ("$Start$")";
//				SetPhysics( PHYS_Falling );
//				return false;
//			}
//		}
//	}
//
//	if( KFPathnode( End ) != none )
//	{
//		if( CurrentPath != none && CurrentPath.IsA( 'WallToFloorReachSpec' ) && Physics == PHYS_Spider )
//		{
//			if( WallToFloorReachSpec(CurrentPath).bJumpDownTo )
//			{
//				SetPhysics( PHYS_Falling );
//			}
//		}
//	}
//
//	if( CurrentPath != None && Physics == PHYS_Walking && End.IsA('KFWallPathNode') )
//	{
//		if( KFWallPathNode(End).bMustJumpTo )
//		{
//			ActiveCommand = AICommand( MyKFAIC.GetActiveCommand() );
//			if( WallReachSpec(CurrentPath) != none && (ActiveCommand == none || !ActiveCommand.IsA('AICommand_Crawler_LeapToWall')) )
//			{
//				return	SpecialMoveTo_Leap( Start, End, KFPathnode(Start).JumpTime );
//			}
//			else if( (ActiveCommand == none || !ActiveCommand.IsA('AICommand_Crawler_LeapToWall')) )
//			{
//				return	SpecialMoveTo_Leap( Start, End );
//			}
//		}
//		else if( !CurrentPath.Start.IsA('KFDoorMarker') && !Next.IsA('KFDoorMarker') )
//		{
//			//KFDL = class'KFDebugLines'.static.GetDebugLines();
//			//if( KFDL != none )
//			//{
//			//	KFDL.AddDebugSphere( Start.Location, 24, 8, 0, 255, 0, true, 200, name, 1 );
//			//	KFDL.AddDebugSphere( End.Location, 24, 8, 255, 0, 0, true, 200, name, 2 );
//			//	KFDL.AddDebugSphere( Next.Location, 18, 6, 255, 255, 0, true, 200, name, 3 );
//			//}
//			`AILog_Ext( GetFuncName()$" Setting PHYS to PHYS_SPIDER DIST: "$VSize(End.Location-Location), 'Crawler', MyKFAIC );
//			SetPhysics(PHYS_Spider);
//		//	MyKFAIC.ForcePauseAndRepath(); 2.5.2014
//		//	MyKFAIC.PauseAndShowMsg( "SpecialMoveTo Setting PHYS to Spider Start: "$Start$" End: "$End );
//			return false;
//		}
//		return true;
//	}
//	return false;
//}

function bool SpecialMoveTo_Leap( NavigationPoint Start, NavigationPoint End, optional float JumpTime=0.45f )
{
	class'AICommand_Crawler_LeapToWall'.static.LeapToWall( KFAIController_ZedCrawler(MyKFAIC), Start, End, JumpTime );
	return TRUE;
}

/**
 * BumpLevel() - Event called by KFPawn_Monster NotifyBumpLevel() when bumping
 * geometry (this includes when landing on the ground).
 *
 * @param	HitLocation		World location where the level was bumped
 * @param	HitNormal		The normal generated at collision
 * @param	Wall			The actor, if any, that's considered to be the wall
 */
event SpiderBumpLevel( vector HitLocation, vector HitNormal, optional actor Wall )
{
	local AICommand ActiveCommand;

	if( MyKFAIC != none )
	{
		if( LastBumpLevelTime == 0.f || (WorldInfo.TimeSeconds - LastBumpLevelTime) > 0.1f )
		{
			LastBumpLevelTime = WorldInfo.TimeSeconds;
			ActiveCommand = AICommand( MyKFAIC.GetActiveCommand() );
			if( Physics != PHYS_Falling || (ActiveCommand != none && AICommand_Crawler_LeapToWall(ActiveCommand) != none) )
			{
				if( Wall != none && LastBumpLevelActor != Wall )
				{
					if( MyKFAIC!= None ) { MyKFAIC.AILog_Internal("(Pawn) "$GetFuncName()$" Wall: "$Wall$" HitNormal: "$HitNormal,'Crawler'); };
					LastBumpLevelActor = Wall;
					MyKFAIC.NotifyHitWall( HitNormal, Wall );
				}
			}
			else
			{
				if( MyKFAIC!= None ) { MyKFAIC.AILog_Internal("(Pawn) [PHYS_FALLING] "$GetFuncName()$" Wall: "$Wall$" HitNormal: "$HitNormal,'Crawler'); };
			}
		}
	}
}

// Disabled for Early Access 1/14/15 as part of disabling wall walking - Ramm
//simulated event RootMotionProcessed(SkeletalMeshComponent SkelComp)
//{
//	if( Mesh.RootMotionVelocity != vect(0,0,0) )
//	{
//		//MyKFAIC.LastCrawlerX = Mesh.RootMotionVelocity;
//		//MyKFAIC.SetFocalPoint( Location + normal(Mesh.RootMotionVelocity) * 512.f );
//		KFAIController_ZedCrawler(MyKFAIC).LastRMVelocity = Mesh.RootMotionVelocity;
//	}
//}

/*********************************************************************************************
* Debugging
********************************************************************************************* */

/** Render some Fleshpound specific debug text over his head */
/**
 * GetOverheadDebugText() - Called by KFAIController if rendering debug text is enabled.
 * Gives Pawn a chance to include some debug text of its own.
 *
 * @param	ModifyTextColor		Optionally override the default text color
 */
simulated function GetOverheadDebugText( KFHUDBase HUD, out array<string> OverheadTexts, out array<Color> OverheadColors )
{
	local string DebugText;

    Super.GetOverheadDebugText(HUD, OverheadTexts, OverheadColors);

	if( MyKFAIC != none )
	{
		DebugText = DebugText$"\nPhys:"$GetPhysicsName()$" Floor:"$Floor$" Rot:"$Rotation$" Desired:"$DesiredRotation;

		if( Base != none )
		{
			DebugText = DebugText$"\nBase:"$Base;
		}
	}

	OverheadTexts[OverheadTexts.Length] = DebugText;
}

/**
 * DrawDebugRotation() - Draw Pawn's rotation information in front
 */
simulated function DrawDebugRotation()
{
	local vector vExtent, StartLoc;

	if ( Mesh!=none )
	{
		// draw cylinder around them
		vExtent = vect( 0,0,1 ) * GetCollisionHeight();
		DrawDebugCylinder(Location-vExtent, Location+vExtent, GetCollisionRadius(), 10, 100, 100, 0);
		// Draw Pawn's rotation coordinate in front/top of their cylinder, so it's more visible - red being exactly yaw
		StartLoc = Location+vExtent*GetCollisionRadius();
		DrawDebugCoordinateSystem(StartLoc, Rotation, 75);
		if ( ReachedDesiredRotation()==false )
		{
			// if pawn is rotating, please draw desired rotation with yellow
			DrawDebugLine(Location, Location+Vector(DesiredRotation)*750, 0, 100, 255);
		}
	}
}

simulated function Tick( float DeltaTime )
{
	Super.Tick( DeltaTime );

	if( bDebugCrawlerPhysics )
	{
		DrawDebugRotation();
	}
}

/** Returns (hardcoded) dialog event ID for when players spots this zed type */
function int GetSpotterDialogID()
{
	local int EmergeType;

	if( IsDoingSpecialMove(SM_Emerge) )
    {
        EmergeType = SpecialMoveFlags & 0x0f;
        switch( EmergeType )
        {
        case EMERGE_Floor:
            return 142;//SPOTZ_EmergeFloor

        case EMERGE_Wall248UU:
        case EMERGE_WallHigh:
            return 140;//SPOTZ_EmergeVent

        case EMERGE_Ceiling:
            return 141;//SPOTZ_EmergeCeiling

        default:
        	return 125;//SPOTZ_Generic
        };
    }

    if( Floor.Z > 0.7 )
    {
        // floor
        return 125;//SPOTZ_Generic
    }
    else if( Floor.Z < -0.7 )
    {
        // ceiling
        return 139;//SPOTZ_Ceiling
    }
    else
    {
        // wall?
        return 138;//SPOTZ_Wall
    }

	return 125;//SPOTZ_Generic
}

defaultproperties
{
   bKnockdownWhenJumpedOn=True
   bIsCrawlerClass=True
   CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Crawler_ARCH.ZED_Crawler_Archetype'
   MinSpawnSquadSizeType=EST_Crawler
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
      BaseDamage=7.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_ZedWeak'
      MomentumTransfer=25000.000000
      MaxHitRange=180.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedCrawler:MeleeHelper_0'
   DoshValue=10
   XPValues(0)=8.000000
   XPValues(1)=10.000000
   XPValues(2)=10.000000
   XPValues(3)=10.000000
   DamageTypeModifiers(0)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(1.500000))
   DamageTypeModifiers(1)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle',DamageScale=(1.500000))
   DamageTypeModifiers(2)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun')
   DamageTypeModifiers(3)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun')
   DamageTypeModifiers(4)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle')
   DamageTypeModifiers(5)=(DamageType=Class'KFGame.KFDT_Slashing')
   DamageTypeModifiers(6)=(DamageType=Class'KFGame.KFDT_Bludgeon',DamageScale=(0.900000))
   DamageTypeModifiers(7)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(0.900000))
   DamageTypeModifiers(8)=(DamageType=Class'kfgamecontent.KFDT_Microwave',DamageScale=(0.200000))
   DamageTypeModifiers(9)=(DamageType=Class'KFGame.KFDT_Explosive')
   DamageTypeModifiers(10)=(DamageType=Class'KFGame.KFDT_Piercing')
   DamageTypeModifiers(11)=(DamageType=Class'KFGame.KFDT_Toxic')
   DamageTypeModifiers(12)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_9mm')
   PawnAnimInfo=KFPawnAnimInfo'ZED_Crawler_ANIM.Crawler_AnimGroup'
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bDisableTurnInPlace=True
   bUseQuadrupedFloorConform=True
   PenetrationResistance=0.500000
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'KFGame.Default__KFPawn_Monster:Afflictions_0'
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'KFGame.Default__KFPawn_Monster:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedCrawler:Afflictions_0'
   IncapSettings(0)=(Vulnerability=(2.500000))
   IncapSettings(1)=(Cooldown=7.000000,Vulnerability=(3.000000))
   IncapSettings(2)=(Vulnerability=(2.000000))
   IncapSettings(3)=(Cooldown=0.200000,Vulnerability=(2.500000))
   IncapSettings(4)=(Cooldown=0.200000,Vulnerability=(2.000000))
   IncapSettings(5)=(Duration=2.500000,Cooldown=5.000000,Vulnerability=(2.000000,2.000000,1.000000,1.000000,1.000000))
   IncapSettings(6)=(Duration=5.500000,Cooldown=7.500000,Vulnerability=(10.000000))
   IncapSettings(7)=(Cooldown=1.000000,Vulnerability=(2.000000))
   IncapSettings(8)=(Duration=2.000000,Cooldown=1.500000,Vulnerability=(2.500000))
   IncapSettings(9)=(Duration=3.000000,Cooldown=7.500000,Vulnerability=(0.000000))
   KnockdownImpulseScale=1.000000
   SprintSpeed=500.000000
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=Class'KFGame.KFSM_MeleeAttack'
      SpecialMoveClasses(2)=Class'KFGame.KFSM_DoorMeleeAttack'
      SpecialMoveClasses(3)=Class'KFGame.KFSM_GrappleCombined'
      SpecialMoveClasses(4)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(10)=Class'kfgamecontent.KFSM_Emerge_Crawler'
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Evade'
      SpecialMoveClasses(15)=Class'kfgamecontent.KFSM_Evade_Fear'
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=None
      SpecialMoveClasses(21)=None
      SpecialMoveClasses(22)=None
      SpecialMoveClasses(23)=None
      SpecialMoveClasses(24)=None
      SpecialMoveClasses(25)=None
      SpecialMoveClasses(26)=None
      SpecialMoveClasses(27)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(28)=Class'KFGame.KFSM_HansGrappleVictim'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedCrawler:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_Monster:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_Monster:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedCrawler:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_Monster:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_Monster:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   DamageRecoveryTimeHeavy=0.750000
   Mass=50.000000
   GroundSpeed=280.000000
   MaxFallSpeed=6000.000000
   Health=55
   ControllerClass=Class'KFGame.KFAIController_ZedCrawler'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:KFPawnSkeletalMeshComponent'
      WireframeColor=(B=0,G=255,R=255,A=255)
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bUpdateKinematicBonesFromAnimation=False
      bOverrideAttachmentOwnerVisibility=True
      bChartDistanceFactor=True
      ReplacementPrimitive=None
      RBChannel=RBCC_Pawn
      RBDominanceGroup=20
      bOwnerNoSee=True
      bUseAsOccluder=False
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      CollideActors=True
      BlockZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,Pawn=True,Vehicle=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-48.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=2500.000000
      bAllowPerObjectShadows=True
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPawn_Monster:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=47.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPawn_Monster:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPawn_Monster:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPawn_Monster:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPawn_Monster:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPawn_Monster:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   bBlocksNavigation=True
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=90000,Yaw=45000,Roll=90000)
   Name="Default__KFPawn_ZedCrawler"
   ObjectArchetype=KFPawn_Monster'KFGame.Default__KFPawn_Monster'
}
