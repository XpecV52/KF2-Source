//=============================================================================
// KFPawn_Customization
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 1/21/2014
//=============================================================================

class KFPawn_Customization extends KFPawn_Human
	native(Pawn);

var AnimSet MaleCustomizationAnimSet;
var AnimSet FemaleCustomizationAnimSet;

var bool bUsingCustomizationPoint; // This is true if we have been placed on a KFCustomizationPoint

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/*********************************************************************************************
Initialization
********************************************************************************************* */
/** Disable foot IK */
simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	Super.PostInitAnimTree(SkelComp);

	// Disable foot IK so we have have straight legs for this character.  When
	// bAllowStretching is set the knees must be bent a little.
	if ( IKFootLeft != None )
	{
		IKFootLeft.SetSkelControlActive(false);
	}
	if ( IKFootRight != None )
	{
		IKFootRight.SetSkelControlActive(false);
	}
}

/** Always use the customization anim set */
simulated function SetCharacterAnimationInfo()
{
	local KFCharacterInfo_Human CharInfoHuman;

 	super.SetCharacterAnimationInfo();

	// Character Animation
	CharInfoHuman = KFCharacterInfo_Human( GetCharacterInfo() );
	if( CharInfoHuman != none && CharInfoHuman.bIsFemale )
	{
		Mesh.AnimSets.AddItem(FemaleCustomizationAnimSet);
	}
	else
	{
    	Mesh.AnimSets.AddItem(MaleCustomizationAnimSet);
	}

	Mesh.UpdateAnimations();

	PlayRandomIdleAnimation();
}

function AttachWeaponByItemDefinition( int ItemDefinition )
{
	local class<KFWeaponDefinition> WeaponDef;
	local int ItemINdex;
	local KFWeaponAttachment WeaponPreview;

	//find weapon def
	ItemIndex = class'KFWeaponSkinList'.default.Skins.Find('Id', ItemDefinition);

	if(ItemIndex ==  INDEX_NONE)
	{
		LogInternal("Could not find item" @ItemDefinition);
		return;
	}

	WeaponDef = class'KFWeaponSkinList'.default.Skins[ItemIndex].WeaponDef;

	if(WeaponDef == none)
	{
		LogInternal("Weapon def NONE for : " @ItemDefinition);
		return;
	}

	//load in and add object .  
	WeaponPreview = KFWeaponAttachment ( DynamicLoadObject( WeaponDef.default.AttachmentArchtypePath, class'KFWeaponAttachment' ) );

	//attatch it to player
	WeaponAttachmentTemplate = WeaponPreview;

	WeaponAttachmentChanged();		

	//setweapon skin
	WeaponAttachment.SetWeaponSkin(ItemDefinition);
	
}

simulated function PlayRandomIdleAnimation()
{
	local byte AnimIndex;
	local name AnimName;
	local AnimSet AnimSet;

	AnimSet =  Mesh.AnimSets[Mesh.AnimSets.Length - 1];
	AnimIndex = Rand(AnimSet.Sequences.Length);
	AnimName = AnimSet.Sequences[AnimIndex].SequenceName;

	BodyStanceNodes[EAS_FullBody].PlayCustomAnim(AnimName, 1.f, 0.4, 0.4, false, true);
	BodyStanceNodes[EAS_FullBody].SetActorAnimEndNotification( TRUE );
}

simulated event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
	PlayRandomIdleAnimation();
}

simulated function NotifyTeamChanged()
{
	// Applies Character Info for < ROLE_Authority
	if (PlayerReplicationInfo != None)
	{
		SetCharacterArch(GetCharacterInfo());
	}
}

/** If the customization point is created after the pawn, relocate our customization pawn to a customization point */
function MoveToCustomizationPoint()
{
	local NavigationPoint BestStartSpot;
	local KFGameInfo KFGI;
	local PlayerController PC;

    KFGI = KFGameInfo( WorldInfo.Game );

    PC = PlayerController( Controller );

	if ( PC != none )
	{
		BestStartSpot = KFGI.FindCustomizationStart( PC );

		// if a customization point wasn't found or if SetLocation fails, exit.
		if ( BestStartSpot == None || !SetLocation( BestStartSpot.Location ) )
		{
		 	return;
		}

 		SetRotation( BestStartSpot.Rotation );

		// initialize and start it up
		KFPlayerCamera(PC.PlayerCamera).CustomizationCam.bInitialize = false;

		bUsingCustomizationPoint = true;
	}
}

