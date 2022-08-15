/*******************************************************************************
 * DrawCapsuleComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DrawCapsuleComponent extends PrimitiveComponent
    native
    editinlinenew
    collapsecategories
    noexport
    hidecategories(Object);

var() Color CapsuleColor;
var() Material CapsuleMaterial;
var() float CapsuleHeight;
var() float CapsuleRadius;
var() bool bDrawWireCapsule;
var() bool bDrawLitCapsule;
var() bool bDrawOnlyIfSelected;

defaultproperties
{
    CapsuleColor=(B=0,G=0,R=255,A=255)
    CapsuleHeight=200
    CapsuleRadius=200
    bDrawWireCapsule=true
    ReplacementPrimitive=none
    HiddenGame=true
}