//=============================================================================
// KFDoorActor
//=============================================================================
// Class for placeable doors.  Used intead of the InterpActor method so that
// we can easily replicate damage states and use skeletal animation.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFDoorActor extends Actor
	hidecategories(Movement, Collision, Physics, Object, Mobile)
	placeable
	implements(Interface_NavigationHandle)
	native
	nativeReplication;

`include(KFGame\KFGameAnalytics.uci);

/** The base width of a doors SkeletalMeshComponent */
const SkeletalMesh_Width = 256;
const KActorOffset = 25;

/** Reference to the door trigger */
var KFDoorTrigger DoorTrigger;

/*********************************************************************************************
 * @name	Meshes / Materials / Particles
 ********************************************************************************************* */

struct native DoorMeshAttachment
{
    var() StaticMeshComponent     Component;         // Component which needs to be attached
	var() name                    AttachTo;			 // Bone or socket name to which the attachment should be attached
	var() bool                    bSocketAttach;	 // Whether to attach it to a socket or a bone
};

/** Information of all the mesh attachments for the vehicle */
var() array<DoorMeshAttachment> MeshAttachments;

/** Mesh for the weld that goes between the center of two doors or the end of the left door  */
var() StaticMeshComponent     CenterWeldComponent;

/** skeletal mesh used for open/close animations */
var() const editconst SkeletalMeshComponent	SkeletalMeshComp;

var array<MaterialInstanceConstant> 	HealthMICs;
var MaterialInstanceConstant 			IntegrityMIC;

enum EDoorMaterialType
{
	EDMT_Metal,
	EDMT_Wood
};

var() EDoorMaterialType DoorMaterial;

/*********************************************************************************************
 * @name	Open / Close
 ********************************************************************************************* */

enum EDoorMechanism
{
	EDM_Hinge,
	EDM_Slide,
	EDM_Lift,
};

/** type of networking to use */
var(Opening) EDoorMechanism DoorMechanism;
/** The amount of time before a door can be used again */
var(Opening) float CooldownTime;
/** The time it takes to open / close a door */
var(Opening) float OpenBlendTime;
/** ONLY FOR HINGED DOORS Defines how far we want to open our hinged doors in degrees */
var(Opening) int   HingedRotation;
/** ONLY FOR SLIDING DOORS Defines how far we want sliding doors to move */
var(Opening) int   SlideTranslation;
/** ONLY FOR LIFT DOORS Defines how far we want lift doors to raise */
var(Opening) int   LiftTranslation;
/** If set, door opens and closes automatically */
var(Opening) const editconst bool bAutomaticDoor;

/** Has the last door move (open/shut) completed? */
var transient bool bDoorMoveCompleted;

/** The time when the door was last used */
var transient float LastUsedTime;

/** current state of the door if it hasn't been destroyed - note it's possible for bIsDoorOpen to be false and bIsDoorDestroyed to be true so check both */
var repnotify transient bool bIsDoorOpen;
var transient bool bReverseHinge;

/*********************************************************************************************
 * @name	Health
 ********************************************************************************************* */

enum EDoorFastening
{
	EDF_ArcWelding,
	EDF_Rivets
};

var EDoorFastening FastenerType;

/** Starting health for a door */
var() int MaxHealth;
/** Current door health for damage/destruction */
var repnotify transient int Health;
/** Amount of damage a welded door can take */
var() int MaxWeldIntegrity;
/** Current integrity of a welded door */
var repnotify transient int WeldIntegrity;
/** Amount of "explosive" weld needed */
var int DemoWeldRequired;
/** Current amount of "explosive" weld */
var repnotify transient int DemoWeld;
/** Should this door explode? */
var repnotify transient bool bShouldExplode;
var transient KFPlayerController ExplosionInstigatorController;
/** The minimum weld scalar a door can have so a weld will always be visible */
var const float MinWeldScalar;
/** While the door is being attacked it takes longer to weld */
var() float CombatWeldModifier<ClampMin=0.0 | ClampMax=1.0>;
/** The amount of time a door is considered in combat after being hit */
var float CombatLength;

/** True if the door has health less than 0 and is off its hinges */
var repnotify transient bool bIsDestroyed;

/** True if this projectile has already blown up, used to ensure only a single explosion. */
var repnotify transient byte HitCount;
const HIT_DIRECTION_FLAG = 0x80;

/** Last time the door took damage */
var transient float LastHitTime;
/** Last time door weld integrity increased */
var transient float LastWeldTime;
/** Last time door weld integrity decreased */
var transient float LastUnweldTime;

/** Pawn currently welding */
var transient KFPawn WelderPawn;

/** Cached SkelControlSingleBone */
var transient SkelControlSingleBone MovementControl;

/** Cached AnimNodeSlot */
var transient AnimNodeSlot BashSlot;

/** A scaler to fit a door into its proper frame. Double the frame size if we are only using one door for this actor */
var() float FrameSizeOfTwoDoors;

/*********************************************************************************************
 * @name	AI
 ********************************************************************************************* */

/** NavigationPoint associated with this actor for sending AI related notifications (could be a LiftCenter or DoorMarker) */
var NavigationPoint MyMarker;
/** true when AI is waiting for us to finish moving */
var bool bMonitorDoor;

//var() KFNavMeshObstacle_Door MyNavMeshObstacle;

/** Navigation handle used for pathing when using NavMesh */
//var     class<KFNavigationHandle>       NavigationHandleClass;
//var     KFNavigationHandle              MyKFNavigationHandle;

/*********************************************************************************************
 * @name	Physics
 ********************************************************************************************* */

/** The impulse to provide the doors when they are destroyed */
var() float BrokenDoorImpulse;
/** The maximum angular velocity applied to a broken hinged door*/
var() float MaxAngularVelocity;

/** settings for TryPushPawns */
const DoorWidth = 200;
const HumanPushDistance = 40;
const SlidingPushForce = 750;

/*********************************************************************************************
 * @name	Effects
 ********************************************************************************************* */

const BashHingedAnim_F = 'DoorBash_A';
const BashHingedAnim_B = 'DoorBash_B';
const BashSlidingAnim_F = 'DoorBashSliding_A';
const BashSlidingAnim_B = 'DoorBashSliding_B';

/** sound played when the mover is interpolated forward */
var(Sound) AkBaseSoundObject OpenSound;
/** looping sound while opening */
var(Sound) AkBaseSoundObject OpeningAmbientSound;
/** sound played when mover finished moving forward */
var(Sound) AkBaseSoundObject OpenedSound;
/** sound played when the mover is interpolated in reverse */
var(Sound) AkBaseSoundObject CloseSound;
/** looping sound while closing */
var(Sound) AkBaseSoundObject ClosingAmbientSound;
/** sound played when mover finished moving backward */
var(Sound) AkBaseSoundObject ClosedSound;
/** sound played when door is destroyed */
var(Sound) AkBaseSoundObject DestroyedSound;
/** component for looping sounds */
var AkComponent AmbientSoundComponent;
/** used for playing sounds (set to center of doorway in PostBeginPlay because sometimes the actor location is under the floor and sounds don't play right) */
var transient vector SoundOrigin;

/** played when the melee attack hits world geometry */
var() DestroyedEffectParams DamageEmitter;
/** played when the melee attack hits world geometry and the door has no health */
var() array<DestroyedEffectParams> DestroyedEmitters;

var localized string WeldIntegrityString;
var localized string ExplosiveString;

cpptext
{
	virtual void TickSpecial( FLOAT DeltaSeconds );
	INT* GetOptimizedRepList( BYTE* InDefault, FPropertyRetirement* Retire, INT* Ptr, UPackageMap* Map, UActorChannel* Channel );

    // Ensure the SkeletalMeshComp has no pre-existing animations
    virtual void PostLoad();

	// Attach static meshes in PostEditChangeProperty
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);	
	virtual UBOOL ShouldTrace(UPrimitiveComponent* Primitive, AActor *SourceActor, DWORD TraceFlags);

#if WITH_EDITOR
	virtual INT AddMyMarker(AActor *S);
#endif

	/** IMPLEMENT Interface_NavigationHandle */
	virtual UBOOL	CanCoverSlip(ACoverLink* Link, INT SlotIdx);
	virtual void SetupPathfindingParams( FNavMeshPathParams& out_ParamCache );
	virtual void InitForPathfinding() {}
	virtual INT ExtraEdgeCostToAddWhenActive(FNavMeshEdgeBase* Edge) { return 0; }
	virtual FVector GetEdgeZAdjust(FNavMeshEdgeBase* Edge);
}

replication
{
	if ( bNetDirty )
		bIsDoorOpen, Health, WeldIntegrity, bIsDestroyed, HitCount, DemoWeld, 
		bShouldExplode;
	if ( bNetDirty && DoorMechanism == EDM_Hinge )
		bReverseHinge;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(bIsDoorOpen))
	{
		if ( bIsDoorOpen )
		{
			OpenDoor(None);
		}
		else
		{
			CloseDoor();
		}
	}
	else if (VarName == nameof(bIsDestroyed))
	{
		if ( bIsDestroyed )
		{
			PlayDestroyed();
		}
		else
		{
			ResetDoor();
		}
	}
	else if ( VarName == nameof(Health) )
	{
    	UpdateHealthMICs();
    	// In case the door was destroyed and it was still welded
    	if( Health <= 0 )
    	{
            UpdateIntegrityMIC();
    	}
	}
	else if ( VarName == nameof(WeldIntegrity) || VarName == nameof(bShouldExplode) )
	{
     	UpdateIntegrityMIC();
	}
	else if ( VarName == nameof(HitCount) )
	{
		PlayTakeHitEffects();
	}
}

/*********************************************************************************************
 * @name	Initialization
 ********************************************************************************************* */

native function InitBrokenAttachment( StaticMeshComponent Attachment, KFKActorSpawnable SpawnedKActor );

/** The SkeletalMeshComponents Animations are being instanced from AnimTreeTemplate
* 	before PostInitAnimTree. Be sure to never set the Mesh's animations directly through
*	the package */
simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	MovementControl = SkelControlSingleBone(SkelComp.FindSkelControl('MovementControl'));
	BashSlot = AnimNodeSlot(SkeletalMeshComp.FindAnimNode('Slot_Bash'));

    // set open animation based on door mechanism
    InitSkelControl();
}

simulated event PostBeginPlay()
{
	local int i, NumActualDoors;

	Super.PostBeginPlay();

	Health = MaxHealth;
	LastUsedTime = WorldInfo.TimeSeconds - CooldownTime;	// Ensures doors can be used immediately

	// create ambient sound component if needed
	if (OpeningAmbientSound != None || ClosingAmbientSound != None)
	{
		AmbientSoundComponent = new(self) class'AkComponent';
		AttachComponent(AmbientSoundComponent);
	}

	InitializeDoorMIC();
	CenterWeldComponent.SetHidden(true);

	if( class'KFAIController'.default.bUseNavMesh )
	{
        //InitNavigationHandle();
    }

	for( i = 0; i < MeshAttachments.length; ++i )
	{
		if( MeshAttachments[i].Component.StaticMesh != none )
		{
			SoundOrigin += MeshAttachments[i].Component.Bounds.Origin;
			NumActualDoors++;
		}
	}

	if( NumActualDoors > 0 )
	{
		SoundOrigin /= NumActualDoors;
	}
	else
	{
		SoundOrigin = Location;
	}
}

/** Grab the doors materials and create MICs to visualize door damage */
simulated function InitializeDoorMIC()
{
	local MaterialInstanceConstant NewMIC;
	local byte i, MaterialIndex;

	if (HealthMICs.Length <= 0 && WorldInfo.NetMode != NM_DedicatedServer)
	{
		if ( MeshAttachments.Length > 0 )
		{
			for( MaterialIndex = 0; MaterialIndex < MeshAttachments[0].Component.GetNumElements(); MaterialIndex++ )
			{
				if( MeshAttachments[0].Component.GetMaterial(MaterialIndex) != none )
				{
					// We are not using "CreateAndSetMaterialInstanceConstant" because
					// a single MIC will be created for each MeshAttachment
					NewMIC = new class'MaterialInstanceConstant';
					NewMIC.SetParent( MeshAttachments[0].Component.GetMaterial(MaterialIndex) );

					HealthMICs.AddItem(NewMIC);

		        	// Apply the MIC to our door components
			        for ( i = 0; i < MeshAttachments.length; i++ )
			        {
				   	    MeshAttachments[i].Component.SetMaterial(MaterialIndex, NewMIC);
			   	    }
		   		}
			}
   	    }

   	    if ( CenterWeldComponent.GetMaterial(0) != none )
   	    {
   	    	IntegrityMIC = CenterWeldComponent.CreateAndSetMaterialInstanceConstant( 0 );
	   	    IntegrityMIC.SetScalarParameterValue('doorWeld', 0.f);
   	    }
	}
}

/** Set up skel control for open/close */
simulated function InitSkelControl()
{
	MovementControl.BlendInTime = OpenBlendTime;
	MovementControl.BlendOutTime = OpenBlendTime;
	switch (DoorMechanism)
	{
	case EDM_Hinge:
		MovementControl.bApplyTranslation = false;
		MovementControl.bApplyRotation = true;
		MovementControl.BoneRotation.Yaw = HingedRotation * DegToUnrRot;
		break;
	case EDM_Slide:
		MovementControl.bApplyTranslation = true;
		MovementControl.bApplyRotation = false;
		MovementControl.BoneTranslation.Y = SlideTranslation;
		MovementControl.BoneTranslation.Z = 0;
		break;
	case EDM_Lift:
		MovementControl.bApplyTranslation = true;
		MovementControl.bApplyRotation = false;
		MovementControl.BoneTranslation.Y = 0;
		MovementControl.BoneTranslation.Z = LiftTranslation;
		break;
	}
}

/*********************************************************************************************
 * @name	Open / Close
 ********************************************************************************************* */

/** Returns true if door is open or destroyed */
native function bool IsCompletelyOpen() const;

/** Handling Toggle event from Kismet. */
simulated function OnToggle(SeqAct_Toggle action)
{
	if ( bAutomaticDoor )
		return;

	if (action.InputLinks[0].bHasImpulse && WeldIntegrity <= 0)
	{
		OpenDoor(None);
	}
	else if (action.InputLinks[1].bHasImpulse)
	{
		CloseDoor();
	}
	else if (action.InputLinks[2].bHasImpulse)
	{
		UseDoor(None);
	}
}

/** Server only */
function UseDoor(Pawn P)
{
	// Doors cannot be used until the cooldown time has passed
	if ( `TimeSince(LastUsedTime) < CooldownTime)
	{
		return;
	}

	if ( bAutomaticDoor )
		return;

	if ( bIsDoorOpen )
	{
		CloseDoor();
	}
	else if ( WeldIntegrity <= 0 )
	{
		OpenDoor(P);
	}
	LastUsedTime = WorldInfo.TimeSeconds;
}

