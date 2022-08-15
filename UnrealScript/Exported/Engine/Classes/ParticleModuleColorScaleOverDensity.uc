//-----------------------------------------------------------
// Particle Module to scale color and alpha over density
//-----------------------------------------------------------
class ParticleModuleColorScaleOverDensity extends ParticleModuleColorBase
    native(Particle)
	editinlinenew
	hidecategories(Object);;

/** The color to apply to the particle, as a function of the particle Density. */
var(Color)					rawdistributionvector	ColorScaleOverDensity;
/** The alpha to apply to the particle, as a function of the particle Density. */
var(Color)					rawdistributionfloat	AlphaScaleOverDensity;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   ColorScaleOverDensity=(Distribution=DistributionColorScaleOverDensity,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   AlphaScaleOverDensity=(Distribution=DistributionAlphaScaleOverDensity,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleColorScaleOverDensity"
   ObjectArchetype=ParticleModuleColorBase'Engine.Default__ParticleModuleColorBase'
}
