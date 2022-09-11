//=============================================================================
// KFWeap_HRG_EMP_ArcGenerator 
//=============================================================================
// A gun that zaps zeds
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// FFerrando @ saber3d
//=============================================================================
/*
	Default firemode:
	-max number of secondary arcs
	-secondary arcs max range
	-main beam max range
	-aiming speed reduction

	Alt firemode:
	-projectile speed
	-projectile max range
	-zapTick (time between zaps)
	-max number of Zeds zapped
	-zap max range
 */
class KFWeap_HRG_EMP_ArcGenerator extends KFWeap_FlameBase;

Replication
{
	if(role == role_authority && bNetDirty)
		oZedCurrentlyBeingSprayed;
}

/** Shoot animation to play when shooting secondary fire */
var(Animations) const editconst	name	FireHeavyAnim;

/** Shoot animation to play when shooting secondary fire last shot */
var(Animations) const editconst	name	FireLastHeavyAnim;

/** Shoot animation to play when shooting secondary fire last shot when aiming */
var(Animations) const editconst	name	FireLastHeavySightedAnim;

/** Alt-fire explosion template */
var() GameExplosion 		ExplosionTemplate;



/**************************** HRG SPRAY STUFF*/ 


struct BeamAttachedToActor
{
	var ParticleSystemComponent oBeam;
	var KFPawn_Monster oAttachedZed;
};

var array<DamagedActorInfo> vRecentlyZappedActors;
var array<DamagedActorInfo> vAuxDeletionArrayChainedActors;

var array<BeamAttachedToActor> vActiveBeamEffects;
var array<BeamAttachedToActor> vAuxDeletionArray;


var repnotify KFPawn_Monster oZedCurrentlyBeingSprayed;


var ParticleSystem BeamPSCTemplate;

var string EmitterPoolClassPath;
var EmitterPool vBeamEffects;

var int 	MaxNumberOfZedsZapped;
var int 	MaxDistanceToBeZapped;
var float 	ZapInterval;
var int 	ChainDamage;


/*********************** */

/** Handle one-hand fire anims */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	local bool bPlayFireLast;

    bPlayFireLast = ShouldPlayFireLast(FireModeNum);

	if ( bUsingSights )
	{
		if( bPlayFireLast )
        {
        	if ( FireModeNum == ALTFIRE_FIREMODE )
        	{
                return FireLastHeavySightedAnim;
        	}
        	else
        	{
                return FireLastSightedAnim;
            }
        }
        else
        {
            return FireSightedAnims[FireModeNum];
        }

	}
	else
	{
		if( bPlayFireLast )
        {
        	if ( FireModeNum == ALTFIRE_FIREMODE )
        	{
                return FireLastHeavyAnim;
        	}
        	else
        	{
                return FireLastAnim;
            }
        }
        else
        {
        	if ( FireModeNum == ALTFIRE_FIREMODE )
        	{
                return FireHeavyAnim;
        	}
        	else
        	{
                return FireAnim;
            }
        }
	}
}



/**
 * Instead of a toggle, just immediately fire alternate fire.
 */
simulated function AltFireMode()
{
	// LocalPlayer Only
	if ( !Instigator.IsLocallyControlled()  )
	{
		return;
	}

	StartFire(ALTFIRE_FIREMODE);
}

/** Disable auto-reload for alt-fire */
simulated function bool ShouldAutoReload(byte FireModeNum)
{
	local bool bRequestReload;

    bRequestReload = Super.ShouldAutoReload(FireModeNum);

    // Must be completely empty for auto-reload or auto-switch
    if ( FireModeNum == ALTFIRE_FIREMODE && AmmoCount[0] > 0 )
    {
   		bPendingAutoSwitchOnDryFire = false;
   		return false;
    }

    return bRequestReload;
}

static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Electric;
}


simulated function StartPilotSound()
{
	if( Instigator != none && Instigator.IsLocallyControlled() && Instigator.IsFirstPerson() )
	{
        //PostAkEventOnBone(PilotLightPlayEvent, PilotLightSocketName, true, true);
    }
}

/**
 * Stops playing looping Pilot light sound
 */
