//=============================================================================
// KFPawn_ZedScrake_Versus
//=============================================================================
// Scrake Versus pawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedScrake_Versus extends KFPawn_ZedScrake;

//get rif of ragemode sprint
function SetSprinting(bool bNewSprintStatus)
{
	if( bEmpDisrupted )
	{
		bNewSprintStatus = false;
	}

	if( bNewSprintStatus )
	{
		// Wait for uncrouch; see CheckJumpOrDuck
		if ( bIsCrouched )
		{
			bNewSprintStatus = false;
		}
		else if ( MyKFWeapon != None && !MyKFWeapon.AllowSprinting() )
		{
			bNewSprintStatus = false;
		}
	}

	bIsSprinting = bNewSprintStatus;

	if ( MyKFWeapon != None )
	{
		MyKFWeapon.SetWeaponSprint(bNewSprintStatus);
	}
}

/** Puts all moves on this pawn on cooldown */
function PutAllMovesOnCooldown()
{
	/*local int i;

	// Allow primary attack to still function
	for( i = 1; i < SpecialMoveCooldowns.Length; ++i )
	{
		if( SpecialMoveCooldowns[i].SMHandle != SM_None )
		{
			SpecialMoveCooldowns[i].LastUsedTime = WorldInfo.TimeSeconds;
		}
	}*/
}

DefaultProperties
{
	bVersusZed=true
	TeammateCollisionRadiusPercent=0.30

	LocalizationKey=KFPawn_ZedScrake

	Health=1565//1265

	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_PlayerZedAttack1)= class'KFSM_PlayerScrake_Melee'
		SpecialMoveClasses(SM_PlayerZedAttack2)= class'KFSM_PlayerScrake_Melee2'
		SpecialMoveClasses(SM_PlayerZedSpecial1)= class'KFSM_PlayerScrake_Melee3'
	End Object

	SpecialMoveCooldowns(0)=(SMHandle=SM_PlayerZedAttack1,		CooldownTime=0.5f,  SpecialMoveIcon=Texture2D'ZED_Scrake_UI.ZED-VS_Icons_Scrake-LightLunge', GBA_Name="GBA_Fire",NameLocalizationKey="Light")
	SpecialMoveCooldowns(1)=(SMHandle=SM_PlayerZedAttack2,		CooldownTime=1.5f,  SpecialMoveIcon=Texture2D'ZED_Scrake_UI.ZED-VS_Icons_Scrake-HeavyLunge', GBA_Name="GBA_IronsightsToggle", ALT_GBA_Name="GBA_IronsightsHold",NameLocalizationKey="Heavy")
	SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,					CooldownTime=1.0f,  GBA_Name="GBA_Reload",bShowOnHud=false)
	SpecialMoveCooldowns(3)=(SMHandle=SM_PlayerZedSpecial1,		CooldownTime=2.5f,  SpecialMoveIcon=Texture2D'ZED_Scrake_UI.ZED-VS_Icons_Scrake-SpinAttack', GBA_Name="GBA_TertiaryFire",NameLocalizationKey="Spin")
	SpecialMoveCooldowns.Add((SMHandle=SM_Jump,					CooldownTime=1.25f, SpecialMoveIcon=Texture2D'ZED_Scrake_UI.ZED-VS_Icons_Scrake-Jump', GBA_Name="GBA_Jump",bShowOnHud=false)) // Jump always at end of array

    InstantIncaps(IAF_Stun)=(Head=65,Torso=120,Leg=120,Arm=120,LowHealthBonus=10,Cooldown=6.0)
    InstantIncaps(IAF_Knockdown)=(Head=55,Torso=110,Leg=110,Arm=140,LowHealthBonus=10,Cooldown=17.0)
    InstantIncaps(IAF_Stumble)=(Head=60,Torso=65,Arm=65,LowHealthBonus=10,Cooldown=8.0)
    InstantIncaps(IAF_LegStumble)=(Leg=60,LowHealthBonus=10,Cooldown=5.0)
    InstantIncaps(IAF_GunHit)=(Head=134,Torso=134,Leg=134,Arm=134,LowHealthBonus=10,Cooldown=3.0)
    InstantIncaps(IAF_MeleeHit)=(Head=29,Torso=40,Leg=40,Arm=40,LowHealthBonus=10,Cooldown=4.0)
    StackingIncaps(SAF_Poison)=(Threshhold=5.0,Duration=1.5,Cooldown=20.0,DissipationRate=1.00)
    StackingIncaps(SAF_Microwave)=(Threshhold=7.5,Duration=1.5,Cooldown=20.0,DissipationRate=1.00)
    StackingIncaps(SAF_FirePanic)=(Threshhold=12.0,Duration=2.0,Cooldown=5.0,DissipationRate=1.0)
    StackingIncaps(SAF_EMPPanic)=(Threshhold=2.0,Duration=2.0,Cooldown=5.0,DissipationRate=0.5)
    StackingIncaps(SAF_EMPDisrupt)=(Threshhold=0.0,Duration=2.0,Cooldown=5.0,DissipationRate=1.0)
    StackingIncaps(SAF_Freeze)=(Threshhold=3.0,Duration=1.0,Cooldown=5.0,DissipationRate=0.33)

	//defaults
	Begin Object Name=MeleeHelper_0
		BaseDamage=40.f//30.f
		MaxHitRange=200.f
		MomentumTransfer=45000.f
		MyDamageType=class'KFGameContent.KFDT_Slashing_Scrake'
		MeleeImpactCamScale=0.45
		PlayerDoorDamageMultiplier=5.f
	End Object
	MeleeAttackHelper=MeleeHelper_0

	DoshValue=260.0 // 1.5x default because they are harder to hit/kill
	XPValues(0)=102 // 1.5 X 2x default because they are harder to hit/kill

	SprintSpeed=600.f
	SprintStrafeSpeed=350.f
	Groundspeed=226.f

	RageHealthThresholdNormal=0.75

	//defaults
	ThirdPersonViewOffset={(
		OffsetHigh=(X=-175,Y=60,Z=60),
		OffsetLow=(X=-220,Y=100,Z=50),
		OffsetMid=(X=-160,Y=50,Z=0),
		)}

//	Health=3500
//	DrawScale3D=(X=1.25,Y=1.25,Z=1.25)
//	HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=3500, DmgScale=1.1, SkinID=1)
//	HitZones[8]		  =(ZoneName=rforearm, BoneName=RightForearm, Limb=BP_RightArm, GoreHealth=200,  DmgScale=0.5, SkinID=2)
}
