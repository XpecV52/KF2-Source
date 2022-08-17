//=============================================================================
// KFPawn_ZedStalker
//=============================================================================
// Stalker
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedStalker_Versus extends KFPawn_ZedStalker;

/** Keeps track of cloaking states */
var bool bWasCloaked;

/**
* Check on various replicated data and act accordingly.
*/
simulated event ReplicatedEvent( name VarName )
{
	switch( VarName )
	{
		case nameOf(bIsCloaking):
			ClientCloakingStateUpdated();
			break;

		default:
			break;
	}

	super.ReplicatedEvent( VarName );
}

/** Toggle cloaking material */
function SetCloaked(bool bNewCloaking)
{
	super.SetCloaked( bNewCloaking );

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		ClearBloodDecals();
	}
}

/**
 * bIsCloaking replicated state changed
 * Network: Local and Remote Clients
 */
simulated function ClientCloakingStateUpdated()
{
	if( bIsCloaking )
	{
		ClearBloodDecals();
	}
}

/**
 * Called every 0.5f seconds to check if a cloaked zed has been spotted
 * Network: All but dedicated server
 */
simulated event UpdateSpottedStatus()
{
	if( !bIsSprinting )
	{
		if( bIsCloakingSpottedByLP )
		{
			bIsCloakingSpottedByLP = false;
			SetGameplayMICParams();
		}

		return;
	}

	super.UpdateSpottedStatus();
}

/** notification from player with CallOut ability */
function CallOutCloaking( optional KFPlayerController CallOutController )
{
	if( !bIsSprinting )
	{
		if( bIsCloakingSpottedByTeam )
		{
			bIsCloakingSpottedByTeam = false;
			SetGameplayMICParams();		
		}

		return;
	}

	super.CallOutCloaking( CallOutController );
}

defaultproperties
{
	bVersusZed=true
	TeammateCollisionRadiusPercent=0.30

	LocalizationKey=KFPawn_ZedStalker

	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_PlayerZedAttack1)= class'KFSM_PlayerStalker_Melee'
		SpecialMoveClasses(SM_PlayerZedAttack2)= class'KFSM_PlayerStalker_Melee2'
		SpecialMoveClasses(SM_PlayerZedSpecial1)= class'KFSM_PlayerStalker_Roll'
	End Object

	SpecialMoveCooldowns(0)=(SMHandle=SM_PlayerZedAttack1,		CooldownTime=0.25f,	SpecialMoveIcon=Texture2D'ZED_Stalker_UI.ZED-VS_Icons_Stalker-Melee', GBA_Name="GBA_Fire",NameLocalizationKey="Light")
	SpecialMoveCooldowns(1)=(SMHandle=SM_PlayerZedAttack2,		CooldownTime=1.0f,	SpecialMoveIcon=Texture2D'ZED_Stalker_UI.ZED-VS_Icons_Stalker-HeavyMelee', GBA_Name="GBA_IronsightsToggle", ALT_GBA_Name="GBA_IronsightsHold",NameLocalizationKey="Heavy")
	SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,					CooldownTime=0.0f,	GBA_Name="GBA_Reload",bShowOnHud=false)
	SpecialMoveCooldowns(3)=(SMHandle=SM_PlayerZedSpecial1,		CooldownTime=0.35f,	SpecialMoveIcon=Texture2D'ZED_Stalker_UI.ZED-VS_Icons_Stalker-Evade', GBA_Name="GBA_TertiaryFire",NameLocalizationKey="Evade")
	SpecialMoveCooldowns.Add((SMHandle=SM_Jump,					CooldownTime=1.0f,	SpecialMoveIcon=Texture2D'ZED_Stalker_UI.ZED-VS_Icons_Stalker-Jump', GBA_Name="GBA_Jump",bShowOnHud=false)) // Jump always at end of array)) // Jump always at end of array

	InstantIncaps(IAF_Stun)=(Head=68,Torso=90,Leg=90,Arm=90,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_Knockdown)=(Head=50,Torso=75,Leg=75,Arm=75,LowHealthBonus=10,Cooldown=9.0)
	InstantIncaps(IAF_Stumble)=(Head=60,Torso=65,Arm=65,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_LegStumble)=(Leg=60,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_GunHit)=(Head=106,Torso=106,Leg=106,Arm=106,LowHealthBonus=10,Cooldown=1.0)
	InstantIncaps(IAF_MeleeHit)=(Head=23,Torso=29,Leg=29,Arm=29,LowHealthBonus=10,Cooldown=0.35)
	StackingIncaps(SAF_Poison)=(Threshhold=6.0,Duration=5.0,Cooldown=20.5,DissipationRate=1.00)
	StackingIncaps(SAF_Microwave)=(Threshhold=3.0,Duration=5.0,Cooldown=20.5,DissipationRate=1.00)
	StackingIncaps(SAF_FirePanic)=(Threshhold=2.0,Duration=2.5,Cooldown=5.0,DissipationRate=0.05)

	//defaults
	Begin Object Name=MeleeHelper_0
		BaseDamage=18.f
		MaxHitRange=180.f
		MomentumTransfer=25000.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
		MeleeImpactCamScale=0.2
		PlayerDoorDamageMultiplier=5.f
	End Object
	MeleeAttackHelper=MeleeHelper_0

	Health=200 // 2.5x default
    // Override Head GoreHealth (aka HeadHealth)
    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=75, DmgScale=1.1, SkinID=1) // default is 20
    DoshValue=60.0 // 4x default because they are harder to hit/kill

    // Really fast sprint
    SprintSpeed=620.f
    SprintStrafeSpeed=425.f
    GroundSpeed=390.f

	//defaults
	ThirdPersonViewOffset={(
		OffsetHigh=(X=-175,Y=50,Z=25),
		OffsetLow=(X=-220,Y=50,Z=50),
		OffsetMid=(X=-150,Y=50,Z=-30),
		)}
}
