/*******************************************************************************
 * KFAISpawnManager_Tutorial generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAISpawnManager_Tutorial extends KFAISpawnManager within KFGameInfo
    config(Game);

defaultproperties
{
    Waves=/* Array type was not detected. */
    SoloWaveSpawnRateModifier=RateModifier=/* Array type was not detected. */,
/* Exception thrown while deserializing SoloWaveSpawnRateModifier
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    EarlyWaveIndex=2
}