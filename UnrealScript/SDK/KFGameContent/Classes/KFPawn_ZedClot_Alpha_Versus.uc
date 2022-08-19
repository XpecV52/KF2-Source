//=============================================================================
// KFPawn_ZedClot_Alpha_Versus
//=============================================================================
// Alpha clot
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedClot_Alpha_Versus extends KFPawn_ZedClot_Alpha;

defaultproperties
{
	bVersusZed=true
	TeammateCollisionRadiusPercent=0.30

    LocalizationKey=KFPawn_ZedClot_Alpha

	//defaults
	Begin Object Name=MeleeHelper_0
		BaseDamage=10.f
		MaxHitRange=172.f
		MomentumTransfer=25000.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
		MeleeImpactCamScale=0.2
		PlayerDoorDamageMultiplier=5.f
	End Object
	MeleeAttackHelper=MeleeHelper_0

	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_PlayerZedAttack1)=class'KFSM_PlayerAlpha_Melee'
		SpecialMoveClasses(SM_PlayerZedAttack2)=class'KFSM_PlayerAlpha_Grab'
		SpecialMoveClasses(SM_PlayerZedSpecial1)=class'KFSM_PlayerAlpha_Rally'
	End Object

	SpecialMoveCooldowns(0)=(SMHandle=SM_PlayerZedAttack1,		CooldownTime=0.25f, SpecialMoveIcon=Texture2D'ZED_Clot_UI.ZED-VS_Icons_AlphaClot-Melee', GBA_Name="GBA_Fire",NameLocalizationKey="Melee")
	SpecialMoveCooldowns(1)=(SMHandle=SM_PlayerZedAttack2,		CooldownTime=0.0f,  SpecialMoveIcon=Texture2D'ZED_Clot_UI.ZED-VS_Icons_AlphaClot-Grab', GBA_Name="GBA_IronsightsToggle", ALT_GBA_Name="GBA_IronsightsHold",NameLocalizationKey="Grab")
	SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,					CooldownTime=0.0f,  GBA_Name="GBA_Reload",bShowOnHud=false)
	SpecialMoveCooldowns(3)=(SMHandle=SM_PlayerZedSpecial1,		CooldownTime=1.5f,  SpecialMoveIcon=Texture2D'ZED_Clot_UI.ZED-VS_Icons_AlphaClot-Enrage', GBA_Name="GBA_TertiaryFire",NameLocalizationKey="Rally")
	SpecialMoveCooldowns.Add((SMHandle=SM_Jump,					CooldownTime=1.f, 	SpecialMoveIcon=Texture2D'ZED_Clot_UI.ZED-VS_Icons_AlphaClot-Jump', GBA_Name="GBA_Jump",bShowOnHud=false)) // Jump always at end of array

	bWeakZedGrab=false

	InstantIncaps(IAF_Stun)=(Head=68,Torso=90,Leg=90,Arm=90,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_Knockdown)=(Head=40,Torso=50,Leg=50,Arm=50,LowHealthBonus=10,Cooldown=8.0)
	InstantIncaps(IAF_Stumble)=(Head=60,Torso=65,Arm=65,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_LegStumble)=(Leg=60,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_GunHit)=(Head=98,Torso=98,Leg=98,Arm=98,LowHealthBonus=10,Cooldown=0.0)
	InstantIncaps(IAF_MeleeHit)=(Head=20,Torso=20,Leg=20,Arm=20,LowHealthBonus=10,Cooldown=0.0)
	StackingIncaps(SAF_Poison)=(Threshhold=1.0,Duration=2.0,Cooldown=10.0,DissipationRate=1.00)
	StackingIncaps(SAF_Microwave)=(Threshhold=1.0,Duration=2.0,Cooldown=10.0,DissipationRate=1.00)
	StackingIncaps(SAF_FirePanic)=(Threshhold=0.9,Duration=5,Cooldown=7.0,DissipationRate=0.07)

    Health=455 // 4.5x default //300.f
    // Override Head GoreHealth (aka HeadHealth)
    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=85, DmgScale=1.1, SkinID=1) // default is 20
    DoshValue=20.0 // 2x default because they are harder to hit
    XPValues(0)=32 // 4x default because they are harder to hit

    // Vulnerable damage types
    VulnerableDamageTypes.Add((DamageType=class'KFGameContent.KFDT_Ballistic_AR15', DamageScale=1.5))
    VulnerableDamageTypes.Add((DamageType=class'KFGameContent.KFDT_Ballistic_Rem1858', DamageScale=1.5))

    SprintSpeed=570.f
    SprintStrafeSpeed=325.f
    GroundSpeed=250.f

	//defaults
	ThirdPersonViewOffset={(
		OffsetHigh=(X=-140,Y=50,Z=0),
		OffsetLow=(X=-220,Y=50,Z=50),
		OffsetMid=(X=-160,Y=50,Z=0),
		)}
}