simulated function StopPilotSound()
{
    //PostAkEventOnBone(PilotLightStopEvent, PilotLightSocketName, true, true);
}

/**********************************************************************




*********************************************************************** */


simulated function ReplicatedEvent(name VarName)
{
	if(VarName == nameof(oZedCurrentlyBeingSprayed))
	{
		if(role != role_authority || WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_StandAlone)
		{
			if(oZedCurrentlyBeingSprayed == none)
			{
				SprayEnded();
			}
		}
	}
}

simulated function ChangeMaterial()
{
	// Removed from base class
	/*local int i, Idx;
    if( BarrelHeat != LastBarrelHeat )
    {
    	for( i = 0; i < WeaponMICs.Length; ++i )
    	{
    		if( WeaponMICs[i] != none )
    		{
				WeaponMICs[i].SetScalarParameterValue('Glow_Intensity', BarrelHeat);
			}
		}
    }*/
}

simulated protected function TurnOnPilot()
{
	Super.TurnOnPilot();

	if( FlamePool[0] != None )
	{
		KFSprayActor_ArcGenerator(FlamePool[0]).OwnerWeapon = self;
		MaxNumberOfZedsZapped=KFSprayActor_ArcGenerator(FlamePool[0]).MaxNumberOfZedsZapped;
		MaxDistanceToBeZapped=KFSprayActor_ArcGenerator(FlamePool[0]).MaxDistanceToBeZapped;
		ZapInterval=KFSprayActor_ArcGenerator(FlamePool[0]).ZapInterval;
		ChainDamage=KFSprayActor_ArcGenerator(FlamePool[0]).ChainDamage;
	}
	if( FlamePool[1] != None )
	{
		KFSprayActor_ArcGenerator(FlamePool[1]).OwnerWeapon = self;
	}
}

simulated function float FlameHeatCalc()
{
	//hack in order to make the arc gen always glow
	LastBarrelHeat = 1.0f;
	return 1.0f;
}

simulated event PostBeginPlay()
{
	local class<EmitterPool> PoolClass;
	super.PostBeginPlay();

	PoolClass = class<EmitterPool>(DynamicLoadObject(EmitterPoolClassPath, class'Class'));
	if (PoolClass != None)
	{
		vBeamEffects = Spawn(PoolClass, self,, vect(0,0,0), rot(0,0,0));
	}
}


/***************************************

	PARTICLE SYSTEM POOL AND ATTACHMENT MANAGEMENT

 ***************************************/

/** We so we detach the Component once we are done playing it **/
simulated function OnBeamEffectFinished( ParticleSystemComponent PSC )
{
	PSC.DeactivateSystem();
	EndPSC(PSC);
}

//returns the position of the effect in the array, otherwise, -1
simulated function int SpawnBeam(Actor _OriginActor, Actor _DestinationActor)
{	
	local ParticleSystemComponent BeamPSC;

	local BeamAttachedToActor BeamAttachedInfo;
	local int i;

	//if actor is dupped in active beams, not chain again this to another beam

	for(i = 0; i < vActiveBeamEffects.Length; i++)
	{
		if(vActiveBeamEffects[i].oAttachedZed == _DestinationActor)
		{
			return -1;
		}
	}
	BeamPSC = vBeamEffects.SpawnEmitterCustomLifetime(BeamPSCTemplate);
	if(BeamPSC != none)
	{
		BeamPSC.SetBeamSourcePoint(0, _OriginActor.Location, 0);
		BeamPSC.SetBeamTargetPoint(0, _DestinationActor.Location, 0);
		BeamPSC.SetKillOnDeactivate(0, true);
		BeamPSC.SetAbsolute(false, false, false);
		BeamPSC.bUpdateComponentInTick = true;

		BeamAttachedInfo.oBeam = BeamPSC;
		BeamAttachedInfo.oAttachedZed = KFPawn_Monster(_DestinationActor);

		if(role != role_authority || WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_StandAlone)
		{
			BeamPSC.SetActive(true);
			AttachComponent(BeamPSC);
		}

		BeamAttachedInfo.oBeam.SetActive(true);
		vActiveBeamEffects.AddItem(BeamAttachedInfo);
		return vActiveBeamEffects.Length - 1;
	}
	else
	{
	}
	return -1;
}

