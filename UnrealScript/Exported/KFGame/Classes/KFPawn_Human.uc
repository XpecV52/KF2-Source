//=============================================================================
// KFPawn_Human
//=============================================================================
// KF Pawn for human characters
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFPawn_Human extends KFPawn
	nativereplication
	native(Pawn);







	







	 



		
		
	







 
















 
































































































































































































































#linenumber 70;

#linenumber 15;





































	















#linenumber 16;

/** Current movement speed penalty based on health */
var float LowHealthSpeedPenalty;

/*********************************************************************************************
* @name Animation
********************************************************************************************* */

/** replicated state of 1st person for 3rd person animations */
var repnotify byte CurrentWeaponState;

/** Item Id for 3rd person weapon skin */
var const repnotify int WeaponSkinItemId;

/** Random face expression poses when dead */
var array<name> DeathFaceAnims;

/*********************************************************************************************
* @name Effects
********************************************************************************************* */

/** How long to wait after a pawn is dead before spawning the blood pool */
var globalconfig float BloodPoolDelay;

/** chance to play a pain sound when hit */
var float PainSoundChanceOnHit;
/** how long before another pain sound can be played when hit */
var float PainSoundCoolDown;
/** the last time a pain sound was played */
var float PainSoundLastPlayedTime;

/*********************************************************************************************
* @name Flashlight (aka Torch)
********************************************************************************************* */

/** A flashlight flash instance */
var	transient 	KFFlashlightAttachment FlashLight;
/** A reference to the muzzle flash template */
var const 		KFFlashlightAttachment FlashLightTemplate;

/** Toggles a clients flashlight for all other clients */
var repnotify 	bool					bFlashlightOn;

var() float BatteryDrainRate;
var() float BatteryRechargeRate;
var	float	BatteryCharge;

/** Night vision active (local player only) */
var float	NVGBatteryDrainRate;

/*********************************************************************************************
* @name Night Vision
********************************************************************************************* */

var()			PointLightComponent NightVisionLightTemplate;
var transient	PointLightComponent NightVisionLight;

/*********************************************************************************************
* @name HUD
********************************************************************************************* */
/** Needed to render the players health etc **/
var KFGFxMoviePlayer_PlayerInfo		PlayerPartyInfo;

var	byte ActivePerkMessageIdx;

/*********************************************************************************************
* @name Health & Armor
********************************************************************************************* */
var byte	HealthToRegen;
var float	HealthRegenRate;
var float 	HealerRewardScaler;

var	byte 	MaxArmor;
var byte	Armor;
var byte	IntegrityLevel_High;
var byte	IntegrityLevel_Medium;
var byte	IntegrityLevel_Low;
var float	ArmorAbsorbModifier_High;
var float	ArmorAbsorbModifier_Medium;
var float	ArmorAbsorbModifier_Low;

/*********************************************************************************************
* @name Perk @ToDo: Move stuff to PRI and combine in a byte/INT
********************************************************************************************* */
var repnotify bool 	bHasSupportSafeguardBuff;
var repnotify bool 	bHasSupportBarrageBuff;
var repnotify bool 	bHasMedicVaccinationBuff;

/** The berserker skill can let you move with normal speed when in Zed time with certain skills */
var bool bMovesFastInZedTime;

var bool bBuffsUpdated;
var array<string> ActiveSkillIconPaths;

/*********************************************************************************************
* @name Objectives
********************************************************************************************* */
var	bool	bObjectivePlayer;

/*********************************************************************************************
* @name Dialog
********************************************************************************************* */
var transient int						DoshCaughtStreakAmt;
var transient float						LastDoshCaughtTime;
var transient PlayerReplicationInfo		LastDoshCaughtGiver;

var transient int						ZedsKilledStreakAmt;
var transient float						LastZedKilledTime;

var transient int						DamageTakenStreakAmt;
var transient float						LastDamageTakenStreakStartTime;

var transient float						InitialContinousDamageTime;
var transient float						IdleStartTime;
var transient int						EnvironmentDialogEventID;
var transient float						SprintTowardZedStartTime;

var transient float						SprintStartTime;

var protected AkComponent 			    TraderDialogAkComponent;

struct native DialogResponseInfo
{
    var KFPawn  Speaker;
    var KFPawn 	RespondingToPawn;
    var int     EventID;
    var int		RespondingToID;
};

var DialogResponseInfo DlgRespInfo;

replication
{
	// Replicated to ALL
	if(bNetDirty)
		Armor, MaxArmor, bObjectivePlayer, bMovesFastInZedTime, WeaponSkinItemId;

	// Replicated to all but the owning client
	if(bNetDirty && (!bNetOwner || bDemoRecording))
		CurrentWeaponState, bFlashlightOn;

	// Replicated to owning client
	if( bNetDirty && bNetOwner )
		bHasSupportSafeguardBuff, bHasSupportBarrageBuff, bHasMedicVaccinationBuff;
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/*********************************************************************************************
* @name  General
********************************************************************************************* */

simulated event Tick( float DeltaTime )
{
	local float NewSpeedPenalty;

	super.Tick( DeltaTime );

	if ( Role == ROLE_Authority )
	{
		// Update movement speed based on health
		if ( Health < HealthMax )
		{
			// Use 100 instead of HealthMax so that perk health bonuses do not penalize movement
			NewSpeedPenalty = Lerp(0.15f, 0.f, FMin(float(Health) / 100, 1.f));
		}
		else
		{
			NewSpeedPenalty = 0.f;
		}

		if ( NewSpeedPenalty != LowHealthSpeedPenalty )
		{
			LowHealthSpeedPenalty = NewSpeedPenalty;
			UpdateGroundSpeed();
		}
	}
}

/*********************************************************************************************
* @name  Constructors, Destructors, and Loading
********************************************************************************************* */

// Called immediately after gameplay begins.
simulated event PreBeginPlay()
{
	super.PreBeginPlay();
	//@TODO: Remove me if this is final
	//Using canvas to draw this instead for the time being.
	//PlayerPartyInfo = new class'KFGFxMoviePlayer_PlayerInfo';
	//PlayerPartyInfo.Init();
	//PlayerPartyInfo.SetPlayerPawn(self);
}

function PossessedBy(Controller C, bool bVehicleTransition)
{
	Super.PossessedBy(C, bVehicleTransition);

	// Reset perk buffs
	bHasSupportSafeguardBuff = false;
	bHasSupportBarrageBuff = false;
	bHasMedicVaccinationBuff = false;

	ResetIdleStartTime();
}

simulated function NotifyTeamChanged()
{
	local KFPerk InstigatorPerk;

	// Applies Character Info for < ROLE_Authority
	if( PlayerReplicationInfo != None )
	{
		SetCharacterArch(GetCharacterInfo());
	}

	InstigatorPerk = GetPerk();
	if( InstigatorPerk != none )
	{
		InstigatorPerk.NotifyPawnTeamChanged();
	}
}

/**
 * Check on various replicated data and act accordingly.
 */
simulated event ReplicatedEvent(name VarName)
{
	switch( VarName )
	{
	case nameof(CurrentWeaponState):
		WeaponStateChanged(CurrentWeaponState, true);
		break;
	case nameof(WeaponSkinItemId):
		if ( WeaponAttachment != None && WeaponSkinItemId > 0 )
		{
			WeaponAttachment.SetWeaponSkin(WeaponSkinItemId);
		}
		break;
	case nameof(bFlashlightOn):
		SetFlashlight(bFlashlightOn, false);
		break;
	case nameof(bHasMedicVaccinationBuff):
		if(bHasMedicVaccinationBuff)
		{
			EnableMedicVaccinationBuff();
		}
		else
		{
			DisableMedicVaccinationBuff();
		}
		break;
	case nameof(bHasSupportSafeguardBuff):
		SetSupportSafeguardBuff(bHasSupportSafeguardBuff);
		break;
	case nameof(bHasSupportBarrageBuff):
		SetSupportBarrageBuff(bHasSupportBarrageBuff);
		break;
	}

	Super.ReplicatedEvent(VarName);
}

simulated event Destroyed()
{
	if( PlayerPartyInfo != none )
	{
		PlayerPartyInfo.SetVisible( false );
		PlayerPartyInfo.Close();
	}

	if ( Flashlight != None )
	{
		Flashlight.DetachFlashlight();
	}

	super.Destroyed();
}

/** Set various basic properties for this KFPawn based on the character class metadata */
simulated function SetCharacterArch( KFCharacterInfoBase Info )
{
	Super.SetCharacterArch(Info);

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		// Attach/Reattach flashlight components when mesh is set
		if ( Flashlight == None && FlashLightTemplate != None )
		{
			Flashlight = new(self) Class'KFFlashlightAttachment' (FlashLightTemplate);
		}
		if ( FlashLight != None )
		{
			Flashlight.AttachFlashlight(Mesh);
		}
	}
}

