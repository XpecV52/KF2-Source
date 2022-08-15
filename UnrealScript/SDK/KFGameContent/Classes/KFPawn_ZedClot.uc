//=============================================================================
// KFPawn_ZedClot
//=============================================================================
// Base pawn class for Clots
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFPawn_ZedClot extends KFPawn_Monster
	abstract;

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	Super.PostInitAnimTree( SkelComp );

	if( bCanHeadTrack )
	{
		IK_Look_Head		= SkelControlLookAt(Mesh.FindSkelControl('HeadLook'));
		//IK_Look_Spine       = SkelControlLookAt(Mesh.FindSkelControl('SpineLook'));
	}
}

// function CrushedBy( Pawn OtherPawn )
// {
// 	// Let a falling Fleshpound kill any clots it lands on
// 	if( OtherPawn.IsA('KFPawn_ZedFleshpound') )
// 	{
// 		TakeDamage( 10000, OtherPawn.Controller,Location, vect(0,0,0) , class'DmgType_Crushed' );
// 		return;
// 	}
//
// 	super.CrushedBy( OtherPawn );
// }

/** Returns (hardcoded) dialog event ID for when players spots this zed type */
function int GetSpotterDialogID()
{
	local int EmergeType;

	if( IsDoingSpecialMove(SM_Emerge) )
    {
        EmergeType = SpecialMoveFlags & 0x0f;
        switch( EmergeType )
        {
        case EMERGE_Floor:
            return 142;//SPOTZ_EmergeFloor

        case EMERGE_Wall248UU:
        case EMERGE_WallHigh:
            return 140;//SPOTZ_EmergeVent

        case EMERGE_Ceiling:
            return 141;//SPOTZ_EmergeCeiling
        };
    }

	return 125;//SPOTZ_Generic
}

DefaultProperties
{
	Begin Object Name=KFPawnSkeletalMeshComponent
		bPerBoneMotionBlur=false
	End Object

	// ---------------------------------------------
	// Content
	CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Clot_ARCH.ZED_Clot_UnDev_Archetype'

	// ---------------------------------------------
	// Gameplay
	bCanGrabAttack=true
	Begin Object Name=MeleeHelper_0
		BaseDamage=6.f
		MaxHitRange=172.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
	End Object
	Health=100 // 67% KF1 scale
	DoshValue=7.0
	Mass=50.f
	KnockedDownBySonicWaveOdds=0.23f

	// ---------------------------------------------
	// Movement / Physics
	GroundSpeed=190.f
	SprintSpeed=400.f

	// ---------------------------------------------
	// Special Moves
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_GrabAttack)=class'KFGame.KFSM_GrappleAttack'
		SpecialMoveClasses(SM_Grab)=class'KFGame.KFSM_GrappleStart'
		SpecialMoveClasses(SM_Taunt)=class'KFGame.KFSM_Zed_Taunt'
		SpecialMoveClasses(SM_Emerge)=class'KFSM_Emerge'
		SpecialMoveClasses(SM_Evade)=class'KFSM_Evade'
		SpecialMoveClasses(SM_Evade_Fear)=class'KFSM_Evade_Fear'
	End Object

	Begin Object Name=Afflictions_0
		InstantAffl(IAF_Stun)=(Head=100,Torso=100,Leg=100,Arm=100,Cooldown=3.0)
		InstantAffl(IAF_Knockdown)=(Head=100,Torso=100,Leg=100,Arm=100,Cooldown=8.0)
		InstantAffl(IAF_Stumble)=(Head=100,Torso=100,Arm=100,Cooldown=1.0)
		InstantAffl(IAF_LegStumble)=(Leg=100,Cooldown=1.0)
		InstantAffl(IAF_GunHit)=(Head=100,Torso=100,Leg=100,Arm=100,Cooldown=1.0)
		InstantAffl(IAF_MeleeHit)=(Head=100,Torso=100,Leg=100,Arm=100,Cooldown=1.0)
		StackingAffl(SAF_FirePanic)=(Threshhold=1.0,Duration=5.0,Cooldown=5.0,DissipationRate=1.0)
	End Object

    ResistantDamageTypes.Add((DamageType=class'KFDT_Microwave'))

	// ---------------------------------------------
	// AI / Navigation
	//DebugRange_Melee_Material=Material'ENG_EditorResources_MAT.Debug_Radius_M'
	RotationRate=(Pitch=50000,Yaw=30000,Roll=50000)
}
