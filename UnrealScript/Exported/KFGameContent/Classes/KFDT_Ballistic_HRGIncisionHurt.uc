//=============================================================================
// KFDT_Ballistic_HRGIncisionHurt
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_HRGIncisionHurt extends KFDT_Ballistic_Rifle
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

/** Called when damage is dealt to apply additional damage type (e.g. Damage Over Time) */
static function ApplySecondaryDamage( KFPawn Victim, int DamageTaken, optional Controller InstigatedBy )
{
    local class<KFDamageType> ToxicDT;

    ToxicDT = class'KFDT_Ballistic_Assault_Medic'.static.GetMedicToxicDmgType( DamageTaken, InstigatedBy );
    if ( ToxicDT != None )
    {
        Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, ToxicDT);
    }
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRGIncision'
   EffectGroup=FXG_Electricity
   GoreDamageGroup=DGT_Shotgun
   StumblePower=400.000000
   GunHitPower=300.000000
   MeleeHitPower=100.000000
   EMPPower=50.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   KDamageImpulse=7500.000000
   KDeathVel=500.000000
   KDeathUpKick=2500.000000
   Name="Default__KFDT_Ballistic_HRGIncisionHurt"
   ObjectArchetype=KFDT_Ballistic_Rifle'kfgamecontent.Default__KFDT_Ballistic_Rifle'
}
