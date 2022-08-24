//=============================================================================
// KFGameInfo_WeeklySurvival
//=============================================================================
// Weekly variant of KFPC for handling per-player functionality related to
//      different weekly survival modes.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//  - Dan Weiss
//=============================================================================

class KFPlayerController_WeeklySurvival extends KFPlayerController
    native(Controller)
    dependson(EphemeralMatchStats);

/** If the game mode is using permanent zed time, our handling of some functionality is a bit different */
var bool bUsingPermanentZedTime;

/** One of our changes is a radius/height check for relevant actors that would normally kick us out of zed time */
var float ZedTimeRadius;
var float ZedTimeBossRadius;
var float ZedTimeHeight;

/** How often to check for coming out of partial zed time if bUsingPermanentZedTime is on */
var float ZedRecheckTime;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
    if (bNetDirty)
        bUsingPermanentZedTime, ZedTimeRadius, ZedTimeBossRadius, ZedTimeHeight;
}

function EnterZedTime()
{
    local bool bNewResult;
    local KFPawn KFP;
    local KFPerk MyPerk;

    //Some hax around rechecking zed time if we're in permanent mode.  Do the recheck on IsAffectedByZedTime
    //      and only call client function if the result is different than before.
    if (bUsingPermanentZedTime)
    {
        SetTimer(ZedRecheckTime, false, 'RecheckZedTime');

        KFP = KFPawn(Pawn);
        if (KFP != none)
        {
            bNewResult = IsAffectedByZedTime();
            //== because Pawn is !PC result
            if (KFP.bUnaffectedByZedTime == bNewResult)
            {
                MyPerk = GetPerk();
                if ( MyPerk != none )
                {
                    MyPerk.NotifyZedTimeStarted();
                }

                KFP.bUnaffectedByZedTime = !bNewResult;

                if ( KFP.bUnaffectedByZedTime )
                {
                    StartPartialZedTimeSightCounter();
                }

                // Call the client
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
   Begin Object Class=AkComponent Name=AkComponent_0 Archetype=AkComponent'KFGame.Default__KFPlayerController:AkComponent_0'
      BoneName="Root"
      bStopWhenOwnerDestroyed=True
      Name="AkComponent_0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPlayerController:AkComponent_0'
   End Object
   StingerAkComponent=AkComponent_0
   Begin Object Class=PointLightComponent Name=AmplificationLightTemplate_0 Archetype=PointLightComponent'KFGame.Default__KFPlayerController:AmplificationLightTemplate_0'
      Radius=200.000000
      bAIIgnoreLuminosity=True
      Brightness=0.020000
      CastShadows=False
      CastStaticShadows=False
      bDisableSpecular=True
      LightingChannels=(Outdoor=True)
      Name="AmplificationLightTemplate_0"
      ObjectArchetype=PointLightComponent'KFGame.Default__KFPlayerController:AmplificationLightTemplate_0'
   End Object
   AmplificationLightTemplate=AmplificationLightTemplate_0
   Begin Object Class=PointLightComponent Name=NVGLightTemplate_0 Archetype=PointLightComponent'KFGame.Default__KFPlayerController:NVGLightTemplate_0'
      Radius=800.000000
      bAIIgnoreLuminosity=True
      Brightness=0.050000
      bEnabled=False
      CastShadows=False
      CastStaticShadows=False
      bDisableSpecular=True
      LightingChannels=(Outdoor=True)
      Name="NVGLightTemplate_0"
      ObjectArchetype=PointLightComponent'KFGame.Default__KFPlayerController:NVGLightTemplate_0'
   End Object
   NVGLightTemplate=NVGLightTemplate_0
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPlayerController:CollisionCylinder'
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPlayerController:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AkComponent_0
   CollisionComponent=CollisionCylinder
   Name="Default__KFPlayerController_WeeklySurvival"
   ObjectArchetype=KFPlayerController'KFGame.Default__KFPlayerController'
}
