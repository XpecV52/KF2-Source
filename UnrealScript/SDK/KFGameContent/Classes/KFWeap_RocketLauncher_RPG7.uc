//=============================================================================
// KFWeap_RocketLauncher_RPG7
//=============================================================================
// An RPG-7 Rocket Launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_RocketLauncher_RPG7 extends KFWeap_GrenadeLauncher_Base;

/** Back blash explosion template. */
var() GameExplosion ExplosionTemplate;

/** Holds an offest for spawning back blast effects. */
var()			vector	BackBlastOffset;

/** Fires a projectile, but also does the back blast */
simulated function CustomFire()
{
	local KFExplosionActorReplicated ExploActor;
	local vector SpawnLoc;
	local rotator SpawnRot;

    ProjectileFire();

	if ( Instigator.Role < ROLE_Authority )
	{
		return;
	}

	GetBackBlastLocationAndRotation(SpawnLoc, SpawnRot);

	// explode using the given template
	ExploActor = Spawn(class'KFExplosionActorReplicated', self,, SpawnLoc, SpawnRot,, true);
	if (ExploActor != None)
	{
		ExploActor.InstigatorController = Instigator.Controller;
		ExploActor.Instigator = Instigator;

		// So we get backblash decal from this explosion
		ExploActor.bTraceForHitActorWhenDirectionalExplosion = true;

		ExploActor.Explode(ExplosionTemplate, vector(SpawnRot));
	}

	if ( bDebug )
	{
        DrawDebugCone(SpawnLoc, vector(SpawnRot), ExplosionTemplate.DamageRadius, ExplosionTemplate.DirectionalExplosionAngleDeg * DegToRad,
			ExplosionTemplate.DirectionalExplosionAngleDeg * DegToRad, 16, MakeColor(64,64,255,0), TRUE);
	}
}

/**
 * This function returns the world location for spawning back blast and the direction to send the back blast in
 */
simulated function GetBackBlastLocationAndRotation(out vector BlastLocation, out rotator BlastRotation)
{
    local vector X, Y, Z;
    local Rotator ViewRotation;

	if( Instigator != none )
	{
        if( bUsingSights )
        {
            ViewRotation = Instigator.GetViewRotation();

        	// Add in the free-aim rotation
        	if ( KFPlayerController(Instigator.Controller) != None )
        	{
        		ViewRotation += KFPlayerController(Instigator.Controller).WeaponBufferRotation;
        	}

            GetAxes(ViewRotation, X, Y, Z);

            BlastRotation = Rotator(Vector(ViewRotation) * -1);
            BlastLocation =  Instigator.GetWeaponStartTraceLocation() + X * BackBlastOffset.X;
		}
		else
		{
            ViewRotation = Instigator.GetViewRotation();

        	// Add in the free-aim rotation
        	if ( KFPlayerController(Instigator.Controller) != None )
        	{
        		ViewRotation += KFPlayerController(Instigator.Controller).WeaponBufferRotation;
        	}

            BlastRotation = Rotator(Vector(ViewRotation) * -1);
            BlastLocation = Instigator.GetPawnViewLocation() + (BackBlastOffset >> ViewRotation);
		}
	}
}

/** Locks the bolt bone in place to the open position (Called by animnotify) */
simulated function ANIMNOTIFY_LockBolt()
{
	// Consider us empty after every shot so the rocket gets hidden
	EmptyMagBlendNode.SetBlendTarget(1, 0);
}

defaultproperties
{
	ForceReloadTime=0.4f

	// Inventory
	InventoryGroup=IG_Primary
	GroupPriority=100
	InventorySize=10
	WeaponSelectTexture=Texture2D'WEP_UI_RPG7_TEX.UI_WeaponSelect_RPG7'

    // FOV
	MeshFOV=75
	MeshIronSightFOV=65
	PlayerIronSightFOV=70
	PlayerSprintFOV=95

	// Depth of field
	DOF_FG_FocalRadius=50
	DOF_FG_MaxNearBlurSize=2.5

	// Zooming/Position
	PlayerViewOffset=(X=10.0,Y=10,Z=-2)
	FastZoomOutTime=0.2

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WEP_1P_RPG7_MESH.Wep_1stP_RPG7_Rig'
		AnimSets(0)=AnimSet'WEP_1P_RPG7_ANIM.Wep_1stP_RPG7_Anim'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_RPG7_MESH.Wep_rpg7_Pickup'
	End Object

	AttachmentArchetype=KFWeaponAttachment'WEP_RPG7_ARCH.Wep_RPG7_3P'

   	// Zooming/Position
	IronSightPosition=(X=0,Y=0,Z=0)

	// Ammo
	MagazineCapacity[0]=1
	MaxSpareAmmo[0]=15
	InitialSpareMags[0]=4
	AmmoPickupScale[0]=2.0
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=900
	minRecoilPitch=775
	maxRecoilYaw=500
	minRecoilYaw=-500
	RecoilRate=0.085
	RecoilBlendOutRatio=0.35
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=1500
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65485
	RecoilViewRotationScale=0.8
	FallingRecoilModifier=1.5
	HippedRecoilModifier=1.25

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'UI_FireModes_TEX.UI_FireModeSelect_Rocket'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFireAndReload
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Custom
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Rocket_RPG7'
	FireInterval(DEFAULT_FIREMODE)=+0.25
	InstantHitDamage(DEFAULT_FIREMODE)=150.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_RPG7Impact'
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_RPG7'
	Spread(DEFAULT_FIREMODE)=0.025
	FireOffset=(X=20,Y=4.0,Z=-3)
	BackBlastOffset=(X=-20,Y=4.0,Z=-3)

	// ALT_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	// Back blash explosion settings.  Using archetype so that clients can serialize the content
	// without loading the 1st person weapon content (avoid 'Begin Object')!
	ExplosionTemplate=KFGameExplosion'WEP_RPG7_ARCH.Wep_RPG7_BackBlastExplosion'

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'WEP_RPG7_ARCH.Wep_RPG7_MuzzleFlash'
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_RPG7.Play_WEP_SA_RPG7_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_RPG7.Play_WEP_SA_RPG7_Fire_1P')

	//@todo: add akevent when we have it
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_RPG7.Play_WEP_SA_RPG7_DryFire'

	// Animation
	bHasFireLastAnims=true
	IdleFidgetAnims=(Guncheck_v1, Guncheck_v2)

	BonesToLockOnEmpty=(RW_Grenade1)

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	AssociatedPerkClass=class'KFPerk_Demolitionist'

}


