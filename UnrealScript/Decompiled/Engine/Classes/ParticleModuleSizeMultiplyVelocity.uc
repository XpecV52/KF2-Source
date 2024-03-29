/*******************************************************************************
 * ParticleModuleSizeMultiplyVelocity generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ParticleModuleSizeMultiplyVelocity extends ParticleModuleSizeBase
    native(Particle)
    editinlinenew
    hidecategories(Object,Object,Object);

/**  
 *The amount the velocity should be scaled prior to scaling the size of the particle. 
 *       The value is retrieved using the RelativeTime of the particle during its update.
 */
var(Size) RawDistributionVector VelocityMultiplier;
/**  
 *If true, the X-component of the scale factor will be applied to the particle size X-component.
 *       If false, the X-component is left unaltered.
 */
var(Size) bool MultiplyX;
/**  
 *If true, the Y-component of the scale factor will be applied to the particle size Y-component.
 *       If false, the Y-component is left unaltered.
 */
var(Size) bool MultiplyY;
/**  
 *If true, the Z-component of the scale factor will be applied to the particle size Z-component.
 *       If false, the Z-component is left unaltered.
 */
var(Size) bool MultiplyZ;
/** If set to non zero, the size will not be scaled above this size */
var(Size) Vector CapMaxSize;
/** If set to non zero, the size will not be scaled below this size */
var(Size) Vector CapMinSize;

defaultproperties
{
    VelocityMultiplier=Distribution=DistributionVectorConstant'Default__ParticleModuleSizeMultiplyVelocity.DistributionVelocityMultiplier',Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,0=/* Unknown default property type! */,
/* Exception thrown while deserializing VelocityMultiplier
System.ArgumentException: Requested value 'LookupTableTimeScale' was not found.
   at System.Enum.TryParseEnum(Type enumType, String value, Boolean ignoreCase, EnumResult& parseResult)
   at System.Enum.Parse(Type enumType, String value, Boolean ignoreCase)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    MultiplyX=true
    MultiplyY=true
    MultiplyZ=true
    bSpawnModule=true
    bUpdateModule=true
}