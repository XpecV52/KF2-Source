//=============================================================================
// KFPawnAfflictions_Scrake
//=============================================================================
// Afflictions class for Scrake to handle additional body material
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPawnAfflictions_Scrake extends KFPawnAfflictions within KFPawn_ZedScrake;

/** Overloaded to support secondary body mat */
protected function SetEMPMatParam(bool bDisrupted, bool bPanicked)
{
	local float EMPValue;
    local MaterialInstanceConstant MIC;

	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
        if( bPanicked )
	    {
	    	EMPValue = 5.0f;
        }
        else if( bDisrupted )
        {
        	EMPValue = 1.0f;
        }
        else
        {
        	EMPValue = 0.f;
        }

        MIC = GoreMIC != none ? GoreMIC : BodyMIC;

    	MIC.SetScalarParameterValue( 'Scalar_EMP', EMPValue );
    	BodyAltMIC.SetScalarParameterValue( 'Scalar_EMP', EMPValue );
    }
}

/** Overloaded to support secondary body mat */
function SetPoisonedOverlay( bool bEnabled )
{
    local MaterialInstanceConstant MIC;

    if ( WorldInfo.NetMode != NM_DedicatedServer )
    {
        MIC = GoreMIC != none ? GoreMIC : BodyMIC;

        if( bEnabled )
        {
            MIC.SetScalarParameterValue('Scalar_Poison',1.0);
            BodyAltMIC.SetScalarParameterValue('Scalar_Poison',1.0);
        }
        else
        {
            MIC.SetScalarParameterValue('Scalar_Poison',0.0);
            BodyAltMIC.SetScalarParameterValue('Scalar_Poison',0.0);
        }
    }
}

/** Overridden to support secondary body mat */
function SetBurnedParameter(float BurnedAmount, optional bool bViaReplication)
{
    local MaterialInstanceConstant MIC;

    if ( WorldInfo.NetMode != NM_DedicatedServer )
    {
        MIC = GoreMIC != none ? GoreMIC : BodyMIC;

        MIC.SetScalarParameterValue( 'Scalar_Burnt', BurnedAmount );
        BodyAltMIC.SetScalarParameterValue( 'Scalar_Burnt', BurnedAmount );

        if ( bViaReplication )
        {
            FireBurnedAmount = BurnedAmount * FireFullyCharredDuration;
        }
    }
}

/** Overloaded to support secondary body mat */
function SetMicrowaveParameter(float ParamValue)
{
    local MaterialInstanceConstant MIC;

    if ( WorldInfo.NetMode != NM_DedicatedServer )
    {
        // Handle steam effects
        if( ParamValue > 0.1 )
        {
            if( !bSteamEffectActive )
            {
                SetMicrowaveSteamEffects(true);
            }
        }
        else
        {
            if( bSteamEffectActive )
            {
                SetMicrowaveSteamEffects(false);
            }
        }

        MIC = GoreMIC != none ? GoreMIC : BodyMIC;

        if( GoreMIC == None )
        {
            MIC.SetScalarParameterValue('Scalar_Inflate', ParamValue * 2.0f);
            BodyAltMIC.SetScalarParameterValue('Scalar_Inflate', ParamValue * 2.0f);
        }
        // Scale inflate down instantly if gore mesh to avoid holes
        else
        {
            MIC.SetScalarParameterValue('Scalar_Inflate', 0.f);
            BodyAltMIC.SetScalarParameterValue('Scalar_Inflate', 0.f);
        }
    }
}

defaultproperties
{
	//defaults
}