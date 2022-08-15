/*******************************************************************************
 * RB_PulleyJointActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class RB_PulleyJointActor extends RB_ConstraintActor
    placeable
    hidecategories(Navigation);

defaultproperties
{
    ConstraintSetup=RB_PulleyJointSetup'Default__RB_PulleyJointActor.MyPulleyJointSetup'
    ConstraintInstance=RB_ConstraintInstance'Default__RB_PulleyJointActor.MyConstraintInstance'
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.S_KBSJoint'
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__RB_PulleyJointActor.Sprite'
    Components(0)=Sprite
    begin object name=MyConDrawComponent class=RB_ConstraintDrawComponent
        ReplacementPrimitive=none
    object end
    // Reference: RB_ConstraintDrawComponent'Default__RB_PulleyJointActor.MyConDrawComponent'
    Components(1)=MyConDrawComponent
}