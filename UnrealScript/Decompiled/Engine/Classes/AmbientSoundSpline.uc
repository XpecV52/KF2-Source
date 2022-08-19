/*******************************************************************************
 * AmbientSoundSpline generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AmbientSoundSpline extends AmbientSound
    native(Sound)
    placeable
    hidecategories(Navigation)
    autoexpandcategories(Audio,AmbientSoundSpline);

/** Maximal distance on spline between points, that are used to eval virtual speaker position (Minimal number of points is 3). */
var() editoronly float DistanceBetweenPoints;
/** SplineComponent with spline curve defining the source of sound */
var() editoronly export editinline SplineComponent SplineComponent;
var editoronly Vector TestPoint;

defaultproperties
{
    DistanceBetweenPoints=200
    begin object name=SplineComponent0 class=SplineComponentSimplified
        ReplacementPrimitive=none
    object end
    // Reference: SplineComponentSimplified'Default__AmbientSoundSpline.SplineComponent0'
    SplineComponent=SplineComponent0
    begin object name=AudioComponent1 class=SplineAudioComponent
        bStopWhenOwnerDestroyed=true
        bShouldRemainActiveIfDropped=true
        PreviewSoundRadius=DrawSoundRadiusComponent'Default__AmbientSoundSpline.DrawSoundRadius0'
    object end
    // Reference: SplineAudioComponent'Default__AmbientSoundSpline.AudioComponent1'
    AudioComponent=AudioComponent1
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__AmbientSoundSpline.Sprite'
    SpriteComp=Sprite
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__AmbientSoundSpline.Sprite'
    Components(0)=Sprite
    begin object name=DrawSoundRadius0 class=DrawSoundRadiusComponent
        ReplacementPrimitive=none
    object end
    // Reference: DrawSoundRadiusComponent'Default__AmbientSoundSpline.DrawSoundRadius0'
    Components(1)=DrawSoundRadius0
    begin object name=SplineComponent0 class=SplineComponentSimplified
        ReplacementPrimitive=none
    object end
    // Reference: SplineComponentSimplified'Default__AmbientSoundSpline.SplineComponent0'
    Components(2)=SplineComponent0
    begin object name=AudioComponent1 class=SplineAudioComponent
        bStopWhenOwnerDestroyed=true
        bShouldRemainActiveIfDropped=true
        PreviewSoundRadius=DrawSoundRadiusComponent'Default__AmbientSoundSpline.DrawSoundRadius0'
    object end
    // Reference: SplineAudioComponent'Default__AmbientSoundSpline.AudioComponent1'
    Components(3)=AudioComponent1
}