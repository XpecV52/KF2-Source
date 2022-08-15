/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SplineMeshComponent extends StaticMeshComponent
	native(Mesh);

/** 
 * Structure that holds info about spline, passed to renderer to deform StaticMesh.
 * Also used by Lightmass, so be sure to update Lightmass::FSplineMeshParams and the static lighting code if this changes!
 */
struct native SplineMeshParams
{
	/** Start location of spline, in component space */
	var vector      StartPos;
	/** Start tangent of spline, in component space */
	var vector      StartTangent;
	/** X and Y scale applied to mesh at start of spline */
	var vector2D    StartScale;
	/** Roll around spline applied at start */
	var float       StartRoll;
	/** Starting offset of the mesh from the spline, in component space */
	var vector2D    StartOffset;
		
	/** End location of spline, in component space */
	var vector      EndPos;
	/** End tangent of spline, in component space */
	var vector      EndTangent;
	/** X and Y scale applied to mesh at end of spline */
	var vector2D    EndScale;
	/** Roll around spline applied at end */
	var float       EndRoll;
	/** Ending offset of the mesh from the spline, in component space */
	var vector2D    EndOffset;

};	

/** Spline that is used to deform mesh */
var	    SplineMeshParams    SplineParams;

/** Axis (in component space) that is used to determine X axis for co-ordinates along spline */
var     vector              SplineXDir;

/** If TRUE, will use smooth interpolation (ease in/out) for Scale, Roll, and Offset along this section of spline. If FALSE, uses linear */
var     bool                bSmoothInterpRollScale;

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
   SplineXDir=(X=1.000000,Y=0.000000,Z=0.000000)
   ReplacementPrimitive=None
   bUseAsOccluder=False
   bUsePrecomputedShadows=True
   Name="Default__SplineMeshComponent"
   ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
}
