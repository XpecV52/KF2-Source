/*******************************************************************************
 * KFWeap_Blunt_Pulverizer generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Blunt_Pulverizer extends KFWeap_MeleeBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

const ShootAnim_L = 'HardFire_L';
const ShootAnim_R = 'HardFire_R';
const ShootAnim_F = 'HardFire_F';
const ShootAnim_B = 'HardFire_B';

var() GameExplosion ExplosionTemplate;
var transient Vector BlastStartLocation;
var transient Actor BlastAttachee;
var transient bool bPulverizerFireReleased;

simulated function CustomFire()
{
    local KFExplosionActorReplicated ExploActor;
    local Vector SpawnLoc;
    local Rotator SpawnRot;

    if(Instigator.Role < ROLE_Authority)
    {
        return;
    }
    SpawnLoc = Instigator.GetWeaponStartTraceLocation();
    SpawnRot = GetPulverizerAim(SpawnLoc);
    ExploActor = Spawn(Class'KFExplosionActorReplicated', self,, SpawnLoc, SpawnRot,, true);
    if(ExploActor != none)
    {
        ExploActor.InstigatorController = Instigator.Controller;
        ExploActor.Instigator = Instigator;
        ExploActor.Attachee = BlastAttachee;
        ExplosionTemplate.bFullDamageToAttachee = true;
        ExploActor.bReplicateInstigator = true;
        ExploActor.bSyncParticlesToMuzzle = true;
        ExploActor.Explode(ExplosionTemplate, vector(SpawnRot));
    }
    IncrementFlashCount();
    if(bDebug)
    {
        DrawDebugCone(SpawnLoc, vector(SpawnRot), ExplosionTemplate.DamageRadius, ExplosionTemplate.DirectionalExplosionAngleDeg * 0.01745329, ExplosionTemplate.DirectionalExplosionAngleDeg * 0.01745329, 16, MakeColor(64, 64, 255, 0), true);
    }
}

simulated function Rotator GetPulverizerAim(Vector StartFireLoc)
{
    local Rotator R;

    R = GetAdjustedAim(StartFireLoc);
    switch(MeleeAttackHelper.CurrentAttackDir)
    {
        case 2:
            R.Yaw += 5461;
            break;
        case 3:
            R.Yaw -= 5461;
            break;
        case 0:
            R.Pitch -= 2048;
            break;
        case 1:
            R.Pitch += 2048;
            break;
        default:
            break;
    }
    return R;
}

simulated function name GetWeaponFireAnim(byte FireModeNum)
{
    switch(MeleeAttackHelper.CurrentAttackDir)
    {
        case 0:
        case 4:
        case 5:
            return 'HardFire_F';
        case 1:
        case 6:
        case 7:
            return 'HardFire_B';
        case 2:
            return 'HardFire_L';
        case 3:
            return 'HardFire_R';
        default:
            return 'None';
            break;
    }
}

private reliable server final function ServerBeginPulverizerFire(Actor HitActor, optional Vector HitLocation)
{
    if(VSizeSq2D(HitLocation - Instigator.Location) > Square(500))
    {
        LogInternal("ServerBeginPulverizerFire outside of range!");
        return;
    }
    BlastStartLocation = HitLocation;
    BlastAttachee = HitActor;
    SendToFiringState(6);
}

simulated function BeginPulverizerFire()
{
    SendToFiringState(6);
}

simulated function bool ShouldRefire()
{
    if(CurrentFireMode == 6)
    {
        return false;
    }
    return super(Weapon).ShouldRefire();
}

simulated function SendToFiringState(byte FireModeNum)
{
    if((FireModeNum == 2) && !CanReload())
    {
        SetCurrentFireMode(FireModeNum);
        GotoState('WeaponUpkeep');
        return;
    }
    super.SendToFiringState(FireModeNum);
}

simulated function bool CanReload()
{
    return true;
}

simulated state MeleeHeavyAttacking
{
    simulated event BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        bPulverizerFireReleased = false;
    }

    simulated function StopFire(byte FireModeNum)
    {
        super(KFWeapon).StopFire(FireModeNum);
        bPulverizerFireReleased = true;
    }

    simulated function NotifyMeleeCollision(Actor HitActor, optional Vector HitLocation)
    {
        local KFPawn Victim;

        if((Instigator != none) && Instigator.IsLocallyControlled())
        {
            if(HitActor.bWorldGeometry)
            {
                return;
            }
            Victim = KFPawn(HitActor);
            if((Victim == none) || Victim.bPlayedDeath && (WorldInfo.TimeSeconds - Victim.TimeOfDeath) > 0)
            {
                return;
            }
            if((AmmoCount[0] > 0) && !IsTimerActive('BeginPulverizerFire'))
            {
                BlastStartLocation = HitLocation;
                BlastAttachee = HitActor;
                SetTimer(0.001, false, 'BeginPulverizerFire');
                if(Role < ROLE_Authority)
                {
                    if(HitActor.bTearOff && Victim != none)
                    {
                        Victim.TakeRadiusDamage(Instigator.Controller, ExplosionTemplate.Damage, ExplosionTemplate.DamageRadius, ExplosionTemplate.MyDamageType, ExplosionTemplate.MomentumTransferScale, Location, true, ((Owner != none) ? Owner : self));                        
                    }
                    else
                    {
                        ServerBeginPulverizerFire(HitActor, HitLocation);
                    }
                }
            }
        }
    }
    stop;    
}

defaultproperties
{
    ExplosionTemplate=KFGameExplosion'WEP_Pulverizer_ARCH.Wep_Pulverizer_Explosion'
    ParryStrength=5
    ParryDamageMitigationPercent=0.1
    BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Hammer'
    ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Wood'
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=6
    bCanBeReloaded=true
    bReloadFromMagazine=true
    GroupPriority=75
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Pulverizer'
    MagazineCapacity=5
    MaxSpareAmmo=30
    InitialSpareMags=3
    WeaponFireSnd=/* Array type was not detected. */
    AttachmentArchetype=KFWeapAttach_Pulverizer'WEP_Pulverizer_ARCH.Wep_Pulverizer_3P'
    begin object name=MeleeHelper class=KFMeleeHelperWeapon
        ChainSequence_F=/* Array type was not detected. */
        ChainSequence_B=/* Array type was not detected. */
        ChainSequence_L=/* Array type was not detected. */
        ChainSequence_R=/* Array type was not detected. */
        MaxHitRange=190
        HitboxChain=/* Array type was not detected. */
    object end
    // Reference: KFMeleeHelperWeapon'Default__KFWeap_Blunt_Pulverizer.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_Pulverizer_ARCH.Wep_Pulverizer_MuzzleFlash'
    AssociatedPerkClass=Class'KFGame.KFPerk_Berserker'
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Pulverizer_MESH.Wep_1stP_Pulverizer_Rig_New'
        AnimSets(0)=AnimSet'WEP_1P_Pulverizer_ANIM.Wep_1stP_Pulverizer_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Blunt_Pulverizer.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Pulverizer"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Pulverizer_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Blunt_Pulverizer.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Pulverizer_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Blunt_Pulverizer.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}