//=============================================================================
// KFRepairableActorTrigger
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFRepairableActorTrigger extends Trigger_PawnsOnly
	placeable
	implements(KFInterface_Usable);

var() KFRepairableActor RepairableActor;

simulated event PostBeginPlay()
{
	if (RepairableActor != none)
	{
		RepairableActor.RepairTrigger = self;
	}

	super.PostBeginPlay();
}

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
	super.UnTouch(Other);
	if (Role == ROLE_Authority)
	{
		class'KFPlayerController'.static.UpdateInteractionMessages(Other);
	}
}

function OnDestroyOrReset()
{
	local KFPawn_Human P;

	foreach TouchingActors(class'KFPawn_Human', P)
	{
		class'KFPlayerController'.static.UpdateInteractionMessages(P);
	}
}

simulated function bool GetIsUsable(Pawn User)
{
	if (RepairableActor != none)
	{
		return RepairableActor.WeldIntegrity < RepairableActor.MaxWeldIntegrity;
	}
	return false;
}

function int GetInteractionIndex(Pawn User)
{
	if (RepairableActor != none && RepairableActor.WeldIntegrity < RepairableActor.MaxWeldIntegrity)
	{
		if (User.Weapon != none && User.Weapon.Class.Name == 'KFWeap_Welder')
		{
			return INDEX_NONE;
		}
		return IMT_UseDoorWelded;
	}
	return IMT_UseDoor;
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Trigger_PawnsOnly:CollisionCylinder'
      CollisionHeight=100.000000
      CollisionRadius=200.000000
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
   bProjTarget=False
   CollisionComponent=CollisionCylinder
   Name="Default__KFRepairableActorTrigger"
   ObjectArchetype=Trigger_PawnsOnly'Engine.Default__Trigger_PawnsOnly'
}