/** automatic doors open when bumped */
event Bump( Actor Other, PrimitiveComponent OtherComp, Vector HitNormal )
{
	local Pawn P;

	if ( bAutomaticDoor && !bIsDoorOpen && Role == ROLE_Authority )
	{
		P = Pawn(Other);
		if ( P != None && WeldIntegrity <= 0 )
		{
			OpenDoor(P);
			SetTimer(3.f, false, nameof(CloseDoor));
		}
	}

`if(`__TW_PATHFINDING_)
	if( KFPawn(Other) != none && !KFPawn(Other).IsHumanControlled() )
	{
		`AILog_Ext( GetFuncName()$" "$self$" by "$KFPawn(Other).MyKFAIC, 'Doors',  KFPawn(Other).MyKFAIC );
	}
`endif
}

/** Initiate door opening animation */
simulated private function OpenDoor(Pawn P)
{
	if ( bIsDestroyed || WeldIntegrity > 0 )
	{
	 	return;
	}

	bIsDoorOpen = true;
	bForceNetUpdate = true;
	bDoorMoveCompleted = false;

	if ( DoorMechanism == EDM_Hinge )
	{
		OpenSwingingDoor(P);
	}

	//if( MyNavMeshObstacle != none )
	//{
	//	MyNavMeshObstacle.SetEnabled(false);
	//}

	SetTickIsDisabled(false);
	PlayMovingSound(false);
	MovementControl.SetSkelControlActive(true);
}

