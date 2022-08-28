//=============================================================================
// KFUsableTrigger
//=============================================================================
// A generic trigger that can be activated by players and can send notifications
// to objects that can receive notification of activation
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFUsableTrigger extends Trigger_PawnsOnly
	implements(KFInterface_Usable)
	placeable;

var bool bActive;
var int TriggeredCount;

/* The type of interaction message that appears when standing in the trigger */
var() EInteractionMessageType InteractionType;
/* The number of times this trigger can be used before being deactivated */
var() int MaxTriggeredCount<ClampMin=0>;
/* Objects that can receive a notification when this trigger is used */
var() array<KFInterface_UsableTriggerTarget> Targets;

replication
{
	if (bNetDirty)
		bActive;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
// KFInterface_Usable

/** Checks if this actor is presently usable */
simulated function bool GetIsUsable(Pawn User)
{
	return bActive;
}

/** Return the index for our interaction message. */
function int GetInteractionIndex(Pawn User)
{
	return InteractionType;
}

// end KFInterface_Usable
//////////////////////////////////////////////////////////////////////////////////////////////////////

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	Super.Touch(Other, OtherComp, HitLocation, HitNormal);
	if (Role == ROLE_Authority)
	{
		class'KFPlayerController'.static.UpdateInteractionMessages(Other);
	}
}

simulated event UnTouch(Actor Other)
{
	super.UnTouch( Other );
	if (Role == ROLE_Authority)
	{
		class'KFPlayerController'.static.UpdateInteractionMessages(Other);
	}
}

function bool UsedBy(Pawn User)
{
	local KFInterface_UsableTriggerTarget Target;

	if (MaxTriggeredCount == 0 || TriggeredCount < MaxTriggeredCount)
	{
		foreach Targets(Target)
		{
			Target.TriggerTarget(self, User);
		}

		if (TriggeredCount++ == MaxTriggeredCount)
		{
			bActive = false;
		}

		return true;
	}

	return false;
}

function AddTriggerHook(KFInterface_UsableTriggerTarget Target)
{
	Targets.AddItem(Target);
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Trigger_PawnsOnly:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=40.000000
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
   RemoteRole=ROLE_SimulatedProxy
   bAlwaysRelevant=True
   CollisionComponent=CollisionCylinder
   Name="Default__KFUsableTrigger"
   ObjectArchetype=Trigger_PawnsOnly'Engine.Default__Trigger_PawnsOnly'
}
