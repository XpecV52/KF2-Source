//=============================================================================
// KFPawn_ZedBloat_Versus
//=============================================================================
// Bloat Versus pawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedBloat_Versus extends KFPawn_ZedBloat;

/** Projectile to spawn for puke mine attack */
var class<KFProjectile> PukeMineProjectileClass;

/** Rotation offsets to use when spawning our 3 puke mins on death */
var array<rotator> DeathPukeMineRotations;

/** Spawn a puke mine */
simulated function ANIMNOTIFY_PukeMineAttack()
{
	local vector SpawnLocation;
	local rotator SpawnRotation;

	if( Role == ROLE_Authority )
	{
		Mesh.GetSocketWorldLocationAndRotation( 'PukeSocket', SpawnLocation, SpawnRotation );
		SpawnPukeMine( SpawnLocation, SpawnRotation );
	}
}

/** This pawn has died. */
function bool Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
	local int i;

	// Spawn 3 puke mines if we weren't obliterated
	if( !HitFxInfo.bObliterated )
	{
		for( i = 0; i < DeathPukeMineRotations.Length; ++i )
		{
			SpawnPukeMine( Location, Normalize(Rotation + DeathPukeMineRotations[i]) );
		}
	}

	return super.Died( Killer, damageType, HitLocation );
}

/** Spawns a puke mine at the specified location and rotation. Network: SERVER */
function SpawnPukeMine( vector SpawnLocation, rotator SpawnRotation )
{
	local KFProjectile PukeMine;

	PukeMine = Spawn( PukeMineProjectileClass, self,, SpawnLocation, SpawnRotation,, true );
	PukeMine.Init( vector(SpawnRotation) );
}