/** Determine direction of hinge and push pawns back */
simulated private function OpenSwingingDoor(Pawn P)
{
	local vector X, Y, Z;
	local int DefaultYaw;

	if ( Role == ROLE_Authority )
	{
		GetAxes(Rotation, X, Y, Z);

		// (Server Only) if the animation is not playing update hinge direction
		if ( P != None && MovementControl.BlendTimeToGo <= 0 )
		{
			bReverseHinge = (X dot (P.Location - Location) > 0.f) ? false : true;
		}
	}
	DefaultYaw = Abs(MovementControl.BoneRotation.Yaw);
	MovementControl.BoneRotation.Yaw = ( bReverseHinge ) ? -DefaultYaw : DefaultYaw;
}

/** To close the door, just reverse the animation */
simulated private function CloseDoor()
{
	if ( bIsDestroyed )
	{
	 	return;
	}

	bIsDoorOpen = false;
	bForceNetUpdate = true;
	bDoorMoveCompleted = false;

	SetTickIsDisabled(false);
	PlayMovingSound(true);

	//if( MyNavMeshObstacle != none )
	//{
	//	MyNavMeshObstacle.SetEnabled(true);
	//}

	MovementControl.SetSkelControlActive(false);

	if ( DoorMechanism == EDM_Hinge )
	{
		SetTimer(OpenBlendTime * 0.65, false, nameof(TryPushPawns));
	}
	else
	{
		SetTimer(OpenBlendTime * 0.5, false, nameof(TryPushPawns));
	}
}

/** Notification when a door finishes opening or closing */
event NotifyDoorMoveCompleted( bool bOpened )
{
    if( bOpened )
    {
        OnOpenFinish();
    }
    else
    {
        OnCloseFinish();
    }

    SetRBCollideWithDeadPawn(!bOpened);
}

