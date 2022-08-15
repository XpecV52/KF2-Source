//=============================================================================
// KFWeap_Blunt_Pulverizer
//=============================================================================
// A sledgehammer combined with a makeshift shotgun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Blunt_Pulverizer extends KFWeap_MeleeBase;

const ShootAnim_L = 'HardFire_L';
const ShootAnim_R = 'HardFire_R';
const ShootAnim_F = 'HardFire_F';
const ShootAnim_B = 'HardFire_B';

var() GameExplosion ExplosionTemplate;
/** Location to try and spawn explosion at */
var transient vector BlastStartLocation;
var transient Actor  BlastAttachee;

/** If set, heavy attack button has been released during the attack */
var transient bool bPulverizerFireReleased;

/** Explosion Actor version */
simulated function CustomFire()
{
	local KFExplosionActorReplicated ExploActor;
	local vector SpawnLoc;
	local rotator SpawnRot;

	if ( Instigator.Role < ROLE_Authority )
	{
		return;
	}

	SpawnLoc = Instigator.GetWeaponStartTraceLocation(); //BlastStartLocation;
	SpawnRot = GetPulverizerAim(SpawnLoc);

	// explode using the given template
	ExploActor = Spawn(class'KFExplosionActorReplicated', self,, SpawnLoc, SpawnRot,, true);
	if (ExploActor != None)
	{
		ExploActor.InstigatorController = Instigator.Controller;
		ExploActor.Instigator = Instigator;

		// Force the actor we collided with to get hit again (when DirectionalExplosionAngleDeg is small)
		// This is only necessary on server since GetEffectCheckRadius() will be zero on client
		ExploActor.Attachee = BlastAttachee;
		ExplosionTemplate.bFullDamageToAttachee = true;

		// enable muzzle location sync
		ExploActor.bReplicateInstigator = true;
		ExploActor.bSyncParticlesToMuzzle = true;

		ExploActor.Explode(ExplosionTemplate, vector(SpawnRot));
	}

	// tell remote clients that we fired, to trigger effects in third person
	IncrementFlashCount();

	if ( bDebug )
	{
		DrawDebugCone(SpawnLoc, vector(SpawnRot), ExplosionTemplate.DamageRadius, ExplosionTemplate.DirectionalExplosionAngleDeg * DegToRad,
			ExplosionTemplate.DirectionalExplosionAngleDeg * DegToRad, 16, MakeColor(64,64,255,0), TRUE);
	}
}

/** Called by CustomFire when shotgun blast is fired */
simulated function Rotator GetPulverizerAim( vector StartFireLoc )
{
	local Rotator R;

	R = GetAdjustedAim(StartFireLoc);

	// Adjust cone fire angle based on swing direction
	switch (MeleeAttackHelper.CurrentAttackDir)
	{
		case DIR_Left:
			R.Yaw += 5461;
			break;
		case DIR_Right:
			R.Yaw -= 5461;
			break;
		case DIR_Forward:
			R.Pitch -= 2048;
			break;
		case DIR_Backward:
			R.Pitch += 2048;
			break;
	}

	return R;
}

/** Don't play a shoot anim when FireAmmunition is called */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	// Adjust cone fire angle based on swing direction
	switch (MeleeAttackHelper.CurrentAttackDir)
	{
		case DIR_Forward:
		case DIR_ForwardLeft:
		case DIR_ForwardRight:
			return ShootAnim_F;
		case DIR_Backward:
		case DIR_BackwardLeft:
		case DIR_BackwardRight:
			return ShootAnim_B;
		case DIR_Left:
			return ShootAnim_L;
		case DIR_Right:
			return ShootAnim_R;
	}
	return '';
}

