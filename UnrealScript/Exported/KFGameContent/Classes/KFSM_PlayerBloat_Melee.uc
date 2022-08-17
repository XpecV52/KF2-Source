//=============================================================================
// KFSM_PlayerSlasher_Melee
//=============================================================================
// Player controlled stalker attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerBloat_Melee extends KFSM_PlayerMeleeBase;

defaultproperties
{
   Attacks(0)=(Anims=("Player_Light_Atk_V1","Player_Light_Atk_V2"),Stance=EAS_UpperBody)
   Attacks(1)=(Anims=("Player_Belly_Slam"),Type=PZA_Sprinting)
   Attacks(2)=(Anims=("Player_Jump_Atk"),Type=PZA_Jumping,bForceDisableRootMotion=True)
   Attacks(3)=(Anims=("Player_Headless_Atk_V1","Player_Headless_Atk_V2"),Type=PZA_Headless,Stance=EAS_UpperBody)
   Name="Default__KFSM_PlayerBloat_Melee"
   ObjectArchetype=KFSM_PlayerMeleeBase'KFGame.Default__KFSM_PlayerMeleeBase'
}