/** Called once we've finished opening the door */
function OnOpenFinish()
{
	local DoorMarker DoorNav;

	if (AmbientSoundComponent != None)
	{
		AmbientSoundComponent.StopEvents();
	}

	DoorNav = DoorMarker(MyMarker);
	if (DoorNav != None)
	{
		if( bMonitorDoor )
		{
			NotifyAIDoorOpened();
		}
		DoorNav.MoverOpened();
	}

	if (OpenedSound != None)
	{
		PlaySoundBase(OpenedSound,,,, SoundOrigin);
	}	
}

/** Called once we've finished closing the door */
function OnCloseFinish()
{
	local DoorMarker DoorNav;

	if (AmbientSoundComponent != None)
	{
		AmbientSoundComponent.StopEvents();
	}

	DoorNav = DoorMarker(MyMarker);
	if (DoorNav != None)
	{
		DoorNav.MoverClosed();
	}

	if (ClosedSound != None)
	{
		PlaySoundBase(ClosedSound,,,, SoundOrigin);
	}	
}

/*********************************************************************************************
 * @name	Momentum Push
 ********************************************************************************************* */

// Used when a pawn is standing ontop of a door
function vector GetPushDirection( Vector PawnLocation )
{
	local bool bInFrontOfDoor;
	local vector DoorX, DoorY, DoorZ, PushDir;

    GetAxes(Rotation, DoorX, DoorY, DoorZ);
	bInFrontOfDoor = ( DoorX dot ( PawnLocation - Location ) > 0.f );

	PushDir = SlidingPushForce * DoorX;
	PushDir *= ( bInFrontOfDoor ) ? 1 : -1;
	PushDir.z = 50;

	return PushDir;
}

/** Called only if a a door closes on a pawn*/
private function TryPushPawns()
{
	local Pawn P;
	local bool bInFrontOfDoor;
	local vector DoorX, DoorY, DoorZ, PushDir;
	local rotator DoorYRot;

    GetAxes(Rotation, DoorX, DoorY, DoorZ);
	DoorYRot = rotator(DoorY);

	foreach WorldInfo.AllPawns( class'Pawn', P, Location, DoorWidth )
	{
		if ( !P.IsAliveAndWell() )
			continue;

		if( !bIsDoorOpen && P.IsPlayerOwned() )
		{
			if( PointDistToPlane( Location, DoorYRot, P.Location ) < HumanPushDistance )
			{
				bInFrontOfDoor = (DoorX dot (P.Location - Location) > 0.f);
				PushDir = SlidingPushForce * DoorX;

	   			if( DoorMechanism == EDoorMechanism.EDM_Hinge )
				{
					if ( bReverseHinge )
					{
	                    PushDir *= -1;
					}
				}
				else
				{
					PushDir *= ( bInFrontOfDoor ) ? 1 : -1;
				}

				P.AddVelocity( PushDir, P.Location, class'KFDT_Bludgeon');
			}
		}
		// prevent closing on an AI
		else if ( !bIsDoorOpen )
		{
			if( PointDistToPlane( Location, DoorYRot, P.Location ) < (0.85 * P.CylinderComponent.default.CollisionRadius) )
			{
				OpenDoor(None);
			}
		}
	}
}

/*********************************************************************************************
 * @name	Damage and Welding
 ********************************************************************************************* */

/** When welded shut, do damage to the door */
event TakeDamage(int Damage, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local KFPawn_Monster KFPM;
	local KFCharacterInfo_Monster MonsterInfo;

	if ( Role < ROLE_Authority )
	{
		return;
	}

	// call Actor's version to handle any SeqEvent_TakeDamage for scripting
	Super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);

    // Check for AI damage
	if ( bIsDestroyed || EventInstigator == none ||
		( EventInstigator.bIsPlayer && class<KFDT_Explosive>(DamageType) == none ) )	// If the player deals any damage other than explosive return
	{
		return;
	}

	// If the door is welded damage the health and the weld integrity
	if ( WeldIntegrity > 0 )
	{
		KFPM = KFPawn_Monster(DamageCauser);
		if( KFPM != none )
		{
			MonsterInfo = KFPM.GetCharacterMonsterInfo();
			if( MonsterInfo != none )
			{
				PlaySoundBase(GetSoundEffectFromType(MonsterInfo),,,, SoundOrigin);
			}
		}

		if ( Health > 0 )
		{
			Health = Max(Health - Damage, 0 );
			UpdateHealthMICs();
		}

		WeldIntegrity = Max(WeldIntegrity - Damage, 0);
		UpdateIntegrityMIC();

		// if weld is broken
		if ( WeldIntegrity <= 0 || Health <= 0 )
		{
			WeldIntegrity = 0;
			DemoWeld = 0;
			Health = 0;

			//UpdateHealthMICs();
            UpdateIntegrityMIC();

			// Weld and health are gone, destroy the door!
			PlayDestroyed();

			if( MyMarker != none && bMonitorDoor )
			{
				`RecordAIDestroyedDoor( KFAIController(EventInstigator), self, "Health:"$Health );
				NotifyAIDoorOpened();
			}
		}

		`RecordKFDoorWeld(Damage, MaxWeldIntegrity, WeldIntegrity, None, EventInstigator, self);

		if ( !bIsDestroyed )
		{
			IncrementHitCount( EventInstigator.Pawn );
			PlayTakeHitEffects();
		}

		`SafeDialogManager.PlayDoorTakeDamageDialog( self );

		LastHitTime = WorldInfo.TimeSeconds;
		bForceNetUpdate = true;
	}
	// failsafe for AI deciding to attack the door instead of opening it
	else if ( !bIsDoorOpen )
	{
		OpenDoor(EventInstigator.Pawn);
	}
}

/** Increase the weld integrity - Network: Server only */
function FastenDoor(int Amount, optional KFPawn Welder)
{
	local KFPlayerController PC;
	local KFPerk WelderPerk;

	if ( bIsDestroyed )
	{
		return;
	}

	// handle unfasten
	if ( Amount < 0 )
	{
		if ( WeldIntegrity > 0 )
		{
			WeldIntegrity = Max(WeldIntegrity + Amount, 0);
			UpdateIntegrityMIC();
			bForceNetUpdate = true;

			if( !BeingWelded() )
			{
				if( !BeingUnwelded() )
				{
					WelderPawn = Welder;
				}
			}

			`SafeDialogManager.PlayUnweldDialog( Welder, self, WelderPawn );

			if( WelderPawn == Welder )
			{
				LastUnweldTime = WorldInfo.TimeSeconds;
			}
		}
		
		if( WeldIntegrity <= 0 )
		{
			bShouldExplode = false;
			DemoWeld = 0;
			ExplosionInstigatorController = none;
		}
	}
	// handle fasten
	else if ( !bIsDoorOpen && WeldIntegrity < MaxWeldIntegrity )
	{
		PC = KFPlayerController(Welder.Controller);
		if ( PC != None )
		{
			PC.AddWeldPoints(Amount);
		}

		// reduce weld strength if it's being attacked
		if ( UnderAttack() )
		{
			Amount *= CombatWeldModifier;
		}

		WelderPerk = PC.GetPerk();
		if( WelderPerk != none && WelderPerk.CanExplosiveWeld() )
		{
			AddExplosiveWeld( Amount, PC );
		}
		
		WeldIntegrity = Min( WeldIntegrity + Amount, MaxWeldIntegrity );
		UpdateIntegrityMIC();
		bForceNetUpdate = true;

		if( !BeingUnwelded() )
		{
			if( !BeingWelded() )
			{
				WelderPawn = Welder;
			}
		}

		`SafeDialogManager.PlayWeldDialog( Welder, self, WelderPawn );

		if( WelderPawn == Welder )
		{
			LastWeldTime = WorldInfo.TimeSeconds;
		}
	}
	else if ( bIsDoorOpen )
	{
		CloseDoor();
	}

	/* __TW_ANALYTICS_ */
	if ( !bIsDoorOpen )
	{
		`RecordKFDoorWeld(Amount, MaxWeldIntegrity, WeldIntegrity, Welder.Controller, None, self)
	}
}

