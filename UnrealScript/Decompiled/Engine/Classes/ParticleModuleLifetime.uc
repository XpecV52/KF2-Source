/*******************************************************************************
 * ParticleModuleLifetime generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ParticleModuleLifetime extends ParticleModuleLifetimeBase
    native(Particle)
    editinlinenew
    hidecategories(Object,Object,Object);

/** The lifetime of the particle, in seconds. Retrieved using the EmitterTime at the spawn of the particle. */
var(Lifetime) RawDistributionFloat Lifetime;

defaultproperties
{
    Lifetime=Distribution=DistributionFloatUniform'Default__ParticleModuleLifetime.DistributionLifetime',Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,0=/* Unknown default property type! */,
/* Exception thrown while deserializing Lifetime
System.ArgumentException: Requested value '3rd' was not found.
   at System.Enum.TryParseEnum(Type enumType, String value, Boolean ignoreCase, EnumResult& parseResult)
   at System.Enum.Parse(Type enumType, String value, Boolean ignoreCase)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    bSpawnModule=true
}