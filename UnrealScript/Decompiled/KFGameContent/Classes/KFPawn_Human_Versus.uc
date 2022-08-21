/*******************************************************************************
 * KFPawn_Human_Versus generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_Human_Versus extends KFPawn_Human
    config(Game)
    hidecategories(Navigation);

simulated function SetCharacterArch(KFCharacterInfoBase Info, optional bool bForce)
{
    super.SetCharacterArch(Info, bForce);
    UpdateGameplayMICParams();
}

simulated function UpdateGameplayMICParams()
{
    local PlayerController PC;
    local MaterialInstanceConstant MIC;

    super(KFPawn).UpdateGameplayMICParams();
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        PC = GetALocalPlayerController();
        if(PC != none)
        {
            foreach CharacterMICs(MIC,)
            {
                MIC.SetScalarParameterValue('Scalar_Zedbait', ((PC.GetTeamNum() == 255) ? 1 : 0));                
            }            
        }
    }
}

simulated function NotifyLocalPlayerTeamReceived()
{
    UpdateGameplayMICParams();
}

defaultproperties
{
    begin object name=FlashLight class=KFFlashlightAttachment
        begin object name=FlashLightTemplate class=SpotLightComponent
            LightGuid=(A=0,B=0,C=0,D=0) // Ka v oh
            LightmapGuid=(A=0,B=0,C=0,D=0) // Ka v oh
        object end
        // Reference: SpotLightComponent'Default__KFPawn_Human_Versus.FlashLight.FlashLightTemplate'
        LightTemplate=FlashLightTemplate
        begin object name=LightConeComp class=StaticMeshComponent
            ReplacementPrimitive=none
        object end
        // Reference: StaticMeshComponent'Default__KFPawn_Human_Versus.FlashLight.LightConeComp'
        LightConeMeshComp=LightConeComp
    object end
    // Reference: KFFlashlightAttachment'Default__KFPawn_Human_Versus.FlashLight'
    FlashLightTemplate=FlashLight
    TraderDialogAkComponent=AkComponent'Default__KFPawn_Human_Versus.TraderDialogAkSoundComponent'
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_Human_Versus.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_Human_Versus.Afflictions'
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_Human_Versus.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_Human_Versus.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_Human_Versus.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_Human_Versus.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_Human_Versus.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_Human_Versus.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_Human_Versus.DialogAkSoundComponent'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_Human_Versus.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_Human_Versus.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_Human_Versus.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_Human_Versus.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_Human_Versus.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_Human_Versus.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_Human_Versus.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_Human_Versus.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_Human_Versus.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_Human_Versus.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_Human_Versus.TraderDialogAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_Human_Versus.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}