//=============================================================================
// KFGameInfo_BossTest
//=============================================================================
// Test GameInfo that starts on Boss wave and logs damage
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Jeff Robinson
//=============================================================================
class KFGameInfo_BossTest extends KFGameInfo_Survival;

/** Starts a new Wave */
function StartWave()
{
	WaveNum = WaveMax - 1;
	super.StartWave();
}

/*	Use reduce damage for friendly fire, etc. */
function ReduceDamage(out int Damage, Pawn Injured, Controller InstigatedBy, vector HitLocation, out vector Momentum, class<DamageType> DamageType, Actor DamageCauser)
{
	local string VictimName, InstigatorName;
	local int InDamage;

	InDamage = Damage;

	Super.ReduceDamage(Damage, Injured, InstigatedBy, HitLocation, Momentum, DamageType, DamageCauser);

	if( KFPawn_Human(Injured) != none ) 
	{
		VictimName = Injured.PlayerReplicationInfo.PlayerName;
	}
	else 
	{
		VictimName = string(Injured.Name);
	}

	if( PlayerController(InstigatedBy) != none )
	{
		InstigatorName = InstigatedBy.PlayerReplicationInfo.PlayerName;
	}
	else
	{
		InstigatorName = string(InstigatedBy.Pawn.Name);
	}
	
	`log("QA - "$Damage$"("$InDamage$")"@DamageType$" to "$VictimName$"("$Injured.Controller$","$Injured.GetTeamNum()$") by "$InstigatorName$"("$InstigatedBy$","$InstigatedBy.GetTeamNum()$"); DamageCauser: "$DamageCauser$"; FFScale: "$FriendlyFireScale);

	if( Damage > 0 && KFPawn_Human(Injured) != none && KFPawn_Human(InstigatedBy.Pawn) != none )
	{
		scripttrace();
	}
}