/*******************************************************************************
 * KFWireConnector generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWireConnector extends Emitter
    native(Effect)
    hidecategories(Navigation);

/** Beam tangent at source and target locations.  Typically one is negative of other */
var() Vector StartTangent;
var() Vector EndTangent;
var float TessellationFactor;

// Export UKFWireConnector::execApplyBeamProperties(FFrame&, void* const)
native function ApplyBeamProperties();

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    if(!bTickIsDisabled)
    {
        ApplyBeamProperties();
        SetTimer(0.01, false);
    }
}

simulated function Timer()
{
    SetTickIsDisabled(true);
}

defaultproperties
{
    begin object name=ParticleSystemComponent0 class=ParticleSystemComponent
        Template=ParticleSystem'FX_Environmental_EMIT_TWO.FX_Cable_beam_01'
        InstanceParameters=/* Array type was not detected. */
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__KFWireConnector.ParticleSystemComponent0'
    ParticleSystemComponent=ParticleSystemComponent0
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'FX_Environmental_TEX.WireTool.KF_WireTool_Icon'
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFWireConnector.Sprite'
    Components(0)=Sprite
    begin object name=ParticleSystemComponent0 class=ParticleSystemComponent
        Template=ParticleSystem'FX_Environmental_EMIT_TWO.FX_Cable_beam_01'
        InstanceParameters=/* Array type was not detected. */
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__KFWireConnector.ParticleSystemComponent0'
    Components(1)=ParticleSystemComponent0
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    SupportedEvents=none
}