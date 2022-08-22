//=============================================================================
// KFSM_PlayerSlasher_Melee2
//=============================================================================
// Player controlled stalker attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerCrawler_Melee2 extends KFSM_PlayerMeleeBase;

defaultproperties
{
   Attacks(0)=(Anims=("Player_Medium_Leap"))
   Attacks(1)=(Anims=("Player_Jump_Atk"),Type=PZA_Jumping,MomentumPush=400.000000,bForceDisableRootMotion=True)
   Attacks(2)=(Anims=("Player_Long_Leap"),Type=PZA_Sprinting)
   Name="Default__KFSM_PlayerCrawler_Melee2"
   ObjectArchetype=KFSM_PlayerMeleeBase'KFGame.Default__KFSM_PlayerMeleeBase'
}
