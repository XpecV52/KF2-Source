/**
 * FracturedBaseComponent.uc - Declaration of the base fractured component which handles rendering with a dynamic index buffer.
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class FracturedBaseComponent extends StaticMeshComponent
	native(Mesh)
	abstract;

/** This component's index buffer, used for rendering when bUseDynamicIndexBuffer is true. */
var protected{protected} const native transient pointer ComponentBaseResources{class FFracturedBaseResources};

/** A fence used to track when the rendering thread has released the component's resources. */
var protected{protected} native const transient RenderCommandFence_Mirror ReleaseResourcesFence{FRenderCommandFence};

/** Stores non-zero for each fragment that is visible, and 0 otherwise. */
var protected{protected} transient const array<byte> VisibleFragments;

/** If true, VisibleFragments has changed since the last attach and the dynamic index buffer needs to be updated. */
var protected{protected} transient bool	bVisibilityHasChanged;

/** True if VisibleFragments was reset to bInitialVisibilityValue since the last component attach. */
var protected{protected} transient const bool bVisibilityReset;

/** Initial visibility value for this component. */
var protected{protected} const bool bInitialVisibilityValue;

/** 
 *	If true, each element will be rendered with one draw call by using a dynamic index buffer that is repacked when visibility changes.
 *  If false, each element will be rendered with n draw calls, where n is the number of consecutive index ranges, and there will be no memory overhead.
 */
var protected{protected} const bool bUseDynamicIndexBuffer;

/** 
 *	If true, bUseDynamicIndexBuffer will be enabled when at least one fragment is hidden, otherwise it will be disabled.
 *  If false, bUseDynamicIndexBuffer will not be overridden.
 */
var protected{protected} const bool bUseDynamicIBWithHiddenFragments;

/**
 * Number of indices in the resource's index buffer the last time the component index buffer was built. 
 * Used to detect when the resource's index buffer has changed and the component's index buffer should be rebuilt.
 */
var private{private} const int NumResourceIndices;

/** TRUE whenever the static mesh is being reset during Reattach */
var protected{protected} transient const int bResetStaticMesh;

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
// (cpptext)
// (cpptext)
// (cpptext)

/** 
 * Change the StaticMesh used by this instance, and resets VisibleFragments to all be visible if NewMesh is valid.
 * @param NewMesh - StaticMesh to set.  If this is not also a UFracturedStaticMesh, assignment will fail.
 * @return bool - TRUE if assignment succeeded.
 */
simulated native function bool SetStaticMesh( StaticMesh NewMesh, optional bool bForce );

/** Returns array of currently visible fragments. */
simulated native function array<byte> GetVisibleFragments() const;

/** Returns whether the specified fragment is currently visible or not. */
simulated native function bool IsFragmentVisible(INT FragmentIndex) const;

/** Get the number of chunks in the assigned fractured mesh. */
native function int GetNumFragments() const;

/** Get the number of chunks that are currently visible. */
native function int GetNumVisibleFragments() const;

defaultproperties
{
   bInitialVisibilityValue=True
   bUseDynamicIndexBuffer=True
   ReplacementPrimitive=None
   bAcceptsStaticDecals=False
   Name="Default__FracturedBaseComponent"
   ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
}
