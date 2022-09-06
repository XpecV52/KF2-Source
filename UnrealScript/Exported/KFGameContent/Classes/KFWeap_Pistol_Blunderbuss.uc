//=============================================================================
// KFWeap_Pistol_Blunderbuss
//=============================================================================
// A pistol that can shoot explosive cannonballs and shard shotgun projectiles.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//	- Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFWeap_Pistol_Blunderbuss extends KFWeap_PistolBase;

/** List of spawned cannon balls */
var array<KFProj_Cannonball_Blunderbuss> DeployedCannonballs;

/** Same as DeployedCannonballs.Length, but replicated because cannon balls are only tracked on server */
var int NumDeployedCannonballs;

/** set in the state to control the spawned projectiles **/
var bool bDeployedCannonball;

/** flag indicating that the cannonball was detonated **/
var bool bCannonballWasDetonated;

/** flag indicating that the cannonbal was converted to a time bomb and should not be converted again if it is in mid air **/
var bool bCannonballConvertedToTimeBomb;

/** flag indicating that the player released the button and the cannonbal can't be configured as a timed bomb **/
var bool bForceStandardCannonbal;

/** Reduction for the amount of damage dealt to the weapon owner (including damage by the explosion) */
var float SelfDamageReductionValue;

/** Amount of time we hold the fire button on this fire state, used in BlunderbussDeployAndDetonate **/
var transient float FireHoldTime;

/** Amount of time we should pass with the fire button on hold to trigger a timed explosion, used in BlunderbussDeployAndDetonate **/
var transient float TimedDetonationThresholdTime;

replication
{
	if (bNetDirty)
		NumDeployedCannonballs;
}

simulated function AltFireMode()
{
	if ( !Instigator.IsLocallyControlled() )
	{
		return;
	}

	StartFire(ALTFIRE_FIREMODE);
}

simulated function Projectile ProjectileFire()
{
	local Projectile P;
	local KFProj_Cannonball_Blunderbuss Cannonball;

	P = super.ProjectileFire();
	Cannonball = KFProj_Cannonball_Blunderbuss(P);

	if (Cannonball != none)
	{
		DeployedCannonballs.AddItem(Cannonball);
		NumDeployedCannonballs = DeployedCannonballs.Length;
		bForceNetUpdate = true;
	}

	return P;
}

/** Removes a charge from the list using either an index or an actor and updates NumDeployedCannonballs */
function RemoveDeployedCannonball(optional int CannonballIndex = INDEX_NONE, optional Actor CannonballActor)
{
	if (CannonballIndex == INDEX_NONE)
	{
		if (CannonballActor != none)
		{
			CannonballIndex = DeployedCannonballs.Find(CannonballActor);
		}
	}

	if (CannonballIndex != INDEX_NONE)
	{
		DeployedCannonballs.Remove(CannonballIndex, 1);
		NumDeployedCannonballs = DeployedCannonballs.Length;
		bForceNetUpdate = true;
	}
}

simulated function EndFire(byte FireModeNum)
{
	bForceStandardCannonbal = true;
	super.EndFire(FireModeNum);
}

simulated function ResetFireState()
{
	FireHoldTime = 0;
	bForceStandardCannonbal = false;
	bCannonballWasDetonated = false;
	bCannonballConvertedToTimeBomb = false;
}

/*********************************************************************************************
 * State BlunderbussDeployAndDetonate
 * The weapon is in this state while holding fire button for the CannonBall fire
*********************************************************************************************/

