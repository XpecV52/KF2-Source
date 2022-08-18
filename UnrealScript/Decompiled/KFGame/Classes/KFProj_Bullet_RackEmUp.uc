/*******************************************************************************
 * KFProj_Bullet_RackEmUp generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Bullet_RackEmUp extends KFProj_Bullet
    native
    hidecategories(Navigation);

var private bool bCollided;

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, Vector HitLocation, Vector HitNormal)
{
    bCollided = true;
    super(KFProjectile).Touch(Other, OtherComp, HitLocation, HitNormal);
}

simulated event HitWall(Vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
    if(!bCollided)
    {
        CheckForComboBreaker();
        bCollided = true;
    }
    super(Projectile).HitWall(HitNormal, Wall, WallComp);
}

// Export UKFProj_Bullet_RackEmUp::execCheckForComboBreaker(FFrame&, void* const)
private native final simulated function CheckForComboBreaker();

defaultproperties
{
    AmbientComponent=AkComponent'Default__KFProj_Bullet_RackEmUp.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_RackEmUp.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_RackEmUp.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Bullet_RackEmUp.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_RackEmUp.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}