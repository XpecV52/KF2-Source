/*******************************************************************************
 * DynamicSpriteComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DynamicSpriteComponent extends SpriteComponent
    native
    editinlinenew
    hidecategories(Object);

/** Animated Scale. Relative to DrawScale. */
var() InterpCurveFloat AnimatedScale;
/** Animated color + alpha */
var() InterpCurveLinearColor AnimatedColor;
/** Animated 2D position (screen space). Relative to StartPosition. */
var() InterpCurveVector2D AnimatedPosition;
/** 3D world space offset from Location */
var() Vector LocationOffset;
/** How many times to loop (-1 = infinite) */
var() int LoopCount;

defaultproperties
{
    LoopCount=-1
    ReplacementPrimitive=none
}