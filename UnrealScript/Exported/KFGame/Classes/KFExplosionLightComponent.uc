//=============================================================================
// KFExplosionLightComponent
//=============================================================================
// Light that changes its radius, brightness, and color over its lifespan based on user specified points.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Based on UDKExplosionLight Copyright 1998-2012 Epic Games, Inc.
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFExplosionLightComponent extends PointLightComponent
	native(Effect);

var() const	KFExplosionLight Template;

/** used to initialize light properties from TimeShift on spawn so you don't have to update initial values in two places */
var bool bInitialized;

/** Lifetime - how long this explosion has been going */
var transient float Lifetime;

/** Index into TimeShift array */
var transient int TimeShiftIndex;

/** Set Template (Similar to ParticleSystemComponents) */
native final function SetTemplate(KFExplosionLight NewTemplate);
/** Reset light timeline position to start */
native final function ResetLight();

/** called when the light has burnt out */
delegate OnLightFinished(KFExplosionLightComponent Light);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Radius=256.000000
   Brightness=8.000000
   LightColor=(B=255,G=255,R=255,A=255)
   CastShadows=False
   LightingChannels=(Outdoor=True)
   Name="Default__KFExplosionLightComponent"
   ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
}
