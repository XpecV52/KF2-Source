/*******************************************************************************
 * KFPerk_Monster generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPerk_Monster extends KFPerk
    native
    config(Game)
    hidecategories(Navigation,Movement,Collision);

simulated event PostBeginPlay()
{
    local KFPlayerReplicationInfo KFPRI;

    super(Actor).PostBeginPlay();
    KFPRI = KFPlayerReplicationInfo(KFPlayerController(Owner).PlayerReplicationInfo);
    if(KFPRI != none)
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
}