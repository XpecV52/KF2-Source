/*******************************************************************************
 * NxTornadoForceField generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class NxTornadoForceField extends NxForceField
    abstract
    native(ForceField)
    notplaceable
    hidecategories(Navigation);

/** Strength of the force applied by this actor. */
var() interp float RadialStrength;
/** Rotational strength of the force applied around the cylinder axis. */
var() interp float RotationalStrength;
/** Strength of the force applied along the cylinder axis */
var() interp float LiftStrength;
/** Radius of influence of the force at the bottom of the cylinder. */
var() interp float ForceRadius;
/** Radius of the force field at the top */
var() interp float ForceTopRadius;
/** Lift falloff height, 0-1, lift starts to fall off in a linear way above this height */
var() interp float LiftFalloffHeight;
/** Velocity above which the radial force is ignored. */
var() interp float EscapeVelocity;
/** Height of force cylinder */
var() interp float ForceHeight;
/** Offset from the actor base to the center of the force field */
var() interp float HeightOffset;
var() bool BSpecialRadialForceMode;
var native const transient Pointer Kernel;

defaultproperties
{
    ForceRadius=200
}