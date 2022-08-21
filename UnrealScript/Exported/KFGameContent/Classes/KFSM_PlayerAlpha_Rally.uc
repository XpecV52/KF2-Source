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

/** Rally particle systems */
var ParticleSystem RallyEffect, PlayerRallyEffect;

/** Bone to attach the effect */
var name RallyEffectBoneName;

/** Bones to attach the player rally effect */
var name PlayerRallyEffectBoneNames[2];

/** Relative effect attachment offsets */
var vector RallyEffectOffset, PlayerRallyEffectOffset;

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
		KFPOwner.SetTimer( 0.3f, false, nameOf(RallyZeds), self );
	}
}

function RallyZeds()
{
    local KFPawn_Monster KFPM;

    // Rally nearby zeds
    foreach KFPOwner.VisibleCollidingActors( class'KFPawn_Monster', KFPM, RallyRadius, KFPOwner.Location )
    {
        if( KFPM.IsHeadless() || !KFPM.IsAliveAndWell() )
        {
            continue;
        }

        // Activate buffs and effects
        KFPM.Rally( RallyEffect,
                    RallyEffectBoneName,
                    RallyEffectOffset,
                    PlayerRallyEffect,
                    PlayerRallyEffectBoneNames,
                    PlayerRallyEffectOffset );
    }
}

defaultproperties
{
   RallyRadius=1000.000000
   RallyEffect=ParticleSystem'ZED_Clot_EMIT.FX_ClotA_Rage_01'
   PlayerRallyEffect=ParticleSystem'ZED_Clot_EMIT.FX_Player_Zed_Buff_01'
   RallyEffectBoneName="Root"
   PlayerRallyEffectBoneNames(0)="RightHand"
   PlayerRallyEffectBoneNames(1)="LeftHand"
   RallyEffectOffset=(X=0.000000,Y=0.000000,Z=2.000000)
   Attacks(0)=(Anims=("Player_Taunt_V1","Player_Taunt_V2","Player_Taunt_V3","Player_Taunt_V4"))
   Name="Default__KFSM_PlayerAlpha_Rally"
   ObjectArchetype=KFSM_PlayerMeleeBase'KFGame.Default__KFSM_PlayerMeleeBase'
}
