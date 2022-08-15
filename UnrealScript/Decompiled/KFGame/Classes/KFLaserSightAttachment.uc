/*******************************************************************************
 * KFLaserSightAttachment generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFLaserSightAttachment extends Object
    native(Effect)
    hidecategories(Object);

/** Static Mesh */
var() StaticMesh LaserDotMesh;
var export editinline transient StaticMeshComponent LaserDotMeshComp;
/** Laser Mesh */
var() SkeletalMesh LaserBeamMesh;
var export editinline transient KFSkeletalMeshComponent LaserBeamMeshComp;
/** Socket to attach the LaserSight to */
var() name LaserSightSocketName;
var() float LaserSightRange;
var float AnimWeight;
var float AnimBlendRate;
var transient float LaserSightAimStrength;
var transient bool LaserAimBlendIn;
var transient bool LaserAimBlendOut;
var float WeapAttachmentSkipTickInterval;
var transient float LastWeapAttachmentUpdateTime;

function AttachLaserSight(SkeletalMeshComponent OwnerMesh, bool bFirstPerson, optional name SocketNameOverride)
{
    if(OwnerMesh == none)
    {
        LogInternal("Invalid mesh for laser sight " @ string(self));
        return;
    }
    if(SocketNameOverride != 'None')
    {
        LaserSightSocketName = SocketNameOverride;
    }
    if((LaserDotMesh != none) && bFirstPerson)
    {
        LaserDotMeshComp.SetStaticMesh(LaserDotMesh);
        OwnerMesh.AttachComponentToSocket(LaserDotMeshComp, LaserSightSocketName);
    }
    if(LaserBeamMesh != none)
    {
        LaserBeamMeshComp.SetSkeletalMesh(LaserBeamMesh);
        OwnerMesh.AttachComponentToSocket(LaserBeamMeshComp, LaserSightSocketName);
        if(bFirstPerson)
        {
            LaserBeamMeshComp.SetDepthPriorityGroup(2);
        }
        if(OwnerMesh.IsA('KFSkeletalMeshComponent'))
        {
            LaserBeamMeshComp.SetFOV(KFSkeletalMeshComponent(OwnerMesh).FOV);
        }
    }
}

simulated function SetAimBlendState(bool bBlendIn, bool bBlendOut)
{
    LaserAimBlendIn = bBlendIn;
    LaserAimBlendOut = bBlendOut;
}

