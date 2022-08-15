/*******************************************************************************
 * KFAnimSeq_ByWeaponClass generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAnimSeq_ByWeaponClass extends AnimNodeSequence
    native(Anim)
    hidecategories(Object,Object,Object);

struct native WeaponClassNameInfo
{
    /** Weapon class */
    var() class<KFWeapon> WeaponClass<AllowAbstract=>;
    /** Animation to use */
    var() name AnimName;

    structdefaultproperties
    {
        WeaponClass=none
        AnimName=None
    }
};

/** List of weapons, class and animation name. */
var() array<WeaponClassNameInfo> WeaponList;
/** Default, when no match can be made, or weapon is holstered */
var() name WeaponDefaultAnimName;
/** When moving the slider, keep nodes with same property in sync. */
var() bool bSynchronizeNodesInEditor;
var const transient bool bTemporaryHolster;
var editoronly const float WeaponListSliderPosition;
var const transient Pawn PawnOwner;
var const transient Weapon CurrentWeapon;

defaultproperties
{
    bSynchronizeNodesInEditor=true
}