/*******************************************************************************
 * KFExplosionLightComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFExplosionLightComponent extends PointLightComponent
    native(Effect)
    editinlinenew
    hidecategories(Object);

var() const KFExplosionLight Template;
var bool bInitialized;
var transient float Lifetime;
var transient int TimeShiftIndex;
var delegate<OnLightFinished> __OnLightFinished__Delegate;

// Export UKFExplosionLightComponent::execSetTemplate(FFrame&, void* const)
native final function SetTemplate(KFExplosionLight NewTemplate);

// Export UKFExplosionLightComponent::execResetLight(FFrame&, void* const)
native final function ResetLight();

delegate OnLightFinished(KFExplosionLightComponent Light);

defaultproperties
{
    Radius=256
    Brightness=8
    LightColor=(B=255,G=255,R=255,A=255)
    CastShadows=false
    bCastPerObjectShadows=false
    LightingChannels=(Outdoor=true)
}