//=============================================================================
// KFProj_MolotovGrenade
//=============================================================================
// Molotov cocktail projectile class. Molotov does modest damage on impact and
// spawns several lingering flames that do damage over time.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson and Jeff Robinson
//=============================================================================

class KFProj_MolotovGrenade extends KFProj_Grenade
	hidedropdown;

var class<KFProjectile> ResidualFlameProjClass;

/** Number of lingering fires/fireballs to spawn */
var() int NumResidualFlames;

/** Sound to play on throw */
var AkEvent ThrowAkEvent;

simulated function SpawnFlightEffects()
{
	super.SpawnFlightEffects();

	PlaySoundBase( ThrowAkEvent );
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

/** Blow up on impact */
simulated function ProcessTouch( Actor Other, Vector HitLocation, Vector HitNormal )
{
	if( Other.bBlockActors )
	{
		// don't explode on players
		if ( Pawn(Other) != None && Pawn(Other).GetTeamNum() == GetTeamNum() )
		{
           return;
		}

		// don't explode on client-side-only destructibles
		if( KFDestructibleActor(Other) != none && KFDestructibleActor(Other).ReplicationMode == RT_ClientSide )
		{
			return;
		}

		Explode( Location, HitNormal );
	}
}

/** Overridden to spawn residual flames */
simulated function Explode(vector HitLocation, vector HitNormal)
{
	local vector HitVelocity;
	local KFPerk InstigatorPerk;

	local rotator FlareRot;
	
	// velocity is set to 0 in Explode, so cache it here
	HitVelocity = Velocity;

    super.Explode( HitLocation, HitNormal );

    if( Role < Role_Authority )
    {
    	return;
    }

    SpawnResidualFlames( HitLocation, HitNormal, HitVelocity );

    // spawn flare for flarotov
    if( Instigator != none && Instigator.Controller != none )
    {
    	InstigatorPerk = KFPlayerController(Instigator.Controller).GetPerk();
    	if( InstigatorPerk.IsFlarotovActive() )
    	{
    		FlareRot = rotator( HitVelocity );
    		FlareRot.Pitch = 0;
    		Spawn( class'KFProj_MolotovFlare', self,, HitLocation + HitNormal * 20, FlareRot );
    	}
    }
}

/** Spawn several projectiles that explode and linger on impact */
simulated function SpawnResidualFlames( vector HitLocation, vector HitNormal, vector HitVelocity )
{
	local int i;
	local vector HitVelDir;
	local float HitVelMag;
	local vector SpawnLoc, SpawnVel;

	HitVelMag = VSize( HitVelocity );
	HitVelDir = Normal( HitVelocity );

	SpawnLoc = HitLocation + (HitNormal * 10.f);

	// spawn random lingering fires (rather, projectiles that cause little fires)
	for( i = 0; i < NumResidualFlames; ++i )
	{
		SpawnVel = CalculateResidualFlameVelocity( HitNormal, HitVelDir, HitVelMag );
		SpawnResidualFlame( SpawnLoc, SpawnVel );
	}

	// spawn one where we hit to a flame
	// (we don't give this class a lingering flame because it can hit zeds, and if they die the lingering flame could be left floating)
	SpawnResidualFlame( HitLocation, HitVelocity/3.f );
}

/** Calculates residual flame velocity using */
function vector CalculateResidualFlameVelocity( vector HitNormal, vector HitVelDir, float HitVelMag )
{
	local vector SpawnDir;

	// apply some spread
	SpawnDir = VRandCone( HitVelDir, PI/4 );

	// make HitVelDir parallel to contact surface by subtracting component parallel to HitNormal
	SpawnDir = SpawnDir + (-(SpawnDir dot HitNormal) * HitNormal);

	// apply some more spread to get some of the flames to stick to the wall and others the ground beneath the wall
	// (makes it looks kind of smeared down the wall, like a real molotov)
	SpawnDir = VRandCone( SpawnDir, PI/4 );

	return SpawnDir * (HitVelMag / 3.f);
}

function SpawnResidualFlame( vector SpawnLoc, vector SpawnVel )
{
	local KFProjectile SpawnedProjectile;

	SpawnedProjectile = Spawn( ResidualFlameProjClass, Self,, SpawnLoc );
	if( SpawnedProjectile != none && !SpawnedProjectile.bDeleteMe )
	{
		SpawnedProjectile.Init( Normal(SpawnVel) );
		SpawnedProjectile.Velocity = SpawnVel;
		SpawnedProjectile.Speed = VSize( SpawnedProjectile.Velocity );
	}
}

defaultproperties
{
   ResidualFlameProjClass=Class'kfgamecontent.KFProj_MolotovSplash'
   NumResidualFlames=4
   ThrowAkEvent=AkEvent'WW_WEP_EXP_MOLOTOV.Play_WEP_EXP_Molotov_Throw'
   FuseTime=10.000000
   WeaponSelectTexture=Texture2D'wep_ui_molotov_tex.UI_WeaponSelect_MolotovCocktail'
   TossZ=650.000000
   TerminalVelocity=2000.000000
   ExplosionActorClass=Class'KFGame.KFExplosionActor'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'wep_molotov_arch.Molotov_Explosion'
      Damage=60.000000
      DamageRadius=200.000000
      MyDamageType=Class'kfgamecontent.KFDT_Fire_MolotovGrenade'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExplosionSound=AkEvent'WW_WEP_EXP_MOLOTOV.Play_WEP_EXP_Molotov_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_MolotovGrenade:FlamePointLight'
      ExploLightFadeOutTime=0.200000
      ExploLightStartFadeOutTime=0.400000
      FractureMeshRadius=0.000000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Molotov'
      CamShakeInnerRadius=250.000000
      CamShakeOuterRadius=400.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_MolotovGrenade:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   ProjFlightTemplate=ParticleSystem'WEP_3P_Molotov_EMIT.FX_Molotov_Grenade_Mesh'
   AssociatedPerkClass=Class'KFGame.KFPerk_Firebug'
   Speed=1200.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_Grenade:CollisionCylinder'
      CollisionHeight=10.000000
      CollisionRadius=10.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_Grenade:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Begin Object Class=PointLightComponent Name=FlightPointLight
      Radius=300.000000
      FalloffExponent=10.000000
      Brightness=2.000000
      LightColor=(B=140,G=190,R=245,A=255)
      CastShadows=False
      CastStaticShadows=False
      CastDynamicShadows=False
      LightingChannels=(Outdoor=True)
      Name="FlightPointLight"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   Components(1)=FlightPointLight
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_MolotovGrenade"
   ObjectArchetype=KFProj_Grenade'KFGame.Default__KFProj_Grenade'
}
