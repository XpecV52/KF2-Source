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

var bool bWasTimeDilated;

/** Explosion actor class to spawn */
var class<KFExplosionActor> ExplosionActorClass;
var() KFGameExplosion ExplosionTemplate;
/** If true, use an alternate set of explosion effects */
var bool    bAltExploEffects;
var KFImpactEffectInfo AltExploEffects;

var transient Actor BlastAttachee;

/** Spawn location offset to improve cone hit detection */
var transient float BlastSpawnOffset;

/** If set, heavy attack button has been released during the attack */
var transient bool bPulverizerFireReleased;

var bool bFriendlyFireEnabled;

var class<KFExplosionActor> NukeExplosionActorClass;

var float StartingDamageRadius;

replication
{
	if (bNetInitial)
		bFriendlyFireEnabled;
}

simulated event PreBeginPlay()
{
	Super.PreBeginPlay();

	/** Initially check whether friendly fire is on or not. */
	if(Role == ROLE_Authority && KFGameInfo(WorldInfo.Game).FriendlyFireScale != 0.f)
	{
		bFriendlyFireEnabled = true;
	}

	if (ExplosionTemplate != none)
	{
		StartingDamageRadius = ExplosionTemplate.DamageRadius;
	}
}

/** Healing charge doesn't count as ammo for purposes of inventory management (e.g. switching) */
simulated function bool HasAnyAmmo()
{
	// Special ammo is stored in the default firemode (heal darts are separate)
	if (HasSpareAmmo() || AmmoCount[DEFAULT_FIREMODE] >= AmmoCost[CUSTOM_FIREMODE])
	{
		return true;
	}

	return false;
}


simulated event bool HasAmmo(byte FireModeNum, optional int Amount)
{
	// Default fire mode either has ammo to trigger the heal or needs to return true to still allow a basic swing
	if (FireModeNum == DEFAULT_FIREMODE)
	{
		return true;
	}

	return super.HasAmmo(FireModeNum, Amount);
}

/** Pulverizer should be able to interrupt its reload state with any melee attack */
simulated function bool CanOverrideMagReload(byte FireModeNum)
{
	return FireModeNum != RELOAD_FIREMODE;
}

/** Explosion Actor version */
simulated function CustomFire()
{
	local KFExplosionActor ExploActor;
	local vector SpawnLoc;
	local rotator SpawnRot;

	if ( Instigator.Role < ROLE_Authority )
	{
		return;
	}

	// On local player or server, we cache off our time dilation setting here
	if (WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_DedicatedServer || Instigator.Controller != None)
	{
		bWasTimeDilated = WorldInfo.TimeDilation < 1.f;
	}

	PrepareExplosionTemplate();
	SetExplosionActorClass();

	SpawnLoc = Instigator.GetWeaponStartTraceLocation();
	SpawnRot = GetPulverizerAim(SpawnLoc);

	// nudge backwards to give a wider code near the player
	SpawnLoc += vector(SpawnRot) * BlastSpawnOffset;

	// explode using the given template
	ExploActor = Spawn(ExplosionActorClass, self,, SpawnLoc, SpawnRot,, true);
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
		ExploActor.SetSyncToMuzzleLocation(true);

		ExploActor.Explode(ExplosionTemplate, vector(SpawnRot));
	}

	// tell remote clients that we fired, to trigger effects in third person
	IncrementFlashCount();

	ExplosionTemplate.DamageRadius = StartingDamageRadius;

	if ( bDebug )
	{
		DrawDebugCone(SpawnLoc, vector(SpawnRot), ExplosionTemplate.DamageRadius, ExplosionTemplate.DirectionalExplosionAngleDeg * DegToRad,
			ExplosionTemplate.DirectionalExplosionAngleDeg * DegToRad, 16, MakeColor(64,64,255,0), TRUE);
	}
}


