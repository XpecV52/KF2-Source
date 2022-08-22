//=============================================================================
// KFSM_Evade
//=============================================================================
// Handles playing evades. Best used with AICommand_Evade for NPCs.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_Evade extends KFSM_PlaySingleAnim;

/** Animation to play */
var array<AnimVariants> EvadeAnims;

static function byte PackAnimFlag( byte EvadeDir )
{
	local byte Variant;

	Variant = Rand(2);
	return EvadeDir + (Variant << 4);
}

function PlayAnimation()
{
	local byte Type, Variant;

	Type = KFPOwner.SpecialMoveFlags & 15;
	Variant = KFPOwner.SpecialMoveFlags >> 4;

	PlaySpecialMoveAnim( EvadeAnims[Type].Anims[Variant], EAS_FullBody, BlendInTime, BlendOutTime, 1.f );

	// Clear the special move flags now so that SpecialMoveFlagsUpdated never fails
	KFPOwner.SpecialMoveFlags = 255;
}

defaultproperties
{
   EvadeAnims(0)=(Anims=("Evade_F_V1","Evade_F_V2"))
   EvadeAnims(1)=(Anims=("Evade_B_V1","Evade_B_V2"))
   EvadeAnims(2)=(Anims=("Evade_L_V1","Evade_L_V2"))
   EvadeAnims(3)=(Anims=("Evade_R_V1","Evade_R_V2"))
   EvadeAnims(4)=(Anims=("Evade_FL_V1","Evade_FL_V2"))
   EvadeAnims(5)=(Anims=("Evade_FR_V1","Evade_FR_V2"))
   EvadeAnims(6)=(Anims=("Evade_BL_V1","Evade_BL_V2"))
   EvadeAnims(7)=(Anims=("Evade_BR_V1","Evade_BR_V2"))
   bUseRootMotion=True
   BlendInTime=0.150000
   bUseHigherMeshSmoothingThreshold=True
   bDisablesWeaponFiring=True
   bPawnRotationLocked=True
   Handle="KFSM_Evade"
   Name="Default__KFSM_Evade"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