/** Called on the server alongside PulverizerFired */
reliable server private function ServerBeginPulverizerFire(Actor HitActor, optional vector HitLocation)
{
	// Ignore if too far away (something went wrong!)
	if ( VSizeSq2D(HitLocation - Instigator.Location) > Square(500) )
	{
		`log("ServerBeginPulverizerFire outside of range!");
		return;
	}

	BlastStartLocation = HitLocation;
	BlastAttachee = HitActor;
	SendToFiringState(CUSTOM_FIREMODE);
}

/** Called when altfire melee attack hits a target and there is ammo left */
simulated function BeginPulverizerFire()
{
	SendToFiringState(CUSTOM_FIREMODE);
}

/** Skip calling StillFiring/PendingFire to fix log warning */
simulated function bool ShouldRefire()
{
	if ( CurrentFireMode == CUSTOM_FIREMODE )
		return false;

	return Super.ShouldRefire();
}

/** Override to allow for two different states associated with RELOAD_FIREMODE */
simulated function SendToFiringState(byte FireModeNum)
{
	// Ammo needs to be synchronized on client/server for this to work!
	if ( FireModeNum == RELOAD_FIREMODE && !Super(KFWeapon).CanReload() )
	{
		SetCurrentFireMode(FireModeNum);
		GotoState('WeaponUpkeep');
		return;
	}

	Super.SendToFiringState(FireModeNum);
}

/** Always allow reload and choose the correct state in SendToFiringState() */
simulated function bool CanReload()
{
	return true;
}

/** Debugging */
`if(`notdefined(ShippingPC))
exec function ToggleWeaponDebug()
{
	bDebug = !bDebug;
}
`endif

/*********************************************************************************************
 * State MeleeHeavyAttacking
 * This is the alt-fire Melee State.
 *********************************************************************************************/

simulated state MeleeHeavyAttacking
{
	/** Reset bPulverizerFireReleased */
	simulated event BeginState(Name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);
		bPulverizerFireReleased = false;
	}

	/** Set bPulverizerFireReleased to ignore NotifyMeleeCollision */
	simulated function StopFire(byte FireModeNum)
	{
		Super.StopFire(FireModeNum);
		bPulverizerFireReleased = true;
	}

	/** Network: Local Player */
	simulated function NotifyMeleeCollision(Actor HitActor, optional vector HitLocation)
	{
		local KFPawn Victim;

		// If fire button is being held down, try firing pulverizer
		if ( Instigator != None && Instigator.IsLocallyControlled() /*&& !bPulverizerFireReleased*/ )
		{
			// only detonate when the pulverizer hits a pawn so that level geometry doesn't get in the way
			if ( HitActor.bWorldGeometry )
			{
				return;
			}

			Victim = KFPawn(HitActor);
			if ( Victim == None || (Victim.bPlayedDeath && `TimeSince(Victim.TimeOfDeath) > 0.f) )
			{
				return;
			}

			if ( AmmoCount[0] > 0 && !IsTimerActive(nameof(BeginPulverizerFire)) )
			{
				BlastStartLocation = HitLocation;
				BlastAttachee = HitActor;

				// need to delay one frame, since this is called from AnimNotify
				SetTimer(0.001f, false, nameof(BeginPulverizerFire));

				if ( Role < ROLE_Authority )
				{
					if( HitActor.bTearOff && Victim != none )
					{
						Victim.TakeRadiusDamage(Instigator.Controller, ExplosionTemplate.Damage, ExplosionTemplate.DamageRadius, ExplosionTemplate.MyDamageType,
							ExplosionTemplate.MomentumTransferScale, Location, true, (Owner != None) ? Owner : self);
					}
					else
					{
						ServerBeginPulverizerFire(HitActor, HitLocation);
					}
				}
			}
		}
	}
}

defaultproperties
{
	AttachmentArchetype=KFWeaponAttachment'WEP_Pulverizer_ARCH.Wep_Pulverizer_3P'
	AssociatedPerkClass=class'KFPerk_Berserker'

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WEP_1P_Pulverizer_MESH.Wep_1stP_Pulverizer_Rig_New'
		AnimSets(0)=AnimSet'WEP_1P_Pulverizer_ANIM.Wep_1stP_Pulverizer_Anim'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Pulverizer_Pickup'
	End Object

	Begin Object Name=MeleeHelper_0
		MaxHitRange=190
		WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Blunted_melee_impact'
		// Override automatic hitbox creation (advanced)
		HitboxChain.Add((BoneOffset=(Y=-3,Z=170)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=150)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=130)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=110)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=90)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=70)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=50)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=30)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=10)))
		// modified combo sequences
		ChainSequence_F=(DIR_ForwardRight, DIR_ForwardLeft, DIR_ForwardRight, DIR_ForwardLeft)
		ChainSequence_B=(DIR_BackwardRight, DIR_ForwardLeft, DIR_BackwardLeft, DIR_ForwardRight)
		ChainSequence_L=(DIR_Right, DIR_ForwardLeft, DIR_ForwardRight, DIR_Left, DIR_Right)
		ChainSequence_R=(DIR_Left, DIR_ForwardRight, DIR_ForwardLeft, DIR_Right, DIR_Left)
	End Object

	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
	InstantHitDamage(DEFAULT_FIREMODE)=70
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Bludgeon_Pulverizer'

	FireModeIconPaths(HEAVY_ATK_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
	InstantHitDamage(HEAVY_ATK_FIREMODE)=145
	InstantHitDamageTypes(HEAVY_ATK_FIREMODE)=class'KFDT_Bludgeon_PulverizerHeavy'

	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_PulverizerBash'
	InstantHitDamage(BASH_FIREMODE)=20

	// Trigger explosion
	FireModeIconPaths(CUSTOM_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
	FiringStatesArray(CUSTOM_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(CUSTOM_FIREMODE)=EWFT_Custom
	FireInterval(CUSTOM_FIREMODE)=1.0f

	// Explosion settings.  Using archetype so that clients can serialize the content
	// without loading the 1st person weapon content (avoid 'Begin Object')!
	ExplosionTemplate=KFGameExplosion'WEP_Pulverizer_ARCH.Wep_Pulverizer_Explosion'

	// RELOAD
	FiringStatesArray(RELOAD_FIREMODE)=Reloading

	// Ammo
	MagazineCapacity[0]=5
	MaxSpareAmmo[0]=30
	InitialSpareMags[0]=3
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Inventory
	GroupPriority=75
	InventorySize=6
	UITexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Pulverizer'
	FilterTypeUI=FT_Melee

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'WEP_Pulverizer_ARCH.Wep_Pulverizer_MuzzleFlash'
	WeaponFireSnd(CUSTOM_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_MEL_Pulverizer.Play_WEP_MEL_Pulverizer_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_MEL_Pulverizer.Play_WEP_MEL_Pulverizer_Fire_1P')

	// Block Effects
	BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Hammer'
	ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Wood'

	// Trader
    EffectiveRange=3
	ParryDamageMitigationPercent=0.1
	
	ParryStrength=5
}


