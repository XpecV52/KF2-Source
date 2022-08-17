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
   Attacks(0)=(Anims=("Player_Light_Atk"))
   Attacks(1)=(Anims=("Player_Sprint_Light_Atk","Player_Light_Atk"),Type=PZA_Sprinting)
   Attacks(2)=(Anims=("Player_Kick"),Type=PZA_Backwards)
   Attacks(3)=(Anims=("Player_Jump_Atk"),Type=PZA_Jumping,bForceDisableRootMotion=True)
   Attacks(4)=(Anims=("Player_Headless_Atk_V1","Player_Headless_Atk_V2"),Type=PZA_Headless,Stance=EAS_UpperBody)
   Attacks(5)=(Anims=("Player_Rage_Light","Player_Rsprint_Light"),Type=PZA_SpecialDefault)
   Attacks(6)=(Anims=("Player_Rsprint_Light","Player_Rage_Light"),Type=PZA_SpecialSprinting)
   Attacks(7)=(Anims=("Player_360_Spin"),Type=PZA_SpecialBackwards)
   Name="Default__KFSM_PlayerFleshpound_Melee"
   ObjectArchetype=KFSM_PlayerMeleeBase'KFGame.Default__KFSM_PlayerMeleeBase'
}
