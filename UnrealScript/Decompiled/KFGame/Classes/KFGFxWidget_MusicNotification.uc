/*******************************************************************************
 * KFGFxWidget_MusicNotification generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWidget_MusicNotification extends GFxObject within GFxMoviePlayer;

function InitializeHUD();

function ShowSongInfo(string SongInfoString)
{
    local KFGameEngine KFEngine;

    KFEngine = KFGameEngine(Class'Engine'.static.GetEngine());
    if((KFEngine != none) && KFEngine.MusicVolumeMultiplier > float(0))
    {
        SetString("text", SongInfoString);
    }
}
