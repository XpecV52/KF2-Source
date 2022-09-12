//=============================================================================
// KFWeap_HRG_BarrierRifle
//=============================================================================
// A modified version of the Stoner63A rifle. 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================
class KFWeap_HRG_BarrierRifle extends KFWeap_LMG_Stoner63A;



/** Amount of shield charge that is consumed per second */
var (Shield) float ShieldConsumptionPerSecond;

/** Amount of shield chared that is recharged per second */
var (Shield) float ShieldRechargePerSecond;

/** Cooldown to apply after the shield is destroyed */
var (Shield) float CooldownAfterShieldDepleted;

/** Cooldown to apply after the shield depleted the charge */
var (Shield) float CooldownAfterShieldDestroyed;

/** VFX and SFX for blocking damage */
var (Shield) AkBaseSoundObject BlockSound;
var (Shield) ParticleSystem BlockParticleSystem;
var (Shield) name BlockEffectsSocketName;

/** Blocking information per damage type */
var (Shield) array<BlockEffectInfo> BlockDamageTypes;

/** Modifier applied to the damage received by the character */
var (Shield) float BlockDamageModifier;

/** Modifier applied to the damager that will affect the shield charge */
var (Shield) float ShieldDamageAbsorbtionModifier;

/** Angle to block with the shield */
var (Shield) float BlockingAngle;

/** Turn ON/OFF VFX duration */
var (Shield) float ShieldFXDuration;

/** Shield Block VFX duration */
var (Shield) float ShieldBlockVFXDuration;

/** Is shield active */
var protected transient bool bIsShieldActive;

/** Was shield charge depleted */
var protected transient bool bWasShieldDepleted;

/** Was the shield destroyed */
var protected transient bool bWasShielDestroyed;

/** Self explanatory */
var protected transient bool bCanRechargeShield;

/** float containing the shield charge to not be lost in the next frame
	due to int conversion.
 */
var protected transient float ShieldRechargeIncrement;
var protected transient float ShieldConsumptionIncrement;

/** Cos of the blocking angle (Rads) */
var protected transient float BlockingAngleCos;

/** Wether the timer for activating the shield has expired (using the fire interval) */
var protected transient bool bShieldActionAvailable;

/** Indicates wheter we are activating/deactivating the shield fx */
var protected bool bActivatingShield;
var protected bool bDeactivatingShield; 
var protected transient float FXDelta;

var transient float RedOverlayMax;
var transient float RedOverlayMin;
var protected transient float OverlayDelta;

var	WeaponFireSndInfo ShieldActivateSound;
var	WeaponFireSndInfo ShieldDeactivateSound;
var (Shield) AkBaseSoundObject ShieldEndSound;

var repnotify byte ShieldAmmo;

replication
{
	if (bNetDirty && Role == ROLE_Authority)
		bActivatingShield, bDeactivatingShield;

	if (bNetDirty && Role == ROLE_Authority && bAllowClientAmmoTracking)
		ShieldAmmo;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(ShieldAmmo))
	{
		AmmoCount[ALTFIRE_FIREMODE] = ShieldAmmo;
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	BlockingAngleCos = cos((BlockingAngle / 2.f) * DegToRad);
}

simulated function Activate()
{
	super.Activate();

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		UpdateShieldFXValue(0.0f);
	}
}

simulated function UpdateShieldFXValue(float Value)
{
	if( WeaponMICs.Length > 4)
	{
		WeaponMICs[4].SetScalarParameterValue('Opacity', Value);
	}
}

/**
 * Instead of a toggle, just immediately fire alternate fire.
 */
simulated function AltFireMode()
{
	// LocalPlayer Only
	if ( !Instigator.IsLocallyControlled()  )
	{
		return;
	}
	
	if( Role < Role_Authority )
	{
		// if we're a client, synchronize server
		UseShield();
	}

	CustomFire();
}

reliable server function UseShield()
{
	CustomFire();
}

/** Shield deploying */
simulated function CustomFire()
{
	if (bWasShieldDepleted || bWasShielDestroyed || !bShieldActionAvailable || AmmoCount[ALTFIRE_FIREMODE] == 0)
	{	
		return;
	}

	bIsShieldActive ? DeactivateShield() : ActivateShield(); 	
	bIsShieldActive = !bIsShieldActive;

	bShieldActionAvailable = false;
}

