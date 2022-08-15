/*=============================================================================
	ApexComponentBase.uc: PhysX APEX integration. Component Base
	Copyright 2008-2009 NVIDIA Corporation.
=============================================================================*/

class ApexComponentBase extends MeshComponent
	native(Mesh)
	hidecategories(Object)
	editinlinenew;

/** This component's index buffer. */
var protected{protected} const native transient pointer ComponentBaseResources{class FApexBaseResources};

/** A fence used to track when the rendering thread has released the component's resources. */
var protected{protected} native const transient RenderCommandFence_Mirror ReleaseResourcesFence{FRenderCommandFence};

var() const			ApexAsset	Asset;
var() Color			WireframeColor;

var	const			bool		bAssetChanged;

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

defaultproperties
{
   WireframeColor=(B=64,G=128,R=255,A=255)
   ReplacementPrimitive=None
   CollideActors=True
   BlockActors=True
   BlockZeroExtent=True
   BlockNonZeroExtent=True
   BlockRigidBody=True
   TickGroup=TG_PreAsyncWork
   Name="Default__ApexComponentBase"
   ObjectArchetype=MeshComponent'Engine.Default__MeshComponent'
}
