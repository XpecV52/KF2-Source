/*******************************************************************************
 * EmitterCameraLensEffectBase generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class EmitterCameraLensEffectBase extends Emitter
    abstract
    native(Particle)
    placeable
    hidecategories(Navigation);

var protected ParticleSystem PS_CameraEffect;
var protected ParticleSystem PS_CameraEffectNonExtremeContent;
var float BaseFOV;
/**  
 *How far in front of the camera this emitter should live, assuming an FOV of 80 degrees. 
 *  Note that the actual distance will be automatically adjusted to account for the actual FOV.
 */
var() protected const float DistFromCamera;
/** TRUE if multiple instances of this emitter can exist simultaneously, FALSE otherwise. */
var() protectedwrite const bool bAllowMultipleInstances;
var array< class<EmitterCameraLensEffectBase> > EmittersToTreatAsSame;
var protected transient Camera BaseCamera;

function Destroyed()
{
    if(BaseCamera != none)
    {
        BaseCamera.RemoveCameraLensEffect(self);
    }
    super(Actor).Destroyed();
}

function RegisterCamera(Camera C)
{
    BaseCamera = C;
}

function NotifyRetriggered();

simulated function PostBeginPlay()
{
    ParticleSystemComponent.SetDepthPriorityGroup(2);
    super.PostBeginPlay();
    ActivateLensEffect();
}

simulated function ActivateLensEffect()
{
    local ParticleSystem PSToActuallySpawn;

    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(WorldInfo.GRI.ShouldShowGore())
        {
            PSToActuallySpawn = PS_CameraEffect;            
        }
        else
        {
            PSToActuallySpawn = PS_CameraEffectNonExtremeContent;
        }
        if(PSToActuallySpawn != none)
        {
            SetTemplate(PS_CameraEffect, bDestroyOnSystemFinish);
        }
    }
}

// Export UEmitterCameraLensEffectBase::execUpdateLocation(FFrame&, void* const)
native simulated function UpdateLocation(const out Vector CamLoc, const out Rotator CamRot, float CamFOVDeg);

defaultproperties
{
    BaseFOV=80
    DistFromCamera=90
    begin object name=ParticleSystemComponent0 class=ParticleSystemComponent
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
    object end
    // Reference: ParticleSystemComponent'Default__EmitterCameraLensEffectBase.ParticleSystemComponent0'
    ParticleSystemComponent=ParticleSystemComponent0
    bDestroyOnSystemFinish=true
    begin object name=ParticleSystemComponent0 class=ParticleSystemComponent
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
    object end
    // Reference: ParticleSystemComponent'Default__EmitterCameraLensEffectBase.ParticleSystemComponent0'
    Components(0)=ParticleSystemComponent0
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    TickGroup=ETickingGroup.TG_PostAsyncWork
    bNoDelete=false
    bNetInitialRotation=true
    LifeSpan=10
}