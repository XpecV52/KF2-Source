//=============================================================================
// KFPruneSkeletalMeshCommandlet
//=============================================================================
// Helper commandlet to prune a skeletal mesh. All the children bones of the
// passed in bone name are removed. The package is resaved after the operation.
//
// Usage : PruneSkeletalMesh [SkeletalMeshPath] [BoneName]
// Eg. : PruneSkeletalMesh SkeletalMeshCommandletTest.HumanIK.CHR_HUMANIK_MASTER_RIG  CHR_Head
//=============================================================================
// Killing Floor 2
// Copyright (C) 2007-2016 Tripwire Interactive LLC
// - Sakib Saikia
//=============================================================================
class KFPruneSkeletalMeshCommandlet extends Commandlet
	native;

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

// Point of entry for the commandlet
native event int Main( string Params );

defaultproperties
{
   Name="Default__KFPruneSkeletalMeshCommandlet"
   ObjectArchetype=Commandlet'Core.Default__Commandlet'
}
