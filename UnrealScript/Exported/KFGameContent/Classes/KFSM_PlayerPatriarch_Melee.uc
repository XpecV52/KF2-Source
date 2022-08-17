//=============================================================================
// KFSM_PlayerPatriarch_Melee
//=============================================================================
// Player controlled patriarch attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerPatriarch_Melee extends KFSM_PlayerMeleeBase;

defaultproperties
{
   Attacks(0)=(Anims=("Player_Claw_Atk_V1","Player_Claw_Atk_V2","Player_Heavy_Atk_V1"),Stance=EAS_UpperBody)
   Attacks(1)=(Anims=("Player_Jump_Atk"),Type=PZA_Jumping,bForceDisableRootMotion=True)
   Attacks(2)=(Anims=("Player_Heavy_Lunge_V1","Player_Heavy_Lunge_V2","Player_Heavy_Lunge_V3","Player_Heavy_Lunge_V4"),Type=PZA_Sprinting)
   Attacks(3)=(Anims=("Player_Kick"),Type=PZA_Backwards)
   Attacks(4)=(Anims=("Player_Spin_Atk"),Type=PZA_Left)
   Attacks(5)=(Anims=("Player_Spin_Atk"),Type=PZA_Right)
   Attacks(6)=(Anims=("Player_Shoulder_Light"),Type=PZA_Cloaked)
   Attacks(7)=(Anims=("Player_Shoulder_Heavy"),Type=PZA_SprintCloaked)
   Name="Default__KFSM_PlayerPatriarch_Melee"
   ObjectArchetype=KFSM_PlayerMeleeBase'KFGame.Default__KFSM_PlayerMeleeBase'
}
