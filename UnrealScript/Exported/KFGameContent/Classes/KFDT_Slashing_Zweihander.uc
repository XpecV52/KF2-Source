//=============================================================================
// KFDT_Slashing_Zweihander
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_Zweihander extends KFDT_Slashing
	abstract
	hidedropdown;

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
	return true;
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
	 	if( InHitZoneName == 'chest' || InHitZoneName == 'abdomen'  || InHitZoneName == 'stomach' )
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

/** Allows the damage type to modify the impulse when a specified hit zone is dismembered */
static simulated function ModifyDismembermentHitImpulse(KFPawn_Monster InPawn, name InHitZoneName, vector HitDirection,
												out vector OutImpulseDir, out vector OutParentImpulseDir,
												out float OutImpulseScale, out float OutParentImpulseScale)
{
	local EPawnOctant SlashDir;

	SlashDir = GetLastSlashDirection(InPawn, HitDirection);

    // Apply upward impulse on decapitation from a clean horizontal slash
	if( InHitZoneName == 'head' &&
		( SlashDir == DIR_Left || SlashDir == DIR_Right ) )
	{
		OutImpulseDir += 10*vect(0,0,1);
		OutImpulseDir = Normal(OutImpulseDir);
		OutParentImpulseScale = 0.f;
	}
	// Do not apply any impulse on split in half from a vertical slash
	else if( (InHitZoneName == 'head' || InHitZoneName == 'chest' ) &&
			 ( SlashDir == DIR_Forward || SlashDir == DIR_Backward) )
	{
		OutImpulseScale = 0.f;
		OutParentImpulseScale = 0.f;
	}
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Zweihander'
   StumblePower=250.000000
   MeleeHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   KDamageImpulse=1500.000000
   KDeathVel=375.000000
   KDeathUpKick=200.000000
   Name="Default__KFDT_Slashing_Zweihander"
   ObjectArchetype=KFDT_Slashing'KFGame.Default__KFDT_Slashing'
}
