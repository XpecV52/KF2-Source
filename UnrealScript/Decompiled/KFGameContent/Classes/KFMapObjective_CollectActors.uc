/*******************************************************************************
 * KFMapObjective_CollectActors generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFMapObjective_CollectActors extends KFMapObjective_VolumeBase
    hidecategories(Navigation,Object,Movement,Display);

enum ESoundSelectionType
{
    ESoundSelectionType_Random,
    ESoundSelectionType_Location,
    ESoundSelectionType_Ordered,
    ESoundSelectionType_Progress,
    ESoundSelectionType_MAX
};

struct CollectibleActorInfo
{
    /** Collectible actor */
    var() KFObjectiveCollectActor Collectible;
    /** Collectible actor// Trigger for collectible actor
 */
    var() KFUsableTrigger CollectibleTrigger;

    structdefaultproperties
    {
        Collectible=none
        CollectibleTrigger=none
    }
};

struct KFSoundEventGroup
{
    var() KFMapObjective_CollectActors.ESoundSelectionType SoundType;
    var() array<AkEvent> SoundEvents;
    var int CurrentEvent;

    structdefaultproperties
    {
        SoundType=ESoundSelectionType.ESoundSelectionType_Random
        SoundEvents=none
        CurrentEvent=0
    }
};

/** A delay from the the start of an objective, so the player can't automatically activate the first actor */
var() float ActivationDelay;
/** How long until the next actor can be activated. */
var() float TimeUntilNextActivation;
/** A sound to play when the objective is fully complete */
var() AkEvent SuccessSoundEvent;
/** How many actors needs to be activated for the objective to be completed. */
var() array<int> NumRequired;
var repnotify int NumAccomplished;
/** An actor that visually represents the delivery volume */
var() SkeletalMeshActor DeliveryMeshActor;
/** An animation to play on the DeliveryMeshActor when this objective activates */
var() name DeliveryOpenAnimName;
/** An animation to play on the DeliveryMeshActor when this objective deactivates */
var() name DeliveryCloseAnimName;
/** How long to delay the playing of the close anim after the objective is complete (to give Kismet time to finish things) */
var() float DeliveryCloseAnimDelay;
var float CollectibleResetTimerLength;
var repnotify bool bCollectibleReset;
/** Whether the sequence of collectibles should be randomized */
var() bool bRandomSequence;
/** All collectible actors associated with this objective */
var() array<CollectibleActorInfo> CollectibleInfo;
/** The number of collectible actors that should be active at the same time */
var() array<int> NumDesiredActiveCollectibles;
var transient array<int> AvailableCollectibleIndices;
var transient Class DeliveryClass;
var float CollectActorIconSize;
var const Color CollectibleIconAvailableColor;
var const Color CollectibleIconCarriedColor;
var float UpdateTrailActorInterval;
/** Sounds to play when one of the collectibles is dropped on the ground */
var() KFSoundEventGroup CollectibleDroppedSoundEvents;
/** Sounds to play when one of the collectibles is successfully delivered */
var() KFSoundEventGroup CollectibleDeliveredSoundEvents;
/** Sounds to play when one of the collect actors is activated */
var() KFSoundEventGroup CollectibleActivateSoundEvents;
/** Sounds to play when one of the players picks up an object from its original spawn */
var() KFSoundEventGroup CollectibleCollectSoundEvents;
/** A sound to play when the players have not collected in object in some time */
var() AkEvent CollectActorReminderSoundEvent;
/** How frequently to play audio when a collectible is dropped on the ground */
var() float CollectibleDroppedInterval;
/** How frequently to play audio when the player picks up an object from the collect actor */
var() float CollectibleCollectInterval;
/** How frequently to remind players that they need to pick up a collectible */
var() float CollectActorReminderInterval;

replication
{
     if(bNetDirty)
        NumAccomplished, bCollectibleReset;
}

simulated function ReplicatedEvent(name VarName)
{
    if(VarName == 'NumAccomplished')
    {
        if(NumAccomplished != 0)
        {
            TriggerObjectiveProgressEvent(,, float(NumAccomplished) / float(GetNumRequired()));
        }        
    }
    else
    {
        super(Actor).ReplicatedEvent(VarName);
    }
}

