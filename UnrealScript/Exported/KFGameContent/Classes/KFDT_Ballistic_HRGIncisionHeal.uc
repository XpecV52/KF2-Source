//=============================================================================
// KFDT_Ballistic_HRGIncisionHeal
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_HRGIncisionHeal extends KFDT_Dart_Toxic
	abstract;

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

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
    switch ( InHitZoneName )
	{
		case 'lupperarm':
		case 'rupperarm':
		case 'chest':
		case 'heart':
	 		return true;
	}

	return false;
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRGIncision'
   GoreDamageGroup=DGT_Shotgun
   DoT_Duration=0.000000
   DoT_Interval=0.000000
   DoT_DamageScale=0.000000
   KnockdownPower=100.000000
   StumblePower=200.000000
   GunHitPower=200.000000
   MeleeHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   KDamageImpulse=4500.000000
   KDeathVel=500.000000
   KDeathUpKick=1500.000000
   Name="Default__KFDT_Ballistic_HRGIncisionHeal"
   ObjectArchetype=KFDT_Dart_Toxic'kfgamecontent.Default__KFDT_Dart_Toxic'
}