simulated function MarkBeamToDeactivate(BeamAttachedToActor _BeamData)
{
	LogInternal(_BeamData.oAttachedZed);
	vAuxDeletionArray.AddItem(_BeamData);
}

simulated function MarkZedToUnchain(DamagedActorInfo _DamageActorInfo)
{
	vAuxDeletionArrayChainedActors.AddItem(_DamageActorInfo);
}

simulated function BeamAttachedToActor GetBeamFromActor(Actor _Actor)
{
	local int i;

	for(i = 0; i < vActiveBeamEffects.Length; i++)
	{
		if(vActiveBeamEffects[i].oAttachedZed == _Actor)
		{
			return vActiveBeamEffects[i];
		}
	}
}

simulated function DeactivateBeam(Actor _ChainedActor)
{
	local int i;
	for(i = 0; i < vActiveBeamEffects.Length; i++)
	{
		if(vActiveBeamEffects[i].oAttachedZed == _ChainedActor)
		{
			OnBeamEffectFinished(vActiveBeamEffects[i].oBeam);
			vActiveBeamEffects.RemoveItem(vActiveBeamEffects[i]);
			break;
		}
	}

}

simulated function EndPSC(ParticleSystemComponent _Value)
{
	/*if(vCachedBeamEffects.Length < MaxNumberOfZedsZapped)
	{
		vCachedBeamEffects.AddItem(_Value);
	}*/
	_Value.KillParticlesForced();
	vBeamEffects.OnParticleSystemFinished(_Value);
	DetachComponent(_Value);
}


/***************************************

	END PARTICLE SYSTEM POOL AND ATTACHMENT MANAGEMENT

 ***************************************/



/***************************************

	CHAIN LOGIC FUNCTIONS

 ***************************************/
 
simulated function SetCurrentSprayedZed(KFPawn_Monster _Monster)
{
	if(role == role_authority || WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_StandAlone)
	{
		oZedCurrentlyBeingSprayed = _Monster;
		bNetDirty=true;
	}
}

 //returns true if it has successfully chained the zed, false otherwise (ex: dupe zed in the array)
function bool ChainZed(Actor _ZedToChain)
{
	local DamagedActorInfo NewActorInfo;
	local int i;
	
	for (i = vRecentlyZappedActors.Length - 1; i >= 0; i--)
	{
		//remove everything if pawn died or interval is greater than the time its supposed to be in here; 
		if(vRecentlyZappedActors[i].HitActor == _ZedToChain)
		{
			return false;
		}
	}

	NewActorInfo.HitActor = _ZedToChain;
	NewActorInfo.HitTime = WorldInfo.TimeSeconds;
	vRecentlyZappedActors.AddItem(NewActorInfo);
	return true;
}

function UnchainZed(DamagedActorInfo _ZedToUnchain)
{
	vRecentlyZappedActors.RemoveItem(_ZedToUnchain);
}

function bool CheckRecentlyZapped(Actor _ActorToCheck)
{
	local int i;
	local bool bZapedRecently;
	bZapedRecently = false;

	for (i = vRecentlyZappedActors.Length - 1; i >= 0; i--)
	{
		if (vRecentlyZappedActors[i].HitActor == _ActorToCheck)
		{
			//`Warn("FOUND ACTOR. WorldInfo.TimeSeconds = " $(WorldInfo.TimeSeconds)$ "");
			//`Warn("FOUND ACTOR. vRecentlyZappedActors[i].HitTime = " $(vRecentlyZappedActors[i].HitTime)$ "");
			//`Warn("FOUND ACTOR. INTERVAL = " $(WorldInfo.TimeSeconds - vRecentlyZappedActors[i].HitTime)$ "");
			// Only damage at a specified rate, so return if it's too soon
			if ((WorldInfo.TimeSeconds - vRecentlyZappedActors[i].HitTime) < ZapInterval)
			{
				bZapedRecently = true;
			}
			break;
		}
	}

	return bZapedRecently;
}