simulated function ActivateShield()
{
	PlaySoundBase(ShieldActivateSound.FirstPersonCue);
	bActivatingShield = true;
	bDeactivatingShield = false;
	bNetDirty = true;
	NotifyShieldActive(true);
	SetTimer(FireInterval[ALTFIRE_FIREMODE], false, nameof(ShieldActivationCompleted));
}

simulated function DeactivateShield()
{
	PlaySoundBase(ShieldDeactivateSound.FirstPersonCue);
	bDeactivatingShield = true;
	bActivatingShield = false;
	bCanRechargeShield = false;
	bNetDirty=true;
	NotifyShieldActive(false);
	SetTimer(FireInterval[ALTFIRE_FIREMODE], false, nameof(ShieldDeactivatedTimerCompleted));
}

simulated function ShieldActivationCompleted()
{
	bShieldActionAvailable = true;
}

simulated function ShieldDeactivatedTimerCompleted()
{
	bShieldActionAvailable = true;
	bCanRechargeShield = true;
}

/** Update shield charge - client and server */
simulated event Tick(float DeltaTime)
{
	// Update Shield visuals
	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (bActivatingShield && FXDelta < ShieldFXDuration)
		{
			FXDelta = FMin(FXDelta + DeltaTime, ShieldFXDuration);
			UpdateShieldFXValue(FXDelta / ShieldFXDuration);
			if (FXDelta == ShieldFXDuration)
			{
				bActivatingShield = false;
			}
		}
		else if (bDeactivatingShield && FXDelta > 0.0f)
		{
			FXDelta = FMax(FXDelta - DeltaTime, 0.0f);
			UpdateShieldFXValue(FXDelta / ShieldFXDuration);
			if (FXDelta == 0.0f)
			{
				bDeactivatingShield = false;
			}
		}
	}

	if (OverlayDelta > RedOverlayMin)
	{
		OverlayDelta = FMax(OverlayDelta - DeltaTime, RedOverlayMin);
		UpdateShieldBlockVFX(RedOverlayMax * (OverlayDelta / ShieldBlockVFXDuration));
	}

	if ( Role == Role_Authority )
	{
		// If shield is active it needs to consume charge, otherwise it recharges itself.
		if (bIsShieldActive)
		{
			ConsumeShield(DeltaTime);
		}
		else if (bCanRechargeShield && AmmoCount[ALTFIRE_FIREMODE] < MagazineCapacity[ALTFIRE_FIREMODE])
		{
			RechargeShield(DeltaTime);
		}
	}

	Super.Tick(DeltaTime);
}

simulated function ConsumeShield(float DeltaTime)
{
	local int Charge;

	if (Role == ROLE_Authority)
	{
		ShieldRechargeIncrement = 0.0f;

		ShieldConsumptionIncrement += ShieldConsumptionPerSecond * DeltaTime;
		
		if (ShieldConsumptionIncrement >= 1.0f && AmmoCount[ALTFIRE_FIREMODE] > 0)
		{
			Charge = int(ShieldConsumptionIncrement);
			AmmoCount[ALTFIRE_FIREMODE] = Max(AmmoCount[ALTFIRE_FIREMODE] - Charge, 0);
			ShieldConsumptionIncrement -= Charge;

			ShieldAmmo = AmmoCount[ALTFIRE_FIREMODE];

			if (AmmoCount[ALTFIRE_FIREMODE] == 0)
			{
				OnShieldDepleted();
			}
		}
	}
}

simulated function RechargeShield(float DeltaTime)
{
	local int Charge;

	if (Role == ROLE_Authority)
	{
		ShieldConsumptionIncrement = 0.0f;
		ShieldRechargeIncrement += ShieldRechargePerSecond * DeltaTime;
		if (ShieldRechargeIncrement >= 1.0f && AmmoCount[ALTFIRE_FIREMODE] < MagazineCapacity[ALTFIRE_FIREMODE])
		{
			Charge = int(ShieldRechargeIncrement);
			AmmoCount[ALTFIRE_FIREMODE] = Min(AmmoCount[ALTFIRE_FIREMODE] + Charge, MagazineCapacity[ALTFIRE_FIREMODE]);
			ShieldRechargeIncrement    -= Charge;

			ShieldAmmo = AmmoCount[ALTFIRE_FIREMODE];
		}
	}
}

