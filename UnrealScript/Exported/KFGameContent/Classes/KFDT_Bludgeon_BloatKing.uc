//=============================================================================
// KFDT_Bludgeon_BloatKing
//=============================================================================
// Bludgeon damage from Bloat King
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_BloatKing extends KFDT_Bludgeon
	abstract
	hidedropdown;




































































































































































































































































































































































































































































































































































































































#linenumber 14

static function int GetKillerDialogID()
{
	return 12;
}

defaultproperties
{
   bAllowAIDoorDestruction=True
   bExtraMomentumZ=True
   KDamageImpulse=1000.000000
   KDeathVel=950.000000
   KDeathUpKick=300.000000
   Name="Default__KFDT_Bludgeon_BloatKing"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