function UpdateLastHitTimeForActor(Actor _ActorToCheck)
{
	local int i;
	for (i = vRecentlyZappedActors.Length - 1; i >= 0; i--)
	{
		if (vRecentlyZappedActors[i].HitActor == _ActorToCheck)
		{
			//`Warn("SETTING TIME: " $WorldInfo.TimeSeconds$ "");
			vRecentlyZappedActors[i].HitTime = WorldInfo.TimeSeconds;
			break;
		}
	}
}

simulated function ChainNearZeds(Actor _TouchActor)
{
	local KFPawn_Monster oMonsterPawn;

	//`Warn("ChainNearZeds(Actor _TouchActor)");
	//we get all pawns from the world to check them
	foreach WorldInfo.AllPawns( class'KFPawn_Monster', oMonsterPawn )
	{
		//if its alive and its not the main sprayed monster
		if( oMonsterPawn.IsAliveAndWell() && oMonsterPawn != _TouchActor)
		{
			//if its close enough to be zapped
			if( VSizeSQ(oMonsterPawn.Location - _TouchActor.Location) < Square(MaxDistanceToBeZapped) )
			{
				if(vActiveBeamEffects.Length < MaxNumberOfZedsZapped)
				{
					//if we have nothing in between
					if(FastTrace(_TouchActor.Location, oMonsterPawn.Location, vect(0,0,0)) == false)
					{
						continue;
					}
					if(_TouchActor.IsA('KFPawn_Monster'))
					{
						if(role == role_authority || WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_StandAlone)
						{
							ChainZed(oMonsterPawn);
						}
						SpawnBeam(_TouchActor, oMonsterPawn);
					}
				}
				else
				{
					break;
				}
			}
		}
	}
}

/***************************************

	CHAIN LOGIC FUNCTIONS END

 ***************************************/

