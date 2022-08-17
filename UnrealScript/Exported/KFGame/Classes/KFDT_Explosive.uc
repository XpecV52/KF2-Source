//=============================================================================
// KFDT_Explosive
//=============================================================================
// Damage caused by air pressures normally associated with explosives
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Explosive extends KFDamageType
	abstract;







































































































































































































































































































































































	




	




	




	














	




	














	












































































#linenumber 13

/**
 * Modify the "amount of blood" for persistent blood splatters. For explosives,
 * we treat is as a critical hit no matter which hit zone it hit.
 */
static simulated function float GetBloodScale(float HitZoneDamageScale, bool bIsDismemberingHit, bool bWasObliterated)
{
 	return default.BloodScale * ((bIsDismemberingHit || bWasObliterated) ? 2.f : 1.f);
}

/**
 * Take the primary HitDirection and modify it to add more spread.
 * Additional hit directions are added per hit to create radial splats
 */
static simulated function AddBloodSpread(KFPawn_Monster InPawn, vector HitDirection, out array<vector> HitSpread, bool bIsDismeberingHit, bool bWasObliterated)
{
	local float PolarAngle, AzimuthAngle;
	local float RandomizedPolarAngle, RandomizedAzimuthAngle;
	local vector SampleDir;

	// Sample uniformly distributed directions around the hemisphere
	for( PolarAngle = Pi/2.f; PolarAngle > 0; PolarAngle -= Pi/4.f)
	{
		// Apply small bias to account for FP inaccuracy
		for( AzimuthAngle = 0.f; AzimuthAngle < 2*Pi - 0.01; AzimuthAngle += Pi/4.f )
		{
			// Apply small randomization (-15,15) degrees
			RandomizedPolarAngle = PolarAngle + (0.26 - RandRange(0,0.52));
			RandomizedAzimuthAngle = AzimuthAngle + (0.26 - RandRange(0,0.52));

			SampleDir.x = Sin(RandomizedPolarAngle)*Cos(RandomizedAzimuthAngle);
			SampleDir.y = Sin(RandomizedPolarAngle)*Sin(RandomizedAzimuthAngle);
			SampleDir.z = Cos(RandomizedPolarAngle);
			HitSpread.AddItem(SampleDir);
		}
	}

	// Add the vertically up direction. PolarAngle = 0
	HitSpread.AddItem(vect(0,0,1));

	// Trace down and apply blood on the ground if obliterated
	if( bWasObliterated )
	{
		// Apply small bias to account for FP inaccuracy
		for( AzimuthAngle = 0.f; AzimuthAngle < 2*Pi - 0.01; AzimuthAngle += Pi/2.f )
		{
			// Apply small randomization (-15,15) degrees
			RandomizedPolarAngle = 0.8 * Pi + (0.26 - RandRange(0,0.52));
			RandomizedAzimuthAngle = AzimuthAngle + (0.26 - RandRange(0,0.52));

			SampleDir.x = Sin(RandomizedPolarAngle)*Cos(RandomizedAzimuthAngle);
			SampleDir.y = Sin(RandomizedPolarAngle)*Sin(RandomizedAzimuthAngle);
			SampleDir.z = Cos(RandomizedPolarAngle);
			HitSpread.AddItem(SampleDir);
		}

		// Add the vertically down direction. PolarAngle = Pi
		HitSpread.AddItem(vect(0,0,-1));
	}
}

/** Returns ID of dialog event for killer to speak after killing a zed using this damage type */
static function int GetKillerDialogID()
{
	return 84;
}

/** Allows the damage type to map a hit zone to a different bone for dismemberment purposes. */
static simulated function GetBoneToDismember(KFPawn_Monster InPawn, vector HitDirection, name InHitZoneName, out name OutBoneName)
{
	local KFCharacterInfo_Monster MonsterInfo;

	MonsterInfo = InPawn.GetCharacterMonsterInfo();
    if ( MonsterInfo != none )
	{
		// Randomly pick the left or right shoulder to dismember
		if( InHitZoneName == 'chest')
		{
			OutBoneName = Rand(2) == 0 ? MonsterInfo.SpecialMeleeDismemberment.LeftShoulderBoneName : MonsterInfo.SpecialMeleeDismemberment.RightShoulderBoneName;
		}
	}
}

defaultproperties
{
   bShouldSpawnBloodSplat=True
   bCanGib=True
   bCanObliterate=True
   KnockdownPower=100
   StumblePower=150
   GoreDamageGroup=DGT_Explosive
   ObliterationHealthThreshold=-150
   ObliterationDamageThreshold=175
   bExtraMomentumZ=True
   KDamageImpulse=0.000000
   KDeathUpKick=250.000000
   RadialDamageImpulse=1500.000000
   Name="Default__KFDT_Explosive"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