simulated state BlunderbussDeployAndDetonate extends WeaponSingleFiring
{
    simulated event BeginState(Name PreviousStateName)
    {
		if( !IsTimerActive('TryDetonateCannonBall') )
		{
			SetTimer( 0.05f, true, nameof(TryDetonateCannonBall) );
		}

		Super.BeginState(PreviousStateName);
		ResetFireState();
	}

    simulated event EndState(Name NextStateName)
    {
		local int iNumOfCannonballs, i;

		iNumOfCannonballs = DeployedCannonballs.Length;
		for(i=0; i < iNumOfCannonballs; i++)
		{
			DeployedCannonballs[0].Detonate();
		}
		bDeployedCannonball = false;
		ClearTimer( nameof(TryDetonateCannonBall) );
		Super.EndState(NextStateName);
	}

	simulated function PutDownWeapon()
	{
		local KFProj_Cannonball_Blunderbuss Cannonball;
 
		if (Role == ROLE_Authority && bDeployedCannonball && DeployedCannonballs.Length > 0)
		{
			Cannonball = DeployedCannonballs[DeployedCannonballs.Length - 1];
			if (Cannonball.bIsTimedExplosive)
			{
				Cannonball.Detonate();
				bCannonballWasDetonated = true;
			}
		}

		bDeployedCannonball = false;
		global.PutDownWeapon();
	}
	
	simulated function TryDetonateCannonBall()
	{
		if( bCannonballWasDetonated || bWeaponPutDown || ShouldRefire() )
		{
			return;
		}

		DetonateCannonball();
	}

    simulated event Tick(float DeltaTime)
    {
		local KFProj_Cannonball_Blunderbuss Cannonball;

		global.Tick(DeltaTime);

		// Timed bomb is not allowed if we press the button after releasing it
		if(bForceStandardCannonbal && !bCannonballConvertedToTimeBomb)
		{
			bDeployedCannonball = false;
			return;
		}

		// Don't charge unless we're holding down the button
		if (PendingFire(CurrentFireMode) && FireHoldTime < TimedDetonationThresholdTime)
		{
			FireHoldTime += DeltaTime;
		}

		if (Role == ROLE_Authority)
		{
			// Double check, this should not be empty:
			if (DeployedCannonballs.Length > 0)
			{
				Cannonball = DeployedCannonballs[DeployedCannonballs.Length - 1];
				
				// make sure we mark it as timed exploside only once!
				if (!Cannonball.bIsTimedExplosive && FireHoldTime >= TimedDetonationThresholdTime && !bCannonballConvertedToTimeBomb)
				{
					bCannonballConvertedToTimeBomb = true;
					Cannonball.bIsTimedExplosive = true;
					Cannonball.bNetDirty = true;
				}
			}
		}
    }
	
    simulated function FireAmmunition()
    {
		if (!bDeployedCannonball)
		{
			super.FireAmmunition();
			ResetFireState();
		}
		
		bDeployedCannonball = true;

		// re-set the pending fire, so we can still be in this state until release the fire button
		SetPendingFire(CurrentFireMode);
	}
	
	simulated function bool ShouldRefire()
	{
		return !bCannonballWasDetonated && StillFiring(CurrentFireMode);
	}

	simulated function DetonateCannonball ()
	{
		local KFProj_Cannonball_Blunderbuss Cannonball;

		if (Role == ROLE_Authority)
		{
			// Double check, this should be not empty:
			if (bDeployedCannonball && DeployedCannonballs.Length > 0)
			{
				Cannonball = DeployedCannonballs[DeployedCannonballs.Length - 1];
				if (Cannonball.bIsTimedExplosive)
				{
					bDeployedCannonball = false;
					Cannonball.Detonate();
					bCannonballWasDetonated = true;

					if( IsTimerActive('RefireCheckTimer') )
					{
						ClearTimer( nameof(RefireCheckTimer) );
					}
					SetTimer( GetFireInterval(0), true, nameof(RefireCheckTimer) );
				}
			}
		}
	}

	simulated function HandleFinishedFiring ()
	{
		if (Role == ROLE_Authority)
		{
			// auto switch weapon when out of ammo and after detonating the last deployed ball
			if (!HasAnyAmmo() && NumDeployedCannonballs == 0)
			{
				if (CanSwitchWeapons())
				{
					Instigator.Controller.ClientSwitchToBestWeapon(false);
				}
			}
		}

		super.HandleFinishedFiring();
	}
}

simulated function HandleProjectileImpact(byte ProjectileFireMode, ImpactInfo Impact, optional float PenetrationValue)
{
	// Blunderbuss projectile detection is handled in the server to avoid collision sync problems
	if(Instigator != None && Instigator.Role == ROLE_Authority)
	{
		ProcessInstantHitEx(ProjectileFireMode, Impact,, PenetrationValue, 0);
	}
}

