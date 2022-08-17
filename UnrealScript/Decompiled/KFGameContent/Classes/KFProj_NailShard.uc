/*******************************************************************************
 * KFProj_NailShard generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_NailShard extends KFProj_Nail_Nailgun
    hidecategories(Navigation);

defaultproperties
{
    bSyncToThirdPersonMuzzleLocation=false
    bNoReplicationToInstigator=false
    bReplicateClientHitsAsFragments=true
    ProjFlightTemplate=ParticleSystem'WEP_Nailbomb_EMIT.FX_Nailbomb_Tracer'
    ProjFlightTemplateZedTime=ParticleSystem'WEP_Nailbomb_EMIT.FX_Nailbomb_Tracer_ZEDTime'
    AmbientComponent=AkComponent'Default__KFProj_NailShard.AmbientAkSoundComponent'
    Speed=5000
    MaxSpeed=5000
    Damage=35
    MyDamageType=Class'KFDT_Piercing_NailFragment'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_NailShard.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_NailShard.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_NailShard.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_NailShard.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}