simulated function ActivateObjective()
{
    local int I;

    super.ActivateObjective();
    SetTimer(UpdateTrailActorInterval, true, 'UpdateTrailActor');
    if(DeliveryMeshActor != none)
    {
        DeliveryMeshActor.SkeletalMeshComponent.PlayAnim(DeliveryOpenAnimName);
    }
    if(Role == ROLE_Authority)
    {
        I = 0;
        J0x91:

        if(I < CollectibleInfo.Length)
        {
            CollectibleInfo[I].Collectible.ObjectiveOwner = self;
            AvailableCollectibleIndices.AddItem(I;
            ++ I;
            goto J0x91;
        }
        NumAccomplished = 0;
        bActive = true;
        bForceNetUpdate = true;
        if(ActivationDelay > 0)
        {
            SetTimer(ActivationDelay, false, 'ChooseNextCollectible');            
        }
        else
        {
            ChooseNextCollectible();
        }
    }
}

simulated function PlayDeliveryMeshCloseAnim()
{
    if(DeliveryMeshActor != none)
    {
        DeliveryMeshActor.SkeletalMeshComponent.PlayAnim(DeliveryCloseAnimName);
    }
}

simulated function DeactivateObjective()
{
    local CollectibleActorInfo Info;
    local KFPawn_Human KFPH;
    local KFDroppedPickup_Carryable DroppedCarryable;
    local KFCarryableObject_Collectible CarryableObject;
    local Inventory InventoryItem;

    super.DeactivateObjective();
    if(DeliveryCloseAnimDelay > 0)
    {
        SetTimer(DeliveryCloseAnimDelay, false, 'PlayDeliveryMeshCloseAnim');        
    }
    else
    {
        PlayDeliveryMeshCloseAnim();
    }
    if(Role == ROLE_Authority)
    {
        bActive = false;
        bForceNetUpdate = true;
        if((GetProgress()) >= 1)
        {
            PlaySoundBase(SuccessSoundEvent, false, WorldInfo.NetMode == NM_DedicatedServer);            
        }
        else
        {
            PlaySoundBase(FailureSoundEvent, false, WorldInfo.NetMode == NM_DedicatedServer);
        }
        ClearTimer('ChooseNextCollectible');
        foreach CollectibleInfo(Info,)
        {
            Info.CollectibleTrigger.bActive = false;
            Info.Collectible.SetEnabled(false);
            Info.Collectible.SetActive(false);
            Info.Collectible.bForceNetUpdate = true;            
        }        
        foreach WorldInfo.AllPawns(Class'KFPawn_Human', KFPH)
        {
            GrantReward(KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo), KFPlayerController(KFPH.Controller));
            if((KFPH != none) && KFPH.InvManager != none)
            {
                InventoryItem = KFPH.InvManager.FindInventoryType(class<Inventory>(DeliveryClass), true);
                if(InventoryItem != none)
                {
                    if(InventoryItem != none)
                    {
                        KFPH.InvManager.RemoveFromInventory(InventoryItem);
                        CarryableObject = KFCarryableObject_Collectible(InventoryItem);
                        if(CarryableObject != none)
                        {
                            CarryableObject.UpdateReplicationInfo(false);
                        }
                    }
                }
            }            
        }        
        foreach AllActors(Class'KFDroppedPickup_Carryable', DroppedCarryable)
        {
            if(DroppedCarryable != none)
            {
                DroppedCarryable.Destroy();
            }            
        }        
    }
    ClearTimer('Timer_CollectibleCollectCooldown');
    ClearTimer('Timer_CollectibleDroppedCooldown');
    ClearTimer('CollectActorReminder');
    ClearTimer('UpdateTrailActor');
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(TrailActor != none)
        {
            TrailActor.Destroy();
            TrailActor = none;
        }
    }
}

simulated function bool IsActive()
{
    return bActive;
}

simulated function bool UsesProgress()
{
    return true;
}

simulated function bool IsBonus();

function bool CanActivateObjective()
{
    return !IsCurrentGameModeBlacklisted();
}

function bool IsCurrentGameModeBlacklisted()
{
    local class<KFGameInfo> CurrGameClass;

    foreach GameModeBlacklist(CurrGameClass,)
    {
        if(CurrGameClass == WorldInfo.GRI.GameClass)
        {            
            return true;
        }        
    }    
    return false;
}

simulated function float GetProgress()
{
    return float(NumAccomplished) / float(GetNumRequired());
}

simulated function bool IsComplete()
{
    return (GetProgress()) >= 1;
}

simulated function float GetActivationPctChance()
{
    return 1;
}

simulated function string GetLocalizedRequirements()
{
    return (Localize("Objectives", default.RequirementsLocKey, "KFGame")) @ string(GetNumRequired());
}

