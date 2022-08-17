//=============================================================================
// KFPawn_Human
//=============================================================================
// KF Pawn for human characters
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFPawn_Human_Versus extends KFPawn_Human;

simulated function SetCharacterArch( KFCharacterInfoBase Info, optional bool bForce )
{
    super.SetCharacterArch( Info, bForce );

    SetGameplayMICParams();
}

/** Set gameplay related MIC params on the active body MIC */
simulated function SetGameplayMICParams()
{
    local PlayerController PC;
    
    super.SetGameplayMICParams();

    if( WorldInfo.NetMode != NM_DedicatedServer )
    {
        PC = GetALocalPlayerController();
        if( PC != none )
        {
            if( BodyMIC != none )
            {
                BodyMIC.SetScalarParameterValue( 'Scalar_Zedbait', PC.GetTeamNum() == 255 ? 1.f : 0.f );
            }

            if( HeadMIC != none )
            {
                HeadMIC.SetScalarParameterValue( 'Scalar_Zedbait', PC.GetTeamNum() == 255 ? 1.f : 0.f );
            }
        }
    }
}

simulated function NotifyLocalPlayerTeamReceived()
{    
    SetGameplayMICParams();   
}

/*	Let the game type know this player took damage */
event TakeDamage(int Damage, Controller InstigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local int OldHealth;
	local int AppliedDamage;

    OldHealth = Health;

    super.TakeDamage( Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser );

    if( OldHealth > Health )
    {
        AppliedDamage = OldHealth - Health;
    }

	if( AppliedDamage > 0 )
	{
        if( KFGameInfo_VersusSurvival(WorldInfo.Game) != none )
        {
            // Versus TODO: WIP zed scoring work that wasn't completed
            KFGameInfo_VersusSurvival(WorldInfo.Game).ScoreDamage(AppliedDamage,InstigatedBy,Controller, self);
        }
	}
}

defaultproperties
{
    // ---------------------------------------------
    // Special Moves
    Begin Object Name=SpecialMoveHandler_0
        SpecialMoveClasses(SM_SirenVortexVictim)=class'KFSM_PlayerSiren_VortexVictim'
    End Object
}