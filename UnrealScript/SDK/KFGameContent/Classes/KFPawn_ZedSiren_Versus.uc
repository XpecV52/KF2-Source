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
	SpecialMoveCooldowns(1)=(SMHandle=SM_PlayerZedAttack2,		CooldownTime=12.0f,		SpecialMoveIcon=Texture2D'ZED_Siren_UI.ZED-VS_Icons_Siren-PullIn', GBA_Name="GBA_IronsightsToggle",NameLocalizationKey="Vortex") //8.0
	SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,					CooldownTime=0.0f,		GBA_Name="GBA_Reload",bShowOnHud=false)
	SpecialMoveCooldowns(3)=(SMHandle=SM_PlayerZedSpecial1,		CooldownTime=0.0f,		SpecialMoveIcon=Texture2D'ZED_Siren_UI.ZED-VS_Icons_Siren-Bite', GBA_Name="GBA_TertiaryFire",NameLocalizationKey="Bite")
	SpecialMoveCooldowns.Add((SMHandle=SM_Jump,					CooldownTime=1.5f,		SpecialMoveIcon=Texture2D'ZED_Siren_UI.ZED-VS_Icons_Siren-Jump', GBA_Name="GBA_Jump",bShowOnHud=false)) // Jump always at end of array

	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Submachinegun', 	DamageScale=(0.8)))  //3.0
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AssaultRifle', 	DamageScale=(0.5)))  //1.0
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Shotgun', 	        DamageScale=(0.5)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Handgun', 	        DamageScale=(0.6)))  //1.01  0.4
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rifle', 	        DamageScale=(0.65)))  //0.76  0.5
	DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing', 	                DamageScale=(0.5)))  //0.5
	DamageTypeModifiers.Add((DamageType=class'KFDT_Bludgeon', 	                DamageScale=(0.5)))  //0.5
	DamageTypeModifiers.Add((DamageType=class'KFDT_Fire', 	                    DamageScale=(0.3)))  //0.8
	DamageTypeModifiers.Add((DamageType=class'KFDT_Microwave', 	                DamageScale=(0.75)))  //0.25
	DamageTypeModifiers.Add((DamageType=class'KFDT_Explosive', 	                DamageScale=(0.5)))  //0.85  0.35
	DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing', 	                DamageScale=(0.4)))   //1.0
	DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic', 	                    DamageScale=(0.30)))  //0.88


// special case
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AR15',              DamageScale=(1.0))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_MB500', 	         DamageScale=(1.1)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rem1858', 	         DamageScale=(0.85)))  //0.9  0.75
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Colt1911', 	     DamageScale=(0.75)))  //0.9   0.65
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_9mm', 	             DamageScale=(1.6)))  //0.9
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Pistol_Medic', 	 DamageScale=(1.5)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Winchester', 	     DamageScale=(0.75)))  //0.9  0.7
	DamageTypeModifiers.Add((DamageType=class'KFDT_Fire_CaulkBurn', 	         DamageScale=(0.7)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_ExplosiveSubmunition_HX25', 	 DamageScale=(0.6)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing_EvisceratorProj', 	 DamageScale=(0.4)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing_Eviscerator', 	     DamageScale=(0.3)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_DragonsBreath', 	 DamageScale=(1.1)))  //0.9



	IncapSettings(AF_Stun)=		(Vulnerability=(0.5, 0.5, 0.1, 0.1, 0.1), Cooldown=3.0, Duration=2.0)
	IncapSettings(AF_Knockdown)=(Vulnerability=(0.5),                     Cooldown=3.0)
	IncapSettings(AF_Stumble)=	(Vulnerability=(0.5),                     Cooldown=3.0)
	IncapSettings(AF_GunHit)=	(Vulnerability=(1.0),                     Cooldown=0.75)
	IncapSettings(AF_MeleeHit)=	(Vulnerability=(1.0),                     Cooldown=0.5)
	IncapSettings(AF_Poison)=	(Vulnerability=(1),                       Cooldown=5.0, Duration=2.0)
	IncapSettings(AF_Microwave)=(Vulnerability=(0.0),                     Cooldown=5.0, Duration=2.0)
	IncapSettings(AF_FirePanic)=(Vulnerability=(1.0),                     Cooldown=8.0, Duration=3)
	IncapSettings(AF_EMP)=		(Vulnerability=(1.0),                     Cooldown=5.0, Duration=3.0)
	IncapSettings(AF_Freeze)=	(Vulnerability=(1.0),                     Cooldown=1.5, Duration=2.0)

    SprintSpeed=430.0f  //450
    SprintStrafeSpeed=300.f
    GroundSpeed=200.0f


// Custom Hit Zones (HeadHealth, SkinTypes, etc...)
    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=155, DmgScale=1.01, SkinID=1) // KF1=200

    Health=300 // KF1=300
    DoshValue=25.0 // default because they have the same health as survival
    XPValues(0)=22 // 2x default because they are harder to hit/kill

	//defaults
	ThirdPersonViewOffset={(
		OffsetHigh=(X=-175,Y=50,Z=25),
		OffsetLow=(X=-220,Y=50,Z=50),
		OffsetMid=(X=-140,Y=50,Z=-10),
		)}
}
