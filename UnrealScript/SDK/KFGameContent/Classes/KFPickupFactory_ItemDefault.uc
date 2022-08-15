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
	/** These are the default weapons to load into an item pickup factory, more can be added on the object */
    ItemPickups.Add((ItemClass=class'KFInventory_Armor'))
    ItemPickups.Add((ItemClass=class'KFWeap_AssaultRifle_AR15'))
    ItemPickups.Add((ItemClass=class'KFWeap_Shotgun_MB500'))
    ItemPickups.Add((ItemClass=class'KFWeap_Blunt_Crovel'))
    ItemPickups.Add((ItemClass=class'KFWeap_Edged_Katana'))
	ItemPickups.Add((ItemClass=class'KFWeap_Pistol_9mm'))
}