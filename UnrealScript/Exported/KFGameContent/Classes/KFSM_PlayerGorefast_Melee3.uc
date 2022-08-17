//=============================================================================
// KFSM_PlayerGorefast_Melee3
//=============================================================================
// Player controlled stalker attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerGorefast_Melee3 extends KFSM_PlayerMeleeBase;

defaultproperties
{
   Attacks(0)=(Anims=("Player_Special"),bIsInputHeld=True)
   Attacks(1)=(Anims=("Player_Special_Sprint"),Type=PZA_Sprinting)
   Name="Default__KFSM_PlayerGorefast_Melee3"
   ObjectArchetype=KFSM_PlayerMeleeBase'KFGame.Default__KFSM_PlayerMeleeBase'
}
