//=============================================================================
// KFWeap_Blunt_MaceAndShield
//=============================================================================
// A melee club and shield for heavy blunt damage
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFWeap_Blunt_MaceAndShield extends KFWeap_MeleeBase;

var const float MaxMaceHitRange, MaxShieldHitRange;
var const array<MeleeHitBoxInfo> MaceHitboxChain, ShieldHitboxChain;
var const class<KFDamageType> MaceLightDamageType, ShieldLightDamageType;
var const class<KFDamageType> MaceHeavyDamageType, ShieldHeavyDamageType;

simulated function SwapToMaceMeleeSettings()
{
	MeleeAttackHelper.SetMeleeRange( MaxMaceHitRange );
	MeleeAttackHelper.SetHitBoxChain( MaceHitboxChain );
}

simulated function SwapToShieldMeleeSettings()
{
	MeleeAttackHelper.SetMeleeRange( MaxShieldHitRange );
	MeleeAttackHelper.SetHitBoxChain( ShieldHitboxChain );
}

/*********************************************************************************************
 * State MeleeAttackBasic
 * This is a basic melee state that's used as a base for other more advanced states
 *********************************************************************************************/

/**
 * state MeleeAttackBasic
 * State the weapon is in when doing a melee attack
 */
simulated state MeleeAttackBasic
{
	simulated function BeginState(Name PrevStateName)
	{
		if( CurrentFireMode == BASH_FIREMODE )
		{
			SwapToShieldMeleeSettings();
		}
		super.BeginState( PrevStateName );
	}
}

/*********************************************************************************************
 * State MeleeChainAttacking
 * A melee firemode that chains together a sequence of attacks
 *********************************************************************************************/

simulated state MeleeChainAttacking
{
	/** Get name of the animation to play for PlayFireEffects */
	simulated function name GetMeleeAnimName(EPawnOctant AtkDir, EMeleeAttackType AtkType)
	{
		if( AtkType == ATK_Combo )
		{
			if( AtkDir == DIR_Right )
			{
				SwapToShieldMeleeSettings();
				InstantHitDamageTypes[DEFAULT_FIREMODE] = ShieldLightDamageType;
			}
			else
			{
				SwapToMaceMeleeSettings();
				InstantHitDamageTypes[DEFAULT_FIREMODE] = MaceLightDamageType;
			}
		}
		else
		{
			SwapToMaceMeleeSettings();
			InstantHitDamageTypes[DEFAULT_FIREMODE] = MaceLightDamageType;
		}

		return super.GetMeleeAnimName( AtkDir, AtkType );
	}
}

/*********************************************************************************************
 * State MeleeHeavyAttacking
 * This is the alt-fire Melee State.
 *********************************************************************************************/

simulated state MeleeHeavyAttacking
{
	/** heavy damage attack anims */
	simulated function name GetMeleeAnimName(EPawnOctant AtkDir, EMeleeAttackType AtkType)
	{
		// heavy damage attacks
		if( AtkType == ATK_DrawStrike )
		{
			SwapToMaceMeleeSettings();
			InstantHitDamageTypes[HEAVY_ATK_FIREMODE] = MaceHeavyDamageType;
			return MeleeDrawStrikeAnim;
		}

		// Since mace and shield are mixed in heavy attacks, we swap properties depending on which one is used
		if( AtkDir == DIR_Left || AtkDir == DIR_ForwardLeft || AtkDir == DIR_Forward )
		{
			SwapToMaceMeleeSettings();
			InstantHitDamageTypes[HEAVY_ATK_FIREMODE] = MaceHeavyDamageType;
		}
		else
		{
			SwapToShieldMeleeSettings();
			InstantHitDamageTypes[HEAVY_ATK_FIREMODE] = ShieldHeavyDamageType;
		}

		switch (AtkDir)
		{
			case DIR_Forward:		return MeleeHeavyAttackAnim_F;
			case DIR_ForwardLeft:	return MeleeHeavyAttackAnim_F;
			case DIR_ForwardRight:	return MeleeHeavyAttackAnim_F;
			case DIR_Backward:		return MeleeHeavyAttackAnim_B;
			case DIR_BackwardLeft:	return MeleeHeavyAttackAnim_B;
			case DIR_BackwardRight: return MeleeHeavyAttackAnim_B;
			case DIR_Left:			return MeleeHeavyAttackAnim_L;
			case DIR_Right:			return MeleeHeavyAttackAnim_R;
		}
	}
}

