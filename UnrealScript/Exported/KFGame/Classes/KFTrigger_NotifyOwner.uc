//=============================================================================
// KFTrigger_NotifyOwner
//=============================================================================
// Trigger that passes Touch and UnTouch notifications to its Owner
// (if its Owner is a KFInterface_TriggerOwner)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFTrigger_NotifyOwner extends Trigger_PawnsOnly;

event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	local KFInterface_TriggerOwner KFOwner;

	super.Touch(Other, OtherComp, HitLocation, HitNormal);

	KFOwner = KFInterface_TriggerOwner(Owner);
	if (KFOwner != none)
	{
		KFOwner.NotifyTriggerTouch(self, Other, OtherComp, HitLocation, HitNormal);
	}
}

event UnTouch(Actor Other)
{
	local KFInterface_TriggerOwner KFOwner;

	super.UnTouch(Other);

	KFOwner = KFInterface_TriggerOwner(Owner);
	if (KFOwner != none)
	{
		KFOwner.NotifyTriggerUnTouch(self, Other);
	}
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Trigger_PawnsOnly:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=100.000000
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
   CollisionType=COLLIDE_CustomDefault
   bNoDelete=False
   bProjTarget=False
   CollisionComponent=CollisionCylinder
   Name="Default__KFTrigger_NotifyOwner"
   ObjectArchetype=Trigger_PawnsOnly'Engine.Default__Trigger_PawnsOnly'
}