/*********************************************************************************************
* @name Inventory
********************************************************************************************* */

/**
 * Overridden to iterate through the DefaultInventory array and
 * give each item to this Pawn.
 *
 * @see			GameInfo.AddDefaultInventory
 */
function AddDefaultInventory()
{
    local KFPerk MyPerk;

    MyPerk = GetPerk();

	if( MyPerk != none )
	{
        MyPerk.AddDefaultInventory(self);
    }

	DefaultInventory.AddItem(class<Weapon>(DynamicLoadObject("KFGameContent.KFWeap_Pistol_9mm", class'Class')));
	DefaultInventory.AddItem(class<Weapon>(DynamicLoadObject("KFGameContent.KFWeap_Healer_Syringe", class'Class')));
	DefaultInventory.AddItem(class<Weapon>(DynamicLoadObject("KFGameContent.KFWeap_Welder", class'Class')));
	DefaultInventory.AddItem(class<Inventory>(DynamicLoadObject("KFGameContent.KFInventory_Money", class'Class')));

	Super.AddDefaultInventory();
}

/** When switching weapon modify GroundSpeed by encumbrance level */
simulated function PlayWeaponSwitch(Weapon OldWeapon, Weapon NewWeapon)
{
	Super.PlayWeaponSwitch(OldWeapon, NewWeapon);

	if( Role == ROLE_Authority )
	{
		// Update GroundSpeed on weapon switch in case our perk
		// has a weapon specific movement bonus
		UpdateGroundSpeed();
		if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlaySwitchToFavoriteWeaponDialog( self );
	}
}

/**
 * Reset/update GroundSpeed based on perk/weapon selection.  GroundSpeed is used instead of
 * MaxSpeedModifier() so that other physics code reacts properly (e.g. bLimitFallAccel)
 * Network: Server Only
 */
function UpdateGroundSpeed()
{
	local KFInventoryManager InvM;
	local float WeightMod, HealthMod;

	if ( Role < ROLE_Authority )
		return;

	InvM = KFInventoryManager(InvManager);
	WeightMod = (InvM != None) ? InvM.GetEncumbranceSpeedMod() : 1.f;
	HealthMod = 1.f - LowHealthSpeedPenalty;

	// First reset to default so multipliers do not stack
	GroundSpeed = default.GroundSpeed * WeightMod * HealthMod;
	// reset sprint too, because perk may want to scale it
	SprintSpeed = default.SprintSpeed * WeightMod * HealthMod;

	// Ask our perk to set the new ground speed based on weapon type
	if( GetPerk() != none )
	{
		GetPerk().ModifySpeed(GroundSpeed);
		GetPerk().ModifySpeed(SprintSpeed);
	}
}

/*********************************************************************************************
* @name Animation
********************************************************************************************* */

/** Called when a pawn's weapon changes state. */
simulated function WeaponStateChanged(byte NewState, optional bool bViaReplication)
{
	CurrentWeaponState = NewState;

	// skip if this pawn was recently spawned, so we don't play out-of-date anims when pawns become relevant
	if( (WorldInfo.TimeSeconds - CreationTime) < 1.f )
	{
		return;
	}

	// skip weapon anims while in a special move
	if( IsDoingSpecialMove() && !SpecialMoves[SpecialMove].bAllowThirdPersonWeaponAnims )
	{
		return;
	}

	if( WeaponAttachment != None )
	{
		WeaponAttachment.UpdateThirdPersonWeaponAction(EWeaponState(CurrentWeaponState), self);
	}
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	Super.PostInitAnimTree(SkelComp);

	BodyStanceNodes[EAS_CH_UpperBody] = AnimNodeSlot(SkelComp.FindAnimNode('Custom_CH_Upper'));
	BodyStanceNodes[EAS_CH_LowerBody] = AnimNodeSlot(SkelComp.FindAnimNode('Custom_CH_Lower'));

	RecoilNodes[0] = GameSkelCtrl_Recoil(SkelComp.FindSkelControl('SpineRecoil'));
	//RecoilNodes[1] = GameSkelCtrl_Recoil(SkelComp.FindSkelControl('Recoil_Hand'));
}

/** Stops all animations on character */
simulated function StopAllAnimations()
{
	local name FacePose;

	FacePose = DeathFaceAnims[Rand(DeathFaceAnims.Length)];
	PlayBodyAnim(FacePose, EAS_Face,,,, true);

	Super.StopAllAnimations();
}

/*********************************************************************************************
* @name Health
********************************************************************************************* */


event bool HealDamage(int Amount, Controller Healer, class<DamageType> DamageType, optional bool bCanRepairArmor=true, optional bool bMessageHealer=true)



