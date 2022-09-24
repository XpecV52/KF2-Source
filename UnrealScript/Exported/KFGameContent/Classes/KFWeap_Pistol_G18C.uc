//=============================================================================
// KFWeap_Pistol_G18C
//=============================================================================
// An Glock 18 Pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Fernando Ferrando @ Saber Interactive
//=============================================================================

/* 
	TODO LIST [LOOK FOR TAG (WHATS BEFORE THE : IN THE INDICATED FILE)] OK = DONE || XX = NOT DONE
		BASE DAMAGE 
		OK	DEFAULT & ALT MODE DAMAGE DAMAGE : KFWeap_Pistol_G18C.uc 
		OK	BASH MODE DAMAGE : KFWeap_Pistol_G18C.uc 

		DAMAGE TYPES
		OK	DEFAULT & ALT MODE TYPE DAMAGE : KFWeap_Pistol_G18C.uc 
		OK	BASH MODE TYPE DAMAGE : KFWeap_Pistol_G18C.uc 

		FIRE RATE
		OK	Single Default Firemode (Automatic) firerate :  KFWeap_Pistol_G18C.uc
		OK	Single Altfire Firemode (Single Fire) firerate :  KFWeap_Pistol_G18C.uc

		RANGE
		OK	Default Firemode (Automatic) & Altfire Firemode (Single Fire) range : KFWeapDef_Pistol_G18C.uc 

		PENETRATION
		OK	Default Firemode (Automatic) & Altfire Firemode (Single Fire) penetration : KFWeap_Pistol_G18C.uc

		DUAL-WIELDABLE
		OK	Dual-wieldable yes : KFWeap_Pistol_G18C.uc

		MAGAZINE SIZE
		OK	Magazine ammount : KFWeap_Pistol_G18C.uc

		SPARE AMMO CAPACITY
		OK	spare ammo Ammount : KFWeap_Pistol_G18C.uc

		STARTING SPARE MAGAZINES
		OK	starting spare magazines Ammount :  KFWeap_Pistol_G18C.uc

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

		OK	Weight Ammount :  KFWeap_Pistol_G18C.uc

		WEAPON TRADER PRICE
		OK	Weapon Price : KFWeapDef_Pistol_G18C.uc

		AMMO TRADER PRICE
		OK	Ammo Price :  KFWeapDef_Pistol_G18C.uc

		WEAPON TIER
		XX	Tier : 

		FIRE MODE DEFAULT
		OK	FireMode Automatic : KFWeap_Pistol_G18C.uc

		FIRE MODE ALT
		OK	FireMode Single : KFWeap_Pistol_G18C.uc


		AFFLICTIONS
		OK	afflictions Default Firemode (Automatic)  & Altfire Firemode (Single Fire) : KFDT_Ballistic_G18C.uc
		OK	afflictions Bash Firemode : KFDT_Ballistic_G18C.uc

		PERKS
		OK	Main Perk : KFWeap_Pistol_G18C.uc

		WEAPON UPGRADE
		XX	Upgrades:

		ADD TO CHEATMANAGER (https://www.notion.so/C-mo-a-adir-un-Weapon-be997fefdede49858315a4e48e15a8ab)
		XX	Added to cheat :
		
		ADD TO SKINS
		XX Added to Skins :

		ADD TO DAILY EVENTS
		XX Added to daily events : 

 */

class KFWeap_Pistol_G18C extends KFWeap_PistolBase;

defaultproperties
{
   PackageKey="G18C"
   FirstPersonMeshName="WEP_1P_G18C_MESH.Wep_1stP_G18C_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_G18C_ANIM.WEP_1st_G18C_Anim"
   PickupMeshName="WEP_3P_G18C_MESH.Wep_G18C_Pickup"
   AttachmentArchetypeName="WEP_G18C_ARCH.Wep_G18C_3P"
   MuzzleFlashTemplateName="WEP_G18C_ARCH.Wep_G18C_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
   SingleFireSoundIndex=1
   InventorySize=4
   PenetrationPower(2)=0.000000
   PenetrationPower(3)=0.000000
   PenetrationDamageReductionCurve(3)=(Points=(,(InVal=1.000000,OutVal=1.000000)))
   MeshFOV=96.000000
   MeshIronSightFOV=55.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=0.000000,Y=-0.120000,Z=-0.100000)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'wep_ui_g18c_tex.UI_WeaponSelect_G18C'
   DualClass=Class'kfgamecontent.KFWeap_Pistol_DualG18'
   MagazineCapacity(0)=33
   SpareAmmoCapacity(0)=462
   InitialSpareMags(0)=4
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Auto_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Auto_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Fire_1P_Single')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Fire_1P_EndLoop')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'
   PlayerViewOffset=(X=-15.000000,Y=12.000000,Z=-6.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_G18C:MeleeHelper_0'
   maxRecoilPitch=300
   minRecoilPitch=225
   maxRecoilYaw=85
   minRecoilYaw=-85
   RecoilRate=0.045000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=100
   RecoilISMinYawLimit=65435
   RecoilISMaxPitchLimit=37
   RecoilISMinPitchLimit=65460
   JoggingRecoilModifier=1.200000
   WalkingRecoilModifier=1.100000
   IronSightMeshFOVCompensationScale=1.650000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Gunslinger'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.125000),(Stat=EWUS_Damage1,Scale=1.125000),(Add=1)))
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_G18c'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_G18c'
   FireInterval(0)=0.075000
   FireInterval(1)=0.175000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.060000
   Spread(1)=0.015000
   InstantHitDamage(0)=37.000000
   InstantHitDamage(1)=37.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=25.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_G18C'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_G18C'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_G18C'
   FireOffset=(X=85.000000,Y=12.000000,Z=-7.000000)
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
   ItemName="Glock 18c"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_G18C"
   ObjectArchetype=KFWeap_PistolBase'KFGame.Default__KFWeap_PistolBase'
}
