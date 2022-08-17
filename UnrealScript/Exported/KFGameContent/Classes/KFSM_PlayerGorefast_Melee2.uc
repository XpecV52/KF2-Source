//=============================================================================
// KFSM_PlayerGorefast_Melee2
//=============================================================================
// Player controlled stalker attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerGorefast_Melee2 extends KFSM_PlayerMeleeBase;

defaultproperties
{
   Attacks(0)=(Anims=("Player_Heavy_Atk"))
   Attacks(1)=(Anims=("Player_Heavy_Lunge_Atk"),Type=PZA_Sprinting)
   Attacks(2)=(Anims=("Player_Jump_Atk"),Type=PZA_Jumping,bForceDisableRootMotion=True)
   Name="Default__KFSM_PlayerGorefast_Melee2"
   ObjectArchetype=KFSM_PlayerMeleeBase'KFGame.Default__KFSM_PlayerMeleeBase'
}
