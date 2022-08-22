//=============================================================================
// KFSM_PlayerSpecial_Slasher
//=============================================================================
// Player controlled stalker attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerSlasher_Roll extends KFSM_Evade;

/** How fast to roll in any direction */
var float RollSpeed;

/**
 * Checks to see if this Special Move can be done.
 */
protected function bool InternalCanDoSpecialMove()
{
	return KFPOwner != none && KFPOwner.Physics == PHYS_Walking && super.InternalCanDoSpecialMove();
}

static function byte PackFlagsBase(KFPawn P)
{
	return class'KFSM_PlayerMeleeBase'.static.GetFourWayMoveDirection(P);
}

/** Constantly apply velocity while move is active */
function Tick( float DeltaTime )
{
	super.Tick( DeltaTime );

	if( KFPOwner != none && KFPOwner.Role != ROLE_SimulatedProxy )
	{
		KFPOwner.Velocity = vector(KFPOwner.Rotation) * RollSpeed;
		KFPOwner.Acceleration = KFPOwner.Velocity;
	}
}

defaultproperties
{
   RollSpeed=1000.000000
   EvadeAnims(0)=(Anims=("Player_Roll_F"))
   EvadeAnims(1)=(Anims=("Player_Roll_B"))
   EvadeAnims(2)=(Anims=("Player_Roll_L"))
   EvadeAnims(3)=(Anims=("Player_Roll_R"))
   EvadeAnims(4)=()
   EvadeAnims(5)=()
   EvadeAnims(6)=()
   EvadeAnims(7)=()
   bUseCustomThirdPersonViewOffset=True
   CustomThirdPersonViewOffset=(OffsetHigh=(X=-175.000000,Y=50.000000,Z=-80.000000),OffsetMid=(X=-145.000000,Y=50.000000,Z=-90.000000),OffsetLow=(X=-220.000000,Y=50.000000,Z=-80.000000))
   ViewOffsetInterpTime=0.300000
   CustomCameraFOV=80.000000
   CameraFOVTransitionTime=0.300000
   Name="Default__KFSM_PlayerSlasher_Roll"
   ObjectArchetype=KFSM_Evade'KFGame.Default__KFSM_Evade'
}