/** Shield consumed all the charge by itself */
simulated function OnShieldDepleted()
{
	bWasShieldDepleted  = true;
	bActivatingShield   = false;
	bDeactivatingShield = true;
	bCanRechargeShield  = false;
	bIsShieldActive     = false;
	ShieldAmmo 			= 0;
	bNetDirty			= true;
	NotifyShieldActive(false);
	PlaySoundBase(ShieldEndSound);
	SetTimer(CooldownAfterShieldDepleted, false, nameof(ShieldRepletedTimerCompleted));
}

simulated function ShieldRepletedTimerCompleted()
{
	bWasShieldDepleted = false;
	bCanRechargeShield = true;
}

/** Shield was destroyed by attacks */
simulated function OnShieldDestroyed()
{
	bWasShielDestroyed  = true;
	bActivatingShield   = false;
	bDeactivatingShield = true;
	bCanRechargeShield  = false;
	bIsShieldActive     = false;
	ShieldAmmo 			= 0;
	bNetDirty			= true;
	NotifyShieldActive(false);
	PlaySoundBase(ShieldEndSound);
	SetTimer(CooldownAfterShieldDestroyed, false, nameof(ShieldDestroyedTimerCompleted));
}

simulated function ShieldDestroyedTimerCompleted()
{
	bWasShielDestroyed = false;
	bCanRechargeShield = true;
}

/** Update HUD ammo icon for shield */
simulated function int GetSecondaryAmmoForHUD()
{
	return AmmoCount[ALTFIRE_FIREMODE];
}

simulated function ShieldAbsorbDamage(int DamageBase)
{
	local int Damage;
	// Use the carried shield reduction by time
	ShieldConsumptionIncrement += DamageBase*ShieldDamageAbsorbtionModifier;
	Damage = int(ShieldConsumptionIncrement);
	AmmoCount[ALTFIRE_FIREMODE] = Max(AmmoCount[ALTFIRE_FIREMODE] - Damage, 0);
	ShieldConsumptionIncrement -= Damage;

	// Check if shield is destroyed.
	if (AmmoCount[ALTFIRE_FIREMODE] == 0)
	{
		OnShieldDestroyed();
	}
}

/**
	Reduce the damage received and apply it to the shield
 */
function AdjustDamage(out int InDamage, class<DamageType> DamageType, Actor DamageCauser)
{
	local KFPerk InstigatorPerk;
	local byte BlockTypeIndex;
	local float DmgCauserDot;

	if (!bIsShieldActive)
	{
		return;
	}

	// Don't apply block effects for teammates
	if (Instigator.IsSameTeam(DamageCauser.Instigator))
	{
		return;
	}

	if (CanBlockDamageType(DamageType, BlockTypeIndex))
	{
		if (ClassIsChildOf(DamageCauser.class, class'Projectile'))
		{
			// Projectile might be beyond/behind player, resulting in bad dot
			// Projectile won't have a velocity to check against, either
			// Assume velocity is the vector between projectile and instigator
			DmgCauserDot = Normal(DamageCauser.Instigator.Location - DamageCauser.Location) dot vector(Instigator.Rotation);
		}
		else
		{
			DmgCauserDot = Normal(DamageCauser.Location - Instigator.Location) dot vector(Instigator.Rotation);
		}

		if (DmgCauserDot > BlockingAngleCos)
		{
			ShieldAbsorbDamage(InDamage);
			InDamage *= BlockDamageModifier;

			ClientPlayBlockEffects(BlockTypeIndex);
			NotifyShieldBlockActive(true);
			SetTimer(0.1f, false, nameof(ResetShieldBlockVFX));

			InstigatorPerk = GetPerk();
			if (InstigatorPerk != none)
			{
				InstigatorPerk.SetSuccessfullBlock();
			}
		}
	}
}

/** Only DT added to BlockDamageTypes can be blocked. Check if the current one is in the list. */
function bool CanBlockDamageType(class<DamageType> DamageType, optional out byte out_Idx)
{
	local int Idx;

	for (Idx = 0; Idx < BlockDamageTypes.length; ++Idx)
	{
		if (ClassIsChildOf(DamageType, BlockDamageTypes[Idx].DmgType))
		{
			out_Idx = Idx;
			return true;
		}
	}

	out_Idx = INDEX_NONE;
	return false;
}

unreliable client function ClientPlayBlockEffects(optional byte BlockDTIndex=255)
{
	local AkBaseSoundObject Sound;
	local ParticleSystem PSTemplate;

	GetBlockEffects(BlockDTIndex, Sound, PSTemplate);
	PlayLocalBlockEffects(Sound, PSTemplate);
	UpdateShieldBlockVFX(RedOverlayMax);
	OverlayDelta = ShieldBlockVFXDuration;
}

