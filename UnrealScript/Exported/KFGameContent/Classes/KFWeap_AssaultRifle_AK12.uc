//=============================================================================
// KFWeap_AssaultRifle_AK12
//=============================================================================
// An AK12 Assault Rifle
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_AssaultRifle_AK12 extends KFWeap_RifleBase;

/** RecoilRate when firing in burst fire. */
var(Recoil) float BurstFireRecoilRate;
/** How much to scale recoil when firing in burst fire. */
var(Recoil) float BurstFireRecoilModifier;

// Standard
/** Animation to play when the weapon is fired  in burst mode with 2 rounds left */
var(Animations) const editconst	name	BurstFire2RdAnim;
/** Animation to play when the weapon is fired in burst fire mode for 3 rounds*/
var(Animations) const editconst	name	BurstFire3RdAnim;

// Iron Sights
/** Animation to play when the weapon is fired in burst mode with 2 rounds left */
var(Animations) const editconst	name	BurstFire2RdSightedAnim;
/** Animation to play when the weapon is fired in burst fire mode for 3 rounds*/
var(Animations) const editconst	name	BurstFire3RdSightedAnim;

/** Sound to play when the weapon is fired in burst mode with 2 rounds left  */
var(Sounds)	WeaponFireSndInfo	WeaponFire2RdSnd;
/** Sound to play when the weapon is fired in burst fire mode for 3 rounds */
var(Sounds)	WeaponFireSndInfo	WeaponFire3RdSnd;

/*********************************************************************************************
 * State WeaponBurstFiring
 * Fires a burst of bullets. Fire must be released between every shot.
 *********************************************************************************************/

simulated state WeaponBurstFiring
{
	simulated function BeginState(Name PrevStateName)
	{
		// Modify the recoil for burst fire
		RecoilRate=BurstFireRecoilRate;

		// Initialize recoil blend out settings
		if( RecoilRate > 0 && RecoilBlendOutRatio > 0 )
		{
			RecoilYawBlendOutRate = maxRecoilYaw/RecoilRate * RecoilBlendOutRatio;
			RecoilPitchBlendOutRate = maxRecoilPitch/RecoilRate * RecoilBlendOutRatio;
		}

		super.BeginState(PrevStateName);
	}


    /**
     * PlayFireEffects Is the root function that handles all of the effects associated with
     * a weapon.  This function creates the 1st person effects.  It should only be called
     * on a locally controlled player.
     */
    simulated function PlayFireEffects( byte FireModeNum, optional vector HitLocation )
    {
    	local name WeaponFireAnimName;

        // Only play the burst fire sound on the first shot as the sound includes additional shot sounds baked in
        if( FireModeNum != ALTFIRE_FIREMODE || (FireModeNum == ALTFIRE_FIREMODE &&
            (BurstAmount==default.BurstAmount || (self.WorldInfo.TimeDilation < 1.f))) )
        {
            PlayFiringSound(CurrentFireMode);
    	}

    	if( Instigator != none && Instigator.IsFirstPerson() )
    	{
    	    if ( !bPlayingLoopingFireAnim && (FireModeNum != ALTFIRE_FIREMODE || (FireModeNum == ALTFIRE_FIREMODE &&
                BurstAmount==default.BurstAmount)) )
    	    {
    		    WeaponFireAnimName = GetWeaponFireAnim(FireModeNum);

    		    if ( WeaponFireAnimName != '' )
    		    {
    			    PlayAnimation(WeaponFireAnimName, MySkelMesh.GetAnimLength(WeaponFireAnimName),,FireTweenTime);
    		    }
    	    }

    		HandleRecoil();

    	    ShakeView();

    	    // Start muzzle flash effect
    	    CauseMuzzleFlash(FireModeNum);
    	}
    }

    /** Overridden to include the BurstFireModifier*/
	simulated function ModifyRecoil( out float CurrentRecoilModifier )
	{
		super.ModifyRecoil( CurrentRecoilModifier );
		CurrentRecoilModifier *= BurstFireRecoilModifier;
	}

    /** Get name of the animation to play for PlayFireEffects. Overriden to play the right animation for the number of shots in the burst fire */
    simulated function name GetWeaponFireAnim(byte FireModeNum)
    {
    	if( BurstAmount == 3 )
        {
			if ( bUsingSights )
			{
				return BurstFire3RdSightedAnim;
			}
			return BurstFire3RdAnim;
		}
		else if( BurstAmount == 2 )
		{
			if ( bUsingSights )
			{
				return BurstFire2RdSightedAnim;
			}
			return BurstFire2RdAnim;
		}
		else
		{
			return super.GetWeaponFireAnim(FireModeNum);
		}
    }

    /**
     * Tells the weapon to play a firing sound (uses CurrentFireMode)
     */
    simulated function PlayFiringSound( byte FireModeNum )
    {
    	if ( !bPlayingLoopingFireSnd && BurstAmount > 1 && !(self.WorldInfo.TimeDilation < 1.f) )
    	{
    		MakeNoise(1.0, 'PlayerFiring');
            if( BurstAmount == 3 )
            {
            	WeaponPlayFireSound(WeaponFire3RdSnd.DefaultCue, WeaponFire3RdSnd.FirstPersonCue);
    		}
    		else if( BurstAmount == 2 )
    		{
            	WeaponPlayFireSound(WeaponFire2RdSnd.DefaultCue, WeaponFire2RdSnd.FirstPersonCue);
    		}
    	}
    	else
		{
			super.PlayFiringSound( FireModeNum );
		}
    }

    simulated event EndState( Name NextStateName )
	{
		// Set recoil settings back to normal
		RecoilRate=default.RecoilRate;

		// Initialize recoil blend out settings
		if( RecoilRate > 0 && RecoilBlendOutRatio > 0 )
		{
			RecoilYawBlendOutRate = maxRecoilYaw/RecoilRate * RecoilBlendOutRatio;
			RecoilPitchBlendOutRate = maxRecoilPitch/RecoilRate * RecoilBlendOutRatio;
		}
		
		Super.EndState(NextStateName);
	}
}