function AddExplosiveWeld( int Amount, KFPlayerController PC )
{
	DemoWeld = Min( DemoWeld + Amount, DemoWeldRequired );
	if( DemoWeld >= DemoWeldRequired && !bShouldExplode )
	{
		ExplosionInstigatorController = PC;
		bShouldExplode = true;
	}
}

/*********************************************************************************************
 * @name	Animation & FX
 ********************************************************************************************* */

/**
 * This function's responsibility is to signal clients to play hit effects on the door
 *
 * Network: Server
 */
function IncrementHitCount( Pawn P )
{
	local vector X, Y, Z;

	if ( !bIsDoorOpen && P != none )
	{
		bForceNetUpdate = true;
	    GetAxes(Rotation, X, Y, Z);
	    HitCount++;

	    if (X dot (P.Location - Location) > 0.f)
		{
			// Set the last bit to indicate the hit direction
	     	HitCount = HitCount | HIT_DIRECTION_FLAG;
		}
		else
		{
			// Clear out the last bit to indicate the hit direction
	     	HitCount = HitCount & byte(~HIT_DIRECTION_FLAG);
		}
	}
}

/** Play bash animations, particle effects, and destruction effects */
simulated function PlayTakeHitEffects()
{
	local name AnimName;
	local bool bReverseDir; // if true rotate the direction of the particle effect and bash anim

	if ( bIsDestroyed || bIsDoorOpen || WorldInfo.NetMode == NM_DedicatedServer )
	{
	 	return;
	}

    SetTickIsDisabled(false);

	if ( `TimeSince(CreationTime) > 1.0f && ActorEffectIsRelevant(Instigator, false) )
	{
		bReverseDir = (HitCount & HIT_DIRECTION_FLAG) > 0;
		AnimName = GetBashAnimName(bReverseDir);
		BashSlot.PlayCustomAnim( AnimName, 1.f );
		SpawnParticlesFromEffectParam( DamageEmitter, bReverseDir );
	}
}

/** Returns name of animation to play when hit by zed */
simulated function name GetBashAnimName(bool bReverse)
{
	if ( DoorMechanism == EDM_Hinge )
	{
		return (bReverse) ? BashHingedAnim_F : BashHingedAnim_B;
	}
	return (bReverse) ? BashSlidingAnim_F : BashSlidingAnim_B;
}

/** Spawn and offset particle effects according to how the mapper set it up */
simulated function SpawnParticlesFromEffectParam( DestroyedEffectParams EffectParam, optional bool bReverseDir )
{
	local Vector Loc;
	local Rotator Rot;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	if ( EffectParam.ParticleEffect != none )
	{
		Loc = Location + EffectParam.RelativeOffset;
	    Rot = Rotation + EffectParam.RelativeRotation;
	    Rot.Yaw += ( bReverseDir ) ? 32768 : 0;
		WorldInfo.MyEmitterPool.SpawnEmitter(EffectParam.ParticleEffect, Loc, Rot);
	}
}

/** Activates the doors physics assets and particles once a door is destroyed */
simulated function PlayDestroyed()
{
	bForceNetUpdate = true;
    SetTickIsDisabled(false);

	bIsDestroyed = true;

	if ( DestroyedSound != None )
	{
		PlaySoundBase(DestroyedSound,,,, SoundOrigin);
	}

	if ( DoorMechanism == EDM_Hinge )
	{
      	DestroyHingedDoor();
	}
	else
	{
    	DestroyNonPhysicsDoor();
	}

	if( bShouldExplode )
	{
		//blowup
		PlayExplosion();
		bShouldExplode = false;
	}
}

simulated function PlayExplosion()
{
	local KFExplosionActorReplicated ExploActor;
	local GameExplosion	ExplosionTemplate;
	local KFPawn ExplosionInstigator;

	if ( Role < ROLE_Authority )
	{
		return;
	}

	// explode using the given template
	ExploActor = Spawn(class'KFExplosionActorReplicated', self,, Location + vect(0,0,100),,, true);
	if( ExploActor != None )
	{
		ExploActor.InstigatorController = ExplosionInstigatorController;
		
		ExplosionInstigator = KFPawn(ExplosionInstigatorController.Pawn);
		if( ExplosionInstigator != none )
		{
			ExploActor.Instigator = ExplosionInstigator;
		}
		
		ExplosionTemplate = class'KFPerk_Demolitionist'.static.GetDoorTrapsExplosionTemplate();
		ExplosionTemplate.MyDamageType = class'KFPerk_Demolitionist'.static.GetDoorTrapsDamageTypeClass();
		ExploActor.Explode( ExplosionTemplate );
	}	
}

/** If the door is sliding or lifting then only play particle effects and open the door */
simulated function DestroyNonPhysicsDoor()
{
	local byte i;

	for( i = 0; i < DestroyedEmitters.Length; i++ )
	{
		SpawnParticlesFromEffectParam( DestroyedEmitters[i] );
	}

	// @todo: move to destroyed (use blend in time)
	if ( DoorMechanism == EDM_Slide )
	{
		BashSlot.PlayCustomAnim('Door_Slide_broken', 1.f, 0.15f, 0.2f, true, true);
    }
}

/** Restore all doors to the way they were at the start of a map */
simulated function ResetDoor()
{
    bIsDestroyed = false;
 	bForceNetUpdate = true;
    SetTickIsDisabled(false);

   	if ( DoorMechanism == EDM_Hinge )
	{
      	ResetHingedDoor();
	}
	else
	{
		BashSlot.StopCustomAnim( 0 );
	}

	Health = MaxHealth;
	WeldIntegrity = 0;
	DemoWeld = 0;
	ExplosionInstigatorController = none;
	bShouldExplode = false;

	UpdateHealthMICs();
	UpdateHealthScalars('doorHealthA', 0);
	UpdateHealthScalars('doorHealthB', 0);
	UpdateHealthScalars('doorHealthC', 0);
	UpdateHealthScalars('doorHealthD', 0);
}

/** As the door takes damage, scale its damage paramaters to make it look more beaten */
simulated function UpdateHealthMICs()
{
	local float HealthScaler;

	// Leave the MIC alone when destroyed.  Otherwise, when health is automatically
	// zeroed because of a broken weld there will be a pop (bug #24270)
	if ( Health <= 0 )
	{
		return;
	}

	if ( HealthMICs.Length > 0 )
	{
		HealthScaler = 1.f - (float(Health) / float(MaxHealth));

		// Stagger the door damage parameters and scale them so they will reach 1.f at the same time
		UpdateHealthScalars('doorHealthA', HealthScaler);
		if ( HealthScaler >= 0.25f )
		{
			UpdateHealthScalars('doorHealthB', ( HealthScaler - 0.25f ) * 1.32f);
		}
		if ( HealthScaler >= 0.5f )
		{
			UpdateHealthScalars('doorHealthC', ( HealthScaler - 0.5f ) * 2.f);
		}
		if ( HealthScaler >= 0.75f )
		{
			UpdateHealthScalars('doorHealthD', ( HealthScaler - 0.75f ) * 4.f);
		}
	}
}

/** Iterates over all stored health mics and updates their health scalars */
simulated function UpdateHealthScalars(name ScalarName, float Value)
{
	local byte i;

	for( i = 0; i < HealthMICs.Length; i++ )
	{
		HealthMICs[i].SetScalarParameterValue(ScalarName, Value);
	}
}

/** As the door is welded, update the integrityMic to visualize how strong the weld is */
simulated function UpdateIntegrityMIC()
{
	local float IntegrityScaler, ExplosiveScaler;

	if ( IntegrityMIC != none )
	{
		// Have a minimum IntegrityScalar if we have any weld integrity so that
		// the weld will always be at least partially visible on the door
		if(WeldIntegrity > 0)
		{
			IntegrityScaler = FMax(float(WeldIntegrity) / float(MaxWeldIntegrity), MinWeldScalar);
		}
		else
		{
			IntegrityScaler = 0;
		}

		IntegrityMIC.SetScalarParameterValue('doorWeld', IntegrityScaler);
		
		ExplosiveScaler = bShouldExplode ? 1.f : 0.f;
		IntegrityMIC.SetScalarParameterValue( 'scalar_explosive', ExplosiveScaler );
				
		if( CenterWeldComponent.HiddenGame && WeldIntegrity > 0 )
		{
			CenterWeldComponent.SetHidden(false);
		}
		else if( !CenterWeldComponent.HiddenGame && WeldIntegrity <= 0 )
		{
			CenterWeldComponent.SetHidden(true);
		}
	}
}

/*********************************************************************************************
 * @name	RB Physics
 ********************************************************************************************* */

/** Since zeds can move through open doors we need to also allow their corpses to do the same */
simulated function SetRBCollideWithDeadPawn(bool bEnabled)
{
	local int i;

	// Apply the MIC to our door components
	for ( i = 0; i < MeshAttachments.length; i++ )
	{
		MeshAttachments[i].Component.SetRBCollidesWithChannel(RBCC_DeadPawn, bEnabled);
	}
}

/** Hinged doors are special and need to physics assets */
simulated function DestroyHingedDoor()
{
	local bool bReverseDir;  // if true rotate the direction of the particle effect and impulse
	local byte i;

	SkeletalMeshComp.bComponentUseFixedSkelBounds = false;

	// If the map was just loaded skip physics and go straight to hide
	if ( `TimeSince(CreationTime) > 1.0f )
	{
		bCallRigidBodyWakeEvents = true;
        bReverseDir = (HitCount & HIT_DIRECTION_FLAG) > 0;
		// Play the destroyed particle effect
		for( i = 0; i < DestroyedEmitters.Length; i++ )
		{
			SpawnParticlesFromEffectParam( DestroyedEmitters[i], bReverseDir );
		}

		SpawnBrokenDoors( bReverseDir );
	}
	else
	{
    	// If we are joining a game with broken doors, make them invisible
     	for( i = 0; i < MeshAttachments.Length; i++ )
		{
			MeshAttachments[i].Component.SetBlockRigidBody(false);
			MeshAttachments[i].Component.SetActorCollision(false, false);
			MeshAttachments[i].Component.SetHidden( true );
		}
	}
}

