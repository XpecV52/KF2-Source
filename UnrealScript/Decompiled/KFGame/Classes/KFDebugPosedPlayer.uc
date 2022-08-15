/*******************************************************************************
 * KFDebugPosedPlayer generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDebugPosedPlayer extends Actor
    config(Game)
    placeable
    hidecategories(Navigation,Lighting,LightColor,Force,Collision,Physics,Debug,Attachment,Navigation,Mobile);

var config string KFPM_Archetype;
/** Can the DebugPlayer be possessed */
var() bool bCanPossess;
var export editinline DrawCylinderComponent CylinderComponent;
var export editinline DrawSphereComponent SphereComponent;
var transient KFPawn KFP;
var transient int NumTimesPossessed;

static function string GetArchetypeName()
{
    return default.KFPM_Archetype;
}

static function StopPosedPlayers(WorldInfo Info)
{
    local KFDebugPosedPlayer PosedPlayer;

    foreach Info.AllActors(Class'KFDebugPosedPlayer', PosedPlayer)
    {
        PosedPlayer.KFP.SetTickIsDisabled(true);        
    }    
}

static function SpawnPosedPlayers(WorldInfo Info)
{
    local KFDebugPosedPlayer PosedPlayer;
    local KFCharacterInfo_Monster MonsterInfo;
    local string ArchetypeName;

    ArchetypeName = Class'KFDebugPosedPlayer'.static.GetArchetypeName();
    MonsterInfo = KFCharacterInfo_Monster(DynamicLoadObject(ArchetypeName, Class'KFCharacterInfo_Monster'));
    foreach Info.AllActors(Class'KFDebugPosedPlayer', PosedPlayer)
    {
        if(PosedPlayer.KFP == none)
        {
            PosedPlayer.KFP = Info.Spawn(Class'KFPawn_Human',,, PosedPlayer.Location, PosedPlayer.Rotation);
            KFPawn_Human(PosedPlayer.KFP).PlayerPartyInfo.Close();
            PosedPlayer.KFP.SetCharacterArch(MonsterInfo);
            PosedPlayer.KFP.PlayBodyAnim('Idle_V1', 0,,,, true);
        }        
    }    
}

static function PossessPosedPlayer(WorldInfo Info)
{
    local KFDebugPosedPlayer PosedPlayer, TargetPosedPlayer;
    local Pawn OldPawn;
    local PlayerController PC;
    local int NumPossessions;

    NumPossessions = 1000;
    TargetPosedPlayer = none;
    foreach Info.AllActors(Class'KFDebugPosedPlayer', PosedPlayer)
    {
        if(PosedPlayer.bCanPossess && PosedPlayer.KFP != none)
        {
            if(PosedPlayer.NumTimesPossessed < NumPossessions)
            {
                NumPossessions = PosedPlayer.NumTimesPossessed;
                TargetPosedPlayer = PosedPlayer;
            }
        }        
    }    
    if(TargetPosedPlayer != none)
    {
        ++ TargetPosedPlayer.NumTimesPossessed;
        PC = Info.GetALocalPlayerController();
        if(PC != none)
        {
            if(PC.GetViewTarget() != none)
            {
                OldPawn = Pawn(PC.GetViewTarget());
            }
            PC.SetViewTarget(TargetPosedPlayer.KFP);
            PC.SetCameraMode('FirstPerson');
            if(OldPawn != none)
            {
                if(KFPawn_Human(OldPawn).PlayerPartyInfo.bMovieIsOpen)
                {
                    KFPawn_Human(OldPawn).PlayerPartyInfo.Close();
                }
            }
        }
    }
}

defaultproperties
{
    begin object name=Cylinder0 class=DrawCylinderComponent
        CylinderRadius=25
        CylinderTopRadius=25
        CylinderSides=6
        ReplacementPrimitive=none
        Translation=(X=0,Y=0,Z=50)
    object end
    // Reference: DrawCylinderComponent'Default__KFDebugPosedPlayer.Cylinder0'
    CylinderComponent=Cylinder0
    begin object name=Sphere0 class=DrawSphereComponent
        SphereColor=(B=255,G=0,R=0,A=255)
        SphereRadius=10
        ReplacementPrimitive=none
        Translation=(X=25,Y=0,Z=85)
    object end
    // Reference: DrawSphereComponent'Default__KFDebugPosedPlayer.Sphere0'
    SphereComponent=Sphere0
    begin object name=Cylinder0 class=DrawCylinderComponent
        CylinderRadius=25
        CylinderTopRadius=25
        CylinderSides=6
        ReplacementPrimitive=none
        Translation=(X=0,Y=0,Z=50)
    object end
    // Reference: DrawCylinderComponent'Default__KFDebugPosedPlayer.Cylinder0'
    Components(0)=Cylinder0
    begin object name=Sphere0 class=DrawSphereComponent
        SphereColor=(B=255,G=0,R=0,A=255)
        SphereRadius=10
        ReplacementPrimitive=none
        Translation=(X=25,Y=0,Z=85)
    object end
    // Reference: DrawSphereComponent'Default__KFDebugPosedPlayer.Sphere0'
    Components(1)=Sphere0
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    bStatic=true
    bNoDelete=true
    bRouteBeginPlayEvenIfStatic=false
    bMovable=false
    bCollideWhenPlacing=true
    bEdShouldSnap=true
    bForceAllowKismetModification=true
}