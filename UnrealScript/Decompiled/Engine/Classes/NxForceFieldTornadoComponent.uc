/*******************************************************************************
 * NxForceFieldTornadoComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class NxForceFieldTornadoComponent extends NxForceFieldComponent
    native(ForceField)
    editinlinenew
    collapsecategories
    hidecategories(Collision,Lighting,Physics,Rendering,Object);

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
var() interp float SelfRotationStrength;
var native const transient Pointer Kernel;

defaultproperties
{
    LiftStrength=10
    ForceRadius=200
    ForceTopRadius=200
    ForceHeight=200
    begin object name=Shape0 class=ForceFieldShapeCapsule
        begin object name=DrawCapsule0 class=DrawCapsuleComponent
            ReplacementPrimitive=none
        object end
        // Reference: DrawCapsuleComponent'Default__NxForceFieldTornadoComponent.Shape0.DrawCapsule0'
        Shape=DrawCapsule0
    object end
    // Reference: ForceFieldShapeCapsule'Default__NxForceFieldTornadoComponent.Shape0'
    Shape=Shape0
    ReplacementPrimitive=none
}