simulated function SpawnBrokenDoors( bool bReverseDir )
{
	local KFKActorSpawnable_Door SpawnedKActor;
	local Name BoneName;
	local vector DoorX, DoorY, DoorZ, InitAngVel;
	local Vector AttachmentLocation;
	local Rotator AttachmentRotation;
	local byte i;

	GetAxes(Rotation, DoorX, DoorY, DoorZ);
	DoorX *= ( bReverseDir ) ? -1 : 1;

	for( i = 0; i < MeshAttachments.Length; i++ )
	{
		BoneName = MeshAttachments[i].AttachTo;

		AttachmentLocation = SkeletalMeshComp.GetBoneLocation( BoneName ) + ( DoorX * KActorOffset );
		AttachmentRotation = QuatToRotator( SkeletalMeshComp.GetBoneQuaternion( BoneName ) ) + MeshAttachments[i].Component.Rotation;

		if( WorldInfo.NetMode != NM_DedicatedServer )
		{
			SpawnedKActor = Spawn(class'KFKActorSpawnable_Door', self,, AttachmentLocation, AttachmentRotation );
			if( SpawnedKActor != none && MeshAttachments[i].Component != none )
			{
				InitBrokenAttachment( MeshAttachments[i].Component, SpawnedKActor );

				SpawnedKActor.StaticMeshComponent.SetRBLinearVelocity( DoorX * BrokenDoorImpulse );

				// Set initial angular velocity
				InitAngVel.X = MaxAngularVelocity * FRand();
				InitAngVel.Y = MaxAngularVelocity * FRand();
				InitAngVel.Z = MaxAngularVelocity * FRand();
				SpawnedKActor.StaticMeshComponent.SetRBAngularVelocity( InitAngVel );

				// Start awake
				SpawnedKActor.StaticMeshComponent.WakeRigidBody();
			}
		}

		if( MeshAttachments[i].Component != none )
		{
			// Hide the original attachment
			MeshAttachments[i].Component.SetHidden( true );
			MeshAttachments[i].Component.SetBlockRigidBody(false);
			MeshAttachments[i].Component.SetActorCollision(false, false);
		}
	}
}

