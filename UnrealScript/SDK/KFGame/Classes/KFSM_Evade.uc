//=============================================================================
// KFSM_Evade
//=============================================================================
// Handles playing evades. Best used with AICommand_Evade for NPCs.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_Evade extends KFSM_PlaySingleAnim;

enum EEvadeDir
{
	EVADE_None,
	EVADE_Forward,
	EVADE_Backward,
	EVADE_Left,
	EVADE_Right,
};

/** Animation to play */
var array<AnimVariants> EvadeAnims;
/** Number of variants for each direction */
var byte NumBodyVariants;

static function byte PackAnimFlag( byte EvadeDir )
{
	local byte Variant;

	Variant = Rand(2);
	return EvadeDir + (Variant << 4);
}

static function byte GetEvadeDirection( KFPawn CheckPawn, vector EvadePoint, optional Pawn Attacker )
{
	local byte EvadeDir;
	local vector X,Y,Z;

	EvadeDir = 255;

	if( Attacker != none && Attacker.Health > 0 && CheckPawn.MyKFAIC != none && CheckPawn.MyKFAIC.CanSee( Attacker ) && VSize(Attacker.Location - CheckPawn.Location) < 1024.f )
	{

		EvadeDir = class'KFPawn'.static.CalcQuadRegion( CheckPawn.GetViewRotation(), (CheckPawn.Location - Attacker.Location) );

		if( CheckPawn.MyKFAIC != none && Attacker != none && CheckPawn.MyKFAIC.PendingEvadeProjectile != none )
		{
			GetAxes( CheckPawn.Rotation, X, Y, Z );


			if( (vector(Attacker.Rotation) DOT Y) > 0.f )
			{
				return EVADE_Left;
			}
			else
			{
				return EVADE_Right;
			}
		}
	}

	switch( EvadeDir )
	{
		case DIR_Forward:
			EvadeDir = EVADE_Forward;
			break;
		case DIR_Backward:
			EvadeDir = EVADE_Backward;
			break;
		case DIR_Left:
			EvadeDir = EVADE_Left;
			break;
		case DIR_Right:
			EvadeDir = EVADE_Right;
			break;
	}
	return EvadeDir;
}

/**
 * Checks to see if this Special Move can be done.
 */
protected function bool InternalCanDoSpecialMove()
{
	// Only valid while walking.  This makes stumble exclusive to HandleMomentum()
	return PawnOwner.Physics == PHYS_Walking;
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

DefaultProperties
{
	Handle=SM_Evade
	// ---------------------------------------------
	// Animations
	bUseRootMotion=true
	BlendOutTime=0.33f
	bPawnRotationLocked=true
	NumBodyVariants=2

	EvadeAnims(EVADE_Forward)=(Anims=(Evade_F_V1, Evade_F_V2))
	EvadeAnims(EVADE_Backward)=(Anims=(Evade_B_V1, Evade_B_V2))
	EvadeAnims(EVADE_Left)=(Anims=(Evade_L_V1, Evade_L_V2))
	EvadeAnims(EVADE_Right)=(Anims=(Evade_R_V1, Evade_R_V2))
	EvadeAnims(EVADE_ForwardLeft)=(Anims=(Evade_FL_V1, Evade_FL_V2))
	EvadeAnims(EVADE_ForwardRight)=(Anims=(Evade_FR_V1, Evade_FR_V2))
	EvadeAnims(EVADE_BackwardLeft)=(Anims=(Evade_BL_V1, Evade_BL_V2))
	EvadeAnims(EVADE_BackwardRight)=(Anims=(Evade_BR_V1, Evade_BR_V2))

	bDisablesWeaponFiring=true

}