defaultproperties
{
	bVersusZed=true
	TeammateCollisionRadiusPercent=0.30
	VomitDamage=20  //

	PukeMineProjectileClass=class'KFProj_BloatPukeMine'

    LocalizationKey=KFPawn_ZedBloat
	//defaults
	Begin Object Name=MeleeHelper_0
		BaseDamage=20.f
		MaxHitRange=250.f
		MomentumTransfer=25000.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
	End Object
	MeleeAttackHelper=MeleeHelper_0

	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_PlayerZedAttack1)= class'KFSM_PlayerBloat_Melee2'
		SpecialMoveClasses(SM_PlayerZedAttack2)= class'KFSM_PlayerBloat_PukeMineAttack'
		SpecialMoveClasses(SM_PlayerZedSpecial1)= class'KFSM_PlayerBloat_Melee'
		SpecialMoveClasses(SM_PlayerZedSpecial2)= class'KFSM_PlayerBloat_Block'
	End Object

	SpecialMoveCooldowns(0)=(SMHandle=SM_PlayerZedAttack1,		CooldownTime=1.25f,	SpecialMoveIcon=Texture2D'ZED_Bloat_UI.ZED-VS_Icons_Bloat-Puke', GBA_Name="GBA_Fire",NameLocalizationKey="Puke")
	SpecialMoveCooldowns(1)=(SMHandle=SM_PlayerZedAttack2,		CooldownTime=1.35f,	SpecialMoveIcon=Texture2D'ZED_Bloat_UI.ZED-VS_Icons_Bloat-PukeMine', GBA_Name="GBA_IronsightsToggle",NameLocalizationKey="Mine")
	SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,					CooldownTime=0.0f,	GBA_Name="GBA_Reload", bShowOnHud=false)
	SpecialMoveCooldowns(3)=(SMHandle=SM_PlayerZedSpecial1,		CooldownTime=0.5f,	SpecialMoveIcon=Texture2D'ZED_Bloat_UI.ZED-VS_Icons_Bloat-Melee', GBA_Name="GBA_TertiaryFire",NameLocalizationKey="Heavy")
	SpecialMoveCooldowns(4)=(SMHandle=SM_PlayerZedSpecial2,		CooldownTime=1.7f,	SpecialMoveIcon=Texture2D'ZED_Shared_UI.ZED-VS_Icons_Generic-Block', GBA_Name="GBA_SwitchFireMode",NameLocalizationKey="Block")
	SpecialMoveCooldowns.Add((SMHandle=SM_Jump,					CooldownTime=1.5f,	SpecialMoveIcon=Texture2D'ZED_Bloat_UI.ZED-VS_Icons_Bloat-Jump', GBA_Name="GBA_Jump",bShowOnHud=false)) // Jump always at end of array

    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Submachinegun', 	DamageScale=(0.8)))  //3.0
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AssaultRifle', 	DamageScale=(0.55)))  //1.0
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Shotgun', 	        DamageScale=(0.3)))  //0.9  0.4
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Handgun', 	        DamageScale=(0.6)))  //1.01
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rifle', 	        DamageScale=(0.65)))  //0.76
	DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing', 	                DamageScale=(0.45)))  //0.5
	DamageTypeModifiers.Add((DamageType=class'KFDT_Bludgeon', 	                DamageScale=(0.45)))  //0.5
	DamageTypeModifiers.Add((DamageType=class'KFDT_Fire', 	                    DamageScale=(1.0)))  //0.8
	DamageTypeModifiers.Add((DamageType=class'KFDT_Microwave', 	                DamageScale=(1.5)))  //0.25
	DamageTypeModifiers.Add((DamageType=class'KFDT_Explosive', 	                DamageScale=(0.5)))  //0.85
	DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing', 	                DamageScale=(0.4)))   //1.0
	DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic', 	                    DamageScale=(0.2)))  //0.88


    // special case
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AR15',              DamageScale=(1.1))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_MB500', 	         DamageScale=(0.7)))  //0.9  1.0
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_DBShotgun', 	     DamageScale=(0.5)))  
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rem1858', 	         DamageScale=(1.5)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Colt1911', 	     DamageScale=(0.70)))  //0.9
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_9mm', 	             DamageScale=(1.4)))  //0.9
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Pistol_Medic', 	 DamageScale=(1.4)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Winchester', 	     DamageScale=(0.85)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Fire_CaulkBurn', 	         DamageScale=(1.4)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_ExplosiveSubmunition_HX25', 	 DamageScale=(0.6)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing_EvisceratorProj', 	 DamageScale=(0.3)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing_Eviscerator', 	     DamageScale=(0.7)))  //0.9
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_DragonsBreath', 	 DamageScale=(1.0)))  //0.9



	IncapSettings(AF_Stun)=		(Vulnerability=(0.5, 0.5, 0.1, 0.1, 0.1), Cooldown=3.0, Duration=2.0)
	IncapSettings(AF_Knockdown)=(Vulnerability=(0.5),                     Cooldown=3.0)
	IncapSettings(AF_Stumble)=	(Vulnerability=(0.5),                     Cooldown=3.0)
	IncapSettings(AF_GunHit)=	(Vulnerability=(1.0),                     Cooldown=0.75)
	IncapSettings(AF_MeleeHit)=	(Vulnerability=(1.0),                     Cooldown=0.5)
	IncapSettings(AF_Poison)=	(Vulnerability=(1),                       Cooldown=5.0, Duration=2.0)
	IncapSettings(AF_Microwave)=(Vulnerability=(1.0),                     Cooldown=5.0, Duration=2.0)
	IncapSettings(AF_FirePanic)=(Vulnerability=(1.0),                     Cooldown=7.0, Duration=3)
	IncapSettings(AF_EMP)=		(Vulnerability=(1.0),                     Cooldown=5.0, Duration=3.0)
	IncapSettings(AF_Freeze)=	(Vulnerability=(1.0),                     Cooldown=1.5, Duration=2.0)

	DeathPukeMineRotations(0)=(Pitch=-2048,Yaw=10480,Roll=0)
	DeathPukeMineRotations(1)=(Pitch=-2048,Yaw=-10480,Roll=0)
	DeathPukeMineRotations(2)=(Pitch=-2048,Yaw=32767,Roll=0)



    // Faster sprint
	SprintSpeed=420//445.0f //400
	SprintStrafeSpeed=250.f//295.f
	Groundspeed=250//2.85f  //260

	Health=700  //485  600
    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=350, DmgScale=1.001, SkinID=1)//gorehealth 90  175
    DoshValue=25    // 1.2x 17 default because they have 1.2x more health
    XPValues(0)=40  // 1.2 x 2x default because they have 1.2x more health

   // Blocking higher values = less resistance
	MinBlockFOV=0.f
	BlockingDamageModifier=0.3 //0.85
	MeleeBlockingDamageModifier=0.3


	//defaults
	ThirdPersonViewOffset={(
		OffsetHigh=(X=-175,Y=60,Z=60),
		OffsetLow=(X=-220,Y=100,Z=50),
		OffsetMid=(X=-160,Y=50,Z=10),
		)}
}