/** Called on the client when successfully block/parry an attack */
simulated function PlayLocalBlockEffects(AKBaseSoundObject Sound, ParticleSystem PSTemplate)
{
	local vector Loc;
	local rotator Rot;
	local ParticleSystemComponent PSC;

	if (Sound != None)
	{
		PlaySoundBase(Sound, true);
	}

	if (PSTemplate != None)
	{
		if (MySkelMesh.GetSocketWorldLocationAndRotation(BlockEffectsSocketName, Loc, Rot))
		{
			PSC = WorldInfo.MyEmitterPool.SpawnEmitter(PSTemplate, Loc,  Rot);
			PSC.SetDepthPriorityGroup(SDPG_Foreground);
		}
		else
		{
			LogInternal(self@GetFuncName()@"missing BlockEffects Socket!");
		}
	}
}

/** Returns sound and particle system overrides using index into BlockDamageTypes array */
simulated function GetBlockEffects(byte BlockDTIndex, out AKBaseSoundObject outSound, out ParticleSystem outParticleSys)
{
	outSound = BlockSound;
	outParticleSys = BlockParticleSystem;

	if (BlockDTIndex != 255)
	{
		if (BlockDamageTypes[BlockDTIndex].BlockSound != None)
		{
			outSound = BlockDamageTypes[BlockDTIndex].BlockSound;
		}
		if (BlockDamageTypes[BlockDTIndex].BlockParticleSys != None)
		{
			outParticleSys = BlockDamageTypes[BlockDTIndex].BlockParticleSys;
		}
	}
}

/**
	Should replicate to 3P to show the shield effects
 */
simulated function NotifyShieldActive(bool bActive)
{
	local KFPawn KFP;

	if (WorldInfo.NetMode != NM_Client)
	{
		KFP = KFPawn(Instigator);
		KFP.OnWeaponSpecialAction(bActive ? 1 : 0);
	}
}

simulated function NotifyShieldBlockActive(bool bActive)
{
	local KFPawn KFP;
	
	if (WorldInfo.NetMode != NM_Client)
	{
		KFP = KFPawn(Instigator);
		KFP.OnWeaponSpecialAction(bActive ? 3 : 2);
	}
}

/*********************************************************************************************
 * State WeaponEquipping
 * The Weapon is in this state while transitioning from Inactive to Active state.
 * Typically, the weapon will remain in this state while its selection animation is being played.
 * While in this state, the weapon cannot be fired.
*********************************************************************************************/

simulated state WeaponEquipping
{
	simulated function BeginState(Name PreviousStateName)
	{
		bShieldActionAvailable = true;
		super.BeginState(PreviousStateName);
	}
}

/*********************************************************************************************
 * State WeaponPuttingDown
 * Putting down weapon in favor of a new one.
 * Weapon is transitioning to the Inactive state.
*********************************************************************************************/

simulated state WeaponPuttingDown
{
	simulated event EndState(Name NextStateName)
	{
		UpdateShieldFXValue(0.0f);
		
		// Reset Values
		bIsShieldActive            = false;
		bWasShieldDepleted         = false;
		bWasShielDestroyed         = false;
		bCanRechargeShield         = true;
		bShieldActionAvailable     = false;
		bActivatingShield          = false;
		bDeactivatingShield        = false;
		FXDelta                    = 0.0f;
		bNetDirty=true;

		super.EndState(NextStateName);
	}
}

simulated function UpdateShieldBlockVFX(float Value)
{
	if( WeaponMICs.Length > 4)
	{
		WeaponMICs[4].SetScalarParameterValue('RedOverlay', Value);
	}
}

function ResetShieldBlockVFX()
{
	NotifyShieldBlockActive(false);
}

/** Shield doesn't count as ammo for purposes of inventory management (e.g. switching) */
simulated function bool HasAnyAmmo()
{
	return AmmoCount[0] > 0 || SpareAmmoCount[0] > 0;
}

