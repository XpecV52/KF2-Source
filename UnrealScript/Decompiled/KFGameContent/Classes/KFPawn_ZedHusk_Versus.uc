/*******************************************************************************
 * KFPawn_ZedHusk_Versus generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedHusk_Versus extends KFPawn_ZedHusk
    config(Game)
    hidecategories(Navigation);

var float FireballSpeed;

simulated function ANIMNOTIFY_FlameThrowerOn()
{
    if(IsDoingSpecialMove(23))
    {
        KFSM_Husk_FlameThrowerAttack(SpecialMoves[SpecialMove]).TurnOnFlamethrower();
    }
}

function ANIMNOTIFY_HuskFireballAttack()
{
    ShootFireball();
}

function ShootFireball()
{
    local Vector SocketLocation;
    local KFProjectile MyFireball;
    local PlayerController PC;
    local Rotator ShootRotation;
    local Vector HitLocation, HitNormal, TraceStart, TraceEnd;
    local Actor HitActor;

    if((Role == ROLE_Authority) && IsHumanControlled())
    {
        PC = PlayerController(Controller);
        if(PC == none)
        {
            return;
        }
        SocketLocation = (GetPawnViewLocation()) + (PlayerFireOffset >> (GetViewRotation()));
        TraceStart = PC.PlayerCamera.CameraCache.POV.Location;
        TraceEnd = PC.PlayerCamera.CameraCache.POV.Location + (vector(PC.PlayerCamera.CameraCache.POV.Rotation) * float(100000));
        HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, true,,, 1);
        if(HitActor != none)
        {
            ShootRotation = rotator(HitLocation - SocketLocation);            
        }
        else
        {
            ShootRotation = rotator(TraceEnd - SocketLocation);
        }
        if((float(Health) > 0) && IsDoingSpecialMove(22))
        {
            MyFireball = Spawn(FireballClass, self,, SocketLocation, ShootRotation);
            MyFireball.Instigator = self;
            MyFireball.InstigatorController = Controller;
            MyFireball.Speed = FireballSpeed;
            MyFireball.MaxSpeed = FireballSpeed;
            MyFireball.Init(vector(ShootRotation));
        }
    }
}

simulated function OnExploded(Controller SuicideController)
{
    local KFPlayerController KFPC;

    if(SuicideController != none)
    {
        KFPC = KFPlayerController(SuicideController);
        if(KFPC != none)
        {
            KFPC.SetCameraMode('ZedSuicide');
            KFPlayerCamera_Versus(KFPC.PlayerCamera).SwapToZedSuicideCam(Location);
        }
    }
}

defaultproperties
{
    FireballSpeed=3600
    PlayerFireOffset=(X=15,Y=32,Z=-12)
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.HuskSuicide_Explosion'
        Damage=125
        DamageRadius=600
        DamageFalloffExponent=0.5
        MyDamageType=Class'KFDT_Explosive_HuskSuicide'
        MomentumTransferScale=1
        ExplosionSound=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Suicide_Explode'
        ExploLight=PointLightComponent'Default__KFPawn_ZedHusk_Versus.ExplosionPointLight'
        ExploLightFadeOutTime=0.5
        CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.HuskSuicide'
    object end
    // Reference: KFGameExplosion'Default__KFPawn_ZedHusk_Versus.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    bVersusZed=true
    ThirdPersonViewOffset=(OffsetHigh=(X=-175,Y=75,Z=40),OffsetMid=(X=-160,Y=60,Z=0),OffsetLow=(X=-220,Y=75,Z=50))
    begin object name=MeleeHelper class=KFMeleeHelperAI
        BaseDamage=30
        MeleeImpactCamScale=0.2
    object end
    // Reference: KFMeleeHelperAI'Default__KFPawn_ZedHusk_Versus.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    DoshValue=68
    SpecialMoveCooldowns=/* Array type was not detected. */
    LocalizationKey=KFPawn_ZedHusk
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedHusk_Versus.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    bNeedsCrosshair=true
    AfflictionHandler=KFPawnAfflictions'Default__KFPawn_ZedHusk_Versus.Afflictions'
    InstantIncaps=/* Array type was not detected. */
    StackingIncaps=/* Array type was not detected. */
    SprintSpeed=500
    SprintStrafeSpeed=250
    TeammateCollisionRadiusPercent=0.3
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedHusk_Versus.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedHusk_Versus.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedHusk_Versus.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedHusk_Versus.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedHusk_Versus.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedHusk_Versus.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedHusk_Versus.DialogAkSoundComponent'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedHusk_Versus.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedHusk_Versus.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedHusk_Versus.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedHusk_Versus.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedHusk_Versus.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedHusk_Versus.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedHusk_Versus.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedHusk_Versus.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedHusk_Versus.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedHusk_Versus.DialogAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedHusk_Versus.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}