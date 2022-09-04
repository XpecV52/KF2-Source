//=============================================================================
// SprayActor_Heal
//=============================================================================
// Base class for spray actor that heals teammates
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class SprayActor_Heal extends SprayActor_Flame
    hidecategories(Object, Movement, Display, Attachment, Collision, Physics, Advanced, Debug, Mobile)
	placeable;

var(SprayHeal) int DirectHitHealingAmount;
var(SprayHeal) int SplashHitHealingAmount;
var(SprayHeal) float  HealInterval;

var class<DamageType> HealingDamageType;
var array<DamagedActorInfo> RecentlyHealedActors;

function bool CheckRecentlyHealed(Actor ActorToCheck)
{
	local int i;
	local bool bFoundHitActor, bHealedRecently;

	for (i = RecentlyHealedActors.Length - 1; i >= 0; i--)
	{
		if ((WorldInfo.TimeSeconds - RecentlyHealedActors[i].HitTime) > 1.f)
		{
			RecentlyHealedActors.Remove(i, 1);
			continue;
		}

		if (!bFoundHitActor && RecentlyHealedActors[i].HitActor == ActorToCheck)
		{
			bFoundHitActor = true;

			// Only damage at a specified rate, so return if it's too soon
			if ((WorldInfo.TimeSeconds - RecentlyHealedActors[i].HitTime) < HealInterval)
			{
				bHealedRecently = true;
			}
		}
	}

	return bHealedRecently;
}
event SprayMeshHit(Actor TouchActor)
{
	local DamagedActorInfo NewActorInfo;

	if (Role == ROLE_Authority)
	{
		if (Instigator != None && TouchActor != None && Instigator != TouchActor && Instigator.GetTeamNum() == TouchActor.GetTeamNum())
		{
			if (!CheckRecentlyHealed(TouchActor))
			{
				NewActorInfo.HitActor = TouchActor;
				NewActorInfo.HitTime = WorldInfo.TimeSeconds;

				// Store any actors that get damage
				RecentlyHealedActors.AddItem(NewActorInfo);

				TouchActor.HealDamage(DirectHitHealingAmount, Instigator.Controller, HealingDamageType);
				return;
			}
		}
	}

	super.SprayMeshHit(TouchActor);
}

event SplashHit(Actor SplashTouchActor)
{
	local DamagedActorInfo NewActorInfo;

	if (Role == ROLE_Authority)
	{
		if (Instigator != None && SplashTouchActor != None && Instigator != SplashTouchActor && Instigator.GetTeamNum() == SplashTouchActor.GetTeamNum())
		{
			if (!CheckRecentlyHealed(SplashTouchActor))
			{
				NewActorInfo.HitActor = SplashTouchActor;
				NewActorInfo.HitTime = WorldInfo.TimeSeconds;

				// Store any actors that get damage
				RecentlyHealedActors.AddItem(NewActorInfo);

				SplashTouchActor.HealDamage(SplashHitHealingAmount, Instigator.Controller, HealingDamageType);
				return;
			}
		}
	}

	super.SplashHit(SplashTouchActor);
}

defaultproperties
{
   DirectHitHealingAmount=2
   SplashHitHealingAmount=1
   HealInterval=0.100000
   HealingDamageType=Class'kfgamecontent.KFDT_Healing_MedicGrenade'
   bCollideWithTeammates=True
   BoneChain(0)=
   BoneChain(1)=
   BoneChain(2)=
   BoneChain(3)=
   BoneChain(4)=
   BoneChain(5)=
   BoneChain(6)=
   BoneChain(7)=
   BoneChain(8)=
   BoneChain(9)=
   BoneChain(10)=
   BoneChain(11)=
   BoneChain(12)=
   BoneChain(13)=
   BoneChain(14)=()
   Begin Object Class=AkComponent Name=CurrentSplashAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__SprayActor_Flame:CurrentSplashAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="CurrentSplashAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__SprayActor_Flame:CurrentSplashAkSoundComponent'
   End Object
   CurrentSplashAKC=CurrentSplashAkSoundComponent
   SprayLights(0)=(Light=FlamePointLight0)
   SprayLights(1)=(Light=FlamePointLight2)
   MyDamageType=Class'KFGame.KFDT_Toxic_MedicGrenade'
   Begin Object Class=KFSkeletalMeshComponent Name=FlameCore0 Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__SprayActor_Flame:FlameCore0'
      SkeletalMesh=SkeletalMesh'FX_Flamethrower_MESH.WEP_Flamethrower_Flame_A'
      AnimTreeTemplate=AnimTree'FX_Flamethrower_ANIM.WEP_Flamethrower_Flame_AT'
      AnimSets(0)=AnimSet'FX_Flamethrower_ANIM.WEP_Flamethrower_Flame_Anim'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      CastShadow=False
      CollideActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      Rotation=(Pitch=0,Yaw=0,Roll=-16384)
      Name="FlameCore0"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__SprayActor_Flame:FlameCore0'
   End Object
   Components(0)=FlameCore0
   Begin Object Class=KFParticleSystemComponent Name=SplashGlancingPSC0 Archetype=KFParticleSystemComponent'kfgamecontent.Default__SprayActor_Flame:SplashGlancingPSC0'
      bAutoActivate=False
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      TranslucencySortPriority=1
      Name="SplashGlancingPSC0"
      ObjectArchetype=KFParticleSystemComponent'kfgamecontent.Default__SprayActor_Flame:SplashGlancingPSC0'
   End Object
   Components(1)=SplashGlancingPSC0
   Begin Object Class=KFParticleSystemComponent Name=SplashDirectPSC0 Archetype=KFParticleSystemComponent'kfgamecontent.Default__SprayActor_Flame:SplashDirectPSC0'
      bAutoActivate=False
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      TranslucencySortPriority=1
      Name="SplashDirectPSC0"
      ObjectArchetype=KFParticleSystemComponent'kfgamecontent.Default__SprayActor_Flame:SplashDirectPSC0'
   End Object
   Components(2)=SplashDirectPSC0
   Begin Object Class=KFParticleSystemComponent Name=SplashPawnPSC0 Archetype=KFParticleSystemComponent'kfgamecontent.Default__SprayActor_Flame:SplashPawnPSC0'
      bAutoActivate=False
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      TranslucencySortPriority=1
      Name="SplashPawnPSC0"
      ObjectArchetype=KFParticleSystemComponent'kfgamecontent.Default__SprayActor_Flame:SplashPawnPSC0'
   End Object
   Components(3)=SplashPawnPSC0
   Begin Object Class=KFParticleSystemComponent Name=SplashMaterialBasedPSC0 Archetype=KFParticleSystemComponent'kfgamecontent.Default__SprayActor_Flame:SplashMaterialBasedPSC0'
      bAutoActivate=False
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      TranslucencySortPriority=1
      Name="SplashMaterialBasedPSC0"
      ObjectArchetype=KFParticleSystemComponent'kfgamecontent.Default__SprayActor_Flame:SplashMaterialBasedPSC0'
   End Object
   Components(4)=SplashMaterialBasedPSC0
   Components(5)=CurrentSplashAkSoundComponent
   CollisionComponent=FlameCore0
   Name="Default__SprayActor_Heal"
   ObjectArchetype=SprayActor_Flame'kfgamecontent.Default__SprayActor_Flame'
}
