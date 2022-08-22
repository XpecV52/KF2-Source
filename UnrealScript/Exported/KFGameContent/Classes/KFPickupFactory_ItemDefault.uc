//=============================================================================
// KFPickupFactory_ItemDefault
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 4/1/2014
//=============================================================================

class KFPickupFactory_ItemDefault extends KFPickupFactory_Item;

defaultproperties
{
   ItemPickups(0)=(ItemClass=Class'kfgamecontent.KFInventory_Armor')
   ItemPickups(1)=(ItemClass=Class'kfgamecontent.KFWeap_AssaultRifle_AR15')
   ItemPickups(2)=(ItemClass=Class'kfgamecontent.KFWeap_Shotgun_MB500')
   ItemPickups(3)=(ItemClass=Class'kfgamecontent.KFWeap_Blunt_Crovel')
   ItemPickups(4)=(ItemClass=Class'kfgamecontent.KFWeap_Pistol_9mm')
   ItemPickups(5)=(ItemClass=Class'kfgamecontent.KFWeap_Revolver_Rem1858')
   ItemPickups(6)=(ItemClass=Class'kfgamecontent.KFWeap_Rifle_Winchester1894')
   ItemPickups(7)=(ItemClass=Class'kfgamecontent.KFWeap_Pistol_Medic')
   ItemPickups(8)=(ItemClass=Class'kfgamecontent.KFWeap_SMG_MP7')
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'KFGame.Default__KFPickupFactory_Item:StaticMeshComponent0'
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_AR15_Pickup'
      ReplacementPrimitive=None
      bCastDynamicShadow=False
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFPickupFactory_Item:StaticMeshComponent0'
   End Object
   PickupMesh=StaticMeshComponent0
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPickupFactory_Item:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=100.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPickupFactory_Item:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPickupFactory_Item:Sprite'
      Sprite=Texture2D'EditorResources.S_Weapon'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPickupFactory_Item:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'KFGame.Default__KFPickupFactory_Item:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPickupFactory_Item:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPickupFactory_Item:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPickupFactory_Item:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'KFGame.Default__KFPickupFactory_Item:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'KFGame.Default__KFPickupFactory_Item:PathRenderer'
   End Object
   Components(4)=PathRenderer
   Components(5)=StaticMeshComponent0
   CollisionComponent=CollisionCylinder
   Name="Default__KFPickupFactory_ItemDefault"
   ObjectArchetype=KFPickupFactory_Item'KFGame.Default__KFPickupFactory_Item'
}