// for nukes && concussive force
simulated protected function PrepareExplosionTemplate()
{
	local KFPlayerReplicationInfo InstigatorPRI;
	local KFPlayerController KFPC;
	local KFPerk InstigatorPerk;

	if (bWasTimeDilated)
	{
		InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
		if (InstigatorPRI != none)
		{
			if (InstigatorPRI.bNukeActive)
			{
				ExplosionTemplate = class'KFPerk_Demolitionist'.static.GetNukeExplosionTemplate();
				ExplosionTemplate.Damage = ExplosionTemplate.Damage * class'KFPerk_Demolitionist'.static.GetNukeDamageModifier();
				ExplosionTemplate.DamageRadius = ExplosionTemplate.DamageRadius * class'KFPerk_Demolitionist'.static.GetNukeRadiusModifier();
				ExplosionTemplate.DamageFalloffExponent = ExplosionTemplate.DamageFalloffExponent;
			}
			else if (InstigatorPRI.bConcussiveActive && AltExploEffects != none)
			{
				ExplosionTemplate.ExplosionEffects = AltExploEffects;
				ExplosionTemplate.ExplosionSound = class'KFPerk_Demolitionist'.static.GetConcussiveExplosionSound();
			}
		}
	}
	else
	{
		// When copying the default, we are assigning a reference that can change the default
		// So since we are changing the DamageRadius, save that default off and re-apply it here
		ExplosionTemplate = default.ExplosionTemplate;
		ExplosionTemplate.DamageRadius = StartingDamageRadius;
	}

	// Change the radius and damage based on the perk
	if (Owner.Role == ROLE_Authority)
	{
		KFPC = KFPlayerController(Instigator.Controller);
		if (KFPC != none)
		{
			InstigatorPerk = KFPC.GetPerk();
			ExplosionTemplate.DamageRadius *= InstigatorPerk.GetAoERadiusModifier();
		}
	}
}

simulated protected function SetExplosionActorClass()
{
	local KFPlayerReplicationInfo InstigatorPRI;

	if (bWasTimeDilated && Instigator != none)
	{
		InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
		if (InstigatorPRI != none)
		{
			if (InstigatorPRI.bNukeActive)
			{
				ExplosionActorClass = NukeExplosionActorClass;
				return;
			}
		}
	}
	ExplosionActorClass = default.ExplosionActorClass;
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
		LogInternal("ServerBeginPulverizerFire outside of range!");
		return;
	}

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
simulated function bool CanReload(optional byte FireModeNum)
{
	return true;
}

