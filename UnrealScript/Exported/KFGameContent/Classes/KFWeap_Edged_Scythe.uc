//=============================================================================
// KFWeap_Edged_AbominationAxe
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Edged_Scythe extends KFWeap_MeleeBase;

var const array<MeleeHitBoxInfo> HitboxChainFolded;
var const array<MeleeHitBoxInfo> HitboxChainUnfolded;

var const int MaxHitRangeFolded;
var const int MaxHitRangeUnfolded;

var const int FoldedDamage;
var const int FoldedDamageAlt;

var const int UnfoldedDamage;
var const int UnfoldedDamageAlt;

var const class<DamageType> FoldedDT;
var const class<DamageType> FoldedDTAlt;

var const class<DamageType> UnfoldedDT;
var const class<DamageType> UnfoldedDTAlt;

var const float UnfoldBlendingDuration;

var const float FoldedAttackAnimRate;

var const vector PlayerViewOffsetUnfolded;

var transient vector OriginalPlayerViewOffset;
var transient bool bIsFolded;

var AnimNodeBlendPerBone FoldBlendNode;

var const ParticleSystem BloodParticles;

const BloodParticlesSocket = 'BlockEffect';

var ParticleSystem FoldedTrailParticleSystem;
var ParticleSystem UnfoldedTrailParticleSystem;

simulated event PreBeginPlay()
{
    Super.PreBeginPlay();

    OriginalPlayerViewOffset = PlayerViewOffset;
}

event PostBeginPlay()
{
    Super.PostBeginPlay();

    ChangeMode(true, false);

    SetFoldedBladeBlendTarget(1.0f, 0.0f);
}

/////////////////////////////////////////////////////////////////////////////

/** The SkeletalMeshComponents Animations are being instanced from AnimTreeTemplate
* 	before PostInitAnimTree. Be sure to never set the Mesh's animations directly through
*	the package */
simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	Super.PostInitAnimTree(SkelComp);

	FoldBlendNode = AnimNodeBlendPerBone(SkelComp.FindAnimNode('FoldBlendNode'));

    SetFoldedBladeBlendTarget(1.0f, 0.0f);
}

/////////////////////////////////////////////////////////////////////////////

/** Returns true if weapon can potentially be reloaded */
simulated function bool CanReload(optional byte FireModeNum)
{
	return true;
}

simulated state WeaponUpkeep
{
    simulated function BeginState(name PreviousStateName)
	{
		local name AnimName;
		local float Duration;

        AnimName = CleanNonBloodyAnim;

		Duration = MySkelMesh.GetAnimLength(AnimName);
		if ( Duration > 0.f )
		{
			if ( Instigator.IsFirstPerson() )
			{
				PlayAnimation(AnimName);
                SetTimer(Duration, FALSE, nameof(SwapComplete));
			}
    	}
		else
		{
			WarnInternal("Duration is zero!!!"@AnimName);
			SetTimer(0.001, FALSE, nameof(SwapComplete));
		}

		NotifyBeginState();
	}

	simulated function BeginFire(byte FireModeNum)
	{
		
	}

	simulated event EndState(Name NextStateName)
	{
		ClearTimer(nameof(SwapComplete));
        Super.EndState(NextStateName);
        NotifyEndState();
	}
    
    simulated function SwapComplete()
    {
        if (Role == ROLE_Authority)
        {
            GotoState('Active');
        }
        else
        {
            GotoState('Active');
            ServerSwapComplete();
        }
    }
}

server reliable function ServerSwapComplete()
{
    GotoState('Active');
}

simulated function ChangeMode(bool IsFolded, bool bApplyBlend = true)
{
    if (MeleeAttackHelper == none)
        return;

    if (IsFolded)
    {
        MeleeAttackHelper.SetMeleeRange(MaxHitRangeFolded);
        MeleeAttackHelper.SetHitBoxChain(HitboxChainFolded);

        InstantHitDamage[DEFAULT_FIREMODE] = FoldedDamage;
        InstantHitDamage[HEAVY_ATK_FIREMODE] = FoldedDamageAlt;

        InstantHitDamageTypes[DEFAULT_FIREMODE] = FoldedDT;
        InstantHitDamageTypes[HEAVY_ATK_FIREMODE] = FoldedDTAlt;

        PlayerViewOffset = OriginalPlayerViewOffset;
    }
    else 
    {
        MeleeAttackHelper.SetMeleeRange(MaxHitRangeUnfolded);
        MeleeAttackHelper.SetHitBoxChain(HitboxChainUnfolded);

        InstantHitDamage[DEFAULT_FIREMODE] = UnfoldedDamage;
        InstantHitDamage[HEAVY_ATK_FIREMODE] = UnfoldedDamageAlt;

        InstantHitDamageTypes[DEFAULT_FIREMODE] = UnfoldedDT;
        InstantHitDamageTypes[HEAVY_ATK_FIREMODE] = UnfoldedDTAlt;
    
        PlayerViewOffset = PlayerViewOffsetUnfolded;
    }

    NotifyServerMode(bIsFolded);

    if (bApplyBlend)
    {   
        SetFoldedBladeBlendTarget(bIsFolded ? 1.0f : 0.0f, UnfoldBlendingDuration);
    }
}