defaultproperties
{
   MaxMaceHitRange=185.000000
   MaxShieldHitRange=170.000000
   MaceHitboxChain(0)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=165.000000))
   MaceHitboxChain(1)=(BoneOffset=(X=0.000000,Y=3.000000,Z=150.000000))
   MaceHitboxChain(2)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=130.000000))
   MaceHitboxChain(3)=(BoneOffset=(X=0.000000,Y=3.000000,Z=110.000000))
   MaceHitboxChain(4)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=90.000000))
   MaceHitboxChain(5)=(BoneOffset=(X=0.000000,Y=3.000000,Z=70.000000))
   MaceHitboxChain(6)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=50.000000))
   MaceHitboxChain(7)=(BoneOffset=(X=0.000000,Y=3.000000,Z=30.000000))
   MaceHitboxChain(8)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=10.000000))
   ShieldHitboxChain(0)=(BoneOffset=(X=0.000000,Y=10.000000,Z=145.000000))
   ShieldHitboxChain(1)=(BoneOffset=(X=0.000000,Y=-10.000000,Z=130.000000))
   ShieldHitboxChain(2)=(BoneOffset=(X=0.000000,Y=10.000000,Z=110.000000))
   ShieldHitboxChain(3)=(BoneOffset=(X=0.000000,Y=-10.000000,Z=90.000000))
   ShieldHitboxChain(4)=(BoneOffset=(X=0.000000,Y=10.000000,Z=70.000000))
   ShieldHitboxChain(5)=(BoneOffset=(X=0.000000,Y=-10.000000,Z=50.000000))
   ShieldHitboxChain(6)=(BoneOffset=(X=0.000000,Y=8.000000,Z=30.000000))
   ShieldHitboxChain(7)=(BoneOffset=(X=0.000000,Y=-8.000000,Z=10.000000))
   MaceLightDamageType=Class'kfgamecontent.KFDT_Bludgeon_MaceAndShield'
   ShieldLightDamageType=Class'kfgamecontent.KFDT_Bludgeon_MaceAndShield_ShieldLight'
   MaceHeavyDamageType=Class'kfgamecontent.KFDT_Bludgeon_MaceAndShield_MaceHeavy'
   ShieldHeavyDamageType=Class'kfgamecontent.KFDT_Bludgeon_MaceAndShield_ShieldHeavy'
   ParryStrength=6
   BlockTypes(2)=(dmgType=Class'kfgamecontent.KFDT_Fire_HuskFireball')
   BlockTypes(3)=(dmgType=Class'kfgamecontent.KFDT_Fire_HuskFlamethrower')
   BlockTypes(4)=(dmgType=Class'kfgamecontent.KFDT_Ballistic_PatMinigun',BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Bullet_Impact_Metal')
   BlockTypes(5)=(dmgType=Class'kfgamecontent.KFDT_Explosive_PatMissile')
   BlockTypes(6)=(dmgType=Class'kfgamecontent.KFDT_Ballistic_HansAK12',BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Bullet_Impact_Metal')
   BlockDamageMitigation=0.300000
   ParryDamageMitigationPercent=0.300000
   BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Hammer'
   ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Wood'
   PackageKey="Shield_Melee"
   FirstPersonMeshName="wep_1p_shield_melee_mesh.Wep_1stP_Shield_Melee_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_shield_melee_anim.Wep_1stP_Shield_Melee_Anim"
   PickupMeshName="WEP_3P_Shield_Melee_MESH.Wep_Shield_Melee_Pickup"
   AttachmentArchetypeName="WEP_Shield_Melee_ARCH.Wep_MaceAndShield_3P"
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
   FireModeIconPaths(1)=()
   FireModeIconPaths(2)=()
   FireModeIconPaths(3)=()
   FireModeIconPaths(4)=()
   FireModeIconPaths(5)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
   InventorySize=8
   QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
   GrenadeFireOffset=(X=25.000000,Y=15.000000,Z=0.000000)
   GroupPriority=110.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Shield_Melee_TEX.UI_WeaponSelect_MaceShield'
   NumBloodMapMaterials=2
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
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Blunt_MaceAndShield:MeleeHelper_0'
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Berserker'
   WeaponUpgrades(1)=(IncrementDamage=1.135000)
   InstantHitDamage(0)=80.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=165.000000
   InstantHitDamage(4)=()
   InstantHitDamage(5)=175.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Bludgeon_MaceAndShield'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_MaceAndShield_Bash'
   InstantHitDamageTypes(4)=()
   InstantHitDamageTypes(5)=Class'kfgamecontent.KFDT_Bludgeon_MaceAndShield_MaceHeavy'
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
   ItemName="Bone Crusher"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Blunt_MaceAndShield"
   ObjectArchetype=KFWeap_MeleeBase'KFGame.Default__KFWeap_MeleeBase'
}
