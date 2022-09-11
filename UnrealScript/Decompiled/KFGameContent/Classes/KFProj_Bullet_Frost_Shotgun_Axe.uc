/*******************************************************************************
 * KFProj_Bullet_Frost_Shotgun_Axe generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Bullet_Frost_Shotgun_Axe extends KFProj_Bullet_Pellet
    hidecategories(Navigation);

var AkEvent oFrozenSound;

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    local KFPawn P;

    P = KFPawn(Other);
    super(KFProj_Bullet).ProcessTouch(Other, HitLocation, HitNormal);
    if(P != none)
    {
        if(KFPawn_Monster(P).IsDoingSpecialMove(9))
        {
            P.PlayAkEvent(oFrozenSound);
        }
    }
}

defaultproperties
{
    oFrozenSound=AkEvent'WW_WEP_SA_CompoundBow.Play_Arrow_Impact_Cryo'
    ProjFlightTemplate=ParticleSystem'WEP_Frost_Shotgun_Axe_EMIT.FX_FrostFang_Tracer_01'
    ProjFlightTemplateZedTime=ParticleSystem'WEP_Frost_Shotgun_Axe_EMIT.FX_FrostFang_Tracer_Zedtime_01'
    AmbientComponent=AkComponent'Default__KFProj_Bullet_Frost_Shotgun_Axe.AmbientAkSoundComponent'
    ImpactEffects=KFImpactEffectInfo'WEP_Frost_Shotgun_Axe_ARCH.WEP_FrostFang_Projectile_Impact'
    AssociatedPerkClass=Class'KFGame.KFPerk_Support'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_Frost_Shotgun_Axe.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_Frost_Shotgun_Axe.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Bullet_Frost_Shotgun_Axe.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_Frost_Shotgun_Axe.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}