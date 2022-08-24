//=============================================================================
// KFMGA_TargetGame
//=============================================================================
// Data storage class for rigged target games to be placed in the world.  Holds
//      all editor-facing data related to the game's animation needs to reduce
//      replication needs.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

class KFMGA_TargetGame extends SkeletalMeshActor
    implements(KFInterface_MinigameActor);

struct sTargetGameData
{
    /** List of possible animations that can be played.  Picks one at random. */
    var() array<name> MinigameAnimations;
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

//Don't need these implemented for this class
function bool CanBeActivated(KFTrigger_MinigameButton ActivationSource);
function Activated(KFTrigger_MinigameButton ActivationSource);
function Deactivated();

simulated event bool CanPlayAkEvent(Actor inOwner, name BoneName)
{
    if (ParentGame != none)
    {
        return ParentGame.CanPlayAkEvent(inOwner, BoneName);
    }
}

defaultproperties
{
   GameStartAnim="Open"
   GameEndAnim="Close"
   IdleOpenAnim="Idle_Open"
   PostVictoryIdleTime=2.000000
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActor:SkeletalMeshComponent0'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'Engine.Default__SkeletalMeshActor:AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'Engine.Default__SkeletalMeshActor:AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'kfgamecontent.Default__KFMGA_TargetGame:SkeletalMeshComponent0.AnimNodeSeq0'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'kfgamecontent.Default__KFMGA_TargetGame:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      CollideActors=True
      BlockZeroExtent=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="SkeletalMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActor:SkeletalMeshComponent0'
   End Object
   SkeletalMeshComponent=SkeletalMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActor:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Begin Object Class=AudioComponent Name=FaceAudioComponent Archetype=AudioComponent'Engine.Default__SkeletalMeshActor:FaceAudioComponent'
      Name="FaceAudioComponent"
      ObjectArchetype=AudioComponent'Engine.Default__SkeletalMeshActor:FaceAudioComponent'
   End Object
   FacialAudioComp=FaceAudioComponent
   Components(0)=SkeletalMeshComponent0
   Components(1)=FaceAudioComponent
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_Trigger'
      SpriteCategoryName="Triggers"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(2)=Sprite
   CollisionComponent=SkeletalMeshComponent0
   Name="Default__KFMGA_TargetGame"
   ObjectArchetype=SkeletalMeshActor'Engine.Default__SkeletalMeshActor'
}