simulated event Tick(float DeltaTime)
{
	local int i;
	local vector BeamStartPoint, BeamEndPoint;

	Super.Tick(DeltaTime);

	if(oZedCurrentlyBeingSprayed != none)
	{
			//if we have space for one more zed to chain, we try to chain one zed
			if(vActiveBeamEffects.Length < MaxNumberOfZedsZapped && !CheckRecentlyZapped(oZedCurrentlyBeingSprayed))
			{
				ChainNearZeds(oZedCurrentlyBeingSprayed);
			}
			//`Warn(vActiveBeamEffects.Length);
			//check current beams
			for (i = vActiveBeamEffects.Length - 1; i >= 0; i--)
			{
				//if a current beam has gone out of sight (we have a wall in between for example), remove the beam and continue to next beam
				if(FastTrace(vActiveBeamEffects[i].oAttachedZed.Location, oZedCurrentlyBeingSprayed.Location, vect(0,0,0)) == false)
				{
					//OnBeamEffectFinished(vActiveBeamEffects[i].oBeam);
					MarkBeamToDeactivate(GetBeamFromActor(vRecentlyZappedActors[i].HitActor));
					continue;
				}

				//if its not near enough to stay zapped, we break the chain
				if (VSizeSQ(vActiveBeamEffects[i].oAttachedZed.Location - oZedCurrentlyBeingSprayed.Location) < Square(MaxDistanceToBeZapped))
				{
					//if has been recently damaged, do not take damage again until the fire rate tells us
					if( !CheckRecentlyZapped(vActiveBeamEffects[i].oAttachedZed))
					{
						//take damage
						if(vActiveBeamEffects[i].oAttachedZed.IsAliveAndWell())
						{		
							if(role == role_authority || WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_StandAlone)
							{ 
								ChainedZapDamageFunction(vActiveBeamEffects[i].oAttachedZed, oZedCurrentlyBeingSprayed);
								UpdateLastHitTimeForActor(vActiveBeamEffects[i].oAttachedZed);
							}
							 
							if(role != role_authority || WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_StandAlone)
							{
								//`warn(vActiveBeamEffects[i].oAttachedZed.Location);
								BeamStartPoint = oZedCurrentlyBeingSprayed.Mesh.GetBoneLocation('Spine1');
								BeamEndPoint = vActiveBeamEffects[i].oAttachedZed.Mesh.GetBoneLocation('Spine1');

								if(BeamStartPoint == vect(0,0,0)) BeamStartPoint = oZedCurrentlyBeingSprayed.Location;
								if(BeamEndPoint == vect(0,0,0)) BeamEndPoint = vActiveBeamEffects[i].oAttachedZed.Location;

								vActiveBeamEffects[i].oBeam.SetBeamSourcePoint(0, BeamStartPoint, 0);
								vActiveBeamEffects[i].oBeam.SetBeamTargetPoint(0, BeamEndPoint, 0);
							}
							

							if(!vActiveBeamEffects[i].oAttachedZed.IsAliveAndWell())
							{
								//OnBeamEffectFinished(vActiveBeamEffects[i].oBeam);
								MarkBeamToDeactivate(GetBeamFromActor(vActiveBeamEffects[i].oAttachedZed));
							}
						}
					}
				}
				else
				{
					//OnBeamEffectFinished(vActiveBeamEffects[i].oBeam);
					if(role != role_authority || WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_StandAlone)
						MarkBeamToDeactivate(GetBeamFromActor(vActiveBeamEffects[i].oAttachedZed));
				}
			}
	}


	if(oZedCurrentlyBeingSprayed == none && (role != role_authority || WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_StandAlone))
	{
		for(i = 0; i < vActiveBeamEffects.Length; i++)
		{
			OnBeamEffectFinished(vActiveBeamEffects[i].oBeam);
		}
		vActiveBeamEffects.Remove(0, vActiveBeamEffects.Length);
	}
	else if(oZedCurrentlyBeingSprayed != none && (role != role_authority || WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_StandAlone))
	{
		LogInternal(vActiveBeamEffects.Length);
		for(i = 0; i < vActiveBeamEffects.Length; i++)
		{

			if(!vActiveBeamEffects[i].oAttachedZed.IsAliveAndWell())
			{
				//OnBeamEffectFinished(vActiveBeamEffects[i].oBeam);
				MarkBeamToDeactivate(GetBeamFromActor(vActiveBeamEffects[i].oAttachedZed));
			}
		}

		for(i = 0; i < vAuxDeletionArray.Length; i++)
		{
			OnBeamEffectFinished(vAuxDeletionArray[i].oBeam);
			vAuxDeletionArray.RemoveItem(vAuxDeletionArray[i]);

		}
	}

	if(role == role_authority || WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_StandAlone)
	{
		for (i = vRecentlyZappedActors.Length - 1; i >= 0; i--)
		{
			//remove everything if pawn died 
			if(vRecentlyZappedActors[i].HitActor == none )
			{
				DeactivateBeam(vRecentlyZappedActors[i].HitActor);
				//UnchainZed(vRecentlyZappedActors[i]);
				MarkZedToUnchain(vRecentlyZappedActors[i]);
			}
			//remove everything if pawn died 
			if(!KFPawn_Monster(vRecentlyZappedActors[i].HitActor).IsAliveAndWell())
			{
				DeactivateBeam(vRecentlyZappedActors[i].HitActor);
				//UnchainZed(vRecentlyZappedActors[i]);
				MarkZedToUnchain(vRecentlyZappedActors[i]);
			}
			//remove if interval is greater than the time its supposed to be in here; 
			if(((WorldInfo.TimeSeconds - vRecentlyZappedActors[i].HitTime) > 1.f))
			{
				DeactivateBeam(vRecentlyZappedActors[i].HitActor);
				//UnchainZed(vRecentlyZappedActors[i]);
				MarkZedToUnchain(vRecentlyZappedActors[i]);
			}
		}
		for(i = 0; i < vAuxDeletionArrayChainedActors.Length; i++)
		{
			UnchainZed(vAuxDeletionArrayChainedActors[i]);
		}
		vAuxDeletionArrayChainedActors.Remove(0, vAuxDeletionArrayChainedActors.Length);

	}
	
	/*if(role != role_authority || WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_StandAlone)
	{
		for (i = vRecentlyZappedActors.Length - 1; i >= 0; i--)
		{
			//remove everything if pawn died 
			if(vRecentlyZappedActors[i].HitActor == none )
			{
				DeactivateBeam(vRecentlyZappedActors[i].HitActor);
				MarkZedToUnchain(vRecentlyZappedActors[i]);

			}
			//remove everything if pawn died 
			if(!KFPawn_Monster(vRecentlyZappedActors[i].HitActor).IsAliveAndWell())
			{
				DeactivateBeam(vRecentlyZappedActors[i].HitActor);
				MarkZedToUnchain(vRecentlyZappedActors[i]);

			}
			//remove if interval is greater than the time its supposed to be in here; 
			if(((WorldInfo.TimeSeconds - vRecentlyZappedActors[i].HitTime) > 1.f))
			{
				DeactivateBeam(vRecentlyZappedActors[i].HitActor);
				MarkZedToUnchain(vRecentlyZappedActors[i]);
			}
		}	
	}*/

}


