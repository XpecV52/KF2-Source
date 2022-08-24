/*******************************************************************************
 * KFPlayerController_WeeklySurvival generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPlayerController_WeeklySurvival extends KFPlayerController
    native(Controller)
    config(Game)
    hidecategories(Navigation);

var bool bUsingPermanentZedTime;
var float ZedTimeRadius;
var float ZedTimeBossRadius;
var float ZedTimeHeight;
var float ZedRecheckTime;

replication
{
     if(bNetDirty)
        ZedTimeBossRadius, ZedTimeHeight, 
        ZedTimeRadius, bUsingPermanentZedTime;
}

function EnterZedTime()
{
    local bool bNewResult;
    local KFPawn KFP;
    local KFPerk MyPerk;

    if(bUsingPermanentZedTime)
    {
        SetTimer(ZedRecheckTime, false, 'RecheckZedTime');
        KFP = KFPawn(Pawn);
        if(KFP != none)
        {
            bNewResult = IsAffectedByZedTime();
            if(KFP.bUnaffectedByZedTime == bNewResult)
            {
                MyPerk = GetPerk();
                if(MyPerk != none)
                {
                    MyPerk.NotifyZedTimeStarted();
                }
                KFP.bUnaffectedByZedTime = !bNewResult;
                if(KFP.bUnaffectedByZedTime)
                {
                    StartPartialZedTimeSightCounter();
                }
                ClientEnterZedTime(KFP.bUnaffectedByZedTime);
            }
        }        
    }
    else
    {
        super.EnterZedTime();
    }
}

function RecheckZedTime()
{
    EnterZedTime();
}

defaultproperties
{
    StingerAkComponent=AkComponent'Default__KFPlayerController_WeeklySurvival.AkComponent'
    AmplificationLightTemplate=PointLightComponent'Default__KFPlayerController_WeeklySurvival.AmplificationLightTemplate'
    NVGLightTemplate=PointLightComponent'Default__KFPlayerController_WeeklySurvival.NVGLightTemplate'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPlayerController_WeeklySurvival.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPlayerController_WeeklySurvival.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFPlayerController_WeeklySurvival.AkComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPlayerController_WeeklySurvival.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}