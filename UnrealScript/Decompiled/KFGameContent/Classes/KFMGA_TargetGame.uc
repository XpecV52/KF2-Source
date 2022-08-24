/*******************************************************************************
 * KFMGA_TargetGame generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFMGA_TargetGame extends SkeletalMeshActor
    hidecategories(Navigation)
    implements(KFInterface_MinigameActor);

struct sTargetGameData
{
    /** List of possible animations that can be played.  Picks one at random. */
    var() array<name> MinigameAnimations;

    structdefaultproperties
    {
        MinigameAnimations=none
    }
};

/** Per difficulty data for the minigame (if difficulty not supported, uses entry 0) */
var() array<sTargetGameData> MinigameAnimData;
/** List of bones to spawn and attach a target to */
var() array<name> TargetBones;
/** Animation to play when the game is turning on */
var() name GameStartAnim;
/** Animation to play when the game is shutting down */
var() name GameEndAnim;
/** Animation to play while idling closed.  If this is none, simply ends at last frame of GameEndAnim */
var() name IdleClosedAnim;
/** Animation to play while idling open (IE: Victory celebration) */
var() name IdleOpenAnim;
/** Amount of time to stay open post-victory */
var() float PostVictoryIdleTime;
/** Amount of time to stay open post-defeat */
var() float PostDefeatIdleTime;
/** Parent game that is linked with this actor */
var() KFMG_TargetGame ParentGame;

function bool CanBeActivated(KFTrigger_MinigameButton ActivationSource);

function Activated(KFTrigger_MinigameButton ActivationSource);

function Deactivated();

simulated event bool CanPlayAkEvent(Actor InOwner, name BoneName)
{
    if(ParentGame != none)
    {
        return ParentGame.CanPlayAkEvent(InOwner, BoneName);
    }
}

defaultproperties
{
    GameStartAnim=Open
    GameEndAnim=Close
    IdleOpenAnim=Idle_Open
    PostVictoryIdleTime=2
    begin object name=SkeletalMeshComponent0 class=SkeletalMeshComponent
        Animations=AnimNodeSequence'Default__KFMGA_TargetGame.SkeletalMeshComponent0.AnimNodeSeq0'
        bUpdateSkelWhenNotRendered=true
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__KFMGA_TargetGame.MyLightEnvironment'
    object end
    // Reference: SkeletalMeshComponent'Default__KFMGA_TargetGame.SkeletalMeshComponent0'
    SkeletalMeshComponent=SkeletalMeshComponent0
    LightEnvironment=DynamicLightEnvironmentComponent'Default__KFMGA_TargetGame.MyLightEnvironment'
    FacialAudioComp=AudioComponent'Default__KFMGA_TargetGame.FaceAudioComponent'
    begin object name=SkeletalMeshComponent0 class=SkeletalMeshComponent
        Animations=AnimNodeSequence'Default__KFMGA_TargetGame.SkeletalMeshComponent0.AnimNodeSeq0'
        bUpdateSkelWhenNotRendered=true
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__KFMGA_TargetGame.MyLightEnvironment'
    object end
    // Reference: SkeletalMeshComponent'Default__KFMGA_TargetGame.SkeletalMeshComponent0'
    Components(0)=SkeletalMeshComponent0
    Components(1)=AudioComponent'Default__KFMGA_TargetGame.FaceAudioComponent'
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.S_Trigger'
        SpriteCategoryName=Triggers
        ReplacementPrimitive=none
        HiddenGame=true
        AlwaysLoadOnClient=false
        AlwaysLoadOnServer=false
    object end
    // Reference: SpriteComponent'Default__KFMGA_TargetGame.Sprite'
    Components(2)=Sprite
    begin object name=SkeletalMeshComponent0 class=SkeletalMeshComponent
        Animations=AnimNodeSequence'Default__KFMGA_TargetGame.SkeletalMeshComponent0.AnimNodeSeq0'
        bUpdateSkelWhenNotRendered=true
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__KFMGA_TargetGame.MyLightEnvironment'
    object end
    // Reference: SkeletalMeshComponent'Default__KFMGA_TargetGame.SkeletalMeshComponent0'
    CollisionComponent=SkeletalMeshComponent0
}