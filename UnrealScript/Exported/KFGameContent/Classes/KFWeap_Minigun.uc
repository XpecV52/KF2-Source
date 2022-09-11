//=============================================================================
// KFWeap_Minigun
//=============================================================================
// Minigun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Minigun extends KFWeap_MinigunBase;

/** Camera shake when shooting */
var	CameraAnim	ShootCameraAnim;

/** Current camera shake animation */
var CameraAnimInst ShootCameraAnimInstance;

/** Camera shake play rate */
var float ShootCameraAnimPlayRate;

/** Camera shake strength */
var float ShootCameraAnimScale;

/** Camera shake blend time */
var float ShootCameraAnimBlendTime;

/**  Sound info for the barrel rotation in 1st person and 3rd person */
var WeaponFireSndInfo BarrelRotationLoopSound;

/** The system is currently playing the barrel sound */
var	bool bPlayingLoopingBarrelSnd;

/** The system is currently playing the barrel stop sound */
var	bool bPlayingLoopingBarrelStopSnd;

/** Audio event played when the rotation of the barrel ends */
var WeaponFireSndInfo BarrelStopRotationSound;

/** Stored value for the rotation sound parameter */
var transient float CurrentBarrelRotParam;

var transient KFPawn PreviousOwner;

simulated function StartFire(byte FireModeNum)
{
	if (FireModeNum == ALTFIRE_FIREMODE)
	{
		return;
	}
	Super.StartFire(FireModeNum);
}

simulated event Tick( float DeltaTime )
{
	local float NewCurrentBarrelParam;
	local KFPawn KFP;
	local bool bPlaySound;
	
	Super.Tick(DeltaTime);

	KFP = KFPawn(Instigator);
	
	if( KFP == none && PreviousOwner != none)
	{
		PreviousOwner.SetSecondaryWeaponComponentRTPCValue("MinigunRotation", 0);
		PreviousOwner.SetSecondaryWeaponAmbientSound(none, none);
		bPlayingLoopingBarrelSnd = false;
		bPlayingLoopingBarrelStopSnd = false;
		CurrentBarrelRotParam = 0;
		WindUpControlTime = 0;
		PreviousOwner = none;
		return;
	}
	
	bPlaySound = KFP != none && (WorldInfo.NetMode != NM_Client || KFP.IsLocallyControlled());
	
	NewCurrentBarrelParam = CurrentBarrelRotParam;
	
	if( KFP != none && KFP.IsFirstPerson() && (IsInState('WeaponPuttingDown') || IsInState('Inactive')) )
	{
		UpdateBarrelSoundOnForceStop( bPlaySound );
		return;
	}
	
	if( WindUpControlTime > 0 && !bPlayingLoopingBarrelSnd)
	{
		bPlayingLoopingBarrelSnd = true;
		if ( bPlaySound ) KFP.SetSecondaryWeaponAmbientSound(BarrelRotationLoopSound.DefaultCue, BarrelRotationLoopSound.FirstPersonCue);
	}
	else if( WindUpControlTime <= 0 && bPlayingLoopingBarrelSnd )
	{
		bPlayingLoopingBarrelSnd = false;
		bPlayingLoopingBarrelStopSnd = false;
		if ( bPlaySound ) KFP.SetSecondaryWeaponAmbientSound(none, none);
	}

	if(WindUpControlTime > 0)
	{
		NewCurrentBarrelParam = 100 * WindUpControlTime / WindUpActivationTime;
		if ( KFP != none ) KFP.SetSecondaryWeaponComponentRTPCValue("MinigunRotation", NewCurrentBarrelParam);

		if( NewCurrentBarrelParam < 20 && NewCurrentBarrelParam < CurrentBarrelRotParam && !bPlayingLoopingBarrelStopSnd )
		{
			bPlayingLoopingBarrelStopSnd = true;
			if ( KFP != none ) KFP.SetWeaponAmbientSound(BarrelStopRotationSound.DefaultCue, BarrelStopRotationSound.FirstPersonCue);
		}

		CurrentBarrelRotParam = NewCurrentBarrelParam;
	}

	PreviousOwner = KFP;
}

/*********************************************************************************************
 * @name	SFX
 *********************************************************************************************/

simulated function UpdateBarrelSoundOnForceStop(bool bPlaySound)
{
	local KFPawn KFP;
	
	if(bPlayingLoopingBarrelSnd)
	{
		KFP = KFPawn(Instigator);

		CurrentBarrelRotParam -= 2;
		if ( KFP != none ) KFP.SetSecondaryWeaponComponentRTPCValue("MinigunRotation", CurrentBarrelRotParam);

		if( CurrentBarrelRotParam > 20 && !bPlayingLoopingBarrelStopSnd )
		{
			bPlayingLoopingBarrelStopSnd = true;
			if ( KFP != none ) KFP.SetWeaponAmbientSound(BarrelStopRotationSound.DefaultCue, BarrelStopRotationSound.FirstPersonCue);
		}

		if(CurrentBarrelRotParam < 0)
		{
			CurrentBarrelRotParam = 0;
			bPlayingLoopingBarrelSnd = false;
			bPlayingLoopingBarrelStopSnd = false;
			if ( bPlaySound ) KFP.SetSecondaryWeaponAmbientSound(none, none);
		}
	}
}

