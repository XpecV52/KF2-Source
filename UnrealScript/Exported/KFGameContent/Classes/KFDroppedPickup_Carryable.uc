//=============================================================================
// KFDroppedPickup_Carryable
//=============================================================================
// Implements dropped weapon/item pickups
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
// Based on GearDroppedPickup
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class KFDroppedPickup_Carryable extends KFDroppedPickup;

var float idleDestroyTime;
var KFObjectiveCollectActor ParentCollectActor;

simulated function PostBeginPlay()
{
	SetTimer(idleDestroyTime, false, nameof(IdleDestroy));
}

simulated function IdleDestroy()
{
	if (ParentCollectActor != none)
	{
		ParentCollectActor.DestroyingChildCarryable();
	}

	Destroy();
}

defaultproperties
{
   idleDestroyTime=20.000000
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFDroppedPickup:Sprite'
      Sprite=Texture2D'EditorResources.S_Inventory'
      SpriteCategoryName="Inventory"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFDroppedPickup:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFDroppedPickup:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=75.000000
      ReplacementPrimitive=None
      CollideActors=True
      Translation=(X=0.000000,Y=0.000000,Z=40.000000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFDroppedPickup:CollisionCylinder'
   End Object
   Components(1)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__KFDroppedPickup_Carryable"
   ObjectArchetype=KFDroppedPickup'KFGame.Default__KFDroppedPickup'
}
