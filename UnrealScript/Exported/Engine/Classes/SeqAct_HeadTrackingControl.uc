/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_HeadTrackingControl extends SequenceAction
	native(Sequence);

/** SkelControlLookAt name in the AnimTree of the SkeletalMesh **/
var() array<name>  TrackControllerName;

/** Will pick up actor within this radius **/
var() float LookAtActorRadius;

/** Interp back to zero strength if limit surpassed */
var() bool	bDisableBeyondLimit;

/** How long can one person to look at one **/
var() float MaxLookAtTime;

/** At least this time to look at one **/
var() float MinLookAtTime;

/** Once entered the radius, how long do I really care to look  ? This affects rating. It will give benefit to the person who just entered **/
var() float MaxInterestTime;

/** Quick check box for allowing it to look Pawn - due to Pawn not being listed in the Actor class **/
var(Target) bool bLookAtPawns;

/** Actor classes to look at as 0 index being the highest priority if you have anything specific **/
var(Target) array< class<Actor> >  ActorClassesToLookAt;

/** Target Bone Names, where to look at - priority from top to bottom, if not found, it will continue search **/
var(Target) array<name>     TargetBoneNames;

/** List of objects to call the handler function on */
var() array<Object> LookAtTargets;

/** Array of actor information **/
var private const transient native map{class AActor*,class UHeadTrackingComponent*} ActorToComponentMap;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * Return the version number for this class.  Child classes should increment this method by calling Super then adding
 * a individual class version to the result.  When a class is first created, the number should be 0; each time one of the
 * link arrays is modified (VariableLinks, OutputLinks, InputLinks, etc.), the number that is added to the result of
 * Super.GetObjClassVersion() should be incremented by 1.
 *
 * @return	the version number for this specific class.
 */
static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

/**
 * Called when this event is activated.
 */
event Activated()
{
	local PlayerController	PC;
	local int				I, NumOfMember;
	local class				ActorClassesToLookAtParam[10];
	local name				TargetBoneNamesParam[10], TrackControllerNameParam[10];
	local Actor				TriggerActor, LocalActor;

	for (I=0; I<Targets.Length && TriggerActor==none ; ++I)
	{
		TriggerActor = Actor(Targets[I]);
	}

	if (TriggerActor==none)
	{
		return;
	}

	if (InputLInks[0].bHasImpulse)
	{
		NumOfMember = Min(TrackControllerName.Length, 10);
		for (I=0; I<NumOfMember; ++I)
		{
			TrackControllerNameParam[I] = TrackControllerName[I];
		}

		NumOfMember = Min(ActorClassesToLookAt.Length, 10);
		for (I=0; I<NumOfMember; ++I)
		{
			ActorClassesToLookAtParam[I] = ActorClassesToLookAt[I];
		}

		NumOfMember = Min(TargetBoneNames.Length, 10);
		for (I=0; I<NumOfMember; ++I)
		{
			TargetBoneNamesParam[I] = TargetBoneNames[I];
		}

		// Iterate through the controllers telling them to write stats
		foreach TriggerActor.WorldInfo.AllControllers(class'PlayerController',PC)
		{
			if (PC.IsLocalPlayerController() == false)
			{
				for(I=0; I<Targets.Length; ++I)
				{
					LocalActor = Actor(Targets[I]);
					if (LocalActor!=none)
					{
						PC.EnableActorHeadTracking(LocalActor, TrackControllerNameParam, ActorClassesToLookAtParam, bLookAtPawns, MinLookAtTime, MaxLookAtTime, MaxInterestTime, LookAtActorRadius, TargetBoneNamesParam);
					}
				}
			}
		}
	}
	else
	{
		// Iterate through the controllers telling them to write stats
		foreach TriggerActor.WorldInfo.AllControllers(class'PlayerController',PC)
		{
			if (PC.IsLocalPlayerController() == false)
			{
				for(I=0; I<Targets.Length; ++I)
				{
					LocalActor = Actor(Targets[I]);
					if (LocalActor!=none)
					{
						PC.DisableActorHeadTracking(LocalActor);
					}
				}
			}
		}
	}
	Super.Activated();
}

defaultproperties
{
   TrackControllerName(0)="HeadLook"
   TrackControllerName(1)="LeftEyeLook"
   TrackControllerName(2)="RightEyeLook"
   LookAtActorRadius=500.000000
   bDisableBeyondLimit=True
   bLookAtPawns=True
   MaxLookAtTime=5.000000
   MinLookAtTime=3.000000
   MaxInterestTime=7.000000
   TargetBoneNames(0)="b_MF_Head"
   TargetBoneNames(1)="b_MF_Neck"
   bCallHandler=False
   bAutoActivateOutputLinks=False
   InputLinks(0)=(LinkDesc="Enable")
   InputLinks(1)=(LinkDesc="Disable")
   OutputLinks(0)=(LinkDesc="Enabled")
   OutputLinks(1)=(LinkDesc="Disabled")
   ObjName="HeadTracking Control"
   ObjCategory="Actor"
   Name="Default__SeqAct_HeadTrackingControl"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
