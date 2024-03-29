/*******************************************************************************
 * KFGFxWorld_C4Screen generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWorld_C4Screen extends KFGFxMoviePlayer_World
    config(UI);

var int CurrentMaxCharges;
var int CurrenActiveCharges;

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
    switch(WidgetName)
    {
        case 'c4WorldMC':
            if(MainComponent == none)
            {
                MainComponent = Widget;
            }
            break;
        default:
            break;
    }
    return true;
}

function SetMaxCharges(int MaxCharges)
{
    if(MainComponent != none)
    {
        MainComponent.SetInt("maxCharges", MaxCharges);
    }
}

function SetActiveCharges(int ActiveCharges)
{
    if(MainComponent != none)
    {
        MainComponent.SetInt("activeCharges", ActiveCharges);
    }
}

function SetReadOut(string NewValue)
{
    if(MainComponent != none)
    {
        MainComponent.SetString("readOut", NewValue);
    }
}

defaultproperties
{
    MovieInfo=SwfMovie'UI_World.C4World'
    RenderTexture=TextureRenderTarget2D'Wep_1P_C4_TEX.Wep_1stP_C4_Screen_R2T'
}