{
	local int DoshEarned;
	local float UsedHealAmount;
	local KFPlayerReplicationInfo InstigatorPRI;
	local KFPlayerController InstigatorPC, KFPC;
	local KFPerk InstigatorPerk;
	local class<KFDamageType> KFDT;
    local int i;
    local bool bRepairedArmor;

	InstigatorPC = KFPlayerController(Healer);
	InstigatorPerk = InstigatorPC != None ? InstigatorPC.GetPerk() : None;
	if( InstigatorPerk != None && bCanRepairArmor )
	{
		// Instigator might be able to repair some armomr
		bRepairedArmor = InstigatorPerk.RepairArmor( self );
	}

    if( Amount > 0 && IsAliveAndWell() && Health < HealthMax )
    {
		// Play any healing effects attached to this damage type
		KFDT = class<KFDamageType>(DamageType);
		if( KFDT != none && KFDT.default.bNoPain )
		{
			PlayHeal( KFDT );
		}
		else
		{
			WarnInternal("No hit effects et for damagetype:" @DamageType);
		}

    	if( Role == ROLE_Authority )
		{
			if( InstigatorPC == None || InstigatorPC.PlayerReplicationInfo == None )
			{
				return false;
			}

			InstigatorPRI = KFPlayerReplicationInfo(InstigatorPC.PlayerReplicationInfo);
			UsedHealAmount = Amount;
			if( InstigatorPerk != none )
			{
				InstigatorPerk.ModifyHealAmount( UsedHealAmount );
			}

			// You can never have a HealthToRegen value that's greater than HealthMax
			if( Health + HealthToRegen + UsedHealAmount > HealthMax )
			{
				UsedHealAmount = HealthMax - (Health + HealthToRegen);
			}

	    	HealthToRegen += UsedHealAmount;
	    	SetTimer(HealthRegenRate, true, nameof( GiveHealthOverTime ));

			// Give the healer money/XP for helping a teammate
		    if( InstigatorPC.Pawn != none && InstigatorPC.Pawn != self )
		    {
			    DoshEarned = ( UsedHealAmount / float(HealthMax) ) * HealerRewardScaler;
				InstigatorPRI.AddDosh(Max(DoshEarned, 0), true);
				InstigatorPC.AddHealPoints( UsedHealAmount );
			}

			if(WorldInfo.Game != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress()){KFGameInfo(WorldInfo.Game).GameplayEventsWriter.LogPlayerHealEvent(Amount,Healer,DamageType,self.Controller,DoshEarned);};

			if( Healer.bIsPlayer )
			{
				if( Healer != Controller )
		    	{
					AddHealerToObjective(Healer);
					InstigatorPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_HealedPlayer, PlayerReplicationInfo );
					KFPC = KFPlayerController(Controller);
					KFPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_HealedBy, Healer.PlayerReplicationInfo );

					if(KFPC!= none && KFPC.MatchStats != none ){KFPC.MatchStats.RecordIntStat(class'EphemeralMatchStats'.const.MATCH_EVENT_HEAL_RECEIVED,UsedHealAmount);};
					if(InstigatorPC!= none && InstigatorPC.MatchStats != none ){InstigatorPC.MatchStats.RecordIntStat(class'EphemeralMatchStats'.const.MATCH_EVENT_HEAL_GIVEN,UsedHealAmount);};
				}
				else
				{
					if( bMessageHealer )
					{
						InstigatorPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_HealedSelf, PlayerReplicationInfo );
					}
				}
			}

			// don't play dialog for healing done through perk skills (e.g. berserker vampire skill)
			if( bMessageHealer )
			{
				if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayHealingDialog( KFPawn(Healer.Pawn), self, float(Health + HealthToRegen) / float(HealthMax) );
			}

            // Reduce burn duration and damage in half if you heal while burning
            for( i = 0; i < DamageOverTimeArray.Length; ++i )
        	{
                if( DamageOverTimeArray[i].DoT_Type == DOT_Fire )
                {
                    DamageOverTimeArray[i].Duration *= 0.5;
                    DamageOverTimeArray[i].Damage *= 0.5;
                    break;
                }
        	}

		    return true;
		}
    }

	return bRepairedArmor;
}

/** Network: Server only */
function GiveHealthOverTime()
{
	local KFPlayerReplicationInfo KFPRI;

	if( HealthToRegen > 0 && Health < HealthMax )
	{
		Health++;
		HealthToRegen--;

		KFPRI = KFPlayerReplicationInfo( PlayerReplicationInfo );
		if( KFPRI != none )
		{
			KFPRI.PlayerHealth = Health;
		}
	}
	else
	{
		HealthToRegen = 0;
	 	ClearTimer( nameof( GiveHealthOverTime ) );
	}
}

/*********************************************************************************************
* @name Armor
********************************************************************************************* */
function AddArmor( int Amount )
{
	Armor = Min( Armor + Amount, GetMaxArmor() );
}

function GiveMaxArmor()
{
	Armor = GetMaxArmor();
}

function int GetMaxArmor()
{
	return MaxArmor; //Perk might adjust that later
}

function ShieldAbsorb( out int InDamage )
{
	local float AbsorbedPct;
	local int AbsorbedDmg;

	// Three levels of armor integrity
	if( Armor >= IntegrityLevel_High || bHasSupportSafeguardBuff )
	{
		AbsorbedPct = ArmorAbsorbModifier_High;
	}
	else if( Armor >= IntegrityLevel_Medium )
	{
		AbsorbedPct = ArmorAbsorbModifier_Medium;
	}
	else
	{
		AbsorbedPct = ArmorAbsorbModifier_Low;
	}

	AbsorbedDmg = Min(Round(AbsorbedPct * InDamage), Armor);
	// reduce damage and armor
	Armor -= AbsorbedDmg;
	InDamage -= AbsorbedDmg;
}

/*********************************************************************************************
* @name Effects / Gore
********************************************************************************************* */
/**
 * Spawn a blood pool decal effect using the GoreManager
 */
simulated function LeaveBloodPool()
{
	local KFGoreManager GoreManager;

	GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);

	if( GoreManager != none )
	{
		// Spawn a blood pool
		GoreManager.LeaveABloodPoolDecal(self);
	}
}

