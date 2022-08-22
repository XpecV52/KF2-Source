/*******************************************************************************
 * AICommand_Base_Fleshpound generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_Base_Fleshpound extends AICommand_Base_Zed within KFAIController_ZedFleshpound
    native(AI);

function Pushed()
{
    Outer.EnableSeePlayer();
    super.Pushed();
}

function Popped()
{
    super(AICommand_Base_Combat).Popped();
}

function bool NotifyPlayerBecameVisible(Pawn VisiblePlayer)
{
    local float DistSqToEnemy, DistSqToVisiblePlayer;
    local int NumZedsTargetingEnemy, NumZedsTargetingVP;

    if((Outer.WorldInfo.TimeSeconds - Outer.LastSetEnemyTime) > Outer.MinTimeBetweenEnemyChanges)
    {
        if(((((VisiblePlayer != Outer.Enemy) && Outer.Enemy != none) && Outer.Enemy.IsAliveAndWell()) && VisiblePlayer.IsAliveAndWell()) && !Outer.bEnemyIsVisible)
        {
            DistSqToEnemy = VSizeSq(Outer.Enemy.Location - Outer.Pawn.Location);
            DistSqToVisiblePlayer = VSizeSq(VisiblePlayer.Location - Outer.Pawn.Location);
            if(DistSqToVisiblePlayer < DistSqToEnemy)
            {
                NumZedsTargetingEnemy = Outer.NumberOfZedsTargetingPawn(Outer.Enemy,, 700);
                NumZedsTargetingVP = Outer.NumberOfZedsTargetingPawn(VisiblePlayer,, 700);
                if(NumZedsTargetingEnemy > NumZedsTargetingVP)
                {
                    Outer.SetEnemy(VisiblePlayer);
                    return true;
                }
            }
        }
    }
    return false;
}

function NotifyEnemyChanged(optional Pawn OldEnemy)
{
    if(CachedChildCommand != none)
    {
        CachedChildCommand.NotifyEnemyChanged(OldEnemy);
    }
    if(Outer.LineOfSightTo(Outer.Enemy))
    {
        Outer.bSawEnemy = true;        
    }
    else
    {
        Outer.bSawEnemy = false;
    }
}

function bool NotifyCombatBehaviorChange(name BehaviorName, bool bEnabled)
{
    if((BehaviorName == 'Enraged') && bEnabled)
    {
        Outer.bReadyToBecomeEnraged = true;
        Outer.MyKFPawn.SetEnraged(true);
        if((Outer.LastTauntTime == float(0)) || (Outer.WorldInfo.TimeSeconds - Outer.LastTauntTime) > 260)
        {
            if(!Class'Engine'.static.GetEngine().bDisableAILogging)
            {
                Outer.AILog_Internal("Doing rage taunt at " $ string(Outer.Enemy), 'Charging');
            }
            Outer.AbortMovementCommands();
            Outer.AbortMovementPlugIns();
            Outer.DoRageTauntAt(KFPawn(Outer.Enemy));
            Outer.LastTauntTime = Outer.WorldInfo.TimeSeconds;
        }
        return true;        
    }
    else
    {
        if((BehaviorName == 'Enraged') && !bEnabled)
        {
            Outer.bReadyToBecomeEnraged = false;
            Outer.MyKFPawn.SetEnraged(false);
        }
    }
}
