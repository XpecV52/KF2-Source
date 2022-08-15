/*******************************************************************************
 * KFReverbVolume generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFReverbVolume extends ReverbVolume
    native(Effect)
    dontsortcategories(ReverbVolume)
    hidecategories(Navigation,Object,Movement,Display,Advanced,Attachment,Collision,Volume,Toggle,Advanced,Attachment,Collision,Volume,Toggle,UAudio);

struct native WWiseEnvironmentSettings
{
    var() Engine.ReverbVolume.ReverbPreset EnvironmentID;
    var() float EnvironmentValue;
    var() float FadeTime;

    structdefaultproperties
    {
        EnvironmentID=ReverbPreset.REVERB_Default
        EnvironmentValue=1
        FadeTime=1
    }
};

struct native WwiseStateSettings
{
    var() name StateGroupName;
    var() name StateName;

    structdefaultproperties
    {
        StateGroupName=None
        StateName=None
    }
};

/** WWise environment (auxiliary bus) settings to use for this volume */
var() editfixedsize array<WWiseEnvironmentSettings> ReverbEnvironments;
var() WwiseStateSettings StateSettings;
/** How much of the calculated audio occlusion value to apply to sounds played witin this volume whose listeners are also within this volume */
var() float IntraVolumeOcclusionScalar<ClampMin=0.0|ClampMax=1.0>;
var array<name> EnvironmentNames;
var array<float> EnvironmentEchoDistances;

simulated function float GetEnvironmentEchoDistance()
{
    if(ReverbEnvironments.Length > 0)
    {
        return EnvironmentEchoDistances[ReverbEnvironments[0].EnvironmentID];
    }
    return 0;
}

static simulated function CalculateEchoVolumeAndDistance(WorldInfo WI, Vector SourceLocation, out ReverbVolume EchoVolume, out float EchoDistance)
{
    EchoVolume = WI.GetReverbVolume(SourceLocation);
    if(EchoVolume != none)
    {
        EchoDistance = EchoVolume.GetEnvironmentEchoDistance();        
    }
    else
    {
        EchoDistance = Class'KFReverbVolume'.default.EnvironmentEchoDistances[0];
    }
}

static simulated function CalculateEchoLocationAndDelay(ReverbVolume EchoVolume, Vector SourceLoc, Vector EchoDir, float EchoDist, out Vector EchoLoc, out float EchoDelay)
{
    local Vector NewHitLocation, HitNormal;

    if(EchoDist > float(0))
    {
        EchoDelay = FMin((EchoDist / 34029) * 2, 5);        
    }
    else
    {
        EchoDelay = 0;
    }
    if(EchoVolume != none)
    {
        EchoLoc = SourceLoc + ((EchoDir * EchoDist) * 2);
        EchoVolume.TraceComponent(NewHitLocation, HitNormal, EchoVolume.CollisionComponent, SourceLoc, EchoLoc);
        if(NewHitLocation != EchoLoc)
        {
            EchoLoc = NewHitLocation - ((NewHitLocation - SourceLoc) * 0.05);
            EchoDelay = FMin((VSize(NewHitLocation - SourceLoc) / 34029) * 2, 5);
            return;
        }
    }
    EchoLoc = SourceLoc + (EchoDir * EchoDist);
}

defaultproperties
{
    ReverbEnvironments(0)=(EnvironmentID=ReverbPreset.REVERB_Default,EnvironmentValue=1,FadeTime=1)
    IntraVolumeOcclusionScalar=1
    EnvironmentNames(0)=NAME_None
    EnvironmentNames(1)=NAME_None
    EnvironmentNames(2)=NAME_None
    EnvironmentNames(3)=NAME_None
    EnvironmentNames(4)=NAME_None
    EnvironmentNames(5)=NAME_None
    EnvironmentNames(6)=NAME_None
    EnvironmentNames(7)=NAME_None
    EnvironmentNames(8)=NAME_None
    EnvironmentNames(9)=Outdoor_Forest
    EnvironmentNames(10)=Outdoor_City
    EnvironmentNames(11)=Outdoor_Mountain
    EnvironmentNames(12)=NAME_None
    EnvironmentNames(13)=NAME_None
    EnvironmentNames(14)=NAME_None
    EnvironmentNames(15)=NAME_None
    EnvironmentNames(16)=NAME_None
    EnvironmentNames(17)=Indoor_Small
    EnvironmentNames(18)=Indoor_Medium
    EnvironmentNames(19)=Indoor_Large
    EnvironmentNames(20)=NAME_None
    EnvironmentNames(21)=NAME_None
    EnvironmentNames(22)=NAME_None
    EnvironmentEchoDistances(0)=200
    EnvironmentEchoDistances(1)=200
    EnvironmentEchoDistances(2)=200
    EnvironmentEchoDistances(3)=200
    EnvironmentEchoDistances(4)=200
    EnvironmentEchoDistances(5)=200
    EnvironmentEchoDistances(6)=200
    EnvironmentEchoDistances(7)=200
    EnvironmentEchoDistances(8)=200
    EnvironmentEchoDistances(9)=200
    EnvironmentEchoDistances(10)=200
    EnvironmentEchoDistances(11)=200
    EnvironmentEchoDistances(12)=200
    EnvironmentEchoDistances(13)=200
    EnvironmentEchoDistances(14)=200
    EnvironmentEchoDistances(15)=200
    EnvironmentEchoDistances(16)=0
    EnvironmentEchoDistances(17)=200
    EnvironmentEchoDistances(18)=200
    EnvironmentEchoDistances(19)=200
    EnvironmentEchoDistances(20)=200
    EnvironmentEchoDistances(21)=200
    EnvironmentEchoDistances(22)=200
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__KFReverbVolume.BrushComponent0'
    BrushComponent=BrushComponent0
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__KFReverbVolume.BrushComponent0'
    Components(0)=BrushComponent0
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__KFReverbVolume.BrushComponent0'
    CollisionComponent=BrushComponent0
}