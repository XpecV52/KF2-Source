//=============================================================================
// KFPawn_ZedSiren_Versus
//=============================================================================
// Siren Versus pawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedSiren_Versus extends KFPawn_ZedSiren;

function SetSprinting( bool bNewSprintStatus )
{
	if( bNewSprintStatus && (IsDoingSpecialMove(SM_PlayerZedAttack1) || IsDoingSpecialMove(SM_PlayerZedAttack2)) )
	{
		return;
	}

	super.SetSprinting( bNewSprintStatus );
}

defaultproperties
{
	bVersusZed=true
	TeammateCollisionRadiusPercent=0.30

	LocalizationKey=KFPawn_ZedSiren

	// Off by default, turned on by the vortex SM
	bCanHeadTrack=false
	bIsHeadTrackingActive=false

	Begin Object Name=MeleeHelper_0
		BaseDamage=13.f
		MaxHitRange=180.f
		MomentumTransfer=100000.f // for kick
		MyDamageType=class'KFDT_Slashing_ZedWeak'
		MeleeImpactCamScale=0.2
		PlayerDoorDamageMultiplier=5.f
	End Object
	MeleeAttackHelper=MeleeHelper_0

	Begin Object Name=SpecialMoveHandler_0
	SpecialMoveClasses(SM_PlayerZedAttack1)=class'KFSM_PlayerSiren_NormalScream'
	SpecialMoveClasses(SM_PlayerZedAttack2)=class'KFSM_PlayerSiren_VortexScream'
	SpecialMoveClasses(SM_PlayerZedSpecial1)=class'KFSM_PlayerSiren_Melee'
	End Object

	SpecialMoveCooldowns(0)=(SMHandle=SM_PlayerZedAttack1,		CooldownTime=2.5f,		SpecialMoveIcon=Texture2D'ZED_Siren_UI.ZED-VS_Icons_Siren-Scream', GBA_Name="GBA_Fire",NameLocalizationKey="Scream")
	SpecialMoveCooldowns(1)=(SMHandle=SM_PlayerZedAttack2,		CooldownTime=8.0f,		SpecialMoveIcon=Texture2D'ZED_Siren_UI.ZED-VS_Icons_Siren-PullIn', GBA_Name="GBA_IronsightsToggle",NameLocalizationKey="Vortex")
	SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,					CooldownTime=0.0f,		GBA_Name="GBA_Reload",bShowOnHud=false)
	SpecialMoveCooldowns(3)=(SMHandle=SM_PlayerZedSpecial1,		CooldownTime=0.0f,		SpecialMoveIcon=Texture2D'ZED_Siren_UI.ZED-VS_Icons_Siren-Bite', GBA_Name="GBA_TertiaryFire",NameLocalizationKey="Bite")
	SpecialMoveCooldowns.Add((SMHandle=SM_Jump,					CooldownTime=1.5f,		SpecialMoveIcon=Texture2D'ZED_Siren_UI.ZED-VS_Icons_Siren-Jump', GBA_Name="GBA_Jump",bShowOnHud=false)) // Jump always at end of array

	InstantIncaps(IAF_Stun)=(Head=68,Torso=90,Leg=90,Arm=90,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_Knockdown)=(Head=50,Torso=80,Leg=80,Arm=80,Special=50,LowHealthBonus=10,Cooldown=9.0)
	InstantIncaps(IAF_Stumble)=(Head=60,Torso= 65,Arm=65,Special=65,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_LegStumble)=(Leg=60,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_GunHit)=(Head=105,Torso=105,Leg=105,Arm=105,LowHealthBonus=10,Cooldown=0.5)
	InstantIncaps(IAF_MeleeHit)=(Head=23,Torso=29,Leg=29,Arm=29,LowHealthBonus=10,Cooldown=0.35)
	StackingIncaps(SAF_Poison)=(Threshhold=3.0,Duration=4.0,Cooldown=8.5,DissipationRate=1.00)
	StackingIncaps(SAF_Microwave)=(Threshhold=3.0,Duration=4.0,Cooldown=8.5,DissipationRate=1.00)
	StackingIncaps(SAF_FirePanic)=(Threshhold=12.0,Duration=2.0,Cooldown=5.0,DissipationRate=1.0)
	StackingIncaps(SAF_EMPPanic)=(Threshhold=1.5,Duration=2.0,Cooldown=5.0,DissipationRate=0.5)
	StackingIncaps(SAF_EMPDisrupt)=(Threshhold=0.0,Duration=2.0,Cooldown=5.0,DissipationRate=1.0)
	StackingIncaps(SAF_Freeze)=(Threshhold=2.0,Duration=1.0,Cooldown=5.0,DissipationRate=0.33)

    SprintSpeed=450.0f
    SprintStrafeSpeed=300.f
    GroundSpeed=200.0f

//	Health=230
//	// Custom Hit Zones (HeadHealth, SkinTypes, etc...)
//    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=155, DmgScale=1.1, SkinID=1) // KF1=200

    DoshValue=25.0 // default because they have the same health as survival
    XPValues(0)=22 // 2x default because they are harder to hit/kill

	//defaults
	ThirdPersonViewOffset={(
		OffsetHigh=(X=-175,Y=50,Z=25),
		OffsetLow=(X=-220,Y=50,Z=50),
		OffsetMid=(X=-140,Y=50,Z=-10),
		)}
}
