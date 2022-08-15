//=============================================================================
// KFInventory_Armor
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 4/1/2014
//=============================================================================

class KFInventory_Armor extends Inventory;

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Item_Armor_Pickup'
      ReplacementPrimitive=None
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   PickupFactoryMesh=StaticMeshComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Inventory:Sprite'
      SpriteCategoryName="Inventory"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Inventory:Sprite'
   End Object
   Components(0)=Sprite
   Name="Default__KFInventory_Armor"
   ObjectArchetype=Inventory'Engine.Default__Inventory'
}
