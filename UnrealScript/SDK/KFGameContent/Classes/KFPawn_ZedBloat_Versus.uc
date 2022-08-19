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

/** Spawn a puke mine */
simulated function ANIMNOTIFY_PukeMineAttack()
{
	local vector SpawnLocation;
	local rotator SpawnRotation;
	local KFProjectile PukeMine;

	if( Role == ROLE_Authority )
	{
		Mesh.GetSocketWorldLocationAndRotation( 'PukeSocket', SpawnLocation, SpawnRotation );

		PukeMine = Spawn( PukeMineProjectileClass, self,, SpawnLocation, SpawnRotation,, true );
		PukeMine.Init( vector(SpawnRotation) );
	}
}

defaultproperties
{
	bVersusZed=true
	TeammateCollisionRadiusPercent=0.30
	VomitDamage=15

	PukeMineProjectileClass=class'KFProj_BloatPukeMine'

    LocalizationKey=KFPawn_ZedBloat
	//defaults
	Begin Object Name=MeleeHelper_0
		BaseDamage=30.f
		MaxHitRange=250.f
		MomentumTransfer=25000.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
	End Object
	MeleeAttackHelper=MeleeHelper_0

	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_PlayerZedAttack1)= class'KFSM_PlayerBloat_Melee2'
		SpecialMoveClasses(SM_PlayerZedAttack2)= class'KFSM_PlayerBloat_PukeMineAttack'
		SpecialMoveClasses(SM_PlayerZedSpecial1)= class'KFSM_PlayerBloat_Melee'
	End Object

	SpecialMoveCooldowns(0)=(SMHandle=SM_PlayerZedAttack1,		CooldownTime=1.25f,	SpecialMoveIcon=Texture2D'ZED_Bloat_UI.ZED-VS_Icons_Bloat-Puke', GBA_Name="GBA_Fire",NameLocalizationKey="Puke")
	SpecialMoveCooldowns(1)=(SMHandle=SM_PlayerZedAttack2,		CooldownTime=1.35f,	SpecialMoveIcon=Texture2D'ZED_Bloat_UI.ZED-VS_Icons_Bloat-PukeMine', GBA_Name="GBA_IronsightsToggle",NameLocalizationKey="Mine")
	SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,					CooldownTime=0.0f,	GBA_Name="GBA_Reload", bShowOnHud=false)
	SpecialMoveCooldowns(3)=(SMHandle=SM_PlayerZedSpecial1,		CooldownTime=0.5f,	SpecialMoveIcon=Texture2D'ZED_Bloat_UI.ZED-VS_Icons_Bloat-Melee', GBA_Name="GBA_TertiaryFire",NameLocalizationKey="Heavy")
	SpecialMoveCooldowns.Add((SMHandle=SM_Jump,					CooldownTime=1.5f,	SpecialMoveIcon=Texture2D'ZED_Bloat_UI.ZED-VS_Icons_Bloat-Jump', GBA_Name="GBA_Jump",bShowOnHud=false)) // Jump always at end of array

	InstantIncaps(IAF_Stun)=(Head=68,Torso=90,Leg=90,Arm=90,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_Knockdown)=(Head=50,Torso=100,Leg=55,Arm=120,LowHealthBonus=10,Cooldown=10.0)
	InstantIncaps(IAF_Stumble)=(Head=60,Torso=65,Arm=65,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_LegStumble)=(Leg=60,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_GunHit)=(Head=110,Torso=110,Leg=110,Arm=110,LowHealthBonus=10,Cooldown=0.5)
	InstantIncaps(IAF_MeleeHit)=(Head=20,Torso=30,Leg=27,Arm=30,LowHealthBonus=10,Cooldown=0.3)
	StackingIncaps(SAF_Poison)=(Threshhold=20.0,Duration=5.0,Cooldown=20.5,DissipationRate=1.00)
	StackingIncaps(SAF_Microwave)=(Threshhold=20.0,Duration=5.0,Cooldown=20.5,DissipationRate=1.00)
	StackingIncaps(SAF_FirePanic)=(Threshhold=12.0,Duration=2.0,Cooldown=5.0,DissipationRate=1.0)

    // Vulnerable damage types
    VulnerableDamageTypes.Add((DamageType=class'KFGameContent.KFDT_Ballistic_AR15', DamageScale=0.75))
    VulnerableDamageTypes.Add((DamageType=class'KFGameContent.KFDT_Ballistic_Rem1858', DamageScale=0.75))

	// Resistant damage types
    ResistantDamageTypes.Add((DamageType=class'KFDT_Slashing', DamageScale=0.05f))
    ResistantDamageTypes.Add((DamageType=class'KFDT_Bludgeon', DamageScale=0.05f))

    // Faster sprint
	SprintSpeed=400.0f//445.0f
	SprintStrafeSpeed=280.f//295.f
	Groundspeed=260.0f//2.85f

	Health=485
    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=90, DmgScale=1.1, SkinID=1)//gorehealth 90
    DoshValue=25    // 1.2x 17 default because they have 1.2x more health
    XPValues(0)=40  // 1.2 x 2x default because they have 1.2x more health

	//defaults
	ThirdPersonViewOffset={(
		OffsetHigh=(X=-175,Y=60,Z=60),
		OffsetLow=(X=-220,Y=100,Z=50),
		OffsetMid=(X=-160,Y=50,Z=10),
		)}
}
