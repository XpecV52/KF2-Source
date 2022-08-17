//=============================================================================
// KFGameInfo
//=============================================================================
// Base GameInfo for KFGame
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedCrawler_Versus extends KFPawn_ZedCrawler;

var Controller OldController;

simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
	local KFPlayerController KFPC;

	super.PlayDying( DamageType, HitLoc );

	if( OldController != none && DamageType == class'KFSM_PlayerCrawler_Suicide'.default.SuicideDamageType )
	{
	    KFPC = KFPlayerController( OldController );
	    if( KFPC != none )
	    {
	        KFPC.SetCameraMode( 'ZedSuicide' );
	        KFPlayerCamera_Versus(KFPC.PlayerCamera).SwapToZedSuicideCam( Location );
	    }
	}
}

/*simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
	local KFGoreManager GoreManager;
	local array<name> OutGibBoneList;
	local int NumGibs;

	if( !bPlayedDeath && DamageType != class'KFSM_PlayerCrawler_Suicide'.default.SuicideDamageType )
	{
		class'KFSM_PlayerCrawler_Suicide'.static.TriggerExplosion( self, true );
		if( WorldInfo.NetMode != NM_DedicatedServer )
		{
			GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);
			if( GoreManager != none )
			{
				NumGibs = Max( Rand(15), 8 );
				NumGibs *= GetCharacterMonsterInfo().ExplosionGibScale;
				GetClosestHitBones(NumGibs, Location, OutGibBoneList);

				GoreManager.CauseGibsAndApplyImpulse( self,
													Class'KFSM_PlayerCrawler_Suicide'.default.SuicideDamageType,
													Location,
													OutGibBoneList,
													none,
													Mesh.GetBoneLocation(Mesh.GetBoneName(0)) );
			}
		}
	}

	super.PlayDying( DamageType, HitLoc );
}*/

DefaultProperties
{
	bVersusZed=true
	TeammateCollisionRadiusPercent=0.30

	LocalizationKey=KFPawn_ZedCrawler
	//DrawScale3D=(X=1.5,Y=1.5,Z=1.25)

    Health=250.f // almost 5x default // 250.f
    DoshValue=40.0 // 4x default because they are harder to hit

	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_PlayerZedAttack1)=class'KFSM_PlayerCrawler_Melee'
		SpecialMoveClasses(SM_PlayerZedAttack2)=class'KFSM_PlayerCrawler_Melee2'
		SpecialMoveClasses(SM_PlayerZedSpecial4)=class'KFSM_PlayerCrawler_Suicide'
	End Object

	SpecialMoveCooldowns(0)=(SMHandle=SM_PlayerZedAttack1,		CooldownTime=0.65f,	SpecialMoveIcon=Texture2D'ZED_Crawler_UI.ZED-VS_Icons_Crawler-LightLeap', GBA_Name="GBA_Fire",NameLocalizationKey="Light")
	SpecialMoveCooldowns(1)=(SMHandle=SM_PlayerZedAttack2, 		CooldownTime=1.0f,	SpecialMoveIcon=Texture2D'ZED_Crawler_UI.ZED-VS_Icons_Crawler-HeavyLeap', GBA_Name="GBA_IronsightsToggle", ALT_GBA_Name="GBA_IronsightsHold",NameLocalizationKey="Heavy")
	SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt, 				CooldownTime=0.0f,	GBA_Name="GBA_Reload",bShowOnHud=false)
	SpecialMoveCooldowns(6)=(SMHandle=SM_PlayerZedSpecial4,		CooldownTime=0.0f,	SpecialMoveIcon=Texture2D'ZED_Crawler_UI.ZED-VS_Icons_Crawler-Explode', GBA_Name="GBA_Grenade",NameLocalizationKey="Suicide")
	SpecialMoveCooldowns.Add((SMHandle=SM_Jump,					CooldownTime=0.85f,	SpecialMoveIcon=Texture2D'ZED_Crawler_UI.ZED-VS_Icons_Crawler-Jump', GBA_Name="GBA_Jump", bShowOnHud=false)) // Jump always at end of array

	InstantIncaps(IAF_Stun)=(Head=68,Torso=90,Leg=90,Arm=90,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_Knockdown)=(Head=35,Torso=54,Leg=54,Arm=54,LowHealthBonus=10,Cooldown=8.0)
	InstantIncaps(IAF_Stumble)=(Head=60,Torso=65,Arm=65,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_LegStumble)=(Leg=60,LowHealthBonus=10,Cooldown=5.0)
	InstantIncaps(IAF_GunHit)=(Head=100,Torso=100,Leg=100,Arm=100,LowHealthBonus=10,Cooldown=0.5)
	InstantIncaps(IAF_MeleeHit)=(Head=23,Torso=29,Leg=29,Arm=29,LowHealthBonus=10,Cooldown=0.35)
	StackingIncaps(SAF_Poison)=(Threshhold=1.0,Duration=5.5,Cooldown=7.5,DissipationRate=1.00)
	StackingIncaps(SAF_Microwave)=(Threshhold=1.0,Duration=3.0,Cooldown=7.5,DissipationRate=1.00)
	StackingIncaps(SAF_FirePanic)=(Threshhold=0.5,Duration=5,Cooldown=7.0,DissipationRate=0.07)

	//defaults
	Begin Object Name=MeleeHelper_0
		BaseDamage=10.f //20.f
		MaxHitRange=180.f
		MomentumTransfer=25000.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
		MeleeImpactCamScale=0.2
		PlayerDoorDamageMultiplier=5.f

	End Object
	MeleeAttackHelper=MeleeHelper_0

	bHasExtraSprintJumpVelocity=true

    // Override Head GoreHealth (aka HeadHealth)
    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=75, DmgScale=1.1, SkinID=1) // default is 20

    // Really fast sprint
    SprintSpeed=600.f
    SprintStrafeSpeed=500.f
    GroundSpeed=300.f
    JumpZ=900

    JumpBumpDamageType=class'KFDT_Bludgeon_ZedJump'

	//defaults
	ThirdPersonViewOffset={(
		OffsetHigh=(X=-300,Y=60,Z=60),
		OffsetLow=(X=-220,Y=60,Z=25),
		OffsetMid=(X=-250,Y=60,Z=-30),
		)}
}
