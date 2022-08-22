//=============================================================================
// KFSM_PlayerAlpha_Melee
//=============================================================================
// Player controlled alpha clot attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerAlpha_Melee extends KFSM_PlayerMeleeBase;

defaultproperties
{
   Attacks(0)=(Anims=("Player_Light_Atk_V1","Player_Light_Atk_V1","Player_Light_Atk_V3"),Stance=EAS_UpperBody)
   Attacks(1)=(Anims=("Player_Lunge_Atk","Player_Lunge_Atk_v2","Player_Lunge_Atk_v2"),Type=PZA_Sprinting)
   Attacks(2)=(Anims=("Player_Jump_Atk_V1"),Type=PZA_Jumping)
   Attacks(3)=(Anims=("Player_Headless_Atk_V1","Player_Headless_Atk_V2"),Type=PZA_Headless,Stance=EAS_UpperBody)
   Name="Default__KFSM_PlayerAlpha_Melee"
   ObjectArchetype=KFSM_PlayerMeleeBase'KFGame.Default__KFSM_PlayerMeleeBase'
}