simulated function GetLocalizedStatus(out string StatusMessage, out int bWarning, out int bNotification)
{
    local int I;
    local bool bDropped, bCarried, bReadyForPickup;

    StatusMessage = "";
    if((GetProgress()) >= 1)
    {
        StatusMessage = Localize("Objectives", "KillRemainingZeds", LocalizationPackageName);
        bWarning = 0;
        bNotification = 0;
        return;
    }
    I = 0;
    J0x7F:

    if(I < CollectibleInfo.Length)
    {
        if(CollectibleInfo[I].Collectible != none)
        {
            switch(CollectibleInfo[I].Collectible.CollectibleState)
            {
                case 0:
                    if(CollectibleInfo[I].Collectible.bActive)
                    {
                        bReadyForPickup = true;
                    }
                    break;
                case 1:
                    bCarried = true;
                    break;
                case 2:
                    bDropped = true;
                    break;
                default:
                    break;
            }
        }
        else
        {
            ++ I;
            goto J0x7F;
        }/* !MISMATCHING REMOVE, tried Loop got Type:Else Position:0x186! */
        if(bDropped)
        {
            StatusMessage = Localize("Objectives", "Dropped", LocalizationPackageName);
            bWarning = 1;
            return;
        }
        if(bCarried)
        {
            StatusMessage = Localize("Objectives", "PickedUp", LocalizationPackageName);
            bNotification = 1;
            return;
        }
        if(bCollectibleReset)
        {
            StatusMessage = Localize("Objectives", "Reset", LocalizationPackageName);
            bWarning = 1;
            return;
        }
        if(bReadyForPickup)
        {
            StatusMessage = Localize("Objectives", "PickupTransportItem", LocalizationPackageName);
            bNotification = 1;
            return;
        }
    }/* !MISMATCHING REMOVE, tried Else got Type:Loop Position:0x07F! */
}

simulated function bool ShouldDrawIcon()
{
    return true;
}

simulated function Vector GetIconLocation()
{
    return Location;
}

simulated function DrawHUDActiveCollectibles(KFHUDBase HUD, Canvas DrawCanvas, bool bDropShadow)
{
    local KFDroppedPickup_Carryable DroppedCarryable;
    local int I;
    local float DropShadowModifier;

    DropShadowModifier = ((bDropShadow) ? 1 : 0);
    I = 0;
    J0x2E:

    if(I < CollectibleInfo.Length)
    {
        if(CollectibleInfo[I].CollectibleTrigger.bActive && CollectibleInfo[I].Collectible != none)
        {
            DrawIconAtLocation(HUD, DrawCanvas, GetCollectibleIcon(), CollectibleInfo[I].Collectible.Location, -16 + DropShadowModifier, -50 + DropShadowModifier);
        }
        ++ I;
        goto J0x2E;
    }
    foreach AllActors(Class'KFDroppedPickup_Carryable', DroppedCarryable)
    {
        if(DroppedCarryable != none)
        {
            DrawIconAtLocation(HUD, DrawCanvas, GetCollectibleIcon(), DroppedCarryable.Location, -16 + DropShadowModifier, -50 + DropShadowModifier);
        }        
    }    
}

