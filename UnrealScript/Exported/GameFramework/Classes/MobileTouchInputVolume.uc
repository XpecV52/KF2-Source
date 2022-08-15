/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MobileTouchInputVolume extends Volume
	implements(TouchableElement3D)
	placeable;

var bool bEnabled;

simulated function OnToggle( SeqAct_Toggle inAction )
{
	if (inAction.InputLinks[0].bHasImpulse)
	{
		bEnabled = true;
	}
	else if (inAction.InputLinks[1].bHasImpulse)
	{
		bEnabled = false;
	}
	else if (inAction.InputLinks[2].bHasImpulse)
	{
		bEnabled = !bEnabled;
	}

	Super.OnToggle(inAction);
}

/** Handle being clicked by the user */
function HandleClick()
{
	if( bEnabled )
	{
		TriggerEventClass( class'SeqEvent_MobileTouchInputVolume', self, 1);
	}
}

/** Handle being double clicked by the user */
function HandleDoubleClick()
{
	if( bEnabled )
	{   
		TriggerEventClass( class'SeqEvent_MobileTouchInputVolume', self, 2);
	}
}


/** Handle a touch moving over this object, and not necessarily tapping or releasing on it */
function HandleDragOver()
{
	if( bEnabled )
	{   
		TriggerEventClass( class'SeqEvent_MobileTouchInputVolume', self, 0);
	}
}

defaultproperties
{
   bEnabled=True
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   bStatic=False
   CollisionComponent=BrushComponent0
   SupportedEvents(0)=Class'GameFramework.SeqEvent_MobileTouchInputVolume'
   Name="Default__MobileTouchInputVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
