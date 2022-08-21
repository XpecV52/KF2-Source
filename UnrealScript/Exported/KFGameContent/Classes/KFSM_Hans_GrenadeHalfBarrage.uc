//=============================================================================
// KFSM_Hans_GrenadeHalfBarrage
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_Hans_GrenadeHalfBarrage extends KFSM_Hans_GrenadeBarrage;

function SpecialMoveStarted( bool bForced, name PrevMove )
{
	local KFPawn_ZedHansBase HansPawn;

	HansPawn = KFPawn_ZedHansBase(PawnOwner);
	if( HansPawn != none )
	{
		HansPawn.PlayGrenadeDialog( true );
	}

	super.SpecialMoveStarted( bForced, PrevMove );
}

defaultproperties
{
   AnimName="Atk_Nade4Barrage_V1"
   Handle="KFSM_Hans_GrenadeHalfBarrage"
   Name="Default__KFSM_Hans_GrenadeHalfBarrage"
   ObjectArchetype=KFSM_Hans_GrenadeBarrage'kfgamecontent.Default__KFSM_Hans_GrenadeBarrage'
}
