//=============================================================================
// KFProj_Grenade_CranialPopper
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================

class KFProj_Grenade_HRG_CranialPopper extends KFProj_BallisticExplosive
	hidedropdown;

/* Ensure it detonates */
var float WaveDuration;
var float WaveRadius;
var float WaveRadiusMax;
var float WaveTime;
var protected transient bool bWaveActive;
var array<Actor> VictimsList;
var vector WaveImpactMomentum;

var GameExplosion VFXExplosionTemplate;

state WaveState
{
	simulated event BeginState(Name PrevStateName)
	{
		super.BeginState(PrevStateName);
		
		bWaveActive = true;

		if (Role == ROLE_Authority)
		{
			SetTimer(WaveDuration, false, 'Timer_EndWave');
		}
	}

	simulated event Tick(float DeltaTime)
	{
		local KFPawn_Monster Victim;
		local TraceHitInfo   HitInfo;
		local float Radius;
		local float DamageHead;
		local name HitBoneName;

		if(bWaveActive)
		{
			WaveTime += DeltaTime;
			Radius = Lerp(WaveRadius, WaveRadiusMax, WaveTime / WaveDuration);
			// DrawDebugSphere(Location, Radius, 100, 255, 255, 0, false);
			foreach CollidingActors(class'KFPawn_Monster', Victim, Radius, Location, true,, HitInfo)
			{
				if (Victim != none && Victim.CollisionComponent != none && VictimsList.Find(Victim) == INDEX_NONE)
				{
					VictimsList[VictimsList.Length] = Victim;
					DamageHead = Victim.AfflictionHandler.GetBigHeadAfflictionDamageModifier();
					if(DamageHead > 0)
					{
						//`Log("Take: "$Victim);
												
						HitBoneName = Victim.HeadBoneName;

						if(HitBoneName != '')
						{
							HitInfo.BoneName = HitBoneName;
						}

						//`Log("HitInfo.BoneName: "$HitInfo.BoneName);

						Victim.TakeDamage(DamageHead * UpgradeDamageMod, InstigatorController, Victim.Location, Normal(Victim.Location - Instigator.Location), MyDamageType, HitInfo, (Owner != None) ? Owner : self);

						if (Victim.Health <= 0)
						{
							MakeHeadExplode(Victim);
						}
					}
				}
			}
		}
	}
}

/**
 * Set the initial velocity and cook time
 */
function Init(vector Direction)
{
	Super.Init(Direction);

	if ( Instigator.Role < ROLE_Authority )
	{
		return;
	}

	GotoState('WaveState');
	TriggerVFXExplosion();
}

simulated function TriggerVFXExplosion()
{
	local KFExplosionActorReplicated ExploActor;
	local float ModifiedDamage, OriginalDamage, OriginalDamageRadius;

	if (VFXExplosionTemplate != none)
	{
		// explode using the given template
		ExploActor = Spawn(class'KFExplosionActorReplicated', self,, Location, Rotation,, true);
		if (ExploActor != None)
		{
			ExploActor.InstigatorController = Instigator.Controller;
			ExploActor.Instigator = Instigator;

			// enable muzzle location sync
			ExploActor.bReplicateInstigator = true;
			ExploActor.bSyncParticlesToMuzzle = true;

			ModifiedDamage = 0;

			OriginalDamage = VFXExplosionTemplate.Damage;
			OriginalDamageRadius = VFXExplosionTemplate.DamageRadius;

			VFXExplosionTemplate.Damage *= ModifiedDamage;
			VFXExplosionTemplate.DamageRadius *= ModifiedDamage;

			ExploActor.Explode(VFXExplosionTemplate);

			VFXExplosionTemplate.Damage = OriginalDamage;
			VFXExplosionTemplate.DamageRadius = OriginalDamageRadius;
		}
	}
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
}

simulated function Timer_EndWave()
{
	bWaveActive = false;
	DeferredDestroy(0.15);
}

simulated function MakeHeadExplode(KFPawn_Monster Victim)
{
	local KFPlayerController KFPC;

	if (Victim == none) return;

	// Notify all Clients to explode the monster head.
	foreach WorldInfo.AllControllers( class'KFPlayerController', KFPC )
	{
		if (KFPC != none)
		{
			KFPC.ForceMonsterHeadExplode(Victim);
		}
	}
}

defaultproperties
{
   WaveDuration=2.000000
   WaveRadius=10.000000
   WaveRadiusMax=15000.000000
   VFXExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Grenade_HRG_CranialPopper:ExploTemplate0'
   bWarnAIWhenFired=True
   TouchTimeThreshhold=60.000000
   GravityScale=0.000000
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=0.000000
   MaxSpeed=0.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
      CollisionHeight=5.000000
      CollisionRadius=5.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   Physics=PHYS_Falling
   LifeSpan=0.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Grenade_HRG_CranialPopper"
   ObjectArchetype=KFProj_BallisticExplosive'KFGame.Default__KFProj_BallisticExplosive'
}
