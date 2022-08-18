//=============================================================================
// KFPawn_ZedFleshPound_Versus
//=============================================================================
// Fleshpound Versus pawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedFleshPound_Versus extends KFPawn_ZedFleshpound;

function PossessedBy( Controller C, bool bVehicleTransition )
{
	Super.PossessedBy( C, bVehicleTransition );

	if( WorldInfo.NetMode != NM_DedicatedServer && Mesh != None )
	{
		SetGameplayMICParams();
	}
}

//get rif of ragemode sprint
function SetSprinting(bool bNewSprintStatus)
{
	if( bEmpDisrupted )
	{
		bNewSprintStatus = false;
	}

	if ( bNewSprintStatus )
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

function NotifyMeleeDamageDealt()
{
	if( !IsTimerActive(nameOf(EndRage)) )
	{
		SetTimer( 3.f, false, nameOf(EndRage) );
	}
}

function EndRage()
{
	SetEnraged( false );
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

	LocalizationKey=KFPawn_ZedFleshpound

	Health=1983//1725

	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_PlayerZedAttack1)=class'KFSM_PlayerFleshpound_Melee'
		SpecialMoveClasses(SM_PlayerZedAttack2)=class'KFSM_PlayerFleshpound_Melee2'
		SpecialMoveClasses(SM_PlayerZedSpecial1)=class'KFSM_PlayerFleshpound_Rage'
	End Object

	InstantIncaps(IAF_Stun)=(Head=75,Torso=120,Leg=120,Arm=120,Special=65,LowHealthBonus=10,Cooldown=10.0)
	InstantIncaps(IAF_Knockdown)=(Head=65,Torso=140,Leg=140,Arm=140,Special=65,LowHealthBonus=10,Cooldown=25.0)
	InstantIncaps(IAF_Stumble)=(Head=60,Torso=65,Arm=65,Special=53,LowHealthBonus=10,Cooldown=10.0)
	InstantIncaps(IAF_LegStumble)=(Leg=60,LowHealthBonus=10,Cooldown=9.0)
	InstantIncaps(IAF_GunHit)=(Head=150,Torso=150,Leg=150,Arm=150,LowHealthBonus=10,Cooldown=20)
	InstantIncaps(IAF_MeleeHit)=(Head=25,Torso=50,Leg=50,Arm=50,LowHealthBonus=10,Cooldown=1.2)
	StackingIncaps(SAF_Poison)=(Threshhold=5.0,Duration=1.5,Cooldown=20.0,DissipationRate=1.00)
	StackingIncaps(SAF_Microwave)=(Threshhold=10.0,Duration=1.5,Cooldown=20.0,DissipationRate=1.00)
	StackingIncaps(SAF_FirePanic)=(Threshhold=13.0,Duration=1.5,Cooldown=8.0,DissipationRate=1.0)
	StackingIncaps(SAF_EMPPanic)=(Threshhold=2.0,Duration=3.0,Cooldown=10.0,DissipationRate=0.5)
	StackingIncaps(SAF_EMPDisrupt)=(Threshhold=1.5,Duration=2.0,Cooldown=10.0,DissipationRate=0.5)
	StackingIncaps(SAF_Freeze)=(Threshhold=3.0,Duration=1.0,Cooldown=5.0,DissipationRate=0.33)

	SpecialMoveCooldowns(0)=(SMHandle=SM_PlayerZedAttack1,		CooldownTime=0.75f,	SpecialMoveIcon=Texture2D'ZED_Fleshpound_UI.ZED-VS_Icons_Fleshpound-LightAttack', GBA_Name="GBA_Fire",NameLocalizationKey="Light")
	SpecialMoveCooldowns(1)=(SMHandle=SM_PlayerZedAttack2,		CooldownTime=1.5f,	SpecialMoveIcon=Texture2D'ZED_Fleshpound_UI.ZED-VS_Icons_Fleshpound-HeavyAttack', GBA_Name="GBA_IronsightsToggle", ALT_GBA_Name="GBA_IronsightsHold",NameLocalizationKey="Heavy")
	SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,					CooldownTime=0.0f,	GBA_Name="GBA_Reload",bShowOnHud=false)
	SpecialMoveCooldowns(3)=(SMHandle=SM_PlayerZedSpecial1,		CooldownTime=10.5f,	SpecialMoveIcon=Texture2D'ZED_Fleshpound_UI.ZED-VS_Icons_Fleshpound-Rage', GBA_Name="GBA_TertiaryFire",NameLocalizationKey="Rage")
	SpecialMoveCooldowns.Add((SMHandle=SM_Jump,					CooldownTime=1.25f,	SpecialMoveIcon=Texture2D'ZED_Fleshpound_UI.ZED-VS_Icons_Fleshpound-Jump', GBA_Name="GBA_Jump",bShowOnHud=false)) // Jump always at end of array

	ResistantDamageTypes.Add((DamageType=class'KFDT_Fire', 		DamageScale=0.3f))
	ResistantDamageTypes.Add((DamageType=class'KFDT_Ballistic', DamageScale=0.7f))


	//defaults
	Begin Object Name=MeleeHelper_0
		BaseDamage=50.f
		MaxHitRange=250.f
		MomentumTransfer=55000.f
		MyDamageType=class'KFDT_Bludgeon_Fleshpound'
		MeleeImpactCamScale=0.45
		PlayerDoorDamageMultiplier=5.f
	End Object
	MeleeAttackHelper=MeleeHelper_0

    DoshValue=400.0 // 2x default because they are harder to hit/kill

    SprintSpeed=725.f
    SprintStrafeSpeed=450.f
    GroundSpeed=300.f

	//defaults
	ThirdPersonViewOffset={(
		OffsetHigh=(X=-175,Y=60,Z=60),
		OffsetLow=(X=-220,Y=100,Z=50),
		OffsetMid=(X=-160,Y=50,Z=30),
		)}

//	Health=3500
//	DrawScale3D=(X=1.25,Y=1.25,Z=1.25)
//	HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=2000, DmgScale=1.1, SkinID=1)
//	HitZones[3]       =(ZoneName=heart,	   BoneName=Spine2,		  Limb=BP_Special,  GoreHealth=1500, DmgScale=1.1, SkinID=2)
//	HitZones[5]		  =(ZoneName=lforearm, BoneName=LeftForearm,  Limb=BP_LeftArm,  GoreHealth=200,  DmgScale=0.5, SkinID=3)
//	HitZones[8]		  =(ZoneName=rforearm, BoneName=RightForearm, Limb=BP_RightArm, GoreHealth=200,  DmgScale=0.5, SkinID=3)
}
