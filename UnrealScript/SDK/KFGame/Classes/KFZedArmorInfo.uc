//=============================================================================
// KFZedArmorInfo
//=============================================================================
// Handles armor info that can be attached to any Zed.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFZedArmorInfo extends Object
	within KFPawn_Monster
	config(Game)
	abstract;

const HeadBit = 0x1;
const FrontBit = 0x2;
const BackBit = 0x4;

//List of hit zones that can apply damage to armor before the body
var array<name> ArmorHitzoneNames;

//List of zones of armor (similar to hit zones)
struct ArmorZoneInfo
{
	var() name ArmorZoneName;   //Name of the armor zone
	var() name SocketName;		//Name of the socket explosion FX play from
	var() int ArmorHealth;      //Amount of health the armor absorbs before it blows off
	var() int ArmorHealthMax;
	var() ParticleSystem ExplosionTemplate;
	var() AkEvent ExplosionSFXTemplate;
	var() Texture2D ZoneIcon;
};
var array<ArmorZoneInfo> ArmorZones;
var float ArmorScale;

function InitArmor()
{
	local KFGameInfo KFGI;
	local float HealthMod;
	local float HeadHealthMod;
	local int i;

	KFGI = KFGameInfo(WorldInfo.Game);
	if (KFGI != None)
	{
		HealthMod = 1.f;
		HeadHealthMod = 1.f;
		KFGI.DifficultyInfo.GetAIHealthModifier(Outer, KFGI.GetModifiedGameDifficulty(), KFGI.GetLivingPlayerCount(), HealthMod, HeadHealthMod);

		for (i = 0; i < ArmorZones.Length; ++i)
		{
			ArmorZones[i].ArmorHealth *= HealthMod;
			ArmorZones[i].ArmorHealthMax = ArmorZones[i].ArmorHealth;
			RepArmorPct[i] = FloatToByte(float(ArmorZones[i].ArmorHealth) / float(ArmorZones[i].ArmorHealthMax));
		}
	}
	UpdateArmorUI();
}

function ExplodeArmor(int ArmorZoneIdx, name ArmorZoneName);
simulated function UpdateArmorPieces();
simulated function UpdateArmorUI();

function SetShieldScale(float InScale)
{
	local int i;

	ArmorScale = InScale;
	for (i = 0; i < ArmorZones.Length; ++i)
	{
		ArmorZones[i].ArmorHealth *= InScale;
		ArmorZones[i].ArmorHealthMax = ArmorZones[i].ArmorHealth;
		RepArmorPct[i] = FloatToByte(float(ArmorZones[i].ArmorHealth) / float(ArmorZones[i].ArmorHealthMax));
	}
}


function AdjustBoneDamage(out int InDamage, name BoneName, Vector DamagerSource)
{
	local int HitZoneIdx, ArmorZoneIdx;
	local name IntendedArmorZoneName;
	local int ArmorDamage;

	//Make sure this hit zone is valid
	HitZoneIdx = HitZones.Find('ZoneName', BoneName);
	if (HitZoneIdx >= 0)
	{
		//Lookup valid armor zone if it exists in our armor list
		ArmorZoneIdx = INDEX_NONE;
		if (ArmorHitzoneNames.Find(HitZones[HitZoneIdx].ZoneName) != INDEX_NONE)
		{
			IntendedArmorZoneName = '';
			switch (HitZones[HitZoneIdx].ZoneName)
			{
			case 'head':
				IntendedArmorZoneName = 'head';
				break;
			default:
				IntendedArmorZoneName = (DamagerSource - Location) dot Vector(Rotation) > 0 ? 'front' : 'back';
				break;
			}
			ArmorZoneIdx = ArmorZones.Find('ArmorZoneName', IntendedArmorZoneName);
		}

		//Now that we have an armor zone, do adjustments
		if (ArmorZoneIdx != INDEX_NONE && ArmorZones[ArmorZoneIdx].ArmorHealth > 0)
		{
			ArmorDamage = Clamp(InDamage, 0, ArmorZones[ArmorZoneIdx].ArmorHealth);
			InDamage -= ArmorDamage;
			ArmorZones[ArmorZoneIdx].ArmorHealth -= ArmorDamage;
			RepArmorPct[ArmorZoneIdx] = FloatToByte(float(ArmorZones[ArmorZoneIdx].ArmorHealth) / float(ArmorZones[ArmorZoneIdx].ArmorHealthMax));

			if (ArmorZones[ArmorZoneIdx].ArmorHealth <= 0)
			{
				ZedExplodeArmor(ArmorZoneIdx, IntendedArmorZoneName);
			}
			UpdateArmorUI();
		}
	}
}

function AdjustNonBoneDamage(out int InDamage)
{
	local int ValidArmorZones;
	local int ArmorReduction, ArmorRemainder, ArmorDamage;
	local int Idx;

	//Find amount of valid hit zones to split damage
	ValidArmorZones = 0;
	for (Idx = 0; Idx < ArmorZones.Length; ++Idx)
	{
		if (ArmorZones[Idx].ArmorHealth > 0)
		{
			ValidArmorZones++;
		}
	}

	//Have some damageable zones around
	if (ValidArmorZones > 0)
	{
		//Store the initial split.  Any modulo remainder will go in a holding value until later
		//		We'll just lazily pull any remainder from surviving armor zones
		ArmorReduction = InDamage / ValidArmorZones;
		ArmorRemainder = InDamage % ValidArmorZones;

		//First pass to do split damage
		for (Idx = 0; Idx < ArmorZones.Length; ++Idx)
		{
			if (ArmorZones[Idx].ArmorHealth > 0)
			{
				//Find final damage value to this zone and add some into the remainder if needed
				ArmorDamage = Clamp(ArmorReduction, 0, ArmorZones[Idx].ArmorHealth);
				if (ArmorDamage < ArmorReduction)
				{
					ArmorRemainder += ArmorReduction - ArmorDamage;
				}

				//Update, do FX, etc.
				InDamage -= ArmorDamage;
				ArmorZones[Idx].ArmorHealth -= ArmorDamage;
				RepArmorPct[Idx] = FloatToByte(float(ArmorZones[Idx].ArmorHealth) / float(ArmorZones[Idx].ArmorHealthMax));

				if (ArmorZones[Idx].ArmorHealth <= 0)
				{
					ZedExplodeArmor(Idx, ArmorZones[Idx].ArmorZoneName);
				}
				UpdateArmorUI();
			}
		}

		//Second pass to clear out remaining damage.  If anything remains after this step, it'll go out via the InDamage variable
		for (Idx = 0; Idx < ArmorZones.Length && ArmorRemainder > 0; ++Idx)
		{
			if (ArmorZones[Idx].ArmorHealth > 0)
			{
				ArmorDamage = Clamp(ArmorRemainder, 0, ArmorZones[Idx].ArmorHealth);

				//Update, do FX, etc.
				InDamage -= ArmorDamage;
				ArmorRemainder -= ArmorDamage;
				ArmorZones[Idx].ArmorHealth -= ArmorDamage;
				RepArmorPct[Idx] = FloatToByte(float(ArmorZones[Idx].ArmorHealth) / float(ArmorZones[Idx].ArmorHealthMax));

				if (ArmorZones[Idx].ArmorHealth <= 0)
				{
					ZedExplodeArmor(Idx, ArmorZones[Idx].ArmorZoneName);
				}
				UpdateArmorUI();
			}
		}
	}
}

defaultproperties
{

}

