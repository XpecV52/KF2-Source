//=============================================================================
// KFMGA_DoshTossPit
//=============================================================================
// Actor that handles tracking of the dosh toss minigame.  Paired with 
//      a TargetGame actor to handle the core game win/lose condition.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

class KFMGA_DoshTossPit extends KFMGA_Target;

/** how much dosh to return to the player per-bucket */
var() const int DoshReward;

/** how long to blend to closed after a bucket is hit */
var() float TimeToBlend;

var AnimNodeBlendPerBone CachedBlendNode;

/** PSC for internal bucket glow - Always on, gets color shifted between states */
var() ParticleSystemComponent InnerGlowPSC;

/** PSC for external bucket glow - Only on when the box is inactive */
var() ParticleSystemComponent OuterGlowPSC;

/** Glow Colors */
var() Color ActiveGlowColor;
var() Color InactiveGlowColor;

/** These don't take damage */
simulated event TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser) {}

simulated event Tick(float DeltaTime)
{
    super.Tick(DeltaTime);

    if (TimeToBlend > 0.f)
    {
        TimeToBlend -= DeltaTime;
        SetBucketLidState(TimeToBlend > 0.f ? 1.f - (TimeToBlend / default.TimeToBlend) : 1.f);
    }
}

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
    if (KFDroppedPickup_Cash(Other) != none && KFDroppedPickup_Cash(Other).CollisionComponent.RigidBodyIsAwake())
    {
        KFDroppedPickup_Cash(Other).NotifyMinigameHit(self);
    }
}

/** We don't actually care about damage here.  For client-authority purposes I'm routing a server call through here to handle 
 *      the actual hit tracking.  I just care that DamageCauser is a cash object.  Because of this, we also don't care about
 *      non-authority damage calls, as that is handled by touch events against cash objects.
 */
function ValidHit(Controller EventInstigator, Actor HitActor)
{
    DoshHit(KFDroppedPickup_Cash(HitActor));
}

/** Handle cleanup after hit occurs */
function DoshHit(KFDroppedPickup_Cash Cash)
{
    local KFPlayerController KFPC;
    local KFPlayerReplicationInfo KFPRI;

    if (Cash != none && IsAlive())
    {
        NumHits--;

        if (NumHits <= 0 && SpawnerOwner != none)
        {
            SpawnerOwner.TargetHit(self, Cash.Instigator.Controller);
            PlayDeath();

            //Reward tossing player
            KFPC = KFPlayerController(Cash.Owner);
            if (KFPC != none)
            {
                KFPRI = KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo);
                if (KFPRI != none)
                {
                    KFPRI.AddDosh(DoshReward);
                }
            }
        }
    }    

    //Cleanup cash now anyway.  It's out of reach of the player permanently
    Cash.Destroy();
}

simulated event Reset()
{
    local Vector RelativeOffset;

    SetBucketLidState(0.f);

    if (WorldInfo.NetMode != NM_DedicatedServer)
    {
        OuterGlowPSC.SetHidden(true);
        OuterGlowPSC.DeactivateSystem();
        InnerGlowPSC.SetHidden(true);
        InnerGlowPSC.DeactivateSystem();
        InnerGlowPSC.SetColorParameter('Glow_Color', InactiveGlowColor);
    }

    super.Reset();

    //Safe offset w/ attach bone directly in the base of the geo
    RelativeOffset.Z = CollisionCylinder.CollisionHeight + 10;
    SetRelativeLocation(RelativeOffset);
    TimeToBlend = 0.0f;
}

