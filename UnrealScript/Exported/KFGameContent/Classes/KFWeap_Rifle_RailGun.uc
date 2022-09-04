//=============================================================================
// KFWeap_Rifle_RailGun
//=============================================================================
// A Horzine technology Rail Gun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_Rifle_RailGun extends KFWeap_ScopedBase;

var ScriptedTexture CanvasTexture;

/** Current length of the square scope texture. This is checked against before modifying the
    ScopeTextureSize in the scenario when InitFOV is called multiple times with the same values */
var int CurrentCanvasTextureSize;

/** Icon textures for lock on drawing */
var Texture2D LockedHitZoneIcon;
var Texture2D DefaultHitZoneIcon;
var LinearColor RedIconColor;
var LinearColor YellowIconColor;
var LinearColor BlueIconColor;

/*********************************************************************************************
 * @name Weapon lock on support
 **********************************************************************************************/

/** angle of the maximum FOV extents of the scope for rending things onto the scope canvas */
var float MaxScopeScreenDot;

/*********************************************************************************************
 * @name Ambient sound
 ********************************************************************************************* */
/** Pilot light sound play event */
var AkEvent                         AmbientSoundPlayEvent;

/** Pilot light sound stop event */
var AkEvent	                        AmbientSoundStopEvent;

/** Socket to attach the ambient sound to. */
var() name AmbientSoundSocketName;

/**
 * Initialize the FOV settings for this weapon, adjusting for aspect ratio
 * @param SizeX the X resolution of the screen
 * @param SizeY the Y resolution of the screen
 * @param DefaultPlayerFOV the default player FOV of the player holding this weapon
 */
simulated function InitFOV(float SizeX, float SizeY, float DefaultPlayerFOV)
{
    local int NewScopeTextureSize;

    super.InitFOV(SizeX, SizeY, DefaultPlayerFOV);

    NewScopeTextureSize = int(ScopeTextureScale*SizeX);

    if(NewScopeTextureSize > MaxSceneCaptureSize)
        NewScopeTextureSize = MaxSceneCaptureSize;

    if( CurrentCanvasTextureSize != NewScopeTextureSize )
    {
        CanvasTexture =  ScriptedTexture(class'ScriptedTexture'.static.Create(NewScopeTextureSize, NewScopeTextureSize, PF_FloatRGB, MakeLinearColor(0,0,0,0)));

        CanvasTexture.Render = OnRender;
        CanvasTexture.bNeedsTwoCopies = true;

        if( ScopeLenseMIC != none )
        {
            ScopeLenseMIC.SetTextureParameterValue('ScopeText', CanvasTexture);
        }
        CurrentCanvasTextureSize = NewScopeTextureSize;
    }
}

/**
 * Set parameters for the weapon once replication is complete (works in Standalone as well)
 */
reliable client function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
	Super.ClientWeaponSet(bOptionalSet);

    // Only want to spawn sniper lenses on human players, but when PostBeginPlay
    // gets called Instigator isn't valid yet. So using NetMode == NM_Client,
    // since weapons should only exist on owning human clients with that netmode
    if( Instigator != none && Instigator.IsLocallyControlled() && Instigator.IsHumanControlled() )
    {
        if( ScopeLenseMIC != none )
        {
            ScopeLenseMIC.SetTextureParameterValue('ScopeText', CanvasTexture);
        }
    }
}

simulated function StartFire(byte FireModeNum)
{
	// Attempt auto-reload
	if ( FireModeNum == ALTFIRE_FIREMODE )
	{
		LogInternal("Nope, use the default you dirty cheater :)");
		FiremodeNum = DEFAULT_FIREMODE;
	}

	Super.StartFire(FireModeNum);
}

/** Return true if this weapon should play the fire last animation for this shoot animation */
simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
//    if( SpareAmmoCount[GetAmmoType(FireModeNum)] == 0 )
//    {
//        return true;
//    }

    return false;
}

/** Returns animation to play based on reload type and status */
simulated function name GetReloadAnimName( bool bTacticalReload )
{
	if ( AmmoCount[0] > 0 )
	{
		// Disable half-reloads for now.  This can happen if server gets out
		// of sync, but choosing the wrong animation will just make it worse!
		WarnInternal("Railgun reloading with non-empty mag");
	}

	return bTacticalReload ? ReloadEmptyMagEliteAnim : ReloadEmptyMagAnim;
}

