//=============================================================================
// KFSM_Evade_Fear
//=============================================================================
// Handles playing fear variant evades.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
 
class KFSM_Evade_Fear extends KFSM_Evade;

DefaultProperties
{
	Handle=SM_Evade_Fear
	// ---------------------------------------------
	// Animations
	EvadeAnims(EVADE_Forward)=(Anims=(EvadeFear_F_V1, EvadeFear_F_V2))
	EvadeAnims(EVADE_Backward)=(Anims=(EvadeFear_B_V1, EvadeFear_B_V2))
	EvadeAnims(EVADE_Left)=(Anims=(EvadeFear_L_V1, EvadeFear_L_V2))
	EvadeAnims(EVADE_Right)=(Anims=(EvadeFear_R_V1, EvadeFear_R_V2))
}
