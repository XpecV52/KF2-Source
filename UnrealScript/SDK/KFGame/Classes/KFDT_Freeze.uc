//=============================================================================
// KFDT_Freeze
//=============================================================================
// Damage caused by cold or ice weapons
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Freeze extends KFDamageType
	abstract;

`include(KFGameDialog.uci)

var protected ParticleSystem FrozenShatterTemplate;

var protected AkBaseSoundObject	ShatterSound;

/** Returns ID of dialog event for killer to speak after killing a zed using this damage type */
static function int GetKillerDialogID()
{
	return `KILL_Freeze;
}

/** Returns ID of dialog event for damager to speak after damaging a zed using this damage type */
static function int GetDamagerDialogID()
{
	return `DAMZ_Freeze;
}

static function PlayShatter(KFPawn P, optional bool bSkipParticles, optional bool bMaterialOnly, optional vector RBLinearVelocity)
{
	local KFPawn_Monster Zed;
	local MaterialInstanceConstant MIC;

	if ( !bMaterialOnly )
	{
		// Switch to gore mesh first so we can apply our gore material param
		Zed = KFPawn_Monster(P);
		if ( Zed != None )
		{
			if ( !Zed.bIsGoreMesh )
			{
				Zed.SwitchToGoreMesh();
			}

	 		Zed.ForceBreakAllConstraints();
	 		// Because we're going outside of the standard gore path, allow for some extra some whole body impulse here
	 		if ( !IsZero(RBLinearVelocity) )
	 		{
	 			P.Mesh.SetRBLinearVelocity(RBLinearVelocity, TRUE);
	 		}
		}

	    if ( !bSkipParticles )
	    {
			P.WorldInfo.MyEmitterPool.SpawnEmitter( default.FrozenShatterTemplate, P.Location, rotator(vect(0,0,1)) );
			P.PlaySoundBase(default.ShatterSound, true,,, P.Location);
		}
	}

	// Force instant freeze on gore MIC
    foreach P.CharacterMICs(MIC)
    {
		MIC.SetScalarParameterValue( 'Scalar_Ice', 1.f );
    }
}

defaultproperties
{
	FreezePower=2.5f
	FrozenShatterTemplate=ParticleSystem'WEP_Freeze_Grenade_EMIT.FX_Freeze_Grenade_Death'
	ShatterSound=AkEvent'WW_WEP_Freeze_Grenade.Play_Freeze_Grenade_Shatter'
}