simulated function PlayTakeHitEffects( vector HitDirection, vector HitLocation )
{
	local KFPlayerController KFPC;
	local class<KFDamageType> DmgType;
	local name HitBoneName, RBBoneName;
	local int HitZoneIndex;

	DmgType = HitFxInfo.DamageType;

	if( IsLocallyControlled() && !Controller.bGodMode )
	{
		// Apply gameplay post process effects
		KFPC = KFPlayerController(Controller);
		if( KFPC != none && DmgType != None )
		{
			KFPC.PlayScreenHitFX(DmgType, true);

			// assumes all types with radial impulse (which include husk fireball) are "explosive"
			if( Dmgtype.default.RadialDamageImpulse > 0 )
			{
				KFPC.PlayEarRingEffect( ByteToFloat(HitFxRadialInfo.RadiusDamageScale) );
			}
		}

		// Allow weapon to play additional special effects
		if( MyKFWeapon != None )
		{
			MyKFWeapon.PlayTakeHitEffects(HitFxInfo.HitLocation, HitFxInstigator);
		}
	}

	if( WorldInfo.TimeSeconds > PainSoundLastPlayedTime + PainSoundCoolDown )
	{
		if( PainSoundChanceOnHit >= (1.f - FRand()) )
		{
			SoundGroupArch.PlayPainSound( self );
			PainSoundLastPlayedTime = WorldInfo.TimeSeconds;
		}
	}

	Super.PlayTakeHitEffects( HitDirection, HitLocation );

	// Add some death ragdoll velocity
	if( DmgType != none )
	{
		// If TornOff hasn't been called yet on client, PlayDying now before hit reactions
		if ( bTearOff && !bPlayedDeath )
		{
			PlayDying(HitDamageType,TakeHitLocation);
		}

		if( bPlayedDeath )
		{
			HitZoneIndex = HitFxInfo.HitBoneIndex;
			if ( HitZoneIndex != 255 )	// INDEX_None -> 255 after byte conversion
			{
				HitBoneName = HitZones[HitZoneIndex].BoneName;
			}

			if( HitBoneName != '' )
			{
				RBBoneName = GetRBBoneFromBoneName( HitBoneName );
			}

			ApplyRagdollImpulse( DmgType, HitLocation, HitDirection, RBBoneName, 1.f );
		}
	}
}

/** Makes an impact sound and leaves a blood splat upon body impact */
simulated event RigidBodyCollision( PrimitiveComponent HitComponent, PrimitiveComponent OtherComponent,
					const out CollisionImpactData RigidCollisionData, int ContactIndex )
{
	local int i;
	local KFGoreManager GoreManager;
	local RigidBodyContactInfo ContactInfo;

	GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);

	if( GoreManager != none && (WorldInfo.TimeSeconds - LastGibCollisionTime) > GoreManager.GetTimeBetweenGibBloodSplats() )
	{
		LastGibCollisionTime = WorldInfo.TimeSeconds;

		if ( OtherComponent != none && OtherComponent.Owner != none && !OtherComponent.Owner.IsA('KFPawn') ) // Skip pawn-on-pawn collisions
	    {
		    SoundGroupArch.PlayRigidBodyCollisionSound( self, RigidCollisionData.ContactInfos[ContactIndex].ContactPosition );

		    for( i=0; i<RigidCollisionData.ContactInfos.length; i++ )
			{
				ContactInfo = RigidCollisionData.ContactInfos[i];
				GoreManager.LeaveAPersistentBloodSplat(ContactInfo.ContactPosition, -ContactInfo.ContactNormal);
				//DrawDebugCoordinateSystem(ContactInfo.ContactPosition, rotator(-ContactInfo.ContactNormal), 10, true);
			}
	    }
	}
}

/** Called clientside by PlayTakeHitEffects on the Instigating Pawn */
simulated function PlayDamageInstigatorHitEffects(KFPawn Victim)
{
	local float BloodParamIncrementValue;

	Super.PlayDamageInstigatorHitEffects(Victim);

	if ( WeaponAttachment != None )
	{
		if ( WorldInfo.NetMode != NM_DedicatedServer &&
			VSizeSq(Victim.Location - Location) < BattleBloodRangeSq )
		{
			BloodParamIncrementValue = RandRange(0.01, 0.05);

			// Amplify blood for killing blows
			if ( WorldInfo.TimeSeconds == Victim.TimeOfDeath )
			{
				BloodParamIncrementValue *= 2.f;
			}

			// Apply blood to body and face
			AddBattleBlood(BloodParamIncrementValue);

			// Apply blood to weapon attachment
			WeaponAttachment.AddBattleBlood(BloodParamIncrementValue);
		}
	}
}

/** Ambient battle blood added to chracter body and face as they kill Zeds */
simulated function AddBattleBlood(float InBattleBloodIncrementvalue)
{
	// Accumulate the blood param value of the pawn
	BattleBloodParamValue = FMax(BattleBloodParamValue + InBattleBloodIncrementvalue, MinBattleBloodValue);

	if ( BodyMIC != None && HeadMIC != None)
	{
		BodyMIC.SetScalarParameterValue(BattleBloodParamName, BattleBloodParamValue);
		HeadMIC.SetScalarParameterValue(BattleBloodParamName, BattleBloodParamValue);
	}
}

simulated function SetNightVisionLight(bool bEnabled)
{
}

/** Clean up function to terminate any effects on death */
simulated function TerminateEffectsOnDeath()
{
	Super.TerminateEffectsOnDeath();

	if ( Flashlight != None )
	{
		Flashlight.OwnerDied();
	}
}

/*********************************************************************************************
* @name Damage/Death Methods
********************************************************************************************* */

/* PlayDying() is called on server/standalone game when killed
and also on net client when pawn gets bTearOff set to true (and bPlayedDeath is false)
*/
simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
	local class<KFDamageType> KFDT;

	super.PlayDying(DamageType, HitLoc);

	// If ragdoll was successful
	if ( Physics == PHYS_RigidBody && !Mesh.HiddenGame )
	{
		KFDT = class<KFDamageType>(DamageType);

		// Spawn a blood pool
		SetTimer(BloodPoolDelay,false,nameof(LeaveBloodPool));

		// Death material effect (damage type based)
		PlayDamageMaterialEffects(
			(KFDT != None && KFDT.default.DeathMaterialEffectParamName != '') ? KFDT.default.DeathMaterialEffectParamName : default.DeathMaterialEffectParamName,
			(KFDT != None && KFDT.default.DeathMaterialEffectDuration != 0.f) ? KFDT.default.DeathMaterialEffectDuration : default.DeathMaterialEffectDuration
			);
	}

	// Kill our world health indicator when we die
	if( PlayerPartyInfo != none )
	{
		PlayerPartyInfo.Close(true);
		PlayerPartyInfo = none;
	}
}

