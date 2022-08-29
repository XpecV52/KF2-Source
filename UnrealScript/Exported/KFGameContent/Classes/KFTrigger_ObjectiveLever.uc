//=============================================================================
// KFTrigger_ObjectiveLever
//=============================================================================
// Minigame button that is used by map objective. This lever both needs the
// approval of the trigger and the objective in order to be activated.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFTrigger_ObjectiveLever extends KFTrigger_MinigameButton
	config(Game);

/** If the owning Map Objective says we can be activated or not. */
var repnotify bool bFathersBlessing;

/** Reference to owning map objective. */
var KFMapObjective_ActivateTrigger OwningObjective;

replication
{
	if (bNetDirty)
		bFathersBlessing;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(bFathersBlessing))
	{
		if (OwningObjective != none)
		{
			OwningObjective.TriggerObjectiveProgressEvent(bFathersBlessing ? EActivateTriggerProgressEvent_ZoneEnabled : EActivateTriggerProgressEvent_ZoneDisabled);
		}
	}

	super.ReplicatedEvent(VarName);
}

simulated function bool ReadyToActivate()
{
	local bool bReadyToActivate;

	bReadyToActivate = super.ReadyToActivate();
	return bReadyToActivate && bFathersBlessing;
}

function ActivateGame()
{
	if (OwningObjective != none && ReadyToActivate() && bActiveGame && !bInProgress)
	{
		OwningObjective.OnTriggerActivated();
	}

	super.ActivateGame();
}

function AllowReactivation()
{
	super.AllowReactivation();

	if (OwningObjective != none)
	{
		OwningObjective.OnTriggerReactivated();
	}
}

simulated function SetFathersBlessing(bool bNewBlessing)
{
	if (bNewBlessing != bFathersBlessing)
	{
		bFathersBlessing = bNewBlessing;
		bForceNetUpdate = true;

		if (OwningObjective != none)
		{
			OwningObjective.TriggerObjectiveProgressEvent(bFathersBlessing ? EActivateTriggerProgressEvent_ZoneEnabled : EActivateTriggerProgressEvent_ZoneDisabled);
		}
	}
}

defaultproperties
{
   bFathersBlessing=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFTrigger_MinigameButton:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=40.000000
      bAlwaysRenderIfSelected=True
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFTrigger_MinigameButton:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFTrigger_MinigameButton:Sprite'
      Sprite=Texture2D'EditorResources.S_Trigger'
      SpriteCategoryName="Triggers"
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFTrigger_MinigameButton:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__KFTrigger_ObjectiveLever"
   ObjectArchetype=KFTrigger_MinigameButton'KFGame.Default__KFTrigger_MinigameButton'
}