simulated function Update(float DeltaTime, KFWeapon OwningWeapon)
{
    local Vector TraceStart, TraceEnd, InstantTraceHitLocation, InstantTraceHitNormal, HitLocation, HitNormal,
	    TraceAimDir, SocketSpaceNewTraceDir, WorldSpaceNewTraceDir, SocketSpaceAimLocation, SocketSpaceAimDir;

    local Actor HitActor;
    local TraceHitInfo HitInfo;
    local Rotator SocketRotation;
    local Matrix SocketToWorldTransform;
    local float MaxAimStrength;
    local Vector DirA, DirB;
    local Quat Q;

    if(((OwningWeapon != none) && OwningWeapon.Instigator != none) && OwningWeapon.Instigator.IsFirstPerson())
    {
        MaxAimStrength = 1 - AnimWeight;
        if(LaserAimBlendIn && LaserSightAimStrength < MaxAimStrength)
        {
            LaserSightAimStrength = FMin(LaserSightAimStrength + (AnimBlendRate * DeltaTime), MaxAimStrength);            
        }
        else
        {
            if(LaserAimBlendOut && LaserSightAimStrength > 0)
            {
                LaserSightAimStrength = FMax(LaserSightAimStrength - (AnimBlendRate * DeltaTime), 0);                
            }
            else
            {
                LaserAimBlendIn = false;
                LaserAimBlendOut = false;
            }
        }
        if(OwningWeapon.IsInState('Active'))
        {
            TraceStart = OwningWeapon.Instigator.GetWeaponStartTraceLocation();
            TraceAimDir = vector(OwningWeapon.Instigator.GetAdjustedAimFor(OwningWeapon, TraceStart));
            TraceEnd = TraceStart + (TraceAimDir * LaserSightRange);
            HitActor = OwningWeapon.GetTraceOwner().Trace(InstantTraceHitLocation, InstantTraceHitNormal, TraceEnd, TraceStart, true,, HitInfo, 1);
            if(HitActor != none)
            {
                if(LaserSightAimStrength < 1)
                {
                    if((OwningWeapon.MySkelMesh != none) && OwningWeapon.MySkelMesh.GetSocketWorldLocationAndRotation(LaserSightSocketName, TraceStart, SocketRotation))
                    {
                        SocketToWorldTransform = OwningWeapon.MySkelMesh.GetSocketMatrix(LaserSightSocketName);
                        SocketSpaceAimLocation = InverseTransformVector(SocketToWorldTransform, InstantTraceHitLocation);
                        SocketSpaceAimDir = Normal(SocketSpaceAimLocation);
                        DirB = vect(1, 0, 0);
                        DirA = SocketSpaceAimDir;
                        if((DirA Dot DirB) < 0.995)
                        {
                            Q = QuatFromAxisAndAngle(Normal(DirB Cross DirA), 0.1);
                            SocketSpaceAimDir = QuatRotateVector(Q, DirB);
                        }
                        SocketSpaceNewTraceDir = (LaserSightAimStrength * SocketSpaceAimDir) + ((1 - LaserSightAimStrength) * DirB);
                        WorldSpaceNewTraceDir = TransformVector(SocketToWorldTransform, SocketSpaceNewTraceDir) - TraceStart;
                        TraceEnd = TraceStart + (Normal(WorldSpaceNewTraceDir) * LaserSightRange);
                        HitActor = OwningWeapon.GetTraceOwner().Trace(HitLocation, HitNormal, TraceEnd, TraceStart, true,, HitInfo, 1);
                        if(HitActor != none)
                        {
                            LaserDotMeshComp.SetHidden(false);
                            AimAt(HitLocation, HitNormal, OwningWeapon.MySkelMesh);                            
                        }
                        else
                        {
                            LaserDotMeshComp.SetHidden(true);
                        }
                    }                    
                }
                else
                {
                    LaserDotMeshComp.SetHidden(false);
                    AimAt(InstantTraceHitLocation, InstantTraceHitNormal, OwningWeapon.MySkelMesh);
                }                
            }
            else
            {
                LaserDotMeshComp.SetHidden(true);
            }            
        }
        else
        {
            if(!OwningWeapon.IsInState('Inactive'))
            {
                if((OwningWeapon.MySkelMesh != none) && OwningWeapon.MySkelMesh.GetSocketWorldLocationAndRotation(LaserSightSocketName, TraceStart, SocketRotation))
                {
                    TraceEnd = TraceStart + (vector(SocketRotation) * LaserSightRange);
                    HitActor = OwningWeapon.GetTraceOwner().Trace(HitLocation, HitNormal, TraceEnd, TraceStart, true,, HitInfo, 1);
                    if(HitActor != none)
                    {
                        LaserDotMeshComp.SetHidden(false);
                        AimAt(HitLocation, HitNormal, OwningWeapon.MySkelMesh);                        
                    }
                    else
                    {
                        LaserDotMeshComp.SetHidden(true);
                    }
                }
            }
        }
    }
}

function AimAt(Vector HitLocation, Vector HitNormal, SkeletalMeshComponent ParentMesh)
{
    local Vector SocketSpaceAimLocation;
    local Matrix SocketToWorldTransform;
    local float LaserDotScale;

    SocketToWorldTransform = ParentMesh.GetSocketMatrix(LaserSightSocketName);
    SocketSpaceAimLocation = InverseTransformVector(SocketToWorldTransform, HitLocation);
    LaserDotMeshComp.SetTranslation(SocketSpaceAimLocation);
    LaserDotScale = 1 + ((10 - 1) * FMax((SocketSpaceAimLocation.X - 500) / (6000 - 500), 0));
    LaserDotMeshComp.SetScale(LaserDotScale);
}

defaultproperties
{
    begin object name=LaserDotStaticMeshComponent class=StaticMeshComponent
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        CastShadow=false
        CollideActors=false
        BlockActors=false
        BlockZeroExtent=false
        BlockNonZeroExtent=false
        BlockRigidBody=false
        TickGroup=ETickingGroup.TG_PostAsyncWork
    object end
    // Reference: StaticMeshComponent'Default__KFLaserSightAttachment.LaserDotStaticMeshComponent'
    LaserDotMeshComp=LaserDotStaticMeshComponent
    begin object name=LaserBeamMeshComp class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFLaserSightAttachment.LaserBeamMeshComp'
    LaserBeamMeshComp=LaserBeamMeshComp
    LaserSightRange=10000
    AnimBlendRate=12
    WeapAttachmentSkipTickInterval=0.5
}