/** Customization Pawns cannot take damage */
event TakeDamage(int Damage, Controller InstigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	return;
}

/*********************************************************************************************
Customizing
********************************************************************************************* */

/** Set basic variables for the newly created Customization Pawn, derived from RestartPlayer */
function InitializeCustomizationPawn( PlayerController NewController, NavigationPoint BestStartSpot )
{
	if (Controller != None)
	{
		Controller.UnPossess();
	}

	PossessedBy( NewController, false );
    NewController.SetViewTarget( self );
	NewController.SetCameraMode( 'Customization' );

	// initialize and start it up
	bUsingCustomizationPoint = ( KFCustomizationPoint( BestStartSpot ) != none );
}

defaultproperties
{
   MaleCustomizationAnimSet=AnimSet'CHR_BaseMale_ANIM.CS_Male'
   FemaleCustomizationAnimSet=AnimSet'CHR_BaseFemale_ANIM.CS_Female'
   FlashLightTemplate=KFFlashlightAttachment'KFGame.Default__KFPawn_Customization:FlashLight_0'
   Begin Object Class=AkComponent Name=TraderDialogAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_Human:TraderDialogAkSoundComponent'
      BoneName="Root"
      bForceOcclusionUpdateInterval=True
      Name="TraderDialogAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Human:TraderDialogAkSoundComponent'
   End Object
   TraderDialogAkComponent=TraderDialogAkSoundComponent
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Human:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Human:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bEnableAimOffset=False
   bDisableTurnInPlace=True
   Begin Object Class=KFPawnAfflictions Name=Afflictions_0 Archetype=KFPawnAfflictions'KFGame.Default__KFPawn_Human:Afflictions_0'
      StackingAffl(0)=(Cooldown=5.000000,DissipationRate=0.500000)
      StackingAffl(1)=(Threshhold=0.200000,Duration=1.000000,DissipationRate=0.200000)
      bNoBurnedMatBeforeDeath=True
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFPawnAfflictions'KFGame.Default__KFPawn_Human:Afflictions_0'
   End Object
   AfflictionHandler=KFPawnAfflictions'KFGame.Default__KFPawn_Customization:Afflictions_0'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Human:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Human:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Human:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=None
      SpecialMoveClasses(2)=None
      SpecialMoveClasses(3)=None
      SpecialMoveClasses(4)=None
      SpecialMoveClasses(5)=None
      SpecialMoveClasses(6)=None
      SpecialMoveClasses(7)=None
      SpecialMoveClasses(8)=None
      SpecialMoveClasses(9)=None
      SpecialMoveClasses(10)=None
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=None
      SpecialMoveClasses(13)=None
      SpecialMoveClasses(14)=None
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(21)=Class'KFGame.KFSM_HansGrappleVictim'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Human:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'KFGame.Default__KFPawn_Customization:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'KFGame.Default__KFPawn_Human:AmbientAkSoundComponent_1'
      BoneName="Spine1"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Human:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'KFGame.Default__KFPawn_Human:AmbientAkSoundComponent_0'
      BoneName="RW_Weapon"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Human:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_Human:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_Human:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_Customization:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_Human:FootstepAkSoundComponent'
      BoneName="Root"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Human:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_Human:DialogAkSoundComponent'
      BoneName="head"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Human:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Human:KFPawnSkeletalMeshComponent'
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
      Translation=(X=0.000000,Y=0.000000,Z=-89.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=4000.000000
      bAllowPerObjectShadows=True
      bAllowPerObjectShadowBatching=True
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Human:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPawn_Human:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=40.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPawn_Human:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPawn_Human:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPawn_Human:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPawn_Human:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPawn_Human:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   Components(8)=TraderDialogAkSoundComponent
   Physics=PHYS_Walking
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_Customization"
   ObjectArchetype=KFPawn_Human'KFGame.Default__KFPawn_Human'
}
