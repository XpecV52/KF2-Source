/*******************************************************************************
 * KFWeapAttach_Railgun generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeapAttach_Railgun extends KFWeaponAttachment
    hidecategories(Navigation,Object,Movement,Attachment,Collision,Physics,Advanced,Debug,Mobile);

var AkEvent AmbientSoundPlayEvent;
var AkEvent AmbientSoundStopEvent;

simulated function StartAmbientSound()
{
    if((Instigator != none) && !Instigator.IsFirstPerson())
    {
        if(AmbientSoundPlayEvent != none)
        {
            Instigator.PlaySoundBase(AmbientSoundPlayEvent, true, true, true,, true);
        }
    }
}

simulated function StopAmbientSound()
{
    if(AmbientSoundStopEvent != none)
    {
        Instigator.PlaySoundBase(AmbientSoundStopEvent, true, true, true,, true);
    }
}

simulated function AttachTo(KFPawn P)
{
    super.AttachTo(P);
    StartAmbientSound();
}

simulated function DetachFrom(KFPawn P)
{
    StopAmbientSound();
    super.DetachFrom(P);
}

simulated function Destroyed()
{
    StopAmbientSound();
    super(Actor).Destroyed();
}

simulated function SpawnTracer(Vector EffectLocation, Vector HitLocation)
{
    local editinline ParticleSystemComponent E;
    local Vector Dir;
    local float DistSq, TracerDuration;
    local KFTracerInfo TracerInfo;

    if((Instigator == none) || Instigator.FiringMode >= TracerInfos.Length)
    {
        return;
    }
    TracerInfo = TracerInfos[Instigator.FiringMode];
    if(((!self.WorldInfo.TimeDilation < 1 && TracerInfo.bDoTracerDuringNormalTime) || (self.WorldInfo.TimeDilation < 1) && TracerInfo.bDoTracerDuringZedTime) && TracerInfo.TracerTemplate != none)
    {
        Dir = HitLocation - EffectLocation;
        DistSq = VSizeSq(Dir);
        if(DistSq > float(TracerInfo.MinTracerEffectDistanceSquared))
        {
            TracerDuration = FMin((Sqrt(DistSq) - 100) / float(TracerInfo.TracerVelocity), 1);
            if(TracerDuration > 0)
            {
                E = WorldInfo.MyEmitterPool.SpawnEmitter(TracerInfo.TracerTemplate, EffectLocation, rotator(Dir));
                E.SetFloatParameter('Tracer_Lifetime', TracerDuration);
                E.SetVectorParameter('Shotend', HitLocation);
            }
        }
    }
}

defaultproperties
{
    AmbientSoundPlayEvent=AkEvent'ww_wep_sa_railgun.Play_Railgun_Loop'
    AmbientSoundStopEvent=AkEvent'ww_wep_sa_railgun.Stop_Railgun_Loop'
    begin object name=SkeletalMeshComponent0 class=SkeletalMeshComponent
        Animations=AnimNodeSequence'Default__KFWeapAttach_Railgun.SkeletalMeshComponent0.MeshSequenceA'
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFWeapAttach_Railgun.SkeletalMeshComponent0'
    WeapMesh=SkeletalMeshComponent0
}