/** Hinged doors are special and need to reset physics pieces and collision */
simulated function ResetHingedDoor()
{
	local byte i;

 	for( i = 0; i < MeshAttachments.Length; i++ )
	{
		MeshAttachments[i].Component.SetBlockRigidBody(true);
		MeshAttachments[i].Component.SetActorCollision(true, true);
		MeshAttachments[i].Component.SetHidden( false );
	}

	SkeletalMeshComp.bComponentUseFixedSkelBounds = TRUE;
}

/*********************************************************************************************
 * @name	Dialog & Sound
 ********************************************************************************************* */

/** Based on InterpActor::PlayMovingSound */
simulated private function PlayMovingSound(bool bClosing)
{
	local AkBaseSoundObject SoundToPlay;
	local AkBaseSoundObject AmbientToPlay;

	if (bClosing)
	{
		SoundToPlay = CloseSound;
		AmbientToPlay = OpeningAmbientSound;
	}
	else
	{
		SoundToPlay = OpenSound;
		AmbientToPlay = ClosingAmbientSound;
	}

	if (SoundToPlay != None)
	{
		PlaySoundBase(SoundToPlay, true,,, SoundOrigin);
	}

	if (AkEvent(AmbientToPlay) != None)
	{
		AmbientSoundComponent.StopEvents();
		AmbientSoundComponent.PlayEvent( AkEvent(AmbientToPlay) );
	}
}

function AkEvent GetSoundEffectFromType(KFCharacterInfo_Monster DamagingMonsterInfo)
{
	switch (DoorMaterial)
	{
		case EDMT_Metal:
			return DamagingMonsterInfo.DoorHitSound.Metal;
			break;
		case EDMT_Wood:
			return DamagingMonsterInfo.DoorHitSound.Wood;
			break;
	}
}

function bool UnderAttack()
{
	return `TimeSince(LastHitTime) < CombatLength;
}

function bool BeingWelded()
{
	return (LastWeldTime > LastUnweldTime) && (`TimeSince(LastWeldTime) < 0.75f);
}

