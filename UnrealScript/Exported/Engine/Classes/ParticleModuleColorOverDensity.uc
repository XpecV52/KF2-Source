class ParticleModuleColorOverDensity extends ParticleModuleColorBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** The color to apply to the particle, as a function of the particle density. */
var(Color)					rawdistributionvector	ColorOverDensity;
/** The alpha to apply to the particle, as a function of the particle density. */
var(Color)					rawdistributionfloat	AlphaOverDensity;


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
// (cpptext)

defaultproperties
{
   ColorOverDensity=(Distribution=DistributionColorOverDensity,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   AlphaOverDensity=(Distribution=DistributionAlphaOverDensity,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleColorOverDensity"
   ObjectArchetype=ParticleModuleColorBase'Engine.Default__ParticleModuleColorBase'
}
