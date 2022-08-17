//=============================================================================
// KFPerk_Monster
//=============================================================================
// The perk class used when playing versus as Zed
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// Christian "schneidzekk" Schneider
//=============================================================================
class KFPerk_Monster extends KFPerk
	native;

	
simulated event PostBeginPlay()
{
	local KFPlayerReplicationInfo KFPRI;
	
	super.PostBeginPlay();

	KFPRI = KFPlayerReplicationInfo(KFPlayerController(Owner).PlayerReplicationInfo);
	if( KFPRI != none )
	{
		KFPRI.bExtraFireRange = false;
		KFPRI.bSplashActive = false;
		KFPRI.bNukeActive = false;
		KFPRI.bConcussiveActive = false;
		KFPRI.bPerkCanSupply = false;
	}
}

defaultproperties
{
   PerkBuildStatID=-1
   Name="Default__KFPerk_Monster"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