simulated function DrawHUDCarriedCollectibles(KFHUDBase HUD, Canvas DrawCanvas, bool bDropShadow)
{
    local int I;
    local KFPawn_Human KFPH;
    local float BarLength, FontScale, ResModifier, DropShadowModifier;
    local PlayerController LocalPC;
    local KFPlayerReplicationInfo KFPRI;
    local PlayerReplicationInfo PRI;
    local array<Controller> PawnPlayerControllers;

    LocalPC = GetALocalPlayerController();
    ResModifier = WorldInfo.GetResolutionBasedHUDScale() * HUD.FriendlyHudScale;
    BarLength = FMin(HUD.PlayerStatusBarLengthMax * (DrawCanvas.ClipX / 1024), HUD.PlayerStatusBarLengthMax) * ResModifier;
    FontScale = Class'KFGameEngine'.static.GetKFFontScale() * HUD.FriendlyHudScale;
    DropShadowModifier = ((bDropShadow) ? 1 : 0);
    foreach WorldInfo.AllPawns(Class'KFPawn_Human', KFPH)
    {
        if((LocalPC == none) || LocalPC != KFPH.Controller)
        {
            if(((((KFPH.Mesh != none) && KFPH.CylinderComponent != none) && KFPH.Mesh.SkeletalMesh != none) && KFPH.Mesh.bAnimTreeInitialised) && (WorldInfo.TimeSeconds - KFPH.Mesh.LastRenderTime) < 0.2)
            {
                PawnPlayerControllers.AddItem(KFPH.Controller;
                if(ClassIsChildOf(KFPH.WeaponClassForAttachmentTemplate, DeliveryClass))
                {
                    DrawIconAtLocation(HUD, DrawCanvas, GetCollectibleIcon(), KFPH.Mesh.GetPosition() + (KFPH.CylinderComponent.CollisionHeight * vect(0, 0, 2.5)), (((BarLength * -0.5) - (HUD.PlayerStatusIconSize * ResModifier)) - (CollectActorIconSize * ResModifier)) + DropShadowModifier, (((CollectActorIconSize * FontScale) * ResModifier) * 0.5) + DropShadowModifier);
                }
            }
        }        
    }    
    I = 0;
    J0x463:

    if(I < WorldInfo.GRI.PRIArray.Length)
    {
        PRI = WorldInfo.GRI.PRIArray[I];
        KFPRI = KFPlayerReplicationInfo(PRI);
        if((KFPRI != none) && KFPRI.bCarryingCollectible)
        {
            if((PawnPlayerControllers.Find(KFPRI.Owner == -1) && PRI != LocalPC.PlayerReplicationInfo)
            {
                DrawIconAtLocation(HUD, DrawCanvas, GetCollectibleIcon(), KFPRI.GetSmoothedPawnIconLocation(HUD.HumanPlayerIconInterpMult) + (Class'KFPawn_Human'.default.CylinderComponent.CollisionHeight * vect(0, 0, 2)), ((-1 * (HUD.PlayerStatusIconSize * ResModifier)) - (CollectActorIconSize * ResModifier)) + DropShadowModifier, ((-1 * CollectActorIconSize) * ResModifier) + DropShadowModifier);
            }
        }
        ++ I;
        goto J0x463;
    }
}

simulated function DrawHUD(KFHUDBase HUD, Canvas DrawCanvas)
{
    if(!IsLocalPlayerCarryingACollectible())
    {
        if(DrawCanvas != none)
        {
            DrawCanvas.SetDrawColorStruct(HUD.PlayerBarShadowColor);
            DrawHUDActiveCollectibles(HUD, DrawCanvas, true);
            DrawCanvas.SetDrawColorStruct(CollectibleIconAvailableColor);
            DrawHUDActiveCollectibles(HUD, DrawCanvas, false);
        }
    }
    if(DrawCanvas != none)
    {
        DrawCanvas.SetDrawColorStruct(HUD.PlayerBarShadowColor);
        DrawHUDCarriedCollectibles(HUD, DrawCanvas, true);
        DrawCanvas.SetDrawColorStruct(CollectibleIconCarriedColor);
        DrawHUDCarriedCollectibles(HUD, DrawCanvas, false);
    }
}

simulated function bool ShouldShowObjectiveHUD()
{
    return IsLocalPlayerCarryingACollectible();
}

simulated function bool HasObjectiveDrawDistance()
{
    return false;
}

simulated function Texture2D GetCollectibleIcon()
{
    return ObjectiveIcon;
}

simulated function string GetProgressText()
{
    if(!bActive)
    {
        return "";
    }
    return (string(NumAccomplished) $ "/") $ string(GetNumRequired());
}

simulated function bool GetIsMissionCritical()
{
    return bIsMissionCriticalObjective;
}

simulated function PlaySoundEvent(out KFSoundEventGroup SoundGroup, int nSpecificIndex)
{
    local int nIndex;

    switch(SoundGroup.SoundType)
    {
        case 0:
            nIndex = Rand(SoundGroup.SoundEvents.Length);
            break;
        case 1:
            nIndex = nSpecificIndex;
            break;
        case 2:
            nIndex = SoundGroup.CurrentEvent;
            ++ SoundGroup.CurrentEvent;
            if(SoundGroup.CurrentEvent >= SoundGroup.SoundEvents.Length)
            {
                SoundGroup.CurrentEvent = 0;
            }
            break;
        case 3:
            nIndex = NumAccomplished;
            break;
        default:
            break;
    }
    if(((nIndex >= 0) && nIndex < SoundGroup.SoundEvents.Length) && SoundGroup.SoundEvents[nIndex] != none)
    {
        PlaySoundBase(SoundGroup.SoundEvents[nIndex], false, WorldInfo.NetMode == NM_DedicatedServer);
    }
}

simulated function OnCollectActor(KFObjectiveCollectActor Collectible)
{
    if(!bActive)
    {
        return;
    }
    if(!IsTimerActive('Timer_CollectibleCollectCooldown'))
    {
        PlaySoundEvent(CollectibleCollectSoundEvents, GetCollectibleIndexFromCollectActor(Collectible));
        SetTimer(CollectibleCollectInterval, false, 'Timer_CollectibleCollectCooldown');
    }
}

simulated function ProgressObjective()
{
    local KFGameReplicationInfo KFGRI;

    if(Role == ROLE_Authority)
    {
        ++ NumAccomplished;
        bForceNetUpdate = true;
        if((GetProgress()) >= 1)
        {
            KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
            if(KFGRI != none)
            {
                KFGRI.DeactivateObjective();
            }            
        }
        else
        {
            if(TimeUntilNextActivation > 0)
            {
                SetTimer(TimeUntilNextActivation, false, 'ChooseNextCollectible');                
            }
            else
            {
                ChooseNextCollectible();
            }
        }
        TriggerObjectiveProgressEvent(,, float(NumAccomplished) / float(GetNumRequired()));
    }
}

simulated function ChooseNextCollectible()
{
    local int I, J, RandAvailableIdx, RandCollectibleIdx, NumActiveCollectibles;

    local bool NeedsAvailableInit;

    if(Role == ROLE_Authority)
    {
        if(CollectibleInfo.Length == 0)
        {
            return;
        }
        NeedsAvailableInit = (AvailableCollectibleIndices.Length == 0) && CollectibleInfo.Length < (GetNumRequired());
        I = 0;
        J0x64:

        if(I < CollectibleInfo.Length)
        {
            if(CollectibleInfo[I].CollectibleTrigger.bActive)
            {
                ++ NumActiveCollectibles;                
            }
            else
            {
                if(NeedsAvailableInit)
                {
                    AvailableCollectibleIndices.AddItem(I;
                }
            }
            ++ I;
            goto J0x64;
        }
        J = 0;
        J0x105:

        if(J < ((GetNumDesiredActive()) - NumActiveCollectibles))
        {
            if(AvailableCollectibleIndices.Length <= 0)
            {
                goto J0x2B3;
            }
            RandAvailableIdx = ((bRandomSequence) ? Rand(AvailableCollectibleIndices.Length) : 0);
            RandCollectibleIdx = AvailableCollectibleIndices[RandAvailableIdx];
            AvailableCollectibleIndices.Remove(RandAvailableIdx, 1;
            CollectibleInfo[RandCollectibleIdx].Collectible.SetEnabled(true);
            CollectibleInfo[RandCollectibleIdx].Collectible.SetActive(true);
            CollectibleInfo[RandCollectibleIdx].Collectible.bForceNetUpdate = true;
            CollectibleInfo[RandCollectibleIdx].CollectibleTrigger.bActive = true;
            PlaySoundEvent(CollectibleActivateSoundEvents, RandCollectibleIdx);
            ++ J;
            goto J0x105;
        }
    }
    J0x2B3:

}

simulated function Actor FindClosestActiveCollector()
{
    local CollectibleActorInfo Info;
    local float shortestDistance, currentDistance;
    local Actor closestActor;
    local PlayerController LocalPC;

    LocalPC = GetALocalPlayerController();
    closestActor = none;
    shortestDistance = -1;
    if((LocalPC != none) && LocalPC.Pawn != none)
    {
        foreach CollectibleInfo(Info,)
        {
            if((Info.Collectible != none) && Info.Collectible.bActive)
            {
                currentDistance = VSize(Info.Collectible.Location - LocalPC.Pawn.Location);
                if((shortestDistance < float(0)) || currentDistance < shortestDistance)
                {
                    shortestDistance = currentDistance;
                    closestActor = Info.CollectibleTrigger;
                }
            }            
        }        
    }
    return closestActor;
}

simulated function bool GetClosestPlayerCarryingACollectible(out Vector CarrierLocation)
{
    local KFPawn_Human KFPH;
    local PlayerController LocalPC;
    local array<Controller> PawnPlayerControllers;
    local int I;
    local PlayerReplicationInfo PRI;
    local KFPlayerReplicationInfo KFPRI;
    local bool bFoundCarrier;
    local float currentDistance;

    LocalPC = GetALocalPlayerController();
    bFoundCarrier = false;
    foreach WorldInfo.AllPawns(Class'KFPawn_Human', KFPH)
    {
        if((LocalPC == none) || LocalPC != KFPH.Controller)
        {
            if(((((KFPH.Mesh != none) && KFPH.CylinderComponent != none) && KFPH.Mesh.SkeletalMesh != none) && KFPH.Mesh.bAnimTreeInitialised) && (WorldInfo.TimeSeconds - KFPH.Mesh.LastRenderTime) < 0.2)
            {
                PawnPlayerControllers.AddItem(KFPH.Controller;
                if(ClassIsChildOf(KFPH.WeaponClassForAttachmentTemplate, DeliveryClass))
                {
                    if(LocalPC.Pawn != none)
                    {
                        if(!bFoundCarrier || VSize(KFPH.Mesh.GetPosition() - LocalPC.Pawn.Location) < currentDistance)
                        {
                            CarrierLocation = KFPH.Mesh.GetPosition();
                            currentDistance = VSize(CarrierLocation - LocalPC.Pawn.Location);
                            bFoundCarrier = true;
                        }
                    }
                }
            }
        }        
    }    
    I = 0;
    J0x357:

    if(I < WorldInfo.GRI.PRIArray.Length)
    {
        PRI = WorldInfo.GRI.PRIArray[I];
        KFPRI = KFPlayerReplicationInfo(PRI);
        if((KFPRI != none) && KFPRI.bCarryingCollectible)
        {
            if((PawnPlayerControllers.Find(KFPRI.Owner == -1) && PRI != LocalPC.PlayerReplicationInfo)
            {
                if(!bFoundCarrier || VSize(KFPRI.GetSmoothedPawnIconLocation(0) - LocalPC.Pawn.Location) < currentDistance)
                {
                    CarrierLocation = KFPRI.GetSmoothedPawnIconLocation(0);
                    currentDistance = VSize(CarrierLocation - LocalPC.Pawn.Location);
                    bFoundCarrier = true;
                }
            }
        }
        ++ I;
        goto J0x357;
    }
    return bFoundCarrier;
}

simulated function bool GetClosestDroppedCollectible(out Actor DroppedCarryable)
{
    local KFDroppedPickup_Carryable CurrentCarryable;
    local float currentDistance, shortestDistance;
    local PlayerController LocalPC;

    LocalPC = GetALocalPlayerController();
    if((LocalPC != none) && LocalPC.Pawn != none)
    {
        foreach AllActors(Class'KFDroppedPickup_Carryable', CurrentCarryable)
        {
            if(CurrentCarryable != none)
            {
                currentDistance = VSize(CurrentCarryable.Location - LocalPC.Pawn.Location);
                if((DroppedCarryable == none) || currentDistance < shortestDistance)
                {
                    shortestDistance = currentDistance;
                    DroppedCarryable = CurrentCarryable;
                }
            }            
        }        
    }
    return DroppedCarryable != none;
}

simulated function UpdateTrailActor()
{
    local Actor PathTarget;
    local Vector CarrierLocation;
    local PlayerController LocalPC;
    local float AnchorDist;

    if(bActive && WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(TrailActor == none)
        {
            TrailActor = Class'WorldInfo'.static.GetWorldInfo().Spawn(Class'KFReplicatedShowPathActor', none);
        }
        if(IsLocalPlayerCarryingACollectible())
        {
            TrailActor.SetEmitterTemplate(ParticleSystem'FX_Objective_White_Trail');            
        }
        else
        {
            TrailActor.SetEmitterTemplate(ParticleSystem'FX_Objective_White_Trail');
        }
        if(IsLocalPlayerCarryingACollectible())
        {
            PathTarget = self;            
        }
        else
        {
            if(GetClosestPlayerCarryingACollectible(CarrierLocation))
            {
                LocalPC = GetALocalPlayerController();
                if(LocalPC.Pawn != none)
                {
                    PathTarget = LocalPC.Pawn.GetBestAnchor(none, CarrierLocation, false, false, AnchorDist);
                }                
            }
            else
            {
                if(!GetClosestDroppedCollectible(PathTarget))
                {
                    PathTarget = FindClosestActiveCollector();
                }
            }
        }
        if(PathTarget != TrailActor.Target)
        {
            TrailActor.SetPathTarget(PathTarget);
        }
    }
}

simulated function ResetCollectReminder()
{
    SetTimer(CollectActorReminderInterval, true, 'CollectActorReminder');
}

simulated function ClearCollectReminder()
{
    ClearTimer('CollectActorReminder');
}

simulated function CollectActorReminder()
{
    if(CollectActorReminderSoundEvent != none)
    {
        PlaySoundBase(CollectActorReminderSoundEvent, false, WorldInfo.NetMode == NM_DedicatedServer);
    }
}

simulated function int GetCollectibleIndexFromCollectActor(KFObjectiveCollectActor collectActor)
{
    local int I;

    I = 0;
    J0x0B:

    if(I < CollectibleInfo.Length)
    {
        if(CollectibleInfo[I].Collectible == collectActor)
        {
            return I;
        }
        ++ I;
        goto J0x0B;
    }
    return -1;
}

event Touch(Actor Other, PrimitiveComponent OtherComp, Vector HitLocation, Vector HitNormal)
{
    local KFDroppedPickup Pickup;
    local KFPawn_Human KFPH;
    local bool bShouldProgress;
    local KFCarryableObject_Collectible CarryableObject;
    local Inventory InventoryItem;
    local KFInventoryManager KFInvManager;

    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
    if(bActive)
    {
        bShouldProgress = false;
        Pickup = KFDroppedPickup(Other);
        if((Pickup != none) && Pickup.Inventory != none)
        {
            if(ClassIsChildOf(Pickup.Inventory.Class, DeliveryClass))
            {
                CarryableObject = KFCarryableObject_Collectible(Pickup.Inventory);
                if((CarryableObject != none) && CarryableObject.ParentCollectActor != none)
                {
                    PlaySoundEvent(CollectibleDeliveredSoundEvents, GetCollectibleIndexFromCollectActor(CarryableObject.ParentCollectActor));
                }
                Pickup.Destroy();
                bShouldProgress = true;
            }
        }
        KFPH = KFPawn_Human(Other);
        if(KFPH != none)
        {
            InventoryItem = KFPH.InvManager.FindInventoryType(class<Inventory>(DeliveryClass), true);
            if(InventoryItem != none)
            {
                CarryableObject = KFCarryableObject_Collectible(InventoryItem);
                if((CarryableObject != none) && CarryableObject.ParentCollectActor != none)
                {
                    PlaySoundEvent(CollectibleDeliveredSoundEvents, GetCollectibleIndexFromCollectActor(CarryableObject.ParentCollectActor));
                    CarryableObject.UpdateReplicationInfo(false);
                }
                KFInvManager = KFInventoryManager(KFPH.InvManager);
                if((KFInvManager != none) && KFInvManager.ItemIsInInventory(InventoryItem))
                {
                    KFPH.InvManager.RemoveFromInventory(InventoryItem);
                    InventoryItem.Destroy();
                    bShouldProgress = true;
                }
            }
        }
        if(bShouldProgress)
        {
            if((CarryableObject != none) && CarryableObject.ParentCollectActor != none)
            {
                CarryableObject.ParentCollectActor.SetCollectibleState(3);
            }
            ProgressObjective();
        }
    }
}

simulated function Timer_CollectibleReset()
{
    bCollectibleReset = false;
}

simulated function RespawnCollectible(KFObjectiveCollectActor collectActor)
{
    local int I;

    bCollectibleReset = true;
    SetTimer(CollectibleResetTimerLength, false, 'Timer_CollectibleReset');
    I = 0;
    J0x2E:

    if(I < CollectibleInfo.Length)
    {
        if(CollectibleInfo[I].Collectible == collectActor)
        {
            AvailableCollectibleIndices.InsertItem(0, I;
            CollectibleInfo[I].Collectible.SetEnabled(false);
            CollectibleInfo[I].Collectible.SetActive(false);
            CollectibleInfo[I].CollectibleTrigger.bActive = false;
            ChooseNextCollectible();
            goto J0x164;
        }
        ++ I;
        goto J0x2E;
    }
    J0x164:

}

simulated function OnCarryableDropped(KFObjectiveCollectActor collectActor)
{
    if(!IsTimerActive('Timer_CollectibleDroppedCooldown'))
    {
        PlaySoundEvent(CollectibleDroppedSoundEvents, GetCollectibleIndexFromCollectActor(collectActor));
        SetTimer(CollectibleDroppedInterval, false, 'Timer_CollectibleDroppedCooldown');
    }
}

simulated function DrawIconAtLocation(KFHUDBase HUD, Canvas DrawCanvas, Texture2D Icon, Vector IconLocation, float XOffset, float YOffset)
{
    local Vector ScreenPos;
    local float ResModifier, ViewDot;
    local Vector ViewLocation, ViewVector;
    local Rotator ViewRotation;
    local PlayerController LocalPC;

    LocalPC = GetALocalPlayerController();
    if(LocalPC != none)
    {
        LocalPC.GetPlayerViewPoint(ViewLocation, ViewRotation);
        ViewVector = vector(ViewRotation);
    }
    ViewDot = Normal((IconLocation + (Class'KFPawn_Human'.default.CylinderComponent.CollisionHeight * vect(0, 0, 1))) - ViewLocation) Dot ViewVector;
    if((Icon != none) && ViewDot > float(0))
    {
        ResModifier = WorldInfo.GetResolutionBasedHUDScale() * HUD.FriendlyHudScale;
        ScreenPos = DrawCanvas.Project(IconLocation);
        ScreenPos.X += XOffset;
        ScreenPos.Y += YOffset;
        if((((ScreenPos.X < float(0)) || ScreenPos.X > DrawCanvas.ClipX) || ScreenPos.Y < float(0)) || ScreenPos.Y > DrawCanvas.ClipY)
        {
            return;
        }
        DrawCanvas.SetPos(ScreenPos.X, ScreenPos.Y + float(12));
        DrawCanvas.DrawTile(Icon, CollectActorIconSize * ResModifier, CollectActorIconSize * ResModifier, 0, 0, 256, 256);
    }
}

simulated function bool IsLocalPlayerCarryingACollectible()
{
    local PlayerController LocalPC;
    local KFPawn_Human KFPH;
    local Inventory InventoryItem;

    LocalPC = GetALocalPlayerController();
    if((LocalPC != none) && LocalPC.Pawn != none)
    {
        KFPH = KFPawn_Human(LocalPC.Pawn);
        InventoryItem = KFPH.InvManager.FindInventoryType(class<Inventory>(DeliveryClass), true);
        return (KFPH != none) && InventoryItem != none;
    }
    return false;
}

simulated function int GetNumRequired()
{
    local int PlayerCount;
    local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    PlayerCount = Clamp(KFGRI.GetNumPlayers(), 1, 6) - 1;
    if(PlayerCount < NumRequired.Length)
    {
        return NumRequired[PlayerCount];        
    }
    else
    {
        if(NumRequired.Length > 0)
        {
            return NumRequired[NumRequired.Length - 1];
        }
    }
    return 1;
}

simulated function int GetNumDesiredActive()
{
    local int PlayerCount;
    local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    PlayerCount = Clamp(KFGRI.GetNumPlayers(), 1, 6) - 1;
    if(PlayerCount < NumDesiredActiveCollectibles.Length)
    {
        return NumDesiredActiveCollectibles[PlayerCount];        
    }
    else
    {
        if(NumDesiredActiveCollectibles.Length > 0)
        {
            return NumDesiredActiveCollectibles[NumDesiredActiveCollectibles.Length - 1];
        }
    }
    return 1;
}

function Timer_CollectibleCollectCooldown();

function Timer_CollectibleDroppedCooldown();

defaultproperties
{
    NumRequired(0)=1
    DeliveryCloseAnimDelay=7
    CollectibleResetTimerLength=60
    bRandomSequence=true
    NumDesiredActiveCollectibles(0)=1
    DeliveryClass=Class'KFCarryableObject_Collectible'
    CollectActorIconSize=32
    CollectibleIconAvailableColor=(B=0,G=255,R=0,A=255)
    CollectibleIconCarriedColor=(B=255,G=70,R=185,A=255)
    UpdateTrailActorInterval=1
    CollectibleDroppedInterval=20
    CollectibleCollectInterval=20
    CollectActorReminderInterval=40
    LocalizationKey="TransportWaveObjective"
    NameShortLocKey="TransportWaveObjective"
    DescriptionLocKey="TransportWaveDescription"
    DescriptionShortLocKey="TransportWaveDescriptionShort"
    LocalizationPackageName="KFGame"
    RequirementsLocKey="RequiredCollectActor"
    PerPlayerSpawnRateMod=/* Array type was not detected. */
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__KFMapObjective_CollectActors.BrushComponent0'
    BrushComponent=BrushComponent0
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__KFMapObjective_CollectActors.BrushComponent0'
    Components(0)=BrushComponent0
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bStatic=false
    bCanStepUpOn=false
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    bMovable=false
    bIgnoreNetRelevancyCollision=true
    NetUpdateFrequency=0.1
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__KFMapObjective_CollectActors.BrushComponent0'
    CollisionComponent=BrushComponent0
    SupportedEvents=/* Array type was not detected. */
}