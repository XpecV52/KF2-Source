//=============================================================================
// KFSM_PlayerFleshpound_Melee2
//=============================================================================
// Player controlled fleshpound attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerFleshpound_Melee2 extends KFSM_PlayerFleshpound_Melee;

defaultproperties
{
   Attacks(0)=(Anims=("Player_Heavy_Atk"))
   Attacks(1)=(Anims=("Player_Sprint_Heavy_Atk"))
   Attacks(2)=(Anims=("Player_Drill"),bIsInputHeld=True,bCannotBeParried=False)
   Attacks(3)=()
   Attacks(4)=(Anims=("Player_Rage_Heavy","Player_Rsprint_Heavy"),Type=PZA_SpecialDefault,Stance=EAS_FullBody,bCannotBeParried=True)
   Attacks(5)=(Anims=("Player_Rsprint_Heavy","Player_Rage_Heavy"),Type=PZA_SpecialSprinting)
   Attacks(6)=(Anims=("Player_Rage_Pounce"),Type=PZA_SpecialBackwards)
   Name="Default__KFSM_PlayerFleshpound_Melee2"
   ObjectArchetype=KFSM_PlayerFleshpound_Melee'kfgamecontent.Default__KFSM_PlayerFleshpound_Melee'
}
