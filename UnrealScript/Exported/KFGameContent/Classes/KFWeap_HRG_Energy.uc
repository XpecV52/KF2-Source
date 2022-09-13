//=============================================================================
// KFWeap_HRG_Energy
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFWeap_HRG_Energy extends KFWeap_PistolBase;





/*********************************************************************************************
 @name Optics UI
********************************************************************************************* */
var class<KFGFxWorld_MedicOptics> OpticsUIClass;
var KFGFxWorld_MedicOptics OpticsUI;

/** The last updated value for our ammo - Used to know when to update our optics ammo */
var byte StoredPrimaryAmmo;
var byte StoredSecondaryAmmo;

var transient float AltFireMaxShots;

/** Modifier applied to the alt fire animation */
var float SecondaryFireAnimRateModifier;

/** Material colors applied to different fire modes */
var LinearColor DefaultFireMaterialColor;
var LinearColor AltFireMaterialColor;

/** How much recoil the altfire should do */
var protected const float AltFireRecoilScale;

simulated event PreBeginPlay()
{
	super.PreBeginPlay();
	AltFireMaxShots = MagazineCapacity[DEFAULT_FIREMODE] / AmmoCost[ALTFIRE_FIREMODE];
}

simulated function Activate()
{
	super.Activate();
	UpdateMaterial(bUseAltFireMode ? ALTFIRE_FIREMODE : DEFAULT_FIREMODE);
}

simulated function UpdateMaterial(byte FireMode)
{
	local LinearColor MatColor;
	MatColor = FireMode == DEFAULT_FIREMODE ? DefaultFireMaterialColor : AltFireMaterialColor;

	if( WeaponMICs.Length > 0)
	{
		WeaponMICs[0].SetVectorParameterValue('Vector_GlowColor', MatColor);
	}

	if (WeaponMICs.Length > 1)
	{
		WeaponMICs[1].SetVectorParameterValue('Color_override', MatColor);
	}

	if( WeaponMICs.Length > 2)
	{
		WeaponMICs[2].SetVectorParameterValue('Vector_GlowColor', MatColor);
	}
}

/**
  * Check target locking - server-side only
  * HealAmmo Regen client and server
  */
simulated event Tick( FLOAT DeltaTime )
{
	if (Instigator != none && Instigator.weapon == self)
	{
		UpdateOpticsUI();
	}

	Super.Tick(DeltaTime);
}

/*********************************************************************************************
 @name Optics UI
********************************************************************************************* */

/** Get our optics movie from the inventory once our InvManager is created */
reliable client function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
	local KFInventoryManager KFIM;

	super.ClientWeaponSet(bOptionalSet, bDoNotActivate);

	if (OpticsUI == none)
	{
		KFIM = KFInventoryManager(InvManager);
		if (KFIM != none)
		{
			//Create the screen's UI piece
			OpticsUI = KFGFxWorld_MedicOptics(KFIM.GetOpticsUIMovie(OpticsUIClass));
		}
	}
}

function ItemRemovedFromInvManager()
{
	local KFInventoryManager KFIM;
	local KFWeap_MedicBase KFW;

	Super.ItemRemovedFromInvManager();

	if (OpticsUI != none)
	{
		KFIM = KFInventoryManager(InvManager);
		if (KFIM != none)
		{
			// @todo future implementation will have optics in base weapon class
			foreach KFIM.InventoryActors(class'KFWeap_MedicBase', KFW)
			{
				// This is not a MedicBase, no need to check against itself
				if(KFW.OpticsUI.Class == OpticsUI.class)
				{
					// A different weapon is still using this optics class
					return;
				}
			}

			//Create the screen's UI piece
			KFIM.RemoveOpticsUIMovie(OpticsUI.class);

			OpticsUI.Close();
			OpticsUI = none;
		}
	}
}