defaultproperties
{
   ShieldConsumptionPerSecond=3.000000
   ShieldRechargePerSecond=8.000000
   CooldownAfterShieldDepleted=3.000000
   CooldownAfterShieldDestroyed=3.000000
   BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact'
   BlockParticleSystem=ParticleSystem'FX_Impacts_EMIT.FX_Block_melee_01'
   BlockEffectsSocketName="BlockEffect"
   BlockDamageTypes(0)=(dmgType=Class'KFGame.KFDT_Bludgeon',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact')
   BlockDamageTypes(1)=(dmgType=Class'KFGame.KFDT_Slashing',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact')
   BlockDamageTypes(2)=(dmgType=Class'kfgamecontent.KFDT_Fire_HuskFireball',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact')
   BlockDamageTypes(3)=(dmgType=Class'kfgamecontent.KFDT_Fire_HuskFlamethrower')
   BlockDamageTypes(4)=(dmgType=Class'kfgamecontent.KFDT_BloatPuke')
   BlockDamageTypes(5)=(dmgType=Class'kfgamecontent.KFDT_EvilDAR_Rocket',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact')
   BlockDamageTypes(6)=(dmgType=Class'kfgamecontent.KFDT_EvilDAR_Laser',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact')
   BlockDamageTypes(7)=(dmgType=Class'kfgamecontent.KFDT_DAR_EMPBlast',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact')
   BlockDamageTypes(8)=(dmgType=Class'kfgamecontent.KFDT_Ballistic_PatMinigun',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact')
   BlockDamageTypes(9)=(dmgType=Class'kfgamecontent.KFDT_Explosive_PatMissile',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact')
   BlockDamageTypes(10)=(dmgType=Class'kfgamecontent.KFDT_Ballistic_HansAK12',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact')
   BlockDamageTypes(11)=(dmgType=Class'kfgamecontent.KFDT_EMP_MatriarchTeslaBlast',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact')
   BlockDamageTypes(12)=(dmgType=Class'kfgamecontent.KFDT_EMP_MatriarchPlasmaCannon')
   BlockDamageTypes(13)=(dmgType=Class'kfgamecontent.KFDT_FleshpoundKing_ChestBeam')
   BlockDamageModifier=0.300000
   ShieldDamageAbsorbtionModifier=1.200000
   BlockingAngle=180.000000
   ShieldFXDuration=0.150000
   ShieldBlockVFXDuration=0.500000
   ShieldActivateSound=(DefaultCue=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_On',FirstPersonCue=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_On')
   ShieldDeactivateSound=(DefaultCue=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Off',FirstPersonCue=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Off')
   ShieldEndSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_End'
   PackageKey="HRG_BarrierRifle"
   FirstPersonMeshName="WEP_1P_HRG_BarrierRifle_MESH.WEP_1stP_HRG_BarrielRifle_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_HRG_BarrierRifle_ANIM.Wep_1stP_HRG_BarrierRifle_Anim"
   PickupMeshName="WEP_3P_HRG_BarrierRifle_MESH.Wep_3rdP_HRG_BarrierRifle_Pickup"
   AttachmentArchetypeName="WEP_HRG_BarrierRifle_ARCH.Wep_HRG_BarrierRifle_3P"
   MuzzleFlashTemplateName="WEP_HRG_BarrierRifle_ARCH.Wep_HRG_BarrierRifle_MuzzleFlash"
   bCanRefillSecondaryAmmo=False
   InventorySize=7
   GroupPriority=125.000000
   WeaponSelectTexture=Texture2D'wep_ui_hrg_barrierrifle_tex.UI_WeaponSelect_HRG_BarrierRifle'
   SecondaryAmmoTexture=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Electricity'
   MagazineCapacity(0)=60
   MagazineCapacity(1)=100
   AmmoCost(1)=0
   SpareAmmoCapacity(0)=540
   InitialSpareMags(0)=2
   NumBloodMapMaterials=5
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_LMG_Stoner63A:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_LMG_Stoner63A:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_HRG_BarrierRifle:MeleeHelper_0'
   maxRecoilPitch=110
   maxRecoilYaw=80
   minRecoilYaw=-80
   RecoilRate=0.045000
   RecoilViewRotationScale=0.400000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_SWAT'
   WeaponUpgrades(1)=(Stats=((Scale=1.000000),(Add=0)))
   WeaponFireTypes(1)=EWFT_Custom
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   FireInterval(1)=0.010000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.025000
   InstantHitDamage(0)=33.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HRG_BarrierRifle'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HRG_BarrierRifle'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_LMG_Stoner63A:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_LMG_Stoner63A:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HRG Bastion"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_LMG_Stoner63A:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_LMG_Stoner63A:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_HRG_BarrierRifle"
   ObjectArchetype=KFWeap_LMG_Stoner63A'kfgamecontent.Default__KFWeap_LMG_Stoner63A'
}