simulated function SetFoldedBladeBlendTarget(float Value, float BlendTime)
{
    if ( FoldBlendNode != None )
    {
        FoldBlendNode.SetBlendTarget(Value, BlendTime);
    }
}

simulated function StartFire(byte FireModeNum)
{
    if (StartFireDisabled && FireModeNum == BLOCK_FIREMODE)
    {
        StartFireDisabled = false;
        return;
    }

    if (FireModeNum == DEFAULT_FIREMODE || FireModeNum == HEAVY_ATK_FIREMODE)
    {
        DistortTrailParticle = bIsFolded ? FoldedTrailParticleSystem : UnfoldedTrailParticleSystem;
    }
    else if (FireModeNum == BASH_FIREMODE)
    {
        DistortTrailParticle = none;
    }

	super.StartFire(FireModeNum);
}

static simulated function float CalculateTraderWeaponStatDamage()
{
    // How is this calculated for this weapon?
    return default.UnfoldedDamage;
}

simulated function PlayAnimation(name Sequence, optional float fDesiredDuration, optional bool bLoop, optional float BlendInTime=0.1, optional float BlendOutTime=0.0)
{
    local string NewAnimName;

    if (Sequence == 'Idle' ||
        Sequence == 'Guncheck_V1' ||
        Sequence == 'Guncheck_V2' ||
        Sequence == 'Guncheck_V3')
    {
        NewAnimName = string(Sequence);
        NewAnimName $= ((bIsFolded) ? "_Folded" : "_Unfolded");
        Super.PlayAnimation(name(NewAnimName), fDesiredDuration, bLoop, BlendInTime, BlendOutTime);
    }
    else
    {
        Super.PlayAnimation(Sequence, fDesiredDuration, bLoop, BlendInTime, BlendOutTime);
    }
}

simulated function ModifyMeleeAttackSpeed(out float InSpeed, optional int FireMode = DEFAULT_FIREMODE, optional int UpgradeIndex = INDEX_NONE, optional KFPerk CurrentPerk)
{
    Super.ModifyMeleeAttackSpeed(InSpeed, FireMode, UpgradeIndex, CurrentPerk);

    if (bIsFolded)
    {
        InSpeed *= FoldedAttackAnimRate;
    }
}

/** 
  * Overriden to apply fold/unfold logic
  */
simulated function ANIMNOTIFY_LockBolt()
{
    bIsFolded = !bIsFolded;
	ChangeMode(bIsFolded);
}

/** Unused */
simulated function ANIMNOTIFY_UnLockBolt()
{

}

/** Play blood VFX as we only use one anim. */
simulated function ANIMNOTIFY_CleanBlood()
{
    if (!bIsBloody)
    {
        return;
    }

    if (WorldInfo.NetMode != NM_DedicatedServer && BloodParticles != none)
    {
        WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BloodParticles, MySkelMesh, BloodParticlesSocket, true);
    }

	Super.ANIMNOTIFY_CleanBlood();
}

simulated state WeaponEquipping
{
	/** Initialize the weapon as being active and ready to go. */
	simulated event BeginState(Name PreviousStateName)
	{
        Super.BeginState(PreviousStateName);

	    if (WorldInfo.NetMode != NM_Client)
        {
            NotifyInitialState(bIsFolded);
        }
    }
}

/**
	Should replicate to 3P to show the shield effects
 */
simulated function NotifyInitialState(bool bFolded)
{
	local KFPawn KFP;

	if (WorldInfo.NetMode != NM_Client)
	{
        LogInternal("NotifyInitialState: " $bFolded);

		KFP = KFPawn(Instigator);
		KFP.OnWeaponSpecialAction(bFolded ? 0 : 1);
	}
}

reliable server function NotifyServerMode(bool bFolded)
{
    bIsFolded = bFolded;
}