/** Note: This will only work w/ animtree support enabled.  Without an animtree, this will silently fail. */
simulated function SetBucketLidState(float BlendAmount)
{
    local name TopName;
    local KFMG_RiggedTargetGame TargetGame;
    local int BoneIndex;

    TargetGame = KFMG_RiggedTargetGame(SpawnerOwner);
    if (AttachBoneName != 'none' && TargetGame !=  none)
    {
        if (CachedBlendNode == none)
        {
            CachedBlendNode = AnimNodeBlendPerBone(TargetGame.MinigameRig.SkeletalMeshComponent.FindAnimNode('BucketBlend'));
        }

        if (CachedBlendNode != none)
        {
            //This name is going to be of the form Bucketxx.  We also want to make sure to control BucketTopxx
            TopName = name("BucketTop" $ Right(string(AttachBoneName), 2));
            BoneIndex = TargetGame.MinigameRig.SkeletalMeshComponent.MatchRefBone(TopName);
            if (BoneIndex != INDEX_NONE)
            {
                CachedBlendNode.Child2PerBoneWeight[BoneIndex] = BlendAmount;
            }
        }
    }
}

simulated function PlayDeath()
{
    super.PlayDeath();
  
    TimeToBlend = default.TimeToBlend;  

    if (WorldInfo.NetMode != NM_DedicatedServer)
    {
        OuterGlowPSC.SetHidden(false);
        OuterGlowPSC.ActivateSystem(true);
        InnerGlowPSC.SetHidden(false);
        InnerGlowPSC.SetColorParameter('Glow_Color', InactiveGlowColor);
    }
}

simulated event SetActive()
{
    bActiveTarget = true;
    
    if (WorldInfo.NetMode != NM_DedicatedServer)
    {
        OuterGlowPSC.SetHidden(true);
        InnerGlowPSC.SetHidden(false);
        InnerGlowPSC.ActivateSystem(true);
        InnerGlowPSC.SetColorParameter('Glow_Color', ActiveGlowColor);
    }
}

simulated event SetInactive()
{
    bActiveTarget = false;
}

simulated event Finalize()
{
    if (WorldInfo.NetMode != NM_DedicatedServer)
    {
        OuterGlowPSC.SetHidden(true);
        OuterGlowPSC.DeactivateSystem();
        InnerGlowPSC.SetHidden(true);
        InnerGlowPSC.DeactivateSystem();
        InnerGlowPSC.SetColorParameter('Glow_Color', InactiveGlowColor);
    }
}

defaultproperties
{
   DoshReward=50
   TimeToBlend=0.500000
   Begin Object Class=ParticleSystemComponent Name=InnerGlow0
      ReplacementPrimitive=None
      HiddenGame=True
      Name="InnerGlow0"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__ParticleSystemComponent'
   End Object
   InnerGlowPSC=InnerGlow0
   Begin Object Class=ParticleSystemComponent Name=OuterGlow0
      ReplacementPrimitive=None
      HiddenGame=True
      Name="OuterGlow0"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__ParticleSystemComponent'
   End Object
   OuterGlowPSC=OuterGlow0
   ActiveGlowColor=(B=0,G=0,R=50,A=255)
   InactiveGlowColor=(B=0,G=50,R=0,A=255)
   Begin Object Class=StaticMeshComponent Name=Mesh0 Archetype=StaticMeshComponent'kfgamecontent.Default__KFMGA_Target:Mesh0'
      ReplacementPrimitive=None
      Name="Mesh0"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFMGA_Target:Mesh0'
   End Object
   Mesh=Mesh0
   Begin Object Class=CylinderComponent Name=Cylinder0 Archetype=CylinderComponent'kfgamecontent.Default__KFMGA_Target:Cylinder0'
      CollisionHeight=30.000000
      CollisionRadius=30.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="Cylinder0"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFMGA_Target:Cylinder0'
   End Object
   CollisionCylinder=Cylinder0
   Begin Object Class=AkComponent Name=DeathSFX0 Archetype=AkComponent'kfgamecontent.Default__KFMGA_Target:DeathSFX0'
      Name="DeathSFX0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFMGA_Target:DeathSFX0'
   End Object
   DeathSFXComponent=DeathSFX0
   Components(0)=Cylinder0
   Components(1)=Mesh0
   Components(2)=DeathSFX0
   Components(3)=InnerGlow0
   Components(4)=OuterGlow0
   CollisionComponent=Cylinder0
   Name="Default__KFMGA_DoshTossPit"
   ObjectArchetype=KFMGA_Target'kfgamecontent.Default__KFMGA_Target'
}
