//=============================================================================
// KFProj_Grenade_HRGTeslauncher
//=============================================================================
// EMP Grenade projectile class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
// - Fernando Ferrando @ Saber Interactive
//=============================================================================

class KFProj_Grenade_HRGTeslauncher extends KFProj_EMPGrenade
	hidedropdown;

var array<Actor> ImpactList;

//==============
/*  Touching
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if (Other != Instigator && !Other.bWorldGeometry)
	{
		// Don't hit teammates
		if (Other.GetTeamNum() == GetTeamNum())
		{
			return;
		}
		if (!bHasExploded && !bHasDisintegrated)
		{
			GetExplodeEffectLocation(HitLocation, HitNormal, Other);
			TriggerExplosion(HitLocation, HitNormal, Other);
		}
	}

	super.ProcessTouch(Other, HitLocation, HitNormal);
}*/

//==============
// Touching
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    //local bool bWantsClientSideDudHit;
	local float TraveledDistance;

    // If we collided with a Siren shield, let the shield code handle touches
    if( Other.IsA('KFTrigger_SirenProjectileShield') )
    {
        return;
    }

	// Don't hit teammates
	if( Other.GetTeamNum() == GetTeamNum() )
	{
        return;
	}

    // Need to do client side dud hits if this is a client
    //if( Instigator != none && Instigator.Role < ROLE_Authority )
	//{
    //    bWantsClientSideDudHit = true;
    //}

	TraveledDistance = ((WorldInfo.TimeSeconds - CreationTime) * Speed);
	TraveledDistance *= TraveledDistance;

	// Process impact hits
    if (Other != Instigator && !Other.bStatic)
    {
		// check/ignore repeat touch events
		if( !CheckRepeatingTouch(Other) && Other.GetTeamNum() != GetTeamNum())
		{
			ProcessBulletTouch(Other, HitLocation, HitNormal);
		}
    }

    if( WorldInfo.NetMode == NM_Standalone ||
        (WorldInfo.NetMode == NM_ListenServer && Instigator != none && Instigator.IsLocallyControlled()) )
    {
        Super.ProcessTouch( Other, HitLocation, HitNormal );
		if (!bHasExploded && !bHasDisintegrated)
		{
			GetExplodeEffectLocation(HitLocation, HitNormal, Other);
			TriggerExplosion(HitLocation, HitNormal, Other);
		}
        return;
    }

    if( Owner != none && KFWeapon( Owner ) != none && Instigator != none )
    {
    	if( Instigator.Role < ROLE_Authority && Instigator.IsLocallyControlled() )
    	{
            KFWeapon(Owner).HandleClientProjectileExplosion(HitLocation, self);
			Super.ProcessTouch( Other, HitLocation, HitNormal );
			if (!bHasExploded && !bHasDisintegrated)
			{
				GetExplodeEffectLocation(HitLocation, HitNormal, Other);
				TriggerExplosion(HitLocation, HitNormal, Other);
			}
            return;
        }
    }

}

/** Handle bullet collision and damage */
simulated function ProcessBulletTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if (ImpactList.Find(Other) != INDEX_NONE)
	{
		return;
	}
	if (Other != none)
	{
		ImpactList.AddItem(Other);
	}

	super.ProcessBulletTouch(Other, HitLocation, HitNormal);
}

/** Blow up on impact */
simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
	if( StaticMeshComponent(WallComp) != none && StaticMeshComponent(WallComp).CanBecomeDynamic() )
	{
		// pass through meshes that can move (like those little coffee tables in biotics)
		return;
	}

	Explode( Location, HitNormal );
}

// for nukes && concussive force
simulated protected function PrepareExplosionTemplate()
{
    class'KFPerk_Berserker'.static.PrepareExplosive( Instigator, self );

    super.PrepareExplosionTemplate();
}

defaultproperties
{
   bSyncToOriginalLocation=True
   bSyncToThirdPersonMuzzleLocation=True
   bWarnAIWhenFired=True
   TossZ=150.000000
   TerminalVelocity=4000.000000
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.EMPGrenade_Explosion'
      Damage=25.000000
      DamageRadius=350.000000
      MyDamageType=Class'kfgamecontent.KFDT_EMP_TeslauncherEMPGrenade'
      ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_EMP.Play_WEP_EXP_Grenade_EMP_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Grenade_HRGTeslauncher:ExplosionPointLight'
      ExploLightFadeOutTime=0.250000
      ExploLightStartFadeOutTime=0.500000
      ExploLightFlickerIntensity=5.000000
      ExploLightFlickerInterpSpeed=15.000000
      FractureMeshRadius=100.000000
      FracturePartVel=250.000000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      CamShakeInnerRadius=100.000000
      CamShakeOuterRadius=450.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Grenade_HRGTeslauncher:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'WEP_HRG_Teslauncher_EMIT.FX_Medic_GrenadeLauncher_Projectile'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_HRG_Teslauncher_EMIT.FX_Medic_GrenadeLauncher_Projectile_ZEDTIME'
   Speed=4000.000000
   MaxSpeed=4000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_EMPGrenade:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_EMPGrenade:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Grenade_HRGTeslauncher"
   ObjectArchetype=KFProj_EMPGrenade'kfgamecontent.Default__KFProj_EMPGrenade'
}
