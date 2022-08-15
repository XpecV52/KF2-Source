/*******************************************************************************
 * TWPostProcessEffect generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TWPostProcessEffect extends PostProcessEffect
    native
    hidecategories(Object);

var const transient float DOF_FocalDistance;
/** New parameters */
var(DepthOfField) float DOF_SharpRadius;
var(DepthOfField) float DOF_FocalRadius;
var(DepthOfField) float DOF_MinBlurSize;
var(DepthOfField) float DOF_MaxNearBlurSize;
var(DepthOfField) float DOF_MaxFarBlurSize;
var(DepthOfField) float DOF_ExpFalloff;
var(DepthOfField) float DOF_FG_SharpRadius;
var(DepthOfField) float DOF_FG_FocalRadius;
var(DepthOfField) float DOF_FG_MinBlurSize;
var(DepthOfField) float DOF_FG_MaxNearBlurSize;
var(DepthOfField) float DOF_FG_ExpFalloff;
var const transient bool MB_TileMaxEnabled;
/** Scales the final bloom color before applying to the scene */
var(Bloom) float Bloom_Intensity;
/** Width multiplier for the blur kernel.  Larger values equal width bloom. */
var(Bloom) float Bloom_Width;
/**  
 *During the bright-pass phase, the candidate color at each pixel is scaled by this
 *  value before applying the threshold.
 */
var(Bloom) float Bloom_Exposure;
/**  
 *Threshold value for determining which pixels contribute to bloom.  Pixel colors
 *  are scaled by Exposure before applying the threshold.
 */
var(Bloom) float Bloom_Threshold;
/** Multiplies against the bloom color. */
var(Bloom) Color Bloom_Tint;
/**  
 *Scene color luminance must be less than this to receive bloom. 
 * This behaves like Photoshop's screen blend mode and prevents over-saturation from adding bloom to already bright areas.
 * The default value of 1 means that a pixel with a luminance of 1 won't receive any bloom, but a pixel with a luminance of .5 will receive half bloom.
 */
var(Bloom) float Bloom_ScreenBlendThreshold;
/**  
 ************************************************************************
 * * COLOR GRADING
 * * **********************************************************************
 */
var(ColorGrading) Vector SceneShadows<DisplayName=Shadows>;
var(ColorGrading) Vector SceneHighLights<DisplayName=HighLights>;
var(ColorGrading) Vector SceneMidTones<DisplayName=MidTones>;
var(ColorGrading) float SceneDesaturation<DisplayName=Desaturation>;
var(ColorGrading) Vector SceneColorize<DisplayName=Colorize>;
/** Allows to specify the tone mapper function which maps HDR colors into the LDR color range. */
var(Tonemapper) UberPostProcessEffect.ETonemapperType TonemapperType;
/** Allows to specify the postprocess antialiasing method (affects quality and performace). */
var(AntiAliasing) UberPostProcessEffect.EPostProcessAAType PostProcessAAType;
/**  
 *This tonemapper property allows to specify the HDR brightness value that is mapping to the maximum LDR value. 
 * Brighter values will be mapped to white (good values are in the range 2 to 16). Only affects the "Customizable" 
 * tonemapper.
 */
var(Tonemapper) float TonemapperRange;
/**  
 *This tonemapper property allows to adjust the mapping of the darker colors (tonemapper toe).
 * As the adjustment is independent per color channel it can introduce slight shifts color and saturation changes.
 * Only affects the "Customizable" tonemapper.
 * 0=linear .. 1=crushed darks (more filmic)
 */
var(Tonemapper) float TonemapperToeFactor<DisplayName=ToeFactor>;
/**  
 *Scale the input for the tonemapper. Only used if a tonemapper is specified.
 * >=0, 0:black, 1(default), >1 brighter
 */
var(Tonemapper) float TonemapperScale;
/** Film-grain noise intensity */
var(Noise) float NoiseIntensity;
/** Only used if PostProcessAAType is MLAA */
var(AntiAliasing) float EdgeDetectionThreshold;

defaultproperties
{
    DOF_FocalDistance=1000
    DOF_SharpRadius=500
    DOF_FocalRadius=1000
    DOF_MinBlurSize=1.25
    DOF_MaxNearBlurSize=4
    DOF_MaxFarBlurSize=8
    DOF_ExpFalloff=1
    DOF_FG_SharpRadius=10
    DOF_FG_FocalRadius=10
    DOF_FG_MinBlurSize=1
    DOF_FG_MaxNearBlurSize=2
    DOF_FG_ExpFalloff=1
    MB_TileMaxEnabled=true
    Bloom_Intensity=1.05
    Bloom_Width=4
    Bloom_Exposure=1.25
    Bloom_Threshold=0.6
    Bloom_Tint=(B=255,G=255,R=255,A=0)
    Bloom_ScreenBlendThreshold=10
    SceneShadows=(X=0,Y=0,Z=-0.003)
    SceneHighLights=(X=0.8,Y=0.8,Z=0.8)
    SceneMidTones=(X=1.3,Y=1.3,Z=1.3)
    SceneDesaturation=0.4
    SceneColorize=(X=1,Y=1,Z=1)
    TonemapperRange=8
    TonemapperToeFactor=1
    TonemapperScale=1
    NoiseIntensity=1
    EdgeDetectionThreshold=12
}