function bool Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
	local int WaveNum;
	local KFPlayerController KFPC;

	if( Super.Died( Killer, DamageType, HitLocation ) )
	{
		if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayPlayerDeathDialog( self );

		WaveNum = KFGameReplicationInfo( WorldInfo.GRI ).WaveNum;
		KFPC = KFPlayerController(Controller);

		if( KFPC != none )
		{
    		if( KFPC.PWRI.DeathStreakEndWave != (WaveNum-1) )
    		{
    			// reset start of streak
    			KFPC.PWRI.DeathStreakStartWave = WaveNum;
    		}

    		// update end of streak
    		KFPC.PWRI.DeathStreakEndWave = WaveNum;

    		if( Killer.Pawn != none )
    		{
    			KFPC.PWRI.ClassKilledByLastWave = class< KFPawn_Monster >( Killer.Pawn.Class );
    		}
    		//clear any interaction messages
    		KFPC.ReceiveLocalizedMessage(class'KFLocalMessage_Interaction', IMT_None);
		}

		//ProTip: No, you do not have a PRI anymore.
		return true;
	}

	return false;
}

simulated function BroadcastDeathMessage( Controller Killer )
{
	if( Killer != none && Killer.IsA('KFAIController') )
	{
		BroadcastLocalizedMessage( class'KFLocalMessage_Game', KMT_Killed, PlayerReplicationInfo, none, Killer.Class );
	}
	else
	{
		BroadcastLocalizedMessage( class'KFLocalMessage_Game', KMT_Suicide, PlayerReplicationInfo );
	}
}

/* AdjustDamage()
adjust damage based on inventory, other attributes
*/
function AdjustDamage(out int InDamage, out vector Momentum, Controller InstigatedBy, vector HitLocation, class<DamageType> DamageType, TraceHitInfo HitInfo, Actor DamageCauser)
{
	local KFPerk MyKFPerk, MyMedicPerk;
	local float TempDamage;
	local bool bHasSacrificeSkill;

	if (bLogTakeDamage) LogInternal(self @ GetFuncName()@"Adjusted Damage BEFORE =" @ InDamage);
	super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);

	MyKFPerk = GetPerk();
	if( MyKFPerk != none )
	{
		MyKFPerk.ModifyDamageTaken( InDamage, DamageType, InstigatedBy );
		MyMedicPerk = KFPerk_FieldMedic(MyKFPerk);
		bHasSacrificeSkill = MyKFPerk.ShouldSacrifice();
	}

	TempDamage = InDamage;

	if( TempDamage > 0 && bHasMedicVaccinationBuff )
	{
		if( MyMedicPerk != none )
		{
			class'KFPerk_FieldMedic'.static.ModifyVaccinationDamage( TempDamage, DamageType, MyMedicPerk.GetLevel() );
		}
		else
		{
			class'KFPerk_FieldMedic'.static.ModifyVaccinationDamage( TempDamage, DamageType );
		}

		TempDamage = TempDamage < 1.f ? 1.f : TempDamage;
	}

	if( TempDamage > 0 && class'KFPerk_Demolitionist'.static.IsDmgTypeExplosiveResistable( DamageType ) && HasExplosiveResistance() )
	{
		class'KFPerk_Demolitionist'.static.ModifyExplosiveDamage( TempDamage );
		TempDamage = TempDamage < 1.f ? 1.f : TempDamage;
	}

	InDamage = Round( TempDamage );

	// Reduce damage based on you current armor integrity
	if( InDamage > 0 && Armor > 0 && DamageType.default.bArmorStops )
	{
		ShieldAbsorb( InDamage );
	}

	if( bHasSacrificeSkill && Health >= 5 && Health - InDamage < 5 )
	{
		Health = InDamage + 5;
		SacrificeExplode();
	}

	if (bLogTakeDamage) LogInternal(self @ GetFuncName()@"Adjusted Damage AFTER =" @ InDamage);

	// (Cheats) Dont allow dying if demigod mode is enabled
	if ( Controller != none &&  Controller.bDemiGodMode && InDamage >= Health )
	{
		// Increase your health when you are going to get killed... so the amount of damage in semigod is not always just 1...
		// Some ais do different reactions depending on the amount of damaged caused in the last x seconds...
		if ( Health == 1 )
		{
			Health = HealthMax * 0.25f;
		}
		if( InDamage >= Health )
		{
			InDamage = Health - 1;
		}
	}
}

event TakeDamage(int Damage, Controller InstigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local int ActualDamageTaken, OldHealth;
	//local KFGameInfo KFGI;
	local KFPlayerReplicationInfo KFPRI;
	local KFAIController_ZedBoss InstigatedByBoss;

	OldHealth = Health;

    if (bLogTakeDamage) LogInternal(GetFuncName()@"Damage BEFORE ="$Damage$" DamageType: "$DamageType$" DamageCauser: "$DamageCauser);

	Super.TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
	ActualDamageTaken = OldHealth - Health;

	if (bLogTakeDamage) LogInternal(GetFuncName()@"Damage AFTER ="$ActualDamageTaken$" DamageType: "$DamageType$" DamageCauser: "$DamageCauser);

	if( ActualDamageTaken > 0 && IsAliveAndWell() )
	{
		if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayPlayerDamageDialog( self, DamageType, ActualDamageTaken );

		InstigatedByBoss = KFAIController_ZedBoss( InstigatedBy );
		if( InstigatedByBoss != none )
		{
			InstigatedByBoss.PlayDamagePlayerDialog( DamageType );
		}
		if(KFPlayerController(Controller)!= none && KFPlayerController(Controller).MatchStats != none ){KFPlayerController(Controller).MatchStats.RecordIntStat(class'EphemeralMatchStats'.const.MATCH_EVENT_DAMAGE_TAKEN,ActualDamageTaken);};
	}

	KFPRI = KFPlayerReplicationInfo( PlayerReplicationInfo );
	if( KFPRI != none )
	{
		KFPRI.PlayerHealth = Health;
	}

	ResetIdleStartTime();
}

/*********************************************************************************************
* @name Perks
********************************************************************************************* */

function SacrificeExplode()
{
	local KFExplosionActorReplicated ExploActor;
	local GameExplosion	ExplosionTemplate;
	local KFPerk_Demolitionist DemoPerk;

	if ( Role < ROLE_Authority )
	{
		return;
	}

	DemoPerk = KFPerk_Demolitionist(GetPerk());

	// explode using the given template
	ExploActor = Spawn(class'KFExplosionActorReplicated', self,, Location,,, true);
	if( ExploActor != None )
	{
		ExploActor.InstigatorController = Controller;
		ExploActor.Instigator = self;

		ExplosionTemplate = class'KFPerk_Demolitionist'.static.GetSacrificeExplosionTemplate();
		ExplosionTemplate.MyDamageType = class'KFPerk_Demolitionist'.static.GetSacrificeDamageTypeClass();
		ExplosionTemplate.bIgnoreInstigator = true;
		ExploActor.Explode( ExplosionTemplate );

		if( DemoPerk != none )
		{
			DemoPerk.NotifyPerkSacrificeExploded();
		}
	}
}

