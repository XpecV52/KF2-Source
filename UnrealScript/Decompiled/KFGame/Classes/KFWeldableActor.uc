/*******************************************************************************
 * KFWeldableActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeldableActor extends Actor
    abstract
    native
    nativereplication
    notplaceable
    hidecategories(Navigation)
    implements(Interface_NavigationHandle);

struct native FXTemplate
{
    /** Particle system template to spawn */
    var() ParticleSystem ParticleTemplate;
    /** Offset from base location that particle system should spawn from. */
    var() Vector RelativeOffset;
    /** Offset from base rotation that particle system should spawn from. */
    var() Rotator RelativeRotation;

    structdefaultproperties
    {
        ParticleTemplate=none
        RelativeOffset=(X=0,Y=0,Z=0)
        RelativeRotation=(Pitch=0,Yaw=0,Roll=0)
    }
};

var private native const noexport Pointer VfTable_IInterface_NavigationHandle;
var repnotify transient KFWeldableComponent WeldableComponent;
var MaterialInstanceConstant IntegrityMIC;
/** Whether or not to start welded */
var() bool bStartWelded;
var repnotify transient bool bIsDestroyed;
var repnotify transient bool bWasRepaired;
/** Amount of damage a welded door can take */
var() int MaxWeldIntegrity;
var transient int WeldIntegrity;
var const float MinWeldScalar;
var transient float LastWeldTime;
var transient float LastUnweldTime;
var transient KFPawn WelderPawn;
var int DemoWeldRequired;
var transient int DemoWeld;
var byte RepairProgress;
/** Particle effect spawned when a door has been fully repaired */
var() FXTemplate RepairFXTemplate;
/** Repair sound event */
var() AkEvent RepairSound;
var protected Texture2D WelderIcon;
var transient Vector WeldUILocation;
var const localized string WeldIntegrityString;
var const localized string RepairProgressString;

replication
{
     if(bNetDirty)
        WeldableComponent, bIsDestroyed, 
        bWasRepaired;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'bIsDestroyed')
    {
        if(bIsDestroyed)
        {
            PlayDestroyed();
        }        
    }
    else
    {
        if(VarName == 'bWasRepaired')
        {
            if(bWasRepaired)
            {
                CompleteRepair();
            }            
        }
        else
        {
            if(VarName == 'WeldableComponent')
            {
                InitializeWeldableComponent();                
            }
            else
            {
                super.ReplicatedEvent(VarName);
            }
        }
    }
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    WeldUILocation = Location + (vect(0, 0, 1) * 164);
    if(Role == ROLE_Authority)
    {
        WeldableComponent = Spawn(Class'KFWeldableComponent', self);
        InitializeWeldableComponent();
    }
}

simulated function InitializeWeldableComponent();

function FastenWeld(int Amount, optional KFPawn Welder);

simulated function UpdateWeldIntegrity(int Amount)
{
    WeldIntegrity = Clamp(WeldIntegrity + Amount, 0, MaxWeldIntegrity);
    UpdateIntegrityMIC();
}

function Repair(float Amount, optional KFPawn Welder);

simulated function CompleteRepair();

simulated function UpdateIntegrityMIC();

simulated function PlayDestroyed();

function bool BeingWelded()
{
    return (LastWeldTime > LastUnweldTime) && (WorldInfo.TimeSeconds - LastWeldTime) < 0.75;
}

function bool BeingUnwelded()
{
    return (LastUnweldTime > LastWeldTime) && (WorldInfo.TimeSeconds - LastUnweldTime) < 0.75;
}

function bool CanExplosiveWeld()
{
    return false;
}

function AddExplosiveWeld(int Amount, KFPlayerController PC)
{
    DemoWeld = Min(DemoWeld + Amount, DemoWeldRequired);
}

event NotifyPathChanged();
