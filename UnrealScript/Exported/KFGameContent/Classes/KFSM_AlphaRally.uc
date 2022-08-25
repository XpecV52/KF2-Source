//=============================================================================
// KFSM_AlphaRally
//=============================================================================
// Alpha clot rally special move
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSM_AlphaRally extends KFSM_PlaySingleAnim;

/** Animations to use for rally */
var const protected AnimVariants RallyAnims;

/** If TRUE, will also rally owner pawn */
var const protected bool bRallySelf;

/** Radius around the pawn to rally other zeds when using special rally ability */
var const float RallyRadius;

/** Rally particle systems */
var const protected ParticleSystem RallyEffect, AltRallyEffect;

/** Bone to attach the effect */
var const protected name RallyEffectBoneName;

/** Bones to attach the player rally effect */
var const protected name AltRallyEffectBoneNames[2];

/** Relative effect attachment offsets */
var const protected vector RallyEffectOffset, AltRallyEffectOffset;

static function byte PackRallyFlags()
{
    return Rand( default.RallyAnims.Anims.Length );
}

protected function bool InternalCanDoSpecialMove()
{
    return KFPOwner.Physics == PHYS_Walking
            && KFPOwner.IsCombatCapable();
}

function SpecialMoveStarted(bool bForced, Name PrevMove)
{
	Super.SpecialMoveStarted(bForced, PrevMove);

	if( KFPOwner != none )
	{
		KFPOwner.SetTimer( BlendInTime, false, nameOf(RallyZeds), self );
	}
}

function PlayAnimation()
{
    AnimName = RallyAnims.Anims[KFPOwner.SpecialMoveFlags];

    super.PlayAnimation();
}

function RallyZeds()
{
    local KFPawn_Monster KFPM;

    // Rally nearby zeds
    foreach KFPOwner.WorldInfo.GRI.VisibleCollidingActors( class'KFPawn_Monster', KFPM, RallyRadius, KFPOwner.Location )
    {
        // Skip our own pawn if self-rally is disabled
        if( !bRallySelf && KFPM == KFPOwner )
        {
            continue;
        }        

        if( KFPM.IsHeadless() || !KFPM.IsAliveAndWell() )
        {
            continue;
        }

        // Activate buffs and effects
        KFPM.Rally( KFPOwner,
                    RallyEffect,
                    RallyEffectBoneName,
                    RallyEffectOffset,
                    AltRallyEffect,
                    AltRallyEffectBoneNames,
                    AltRallyEffectOffset );
    }
}

defaultproperties
{
   RallyAnims=(Anims=("Player_Taunt_V1"))
   bRallySelf=True
   RallyRadius=1000.000000
   RallyEffect=ParticleSystem'ZED_Clot_EMIT.FX_ClotA_Rage_01'
   AltRallyEffect=ParticleSystem'ZED_Clot_EMIT.FX_Player_Zed_Buff_01'
   RallyEffectBoneName="Root"
   AltRallyEffectBoneNames(0)="FX_EYE_L"
   AltRallyEffectBoneNames(1)="FX_EYE_R"
   RallyEffectOffset=(X=0.000000,Y=0.000000,Z=2.000000)
   bUseRootMotion=True
   bDisableMovement=True
   bPawnRotationLocked=True
   Name="Default__KFSM_AlphaRally"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