function bool BeingUnwelded()
{
	return (LastUnweldTime > LastWeldTime) && (`TimeSince(LastUnweldTime) < 0.75f);
}

/*********************************************************************************************
 * @name	AI Behavior & Navigation
 ********************************************************************************************* */

event NotifyPathChanged();

/** Door is welded shut*/
function bool WeldedShut()
{
    return !IsCompletelyOpen() && WeldIntegrity > 0;
}

/** Alerts NPCs that door they're waiting for has been destroyed or opened */
function NotifyAIDoorOpened()
{
	local DoorMarker DoorNav;
	local KFAIController KFAIC;

	DoorNav = DoorMarker( MyMarker );
	if( DoorNav != None )
	{
		if( bMonitorDoor )
		{
			// notify any Controllers with us as PendingDoor that we have finished moving
			foreach WorldInfo.AllControllers(class'KFAIController', KFAIC)
			{
				if( KFAIC.PendingDoor == self )
				{
					KFAIC.DoorFinished();
				}
 				// Notify other NPCs who might have been waiting around for another door [WIP]
// 				else if( C.PendingDoor != none && C.PendingDoor != self && C.PendingDoor.WeldIntegrity > 0 )
// 				{
// 					MTG = AICommand_MoveToGoal( C.GetActiveCommand() );
// 					if( MTG != none )
// 					{
// 						MTG.bValidRouteCache = false;
// 						C.bReevaluatePath = true;
// 						MTG.CreateTemporaryBlockedPath( C.PendingDoor.MyMarker );
// 						C.ForcePauseAndRepath();
// 					}
// 				}
			}
		}
		DoorNav.MoverOpened();
	}
}

/*********************************************************************************************
 * @name	HUD
 ********************************************************************************************* */

simulated event DrawTemporaryWeldIcon( HUD HUD, Canvas C )
{
	local PlayerController	PC;
	local Canvas	Canvas;
	local Vector	CameraLoc, ScreenLoc;
	local Rotator	CameraRot;
	local String	Str;
	local float		X, Y;
	local FontRenderInfo FRI;
	local float DOT;
	local Texture2D Icon;
	local int WeldPercentage;
	local float FontScale;

	PC = HUD.PlayerOwner;
	Canvas = C; //HUD.Canvas;
	Canvas.SetDrawColor(255,255,255);
	Canvas.Font = class'KFGameEngine'.Static.GetKFCanvasFont();
	// project location onto the hud
	PC.GetPlayerViewPoint( CameraLoc, CameraRot );

	Dot = vector(CameraRot) dot (Location - CameraLoc);
	if( Dot < 0.5f )
	{
		return;
	}
	ScreenLoc = Canvas.Project( Location + (vect(0,0,1) * 164.f) );
	if( ScreenLoc.X < 0 || ScreenLoc.X >= HUD.Canvas.ClipX || ScreenLoc.Y < 0 && ScreenLoc.Y >= HUD.Canvas.ClipY)
	{
		return;
	}
	Icon = Texture2D'UI_World_TEX.welder_door_icon';
	Canvas.SetPos(ScreenLoc.X - Icon.SizeX / 2, ScreenLoc.Y - Icon.SizeY / 2, ScreenLoc.Z);
	Canvas.DrawTexture( Icon, 1.f );

	X = ScreenLoc.X + Icon.SizeX/2 + 5;
	Y = ScreenLoc.Y - Icon.SizeY/2;
	Canvas.SetPos( X, Y );

	// Display weld integrity as a percentage
	FontScale = class'KFGameEngine'.Static.GetKFFontScale();
	WeldPercentage = float(WeldIntegrity) / float(MaxWeldIntegrity) * 100.0;
	Str = WeldIntegrityString@WeldPercentage$"%";
	Canvas.DrawText( Str, TRUE, FontScale, FontScale, FRI );

	if( DemoWeld > 0 && !bShouldExplode )
	{
		Canvas.SetPos( X, Y + 20.f );	
		WeldPercentage = float(DemoWeld) / float(DemoWeldRequired) * 100.0;
		Str = ExplosiveString @ WeldPercentage $ "%";
		Canvas.DrawText( Str, TRUE, FontScale, FontScale, FRI );		
	}
}

defaultproperties
{
	Begin Object Class=SpriteComponent Name=Sprite
		Sprite=Texture2D'EditorResources.door'
		HiddenGame=true
		AlwaysLoadOnClient=False
		AlwaysLoadOnServer=False
		Translation=(X=40,Z=40)
	End Object
	Components.Add(Sprite)

	bDoorMoveCompleted=True

	OpenBlendTime=0.5f
	HingedRotation=90
	SlideTranslation=-100
	LiftTranslation=245

	// actor
	Physics=PHYS_None
	bEdShouldSnap=true
	bStatic=false
	bNoDelete=true
	bTickIsDisabled=true
	CooldownTime=0.5f

	// network
	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=true
	bOnlyDirtyReplication=true
	bSkipActorPropertyReplication=true
	bIgnoreNetRelevancyCollision=true
	NetUpdateFrequency=0.1	// uses bForceNetUpdate
	bReplicateRigidBodyLocation=true

	// collision
	bCollideActors=true
	bBlockActors=true
	bWorldGeometry=true
	bCollideWorld=false
	bNoEncroachCheck=true
	bProjTarget=true
	bCanStepUpOn=false

	// health
	MaxHealth=4000
	MaxWeldIntegrity=1500
	CombatWeldModifier=0.6
	bCanBeDamaged=true
	CombatLength=1.25
	MinWeldScalar=0.08

	// Explosive weld
	DemoWeldRequired=500

	// forces
	BrokenDoorImpulse=750
	MaxAngularVelocity=2

	// ---------------------------------------------
	// Door Meshes

    FrameSizeOfTwoDoors=SkeletalMesh_Width
	Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0
		bUseTickOptimization=FALSE	// need to turn this off because there is no skeletal geometry
		SkeletalMesh=SkeletalMesh'ENV_Doors_Mesh.ENV_Door_Base'
		AnimSets(0)=AnimSet'ENV_Doors_ANIM.Door_Base_Animation'
		AnimTreeTemplate=AnimTree'ENV_Doors_ANIM.ENV_Doors_AnimTree'
		Animations=none
		BlockRigidBody=false
		HiddenGame=true
		HiddenEditor=true
		CollideActors=TRUE
	End Object
 	CollisionComponent=SkeletalMeshComponent0
	SkeletalMeshComp=SkeletalMeshComponent0
	Components.Add(SkeletalMeshComponent0)

	Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
		bAllowApproximateOcclusion=TRUE
		bForceDirectLightMap=TRUE
		bUsePrecomputedShadows=TRUE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
		// Collision
		CollideActors=TRUE
		BlockActors=TRUE
		BlockRigidBody=TRUE
		RBChannel=RBCC_GameplayPhysics
		RBCollideWithChannels=(Default=TRUE,GameplayPhysics=TRUE,EffectPhysics=TRUE,DeadPawn=TRUE,Pickup=TRUE,FlexAsset=TRUE)
	End Object

	Begin Object Class=StaticMeshComponent Name=StaticMeshComponent1
		bAllowApproximateOcclusion=TRUE
		bForceDirectLightMap=TRUE
		bUsePrecomputedShadows=TRUE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
		Rotation=(Pitch=32768) // compensate for bone orientation (for uniform SkelControl)
		// Collision
		CollideActors=TRUE
		BlockActors=TRUE
		BlockRigidBody=TRUE
		RBChannel=RBCC_GameplayPhysics
		RBCollideWithChannels=(Default=TRUE,GameplayPhysics=TRUE,EffectPhysics=TRUE,DeadPawn=TRUE,Pickup=TRUE,FlexAsset=TRUE)
	End Object

	Begin Object Class=StaticMeshComponent Name=StaticMeshComponent2
		bAllowApproximateOcclusion=TRUE
		bForceDirectLightMap=TRUE
		bUsePrecomputedShadows=TRUE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
		CollideActors=FALSE
		BlockRigidBody=FALSE
	End Object
    CenterWeldComponent=StaticMeshComponent2

	MeshAttachments.Add((Component=StaticMeshComponent0, AttachTo=DoorLeft))
	MeshAttachments.Add((Component=StaticMeshComponent1, AttachTo=DoorRight))

	//NavigationHandleClass=class'KFNavigationHandle'
}
