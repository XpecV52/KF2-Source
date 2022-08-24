//=============================================================================
// KFMGA_Target
//=============================================================================
// Actor used as an individual target in any of the target minigames.  Calls
//      back into the base target game that spawned it when it takes valid
//      damage.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

class KFMGA_Target extends Actor
    implements(KFInterface_MinigameTarget);

/** Visual component of the target */
var() StaticMeshComponent Mesh;

/** Collision cylinder*/
var() CylinderComponent CollisionCylinder;

/** How many hits before the game is notified of "death" */
var() repnotify int NumHits;

/** Rigged target game that spawned this target.  Used to sync owner chain on remote clients */
var repnotify KFMG_TargetGame SpawnerOwner;

/** Index this was added in to make sure arrays stay fully in sync */
var repnotify int SpawnerOwnerIndex;

/** Whether or not to ignore radius damage sources (ex: grenades) */
var() bool bIgnoreRadiusDamage;

/** Whether or not target is active */
var repnotify bool bActiveTarget;

/** List of acceptable damage types */
var array< class<DamageType> > AcceptedDamageTypes;

/** Name of bone we are based on */
var name AttachBoneName;

//----------------------
// Client FX
var() ParticleSystem DeathVFXTemplate;
var() AkEvent DeathSFX;
var() AkComponent DeathSFXComponent;
var() AkEvent InvalidHitSFX;

replication
{
    if (bNetDirty)
        SpawnerOwner, SpawnerOwnerIndex, bActiveTarget, NumHits;
}

simulated event ReplicatedEvent(name VarName)
{
    super.ReplicatedEvent(VarName);

    //Allow the target to manage its own state in the main rig's targets array.
    if (VarName == 'SpawnerOwner' || VarName == 'SpawnerOwnerIndex')
    {
        if (SpawnerOwner != none && SpawnerOwnerIndex >= 0)
        {
            AddToOwnerArray();
        }
    }
    else if (VarName == 'bActiveTarget')
    {
        if (bActiveTarget)
        {
            SetActive();
        }
        else
        {
            SetInactive();
        }
    }
    else if (VarName == 'NumHits')
    {
        if (NumHits == 0)
        {
            PlayDeath();
        }
    }
}

/** Called via repnotify on clients to sync with main spawner's target array */
simulated function AddToOwnerArray()
{
    if (SpawnerOwner.MinigameTargets.Find(self) == INDEX_NONE)
    {
        SpawnerOwner.MinigameTargets[SpawnerOwnerIndex] = self;
        SpawnerOwner.UpdateBase(self);
    }
}

simulated function TakeRadiusDamage(Controller InstigatedBy, float BaseDamage, float DamageRadius, class<DamageType> DamageType, float Momentum, vector HurtOrigin, bool bFullDamage, Actor DamageCauser, optional float DamageFalloffExponent = 1.f)
{
    if (!bIgnoreRadiusDamage || AcceptedDamageTypes.Find(DamageType) != INDEX_NONE)
    {
        TakeDamage(BaseDamage, InstigatedBy, HurtOrigin, vect(0,0,0), DamageType, , DamageCauser);
    }
}

/** The amount of damage is unimportant in this case.  These targets will never be killed, but simply be reset
 *      to their initial condition upon "death".  Track number of hits and go into death condition once
 *      specified hit count has been reached.
 */
simulated event TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
    local int i;

    if (!bActiveTarget)
    {
        return;
    }

    for (i = 0; i < AcceptedDamageTypes.Length; ++i)
    {
        //Valid hit
        if (DamageType == AcceptedDamageTypes[i] || ClassIsChildOf(DamageType, AcceptedDamageTypes[i]))
        {
            ValidHit(EventInstigator, DamageCauser);
            return;
        }
    }
        
    InvalidHit(EventInstigator, DamageCauser);
}

function ValidHit(Controller EventInstigator, Actor HitActor)
{
    local KFMG_TargetGame TargetGame;

    if (Role == ROLE_Authority)
    {
        --NumHits;
        if (NumHits <= 0)
        {
            PlayDeath();
            SetInactive();
            TargetGame = KFMG_TargetGame(Owner);
            if (TargetGame != none)
            {
                TargetGame.TargetHit(self, EventInstigator);
            }
        }
    }
}

simulated function InvalidHit(Controller EventInstigator, Actor HitActor)
{
    if (DeathSFXComponent != none)
    {
        DeathSFXComponent.PlayEvent(InvalidHitSFX, , false, true);
    }
}

/** Do any resets necessary here, including health and visual items. */
simulated event Reset()
{
    super.Reset();

    SetRelativeLocation(vect(0, 0, 0));
    NumHits = default.NumHits;
}

simulated event SetActive()
{
    bActiveTarget = true;
    SetHidden(false);
}

simulated event SetInactive()
{
    bActiveTarget = false;
    SetHidden(true);
}

simulated event Finalize();

simulated event PlayDeath()
{
    if (WorldInfo.NetMode != NM_DedicatedServer && !IsAlive())
    {
        if (DeathVFXTemplate != none)
        {
            WorldInfo.MyEmitterPool.SpawnEmitter(DeathVFXTemplate, Location);
        }
        
        if (DeathSFXComponent != none)
        {
            DeathSFXComponent.PlayEvent(DeathSFX, , false, true);
        }        
    }
}

simulated function bool IsAlive()
{
    return NumHits > 0;
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=Mesh0
      ReplacementPrimitive=None
      Name="Mesh0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   Mesh=Mesh0
   Begin Object Class=CylinderComponent Name=Cylinder0
      CollisionHeight=25.000000
      CollisionRadius=25.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="Cylinder0"
      ObjectArchetype=CylinderComponent'Engine.Default__CylinderComponent'
   End Object
   CollisionCylinder=Cylinder0
   NumHits=1
   SpawnerOwnerIndex=-1
   bIgnoreRadiusDamage=True
   AcceptedDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_9mm'
   Begin Object Class=AkComponent Name=DeathSFX0
      Name="DeathSFX0"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   DeathSFXComponent=DeathSFX0
   Components(0)=Cylinder0
   Components(1)=Mesh0
   Components(2)=DeathSFX0
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_TouchAll
   bAlwaysRelevant=True
   bCanBeDamaged=True
   bCollideActors=True
   bProjTarget=True
   NetPriority=2.500000
   CollisionComponent=Cylinder0
   Name="Default__KFMGA_Target"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
