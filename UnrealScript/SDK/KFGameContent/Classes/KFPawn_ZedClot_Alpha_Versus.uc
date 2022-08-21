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

	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Submachinegun', 	DamageScale=(0.8)))  //3.0
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AssaultRifle', 	DamageScale=(0.5)))  //1.0
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Shotgun', 	        DamageScale=(0.4)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Handgun', 	        DamageScale=(0.4)))  //1.01
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rifle', 	        DamageScale=(0.5)))  //0.76
	DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing', 	                DamageScale=(0.5)))  //0.5
	DamageTypeModifiers.Add((DamageType=class'KFDT_Bludgeon', 	                DamageScale=(0.5)))  //0.5
	DamageTypeModifiers.Add((DamageType=class'KFDT_Fire', 	                    DamageScale=(0.5)))  //0.8
	DamageTypeModifiers.Add((DamageType=class'KFDT_Microwave', 	                DamageScale=(0.35)))  //0.25
	DamageTypeModifiers.Add((DamageType=class'KFDT_Explosive', 	                DamageScale=(0.35)))  //0.85
	DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing', 	                DamageScale=(0.4)))   //1.0
	DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic', 	                    DamageScale=(1.0)))  //0.88


// special case
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AR15',              DamageScale=(1.0))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_MB500', 	         DamageScale=(1.0)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rem1858', 	         DamageScale=(0.75)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Colt1911', 	     DamageScale=(0.65)))  //0.9
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_9mm', 	             DamageScale=(1.6)))  //0.9
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Pistol_Medic', 	 DamageScale=(1.5)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Winchester', 	     DamageScale=(0.6)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Fire_CaulkBurn', 	         DamageScale=(0.9)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_ExplosiveSubmunition_HX25', 	 DamageScale=(0.6)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing_EvisceratorProj', 	 DamageScale=(0.3)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing_Eviscerator', 	     DamageScale=(0.3)))  //0.9



	IncapSettings(AF_Stun)=		(Vulnerability=(0.5, 0.5, 0.1, 0.1, 0.1), Cooldown=3.0, Duration=2.0)
	IncapSettings(AF_Knockdown)=(Vulnerability=(0.5),                     Cooldown=3.0)
	IncapSettings(AF_Stumble)=	(Vulnerability=(0.5),                     Cooldown=3.0)
	IncapSettings(AF_GunHit)=	(Vulnerability=(1.0),                     Cooldown=0.75)
	IncapSettings(AF_MeleeHit)=	(Vulnerability=(1.0),                     Cooldown=0.5)
	IncapSettings(AF_Poison)=	(Vulnerability=(1),                       Cooldown=5.0, Duration=2.0)
	IncapSettings(AF_Microwave)=(Vulnerability=(0.0),                     Cooldown=5.0, Duration=2.0)
	IncapSettings(AF_FirePanic)=(Vulnerability=(0.5),                     Cooldown=7.0, Duration=3)
	IncapSettings(AF_EMP)=		(Vulnerability=(1.0),                     Cooldown=5.0, Duration=3.0)
	IncapSettings(AF_Freeze)=	(Vulnerability=(1.0),                     Cooldown=1.5, Duration=2.0)

    Health=200 // 4.5x default //300.f
    // Override Head GoreHealth (aka HeadHealth)
    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=85, DmgScale=1.01, SkinID=1) // default is 20
    DoshValue=20.0 // 2x default because they are harder to hit
    XPValues(0)=32 // 4x default because they are harder to hit

    // Vulnerable damage types
    //DamageTypeModifiers.Add((DamageType=class'KFGameContent.KFDT_Ballistic_AR15', DamageScale=(1.5)))
    //DamageTypeModifiers.Add((DamageType=class'KFGameContent.KFDT_Ballistic_Rem1858', DamageScale=(1.5)))

    SprintSpeed=550.f  //570
    SprintStrafeSpeed=325.f
    GroundSpeed=300.f //250

	//defaults
	ThirdPersonViewOffset={(
		OffsetHigh=(X=-140,Y=50,Z=0),
		OffsetLow=(X=-220,Y=50,Z=50),
		OffsetMid=(X=-160,Y=50,Z=0),
		)}
}
