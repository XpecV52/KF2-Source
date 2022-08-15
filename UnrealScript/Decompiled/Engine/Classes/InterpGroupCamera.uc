/*******************************************************************************
 * InterpGroupCamera generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class InterpGroupCamera extends InterpGroup
    native(Interpolation)
    collapsecategories
    hidecategories(Object,Object);

struct native CameraPreviewInfo
{
    /** Preview Pawn class for this track */
    var() class<Pawn> PawnClass;
    /** Preview Pawn class for this track */
    var() array<AnimSet> PreviewAnimSets;
    /** Preview Pawn class for this track */
    var() name AnimSeqName;
    var editconst Vector Location;
    var editconst Rotator Rotation;
    var transient Pawn PawnInst;

    structdefaultproperties
    {
        PawnClass=none
        PreviewAnimSets=none
        AnimSeqName=None
        Location=(X=0,Y=0,Z=0)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
        PawnInst=none
    }
};

var transient CameraAnim CameraAnimInst;
/** this is interaction property info for CameraAnim this information isn't really saved with it */
var() editoronly CameraPreviewInfo Target;
/** When compress, tolerance option */
var() float CompressTolerance;

defaultproperties
{
    Target=(PawnClass=none,PreviewAnimSets=none,AnimSeqName=None,Location=(X=140,Y=0,Z=-40),Rotation=(Pitch=0,Yaw=0,Roll=0),PawnInst=none)
    CompressTolerance=5
}