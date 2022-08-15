/*******************************************************************************
 * BrushComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class BrushComponent extends PrimitiveComponent
    native
    editinlinenew
    collapsecategories;

struct native KCachedConvexDataElement
{
    var init native array<init byte> ConvexElementData;
    var native transient Pointer ConvexMesh;
    var native int ConvexMeshDataSize;
};

struct native KCachedConvexData
{
    var init native array<init KCachedConvexDataElement> CachedConvexElements;
};

var const Model Brush;
var KAggregateGeom BrushAggGeom;
var private noimport native const transient KCachedConvexData CachedPhysBrushData;
var private const int CachedPhysBrushDataVersion;
/**  
 *Normally a blocking volume is considered 'pure simplified collision', so when tracing for complex collision, never collide 
 *       This flag overrides that behaviour
 */
var() bool bBlockComplexCollisionTrace;

defaultproperties
{
    ReplacementPrimitive=none
    HiddenGame=true
    bUseAsOccluder=true
    AlwaysLoadOnClient=false
    AlwaysLoadOnServer=false
}