/** Notification that a direct impact has occurred. */
event ProcessDirectImpact()
{
    if( KFPlayer != none )
    {
        KFPlayer.AddShotsHit(1);
    }
}

function ChainedZapDamageFunction(Actor _TouchActor, Actor _OriginActor)
{
	local vector Momentum;
	local TraceHitInfo HitInfo;
	local Pawn TouchPawn;
	local int TotalDamage;
 
	if (_OriginActor != none)
	{
		Momentum = _TouchActor.Location - _OriginActor.Location;
	}

	//Momentum *= (MomentumScale / DistToHitActor);
	if (ChainDamage > 0)
	{
		TouchPawn = Pawn(_TouchActor);

		// Let script know that we hit something
		if (TouchPawn != none)
		{
			ProcessDirectImpact();
		}
		//`Warn("["$WorldInfo.TimeSeconds$"] Damaging "$_TouchActor.Name$" for "$ChainDamage$", Dist: "$VSize(_TouchActor.Location - _OriginActor.Location));
		
		TotalDamage = ChainDamage * GetUpgradeDamageMod();
		_TouchActor.TakeDamage(TotalDamage, KFPlayer, _TouchActor.Location, Momentum, class'KFDT_EMP_ArcGenerator_DefaultFiremodeZapDamage', HitInfo, self);
	}
}

simulated function SprayEnded()
{
	local int i;

	/*for (i = 0; i < vActiveBeamEffects.Length - 1; i++)
	{
		DeactivateBeam(vActiveBeamEffects[i].oAttachedZed);
	}*/
    //`Warn(vActiveBeamEffects.Length);
	for(i = 0; i < vActiveBeamEffects.Length; i++)
	{
		OnBeamEffectFinished(vActiveBeamEffects[i].oBeam);
	}

	vActiveBeamEffects.Remove(0, vActiveBeamEffects.Length);

}

/**********************************************************************************




 */