defaultproperties
{
   HitboxChainFolded(0)=(BoneOffset=(X=3.000000,Y=0.000000,Z=190.000000))
   HitboxChainFolded(1)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=170.000000))
   HitboxChainFolded(2)=(BoneOffset=(X=3.000000,Y=0.000000,Z=150.000000))
   HitboxChainFolded(3)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=130.000000))
   HitboxChainFolded(4)=(BoneOffset=(X=3.000000,Y=0.000000,Z=110.000000))
   HitboxChainFolded(5)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=90.000000))
   HitboxChainFolded(6)=(BoneOffset=(X=3.000000,Y=0.000000,Z=70.000000))
   HitboxChainFolded(7)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=50.000000))
   HitboxChainFolded(8)=(BoneOffset=(X=3.000000,Y=0.000000,Z=30.000000))
   HitboxChainFolded(9)=(BoneOffset=(X=0.000000,Y=0.000000,Z=10.000000))
   HitboxChainUnfolded(0)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=290.000000))
   HitboxChainUnfolded(1)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=270.000000))
   HitboxChainUnfolded(2)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=250.000000))
   HitboxChainUnfolded(3)=(BoneOffset=(X=3.000000,Y=0.000000,Z=230.000000))
   HitboxChainUnfolded(4)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=210.000000))
   HitboxChainUnfolded(5)=(BoneOffset=(X=3.000000,Y=0.000000,Z=190.000000))
   HitboxChainUnfolded(6)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=170.000000))
   HitboxChainUnfolded(7)=(BoneOffset=(X=3.000000,Y=0.000000,Z=150.000000))
   HitboxChainUnfolded(8)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=130.000000))
   HitboxChainUnfolded(9)=(BoneOffset=(X=3.000000,Y=0.000000,Z=110.000000))
   HitboxChainUnfolded(10)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=90.000000))
   HitboxChainUnfolded(11)=(BoneOffset=(X=3.000000,Y=0.000000,Z=70.000000))
   HitboxChainUnfolded(12)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=50.000000))
   HitboxChainUnfolded(13)=(BoneOffset=(X=3.000000,Y=0.000000,Z=30.000000))
   HitboxChainUnfolded(14)=(BoneOffset=(X=0.000000,Y=0.000000,Z=10.000000))
   MaxHitRangeFolded=220
   MaxHitRangeUnfolded=300
   FoldedDamage=60
   FoldedDamageAlt=87
   UnfoldedDamage=90
   UnfoldedDamageAlt=150
   FoldedDT=Class'kfgamecontent.KFDT_Slashing_ScytheShort'
   FoldedDTAlt=Class'kfgamecontent.KFDT_Slashing_ScytheShortAlt'
   UnfoldedDT=Class'kfgamecontent.KFDT_Slashing_ScytheLong'
   UnfoldedDTAlt=Class'kfgamecontent.KFDT_Slashing_ScytheLongAlt'
   UnfoldBlendingDuration=0.050000
   FoldedAttackAnimRate=0.650000
   PlayerViewOffsetUnfolded=(X=12.000000,Y=0.000000,Z=-7.000000)
   BloodParticles=ParticleSystem'WEP_1P_KATANA_EMIT.FX_katana_blood_flick_01'
   FoldedTrailParticleSystem=ParticleSystem'WEP_Scythe_EMIT.FX_Scythe_Custom_R_01'
   UnfoldedTrailParticleSystem=ParticleSystem'WEP_Scythe_EMIT.FX_Scythe_Custom_Unfold_01'
   ParryStrength=5
   ParryDamageMitigationPercent=0.400000
   DistortTrailParticle=None
   WhiteTrailParticle=None
   BlueTrailParticle=None
   RedTrailParticle=None
   BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
   ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
   PackageKey="Scythe"
   FirstPersonMeshName="WEP_1P_Scythe_MESH.Wep_1stP_Scythe_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Scythe_ANIM.Wep_1st_Scythe_Anim"
   FirstPersonAnimTree="WEP_1P_Scythe_ANIM.1P_Scythe_Animtree"
   PickupMeshName="wep_3p_scythe_mesh.Wep_3rdP_Scythe_Pickup"
   AttachmentArchetypeName="WEP_Scythe_ARCH.Wep_Scythe_3P"
   InventorySize=7
   GroupPriority=50.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Scythe_TEX.UI_WeaponSelect_Scythe'
   PlayerViewOffset=(X=10.000000,Y=0.000000,Z=-10.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
      bUseDirectionalMelee=True
      bHasChainAttacks=True
      ChainSequence_F(0)=DIR_ForwardRight
      ChainSequence_F(1)=DIR_ForwardLeft
      ChainSequence_F(2)=DIR_ForwardRight
      ChainSequence_F(3)=DIR_ForwardLeft
      ChainSequence_B(0)=DIR_BackwardLeft
      ChainSequence_B(1)=DIR_BackwardRight
      ChainSequence_B(2)=()
      ChainSequence_B(3)=()
      ChainSequence_B(4)=()
      ChainSequence_B(5)=()
      ChainSequence_B(6)=()
      MeleeImpactCamShakeScale=0.040000
      WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Edged_Scythe:MeleeHelper_0'
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Berserker'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Stat=EWUS_Damage1,Scale=1.150000),(Add=1)))
   InstantHitDamage(3)=50.000000
   InstantHitDamage(4)=()
   InstantHitDamage(5)=()
   InstantHitMomentum(0)=30000.000000
   InstantHitMomentum(1)=()
   InstantHitMomentum(2)=()
   InstantHitMomentum(3)=100000.000000
   InstantHitMomentum(4)=()
   InstantHitMomentum(5)=30000.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Slashing_ScytheShort'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Piercing_ScytheStab'
   InstantHitDamageTypes(4)=()
   InstantHitDamageTypes(5)=Class'kfgamecontent.KFDT_Slashing_ScytheShortAlt'
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
   ItemName="Blood Sickle"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Edged_Scythe"
   ObjectArchetype=KFWeap_MeleeBase'KFGame.Default__KFWeap_MeleeBase'
}
