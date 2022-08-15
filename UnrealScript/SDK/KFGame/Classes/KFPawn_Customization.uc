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

cpptext
{
	virtual UBOOL IsAliveAndWell() const;
}

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
		`log("Could not find item" @ItemDefinition);
		return;
	}

	WeaponDef = class'KFWeaponSkinList'.default.Skins[ItemIndex].WeaponDef;

	if(WeaponDef == none)
	{
		`log("Weapon def NONE for : " @ItemDefinition);
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
	bDisableTurnInPlace=true
	bEnableAimOffset=false

	// Default the customization pawn to walking so that IK is enabled
	Physics=PHYS_Walking

    // artificial nudge -3uu to align to floor w/o IK
	Begin Object Name=KFPawnSkeletalMeshComponent
		Translation=(Z=-89)
	End Object
}