/**
 * @brief Checks if we are close to a demo player with explosivbe resistance skill enabled
 *
 * @return true if close and enabled
 */
protected function bool HasExplosiveResistance()
{
	local KFPawn_Human TestPawn;
	local KFPerk TestPawnPerk;

	foreach WorldInfo.Allpawns( class'KFPawn_Human', TestPawn, Location, class'KFPerk_Demolitionist'.static.GetExplosiveResistanceRadius() )
	{
		TestPawnPerk = TestPawn.GetPerk();
		if( TestPawnPerk != none && TestPawnPerk.IsSharedExplosiveResistaneActive() )
		{
			return true;
		}
	}

	return false;
}

function float GetPerkDoTScaler( optional Controller InstigatedBy, optional class<KFDamageType> KFDT )
{
	local KFPerk MyPerk;
	local float DoTScaler;

	DoTScaler = 1.f;

	MyPerk = GetPerk();
	if( MyPerk != none )
	{
		MyPerk.ModifyBloatBileDoT( DoTScaler );
	}

	return DoTScaler;
}

simulated function SetSupportBarrageBuff(bool bEnabled)
{
	if( Role == ROLE_Authority )
	{
		bHasSupportBarrageBuff = bEnabled;
		bForceNetUpdate = true;
	}

	if( IsLocallyControlled() )
	{
		NotifyBuffUpdate(class'KFPerk_Support'.default.PerkSkills[ESupportBarrage].IconPath, bHasSupportBarrageBuff);
	}
}

simulated function SetSupportSafeguardBuff(bool bEnabled)
{
	if( Role == ROLE_Authority )
	{
		bHasSupportSafeguardBuff = bEnabled;
		bForceNetUpdate = true;
	}

	if( IsLocallyControlled() )
	{
		NotifyBuffUpdate(class'KFPerk_Support'.default.PerkSkills[ESupportSafeGuard].IconPath, bHasSupportSafeguardBuff);
	}
}

simulated function EnableMedicVaccinationBuff()
{
	if( Role == ROLE_Authority )
	{
		bHasMedicVaccinationBuff = true;
		SetTimer(class'KFPerk_FieldMedic'.static.GetVaccinationDuration(), false, nameOf( DisableMedicVaccinationBuff ));
		bForceNetUpdate = true;
	}

	if( IsLocallyControlled() )
	{
		NotifyBuffUpdate(class'KFPerk_FieldMedic'.Default.PerkSkills[EMedicVaccination].IconPath, bHasMedicVaccinationBuff);
	}
}

simulated function DisableMedicVaccinationBuff()
{
	if( Role == ROLE_Authority )
	{
		bHasMedicVaccinationBuff = false;
		bForceNetUpdate = true;
	}

	if( IsLocallyControlled() )
	{
		NotifyBuffUpdate(class'KFPerk_FieldMedic'.Default.PerkSkills[EMedicVaccination].IconPath, bHasMedicVaccinationBuff);
	}
}

simulated function NotifyBuffUpdate(string BuffIconPath, bool bAddItem)
{
	local KFPlayerController KFPC;

	if( IsLocallyControlled() )
	{
		if( bAddItem )
		{
			// prevent adding duplicates
			if(ActiveSkillIconPaths.Find(BuffIconPath) == INDEX_NONE)
			{
				ActiveSkillIconPaths.AddItem(BuffIconPath);
			}
		}
		else
		{
			ActiveSkillIconPaths.RemoveItem(BuffIconPath);
		}

		KFPC = KFPlayerController(Controller);

		KFPC.MyGFxHUD.PlayerStatusContainer.ShowActiveIndicators(ActiveSkillIconPaths);
	}
}

simulated function ClearBuffIcons()
{
	local KFPlayerController KFPC;
	if( IsLocallyControlled() )
	{
		ActiveSkillIconPaths.length = 0;
		KFPC = KFPlayerController(Controller);

		KFPC.MyGFxHUD.PlayerStatusContainer.ShowActiveIndicators(ActiveSkillIconPaths);
	}
}

function array<string> GetUpdatedSkillIndicators()
{
	bBuffsUpdated = false;
	return ActiveSkillIconPaths;
}

/*********************************************************************************************
* @name Objectives
********************************************************************************************* */
function AddHealerToObjective(controller Healer)
{
	local KFGameReplicationInfo KFGRI;

	if( Healer.PlayerReplicationInfo != none  )
	{
		KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
		if( KFGRI != none && KFGRI.CurrentObjective != none )
    	{
    		KFGRI.CurrentObjective.NewHealer(Healer.PlayerReplicationInfo);
    	}
	}
}

/*********************************************************************************************
* @name Dialog
********************************************************************************************* */
delegate OnFinishedDialog( const out DialogResponseInfo ResponseInfo );

// tip: HandleDialogResponse gets called whenever a dialog AkEvent is stopped, even if it's stopped early (interrupted)
function HandleDialogResponse()
{
	if( Role == ROLE_Authority )
	{
		if( OnFinishedDialog != none )
		{
			if( DlgRespInfo.RespondingToID < 0 || DlgRespInfo.RespondingToID == CurrDialogEventID )
			{
				OnFinishedDialog( DlgRespInfo );
			}
			OnFinishedDialog = none;
		}
	}
}

function SetDialogResponseDelegate( KFPawn Responder, delegate<OnFinishedDialog> ResponseDelegate, optional int ResponseID = -1, optional int RespondingToID = -1 )
{
	DlgRespInfo.Speaker = Responder;
	DlgRespInfo.RespondingToPawn = self;
	DlgRespInfo.EventID = ResponseID;
	DlgRespInfo.RespondingToID = RespondingToID;
	OnFinishedDialog = ResponseDelegate;
}

function UpdateDoshCaught( int Amount, PlayerReplicationInfo Tosser )
{
	if( (WorldInfo.TimeSeconds - LastDoshCaughtTime) < 0.75 && LastDoshCaughtGiver == Tosser ) // @todo: make interval editable
    {
        DoshCaughtStreakAmt += Amount;
    }
    else
    {
        DoshCaughtStreakAmt = Amount;
        LastDoshCaughtGiver = Tosser;
    }

    LastDoshCaughtTime = WorldInfo.TimeSeconds;

    SetTimer( 0.75, false, nameof(CaughtDoshDialogTimer) ); // @todo: make interval editable
}

function CaughtDoshDialogTimer()
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayDoshCaughtDialog( self );
	ClearTimer( nameof(CaughtDoshDialogTimer) );
}

function UpdateKillStreak()
{
	if( LastPainTime < LastZedKilledTime )
	{
		ZedsKilledStreakAmt++;
	}
	else
	{
		ZedsKilledStreakAmt = 1;
	}

	LastZedKilledTime = WorldInfo.TimeSeconds;
}

