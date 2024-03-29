/*******************************************************************************
 * InterpTrackFloatBase generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class InterpTrackFloatBase extends InterpTrack
    abstract
    native(Interpolation)
    collapsecategories
    hidecategories(Object);

var InterpCurveFloat FloatTrack;
/** Tension of curve, used for keypoints using automatic tangents. */
var() float CurveTension;

defaultproperties
{
    TrackTitle="Generic Float Track"
}