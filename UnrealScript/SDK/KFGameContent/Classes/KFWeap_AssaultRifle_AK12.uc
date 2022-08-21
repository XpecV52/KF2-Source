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
            (BurstAmount==default.BurstAmount || `IsInZedTime(self))) )
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
    	if ( !bPlayingLoopingFireSnd && BurstAmount > 1 && `NotInZedTime(self) )
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
    // FOV
    MeshFOV=75
	MeshIronSightFOV=33
    PlayerIronSightFOV=70

	// Depth of field
	DOF_FG_FocalRadius=50
	DOF_FG_SharpRadius=0
	DOF_FG_MinBlurSize=0
	DOF_FG_MaxNearBlurSize=3
	DOF_FG_ExpFalloff=1

	// Zooming/Position
	PlayerViewOffset=(X=2.0,Y=8,Z=-3)

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WEP_1P_AK12_MESH.Wep_1stP_AK12_Rig'
		AnimSets(0)=AnimSet'WEP_1P_AK12_ANIM.Wep_1st_AK12_Anim'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_AK12_Pickup'
	End Object

	AttachmentArchetype=KFWeaponAttachment'WEP_AK12_ARCH.Wep_AK12_3P'

	// Ammo
	MagazineCapacity[0]=30
	MaxSpareAmmo[0]=330
	InitialSpareMags[0]=3
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=200
	minRecoilPitch=150
	maxRecoilYaw=175
	minRecoilYaw=-125
	RecoilRate=0.085
	BurstFireRecoilRate=0.05
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	BurstFireRecoilModifier=0.8
	IronSightMeshFOVCompensationScale=2.5

	// Inventory / Grouping
	InventorySize=6
	GroupPriority=75
	WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_AK12'

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	FireInterval(DEFAULT_FIREMODE)=+0.1 // 600 RPM
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_AK12'
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_AK12'
	Spread(DEFAULT_FIREMODE)=0.0085
	InstantHitDamage(DEFAULT_FIREMODE)=35.0
	FireOffset=(X=32,Y=4.0,Z=-5)

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletBurst'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponBurstFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	FireInterval(ALTFIRE_FIREMODE)=+0.06 // 1000 RPM
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_AK12'
	InstantHitDamage(ALTFIRE_FIREMODE)=35.0
	Spread(ALTFIRE_FIREMODE)=0.0085
	BurstAmount=3
	BurstFire2RdAnim=Shoot_Burst2
	BurstFire3RdAnim=Shoot_Burst
	BurstFire2RdSightedAnim=Shoot_Burst2_Iron
	BurstFire3RdSightedAnim=Shoot_Burst_Iron
	WeaponFire2RdSnd=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_2RdBurst_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_2RdBurst_S')
	WeaponFire3RdSnd=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Burst_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Burst_S')

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'WEP_AK12_ARCH.Wep_AK12_MuzzleFlash'
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_S')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Single_S')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'


	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_End_M', FirstPersonCue=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Fire_Loop_End_S')
	SingleFireMode=ALTFIRE_FIREMODE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	AssociatedPerkClass=class'KFPerk_Commando'
}