/*********************************************************************************************
 * @name Ambient sound
 **********************************************************************************************/
/**
 * Starts playing looping ambient sound
 */
simulated function StartAmbientSound()
{
	if( Instigator != none && Instigator.IsLocallyControlled() && Instigator.IsFirstPerson() )
	{
        PostAkEventOnBone(AmbientSoundPlayEvent, AmbientSoundSocketName, false, true);
    }
}

/**
 * Stops playing looping ambient sound
 */
simulated function StopAmbientSound()
{
    PostAkEventOnBone(AmbientSoundStopEvent, AmbientSoundSocketName, false, true);
}

/**
 * Detach weapon from skeletal mesh
 *
 * @param	SkeletalMeshComponent weapon is attached to.
 */
simulated function DetachWeapon()
{
    StopAmbientSound();
    Super.DetachWeapon();
}

/*********************************************************************************************
 * @name Weapon lock on and targeting
 **********************************************************************************************/

/**
 * Tick the weapon (used for simple updates)
 *
 * @param	DeltaTime Elapsed time.
 */
simulated event Tick(float DeltaTime)
{
    super.Tick(DeltaTime);

	if (Instigator != none && Instigator.Controller != none && Instigator.IsLocallyControlled())
	{
		CanvasTexture.bNeedsUpdate = bUsingSights && TargetingComp.bTargetingUpdated;
	}
}

/** Event called when weapon actor is destroyed */
simulated event Destroyed()
{
    if( CanvasTexture != none )
    {
        CanvasTexture = none;
    }

    StopAmbientSound();

	super.Destroyed();
}

/**
 * Performs an 'Instant Hit' shot.
 * Network: Local Player and Server
 * Overriden to support the aim targeting of the railgun
 */
simulated function InstantFireClient()
{
	local vector			StartTrace, EndTrace;
	local rotator			AimRot;
	local Array<ImpactInfo>	ImpactList;
	local int				Idx;
	local ImpactInfo		RealImpact;
	local float				CurPenetrationValue;

	// see Controller AimHelpDot() / AimingHelp()
	bInstantHit = true;

	// define range to use for CalcWeaponFire()
	StartTrace = GetSafeStartTraceLocation();

	if (!IsZero(TargetingComp.LockedAimLocation))
	{
		AimRot = rotator(Normal(TargetingComp.LockedAimLocation - StartTrace));
    	EndTrace = StartTrace + vector(AimRot) * GetTraceRange();
	}
	else
	{
    	AimRot = GetAdjustedAim(StartTrace);
    	EndTrace = StartTrace + vector(AimRot) * GetTraceRange();
	}

	bInstantHit = false;

    // Initialize penetration power
    PenetrationPowerRemaining = GetInitialPenetrationPower(CurrentFireMode);
    CurPenetrationValue = PenetrationPowerRemaining;

	// Perform shot
	RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);

	// Set flash location to trigger client side effects.  Bypass Weapon.SetFlashLocation since
	// that function is not marked as simulated and we want instant client feedback.
	// ProjectileFire/IncrementFlashCount has the right idea:
	//	1) Call IncrementFlashCount on Server & Local
	//	2) Replicate FlashCount if ( !bNetOwner )
	//	3) Call WeaponFired() once on local player
	if( Instigator != None )
	{
		// If we have penetration, set the hitlocation to the last thing we hit
        if( ImpactList.Length > 0 )
		{
            Instigator.SetFlashLocation( Self, CurrentFireMode, ImpactList[ImpactList.Length - 1].HitLocation );
        }
        else
        {
            Instigator.SetFlashLocation( Self, CurrentFireMode, RealImpact.HitLocation );
        }
	}

	// local player only for clientside hit detection
	if ( Instigator != None && Instigator.IsLocallyControlled() )
	{
		// allow weapon to add extra bullet impacts (useful for shotguns)
		InstantFireClient_AddImpacts(StartTrace, AimRot, ImpactList);

		for (Idx = 0; Idx < ImpactList.Length; Idx++)
		{
			ProcessInstantHitEx(CurrentFireMode, ImpactList[Idx],, CurPenetrationValue, Idx);
		}

		if ( Instigator.Role < ROLE_Authority )
		{
            SendClientImpactList(CurrentFireMode, ImpactList);
		}
	}
}

/*********************************************************************************************
 * @name Targeting HUD
 **********************************************************************************************/

