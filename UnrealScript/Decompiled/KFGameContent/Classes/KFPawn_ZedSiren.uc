/*******************************************************************************
 * KFPawn_ZedSiren generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedSiren extends KFPawn_Monster
    config(Game)
    hidecategories(Navigation);

var protected export editinline PointLightComponent NeckLightComponent;
var protected const name NeckLightSocketName;
var protected const float ScreamLightFlickerRate;
var protected const float ScreamLightRadius;
var protected const float ScreamLightFalloffExponent;
var protected const float MinFlickerBrightness;
var protected const float MaxFlickerBrightness;

simulated function SetCharacterArch(KFCharacterInfoBase Info, optional bool bForce)
{
    super(KFPawn).SetCharacterArch(Info, bForce);
    if(((WorldInfo.NetMode != NM_DedicatedServer) && !NeckLightComponent.bAttached) && WorldInfo.GetDetailMode() > 0)
    {
        Mesh.AttachComponentToSocket(NeckLightComponent, NeckLightSocketName);
        NeckLightComponent.SetEnabled(true);
        KFLightPool(WorldInfo.MyLightPool).RegisterPointLight(NeckLightComponent, 2);
    }
}

simulated function ANIMNOTIFY_SirenScream()
{
    local KFSM_Siren_Scream ScreamSM;

    ScreamSM = KFSM_Siren_Scream(SpecialMoves[SpecialMove]);
    if(ScreamSM != none)
    {
        ScreamSM.ScreamBegan();
        if(WorldInfo.NetMode != NM_Client)
        {
            DisablebOnDeathAchivement();
        }
    }
}

simulated function EnableScreamFlicker(bool bEnabled)
{
    if((((WorldInfo.NetMode == NM_DedicatedServer) || bPlayedDeath) || NeckLightComponent == none) || !NeckLightComponent.bAttached)
    {
        return;
    }
    if(bEnabled)
    {
        NeckLightComponent.AnimationType = 3;
        NeckLightComponent.AnimationFrequency = ScreamLightFlickerRate;
        NeckLightComponent.Radius = ScreamLightRadius;
        NeckLightComponent.FalloffExponent = ScreamLightFalloffExponent;
        NeckLightComponent.MinBrightness = MinFlickerBrightness;
        NeckLightComponent.MaxBrightness = MaxFlickerBrightness;        
    }
    else
    {
        NeckLightComponent.AnimationType = default.NeckLightComponent.AnimationType;
        NeckLightComponent.AnimationFrequency = default.NeckLightComponent.AnimationFrequency;
        NeckLightComponent.Radius = default.NeckLightComponent.Radius;
        NeckLightComponent.FalloffExponent = default.NeckLightComponent.FalloffExponent;
        NeckLightComponent.MinBrightness = default.NeckLightComponent.MinBrightness;
        NeckLightComponent.MaxBrightness = default.NeckLightComponent.MaxBrightness;
    }
    NeckLightComponent.DetachFromAny();
    Mesh.AttachComponentToSocket(NeckLightComponent, NeckLightSocketName);
}

simulated function TerminateEffectsOnDeath()
{
    super(KFPawn).TerminateEffectsOnDeath();
    if((NeckLightComponent != none) && NeckLightComponent.bAttached)
    {
        NeckLightComponent.DetachFromAny();
        NeckLightComponent = none;
    }
}

function int GetKillerDialogID()
{
    return 66;
}

function int GetSpotterDialogID()
{
    return 128;
}

static function int GetTraderAdviceID()
{
    return 44;
}

defaultproperties
{
    begin object name=NeckLightComponent0 class=PointLightComponent
        Radius=35
        Brightness=0.8
        LightColor=(B=50,G=50,R=250,A=255)
        bEnabled=false
        CastShadows=false
        bCastPerObjectShadows=false
        LightingChannels=(Outdoor=true)
        MaxBrightness=1.2
        MinBrightness=0.75
        AnimationType=1
        AnimationFrequency=5
    object end
    // Reference: PointLightComponent'Default__KFPawn_ZedSiren.NeckLightComponent0'
    NeckLightComponent=NeckLightComponent0
    NeckLightSocketName=NeckLightSocket
    ScreamLightFlickerRate=4.25
    ScreamLightRadius=200
    ScreamLightFalloffExponent=2
    MinFlickerBrightness=0.4
    MaxFlickerBrightness=2
    MonsterArchPath="ZED_ARCH.ZED_Siren_Archetype"
    begin object name=MeleeHelper class=KFMeleeHelperAI
        BaseDamage=13
        MyDamageType=Class'KFDT_Slashing_ZedWeak'
    object end
    // Reference: KFMeleeHelperAI'Default__KFPawn_ZedSiren.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    DoshValue=25
    XPValues[0]=11
    XPValues[1]=15
    XPValues[2]=15
    XPValues[3]=15
    WeakSpotSocketNames=/* Array type was not detected. */
    DamageTypeModifiers=/* Array type was not detected. */
    DifficultySettings=Class'KFDifficulty_Siren'
    SprintAkComponent=AkComponent'Default__KFPawn_ZedSiren.SprintAkComponent0'
    OnDeathAchievementID=129
    PawnAnimInfo=KFPawnAnimInfo'ZED_Siren_ANIM.Siren_AnimGroup'
    LocalizationKey=KFPawn_ZedSiren
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedSiren.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    HitZones=/* Array type was not detected. */
    begin object name=Afflictions class=KFAfflictionManager
        AfflictionClasses=/* Array type was not detected. */
    object end
    // Reference: KFAfflictionManager'Default__KFPawn_ZedSiren.Afflictions'
    AfflictionHandler=Afflictions
    IncapSettings=/* Array type was not detected. */
    PhysRagdollImpulseScale=0.5
    KnockdownImpulseScale=0.5
    SprintSpeed=275
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedSiren.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedSiren.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedSiren.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedSiren.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedSiren.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedSiren.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedSiren.DialogAkSoundComponent'
    DamageRecoveryTimeHeavy=0.75
    Mass=50
    GroundSpeed=200
    Health=230
    ControllerClass=Class'KFAIController_ZedSiren'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bPerBoneMotionBlur=false
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedSiren.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedSiren.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedSiren.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedSiren.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedSiren.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bPerBoneMotionBlur=false
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedSiren.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedSiren.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedSiren.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedSiren.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedSiren.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedSiren.SprintAkComponent0'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedSiren.CollisionCylinder'
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=50000,Yaw=20000,Roll=50000)
}