/*********************************************************************************************
 * @name	Trader
 *********************************************************************************************/

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Assault;
}

/*********************************************************************************************
 * State WeaponFiring
 * The weapon is in this state while holding fire button
*********************************************************************************************/

simulated state WeaponFiring
{
	simulated function BeginState(Name PrevStateName)
	{
		Super.BeginState(PrevStateName);
		
		if ( Instigator.IsLocallyControlled()  )
		{
			ShootCameraAnimInstance = PlayCameraAnim(ShootCameraAnim, ShootCameraAnimScale, ShootCameraAnimPlayRate, 
				ShootCameraAnimBlendTime, ShootCameraAnimBlendTime, true, false);
		}
	}

	simulated function EndState(Name NextStateName)
	{	
		local PlayerController PC;
		
		Super.EndState(NextStateName);
		
		if ( Instigator.IsLocallyControlled()  )
		{
			PC = PlayerController(Instigator.Controller);
			if (PC.PlayerCamera != None && ShootCameraAnimInstance != None)
			{
				PC.PlayerCamera.StopCameraAnim(ShootCameraAnimInstance);
				ShootCameraAnimInstance = None;
			}
		}
	}
}

defaultproperties
{
   ShootCameraAnim=CameraAnim'WEP_1P_Minigun_ANIM.Shoot'
   ShootCameraAnimPlayRate=1.000000
   ShootCameraAnimScale=0.190000
   ShootCameraAnimBlendTime=0.100000
   BarrelRotationLoopSound=(DefaultCue=AkEvent'WW_WEP_Minigun.Play_WEP_Minigun_Loop_3P',FirstPersonCue=AkEvent'WW_WEP_Minigun.Play_WEP_Minigun_Loop_1P')
   BarrelStopRotationSound=(DefaultCue=AkEvent'WW_WEP_Minigun.Play_WEP_Minigun_Decelerate_3P',FirstPersonCue=AkEvent'WW_WEP_Minigun.Play_WEP_Minigun_Decelerate_1P')
   WindUpActivationTime=0.700000
   WindUpRotationSpeed=1200.000000
   WindUpPawnMovementSpeed=0.800000
   FiringViewRotationSpeed=320.000000
   FiringPawnMovementSpeed=0.300000
   PackageKey="Minigun"
   FirstPersonMeshName="wep_1p_minigun_mesh.Wep_1stP_Minigun_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_minigun_anim.Wep_1stP_Minigun_Anim"
   PickupMeshName="WEP_3P_Minigun_MESH.Wep_3rdP_Minigun_LowPoly_Pickup"
   AttachmentArchetypeName="WEP_Minigun_ARCH.Wep_Minigun_3P"
   MuzzleFlashTemplateName="WEP_Minigun_ARCH.Wep_Minigun_MuzzleFlash"
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=()
   SingleFireSoundIndex=1
   InventorySize=10
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=()
   MeshIronSightFOV=82.000000
   PlayerIronSightFOV=82.000000
   IronSightPosition=(X=3.000000,Y=15.000000,Z=15.000000)
   DOF_FG_FocalRadius=85.000000
   DOF_FG_MaxNearBlurSize=2.500000
   GroupPriority=130.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Minigun_TEX.UI_WeaponSelect_Minigun'
   MagazineCapacity(0)=90
   SpareAmmoCapacity(0)=540
   InitialSpareMags(0)=1
   AmmoPickupScale(0)=0.670000
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_Minigun.Play_WEP_Minigun_Shoot_Loop_3P',FirstPersonCue=AkEvent'WW_WEP_Minigun.Play_WEP_Minigun_Shoot_Loop_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_Minigun.Play_WEP_Mingun_Shoot_3P',FirstPersonCue=AkEvent'WW_WEP_Minigun.Play_WEP_Mingun_Shoot_1P')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_Minigun.Play_WEP_Minigun_Shoot_Loop_End_3P',FirstPersonCue=AkEvent'WW_WEP_Minigun.Play_WEP_Minigun_Shoot_Loop_End_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Handling_DryFire'
   PlayerViewOffset=(X=3.000000,Y=15.000000,Z=15.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MinigunBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MinigunBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Minigun:MeleeHelper_0'
   EjectedShellForegroundDuration=0.800000
   maxRecoilPitch=200
   minRecoilPitch=150
   maxRecoilYaw=130
   minRecoilYaw=-130
   RecoilRate=0.085000
   RecoilViewRotationScale=0.250000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   HippedRecoilModifier=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Commando'
   FiringStatesArray(0)="WeaponWindingUp"
   FiringStatesArray(1)="WeaponWindingUp"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_Minigun'
   FireInterval(0)=0.050000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.008500
   InstantHitDamage(0)=32.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=30.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_Minigun'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Minigun'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_MinigunBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'WEP_Minigun_ARCH.WEP_Animtree_Minigun_1p'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_MinigunBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Minigun"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MinigunBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MinigunBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Minigun"
   ObjectArchetype=KFWeap_MinigunBase'KFGame.Default__KFWeap_MinigunBase'
}