/** Handle drawing items on the scope ScriptedTexture */
simulated function OnRender(Canvas C)
{
    local int i;

    if( !bUsingSights )
    {
       return;
    }

	// Draw the targeting locations on the scope
	for (i = 0; i < TargetingComp.TargetVulnerableLocations.Length; i++)
    {
        if( !IsZero(TargetingComp.TargetVulnerableLocations[i]) )
        {
            DrawTargetingIcon( C, i );
        }
    }

    CanvasTexture.bNeedsUpdate = true;
}

/**
 * @brief Draws an icon when human players are hidden but in the field of view
 *
 * @param PRI Player's PlayerReplicationInfo
 * @param IconWorldLocation The "player's" location in the world
 */
simulated function DrawTargetingIcon( Canvas Canvas, int index )
{
    local vector WorldPos;
    local float IconSize, IconScale;
    local vector2d ScreenPos;

    // Project world pos to canvas
	WorldPos = TargetingComp.TargetVulnerableLocations[index];
    ScreenPos = WorldToCanvas(Canvas, WorldPos);

    // calculate scale based on resolution and distance
    IconScale = FMin(float(Canvas.SizeX) / 1024.f, 1.f);
	// Scale down up to 40 meters away, with a clamp at 20% size
    IconScale *= FClamp(1.f - VSize(WorldPos - Instigator.Location) / 4000.f, 0.2f, 1.f);

    // Apply size scale
    IconSize = 300.f * IconScale;
    ScreenPos.X -= IconSize / 2.f;
    ScreenPos.Y -= IconSize / 2.f;

    // Off-screen check
    if( ScreenPos.X < 0 || ScreenPos.X > Canvas.SizeX || ScreenPos.Y < 0 || ScreenPos.Y > Canvas.SizeY )
    {
        return;
    }

    Canvas.SetPos( ScreenPos.X, ScreenPos.Y );

	// Pick the color of the targeting box to draw
	if( TargetingComp.LockedHitZone >= 0 && index == TargetingComp.LockedHitZone )
    {
        Canvas.DrawTile( LockedHitZoneIcon, IconSize, IconSize, 0, 0, LockedHitZoneIcon.SizeX, LockedHitZoneIcon.SizeY, RedIconColor);
    }
    else if( TargetingComp.PendingHitZone >= 0 && index == TargetingComp.PendingHitZone )
    {
        Canvas.DrawTile( LockedHitZoneIcon, IconSize, IconSize, 0, 0, LockedHitZoneIcon.SizeX, LockedHitZoneIcon.SizeY, YellowIconColor);
    }
    else
    {
        Canvas.DrawTile( DefaultHitZoneIcon, IconSize, IconSize, 0, 0, DefaultHitZoneIcon.SizeX, DefaultHitZoneIcon.SizeY, BlueIconColor);
    }
}

/**
 * Canvas.Project() doesn't work because our Canvas doesn't have a FSceneView, so
 * we have to get the transforms out of the scene capture actor... or in this
 * case we can make it work with angles
 */
simulated function vector2d WorldToCanvas( Canvas Canvas, vector WorldPoint)
{
	local vector ViewLoc, ViewDir;
	local rotator ViewRot;
	local vector X,Y,Z;
	local vector2d ScreenPoint;
	local float DotToZedUpDown, DotToZedLeftRight, UpDownScale, LeftRightScale;

	Instigator.Controller.GetPlayerViewPoint(ViewLoc, ViewRot);
	GetAxes(ViewRot, X, Y, Z);
	ViewDir = Normal(WorldPoint - ViewLoc);

    DotToZedUpDown = Z dot ViewDir;
    DotToZedLeftRight = Y dot ViewDir;

    UpDownScale = DotToZedUpDown/MaxScopeScreenDot;
    LeftRightScale = DotToZedLeftRight/MaxScopeScreenDot;

    ScreenPoint.X = CanvasTexture.SizeX * (0.5 + LeftRightScale * 0.5);
    ScreenPoint.Y = CanvasTexture.SizeY * (0.5 - UpDownScale * 0.5);

	return ScreenPoint;
}

/*
{
	local vector V;

	// transform by viewProjectionMatrix
	V = TransformVector(SceneCapture.ViewMatrix * SceneCapture.ProjMatrix, WorldPoint);

	// apply clip "matrix"
	V.X = (Canvas.ClipX/2.f) + (V.X*(Canvas.ClipX/2.f));
	V.Y *= -1.f;
	V.Y = (Canvas.ClipY/2.f) + (V.Y*(Canvas.ClipY/2.f));

	return V;
}
*/

