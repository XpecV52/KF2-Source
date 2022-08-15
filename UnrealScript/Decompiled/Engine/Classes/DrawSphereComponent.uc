/*******************************************************************************
 * DrawSphereComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DrawSphereComponent extends PrimitiveComponent
    native
    editinlinenew
    collapsecategories
    noexport
    hidecategories(Object);

var() Color SphereColor;
var() Material SphereMaterial;
var() float SphereRadius;
var() int SphereSides;
var() bool bDrawWireSphere;
var() bool bDrawLitSphere;
var() bool bDrawOnlyIfSelected;

defaultproperties
{
    SphereColor=(B=0,G=0,R=255,A=255)
    SphereRadius=100
    SphereSides=16
    bDrawWireSphere=true
    ReplacementPrimitive=none
    HiddenGame=true
}