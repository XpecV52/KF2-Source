//=============================================================================
// KFPawn_ZedClot_Slasher_Versus
//=============================================================================
// Slash Versus pawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedClot_Slasher_Versus extends KFPawn_ZedClot_Slasher;

/** Custom third person camera offsets */
var() float	MegaJumpZ;

/** Mega Jump Forward Scale */
var() float	MegaJumpForwardScale;

/** Returns the sprint jump velocity, used in modifying jump mechanics while sprinting */
simulated function vector GetSprintJumpVelocity( vector ViewDirection )
{
	return ViewDirection * MegaJumpZ * GetDirectionalJumpScale();
}

simulated function float GetJumpZ()
{
	return MegaJumpZ;
}

simulated function float GetDirectionalJumpScale()
{
	return MegaJumpForwardScale;
}

defaultproperties
{
	bVersusZed=true
	TeammateCollisionRadiusPercent=0.30

	LocalizationKey=KFPawn_ZedClot_Slasher
	bHasExtraSprintJumpVelocity=true

	// Really fast sprint
    SprintSpeed=600.f
    SprintStrafeSpeed=450.f    
    GroundSpeed=430.f

	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_PlayerZedAttack1)= class'KFSM_PlayerSlasher_Melee'
		SpecialMoveClasses(SM_PlayerZedAttack2)= class'KFSM_PlayerSlasher_Melee2'
		SpecialMoveClasses(SM_PlayerZedSpecial1)= class'KFSM_PlayerSlasher_Roll'
	End Object

	SpecialMoveCooldowns(0)=(SMHandle=SM_PlayerZedAttack1,		CooldownTime=0.25f,	SpecialMoveIcon=Texture2D'ZED_Slasher_UI.ZED-VS_Icons_Slasher-Melee', GBA_Name="GBA_Fire",NameLocalizationKey="Light")
	SpecialMoveCooldowns(1)=(SMHandle=SM_PlayerZedAttack2,		CooldownTime=1.0f,	SpecialMoveIcon=Texture2D'ZED_Slasher_UI.ZED-VS_Icons_Slasher-HeavyMelee', GBA_Name="GBA_IronsightsToggle", ALT_GBA_Name="GBA_IronsightsHold",NameLocalizationKey="Heavy")
	SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,					CooldownTime=0.0f,	GBA_Name="GBA_Reload",bShowOnHud=false)
	SpecialMoveCooldowns(3)=(SMHandle=SM_PlayerZedSpecial1,		CooldownTime=0.2f,	SpecialMoveIcon=Texture2D'ZED_Slasher_UI.ZED-VS_Icons_Slasher-Evade', GBA_Name="GBA_TertiaryFire",NameLocalizationKey="Evade")
	SpecialMoveCooldowns.Add((SMHandle=SM_Jump,					CooldownTime=1.0f,	SpecialMoveIcon=Texture2D'ZED_Slasher_UI.ZED-VS_Icons_Slasher-Jump', GBA_Name="GBA_Jump",NameLocalizationKey="Jump")) // Jump always at end of array)) // Jump always at end of array

	InstantIncaps(IAF_Stun)=(Head=68,Torso=90,Leg=90,Arm=90,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_Knockdown)=(Head=40,Torso=50,Leg=50,Arm=50,LowHealthBonus=10,Cooldown=8.0)
	InstantIncaps(IAF_Stumble)=(Head=60,Torso=65,Arm=65,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_LegStumble)=(Leg=60,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_GunHit)=(Head=98,Torso=98,Leg=98,Arm=98,LowHealthBonus=10,Cooldown=0.0)
	InstantIncaps(IAF_MeleeHit)=(Head=20,Torso=20,Leg=20,Arm=20,LowHealthBonus=10,Cooldown=0.0)
	StackingIncaps(SAF_Poison)=(Threshhold=1.0,Duration=2.0,Cooldown=5.0,DissipationRate=1.00)
	StackingIncaps(SAF_Microwave)=(Threshhold=1.0,Duration=2.0,Cooldown=5.0,DissipationRate=1.00)
	StackingIncaps(SAF_FirePanic)=(Threshhold=0.9,Duration=5,Cooldown=7.0,DissipationRate=0.07)

	Begin Object Name=MeleeHelper_0
		BaseDamage=17.f // 12.f
		MaxHitRange=172.f
		MomentumTransfer=25000.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
		MeleeImpactCamScale=0.2
		PlayerDoorDamageMultiplier=5.f
	End Object
	MeleeAttackHelper=MeleeHelper_0

    Health=325 // 2.5x default //250
    // Override Head GoreHealth (aka HeadHealth)
    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=75, DmgScale=1.1, SkinID=1) // default is 20
    DoshValue=35.0 // 5x default because they are harder to hit

    MegaJumpZ=1250
    MegaJumpForwardScale=0.25
    JumpBumpDamageType=class'KFDT_Bludgeon_ZedJump'

	ThirdPersonViewOffset={(
		OffsetHigh=(X=-175,Y=50,Z=0),
		OffsetLow=(X=-220,Y=50,Z=0),
		OffsetMid=(X=-145,Y=50,Z=-30),
		)}
}
