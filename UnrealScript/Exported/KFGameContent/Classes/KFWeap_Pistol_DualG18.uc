//=============================================================================
// KFWeap_Pistol_DualG18
//=============================================================================
// An Glock 18 Pistol Dual
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Fernando Ferrando @ Saber Interactive
//=============================================================================

/* 
	TODO LIST [LOOK FOR TAG (WHATS BEFORE THE : IN THE INDICATED FILE)] OK = DONE || XX = NOT DONE
		BASE DAMAGE 
		OK	DEFAULT MODE DAMAGE : KFWeap_Pistol_SingleG18.uc 
		OK	BASH MODE DAMAGE : KFWeap_Pistol_SingleG18.uc 

		DAMAGE TYPES
		OK	DEFAULT MODE TYPE DAMAGE : KFWeap_Pistol_SingleG18.uc 
		OK	BASH MODE TYPE DAMAGE : KFWeap_Pistol_SingleG18.uc 

		FIRE RATE
		OK	Single Default Firemode (Automatic) firerate :  KFWeap_Pistol_SingleG18.uc

		RANGE
		OK	Default Firemode (Automatic) range : KFWeapDef_Pistol_SingleG18.uc 

		PENETRATION
		OK	Default Firemode (Automatic) penetration : KFWeap_Pistol_SingleG18.uc

		DUAL-WIELDABLE
		OK	Dual-wieldable yes : KFWeap_Pistol_SingleG18.uc

		MAGAZINE SIZE
		OK	Magazine ammount : KFWeap_Pistol_SingleG18.uc

		SPARE AMMO CAPACITY
		OK	spare ammo Ammount : KFWeap_Pistol_SingleG18.uc

		STARTING SPARE MAGAZINES
		OK	starting spare magazines Ammount :  KFWeap_Pistol_SingleG18.uc

		AMMO BOX PICKUP SCALE
		XX	Ammount:
		
		RELOAD SPEED
	
		XX	[Single Standard]
				Full Reload
					Full Length Animation - ??? seconds
					Interrupt - ??? seconds

				Half Reload
					Full Length Animation - ??? seconds
					Interrupt - ??? seconds

		XX	[Single Elite]
				Full Reload
					Full Length Animation - ??? seconds
					Interrupt - ??? seconds

				Half Reload
					Full Length Animation - ??? seconds
					Interrupt - ??? seconds

		WEIGHT

		OK	Weight Ammount :  KFWeap_Pistol_SingleG18.uc

		WEAPON TRADER PRICE
		OK	Weapon Price : KFWeapDef_Pistol_SingleG18.uc

		AMMO TRADER PRICE
		OK	Ammo Price :  KFWeapDef_Pistol_SingleG18.uc

		WEAPON TIER
		XX	Tier : 

		FIRE MODE DEFAULT
		OK	FireMode Automatic : KFWeap_Pistol_SingleG18.uc

		AFFLICTIONS
		OK	afflictions Default Firemode (Automatic) : KFDT_Ballistic_SingleG18.uc
		OK	afflictions Bash Firemode : KFDT_Ballistic_SingleG18.uc

		PERKS
		OK	Main Perk : KFWeap_Pistol_SingleG18.uc

		WEAPON UPGRADE
		XX	Upgrades:


 */

class KFWeap_Pistol_DualG18 extends KFWeap_DualBase;

simulated state WeaponFiring
{
	simulated function BeginState(Name PrevStateName)
	{
		local KFPerk InstigatorPerk;

		InstigatorPerk = GetPerk();
		if( InstigatorPerk != none )
		{
			SetZedTimeResist( InstigatorPerk.GetZedTimeModifier(self) );
		}
		if (  bLoopingFireSnd.Length > 0 )
		{
			StartLoopingFireSound(CurrentFireMode);
		}

		super.BeginState(PrevStateName);
	}

	simulated function FireAmmunition()
    {
    	bFireFromRightWeapon = !bFireFromRightWeapon;
        Super.FireAmmunition();
	}

	simulated function EndState(Name NextStateName)
	{
		super.EndState(NextStateName);

		ClearZedTimeResist();

		// Simulate weapon firing effects on the local client
		if( WorldInfo.NetMode == NM_Client )
		{
			Instigator.WeaponStoppedFiring(self, false);
		}

		if ( bPlayingLoopingFireSnd )
		{
			StopLoopingFireSound(CurrentFireMode);
		}
	}
}

defaultproperties
{
   LeftFireOffset=(X=17.000000,Y=-4.000000,Z=-2.250000)
   SingleClass=Class'kfgamecontent.KFWeap_Pistol_G18C'
   PackageKey="Dual_G18C"
   FirstPersonMeshName="WEP_1P_Dual_G18C_MESH.Wep_1stP_Dual_G18C_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Dual_G18C_ANIM.WEP_1st_Dual_G18C_ANIM"
   PickupMeshName="wep_3p_dual_g18c_mesh.Wep_3rdP_Dual_G18C_Pickup"
   AttachmentArchetypeName="WEP_Dual_G18C_ARCH.Wep_Dual_g18c_3P"
   MuzzleFlashTemplateName="WEP_Dual_G18C_ARCH.Wep_Dual_G18C_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   SingleFireSoundIndex=2
   InventorySize=8
   MagazineCapacity(0)=66
   PenetrationPower(2)=0.000000
   PenetrationPower(3)=0.000000
   PenetrationDamageReductionCurve(3)=(Points=(,(InVal=1.000000,OutVal=1.000000)))
   MeshFOV=96.000000
   MeshIronSightFOV=77.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=-3.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Dual_G18C_TEX.UI_WeaponSelect_Dual_G18C'
   SpareAmmoCapacity(0)=462
   InitialSpareMags(0)=2
   bLoopingFireAnim(0)=False
   bLoopingFireAnim(1)=False
   bLoopingFireSnd(0)=True
   bLoopingFireSnd(1)=True
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Auto_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Auto_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Auto_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Auto_Loop')
   WeaponFireSnd(2)=(DefaultCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Fire_1P_Single')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Fire_1P_EndLoop')
   WeaponFireLoopEndSnd(1)=(DefaultCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Fire_1P_EndLoop')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
   PlayerViewOffset=(X=-15.000000,Y=0.000000,Z=0.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_DualG18:MeleeHelper_0'
   maxRecoilPitch=220
   minRecoilPitch=165
   maxRecoilYaw=85
   minRecoilYaw=-85
   RecoilRate=0.045000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=100
   RecoilISMinYawLimit=65435
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   JoggingRecoilModifier=1.200000
   WalkingRecoilModifier=1.100000
   IronSightMeshFOVCompensationScale=1.650000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Gunslinger'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.250000),(Stat=EWUS_Damage1,Scale=1.250000),(Add=2)))
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_G18c'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_G18c'
   FireInterval(0)=0.050000
   FireInterval(1)=0.050000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.060000
   Spread(1)=0.060000
   InstantHitDamage(0)=39.000000
   InstantHitDamage(1)=39.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=25.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_G18C'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_G18C'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_G18C'
   FireOffset=(X=17.000000,Y=4.000000,Z=-2.250000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_DualBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_DualBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Dual Glock 18c"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_DualG18"
   ObjectArchetype=KFWeap_DualBase'KFGame.Default__KFWeap_DualBase'
}
