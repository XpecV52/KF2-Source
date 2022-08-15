/*******************************************************************************
 * ParticleModuleEventGenerator generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ParticleModuleEventGenerator extends ParticleModuleEventBase
    native(Particle)
    editinlinenew
    hidecategories(Object,Object,Object);

struct native ParticleEvent_GenerateInfo
{
    /** The type of event. */
    var() ParticleSystemComponent.EParticleEventType Type;
    /** How often to trigger the event (<= 1 means EVERY time). */
    var() int Frequency;
    /** Frequency range? (-1 indicates no - else [LowFreq..Frequency]. */
    var() int LowFreq;
    /** How often to trigger the event per particle (<= 1 means EVERY time) (collision only). */
    var() int ParticleFrequency;
    /** Only fire the first time (collision only). */
    var() bool FirstTimeOnly;
    /** Only fire the last time (collision only). */
    var() bool LastTimeOnly;
    /** Use the impact vector not the hit normal (collision only). */
    var() bool UseReflectedImpactVector;
    /** Should the event tag with a custom name? Leave blank for the default. */
    var() name CustomName;
    /** The events we want to fire off when this event has been generated */
    var() editinline array<editinline ParticleModuleEventSendToGame> ParticleModuleEventsToSendToGame;

    structdefaultproperties
    {
        Type=EParticleEventType.EPET_Any
        Frequency=0
        LowFreq=-1
        ParticleFrequency=0
        FirstTimeOnly=false
        LastTimeOnly=false
        UseReflectedImpactVector=false
        CustomName=None
        ParticleModuleEventsToSendToGame=none
    }
};

var(Events) noclear export array<export ParticleEvent_GenerateInfo> Events;

defaultproperties
{
    bSpawnModule=true
    bUpdateModule=true
}