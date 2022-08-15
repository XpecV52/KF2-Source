/*******************************************************************************
 * SeqAct_GameCrowdPopulationManagerToggle generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SeqAct_GameCrowdPopulationManagerToggle extends SequenceAction
    native
    forcescriptorder(true)
    hidecategories(Object)
    implements(GameCrowdSpawnerInterface);

/** Percentage of max population to immediately spawn when the population manager is toggled on (without respecting visibility checks).  Range is 0.0 to 1.0 */
var() float WarmupPopulationPct;
/** List of Archetypes of agents for pop manager to spawn when this is toggled on */
var() GameCrowd_ListOfAgents CrowdAgentList;
/** If true, clear old population manager archetype list rather than adding to it with this toggle action's CrowdAgentList. */
var() bool bClearOldArchetypes;
/** Whether to enable the light environment on crowd members. */
var() bool bEnableCrowdLightEnvironment;
/** Whether agents from this spawner should cast shadows */
var() bool bCastShadows;
var bool bFillPotentialSpawnPoints;
/** If true, force obstacle checking for all agents from this spawner */
var() bool bForceObstacleChecking;
/** If true, force nav mesh navigation for all agents from this spawner */
var() bool bForceNavMeshPathing;
var bool bIndividualSpawner;
/** The maximum number of agents alive at one time. */
var() int MaxAgents;
/** How many agents per second will be spawned at the target actor(s). */
var() float SpawnRate;
var LightingChannelContainer AgentLightingChannel;
/** Max distance allowed for spawns */
var() float MaxSpawnDist;
var float MinBehindSpawnDist;
var array<GameCrowdDestination> PotentialSpawnPoints;
var float AgentWarmupTime;
var() int NumAgentsToTickPerFrame;
var array<GameCrowdAgent> LastSpawnedList;

static event int GetObjClassVersion()
{
    return super(SequenceObject).GetObjClassVersion() + 5;
}

event FillCrowdSpawnInfoItem(out CrowdSpawnInfoItem out_Item, GameCrowdPopulationManager PopMgr)
{
    local int I;

    if(bClearOldArchetypes)
    {
        out_Item.AgentArchetypes.Length = 0;
    }
    if(CrowdAgentList != none)
    {
        I = 0;
        J0x46:

        if(I < CrowdAgentList.ListOfAgents.Length)
        {
            out_Item.AgentArchetypes[out_Item.AgentArchetypes.Length] = CrowdAgentList.ListOfAgents[I];
            ++ I;
            goto J0x46;
        }
    }
    out_Item.MaxSpawnDist = MaxSpawnDist;
    out_Item.MaxSpawnDistSq = out_Item.MaxSpawnDist * out_Item.MaxSpawnDist;
    out_Item.MinBehindSpawnDist = FMin(MinBehindSpawnDist, out_Item.MaxSpawnDist * 0.0625);
    out_Item.MinBehindSpawnDistSq = out_Item.MinBehindSpawnDist * out_Item.MinBehindSpawnDist;
    out_Item.AgentWarmupTime = AgentWarmupTime;
    out_Item.bCastShadows = bCastShadows;
    out_Item.bEnableCrowdLightEnvironment = bEnableCrowdLightEnvironment;
    out_Item.SpawnRate = SpawnRate;
    out_Item.SpawnNum = MaxAgents;
    if(Class'Engine'.static.IsSplitScreen())
    {
        out_Item.SpawnNum = int(PopMgr.SplitScreenNumReduction * float(out_Item.SpawnNum));
    }
    out_Item.bForceObstacleChecking = bForceObstacleChecking;
    out_Item.bForceNavMeshPathing = bForceNavMeshPathing;
    out_Item.NumAgentsToTickPerFrame = NumAgentsToTickPerFrame;
    out_Item.LastAgentTickedIndex = -1;
    if(bFillPotentialSpawnPoints)
    {
        out_Item.PotentialSpawnPoints = PotentialSpawnPoints;
    }
}

function float GetMaxSpawnDist()
{
    return MaxSpawnDist;
}

function AgentDestroyed(GameCrowdAgent Agent)
{
    local GameCrowdPopulationManager PopMgr;

    PopMgr = GameCrowdPopulationManager(Agent.WorldInfo.PopulationManager);
    if(PopMgr != none)
    {
        PopMgr.AgentDestroyed(Agent);
    }
}

defaultproperties
{
    bForceNavMeshPathing=true
    MaxAgents=700
    SpawnRate=50
    AgentLightingChannel=(bInitialized=true,BSP=false,Static=false,Dynamic=false,CompositeDynamic=false,Skybox=false,Unnamed_1=false,Unnamed_2=false,Unnamed_3=false,Unnamed_4=false,Unnamed_5=false,Unnamed_6=false,Cinematic_1=false,Cinematic_2=false,Cinematic_3=false,Cinematic_4=false,Cinematic_5=false,Cinematic_6=false,Cinematic_7=false,Cinematic_8=false,Cinematic_9=false,Cinematic_10=false,Gameplay_1=false,Gameplay_2=false,Gameplay_3=false,Gameplay_4=false,Crowd=true,Indoor=false,Outdoor=false)
    MaxSpawnDist=10000
    MinBehindSpawnDist=5000
    AgentWarmupTime=2
    NumAgentsToTickPerFrame=10
    bCallHandler=false
    bLatentExecution=true
    InputLinks(0)=(LinkDesc="Start",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks(1)=(LinkDesc="Stop",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks(2)=(LinkDesc="Warmup",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks(3)=(LinkDesc="Kill Agents",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks(4)=(LinkDesc="Stop & Kill",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks(0)=(Links=none,LinkDesc="Spawned",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_ObjectList',LinkedVariables=none,LinkDesc="Spawned List",LinkVar=None,PropertyName=LastSpawnedList,bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=1,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Population Manager Toggle"
    ObjCategory="Crowd"
}