defaultproperties
{
   BurstFireRecoilRate=0.050000
   BurstFireRecoilModifier=0.800000
   BurstFire2RdAnim="Shoot_Burst2"
   BurstFire3RdAnim="Shoot_Burst"
   BurstFire2RdSightedAnim="Shoot_Burst2_Iron"
   BurstFire3RdSightedAnim="Shoot_Burst_Iron"
   WeaponFire2RdSnd=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_2RdBurst_M',FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_2RdBurst_S')
   WeaponFire3RdSnd=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Burst_M',FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Burst_S')
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletBurst'
   SingleFireMode=1
   BurstAmount=3
   InventorySize=6
   MagazineCapacity(0)=30
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   MeshFOV=75.000000
   MeshIronSightFOV=33.000000
   PlayerIronSightFOV=70.000000
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_AK12'
   MaxSpareAmmo(0)=330
   InitialSpareMags(0)=3
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_M',FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_S')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Single_M',FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Single_S')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_End_M',FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_End_S')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'
   PlayerViewOffset=(X=2.000000,Y=8.000000,Z=-3.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_AK12_ARCH.Wep_AK12_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_AK12:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_AK12_ARCH.Wep_AK12_MuzzleFlash'
   maxRecoilPitch=200
   minRecoilPitch=150
   maxRecoilYaw=175
   minRecoilYaw=-125
   RecoilRate=0.085000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   IronSightMeshFOVCompensationScale=2.500000
   AssociatedPerkClass=Class'KFGame.KFPerk_Commando'
   FiringStatesArray(1)="WeaponBurstFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   FireInterval(0)=0.100000
   FireInterval(1)=0.060000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.008500
   Spread(1)=0.008500
   InstantHitDamage(0)=35.000000
   InstantHitDamage(1)=35.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_AK12'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_AK12'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_AK12'
   FireOffset=(X=32.000000,Y=4.000000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_RifleBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_AK12_MESH.Wep_1stP_AK12_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_AK12_ANIM.Wep_1st_AK12_Anim'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_RifleBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Kalashnikov AK-12"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_AK12_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AssaultRifle_AK12"
   ObjectArchetype=KFWeap_RifleBase'KFGame.Default__KFWeap_RifleBase'
}
