/*******************************************************************************
 * KFProj_Bolt_CompoundBowSharp generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Bolt_CompoundBowSharp extends KFProj_RicochetStickBullet
    hidecategories(Navigation);

var repnotify int ChargeLevel;

replication
{
     if(bNetInitial)
        ChargeLevel;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'ChargeLevel')
    {
        SpawnFlightEffects();
    }
    super.ReplicatedEvent(VarName);
}

simulated function PostBeginPlay()
{
    local KFWeap_Bow_CompoundBow CompoundBow;

    if(Role == ROLE_Authority)
    {
        CompoundBow = KFWeap_Bow_CompoundBow(Owner);
        if(CompoundBow != none)
        {
            ChargeLevel = CompoundBow.GetChargeLevel();
        }
    }
    super(KFProjectile).PostBeginPlay();
}

simulated function float GetChargeLevelTrail()
{
    if(ChargeLevel >= 2)
    {
        if(WorldInfo.NetMode == NM_Client)
        {
            return 1;
        }
        return 0.73;
    }
    if(ChargeLevel == 1)
    {
        if(WorldInfo.NetMode == NM_Client)
        {
            return 0.825;
        }
        return 0.365;
    }
    if(WorldInfo.NetMode == NM_Client)
    {
        return 0.66;
    }
    return 0;
}

simulated function SpawnFlightEffects()
{
    if(ChargeLevel < 0)
    {
        return;
    }
    super.SpawnFlightEffects();
    if(ProjEffects != none)
    {
        ProjEffects.SetVectorParameter('ChargeLevelTrail', (GetChargeLevelTrail()) * vect(1, 1, 1));
    }
}

simulated function SyncOriginalLocation()
{
    LastLocation = OriginalLocation;
    super(KFProjectile).SyncOriginalLocation();
}

defaultproperties
{
    ChargeLevel=-1
    WeaponClassName=KFWeap_Bow_CompoundBow
    AmmoPickupSound=AkEvent'WW_WEP_SA_Crossbow.Play_Crossbow_Bolt_Pickup'
    ProjPickupTemplate=ParticleSystem'WEP_Crossbow_EMIT.FX_Crossbow_Projectile_Pickup'
    LifeSpanAfterStick=180
    BouncesLeft=0
    bNoReplicationToInstigator=false
    bWarnAIWhenFired=true
    TerminalVelocity=15000
    ProjFlightTemplate=ParticleSystem'WEP_CompoundBow_EMIT.FX_Compound_Bow_Sharp_Projectile'
    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_Crossbow.Play_Bolt_Fly_By'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_Crossbow.Stop_Bolt_Fly_By'
    AmbientComponent=AkComponent'Default__KFProj_Bolt_CompoundBowSharp.AmbientAkSoundComponent'
    ImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Crossbow_impact'
    Speed=15000
    MaxSpeed=15000
    bBlockedByInstigator=false
    bRotationFollowsVelocity=false
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bolt_CompoundBowSharp.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bolt_CompoundBowSharp.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Bolt_CompoundBowSharp.AmbientAkSoundComponent'
    bNetTemporary=false
    bNoEncroachCheck=true
    LifeSpan=10
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bolt_CompoundBowSharp.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}