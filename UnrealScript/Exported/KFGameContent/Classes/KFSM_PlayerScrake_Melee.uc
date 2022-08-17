//=============================================================================
// KFSM_PlayerScrake_Melee
//=============================================================================
// Player controlled scrake attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerScrake_Melee extends KFSM_PlayerMeleeBase;

/** Can be overridden in subclasses to determine if special attacks are used over defaults */
static function bool IsInSpecialMode( KFPawn P )
{
	local KFPawn_ZedScrake_Versus MySCPawn;

	MySCPawn = KFPawn_ZedScrake_Versus( P );
	if( MySCPawn != none )
	{
		return MySCPawn.bIsEnraged;
	}

	return false;
}

defaultproperties
{
   Attacks(0)=(Anims=("Player_Light_Atk"))
   Attacks(1)=(Anims=("Player_Lunge_Light"),Type=PZA_Sprinting)
   Attacks(2)=(Anims=("Player_Jump_Atk"),Type=PZA_Jumping,bForceDisableRootMotion=True)
   Attacks(3)=(Anims=("Player_Headless_Atk_V1","Player_Headless_Atk_V2"),Type=PZA_Headless,Stance=EAS_UpperBody)
   Attacks(4)=(Anims=("Player_Rage_Light","Player_RLunge_Light"),Type=PZA_SpecialDefault)
   Attacks(5)=(Anims=("Player_RLunge_Light","Player_Rage_Light"),Type=PZA_SpecialSprinting)
   Attacks(6)=(Anims=("Player_Jump_Atk"),Type=PZA_Jumping,bForceDisableRootMotion=True)
   Name="Default__KFSM_PlayerScrake_Melee"
   ObjectArchetype=KFSM_PlayerMeleeBase'KFGame.Default__KFSM_PlayerMeleeBase'
}
