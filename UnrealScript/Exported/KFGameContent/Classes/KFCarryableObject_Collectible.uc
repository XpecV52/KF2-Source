//=============================================================================
// KFCarryableObject_Collectible
//=============================================================================
// A carried object that forces the player to equip it and prevents the player
// from switching to a different inventory item, though it can be dropped.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFCarryableObject_Collectible extends KFCarryableObject
	abstract;

var KFObjectiveCollectActor ParentCollectActor;
var bool bNeedsTossCheck;

var float StartingOverrideGroundSpeed;
var float StartingOverrideSprintSpeed;

simulated state WeaponPuttingDown
{
	simulated function BeginState(name PreviousStateName)
	{
		bNeedsTossCheck = true;
		super.BeginState(PreviousStateName);
	}
}

simulated state WeaponDownSimple
{
	simulated function BeginState(name PreviousStateName)
	{
		bNeedsTossCheck = true;
		super.BeginState(PreviousStateName);
	}
}

simulated state WeaponAbortEquip
{
	simulated function BeginState(name PreviousStateName)
	{
		bNeedsTossCheck = true;
		super.BeginState(PreviousStateName);
	}
}

simulated event PreBeginPlay()
{
	Super.PreBeginPlay();

	UpdateSpeedOverride();
}

// when the weapon was pending equip and then overriden by another pending equip
simulated function NotifyRemovedPending()
{
	bNeedsTossCheck = true;
}

simulated event Tick(float DeltaTime)
{
	if (bNeedsTossCheck && Instigator.Weapon != none && Instigator.Weapon != self)
	{
		TossIfInactive();
		bNeedsTossCheck = false;
	}
	super.Tick(DeltaTime);
}

simulated function UpdateSpeedOverride()
{
	local KFPawn_Human KFPH;

	KFPH = KFPawn_Human(Instigator);
	if (KFPH != none)
	{
		if (KFGameReplicationInfo(WorldInfo.GRI).GetNumPlayersAlive() <= 1)
		{
			OverrideGroundSpeed = -1;
			OverrideSprintSpeed = -1;
		}
		else
		{
			OverrideGroundSpeed = StartingOverrideGroundSpeed;
			OverrideSprintSpeed = StartingOverrideSprintSpeed;
		}

		KFPH.UpdateGroundSpeed();
	}
}

simulated function TossIfInactive()
{
	local KFWeap_HealerBase QuickHealWeapon;

	if (Role == ROLE_Authority)
	{
		// unless the player is just temporarily quick healing
		QuickHealWeapon = KFWeap_HealerBase(Instigator.Weapon);
		if (QuickHealWeapon == none || (!QuickHealWeapon.IsInState('WeaponQuickHeal') && !QuickHealWeapon.IsInState('Inactive')))
		{
			Instigator.TossInventory(self);
		}
	}
}

simulated function UpdateReplicationInfo(bool bCarried)
{
	local KFPawn_Human KFPH;
	local KFPlayerReplicationInfo KFPRI;
	local KFPlayerController KFPC;

	KFPH = KFPawn_Human(Owner);
	KFPC = KFPlayerController(KFPH.Controller);
	KFPRI = KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo);
	KFPRI.bCarryingCollectible = bCarried;
}

simulated function NotifyPickedUp()
{
	UpdateReplicationInfo(true);

	if (ParentCollectActor != none)
	{
		ParentCollectActor.SetCollectibleState(ECollectibleState_Carried);
	}

	UpdateSpeedOverride();

	super.NotifyPickedUp();
}

function DropFrom(vector StartLocation, vector StartVelocity)
{
	UpdateReplicationInfo(false);

	if (ParentCollectActor != none)
	{
		ParentCollectActor.OnCarryableDropped();
	}
	
	Super.DropFrom(StartLocation, StartVelocity);
}

function SetupDroppedPickup(out DroppedPickup P, vector StartVelocity)
{
	local KFDroppedPickup_Carryable pickup;

	pickup = KFDroppedPickup_Carryable(P);
	if (pickup != none)
	{
		pickup.ParentCollectActor = ParentCollectActor;
	}

	super.SetupDroppedPickup(P, StartVelocity);
}

function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
	local KFCarryableObject_Collectible PickedUpCollectible;

	PickedUpCollectible = KFCarryableObject_Collectible(PickedUpWeapon);
	if (PickedUpCollectible != none)
	{
		ParentCollectActor = PickedUpCollectible.ParentCollectActor;
	}

	super.SetOriginalValuesFromPickup(PickedUpWeapon);
}

defaultproperties
{
   StartingOverrideGroundSpeed=203.000000
   StartingOverrideSprintSpeed=280.000000
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
   FireModeIconPaths(1)=()
   FireModeIconPaths(2)=()
   FireModeIconPaths(3)=()
   FireModeIconPaths(4)=()
   FireModeIconPaths(5)=()
   InventoryGroup=IG_Equipment
   GroupPriority=100.000000
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFCarryableObject:MeleeHelper_0'
      bUseDirectionalMelee=True
      bHasChainAttacks=True
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFCarryableObject:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFCarryableObject_Collectible:MeleeHelper_0'
   FiringStatesArray(0)="MeleeAttackBasic"
   FiringStatesArray(1)=()
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   FiringStatesArray(5)="MeleeAttackBasic"
   InstantHitDamage(0)=150.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=150.000000
   InstantHitDamage(4)=()
   InstantHitDamage(5)=150.000000
   InstantHitMomentum(0)=30000.000000
   InstantHitMomentum(1)=()
   InstantHitMomentum(2)=()
   InstantHitMomentum(3)=()
   InstantHitMomentum(4)=()
   InstantHitMomentum(5)=30000.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Bludgeon_Carryable'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Carryable'
   InstantHitDamageTypes(4)=()
   InstantHitDamageTypes(5)=Class'kfgamecontent.KFDT_Bludgeon_Carryable'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFCarryableObject:FirstPersonMesh'
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
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFCarryableObject:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   DroppedPickupClass=Class'kfgamecontent.KFDroppedPickup_Carryable'
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFCarryableObject:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFCarryableObject:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFCarryableObject_Collectible"
   ObjectArchetype=KFCarryableObject'KFGame.Default__KFCarryableObject'
}
