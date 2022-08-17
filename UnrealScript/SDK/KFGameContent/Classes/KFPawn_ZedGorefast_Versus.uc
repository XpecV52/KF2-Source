//=============================================================================
// KFPawn_ZedGorefast_Versus
//=============================================================================
// Gorefast Versus pawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedGorefast_Versus extends KFPawn_ZedGorefast;

DefaultProperties
{
	bVersusZed=true
	TeammateCollisionRadiusPercent=0.30

	LocalizationKey=KFPawn_ZedGorefast
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_PlayerZedAttack1)= class'KFSM_PlayerGorefast_Melee'
		SpecialMoveClasses(SM_PlayerZedAttack2)= class'KFSM_PlayerGorefast_Melee2'
		SpecialMoveClasses(SM_PlayerZedSpecial1)= class'KFSM_PlayerGorefast_Melee3'
	End Object

	Begin Object Name=MeleeHelper_0
		BaseDamage=25.f//25.f
		MaxHitRange=192.f
		MomentumTransfer=25000.f
		MyDamageType=class'KFDT_Slashing_Gorefast'
		MeleeImpactCamScale=0.2
		PlayerDoorDamageMultiplier=5.f
	End Object

	SpecialMoveCooldowns(0)=(SMHandle=SM_PlayerZedAttack1,		CooldownTime=0.35f,	SpecialMoveIcon=Texture2D'ZED_Gorefast_UI.ZED-VS_Icons_Gorefast-Melee', GBA_Name="GBA_Fire",NameLocalizationKey="Light")
	SpecialMoveCooldowns(1)=(SMHandle=SM_PlayerZedAttack2,		CooldownTime=0.7f,	SpecialMoveIcon=Texture2D'ZED_Gorefast_UI.ZED-VS_Icons_Gorefast-HeavyMelee', GBA_Name="GBA_IronsightsToggle", ALT_GBA_Name="GBA_IronsightsHold",NameLocalizationKey="Heavy")
	SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,					CooldownTime=0.0f,	GBA_Name="GBA_Reload",bShowOnHud=false)
	SpecialMoveCooldowns(3)=(SMHandle=SM_PlayerZedSpecial1,		CooldownTime=1.7f,	SpecialMoveIcon=Texture2D'ZED_Gorefast_UI.ZED-VS_Icons_Gorefast-BladeSwing', GBA_Name="GBA_TertiaryFire",NameLocalizationKey="Spin")
	SpecialMoveCooldowns.Add((SMHandle=SM_Jump,					CooldownTime=1.f,	SpecialMoveIcon=Texture2D'ZED_Gorefast_UI.ZED-VS_Icons_Gorefast-Jump', GBA_Name="GBA_Jump",bShowOnHud=false)) // Jump always at end of array

	InstantIncaps(IAF_Stun)=(Head=68,Torso=90,Leg=90,Arm=90,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_Knockdown)=(Head=50,Torso=75,Leg=56,Arm=75,LowHealthBonus=10,Cooldown=9.0)
	InstantIncaps(IAF_Stumble)=(Head=60,Torso=65,Arm=65,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_LegStumble)=(Leg=60,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_GunHit)=(Head=106,Torso=106,Leg=106,Arm=106,LowHealthBonus=10,Cooldown=1.5)
	InstantIncaps(IAF_MeleeHit)=(Head=20,Torso=27,Leg=25,Arm=25,LowHealthBonus=10,Cooldown=0.3)
	StackingIncaps(SAF_Poison)=(Threshhold=2.0,Duration=2.0,Cooldown=12.5,DissipationRate=1.00)
	StackingIncaps(SAF_Microwave)=(Threshhold=2.0,Duration=2.0,Cooldown=12.5,DissipationRate=1.00)
	StackingIncaps(SAF_FirePanic)=(Threshhold=2.0,Duration=2.5,Cooldown=6.0,DissipationRate=1.00)

	// Resistant damage types
    ResistantDamageTypes.Add((DamageType=class'KFDT_Slashing', DamageScale=0.2f))
    ResistantDamageTypes.Add((DamageType=class'KFDT_Bludgeon', DamageScale=0.2f))

    Health=360.f // 2.5x default
    DoshValue=48.0 // 4x default because they are harder to hit/kill

    // Override Head GoreHealth (aka HeadHealth)
    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=100, DmgScale=1.1, SkinID=1) // default is 20

    // Really fast sprint
    SprintSpeed=580.f
    SprintStrafeSpeed=350.f
    GroundSpeed=320.f

	//defaults
	ThirdPersonViewOffset={(
		OffsetHigh=(X=-175,Y=50,Z=25),
		OffsetLow=(X=-220,Y=50,Z=50),
		OffsetMid=(X=-140,Y=50,Z=-10),
		)}
}