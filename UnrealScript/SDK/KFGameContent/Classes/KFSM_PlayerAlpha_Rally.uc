//=============================================================================
// KFSM_PlayerAlpha_Rally
//=============================================================================
// Player controlled alpha clot rally special move
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerAlpha_Rally extends KFSM_PlayerMeleeBase;

/** Radius around the pawn to rally other zeds when using special rally ability */
var float RallyRadius;

/** Rally particle system */
var ParticleSystem RallyEffect;

/** Bone to attach the effect */
var name RallyEffectBoneName;

/** Relative effect attachment offset */
var vector RallyEffectOffset;

protected function bool InternalCanDoSpecialMove()
{
    if( KFPOwner == none || KFPOwner.Physics != PHYS_Walking )
    {
        return false;
    }

    return super.InternalCanDoSpecialMove();
}

function SpecialMoveStarted(bool bForced, Name PrevMove)
{
	Super.SpecialMoveStarted(bForced, PrevMove);

	if( KFPOwner != none )
	{
		RallyZeds();
	}
}

function RallyZeds()
{
    local KFPawn_Monster KFPM;
    local KFAIController KFAIC;

    // Rally nearby zeds
    foreach KFPOwner.VisibleCollidingActors( class'KFPawn_Monster', KFPM, RallyRadius, KFPOwner.Location )
    {
        if( KFPM.bVersusZed )
        {
            continue;
        }

        if( KFPM.IsHeadless() || !KFPM.IsAliveAndWell() )
        {
            continue;
        }

        if( KFPOwner.Role == ROLE_Authority )
        {
            KFAIC = KFAIController( KFPM.Controller );
            KFAIC.SetSprintingDisabled( false );
            KFAIC.SetCanSprint( true );
            KFAIC.bDefaultCanSprint = true;
            KFAIC.bForceFrustration = true;

            // Trigger sprint/rage immediately
            KFPM.SetSprinting( true );
            KFPM.SetEnraged( true );
        }

        KFPM.SpawnRallyEffect( RallyEffect, RallyEffectBoneName, RallyEffectOffset );
    }
}

defaultproperties
{
    RallyRadius=1000.f
    RallyEffect=ParticleSystem'ZED_Clot_EMIT.FX_ClotA_Rage_01'
    RallyEffectBoneName=Root
    RallyEffectOffset=(X=0, Y=0, Z=2)

	Attacks.Add((Type=PZA_Default,  Stance=EAS_FullBody, Anims=(Player_Taunt_V1, Player_Taunt_V2, Player_Taunt_V3, Player_Taunt_V4)))
}