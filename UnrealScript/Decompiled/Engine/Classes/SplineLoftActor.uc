/*******************************************************************************
 * SplineLoftActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SplineLoftActor extends SplineActor
    native(Spline)
    placeable
    hidecategories(Navigation);

/** Size that mesh should be along its local X axis at this node on spline. */
var() interp float ScaleX;
/** Size that mesh should be along its local Y axis at this node on spline. */
var() interp float ScaleY;
var export editinline array<export editinline SplineMeshComponent> SplineMeshComps;
/**  
 *Mesh to deform along spline 
 *  This must be set to have a visual mesh viewable in the world
 *  @TODO: make a map check for errors for this being None
 */
var() const StaticMesh DeformMesh;
/** Materials to override with for this instance */
var() const array<MaterialInterface> DeformMeshMaterials;
/** Roll around spline at this node, in degrees */
var() interp float Roll;
/** Axis (in world space) used to determine the X axis for the mesh along the spline */
var() Vector WorldXDir;
/** Offset in X and Y for the mesh along the spline.  Note the offset is applied BEFORE scaling and roll */
var() Vector2D Offset;
/** If TRUE, will use smooth interpolation (ease in/out) for Scale and Roll along this section of spline. If FALSE, uses linear */
var() bool bSmoothInterpRollAndScale;
/** If TRUE, generated SplineMeshComponents will accept lights */
var() bool bAcceptsLights;
/** Light environment used to light dynamically moving spline */
var() const editconst export editinline DynamicLightEnvironmentComponent MeshLightEnvironment;
/** The maximum distance at which these meshes will be drawn */
var() float MeshMaxDrawDistance;

// Export USplineLoftActor::execClearLoftMesh(FFrame&, void* const)
native function ClearLoftMesh();

// Export USplineLoftActor::execUpdateSplineParams(FFrame&, void* const)
native function UpdateSplineParams();

defaultproperties
{
    ScaleX=1
    ScaleY=1
    WorldXDir=(X=1,Y=0,Z=0)
    bSmoothInterpRollAndScale=true
    bAcceptsLights=true
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.Spline.T_Loft_Spline'
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__SplineLoftActor.Sprite'
    Components(0)=Sprite
    bStatic=true
    bWorldGeometry=true
    bGameRelevant=true
    bMovable=false
    bCollideActors=true
    bBlockActors=true
    bEdShouldSnap=true
}