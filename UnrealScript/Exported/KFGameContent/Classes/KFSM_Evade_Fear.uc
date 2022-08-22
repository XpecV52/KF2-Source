//=============================================================================
// KFSM_Evade_Fear
//=============================================================================
// Handles playing fear variant evades.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
 
class KFSM_Evade_Fear extends KFSM_Evade;

defaultproperties
{
   EvadeAnims(0)=(Anims=("EvadeFear_F_V1","EvadeFear_F_V2"))
   EvadeAnims(1)=(Anims=("EvadeFear_B_V1","EvadeFear_B_V2"))
   EvadeAnims(2)=(Anims=("EvadeFear_L_V1","EvadeFear_L_V2"))
   EvadeAnims(3)=(Anims=("EvadeFear_R_V1","EvadeFear_R_V2"))
   EvadeAnims(4)=(Anims=("EvadeFear_FL_V1","EvadeFear_FL_V2"))
   EvadeAnims(5)=(Anims=("EvadeFear_FR_V1","EvadeFear_FR_V2"))
   EvadeAnims(6)=(Anims=("EvadeFear_BL_V1","EvadeFear_BL_V2"))
   EvadeAnims(7)=(Anims=("EvadeFear_BR_V1","EvadeFear_BR_V2"))
   Handle="KFSM_Evade_Fear"
   Name="Default__KFSM_Evade_Fear"
   ObjectArchetype=KFSM_Evade'KFGame.Default__KFSM_Evade'
}
