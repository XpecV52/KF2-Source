class KFPawn_ZedHans_Versus extends KFPawn_ZedHans;

function PossessedBy( Controller C, bool bVehicleTransition )
{
	super.PossessedBy(C, bVehicleTransition);

	ServerDoSpecialMove(SM_BossTheatrics);
}

/**
 * Pawn starts firing!
 * Called from PlayerController::StartFiring
 * Network: Local Player
 *
 * @param	FireModeNum		fire mode number
 */
simulated function StartFire(byte FireModeNum)
{

	if(IsDoingSpecialMove())
	{
		return;
	}

	switch (FireModeNum)
	{
		case 0: //left click
			//main fire
			/*if(!IsDoingSpecialMove(SM_HoseWeaponAttack))
			{
				ServerDoSpecialMove(SM_HoseWeaponAttack);
			}*/
			if(bGunsEquipped)
			{
				super.StartFire(FireModeNum);
			}
			break;

		case 1: //middle click
			if(!IsDoingSpecialMove(SM_Hans_ThrowGrenade))
			{
				ServerDoSpecialMove(SM_Hans_ThrowGrenade);
			}
			break;
		/*
		case 2:
			//r
			if(!IsDoingSpecialMove(SM_Hans_GrenadeBarrage))
			{
				ServerDoSpecialMove(SM_Hans_GrenadeBarrage);
			}

			break;*/
		case 3:
			//melee
			if(!IsDoingSpecialMove(SM_MeleeAttack))
			{
				ServerDoSpecialMove(SM_MeleeAttack,,, 2 );
			}
			break;
		case 4:

			break;
	}
}

simulated function PlayWeaponSwitch(Weapon OldWeapon, Weapon NewWeapon)
{
	LogInternal("WEAPON SWITCH");
	// Save a reference to carried Weapon, so we don't cast all over the place.
	ToggleAim();
}

reliable server function ToggleAim()
{
	SetWeaponStance(!bGunsEquipped, true);
}

// @todo: fixme
/*reliable server function ServerDoSpecialMove(ESpecialMove NewMove, optional bool bForceMove, optional Pawn InInteractionPawn, optional INT InSpecialMoveFlags, optional bool bSkipReplication)
{
	if(NewMove == SM_Hans_ThrowGrenade)
	{
		ThrowGrenade();
	}
	else
	{
		DoSpecialMove(NewMove, bForceMove, InInteractionPawn, InSpecialMoveFlags, bSkipReplication);
	}
}*/

/** Spawns a grenade projectile at the cached throw speed and location */
simulated function bool ThrowGrenade()
{
	ActiveGrenadeClass = SmokeGrenadeClass;
	return super.ThrowGrenade();
}

//get rif of ragemode sprint
function SetSprinting(bool bNewSprintStatus)
{
	if ( bNewSprintStatus )
	{
		// Wait for uncrouch; see CheckJumpOrDuck
		if ( bIsCrouched )
		{
			bNewSprintStatus = false;
		}
		else if ( MyKFWeapon != None && !MyKFWeapon.AllowSprinting() )
		{
			bNewSprintStatus = false;
		}
	}

	bIsSprinting = bNewSprintStatus;

	if ( MyKFWeapon != None )
	{
		MyKFWeapon.SetWeaponSprint(bNewSprintStatus);
	}
}


simulated function ToggleEquipment()
{
	ServerToggleShield();
}

reliable server function ServerToggleShield()
{
	SetHuntAndHealMode(!bInHuntAndHealMode);
}

defaultproperties
{
   NerveGasExplosiveBlastTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedHans_Versus:ExploTemplate0'
   NerveGasAttackTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedHans_Versus:ExploTemplate1'
   ShieldImpactEffects=KFSkinTypeEffects_HansShield'kfgamecontent.Default__KFPawn_ZedHans_Versus:ShieldEffects'
   ShieldShatterExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedHans_Versus:ShatterExploTemplate0'
   bVersusZed=True
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedHans:MeleeHelper_0'
      BaseDamage=70.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_Hans'
      MomentumTransfer=40000.000000
      MaxHitRange=275.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedHans:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedHans_Versus:MeleeHelper_0'
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedHans:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedHans:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedHans:Afflictions_0'
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedHans:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedHans_Versus:Afflictions_0'
   TeammateCollisionRadiusPercent=0.300000
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedHans:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedHans:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedHans:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=Class'KFGame.KFSM_MeleeAttack'
      SpecialMoveClasses(2)=Class'KFGame.KFSM_DoorMeleeAttack'
      SpecialMoveClasses(3)=Class'kfgamecontent.KFSM_GrappleAttack_Hans'
      SpecialMoveClasses(4)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(10)=None
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(14)=None
      SpecialMoveClasses(15)=Class'kfgamecontent.KFSM_Evade_Fear'
      SpecialMoveClasses(16)=Class'KFGame.KFSM_Block'
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
      SpecialMoveClasses(29)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(30)=Class'KFGame.KFSM_HansGrappleVictim'
      SpecialMoveClasses(31)=None
      SpecialMoveClasses(32)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      SpecialMoveClasses(33)=Class'kfgamecontent.KFSM_Hans_WeaponSwitch'
      SpecialMoveClasses(34)=Class'kfgamecontent.KFSM_Hans_ThrowGrenade'
      SpecialMoveClasses(35)=Class'kfgamecontent.KFSM_Hans_GrenadeHalfBarrage'
      SpecialMoveClasses(36)=Class'kfgamecontent.KFSM_Hans_GrenadeBarrage'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedHans:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedHans_Versus:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHans:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHans:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHans:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHans:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedHans:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedHans:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedHans_Versus:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHans:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHans:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHans:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHans:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedHans:KFPawnSkeletalMeshComponent'
      WireframeColor=(B=0,G=255,R=255,A=255)
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bPerBoneMotionBlur=True
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
      Translation=(X=0.000000,Y=0.000000,Z=-86.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=2500.000000
      bAllowPerObjectShadows=True
      TickGroup=TG_DuringAsyncWork
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedHans:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedHans:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=55.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedHans:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedHans:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedHans:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedHans:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedHans:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_ZedHans_Versus"
   ObjectArchetype=KFPawn_ZedHans'kfgamecontent.Default__KFPawn_ZedHans'
}
