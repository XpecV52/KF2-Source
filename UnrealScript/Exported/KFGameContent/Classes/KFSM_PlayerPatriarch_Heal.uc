//=============================================================================
// KFSM_PlayerPatriarch_Heal
//=============================================================================
// Player-controlled Patriarch's heal
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerPatriarch_Heal extends KFSM_Patriarch_Heal;

protected function bool InternalCanDoSpecialMove()
{
	/*local KFPawn_ZedPatriarch_Versus MyPatPawnV;

	if( PawnOwner != none )
	{
		MyPatPawnV = KFPawn_ZedPatriarch_Versus( PawnOwner );
		if( MyPatPawnV != none )
		{
			if( MyPatPawnV.IsHealAllowed() )
			{
				if( MyPatPawnV.Health == MyPatPawnV.HealthMax )
				{
					MyPatPawnV.MyKFPC.MyGFxHUD.ShowNonCriticalMessage( class'KFInventoryManager'.default.FullHealthMsg );					
					return false;
				}

				return true;
			}
			else
			{
				MyPatPawnV.MyKFPC.MyGFxHUD.ShowNonCriticalMessage( MyPatPawnV.NoHealsRemainingMsg );
				return false;
			}
		}
	}

	return false;*/

	return true;
}

/** Notification called when Special Move starts */
function SpecialMoveStarted( bool bForced, Name PrevMove )
{
	super.SpecialMoveStarted( bForced, PrevMove );

	if( MyPatPawn != none )
	{
		MyPatPawn.IncrementBattlePhase();

		if( MyPatPawn.Role == ROLE_Authority )
		{
			MyPatPawn.SetCloaked( false );
		}
	}
}

/** Overridden to reset low health warning on pawn */
function DoHeal()
{
	super.DoHeal();

	if( MyPatPawn != none )
	{
		KFPawn_ZedPatriarch_Versus(MyPatPawn).NotifyHealed();
	}
}

/** Server notification that the pawn has been EMP disrupted */
function OnEMPDisrupted() {}

defaultproperties
{
   Handle="KFSM_PlayerPatriarch_Heal"
   Name="Default__KFSM_PlayerPatriarch_Heal"
   ObjectArchetype=KFSM_Patriarch_Heal'kfgamecontent.Default__KFSM_Patriarch_Heal'
}
