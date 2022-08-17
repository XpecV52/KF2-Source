/*******************************************************************************
 * FlexAsset generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class FlexAsset extends Object
    native(Physics)
    editinlinenew
    hidecategories(Object);

enum EFlexAssetType
{
    FLEX_Cloth,
    FLEX_Solid,
    FLEX_MAX
};

/** The asset type, can either be a thin shell (cloth), or a solid (rigid body) */
var(Common) FlexAsset.EFlexAssetType Type;
/** The flex container this asset will use. This container can be overwritten by the FlexActor's container */
var(Common) FlexContainer FlexAssetContainerTemplate;
/** The phase-id to assign to particles spawned for this mesh. This can be overwritten by the FlexActor's FlexComponentPhaseId */
var(Common) int FlexAssetPhaseId;
/** If true then the particles will be auto-assigned a positive phase-id. This bool can be overwritten by the FlexActor's bFlexComponentAutoAssignPhase */
var(Common) bool bFlexAssetAutoAssignPhase;
/** Can be enabled for closed meshes, a volume conserving constraint will be added to the simulation */
var(Inflatable) bool bEnableInflatable;
/** The per-particle mass to use for the particles, for clothing this value be multiplied by 0-1 dependent on the vertex color */
var(Common) float Mass;
/** How much the cloth resists stretching */
var(Cloth) float StretchStiffness;
/** How much the cloth resists bending */
var(Cloth) float BendStiffness;
/** How strong tethers resist stretching */
var(Cloth) float TetherStiffness;
/** How much tethers have to stretch past their rest-length before becoming enabled, 0.1=10% elongation */
var(Cloth) float TetherGive;
/** The inflatable pressure, a value of 1.0 corresponds to the rest volume, 0.5 corressponds to being deflated by half, and values > 1.0 correspond to over-inflation */
var(Inflatable) float OverPressure;
/** The rigid body stiffness */
var(Rigid) float RigidStiffness;
/** The spacing to use when sampling solid shapes with particles, this should be close to radius of the container this asset will be spawned in */
var(Rigid) float RigidSamplingDistance;
var Vector RigidCenter;
var float InflatableStiffness;
var float InflatableVolume;
var array<Vector4> Particles;
var array<int> Phases;
var array<int> SpringIndices;
var array<float> SpringCoefficients;
var array<float> SpringRestLengths;
var array<int> Triangles;
var array<int> VertexToParticleMap;
var native const transient Pointer Object;

defaultproperties
{
    bFlexAssetAutoAssignPhase=true
    Mass=1
    StretchStiffness=1
    BendStiffness=1
    TetherStiffness=1
    TetherGive=0.1
    OverPressure=1
    RigidSamplingDistance=40
    InflatableStiffness=1
}