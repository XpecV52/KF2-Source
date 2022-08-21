//=============================================================================
// KFAffliction_EMPDisrupt
//=============================================================================
// An extended version of EMP that all disrupts mechanical zeds
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFAffliction_EMPDisrupt extends KFAffliction_EMP;

const DISRUPT_THRESHOLD = 25.f;

function Accrue(float InPower)
{
	Super.Accrue(InPower);

	if ( CurrentStrength > DISRUPT_THRESHOLD )
	{
		SetEMPDisrupted(true);
		PawnOwner.SetTimer(Duration, false, nameof(EMPDisruptTimer), self);
	}
}

function EMPDisruptTimer()
{
	SetEMPDisrupted(false);
}

/** Set the EMP disrupt functionality */
function SetEMPDisrupted(bool bEnabled)
{
    if( PawnOwner.Role == ROLE_Authority )
    {
    	if( PawnOwner.bEmpDisrupted == bEnabled )
    	{
    		return;
    	}

        PawnOwner.bEmpDisrupted = bEnabled;

        // Notify special moves that they've been disrupted
	    if( PawnOwner.IsDoingSpecialMove() )
	    {
	    	PawnOwner.SpecialMoves[SpecialMove].OnEMPDisrupted();
	   	}

        PawnOwner.OnStackingAfflictionChanged(AF_EMP);
    }
    ToggleEffects(PawnOwner.bEmpDisrupted, PawnOwner.bEmpPanicked);
}

defaultproperties
{
   Name="Default__KFAffliction_EMPDisrupt"
   ObjectArchetype=KFAffliction_EMP'KFGame.Default__KFAffliction_EMP'
}
