//=============================================================================
// KFWeap_Healer_Syringe
//=============================================================================
// Weapon class used for the healer
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFWeap_Healer_Syringe extends KFWeap_HealerBase;

/**
 * Initializes ammo counts, when weapon is spawned.
 * Overwriting to stop perks changing the magazine size
 * Probably have to add functionality when we add the medic perk
 */
function InitializeAmmo()
{
	// Set ammo amounts based on perk.  MagazineCapacity must be replicated, but
	// only the server needs to know the InitialSpareMags value
	MagazineCapacity[0] = default.MagazineCapacity[0];
	InitialSpareMags[0] = default.InitialSpareMags[0];

	AmmoCount[0] = MagazineCapacity[0];
	AddAmmo(InitialSpareMags[0] * MagazineCapacity[0]);
}

defaultproperties
{
   PackageKey="Healer"
   FirstPersonMeshName="WEP_1P_Healer_MESH.Wep_1stP_Healer_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Healer_ANIM.Wep_1st_Healer_Anim"
   AttachmentArchetypeName="WEP_Healer_ARCH.Wep_Healer_3P"
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_MedicDart'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_MedicDart'
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Healer'
   PlayerViewOffset=(X=20.000000,Y=10.000000,Z=-8.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_HealerBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_HealerBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Healer_Syringe:MeleeHelper_0'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Healer'
   bCanThrow=False
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_HealerBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      Begin Object Class=AnimTree Name=WEP_1stP_Animtree_Healer
         Begin Object Class=KFSkelControl_WeaponTilt Name=KFSkelControl_WeaponTilt_0
            WeaponBoneRotation=(Pitch=0,Yaw=0,Roll=1183)
            BoneRotation=(Pitch=0,Yaw=0,Roll=1183)
            BlendInTime=0.150000
            BlendOutTime=0.150000
            DrawWidth=231
            NodePosX=254
            NodePosY=100
            Name="KFSkelControl_WeaponTilt_0"
            ObjectArchetype=KFSkelControl_WeaponTilt'KFGame.Default__KFSkelControl_WeaponTilt'
         End Object
         Begin Object Class=KFSkelControl_AmmoSlider Name=KFSkelControl_AmmoSlider_0
            MaxBoneTranslation=(X=0.000000,Y=0.000000,Z=-3.000000)
            BoneTranslation=(X=0.000000,Y=0.000000,Z=-3.000000)
            ControlStrength=0.000000
            StrengthTarget=0.000000
            DrawWidth=232
            NodePosX=255
            NodePosY=197
            Name="KFSkelControl_AmmoSlider_0"
            ObjectArchetype=KFSkelControl_AmmoSlider'KFGame.Default__KFSkelControl_AmmoSlider'
         End Object
         Begin Object Class=KFAnimSeq_Tween Name=KFAnimSeq_Tween_0
            TickArrayIndex=1
            NodeTotalWeight=1.000000
            ParentNodes(0)=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Healer'
            DrawWidth=64
            DrawHeight=47
            NodePosX=258
            NodePosY=-19
            OutDrawY=15
            Name="KFAnimSeq_Tween_0"
            ObjectArchetype=KFAnimSeq_Tween'KFGame.Default__KFAnimSeq_Tween'
         End Object
         bParentNodeArrayBuilt=True
         SkelControlLists(0)=(BoneName="Soldier_Spine3",ControlHead=KFSkelControl_WeaponTilt'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Healer:KFSkelControl_WeaponTilt_0',DrawY=82)
         SkelControlLists(1)=(BoneName="Anim_Liquid_Rot",DrawY=104)
         SkelControlLists(2)=(BoneName="RW_Liquid_Translate",ControlHead=KFSkelControl_AmmoSlider'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Healer:KFSkelControl_AmmoSlider_0',DrawY=126)
         MorphConnDrawY=60
         PreviewMeshList(0)=(PreviewSkelMesh=SkeletalMesh'WEP_1P_Healer_MESH.Wep_1stP_Healer_Rig')
         PreviewCamPos=(X=-10.338246,Y=-202.515625,Z=156.257996)
         PreviewCamRot=(Pitch=-6848,Yaw=15852,Roll=0)
         AnimTickArray(0)=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Healer'
         AnimTickArray(1)=KFAnimSeq_Tween'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Healer:KFAnimSeq_Tween_0'
         Children(0)=(Anim=KFAnimSeq_Tween'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Healer:KFAnimSeq_Tween_0',DrawY=38)
         NodeTotalWeight=1.000000
         DrawWidth=150
         Name="WEP_1stP_Animtree_Healer"
         ObjectArchetype=AnimTree'Engine.Default__AnimTree'
      End Object
      Animations=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Healer'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_HealerBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Medical Syringe"
   bDropOnDeath=False
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_HealerBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_HealerBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Healer_Syringe"
   ObjectArchetype=KFWeap_HealerBase'KFGame.Default__KFWeap_HealerBase'
}
