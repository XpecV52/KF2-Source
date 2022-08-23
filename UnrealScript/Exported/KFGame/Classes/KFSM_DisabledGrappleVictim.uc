//=============================================================================
// KFSM_DisabledGrappleVictim
//=============================================================================
// Victim class for victims of disabling grappels.  Handles movement changes 
//      while stuck in the interaction w/ parent.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

class KFSM_DisabledGrappleVictim extends KFSM_GrappleVictim;

defaultproperties
{
   bAllowThirdPersonWeaponAnims=False
   bLockPawnRotation=True
   bDisableLook=True
   bDisableWeaponInteraction=True
   Handle="SM_DisabledGrappleVictim"
   Name="Default__KFSM_DisabledGrappleVictim"
   ObjectArchetype=KFSM_GrappleVictim'KFGame.Default__KFSM_GrappleVictim'
}
