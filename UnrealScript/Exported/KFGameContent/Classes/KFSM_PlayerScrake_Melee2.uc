//=============================================================================
// KFSM_PlayerScrake_Melee2
//=============================================================================
// Player controlled scrake attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerScrake_Melee2 extends KFSM_PlayerScrake_Melee;

defaultproperties
{
   Attacks(0)=(Anims=("Player_Heavy_Atk"))
   Attacks(1)=(Anims=("Player_Lunge_Heavy"),bCannotBeParried=True)
   Attacks(2)=()
   Attacks(3)=(Anims=("Player_Stab_Atk"),bIsInputHeld=True,Type=PZA_Backwards,Stance=EAS_FullBody)
   Attacks(4)=(Anims=("Player_Rage_Heavy"),bCannotBeParried=True)
   Attacks(5)=(Anims=("Player_RLunge_Heavy"))
   Attacks(6)=()
   Attacks(7)=(Anims=("Player_Stab_Atk"),bIsInputHeld=True,Type=PZA_SpecialBackwards)
   Name="Default__KFSM_PlayerScrake_Melee2"
   ObjectArchetype=KFSM_PlayerScrake_Melee'kfgamecontent.Default__KFSM_PlayerScrake_Melee'
}
