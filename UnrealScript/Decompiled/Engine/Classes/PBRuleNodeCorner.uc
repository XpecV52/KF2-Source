/*******************************************************************************
 * PBRuleNodeCorner generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PBRuleNodeCorner extends PBRuleNodeBase
    native(ProcBuilding)
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

struct native RBCornerAngleInfo
{
    /** Angle (in degrees) */
    var() float Angle;
    /** If non-zero, overrides the base CornerSize for this particular angle */
    var() float CornerSize;

    structdefaultproperties
    {
        Angle=0
        CornerSize=0
    }
};

/** Amount to split off left (and maybe right) of supplied scope, based on left/right edge angles */
var() float CornerSize;
/** Set of angles of corner angle, each corresponds to an output of this node */
var() array<RBCornerAngleInfo> Angles;
/** Angle in degrees at which point surfaces are considered co-planar, and corner mesh is not added */
var() float FlatThreshold;
/** If TRUE, no space left or mesh added in concave corners. */
var() bool bNoMeshForConcaveCorners;
/**  
 *If TRUE, look at face on the right to see how much gap to leave on right edge. If FALSE, just use CornerSize on left and right side 
 *       Note, this only works when rulesets have the same corner size down the entire height - when looking at adjacent face, the top-left corner size is used.
 */
var() bool bUseAdjacentRulesetForRightGap;
/** How to adjust the roof/floor poly to fit with this corner mesh */
var() ProcBuilding.EPBCornerType CornerType;
/** How far from start of curve mesh region to actually chamfer/round adjust roff poly corner */
var() float CornerShapeOffset;
/** If CornerType is set to EPBC_Round, how many tesselation steps to take around the corner */
var() int RoundTesselation;
/** Controls the curvature when using EPBC_Round- essentially 'pulls' the tangent handles further. */
var() float RoundCurvature;

defaultproperties
{
    CornerSize=256
    Angles(0)=(Angle=90,CornerSize=0)
    Angles(1)=(Angle=-90,CornerSize=0)
    FlatThreshold=5
    RoundTesselation=4
    RoundCurvature=1
}