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
   EvadeAnims(1)=(Anims=("EvadeFear_F_V1","EvadeFear_F_V2"))
   EvadeAnims(2)=(Anims=("EvadeFear_B_V1","EvadeFear_B_V2"))
   EvadeAnims(3)=(Anims=("EvadeFear_L_V1","EvadeFear_L_V2"))
   EvadeAnims(4)=(Anims=("EvadeFear_R_V1","EvadeFear_R_V2"))
   EvadeAnims(5)=()
   EvadeAnims(6)=()
   EvadeAnims(7)=()
   EvadeAnims(8)=()
   Handle="SM_Evade_Fear"
   Name="Default__KFSM_Evade_Fear"
   ObjectArchetype=KFSM_Evade'KFGame.Default__KFSM_Evade'
}
