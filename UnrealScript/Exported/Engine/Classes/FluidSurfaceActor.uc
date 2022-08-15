/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class FluidSurfaceActor extends Actor
	dependson(FluidSurfaceComponent)
	native(Fluid)
	AutoExpandCategories(FluidSurfaceActor,FluidSurfaceComponent)
	ClassGroup(Fluid)
	placeable;

var() editconst const FluidSurfaceComponent FluidComponent;

/** Particle effect to play when projectile hits water */
var() ParticleSystem ProjectileEntryEffect;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)



simulated event TakeDamage(int Damage, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	// call Actor's version to handle any SeqEvent_TakeDamage for scripting
	Super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);

	FluidComponent.ApplyForce( HitLocation, FluidComponent.ForceImpact, FluidComponent.TestRippleRadius, True );
}

simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	Super.Touch( Other, OtherComp, HitLocation, HitNormal );

	Other.ApplyFluidSurfaceImpact(self, HitLocation);
}

defaultproperties
{
   Begin Object Class=FluidSurfaceComponent Name=NewFluidComponent
      ReplacementPrimitive=None
      Name="NewFluidComponent"
      ObjectArchetype=FluidSurfaceComponent'Engine.Default__FluidSurfaceComponent'
   End Object
   FluidComponent=NewFluidComponent
   Components(0)=NewFluidComponent
   CollisionType=COLLIDE_CustomDefault
   bNoDelete=True
   bMovable=False
   bCollideActors=True
   bProjTarget=True
   Name="Default__FluidSurfaceActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
