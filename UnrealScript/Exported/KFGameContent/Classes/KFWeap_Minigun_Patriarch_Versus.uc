class KFWeap_Minigun_Patriarch_Versus extends KFWeap_Minigun_Patriarch;

/** Cached reference to pawn */
var KFPawn_ZedPatriarch_Versus MyPatPawn;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();

	if( Instigator != none )
	{
		MyPatPawn = KFPawn_ZedPatriarch_Versus(Instigator);
	}
}

simulated function bool ShouldWeaponIgnoreStartFire() { return true; }

defaultproperties
{
   PlayerIronSightFOV=60.000000
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Minigun_Patriarch:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Minigun_Patriarch:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Minigun_Patriarch_Versus:MeleeHelper_0'
   Spread(0)=0.022000
   InstantHitDamage(0)=10.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Minigun_Patriarch:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Minigun_Patriarch:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Minigun_Patriarch:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Minigun_Patriarch:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Minigun_Patriarch_Versus"
   ObjectArchetype=KFWeap_Minigun_Patriarch'kfgamecontent.Default__KFWeap_Minigun_Patriarch'
}
