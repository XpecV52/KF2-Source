/*******************************************************************************
 * KFProj_FreezeThrower_GroundIce generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_FreezeThrower_GroundIce extends KFProj_GroundIce
    hidecategories(Navigation);

defaultproperties
{
    bWarnAIWhenFired=true
    begin object name=ExploTemplate0 class=KFGameExplosion
        Damage=7
        MyDamageType=Class'KFDT_Freeze_Ground_FreezeThrower'
        MomentumTransferScale=0.1
    object end
    // Reference: KFGameExplosion'Default__KFProj_FreezeThrower_GroundIce.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_FreezeThrower_GroundIce.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_FreezeThrower_GroundIce.CollisionCylinder'
    Components(0)=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_FreezeThrower_GroundIce.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}