/** Unpause our optics movie and reinitialize our ammo when we equip the weapon */
simulated function AttachWeaponTo(SkeletalMeshComponent MeshCpnt, optional Name SocketName)
{
	super.AttachWeaponTo(MeshCpnt, SocketName);

	if (OpticsUI != none)
	{
		OpticsUI.SetPause(false);
		OpticsUI.ClearLockOn();
		UpdateOpticsUI(true);
		OpticsUI.SetShotPercentCost( AmmoCost[ALTFIRE_FIREMODE]);
	}
}

/** Pause the optics movie once we unequip the weapon so it's not playing in the background */
simulated function DetachWeapon()
{
	local Pawn OwnerPawn;
	super.DetachWeapon();

	OwnerPawn = Pawn(Owner);
	if( OwnerPawn != none && OwnerPawn.Weapon == self )
	{
		if (OpticsUI != none)
		{
			OpticsUI.SetPause();
		}
	}
}

/**
 * Update our displayed ammo count if it's changed
 */
simulated function UpdateOpticsUI(optional bool bForceUpdate)
{
	if (OpticsUI != none && OpticsUI.OpticsContainer != none)
	{
		if (AmmoCount[DEFAULT_FIREMODE] != StoredPrimaryAmmo || bForceUpdate)
		{
			StoredPrimaryAmmo = AmmoCount[DEFAULT_FIREMODE];
			OpticsUI.SetPrimaryAmmo(StoredPrimaryAmmo);

			if(AmmoCount[DEFAULT_FIREMODE] < AmmoCost[ALTFIRE_FIREMODE])
			{
				OpticsUI.SetHealerCharge(0);
			}
			else
			{
				OpticsUI.SetHealerCharge((AmmoCount[DEFAULT_FIREMODE] / AmmoCost[ALTFIRE_FIREMODE]) / AltFireMaxShots * 100);
			}
		}

		if(OpticsUI.MinPercentPerShot != AmmoCost[ALTFIRE_FIREMODE])
		{
			OpticsUI.SetShotPercentCost( AmmoCost[ALTFIRE_FIREMODE] );
		}
	}
}

/** Healing charge doesn't count as ammo for purposes of inventory management (e.g. switching) */
simulated function bool HasAnyAmmo()
{
	return HasSpareAmmo() || HasAmmo(DEFAULT_FIREMODE) || HasSpareAmmo(ALTFIRE_FIREMODE) || HasAmmo(ALTFIRE_FIREMODE);
}

simulated function StartFire(byte FireModeNum)
{
	if (FireModeNum == DEFAULT_FIREMODE && bUseAltFireMode)
	{
		if (AmmoCount[FireModeNum] < AmmoCost[ALTFIRE_FIREMODE] && SpareAmmoCount[FireModeNum] > 0)
		{
			BeginFire(RELOAD_FIREMODE);
			return;
		}
	}

	super.StartFire(FireModeNum);
}

simulated function AltFireMode()
{
	if ( !Instigator.IsLocallyControlled()  )
	{
		return;
	}

	if ( !bUseAltFireMode && SpareAmmoCount[0] + AmmoCount[0] < AmmoCost[1] )
	{
		return;
	}

	super.AltFireMode();
	UpdateMaterial(bUseAltFireMode ? ALTFIRE_FIREMODE : DEFAULT_FIREMODE);

	NotifyAltFireUsage();
}

/** Overriden to use WeaponAnimSeqNode */
simulated function PlayWeaponAnimation(name Sequence, float fDesiredDuration, optional bool bLoop, optional SkeletalMeshComponent SkelMesh)
{
	local float DesiredRate;

	if ( Mesh != none && Instigator != none && WorldInfo.NetMode != NM_DedicatedServer )
	{
		if ( WeaponAnimSeqNode != None )
		{
			if (WeaponAnimSeqNode.AnimSeq == None || WeaponAnimSeqNode.AnimSeq.SequenceName != Sequence)
			{
				WeaponAnimSeqNode.SetAnim(Sequence);
			}

			if(fDesiredDuration > 0.0 && WeaponAnimSeqNode.AnimSeq.RateScale > 0.0)
			{
				DesiredRate = WeaponAnimSeqNode.AnimSeq.SequenceLength / (fDesiredDuration * WeaponAnimSeqNode.AnimSeq.RateScale);
				WeaponAnimSeqNode.PlayAnim(bLoop, DesiredRate);
			}
			else
			{
				WeaponAnimSeqNode.PlayAnim(bLoop, DefaultAnimSpeed);
			}
		}
	}
}

