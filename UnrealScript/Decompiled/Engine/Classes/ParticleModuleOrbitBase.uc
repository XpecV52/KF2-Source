/*******************************************************************************
 * ParticleModuleOrbitBase generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ParticleModuleOrbitBase extends ParticleModule
    abstract
    native(Particle)
    editinlinenew
    hidecategories(Object,Object);

/**  
 *If TRUE, distribution values will be retrieved using the EmitterTime.
 *       If FALSE (default), they will be retrieved using the Particle.RelativeTime.
 */
var(Orbit) bool bUseEmitterTime;
