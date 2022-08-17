//=============================================================================
// KFSM_PlayerFleshpound_Melee
//=============================================================================
// Player controlled fleshpound attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerFleshpound_Melee extends KFSM_PlayerMeleeBase;

/** Can be overridden in subclasses to determine if special attacks are used over defaults */
static function bool IsInSpecialMode( KFPawn P )
{
	local KFPawn_ZedFleshPound_Versus MyFPPawn;

	MyFPPawn = KFPawn_ZedFleshPound_Versus( P );
	if( MyFPPawn != none )
	{
		return MyFPPawn.bIsEnraged;
	}

	return false;
}

defaultproperties
{
	Attacks.Add((Type=PZA_Default,  Stance=EAS_FullBody, Anims=(Player_Light_Atk)))
	Attacks.Add((Type=PZA_Sprinting, Stance=EAS_FullBody, Anims=(Player_Sprint_Light_Atk, Player_Light_Atk)))
	Attacks.Add((Type=PZA_Backwards,  Stance=EAS_FullBody, Anims=(Player_Kick)))
	Attacks.Add((Type=PZA_Jumping,  Stance=EAS_FullBody,  Anims=(Player_Jump_Atk), bForceDisableRootMotion=true))
	Attacks.Add((Type=PZA_Headless, Stance=EAS_UpperBody, Anims=(Player_Headless_Atk_V1, Player_Headless_Atk_V2)))

	// Rage attacks
	Attacks.Add((Type=PZA_SpecialDefault,  Stance=EAS_FullBody, Anims=(Player_Rage_Light, Player_Rsprint_Light)))
	Attacks.Add((Type=PZA_SpecialSprinting, Stance=EAS_FullBody, Anims=(Player_Rsprint_Light, Player_Rage_Light)))
	Attacks.Add((Type=PZA_SpecialBackwards,  Stance=EAS_FullBody, Anims=(Player_360_Spin)))
}