//=============================================================================
// KFSM_PlayerSlasher_Melee2
//=============================================================================
// Player controlled stalker attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerStalker_Melee2 extends KFSM_PlayerMeleeBase;

defaultproperties
{
   Attacks(0)=(Anims=("Player_Heavy_Atk"))
   Attacks(1)=(Anims=("Player_Sprint_Heavy"),Type=PZA_Sprinting)
   Attacks(2)=(Anims=("Player_Heavy_Atk"),Type=PZA_Cloaked)
   Attacks(3)=(Anims=("Player_Sprint_Heavy"),Type=PZA_SprintCloaked)
   Attacks(4)=(Anims=("Player_Jump_Atk"),Type=PZA_Jumping,bForceDisableRootMotion=True)
   Attacks(5)=(Anims=("Player_Kick_Atk"),Type=PZA_Backwards)
   Name="Default__KFSM_PlayerStalker_Melee2"
   ObjectArchetype=KFSM_PlayerMeleeBase'KFGame.Default__KFSM_PlayerMeleeBase'
}
