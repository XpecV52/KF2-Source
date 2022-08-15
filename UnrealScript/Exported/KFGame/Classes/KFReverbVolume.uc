class KFReverbVolume extends ReverbVolume
    native(Effect)
	placeable
	hidecategories(Advanced, Attachment, Collision, Volume, Toggle, UAudio);

struct native WWiseEnvironmentSettings
{
    var() ReverbPreset  EnvironmentID;
    var() float         EnvironmentValue;
    var() float         FadeTime;

    structdefaultproperties
	{
		EnvironmentID=REVERB_Default
		EnvironmentValue=1.0f
		FadeTime=1.0f
	}
};

struct native WwiseStateSettings
{
    var() name StateGroupName;
    var() name StateName;
};

/** WWise environment (auxiliary bus) settings to use for this volume */
var() editfixedsize array<WWiseEnvironmentSettings> ReverbEnvironments;

var() WwiseStateSettings StateSettings;

/** How much of the calculated audio occlusion value to apply to sounds played witin this volume whose listeners are also within this volume */
var() float IntraVolumeOcclusionScalar<ClampMin = 0.0 | ClampMax = 1.0>;

var array<Name> EnvironmentNames;

/** Array of distances to play eccho sounds at associated with each ReverbPreset */
var array<float> EnvironmentEchoDistances;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * Get the EchoDistance based on the ReverbPreset of this volume
 *
 * @return The EchoDistance for the ReverbPreset this volume is set to
 */
simulated function float GetEnvironmentEchoDistance()
{
    if( ReverbEnvironments.Length > 0 )
    {
        return EnvironmentEchoDistances[ReverbEnvironments[0].EnvironmentID];
    }

    return 0.0;
}

simulated static function CalculateEchoVolumeAndDistance( WorldInfo WI, vector SourceLocation, out ReverbVolume EchoVolume, out float EchoDistance )
{
    EchoVolume = WI.GetReverbVolume( SourceLocation );

    if( EchoVolume != none )
    {
        EchoDistance = EchoVolume.GetEnvironmentEchoDistance();
    }
    else
    {
        EchoDistance = class'KFReverbVolume'.default.EnvironmentEchoDistances[REVERB_Default];
    }
}

simulated static function CalculateEchoLocationAndDelay( ReverbVolume EchoVolume, vector SourceLoc, vector EchoDir, float EchoDist, out vector EchoLoc, out float EchoDelay )
{
    local vector NewHitLocation, HitNormal;

    // Calculate the EchoDistance (it's delay actually). 34029 UUS/S is the speed
    // of sound at sea level
    if( EchoDist > 0 )
    {
        EchoDelay = FMin((EchoDist/34029.0) * 3,5.0);
    }
    else
    {
        EchoDelay = 0;
    }

    if( EchoVolume != none )
    {
        // Calculate the echo sound locations, but trace twice as far out initially to find the edges of the volume
        EchoLoc = SourceLoc + EchoDir * EchoDist * 2.f;

        // Check to see if this echo location will be outside the volume for the front left echo,
        // and if so pull it back inside the volume
        EchoVolume.TraceComponent(NewHitLocation, HitNormal, EchoVolume.CollisionComponent, SourceLoc, EchoLoc);
        if( NewHitLocation != EchoLoc )
        {
            EchoLoc = NewHitLocation - ((NewHitLocation - SourceLoc) * 0.05);

            // update the delay
            EchoDelay = FMin((VSize(NewHitLocation - SourceLoc)/34029.0) * 3,5.0);
            //`log("AdjustedDelay = "$(VSize(NewHitLocation - SourceLoc)/100.0)$" Meters delay = "$EchoDelay);
            return;
        }
    }

    // default echo location
    EchoLoc = SourceLoc + EchoDir * EchoDist;
}

defaultproperties
{
   IntraVolumeOcclusionScalar=1.000000
   EnvironmentNames(0)="NAME_None"
   EnvironmentNames(1)="NAME_None"
   EnvironmentNames(2)="NAME_None"
   EnvironmentNames(3)="NAME_None"
   EnvironmentNames(4)="NAME_None"
   EnvironmentNames(5)="NAME_None"
   EnvironmentNames(6)="NAME_None"
   EnvironmentNames(7)="NAME_None"
   EnvironmentNames(8)="NAME_None"
   EnvironmentNames(9)="Outdoor_Forest"
   EnvironmentNames(10)="Outdoor_City"
   EnvironmentNames(11)="Outdoor_Mountain"
   EnvironmentNames(12)="NAME_None"
   EnvironmentNames(13)="NAME_None"
   EnvironmentNames(14)="NAME_None"
   EnvironmentNames(15)="NAME_None"
   EnvironmentNames(16)="NAME_None"
   EnvironmentNames(17)="Indoor_Small"
   EnvironmentNames(18)="Indoor_Medium"
   EnvironmentNames(19)="Indoor_Large"
   EnvironmentNames(20)="NAME_None"
   EnvironmentNames(21)="NAME_None"
   EnvironmentNames(22)="NAME_None"
   EnvironmentEchoDistances(0)=200.000000
   EnvironmentEchoDistances(1)=200.000000
   EnvironmentEchoDistances(2)=200.000000
   EnvironmentEchoDistances(3)=200.000000
   EnvironmentEchoDistances(4)=200.000000
   EnvironmentEchoDistances(5)=200.000000
   EnvironmentEchoDistances(6)=200.000000
   EnvironmentEchoDistances(7)=200.000000
   EnvironmentEchoDistances(8)=200.000000
   EnvironmentEchoDistances(9)=200.000000
   EnvironmentEchoDistances(10)=200.000000
   EnvironmentEchoDistances(11)=200.000000
   EnvironmentEchoDistances(12)=200.000000
   EnvironmentEchoDistances(13)=200.000000
   EnvironmentEchoDistances(14)=200.000000
   EnvironmentEchoDistances(15)=200.000000
   EnvironmentEchoDistances(16)=0.000000
   EnvironmentEchoDistances(17)=200.000000
   EnvironmentEchoDistances(18)=200.000000
   EnvironmentEchoDistances(19)=200.000000
   EnvironmentEchoDistances(20)=200.000000
   EnvironmentEchoDistances(21)=200.000000
   EnvironmentEchoDistances(22)=200.000000
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__ReverbVolume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__ReverbVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionComponent=BrushComponent0
   Name="Default__KFReverbVolume"
   ObjectArchetype=ReverbVolume'Engine.Default__ReverbVolume'
}
