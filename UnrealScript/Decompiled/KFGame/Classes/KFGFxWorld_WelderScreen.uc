/*******************************************************************************
 * KFGFxWorld_WelderScreen generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWorld_WelderScreen extends KFGFxMoviePlayer_World
    config(UI);

var byte CurrentCharge;
var byte IntegrityPercentage;

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
    switch(WidgetName)
    {
        case 'welderMC':
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

function SetCharge(byte NewCharge)
{
    if(MainComponent != none)
    {
        MainComponent.ActionScriptVoid("SetCharge");
        CurrentCharge = NewCharge;
    }
}

function SetIntegrity(byte NewIntegrityPercentage)
{
    if(MainComponent != none)
    {
        MainComponent.ActionScriptVoid("SetIntegrity");
        IntegrityPercentage = NewIntegrityPercentage;
    }
}

defaultproperties
{
    MovieInfo=SwfMovie'UI_World.WelderWorld'
    RenderTexture=TextureRenderTarget2D'WEP_1P_Welder_TEX.Wep_1stP_Welder_Screen_R2T'
}