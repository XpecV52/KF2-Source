/*=============================================================================
	FlexForceFieldActor.uc: Flex force field actor integration.
	Copyright 2008-2011 NVIDIA Corporation.
=============================================================================*/

class FlexForceFieldActor extends Actor
	native(Physics)
	placeable
	dependson(FlexForceFieldComponent);

var() FlexForceFieldComponent ForceFieldComponent;

/** Handling Toggle event from Kismet. */
simulated function OnToggle(SeqAct_Toggle inAction)
{
	if (inAction.InputLinks[0].bHasImpulse)
	{
		ForceFieldComponent.setEnabled(TRUE);
	}
	else if (inAction.InputLinks[1].bHasImpulse)
	{
		ForceFieldComponent.setEnabled(FALSE);
	}
	else if (inAction.InputLinks[2].bHasImpulse)
	{
		ForceFieldComponent.setEnabled(!ForceFieldComponent.bEnabled);
	}
}

defaultproperties
{
   Begin Object Class=FlexForceFieldComponent Name=NewFlexForceFieldComponent
      ReplacementPrimitive=None
      Name="NewFlexForceFieldComponent"
      ObjectArchetype=FlexForceFieldComponent'Engine.Default__FlexForceFieldComponent'
   End Object
   ForceFieldComponent=NewFlexForceFieldComponent
   Components(0)=NewFlexForceFieldComponent
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_RadForce'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(1)=Sprite
   CollisionType=COLLIDE_CustomDefault
   bEdShouldSnap=True
   Name="Default__FlexForceFieldActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
