//=============================================================================
// KFSM_GorgeVictim
//=============================================================================
// Simple SM to play a looping anim while the zed is being pulled.  Duration
//		is infinite, and on/off state is triggered by KFSM_BloatKing_Gorge.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFSM_GorgeVictim extends KFSM_PlaySingleAnim;

defaultproperties
{
   AnimName="Gorge_V1"
   bAllowHitReactions=True
   bDisableMovement=True
   Name="Default__KFSM_GorgeVictim"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
