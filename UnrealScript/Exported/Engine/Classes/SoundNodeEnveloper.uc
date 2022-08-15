class SoundNodeEnveloper extends SoundNode
	native( Sound )
	hidecategories( Object )
	editinlinenew;


var( Looping )		float	LoopStart;
var( Looping )		float	LoopEnd;
var( Looping )		float	DurationAfterLoop;
var( Looping )		int		LoopCount;
var( Looping )		bool	bLoopIndefinitely;
var( Looping )		bool	bLoop;

var( Envelope )		DistributionFloatConstantCurve VolumeInterpCurve;
var( Envelope )		DistributionFloatConstantCurve PitchInterpCurve;

defaultproperties
{
   Begin Object Class=DistributionFloatConstantCurve Name=VolumeInterpCurve
      ConstantCurve=(Points=((OutVal=1.000000)))
      Name="VolumeInterpCurve"
      ObjectArchetype=DistributionFloatConstantCurve'Engine.Default__DistributionFloatConstantCurve'
   End Object
   VolumeInterpCurve=VolumeInterpCurve
   Begin Object Class=DistributionFloatConstantCurve Name=PitchInterpCurve
      ConstantCurve=(Points=((OutVal=1.000000)))
      Name="PitchInterpCurve"
      ObjectArchetype=DistributionFloatConstantCurve'Engine.Default__DistributionFloatConstantCurve'
   End Object
   PitchInterpCurve=PitchInterpCurve
   Name="Default__SoundNodeEnveloper"
   ObjectArchetype=SoundNode'Engine.Default__SoundNode'
}