function AdjustDamage(out int InDamage, class<DamageType> DamageType, Actor DamageCauser)
{
	super.AdjustDamage(InDamage, DamageType, DamageCauser);

	if (Instigator != none && DamageCauser != none && DamageCauser.Instigator == Instigator)
	{
		InDamage *= SelfDamageReductionValue;
	}
}

simulated function KFProjectile SpawnAllProjectiles(class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir)
{
	local KFPerk InstigatorPerk;

	if (CurrentFireMode == ALTFIRE_FIREMODE)
	{
		InstigatorPerk = GetPerk();
		if (InstigatorPerk != none)
		{
			Spread[CurrentFireMode] = default.Spread[CurrentFireMode] * InstigatorPerk.GetTightChokeModifier();
		}
	}

	return super.SpawnAllProjectiles(KFProjClass, RealStartLoc, AimDir);
}

defaultproperties
{
   SelfDamageReductionValue=1.000000
   bRevolver=True
   bUseDefaultResetOnReload=False
   CylinderRotInfo=(InC=120.000000,Time=0.200000)
   PackageKey="Blunderbuss"
   FirstPersonMeshName="WEP_1P_Blunderbuss_MESH.Wep_1stP_Blunderbuss_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Blunderbuss_ANIM.Wep_1stP_Blunderbuss_Anim"
   PickupMeshName="WEP_3P_Blunderbuss_MESH.Wep_3rdP_Blunderbuss_Pickup"
   AttachmentArchetypeName="WEP_Blunderbuss_ARCH.Wep_Blunderbuss_3P"
   MuzzleFlashTemplateName="WEP_Blunderbuss_ARCH.Wep_Blunderbuss_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Grenade'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
   InventoryGroup=IG_Primary
   InventorySize=7
   MagazineCapacity(0)=3
   PenetrationPower(1)=2.000000
   IronSightPosition=(X=-3.000000,Y=0.000000,Z=0.000000)
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Blunderbuss_TEX.UI_WeaponSelect_BlunderBluss'
   SpareAmmoCapacity(0)=39
   InitialSpareMags(0)=4
   bLoopingFireAnim(0)=True
   BonesToLockOnEmpty(0)="RW_Hammer"
   BonesToLockOnEmpty(1)="RW_Frizzen"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_Blunderbuss.Play_WEP_Blunderbuss_Fire_3P_01',FirstPersonCue=AkEvent'WW_WEP_Blunderbuss.Play_WEP_Blunderbuss_Fire_1P_01')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_Blunderbuss.Play_WEP_Blunderbuss_Fire_3P_01',FirstPersonCue=AkEvent'WW_WEP_Blunderbuss.Play_WEP_Blunderbuss_Fire_1P_01')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Handling_DryFire'
   PlayerViewOffset=(X=-15.000000,Y=12.000000,Z=-6.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_Blunderbuss:MeleeHelper_0'
   NumPellets(1)=10
   NumPellets(2)=()
   NumPellets(3)=()
   NumPellets(4)=()
   NumPellets(5)=()
   NumPellets(6)=()
   maxRecoilPitch=900
   minRecoilPitch=775
   maxRecoilYaw=500
   minRecoilYaw=-500
   RecoilRate=0.085000
   RecoilBlendOutRatio=1.100000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMinPitchLimit=64785
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Demolitionist'
   AssociatedPerkClasses(1)=Class'KFGame.KFPerk_Support'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Stat=EWUS_Damage1,Scale=1.150000),(Add=1)))
   FiringStatesArray(0)="BlunderbussDeployAndDetonate"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Cannonball_Blunderbuss'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Nail_Blunderbuss'
   FireInterval(0)=0.750000
   FireInterval(1)=0.690000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   Spread(1)=0.250000
   InstantHitDamage(0)=300.000000
   InstantHitDamage(1)=45.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_BlunderbussImpact'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_BlunderbussShards'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Blunderbuss'
   FireOffset=(X=39.000000,Y=5.000000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_PistolBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master_Revolver'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_PistolBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Blunderbuss"
   bDropOnDeath=False
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_Blunderbuss"
   ObjectArchetype=KFWeap_PistolBase'KFGame.Default__KFWeap_PistolBase'
}