/**
 * PlayFireEffects Is the root function that handles all of the effects associated with
 * a weapon.  This function creates the 1st person effects.  It should only be called
 * on a locally controlled player.
 */
simulated function PlayFireEffects( byte FireModeNum, optional vector HitLocation )
{
	local name WeaponFireAnimName;
	local KFPerk CurrentPerk;
	local float TempTweenTime, AdjustedAnimLength;
	
	// If we have stopped the looping fire sound to play single fire sounds for zed time
	// start the looping sound back up again when the time is back above zed time speed
	if( FireModeNum < bLoopingFireSnd.Length && bLoopingFireSnd[FireModeNum] && !bPlayingLoopingFireSnd )
    {
        StartLoopingFireSound(FireModeNum);
    }

	PlayFiringSound(CurrentFireMode);

	if( Instigator != none )
	{
		// Tell our pawn about any changes in animation speed
		UpdateWeaponAttachmentAnimRate( GetThirdPersonAnimRate() );

		if( Instigator.IsLocallyControlled() )
		{
			if( Instigator.IsFirstPerson() )
			{
				if ( !bPlayingLoopingFireAnim )
				{
					WeaponFireAnimName = GetWeaponFireAnim(FireModeNum);

					if ( WeaponFireAnimName != '' )
					{
						AdjustedAnimLength = MySkelMesh.GetAnimLength(WeaponFireAnimName);
						TempTweenTime = FireTweenTime;

						if (FireModeNum == ALTFIRE_FIREMODE)
						{
							AdjustedAnimLength *= SecondaryFireAnimRateModifier;
						}

						CurrentPerk = GetPerk();
						if( CurrentPerk != none )
						{
							CurrentPerk.ModifyRateOfFire( AdjustedAnimLength, self );

							// We need to unlock the slide if we fire from zero ammo while uber ammo is active
							if( EmptyMagBlendNode != none
								&& BonesToLockOnEmpty.Length > 0
								&& AmmoCount[GetAmmoType(FireModeNum)] == 0
								&& CurrentPerk.GetIsUberAmmoActive(self) )
							{
								EmptyMagBlendNode.SetBlendTarget( 0, 0 );
								TempTweenTime = 0.f;
							}
						}

						PlayAnimation(WeaponFireAnimName, AdjustedAnimLength,, TempTweenTime);
					}
				}

				// Start muzzle flash effect
				CauseMuzzleFlash(FireModeNum);
			}

			HandleRecoil();
			ShakeView();

			if (AmmoCount[0] == 0 && ForceReloadTimeOnEmpty > 0)
			{
				SetTimer(ForceReloadTimeOnEmpty, false, nameof(ForceReload));
			}
		}
	}
}

simulated function ModifyRecoil( out float CurrentRecoilModifier )
{
	if( CurrentFireMode == ALTFIRE_FIREMODE )
	{
		CurrentRecoilModifier *= AltFireRecoilScale;
	}

	super.ModifyRecoil( CurrentRecoilModifier );
}

simulated function NotifyAltFireUsage()
{
	local KFPawn_Human KFPH;

	// Notify 3P to change material.
	KFPH = KFPawn_Human(Instigator);
	if (KFPH != none)
	{
		KFPH.SetUsingAltFireMode(bUseAltFireMode, true);
		KFPH.bNetDirty = true;
	}
}

simulated state WeaponEquipping
{
	simulated function BeginState(Name PreviousStateName)
	{
		super.BeginState(PreviousStateName);
	//	 NotifyAltFireUsage();
		if (WorldInfo.NetMode == NM_Client || WorldInfo.NetMode == NM_Standalone)
		{
			SetTimer(1.0f, false, nameof(NotifyAltFireUsage));
		}
	}
}

