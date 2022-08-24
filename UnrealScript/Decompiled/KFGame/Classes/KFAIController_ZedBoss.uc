/*******************************************************************************
 * KFAIController_ZedBoss generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAIController_ZedBoss extends KFAIController_Monster
    native(AI)
    config(AI)
    hidecategories(Navigation);

var bool bSummonedThisPhase;

event EnemyNotVisible()
{
    local KFPawn_Human HumanEnemy;

    if((WorldInfo.TimeSeconds - EnemyVisibilityTime) > 1)
    {
        HumanEnemy = KFPawn_Human(Enemy);
        if(HumanEnemy != none)
        {
            if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
            {
                KFGameInfo(WorldInfo.Game).DialogManager.PlayLoseSightOfBossDialog(MyKFPawn, HumanEnemy);
            }
            if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
            {
                KFGameInfo(WorldInfo.Game).DialogManager.PlayBossLoseSightOfDialog(MyKFPawn, HumanEnemy);
            }
        }
    }
    super(KFAIController).EnemyNotVisible();
}

event bool SetEnemy(Pawn NewEnemy)
{
    if(NewEnemy != Enemy)
    {
        if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
        {
            KFGameInfo(WorldInfo.Game).DialogManager.PlayBossChallengeDialog(MyKFPawn);
        }
    }
    return super(KFAIController).SetEnemy(NewEnemy);
}

function UpdateSprintFrustration(optional byte bForceFrustrationState)
{
    bForceFrustrationState = 255;
}

function PlayDamagePlayerDialog(class<DamageType> dmgType);

function DebugNextPhase();

function Timer_StopSummoningZeds()
{
    MyKFGameInfo.SpawnManager.StopSummoningBossMinions();
}

function EnterZedVictoryState()
{
    ClearMovementInfo();
    if(CommandList != none)
    {
        AbortCommand(CommandList);
    }
    DisableMeleeRangeEventProbing();
    ChangeEnemy(none);
    MyKFPawn.SetSprinting(false);
    LockPawnRotationTo(MyKFPawn.Rotation);
    MyKFPawn.SetRemoteViewPitch(0);
    if(MyKFPawn.IsDoingSpecialMove())
    {
        MyKFPawn.EndSpecialMove();
    }
    GotoState('ZedVictory', 'Begin');
}

event Possess(Pawn inPawn, bool bVehicleTransition)
{
    local KFGameReplicationInfo KFGRI;

    super.Possess(inPawn, bVehicleTransition);
    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if((KFGRI != none) && KFGRI.WaveNum >= KFGRI.WaveMax)
    {
        Class'AICommand_BossTheatrics'.static.DoTheatrics(self, 0);
    }
}

state ZedVictory
{Begin:

    Sleep(0.1);
    if(MyKFPawn != none)
    {
        Class'AICommand_BossTheatrics'.static.DoTheatrics(self, 1, -1);
    }
    stop;        
}

defaultproperties
{
    bCanTeleportCloser=false
    FrustrationThreshold=0
    LowIntensityAttackCooldown=0
}