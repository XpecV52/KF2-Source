//=============================================================================
// KFSM_BloatKing_Enrage
//=============================================================================
// Simple move to force an enrage transition for the Bloat King.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFSM_BloatKing_Enrage extends KFSM_PlaySingleAnim;

defaultproperties
{
   AnimName="Rage_V1"
   bDisableMovement=True
   bLockPawnRotation=True
   bDisableTurnInPlace=True
   Name="Default__KFSM_BloatKing_Enrage"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
