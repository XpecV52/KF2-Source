//-----------------------------------------------------------
// Particle Module to scale size over density
//-----------------------------------------------------------
class ParticleModuleSizeScaleOverDensity extends ParticleModuleSizeBase
    native(Particle)
	editinlinenew
	hidecategories(Object);;

/** The size scale to apply to the particle, as a function of the particle Density. */
var(Size)					rawdistributionvector	SizeScaleOverDensity;


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
   SizeScaleOverDensity=(Distribution=DistributionSizeScaleOverDensity,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleSizeScaleOverDensity"
   ObjectArchetype=ParticleModuleSizeBase'Engine.Default__ParticleModuleSizeBase'
}
