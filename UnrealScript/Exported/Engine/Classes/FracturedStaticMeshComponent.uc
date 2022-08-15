/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class FracturedStaticMeshComponent extends FracturedBaseComponent
	native(Mesh);

/** Stores non-zero for each fragment whose neighbors are all visible, and 0 otherwise. */
var protected{protected} transient const array<byte> FragmentNeighborsVisible;

/** Local space bounding box of visible fragments, updated on attach. */
var protected{protected} const Box VisibleBox;

/** If true, all fragment visibility and transform information will be forwarded to SkinnedComponent, which will handle rendering. */
var protected{protected} const bool bUseSkinnedRendering;

/**
 *	If true, the only thing considered when calculating the bounds of this component are the graphics verts current visible.
 *	Using this and having simplified collision will cause unpredictable results.
 */
var bool	bUseVisibleVertsForBounds;

/**
 *	Allows per-instance override of chunk support/destroyable flags.
 *	Marks chunks at top of mesh as 'root' and 'non destroyable'.
 */
var()	bool	bTopFragmentsRootNonDestroyable;

/**
 *	Allows per-instance override of chunk support/destroyable flags.
 *	Marks chunks at bottom of mesh as 'root' and 'non destroyable'.
 */
var()	bool	bBottomFragmentsRootNonDestroyable;

/** Threshold distance of fragment box from top/bottom of mesh to be considered for bTop/BottomFragmentsRootNonDestroyable */
var()	float	TopBottomFragmentDistThreshold;

/** Allows overriding the LoseChunkOutsideMaterial on a per-instance basis. */
var()	MaterialInterface	LoseChunkOutsideMaterialOverride;

/** Z value of top of fractured piece bounds. */
var		float	FragmentBoundsMaxZ;

/** Z value of bottom of fractured piece bounds. */
var		float	FragmentBoundsMinZ;

/** Component which handles rendering if bUseSkinnedRendering is true. */
var transient FracturedSkinnedMeshComponent SkinnedComponent;

/**  */
struct native FragmentGroup
{
	var array<int>	FragmentIndices;
	var bool		bGroupIsRooted;
};

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

/** Change the set of visible fragments. */
native final function SetVisibleFragments(array<byte> VisibilityFactors);

/** Returns if this fragment is destroyable. */
native final function bool IsFragmentDestroyable(INT FragmentIndex) const;

/** Returns if this is a supporting 'root' fragment.  */
native final function bool IsRootFragment(INT FragmentIndex) const;

/** Returns if this fragment should never spawn a physics object.  */
native final function bool IsNoPhysFragment(INT FragmentIndex) const;

/** Get the bounding box of a specific chunk, in world space. */
native final function box GetFragmentBox(int FragmentIndex) const;

/** Returns average exterior normal of a particular chunk. */
native final function vector GetFragmentAverageExteriorNormal(int FragmentIndex) const;

/** Gets the index that is the 'core' of this mesh. */
native final function int GetCoreFragmentIndex() const;

/**
 *	Based on the hidden state of chunks, groups which are connected.
 *	@param IgnoreFragments	Additional fragments to ignore when finding islands. These will not end up in any groups.
 */
native final function array<FragmentGroup> GetFragmentGroups(array<int> IgnoreFragments, float MinConnectionArea) const;

/**
 *	Return set of fragments that are hidden, but who have at least one visible neighbour.
 *	@param AdditionalVisibleFragments	Additional fragments to consider 'visible' when finding fragments. Will not end up in resulting array.
 */
native final function array<int> GetBoundaryHiddenFragments(array<int> AdditionalVisibleFragments) const;

/** Re-create physics state - needed if hiding parts would change physics collision of the object. */
native final function RecreatePhysState();

/** Util for getting the PhysicalMaterial applied to this mesh */
native final function PhysicalMaterial GetFracturedMeshPhysMaterial();

defaultproperties
{
   TopBottomFragmentDistThreshold=0.100000
   ReplacementPrimitive=None
   bUsePrecomputedShadows=True
   Name="Default__FracturedStaticMeshComponent"
   ObjectArchetype=FracturedBaseComponent'Engine.Default__FracturedBaseComponent'
}
