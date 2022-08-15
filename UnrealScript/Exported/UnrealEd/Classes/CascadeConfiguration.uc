/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
//=============================================================================
// CascadeConfiguration
//
// Settings for Cascade that users are not allowed to alter.
//=============================================================================
class CascadeConfiguration extends Object	
	hidecategories(Object)
	config(Editor)
	native;	

/** Module-to-TypeData mapping helper. */
struct native ModuleMenuMapper
{
	var string ObjName;
	var array<string> InvalidObjNames;
};

/**
 *	TypeData-to-base module mappings.
 *	These will disallow complete 'sub-menus' depending on the TypeData utilized.
 */
var(Configure) config array<ModuleMenuMapper> ModuleMenu_TypeDataToBaseModuleRejections;
/** Module-to-TypeData mappings. */
var(Configure) config array<ModuleMenuMapper> ModuleMenu_TypeDataToSpecificModuleRejections;
/** Modules that Cascade should ignore in the menu system. */
var(Configure) config array<string> ModuleMenu_ModuleRejections;

defaultproperties
{
   ModuleMenu_TypeDataToBaseModuleRejections(0)=(ObjName="None",InvalidObjNames=("ParticleModuleBeamBase","ParticleModuleTrailBase"))
   ModuleMenu_TypeDataToBaseModuleRejections(1)=(ObjName="ParticleModuleTypeDataBeam2",InvalidObjNames=("ParticleModuleTrailBase"))
   ModuleMenu_TypeDataToBaseModuleRejections(2)=(ObjName="ParticleModuleTypeDataTrail2",InvalidObjNames=("ParticleModuleBeamBase"))
   ModuleMenu_TypeDataToBaseModuleRejections(3)=(ObjName="ParticleModuleTypeDataMesh",InvalidObjNames=("ParticleModuleBeamBase","ParticleModuleTrailBase"))
   ModuleMenu_TypeDataToBaseModuleRejections(4)=(ObjName="ParticleModuleTypeDataMeshPhysX",InvalidObjNames=("ParticleModuleBeamBase","ParticleModuleTrailBase","ParticleModuleAccelerationBase","ParticleModuleAttractorBase","ParticleModuleCollisionBase","ParticleModuleEventBase","ParticleModuleEventReceiverBase","ParticleModuleKillBase","ParticleModuleOrbitBase","ParticleModuleSubUVBase","ParticleModuleMaterialBase","ParticleModuleOrientationBase"))
   ModuleMenu_TypeDataToBaseModuleRejections(5)=(ObjName="ParticleModuleTypeDataPhysX",InvalidObjNames=("ParticleModuleBeamBase","ParticleModuleTrailBase","ParticleModuleAccelerationBase","ParticleModuleAttractorBase","ParticleModuleCollisionBase","ParticleModuleKillBase","ParticleModuleOrbitBase"))
   ModuleMenu_TypeDataToSpecificModuleRejections(0)=(ObjName="None",InvalidObjNames=("ParticleModuleMeshMaterial","ParticleModuleMeshRotation","ParticleModuleMeshRotation_Seeded","ParticleModuleMeshRotationRate","ParticleModuleMeshRotationRate_Seeded","ParticleModuleMeshRotationRateMultiplyLife","ParticleModuleMeshRotationRateOverLife","ParticleModuleTrailSpawnPerUnit"))
   ModuleMenu_TypeDataToSpecificModuleRejections(1)=(ObjName="ParticleModuleTypeDataBeam2",InvalidObjNames=("ParticleModuleMeshMaterial","ParticleModuleMeshRotation","ParticleModuleMeshRotation_Seeded","ParticleModuleMeshRotationRate","ParticleModuleMeshRotationRate_Seeded","ParticleModuleMeshRotationRateMultiplyLife","ParticleModuleMeshRotationRateOverLife","ParticleModuleTrailSpawnPerUnit"))
   ModuleMenu_TypeDataToSpecificModuleRejections(2)=(ObjName="ParticleModuleTypeDataTrail2",InvalidObjNames=("ParticleModuleMeshMaterial","ParticleModuleMeshRotation","ParticleModuleMeshRotation_Seeded","ParticleModuleMeshRotationRate","ParticleModuleMeshRotationRate_Seeded","ParticleModuleMeshRotationRateMultiplyLife","ParticleModuleMeshRotationRateOverLife","ParticleModuleSpawnPerUnit"))
   ModuleMenu_TypeDataToSpecificModuleRejections(3)=(ObjName="ParticleModuleTypeDataRibbon",InvalidObjNames=("ParticleModuleMeshMaterial","ParticleModuleMeshRotation","ParticleModuleMeshRotation_Seeded","ParticleModuleMeshRotationRate","ParticleModuleMeshRotationRate_Seeded","ParticleModuleMeshRotationRateMultiplyLife","ParticleModuleMeshRotationRateOverLife","ParticleModuleLocationEmitterDirect"))
   ModuleMenu_TypeDataToSpecificModuleRejections(4)=(ObjName="ParticleModuleTypeDataMeshPhysX",InvalidObjNames=("ParticleModuleColorScaleOverLife","ParticleModuleColorByParameter","ParticleModuleRotation","ParticleModuleRotationOverLifetime","ParticleModuleMeshRotationRateMultiplyLife","ParticleModuleMeshRotationRateOverLife","ParticleModuleRotationRate","ParticleModuleRotationRateMultiplyLife","ParticleModuleVelocityOverLifetime","ParticleModuleSizeScale","ParticleModuleTrailSpawnPerUnit"))
   ModuleMenu_TypeDataToSpecificModuleRejections(5)=(ObjName="ParticleModuleTypeDataPhysX",InvalidObjNames=("ParticleModuleMeshMaterial","ParticleModuleMeshRotation","ParticleModuleMeshRotation_Seeded","ParticleModuleMeshRotationRate","ParticleModuleMeshRotationRate_Seeded","ParticleModuleMeshRotationRateMultiplyLife","ParticleModuleMeshRotationRateOverLife","ParticleModuleTrailSpawnPerUnit"))
   ModuleMenu_ModuleRejections(0)="ParticleModuleTypeDataBase"
   ModuleMenu_ModuleRejections(1)="ParticleModule"
   ModuleMenu_ModuleRejections(2)="ParticleModuleRequired"
   ModuleMenu_ModuleRejections(3)="ParticleModuleSpawn"
   ModuleMenu_ModuleRejections(4)="ParticleModuleTypeDataBeam"
   ModuleMenu_ModuleRejections(5)="ParticleModuleTypeDataTrail"
   ModuleMenu_ModuleRejections(6)="ParticleModuleTypeDataTrail2"
   ModuleMenu_ModuleRejections(7)="ParticleModuleLocationPrimitiveBase"
   ModuleMenu_ModuleRejections(8)="ParticleModuleEventReceiverBase"
   Name="Default__CascadeConfiguration"
   ObjectArchetype=Object'Core.Default__Object'
}
