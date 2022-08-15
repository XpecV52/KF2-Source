//=============================================================================
// KFDT_Slashing_EvisceratorProj
//=============================================================================
// Damage type for projectiles fired from the Eviscerator
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Slashing_EvisceratorProj extends KFDT_Slashing
	abstract
	hidedropdown;






































	















#linenumber 15;






/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
	return true;
}

/** @return The slast type from the HitFxInfo. This returns a 8-way slash info. */
static simulated function EPawnOctant GetLastSlashDirection(KFPawn_Monster InPawn, vector HitDirection)
{
	local vector SlashPlaneNormal;
	local rotator InstigatorRotation;
	local vector InstigatorFaceDir, InstigatorRightDir;
	local float UpDotSlash, RightDotSlash, UpThresholdValue;

	if( InPawn != none )
	{
		HitDirection = Normal(HitDirection);
		InstigatorRotation = InPawn.GetBaseAimRotation();
		InstigatorFaceDir = GetRotatorAxis(InstigatorRotation, 0);
		InstigatorRightDir = GetRotatorAxis(InstigatorRotation, 1);

		// Cross the face direction of the instigator with the hit direction to find
		// the normal to the "slashing" plane
		SlashPlaneNormal = Normal(InstigatorFaceDir Cross HitDirection);

		// Dot the slash plane normal with the world up direction to figure out
		// the quadrant for the normal of the slash plane
		UpDotSlash = vect(0,0,1) Dot SlashPlaneNormal;
		UpThresholdValue = Abs(UpDotSlash);

		// Dot the slash plane normal with the instigator right to figure out
		// the direction of the slash
		RightDotSlash = InstigatorRightDir Dot SlashPlaneNormal;

		// Threshhold against the preset values to find out the type of slash. The sign (+ or -) of the
		// dot products are used to further classify the direction of the slash
		if( UpThresholdValue <= 1&& UpThresholdValue >= 0.94)
		{
			if( UpDotSlash > 0 )
				return DIR_Right;
			else
				return DIR_Left;
		}
		else if( UpThresholdValue <= 0.94&& UpThresholdValue >= 0.34)
		{
			if( UpDotSlash < 0 && RightDotSlash > 0 )
				return DIR_ForwardLeft;
			else if( UpDotSlash > 0 && RightDotSlash > 0 )
				return DIR_ForwardRight;
			else if( UpDotSlash > 0 && RightDotSlash < 0 )
				return DIR_BackwardRight;
			else if( UpDotSlash < 0 && RightDotSlash < 0 )
				return DIR_BackwardLeft;
		}
		else if( UpThresholdValue <= 0.34&& UpThresholdValue >= 0)
		{
			if( RightDotSlash > 0 )
				return DIR_Forward;
			else
				return DIR_Backward;
		}
	}

	return DIR_None;
}

/** Allows the damage type to map a hit zone to a different bone for dismemberment purposes */
static simulated function GetBoneToDismember(KFPawn_Monster InPawn, vector HitDirection, name InHitZoneName, out name OutBoneName)
{
	local EPawnOctant SlashDir;
	local MeleeSpecialDismembermentInfo SpecialDismembermentInfo;
	local KFCharacterInfo_Monster MonsterInfo;

	MonsterInfo = InPawn.GetCharacterMonsterInfo();
    if ( MonsterInfo != none )
	{
        // @todo fix struct copy
		SpecialDismembermentInfo = MonsterInfo.SpecialMeleeDismemberment;
	}

	SlashDir = GetLastSlashDirection(InPawn, HitDirection);

	if( SlashDir == DIR_Forward || SlashDir == DIR_Backward )
	{
		if( InHitZoneName == 'chest' || InHitZoneName == 'head' )
		{
			if( SpecialDismembermentInfo.bAllowVerticalSplit )
			{
				// Randomly pick the left or right shoulder bone and split the guy in half vertically
				OutBoneName = Rand(2) == 0 ? SpecialDismembermentInfo.LeftShoulderBoneName : SpecialDismembermentInfo.RightShoulderBoneName;
			}
		}
	}
	else if( SlashDir == DIR_Left || SlashDir == DIR_Right )
	{
	 	if( InHitZoneName == 'chest' || InHitZoneName == 'abdomen' || InHitZoneName == 'stomach')
	 	{
	 		if( SpecialDismembermentInfo.bAllowHorizontalSplit )
			{
	 			// Split the guy in half horizontally
				OutBoneName = SpecialDismembermentInfo.SpineBoneName;
			}
		}
	}
	else if( SlashDir == DIR_ForwardLeft || SlashDir == DIR_BackwardRight )
	{
		if( InHitZoneName == 'chest' )
		{
			if( SpecialDismembermentInfo.bAllowVerticalSplit )
			{
				OutBoneName = SpecialDismembermentInfo.RightShoulderBoneName;
			}
		}
		else if( InHitZoneName == 'head' )
		{
			if( SpecialDismembermentInfo.bAllowVerticalSplit )
			{
				// Use a random chance to decide whether to dismember the head or the shoulder constraints
				if( Rand(2) == 0 )
				{
					// ... and choose one of the shoulder constraints at random
					OutBoneName = SpecialDismembermentInfo.RightShoulderBoneName;
				}
			}
		}
	}
	else if( SlashDir == DIR_ForwardRight || SlashDir == DIR_BackwardLeft )
	{
		if( InHitZoneName == 'chest' )
		{
			if( SpecialDismembermentInfo.bAllowVerticalSplit )
			{
				OutBoneName = SpecialDismembermentInfo.LeftShoulderBoneName;
			}
		}
		else if( InHitZoneName == 'head' )
		{
			if( SpecialDismembermentInfo.bAllowVerticalSplit )
			{
				// Use a random chance to decide whether to dismember the head or the shoulder constraints
				if( Rand(2) == 0 )
				{
					OutBoneName = SpecialDismembermentInfo.LeftShoulderBoneName;
				}
			}
		}
	}
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Eviscerator'
   bNoInstigatorDamage=True
   StunPower=42
   StumblePower=60
   LegStumblePower=60
   GunHitPower=150
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   KDamageImpulse=1000.000000
   KDeathVel=135.000000
   KDeathUpKick=800.000000
   Name="Default__KFDT_Slashing_EvisceratorProj"
   ObjectArchetype=KFDT_Slashing'KFGame.Default__KFDT_Slashing'
}