function UpdateDamageTakenStreak( int Amount, float Interval )
{
	if( (WorldInfo.TimeSeconds - LastDamageTakenStreakStartTime) < Interval )
	{
		DamageTakenStreakAmt += Amount;
	}
	else
	{
		DamageTakenStreakAmt = Amount;
		LastDamageTakenStreakStartTime = WorldInfo.TimeSeconds;
	}
}

function UpdateContinuousDamage( KFPawn_Monster DamagedZed, float MaxHitInterval )
{
	if( DamagedZed.LastHitBy != Controller || (WorldInfo.TimeSeconds - DamagedZed.LastPainTime) > MaxHitInterval )
	{
		InitialContinousDamageTime = WorldInfo.TimeSeconds;
	}
}

function ResetIdleStartTime()
{
	local PlayerController PC;
	local KFPawn_Human KFPH;
	local float DistanceToTeammateSq, MaxResetDistanceSq;

	IdleStartTime = WorldInfo.TimeSeconds;

	// reset idle start time for nearby teammates
	// (i.e. consider them no longer idle if they are close enough to you to need to pay attention and not ramble on about the weather)
	MaxResetDistanceSq = 3000 * 3000;
	foreach WorldInfo.AllControllers(Class'PlayerController', PC)
	{
		if( PC == Controller )
		{
			continue;
		}

		KFPH = KFPawn_Human( PC.Pawn );
		if( KFPH == none || !KFPH.IsAliveAndWell() )
		{
			continue;
		}

		DistanceToTeammateSq = VSizeSq( KFPH.Location - Location );
		if( DistanceToTeammateSq <= MaxResetDistanceSq )
		{
			KFPH.IdleStartTime = WorldInfo.TimeSeconds;
		}
	}
}

function float TimeSpentIdling()
{
	return (WorldInfo.TimeSeconds - IdleStartTime);
}

function PlayTraderDialog( AkEvent DialogEvent )
{
	TraderDialogAkComponent.PlayEvent( DialogEvent );
}

function StopTraderDialog()
{
	if( TraderDialogAkComponent == none )
	{
		return;
	}

	TraderDialogAkComponent.StopEvents();
}

/*********************************************************************************************
* @name Movement Methods
********************************************************************************************* */

function SetSprinting(bool bNewSprintStatus)
{
	if( bIsSprinting || bNewSprintStatus )
	{
		if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlaySprintPantingDialog( self, bNewSprintStatus );
	}

	super.SetSprinting( bNewSprintStatus );
}

function bool DoJump( bool bUpdating )
{
	if( super.DoJump(bUpdating) )
	{
		if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayJumpDialog( self );
		return true;
	}

	return false;
}

/*********************************************************************************************
* @name Torch (aka Flashlight)
********************************************************************************************* */

/**
* Toggle the flashlight on and off
*/
simulated function ToggleFlashlight()
{
	local bool bIsEnabled;

	if( IsLocallyControlled() && !bPlayedDeath )
	{
		bIsEnabled = (Flashlight != None && Flashlight.bEnabled);
		SetFlashlight(!bIsEnabled, true);
	}
}

/**
 * Called when there is a need to change the weapon attachment (either via
 * replication or locally if controlled.
 */
simulated function SetFlashlight(bool bEnabled, optional bool bReplicate)
{
	bFlashlightOn = bEnabled;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	// So that we don't have to handle viewmode switching just
	// always use the 1st person flashlight for the local player
	if ( !bPlayedDeath )
	{
		Flashlight.SetEnabled(bEnabled);
	}

	// replicate for third person flashlight
	if( bReplicate && Role == ROLE_AutonomousProxy )
	{
		ServerSetFlashlight(bFlashlightOn);
	}
}

/**
 * Communicates the stage of the third person flashlight is on for clients
 * and servers
 *
 * @param bFlashlightOn whether the flashlight is on or off
 */
reliable server private function ServerSetFlashlight(bool bEnabled)
{
	bFlashlightOn = bEnabled;

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		SetFlashlight(bEnabled, false);
	}
}

/** Called when BatteryCharge hits zero */
simulated event NotifyOutOfBattery()
{
	local KFPlayerController KFPC;

	if( IsLocallyControlled() )
	{
		KFPC = KFPlayerController(Controller);
		if( KFPC.bNightVisionActive )
		{
			KFPC.SetNightVision(false);
		}
		if( bFlashlightOn )
		{
			SetFlashlight(false, true);
		}
	}
}

/** First person weapon visility */
simulated function SetFirstPersonVisibility(bool bWeaponVisible)
{
	Super.SetFirstPersonVisibility(bWeaponVisible);

	if ( Flashlight != None )
	{
		Flashlight.SetFirstPersonVisibility(bWeaponVisible);
	}
}

/** Set the lighting channels on all the appropriate pawn meshes */
simulated function SetMeshLightingChannels(LightingChannelContainer NewLightingChannels)
{
	Super.SetMeshLightingChannels(NewLightingChannels);

	if ( Flashlight != None )
	{
		Flashlight.SetLightingChannels(NewLightingChannels);
	}
}

/*********************************************************************************************
 * @state Dying
********************************************************************************************* */

State Dying
{
	simulated function bool CalcCamera( float fDeltaTime, out vector out_CamLoc, out rotator out_CamRot, out float out_FOV )
	{
		local PlayerController PC;
		local matrix HeadMatrix;
		local vector HeadLoc;
		local rotator HeadRot;

		PC = GetALocalPlayerController();

		if( PC.UsingFirstPersonCamera() && !PC.IsSpectating() && PC.ViewTarget == self )
		{
			HeadMatrix = Mesh.GetBoneMatrix( Mesh.MatchRefBone('head') );
			HeadLoc = MatrixGetOrigin( HeadMatrix );
			HeadMatrix = MakeRotationMatrix( rot(0, -16383, 16383) ) * HeadMatrix;
			HeadRot = MatrixGetRotator( HeadMatrix );
			//DrawDebugLine(HeadLoc, HeadLoc + 100*vector(HeadRot), 0, 255, 0);

			out_CamLoc = VInterpTo( out_CamLoc, HeadLoc, fDeltaTime, 10.0 );
			out_CamRot = RInterpTo( out_CamRot, HeadRot, fDeltaTime, 10.0 );

			return true;
		}

		return Global.CalcCamera( fDeltaTime, out_CamLoc, out_CamRot, out_FOV );
	}
}

/*********************************************************************************************
 AEWESOMEHUD(TM)
********************************************************************************************* */
native simulated function		DrawDoors(Canvas Canvas);

