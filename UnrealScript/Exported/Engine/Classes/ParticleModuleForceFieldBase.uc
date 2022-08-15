// NVCHANGE_BEGIN: TSC - adding module for spawning force fields
/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleForceFieldBase extends ParticleModule
	native(Particle)
	editinlinenew
	hidecategories(Object)
	abstract;

var(ForceFieldComponent) NxForceFieldComponent ForceField;


event NxForceFieldComponent GetForceFieldInstance(vector Location)
{
	local NxForceFieldComponent FF;

	FF = new ForceField.Class(ForceField);
	FF.SetTickGroup(TG_PostAsyncWork);

	// the FF needs to be colocated with the particle system component (Location), in case its offset
	FF.SetTranslation(Location + FF.Translation);
	
	return FF;
}

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
// (cpptext)



// NVCHANGE_END: TSC -  adding module for spawning force fields

defaultproperties
{
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleForceFieldBase"
   ObjectArchetype=ParticleModule'Engine.Default__ParticleModule'
}
