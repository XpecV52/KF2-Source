/*******************************************************************************
 * KFAnimNotify_MeleeImpact_1P generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAnimNotify_MeleeImpact_1P extends AnimNotify
    native(Anim)
    editinlinenew
    collapsecategories
    hidecategories(Object);

/** If set, use hit box collision detection for this weapon */
var() bool bAdvancedCollisionDetection;

event NotifyFirstPerson(KFPawn P, AnimNodeSequence AnimSeqInstigator)
{
    if((P.MyKFWeapon != none) && P.MyKFWeapon.IsMeleeing())
    {
        P.MyKFWeapon.MeleeAttackHelper.MeleeImpactNotify(self);
    }
}

event NotifyThirdPerson(KFPawn P, AnimNodeSequence AnimSeqInstigator);

defaultproperties
{
    NotifyColor=(B=0,G=0,R=255,A=255)
}