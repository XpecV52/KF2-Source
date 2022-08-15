/**
 * FracturedSkinnedMeshComponent.uc - Uses skinning to draw detached parts with as few sections as possible.
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class FracturedSkinnedMeshComponent extends FracturedBaseComponent
	native(Mesh);

/* Render resources used by this component, and whose release progress is tracked by the FRenderCommandFence in FracturedBaseComponent. */
var protected{protected} const native transient pointer ComponentSkinResources{class FFracturedSkinResources};

/* A transform for each fragment, used to skin vertices from each fragment into position while minimizing draw calls. */
var protected{protected} transient const array<Matrix> FragmentTransforms;

/* An array of components whose visibility information will be used. */
var protected{protected} transient const array<FracturedStaticMeshComponent> DependentComponents;

/* TRUE when at least one fragment is unhidden after visibility is reset. */
var protected{protected} transient const bool bBecameVisible;

/** TRUE if fragment transforms have changed and the GPU should be refreshed */
var protected{protected} transient const bool bFragmentTransformsChanged;


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
   bInitialVisibilityValue=False
   ReplacementPrimitive=None
   bAllowCullDistanceVolume=False
   bAllowApproximateOcclusion=True
   bAcceptsDynamicDecals=False
   CastShadow=False
   bCastDynamicShadow=False
   CollideActors=False
   BlockActors=False
   BlockZeroExtent=False
   BlockNonZeroExtent=False
   BlockRigidBody=False
   Name="Default__FracturedSkinnedMeshComponent"
   ObjectArchetype=FracturedBaseComponent'Engine.Default__FracturedBaseComponent'
}