/** Debugging */







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
			if ( Victim == None ||
				(!bFriendlyFireEnabled && Victim.GetTeamNum() == Instigator.GetTeamNum()) ||
				(Victim.bPlayedDeath && (WorldInfo.TimeSeconds - Victim.TimeOfDeath) > 0.f) )
			{
				return;
			}

			if ( AmmoCount[0] >= AmmoCost[CUSTOM_FIREMODE] && !IsTimerActive(nameof(BeginPulverizerFire)) )
			{
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

simulated state Active
{
	/**
	 * Called from Weapon:Active.BeginState when HasAnyAmmo (which is overridden above) returns false.
	 */
	simulated function WeaponEmpty()
	{
		local int i;

		// Copied from Weapon:Active.BeginState where HasAnyAmmo returns true.
		// Basically, pretend the weapon isn't empty in this case.
		for (i=0; i<GetPendingFireLength(); i++)
		{
			if (PendingFire(i))
			{
				BeginFire(i);
				break;
			}
		}
	}
}

defaultproperties
{
   ExplosionActorClass=Class'KFGame.KFExplosionActorReplicated'
   ExplosionTemplate=KFGameExplosion'WEP_Pulverizer_ARCH.Wep_Pulverizer_Explosion'
   AltExploEffects=KFImpactEffectInfo'wep_rpg7_arch.RPG7_Explosion_Concussive_Force'
   NukeExplosionActorClass=Class'KFGame.KFExplosion_ReplicatedNuke'
   ParryStrength=5
   ParryDamageMitigationPercent=0.400000
   BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Hammer'
   ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Wood'
   PackageKey="Pulverizer"
   FirstPersonMeshName="WEP_1P_Pulverizer_MESH.Wep_1stP_Pulverizer_Rig_New"
   FirstPersonAnimSetNames(0)="WEP_1P_Pulverizer_ANIM.Wep_1stP_Pulverizer_Anim"
   PickupMeshName="WEP_3P_Pulverizer_MESH.Wep_Pulverizer_Pickup"
   AttachmentArchetypeName="WEP_Pulverizer_ARCH.Wep_Pulverizer_3P"
   MuzzleFlashTemplateName="WEP_Pulverizer_ARCH.Wep_Pulverizer_MuzzleFlash"
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
   FireModeIconPaths(1)=()
   FireModeIconPaths(2)=()
   FireModeIconPaths(3)=()
   FireModeIconPaths(4)=()
   FireModeIconPaths(5)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
   FireModeIconPaths(6)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   InventorySize=6
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Pulverizer'
   MagazineCapacity(0)=5
   AmmoCost(6)=1
   SpareAmmoCapacity(0)=15
   WeaponFireSnd(6)=(DefaultCue=AkEvent'WW_WEP_MEL_Pulverizer.Play_WEP_MEL_Pulverizer_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_MEL_Pulverizer.Play_WEP_MEL_Pulverizer_Fire_1P')
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
      bUseDirectionalMelee=True
      bHasChainAttacks=True
      ChainSequence_F(0)=DIR_ForwardRight
      ChainSequence_F(1)=DIR_ForwardLeft
      ChainSequence_F(2)=DIR_ForwardRight
      ChainSequence_F(3)=DIR_ForwardLeft
      ChainSequence_L(1)=DIR_ForwardLeft
      ChainSequence_L(2)=()
      ChainSequence_L(3)=DIR_Left
      ChainSequence_L(4)=()
      ChainSequence_R(1)=DIR_ForwardRight
      ChainSequence_R(2)=()
      ChainSequence_R(3)=DIR_Right
      ChainSequence_R(4)=()
      MeleeImpactCamShakeScale=0.040000
      MaxHitRange=190.000000
      HitboxChain(0)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=170.000000))
      HitboxChain(1)=(BoneOffset=(X=0.000000,Y=3.000000,Z=150.000000))
      HitboxChain(2)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=130.000000))
      HitboxChain(3)=(BoneOffset=(X=0.000000,Y=3.000000,Z=110.000000))
      HitboxChain(4)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=90.000000))
      HitboxChain(5)=(BoneOffset=(X=0.000000,Y=3.000000,Z=70.000000))
      HitboxChain(6)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=50.000000))
      HitboxChain(7)=(BoneOffset=(X=0.000000,Y=3.000000,Z=30.000000))
      HitboxChain(8)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=10.000000))
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Blunt_Pulverizer:MeleeHelper_0'
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Berserker'
   AssociatedPerkClasses(1)=Class'KFGame.KFPerk_Demolitionist'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.100000),(Stat=EWUS_Damage1,Scale=1.100000),(Stat=EWUS_Damage2,Scale=1.100000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.200000),(Stat=EWUS_Damage1,Scale=1.200000),(Stat=EWUS_Damage2,Scale=1.200000),(Add=2)))
   FiringStatesArray(2)="Reloading"
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   FiringStatesArray(5)=()
   FiringStatesArray(6)="WeaponSingleFiring"
   WeaponFireTypes(6)=EWFT_Custom
   FireInterval(5)=0.000000
   FireInterval(6)=1.000000
   InstantHitDamage(0)=80.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=20.000000
   InstantHitDamage(4)=()
   InstantHitDamage(5)=145.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Bludgeon_Pulverizer'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_PulverizerBash'
   InstantHitDamageTypes(4)=()
   InstantHitDamageTypes(5)=Class'kfgamecontent.KFDT_Bludgeon_PulverizerHeavy'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_MeleeBase:FirstPersonMesh'
      MinTickTimeStep=0.025000
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_MeleeBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Pulverizer"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Blunt_Pulverizer"
   ObjectArchetype=KFWeap_MeleeBase'KFGame.Default__KFWeap_MeleeBase'
}