/** Hook called from HUD actor. Gives access to HUD and Canvas */
simulated function DrawHUD( HUD H )
{
	local Canvas Canvas;
	local KFGameReplicationInfo KFGRI;

	Super.DrawHUD(H);

	if( !H.bShowHUD )
	{
		return;
	}

	// Slightly AWESOMEHUD(TM)
	Canvas = H.Canvas;
	if( Canvas != none )
	{
		DrawDoors(Canvas);

		KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
		if( KFGRI != none )
		{
			if( KFGRI.CurrentObjective != none && IsAliveAndWell() )
			{
				KFGRI.CurrentObjective.DrawObjectiveHUD(Canvas);
			}
		}

		Canvas.EnableStencilTest(true);
		DrawPerkHUD(Canvas);
		Canvas.EnableStencilTest(false);
	}
}

function DrawPerkHUD(Canvas C)
{
	local KFPerk Perk;

	Perk = GetPerk();
	if( Perk != None )
	{
		Perk.DrawSpecialPerkHUD(C);
	}
}

/**
 * list important Pawn variables on canvas.	 HUD will call DisplayDebug() on the current ViewTarget when
 * the ShowDebug exec is used
 *
 * @param	HUD		- HUD with canvas to draw on
 * @input	out_YL		- Height of the current font
 * @input	out_YPos	- Y position on Canvas. out_YPos += out_YL, gives position to draw text for next debug line.
 */
simulated function DisplayDebug(HUD HUD, out float out_YL, out float out_YPos)
{
	local Canvas	Canvas;

	Super.DisplayDebug(HUD, out_YL, out_YPos);
	Canvas = HUD.Canvas;

	if (HUD.ShouldDisplayDebug('movement'))
	{
		Canvas.SetDrawColor(0,255,255);

		Canvas.DrawText("EncumbranceMod:" @ KFInventoryManager(InvManager).GetEncumbranceSpeedMod());
		out_YPos += out_YL;
		Canvas.SetPos(4,out_YPos);

		Canvas.DrawText("HealthSpeedMod:" @ 1.f - LowHealthSpeedPenalty, FALSE);
		out_YPos += out_YL;
		Canvas.SetPos(4,out_YPos);
	}
}

defaultproperties
{
   MaxArmor=100
   IntegrityLevel_High=75
   IntegrityLevel_Medium=50
   IntegrityLevel_Low=25
   DeathFaceAnims(0)="Death_V1"
   DeathFaceAnims(1)="Death_V2"
   DeathFaceAnims(2)="Death_V3"
   BloodPoolDelay=2.000000
   PainSoundChanceOnHit=1.000000
   PainSoundCoolDown=1.000000
   FlashLightTemplate=KFFlashlightAttachment'KFGame.Default__KFPawn_Human:FlashLight_0'
   BatteryDrainRate=2.000000
   BatteryRechargeRate=4.000000
   BatteryCharge=100.000000
   NVGBatteryDrainRate=4.000000
   HealthRegenRate=0.100000
   HealerRewardScaler=60.000000
   ArmorAbsorbModifier_High=0.750000
   ArmorAbsorbModifier_Medium=0.650000
   ArmorAbsorbModifier_Low=0.550000
   Begin Object Class=AkComponent Name=TraderDialogAkSoundComponent
      BoneName="Root"
      bForceOcclusionUpdateInterval=True
      Name="TraderDialogAkSoundComponent"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   TraderDialogAkComponent=TraderDialogAkSoundComponent
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bEnableAimOffset=True
   HitZones(0)=(ZoneName="head",BoneName="head")
   HitZones(1)=(ZoneName="neck",BoneName="neck")
   HitZones(2)=(ZoneName="chest",BoneName="Spine2")
   HitZones(3)=(ZoneName="heart",BoneName="Spine2")
   HitZones(4)=(ZoneName="lupperarm",BoneName="LeftArm")
   HitZones(5)=(ZoneName="lforearm",BoneName="LeftForearm")
   HitZones(6)=(ZoneName="lhand",BoneName="LeftForearm")
   HitZones(7)=(ZoneName="rupperarm",BoneName="RightArm")
   HitZones(8)=(ZoneName="rforearm",BoneName="RightForearm")
   HitZones(9)=(ZoneName="rhand",BoneName="RightForearm")
   HitZones(10)=(ZoneName="stomach",BoneName="Spine1")
   HitZones(11)=(ZoneName="abdomen",BoneName="Hips")
   HitZones(12)=(ZoneName="lthigh",BoneName="LeftUpLeg")
   HitZones(13)=(ZoneName="lcalf",BoneName="LeftLeg")
   HitZones(14)=(ZoneName="lfoot",BoneName="LeftLeg")
   HitZones(15)=(ZoneName="rthigh",BoneName="RightUpLeg")
   HitZones(16)=(ZoneName="rcalf",BoneName="RightLeg")
   HitZones(17)=(ZoneName="rfoot",BoneName="RightLeg")
   BattleBloodParamName="Scalar_Blood_Contrast"
   MinBattleBloodValue=0.200000
   BattleBloodRangeSq=40000.000000
   DeathMaterialEffectParamName="scalar_dead"
   DeathMaterialEffectDuration=0.100000
   Begin Object Class=KFPawnAfflictions Name=Afflictions_0 Archetype=KFPawnAfflictions'KFGame.Default__KFPawn:Afflictions_0'
      StackingAffl(0)=(Cooldown=5.000000,DissipationRate=0.500000)
      StackingAffl(1)=(Threshhold=0.200000,Duration=1.000000,DissipationRate=0.200000)
      bNoBurnedMatBeforeDeath=True
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFPawnAfflictions'KFGame.Default__KFPawn:Afflictions_0'
   End Object
   AfflictionHandler=KFPawnAfflictions'KFGame.Default__KFPawn_Human:Afflictions_0'
   TeammateCollisionRadiusPercent=0.500000
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'KFGame.Default__KFPawn:SpecialMoveHandler_0'
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
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'KFGame.Default__KFPawn_Human:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_1'
      BoneName="Spine1"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_0'
      BoneName="RW_Weapon"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_Human:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn:FootstepAkSoundComponent'
      BoneName="Root"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn:DialogAkSoundComponent'
      BoneName="head"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   bCanPickupInventory=True
   CrouchRadius=40.000000
   GroundSpeed=383.000000
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:KFPawnSkeletalMeshComponent'
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
      Translation=(X=0.000000,Y=0.000000,Z=-86.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=4000.000000
      bAllowPerObjectShadows=True
      bAllowPerObjectShadowBatching=True
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPawn:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=40.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPawn:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPawn:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPawn:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPawn:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPawn:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   Components(8)=TraderDialogAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_Human"
   ObjectArchetype=KFPawn'KFGame.Default__KFPawn'
}