/*********************************************************************************************
 * state Inactive
 * This state is the default state.  It needs to make sure Zooming is reset when entering/leaving
 *********************************************************************************************/

auto simulated state Inactive
{
	simulated function BeginState(name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);
		StopAmbientSound();
	}
}

/*********************************************************************************************
 * State WeaponEquipping
 * The Weapon is in this state while transitioning from Inactive to Active state.
 * Typically, the weapon will remain in this state while its selection animation is being played.
 * While in this state, the weapon cannot be fired.
*********************************************************************************************/

simulated state WeaponEquipping
{
	simulated function BeginState(Name PreviousStateName)
	{
		super.BeginState(PreviousStateName);
        StartAmbientSound();
	}
}

/*********************************************************************************************
 * State WeaponPuttingDown
 * Putting down weapon in favor of a new one.
 * Weapon is transitioning to the Inactive state.
*********************************************************************************************/

simulated state WeaponPuttingDown
{
	simulated event BeginState(Name PreviousStateName)
	{
		super.BeginState(PreviousStateName);
		StopAmbientSound();
	}
}

/*********************************************************************************************
* State WeaponAbortEquip
* Special PuttingDown state used when WeaponEquipping is interrupted.  Must come after
* WeaponPuttingDown definition or this willextend the super version.
*********************************************************************************************/

simulated state WeaponAbortEquip
{
	simulated event BeginState(Name PreviousStateName)
	{
		super.BeginState(PreviousStateName);
		StopAmbientSound();
	}
}