defaultproperties
{
   FireHeavyAnim="Shoot_Heavy"
   FireLastHeavyAnim="Shoot_Heavy_Last"
   FireLastHeavySightedAnim="Shoot_Heavy_Iron_Last"
   BeamPSCTemplate=ParticleSystem'WEP_HRG_ArcGenerator_EMIT.FX_Beam_Test'
   EmitterPoolClassPath="Engine.EmitterPool"
   MaxNumberOfZedsZapped=3
   MaxDistanceToBeZapped=2500
   ZapInterval=0.070000
   ChainDamage=5
   bWarnAIWhenFiring=True
   FlameSprayArchetype=KFSprayActor_ArcGenerator'WEP_HRG_ArcGenerator_ARCH.WEP_HRG_ArcGenerator_Spray'
   PilotLightPlayEvent=AkEvent'WW_WEP_HRG_ArcGenerator.Play_HRG_ArcGenerator_PilotLight_Loop'
   PilotLightStopEvent=AkEvent'WW_WEP_HRG_ArcGenerator.Stop_HRG_ArcGenerator_PilotLight_Loop'
   Begin Object Class=KFParticleSystemComponent Name=PilotLight0 Archetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:PilotLight0'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      TickGroup=TG_PostUpdateWork
      Name="PilotLight0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:PilotLight0'
   End Object
   PSC_PilotLight=PilotLight0
   Begin Object Class=KFParticleSystemComponent Name=FlameEndSpray0 Archetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:FlameEndSpray0'
      bAutoActivate=False
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="FlameEndSpray0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:FlameEndSpray0'
   End Object
   PSC_EndSpray=FlameEndSpray0
   MinAmmoConsumed=2
   PackageKey="HRG_ArcGenerator"
   FirstPersonMeshName="WEP_1P_HRG_ArcGenerator_MESH.Wep_1stP_HRG_ArcGenerator_Rig"
   FirstPersonAnimSetNames(0)="WEP_1p_HRG_ArcGenerator_ANIM.WEP_1p_HRG_ArcGenerator_ANIM"
   PickupMeshName="WEP_3P_HRG_ArcGenerator_MESH.Wep_HRG_ArcGenerator_Pickup"
   AttachmentArchetypeName="WEP_HRG_ArcGenerator_ARCH.HRG_ArcGenerator_3P"
   MuzzleFlashTemplateName="WEP_HRG_ArcGenerator_ARCH.Wep_HRG_ArcGenerator_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Electricity'
   FireModeIconPaths(1)=()
   InventorySize=9
   PenetrationPower(1)=40.000000
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=80.000000
   IronSightPosition=(X=3.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=150.000000
   DOF_FG_MaxNearBlurSize=1.000000
   MaxAIWarningDistSQ=2250000.000000
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'WEP_UI_HRG_ArcGenerator_TEX.UI_WeaponSelect_HRG_ArcGenerator'
   MagazineCapacity(0)=90
   AmmoCost(1)=15
   SpareAmmoCapacity(0)=450
   AmmoPickupScale(0)=0.500000
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   FireSightedAnims(0)="Shoot"
   FireSightedAnims(1)="Shoot_Heavy_Iron"
   BonesToLockOnEmpty(0)="RW_Handle1"
   BonesToLockOnEmpty(1)="RW_BatteryCylinder1"
   BonesToLockOnEmpty(2)="RW_BatteryCylinder2"
   BonesToLockOnEmpty(3)="RW_LeftArmSpinner"
   BonesToLockOnEmpty(4)="RW_RightArmSpinner"
   BonesToLockOnEmpty(5)="RW_LockEngager2"
   BonesToLockOnEmpty(6)="RW_LockEngager1"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_HRG_ArcGenerator.Play_HRG_ArcGenerator_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_HRG_ArcGenerator.Play_HRG_ArcGenerator_Fire_1P_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_HRG_ArcGenerator.Play_HRG_ArcGenerator_AltFire_3P',FirstPersonCue=AkEvent'WW_WEP_HRG_ArcGenerator.Play_HRG_ArcGenerator_AltFire_1P')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_HRG_ArcGenerator.Play_HRG_ArcGenerator_Fire_3P_LoopEnd',FirstPersonCue=AkEvent'WW_WEP_HRG_ArcGenerator.Play_HRG_ArcGenerator_Fire_1P_LoopEnd')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_Microwave_Gun.Play_SA_MicrowaveGun_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_Microwave_Gun.Play_SA_MicrowaveGun_DryFire'
   PlayerViewOffset=(X=5.000000,Y=9.000000,Z=-3.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_HRG_EMP_ArcGenerator:MeleeHelper_0'
   maxRecoilPitch=150
   minRecoilPitch=115
   maxRecoilYaw=115
   minRecoilYaw=-115
   RecoilRate=0.085000
   RecoilViewRotationScale=0.250000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65034
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   HippedRecoilModifier=1.500000
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Survivalist'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Stat=EWUS_Damage1,Scale=1.150000),(Add=1)))
   FiringStatesArray(0)="SprayingFire"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Custom
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=None
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_ArcGeneratorSphereBlast'
   FireInterval(0)=0.100000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.000000
   Spread(1)=0.008500
   InstantHitDamage(1)=220.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_EMP_ArcGeneratorSphereImpact'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_ArcGenerator'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_FlameBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_FlameBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HRG Arc Generator"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   bOnlyRelevantToOwner=False
   bAlwaysRelevant=True
   Name="Default__KFWeap_HRG_EMP_ArcGenerator"
   ObjectArchetype=KFWeap_FlameBase'KFGame.Default__KFWeap_FlameBase'
}
