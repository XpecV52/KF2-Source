/*******************************************************************************
 * KFTraderTrigger generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFTraderTrigger extends Trigger_PawnsOnly
    native
    config(Game)
    hidecategories(Navigation)
    implements(KFInterface_Usable);

/** reference to actor to play open/close animations */
var() SkeletalMeshActor TraderMeshActor;
/** Anim to play when trader is opened or closed (play reverse) */
var() name OpenAnimName;
/** Looping anim to play while trader is open */
var() name IdleLoopAnimName;
/** Sounds for Trader Pod */
var() AkEvent TraderOpenSound;
var() AkEvent TraderCloseSound;
var transient bool bOpened;
var config bool bLogTrader;
var const float DistanceOffNavMeshTheTragerIsAllowedToBe;

simulated function bool GetIsUsable(Pawn User)
{
    return bOpened;
}

function int GetInteractionIndex()
{
    return 4;
}

event Touch(Actor Other, PrimitiveComponent OtherComp, Vector HitLocation, Vector HitNormal)
{
    local Pawn P;

    if(bLogTrader)
    {
        LogInternal("KFTrigger_Trader::Touch! Trader:" @ string(self));
    }
    super(Trigger).Touch(Other, OtherComp, HitLocation, HitNormal);
    Class'KFPlayerController'.static.UpdateInteractionMessages(Other);
    P = Pawn(Other);
    if(P != none)
    {
        Class'KFTraderDialogManager'.static.PlayApproachTraderDialog(P.Controller);
    }
}

event UnTouch(Actor Other)
{
    super(Actor).UnTouch(Other);
    Class'KFPlayerController'.static.UpdateInteractionMessages(Other);
}

function bool UsedBy(Pawn User)
{
    local KFPawn_Human KFPH;
    local KFPlayerController KFPC;

    if(bLogTrader)
    {
        LogInternal("KFTrigger_Trader::UsedBy! Trader:" @ string(self));
    }
    KFPH = KFPawn_Human(User);
    if(KFPH == none)
    {
        return false;
    }
    KFPC = KFPlayerController(User.Controller);
    if(KFPC != none)
    {
        KFPC.OpenTraderMenu();
    }
    return false;
}

simulated function OpenTrader()
{
    local float AnimDuration;
    local Pawn P;

    SetCollision(true, false);
    bOpened = true;
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(TraderMeshActor != none)
        {
            TraderMeshActor.SkeletalMeshComponent.PlayAnim(OpenAnimName);
            AnimDuration = TraderMeshActor.SkeletalMeshComponent.GetAnimLength(OpenAnimName);
            WorldInfo.GRI.SetTimer(AnimDuration, false, 'StartTraderLoopAnim', self);
            TraderMeshActor.PlaySoundBase(TraderOpenSound);
        }
        ShowTraderPath();
    }
    foreach TouchingActors(Class'Pawn', P)
    {
        Class'KFPlayerController'.static.UpdateInteractionMessages(P);        
    }    
}

simulated function StartTraderLoopAnim()
{
    if(((WorldInfo.NetMode != NM_DedicatedServer) && TraderMeshActor != none) && bOpened)
    {
        TraderMeshActor.SkeletalMeshComponent.PlayAnim(IdleLoopAnimName,, true);
    }
}

simulated function ShowTraderPath()
{
    local KFPlayerController KFPC;
    local KFGameReplicationInfo KFGRI;
    local Engine.Pawn.EPathSearchType OldSearchType;
    local KFEmit_TraderPath Path;
    local Actor nodePathRoot;
    local bool bPathFound;

    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if(((bCollideActors && KFGRI != none) && KFGRI.bTraderIsOpen) && KFGRI.OpenedTrader == self)
    {
        foreach LocalPlayerControllers(Class'KFPlayerController', KFPC)
        {
            if(((KFPC.Pawn == none) || KFPC.GetTeamNum() == 255) || !KFPC.Pawn.IsAliveAndWell())
            {
                continue;                
            }
            OldSearchType = KFPC.Pawn.PathSearchType;
            KFPC.Pawn.PathSearchType = 3;
            Class'Path_ToTrader'.static.ToTrader(KFPC.Pawn);
            Class'Goal_AtActor'.static.AtActor(KFPC.Pawn, self,, false);
            nodePathRoot = KFPC.FindPathToward(self);
            if(nodePathRoot != none)
            {
                bPathFound = true;                
            }
            else
            {
                bPathFound = false;
            }
            if(bPathFound)
            {
                Path = Spawn(Class'KFEmit_TraderPath', KFPC,, KFPC.Pawn.Location);
                Path.SetDestination(((TraderMeshActor != none) ? TraderMeshActor.Location + vect(0, 0, 100) : Location));                
            }
            else
            {
                if(Class'KFEmit_TraderPath'.default.bShowEmitPathDebugArtifacts)
                {
                    DrawDebugLine(KFPC.Pawn.Location, Location, 255, 0, 0, true);
                }
                if(bLogTrader)
                {
                    LogInternal((((("ShowTraderPath - No Path Found, KFGRI.OpenedTrader: " @ string(KFGRI.OpenedTrader)) @ " trader trigger loc: ") @ string(Location)) @ " - player loc: ") @ string(KFPC.Pawn.Location));
                }
            }
            KFPC.Pawn.ClearConstraints();
            KFPC.Pawn.PathSearchType = OldSearchType;            
        }        
        WorldInfo.GetALocalPlayerController().SetTimer(2, false, 'ShowTraderPath', self);
    }
}

simulated function CloseTrader()
{
    local KFPlayerController KFPC;

    SetCollision(false, false);
    bOpened = false;
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(TraderMeshActor != none)
        {
            TraderMeshActor.SkeletalMeshComponent.PlayAnim(OpenAnimName,,,,, true);
            TraderMeshActor.PlaySoundBase(TraderCloseSound);
        }
        foreach LocalPlayerControllers(Class'KFPlayerController', KFPC)
        {
            KFPC.CloseTraderMenu();
            if(KFPC.Pawn != none)
            {
                Class'KFPlayerController'.static.UpdateInteractionMessages(KFPC.Pawn);
            }            
        }        
    }
}

simulated function HideTraderPath()
{
    local KFPlayerController KFPC;

    foreach LocalPlayerControllers(Class'KFPlayerController', KFPC)
    {
        KFPC.ClearTimer('ShowTraderPath', self);        
    }    
}

defaultproperties
{
    OpenAnimName=Open
    IdleLoopAnimName=Printing
    TraderOpenSound=AkEvent'WW_UI_Menu.Play_UI_Trader_Build_Start'
    TraderCloseSound=AkEvent'WW_UI_Menu.Play_UI_Trader_Build_Stop'
    DistanceOffNavMeshTheTragerIsAllowedToBe=500
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=160
        CollisionRadius=400
        ReplacementPrimitive=none
        BlockZeroExtent=false
    object end
    // Reference: CylinderComponent'Default__KFTraderTrigger.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFTraderTrigger.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=160
        CollisionRadius=400
        ReplacementPrimitive=none
        BlockZeroExtent=false
    object end
    // Reference: CylinderComponent'Default__KFTraderTrigger.CollisionCylinder'
    Components(1)=CollisionCylinder
    CollisionType=ECollisionType.COLLIDE_NoCollision
    bCollideActors=false
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=160
        CollisionRadius=400
        ReplacementPrimitive=none
        BlockZeroExtent=false
    object end
    // Reference: CylinderComponent'Default__KFTraderTrigger.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}