defaultproperties
{
   LockedHitZoneIcon=Texture2D'Wep_Scope_TEX.Wep_1stP_Yellow_Red_Target'
   DefaultHitZoneIcon=Texture2D'Wep_Scope_TEX.Wep_1stP_Blue_Target'
   RedIconColor=(R=1.000000,G=0.000000,B=0.000000,A=1.000000)
   YellowIconColor=(R=1.000000,G=1.000000,B=0.000000,A=1.000000)
   BlueIconColor=(R=0.250000,G=0.600000,B=1.000000,A=1.000000)
   MaxScopeScreenDot=0.200000
   AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Loop'
   AmbientSoundStopEvent=AkEvent'WW_WEP_SA_Railgun.Stop_Railgun_Loop'
   AmbientSoundSocketName="AmbientSound"
   Begin Object Class=TWSceneCapture2DDPGComponent Name=SceneCapture2DComponent0 Archetype=TWSceneCapture2DDPGComponent'KFGame.Default__KFWeap_ScopedBase:SceneCapture2DComponent0'
      bRenderForegroundDPG=False
      FieldOfView=23.000000
      NearPlane=10.000000
      FarPlane=0.000000
      bUpdateMatrices=False
      bEnabled=False
      bEnableFog=True
      ViewMode=SceneCapView_Lit
      FrameRate=60.000000
      Name="SceneCapture2DComponent0"
      ObjectArchetype=TWSceneCapture2DDPGComponent'KFGame.Default__KFWeap_ScopedBase:SceneCapture2DComponent0'
   End Object
   SceneCapture=SceneCapture2DComponent0
   ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_RailGun_MAT.Wep_1stP_RailGun_Lens_MIC'
   ScopedSensitivityMod=16.000000
   PackageKey="RailGun"
   FirstPersonMeshName="WEP_1P_RailGun_MESH.WEP_1stP_RailGun_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_RailGun_ANIM.WEP_1P_RailGun_ANIM"
   PickupMeshName="wep_3p_railgun_mesh.Wep_3rdP_RailGun_Pickup"
   AttachmentArchetypeName="WEP_RailGun_ARCH.Wep_RailGun_3P_Updated"
   MuzzleFlashTemplateName="WEP_RailGun_ARCH.Wep_RailGun_MuzzleFlash"
   bHasIronSights=True
   bWarnAIWhenAiming=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(0)=Texture2D'UI_SecondaryAmmo_TEX.UI_FireModeSelect_AutoTarget'
   FireModeIconPaths(1)=Texture2D'UI_SecondaryAmmo_TEX.UI_FireModeSelect_ManualTarget'
   InventorySize=9
   MagazineCapacity(0)=1
   PenetrationPower(0)=10.000000
   PenetrationPower(1)=10.000000
   MeshIronSightFOV=27.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=-0.250000,Y=0.000000,Z=0.000000)
   DOF_BlendInSpeed=3.000000
   DOF_FG_FocalRadius=0.000000
   DOF_FG_MaxNearBlurSize=3.500000
   AimWarningDelay=(X=0.400000,Y=0.800000)
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'WEP_UI_RailGun_TEX.UI_WeaponSelect_Railgun'
   SpareAmmoCapacity(0)=32
   InitialSpareMags(0)=6
   AmmoPickupScale(0)=3.000000
   ForceReloadTimeOnEmpty=0.500000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   BonesToLockOnEmpty(0)="RW_TopLeft_RadShield1"
   BonesToLockOnEmpty(1)="RW_TopRight_RadShield1"
   BonesToLockOnEmpty(2)="RW_TopLeft_RadShield2"
   BonesToLockOnEmpty(3)="RW_TopRight_RadShield2"
   BonesToLockOnEmpty(4)="RW_TopLeft_RadShield3"
   BonesToLockOnEmpty(5)="RW_TopRight_RadShield3"
   BonesToLockOnEmpty(6)="RW_TopLeft_RadShield4"
   BonesToLockOnEmpty(7)="RW_TopRight_RadShield4"
   BonesToLockOnEmpty(8)="RW_TopLeft_RadShield5"
   BonesToLockOnEmpty(9)="RW_TopRight_RadShield5"
   BonesToLockOnEmpty(10)="RW_TopLeft_RadShield6"
   BonesToLockOnEmpty(11)="RW_TopRight_RadShield6"
   BonesToLockOnEmpty(12)="RW_BottomLeft_RadShield2"
   BonesToLockOnEmpty(13)="RW_BottomRight_RadShield2"
   BonesToLockOnEmpty(14)="RW_BottomLeft_RadShield3"
   BonesToLockOnEmpty(15)="RW_BottomRight_RadShield3"
   BonesToLockOnEmpty(16)="RW_BottomLeft_RadShield4"
   BonesToLockOnEmpty(17)="RW_BottomRight_RadShield4"
   BonesToLockOnEmpty(18)="RW_BottomLeft_RadShield5"
   BonesToLockOnEmpty(19)="RW_BottomRight_RadShield5"
   BonesToLockOnEmpty(20)="RW_BottomLeft_RadShield6"
   BonesToLockOnEmpty(21)="RW_BottomRight_RadShield6"
   BonesToLockOnEmpty(22)="RW_BottomLeft_RadShield1"
   BonesToLockOnEmpty(23)="RW_BottomRight_RadShield1"
   BonesToLockOnEmpty(24)="RW_Bullets1"
   BonesToLockOnEmpty(25)="RW_AcceleratorMagnetrons"
   BonesToLockOnEmpty(26)="RW_Bolt"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_DryFire'
   PlayerViewOffset=(X=3.000000,Y=7.000000,Z=-2.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Rifle_RailGun:MeleeHelper_0'
   IronSightsSpreadMod=0.010000
   maxRecoilPitch=600
   minRecoilPitch=450
   maxRecoilYaw=250
   minRecoilYaw=-250
   RecoilBlendOutRatio=1.100000
   RecoilViewRotationScale=0.600000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMinPitchLimit=64785
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   HippedRecoilModifier=2.333330
   FallingRecoilModifier=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Sharpshooter'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.250000),(Stat=EWUS_Damage1,Scale=1.250000),(Add=1)))
   TargetingCompClass=Class'kfgamecontent.KFTargetingWeaponComponent_RailGun'
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_RailGun'
   WeaponProjectiles(1)=None
   FireInterval(0)=0.100000
   FireInterval(1)=0.100000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.005000
   Spread(1)=0.005000
   InstantHitDamage(0)=280.000000
   InstantHitDamage(1)=560.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=30.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_RailGun'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_RailGun'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_RailGun'
   FireOffset=(X=30.000000,Y=3.000000,Z=-2.500000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ScopedBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ScopedBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Rail Gun"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_ScopedBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_ScopedBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Components(0)=SceneCapture2DComponent0
   Name="Default__KFWeap_Rifle_RailGun"
   ObjectArchetype=KFWeap_ScopedBase'KFGame.Default__KFWeap_ScopedBase'
}
