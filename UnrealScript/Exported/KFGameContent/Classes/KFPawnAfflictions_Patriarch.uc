//=============================================================================
// KFPawnAfflictions_Patriarch
//=============================================================================
// Afflictions class for Patriarch to handle additional body material
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPawnAfflictions_Patriarch extends KFPawnAfflictions within KFPawn_ZedPatriarch;

/** Overloaded to support secondary body mat */
protected function SetEMPMatParam(bool bDisrupted, bool bPanicked)
{
	local float EMPValue;

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

    	BodyMIC.SetScalarParameterValue( 'Scalar_EMP', EMPValue );
    	BodyAltMIC.SetScalarParameterValue( 'Scalar_EMP', EMPValue );
    }
}

/** Overloaded to support secondary body mat */
function SetPoisonedOverlay( bool bEnabled )
{
    if ( WorldInfo.NetMode != NM_DedicatedServer )
    {
        if( bEnabled )
        {
            BodyMIC.SetScalarParameterValue('Scalar_Poison',1.0);
            BodyAltMIC.SetScalarParameterValue('Scalar_Poison',1.0);
        }
        else
        {
            BodyMIC.SetScalarParameterValue('Scalar_Poison',0.0);
            BodyAltMIC.SetScalarParameterValue('Scalar_Poison',0.0);
        }
    }
}

/** Overloaded to support secondary body mat */
function SetBurnedParameter(float BurnedAmount, optional bool bViaReplication)
{
    if ( WorldInfo.NetMode != NM_DedicatedServer )
    {
        BodyMIC.SetScalarParameterValue( 'Scalar_Burnt', fMin(BurnedAmount, 0.35f) );
        BodyAltMIC.SetScalarParameterValue( 'Scalar_Burnt', fMin(BurnedAmount, 0.35f) );

        if ( bViaReplication )
        {
            FireBurnedAmount = BurnedAmount * FireFullyCharredDuration;
        }
    }
}

/** Overloaded to support secondary body mat */
function SetMicrowaveParameter(float ParamValue)
{
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

        if( GoreMIC == None )
        {
            BodyMIC.SetScalarParameterValue('Scalar_Inflate', ParamValue * 2.0f);
            BodyAltMIC.SetScalarParameterValue('Scalar_Inflate', ParamValue * 2.0f);
        }
        // Scale inflate down instantly if gore mesh to avoid holes
        else
        {
            BodyMIC.SetScalarParameterValue('Scalar_Inflate', 0.f);
            BodyAltMIC.SetScalarParameterValue('Scalar_Inflate', 0.f);
        }
    }
}

/** Enable/Disable the Frozen material effect */
function SetFrozenParameter(float FreezeAmount)
{

    if ( WorldInfo.NetMode != NM_DedicatedServer )
    {
        BodyMIC.SetScalarParameterValue( 'Scalar_Freeze', FreezeAmount );
        BodyAltMIC.SetScalarParameterValue( 'Scalar_Freeze', FreezeAmount );
    }
}

defaultproperties
{
   Name="Default__KFPawnAfflictions_Patriarch"
   ObjectArchetype=KFPawnAfflictions'KFGame.Default__KFPawnAfflictions'
}