/** Returns animation to play based on reload type and status */
simulated function name GetReloadAnimName( bool bTacticalReload )
{
	return bTacticalReload ? ReloadNonEmptyMagEliteAnim : ReloadNonEmptyMagAnim;
}

simulated function ConsumeAmmo( byte FireModeNum )
{
	super.ConsumeAmmo(FireModeNum);

	if( bUseAltFireMode && SpareAmmoCount[0] + AmmoCount[0] < AmmoCost[1] )
	{
		bUseAltFireMode = false;
		UpdateMaterial(DEFAULT_FIREMODE);
		NotifyAltFireUsage();
	}
}

defaultproperties
{
   OpticsUIClass=Class'KFGame.KFGFxWorld_MedicOptics'
   SecondaryFireAnimRateModifier=2.000000
   DefaultFireMaterialColor=(R=0.900000,G=0.260000,B=0.000000,A=1.000000)
   AltFireMaterialColor=(R=0.700000,G=0.040000,B=0.900000,A=1.000000)
   AltFireRecoilScale=2.000000
   PackageKey="HRG_Energy"
   FirstPersonMeshName="WEP_1P_HRG_Energy_MESH.Wep_1stP_HRG_Energy_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_HRG_Energy_ANIM.WEP_1P_HRG_Energy_ANIM"
   PickupMeshName="wep_3p_HRG_Energy_mesh.Wep_HRG_Energy_Pickup"
   AttachmentArchetypeName="WEP_HRG_Energy_ARCH.Wep_HRG_Energy_3P"
   MuzzleFlashTemplateName="WEP_HRG_Energy_ARCH.Wep_HRG_Energy_MuzzleFlash"
   bHasIronSights=True
   bCanRefillSecondaryAmmo=False
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Electricity'
   InventorySize=4
   PenetrationPower(0)=1.000000
   PenetrationPower(1)=3.000000
   MeshIronSightFOV=77.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=15.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=125.000000
   WeaponSelectTexture=Texture2D'WEP_UI_HRG_Energy_TEX.UI_WeaponSelect_HRG_Energy'
   SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
   MagazineCapacity(0)=15
   AmmoCost(1)=3
   SpareAmmoCapacity(0)=135
   InitialSpareMags(0)=2
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'ww_wep_hrg_energy.Play_WEP_HRG_Energy_3P_Shoot',FirstPersonCue=AkEvent'ww_wep_hrg_energy.Play_WEP_HRG_Energy_1P_Shoot')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'ww_wep_hrg_energy.Play_WEP_HRG_Energy_3P_ShootAlt',FirstPersonCue=AkEvent'ww_wep_hrg_energy.Play_WEP_HRG_Energy_1P_ShootAlt')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_MedicPistol.Play_SA_MedicPistol_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'
   PlayerViewOffset=(X=29.000000,Y=13.000000,Z=-4.000000)
   NumBloodMapMaterials=3
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_HRG_Energy:MeleeHelper_0'
   maxRecoilPitch=475
   minRecoilPitch=425
   maxRecoilYaw=130
   minRecoilYaw=-130
   RecoilRate=0.070000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=250
   RecoilISMinPitchLimit=65485
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Gunslinger'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Stat=EWUS_Damage1,Scale=1.150000),(Add=1)))
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)=()
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_HRG_Energy'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_HRG_Energy_Secondary'
   FireInterval(0)=0.175000
   FireInterval(1)=0.705000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   InstantHitDamage(0)=90.000000
   InstantHitDamage(1)=300.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HRG_Energy_Primary'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_HRG_Energy_Secondary'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HRG_Energy'
   FireOffset=(X=20.000000,Y=4.000000,Z=-3.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_PistolBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
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
   ItemName="HRG Disrupter"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_HRG_Energy"
   ObjectArchetype=KFWeap_PistolBase'KFGame.Default__KFWeap_PistolBase'
}
