/*******************************************************************************
 * ParticleModuleForceFieldTornado generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ParticleModuleForceFieldTornado extends ParticleModuleForceFieldBase
    editinlinenew
    hidecategories(Object,Object);

defaultproperties
{
    begin object name=FF class=NxForceFieldTornadoComponent
        begin object name=Shape0 class=ForceFieldShapeCapsule
            begin object name=DrawCapsule0 class=DrawCapsuleComponent
                ReplacementPrimitive=none
            object end
            // Reference: DrawCapsuleComponent'Default__ParticleModuleForceFieldTornado.FF.Shape0.DrawCapsule0'
            Shape=DrawCapsule0
        object end
        // Reference: ForceFieldShapeCapsule'Default__ParticleModuleForceFieldTornado.FF.Shape0'
        Shape=Shape0
        Duration=0.5
        ReplacementPrimitive=none
    object end
    // Reference: NxForceFieldTornadoComponent'Default__ParticleModuleForceFieldTornado.FF'
    ForceField=FF
}