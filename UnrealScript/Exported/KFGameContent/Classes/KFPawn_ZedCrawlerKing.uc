//=============================================================================
// KFPawn_ZedCrawlerKing
//=============================================================================
// Crawler King
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedCrawlerKing extends KFPawn_ZedCrawler;

/** Tells clients to try to spawn an explosion */
var protected bool bShouldExplode;

replication
{
	if( bTearOff )
		bShouldExplode;
}

/** Called on server when pawn should has been crippled (e.g. Headless) */
function CauseHeadTrauma( float BleedOutTime=5.f )
{
	super.CauseHeadTrauma( BleedOutTime );

	CancelExplosion();
}

/** Reliably play any gore effects related to a zone/limb being dismembered */
simulated function PlayHeadAsplode()
{
	super.PlayHeadAsplode();

	CancelExplosion();
}

/** Set our gib flag on the server, replicate it with bTearOff */
function bool Died(Controller Killer, class<DamageType> DamageType, vector HitLocation)
{
	if( !bPlayedDeath && DamageType != class'KFSM_PlayerCrawler_Suicide'.default.SuicideDamageType )
	{
		bShouldExplode = true;
	}

	return super.Died( Killer, DamageType, HitLocation );
}

simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
	super.PlayDying( DamageType, HitLoc );

	// Set a timer to check if we should spawn our gas cloud (wait a single frame to allow hitzone damage to process)
	if( bShouldExplode )
	{
		SetTimer( WorldInfo.DeltaSeconds, false, nameOf(Timer_CheckForExplode) );
	}
}

/** Stops a special crawler from spawning a poison gas cloud */
simulated function CancelExplosion()
{
	bShouldExplode = false;
	if( IsTimerActive(nameOf(Timer_CheckForExplode)) )
	{
		ClearTimer( nameOf(Timer_CheckForExplode) );
	}
}

simulated function Timer_CheckForExplode()
{
	local KFGoreManager GoreManager;
	local array<name> OutGibBoneList;
	local int NumGibs;
	local vector Impulse;

	if( bShouldExplode )
	{
		class'KFSM_PlayerCrawler_Suicide'.static.TriggerExplosion( self, DeathExplosionTemplate, true );

		if( WorldInfo.NetMode != NM_DedicatedServer )
		{
			GoreManager = KFGoreManager( WorldInfo.MyGoreEffectManager );
			if( GoreManager != none && GoreManager.AllowMutilation() )
			{
				// Enable alternate bone weighting and gore skeleton
				if( !bIsGoreMesh )
				{
					SwitchToGoreMesh();
				}

				// Apply gore only if we were able to successfully switch to the gore mesh
				if( bIsGoreMesh )
				{
					NumGibs = 10 + Rand(4);
					NumGibs *= GetCharacterMonsterInfo().ExplosionGibScale;
					GetClosestHitBones( NumGibs, Location, OutGibBoneList );

					GoreManager.CauseGibsAndApplyImpulse( self,
														Class'KFSM_PlayerCrawler_Suicide'.default.SuicideDamageType,
														Location,
														OutGibBoneList,
														none,
														Mesh.GetBoneLocation(Mesh.GetBoneName(0)) );
					return;
				}
			}

			// If we didn't gib, add a ragdoll impulse
			if( NumGibs == 0 && Physics == PHYS_RigidBody )
			{
				Impulse = vect(0,0,1) * LowGoreExplosionImpulse * PhysRagdollImpulseScale;
				Mesh.AddImpulse( Impulse, Location );
			}
		}
	}
}

defaultproperties
{
   DeathExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedCrawlerKing:ExploTemplate0'
   MonsterArchPath="ZED_ARCH.ZED_CrawlerKing_Archetype"
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedCrawler:MeleeHelper_0'
      BaseDamage=7.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_ZedWeak'
      MomentumTransfer=25000.000000
      MaxHitRange=180.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedCrawler:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedCrawlerKing:MeleeHelper_0'
   DifficultySettings=Class'kfgamecontent.KFDifficulty_CrawlerKing'
   LocalizationKey="KFPawn_ZedCrawlerKing"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedCrawler:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedCrawler:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedCrawler:Afflictions_0'
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedCrawler:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedCrawlerKing:Afflictions_0'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedCrawler:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedCrawler:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedCrawler:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=Class'KFGame.KFSM_MeleeAttack'
      SpecialMoveClasses(2)=Class'KFGame.KFSM_DoorMeleeAttack'
      SpecialMoveClasses(3)=Class'KFGame.KFSM_GrappleCombined'
      SpecialMoveClasses(4)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(10)=Class'kfgamecontent.KFSM_Emerge_Crawler'
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Evade'
      SpecialMoveClasses(15)=Class'kfgamecontent.KFSM_Evade_Fear'
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=None
      SpecialMoveClasses(21)=None
      SpecialMoveClasses(22)=None
      SpecialMoveClasses(23)=None
      SpecialMoveClasses(24)=None
      SpecialMoveClasses(25)=None
      SpecialMoveClasses(26)=None
      SpecialMoveClasses(27)=None
      SpecialMoveClasses(28)=None
      SpecialMoveClasses(29)=None
      SpecialMoveClasses(30)=None
      SpecialMoveClasses(31)=None
      SpecialMoveClasses(32)=None
      SpecialMoveClasses(33)=None
      SpecialMoveClasses(34)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedCrawler:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedCrawlerKing:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedCrawler:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedCrawler:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedCrawlerKing:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   ControllerClass=Class'kfgamecontent.KFAIController_ZedCrawlerKing'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedCrawler:KFPawnSkeletalMeshComponent'
      WireframeColor=(B=0,G=255,R=255,A=255)
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bUpdateKinematicBonesFromAnimation=False
      bOverrideAttachmentOwnerVisibility=True
      bChartDistanceFactor=True
      ReplacementPrimitive=None
      RBChannel=RBCC_Pawn
      RBDominanceGroup=20
      bOwnerNoSee=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      CollideActors=True
      BlockZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,Pawn=True,Vehicle=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-40.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=2500.000000
      bAllowPerObjectShadows=True
      TickGroup=TG_DuringAsyncWork
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedCrawler:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedCrawler:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=47.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedCrawler:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedCrawler:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedCrawler:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedCrawler:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedCrawler:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_ZedCrawlerKing"
   ObjectArchetype=KFPawn_ZedCrawler'kfgamecontent.Default__KFPawn_ZedCrawler'
}