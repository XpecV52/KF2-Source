//=============================================================================
// KFSM_PlayerScrake_Melee3
//=============================================================================
// Player controlled scrake attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerScrake_Melee3 extends KFSM_PlayerScrake_Melee;

defaultproperties
{
   Attacks(0)=(Anims=("Player_360_Spin"))
   Attacks(1)=(Anims=("Player_Rage_360_Spin"),Type=PZA_SpecialDefault)
   Attacks(2)=(Anims=("Player_Rage_360_Spin"),Type=PZA_SpecialSprinting,bForceDisableRootMotion=False)
   Name="Default__KFSM_PlayerScrake_Melee3"
   ObjectArchetype=KFSM_PlayerScrake_Melee'kfgamecontent.Default__KFSM_PlayerScrake_Melee'
}
