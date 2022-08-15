//=============================================================================
// WorldAttractor.
//
// WorldAttractor is a placeable generic attractor.
//
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class WorldAttractor extends Actor
	native(Physics)
	hidecategories(Lighting,LightColor,Force)
	placeable;

/**
 *  TRUE if this attractor has any effect.
 */
var() bool bEnabled;

/**
 *  The duration in seconds to loop over the values in the distributions below.
 */
var() float LoopDuration;

/**
 *  The current time through the loop.
 */
var float CurrentTime;

/**
 *  Falloff type enumeration.
 */
enum EWorldAttractorFalloffType
{
	FOFF_Constant,
	FOFF_Linear,
	FOFF_Exponent
};

/**
 *  Type of falloff.
 *
 *  FOFF_Constant - Falloff is constant so just use the strength for the whole range.
 *  FOFF_Linear - Linear falloff over the range.
 *  FOFF_ExponentExponential falloff over the range.
 */
var() EWorldAttractorFalloffType FalloffType;

/**
 *  Optional falloff exponent for FOFF_Exponent type.
 */
var() interp matineerawdistributionfloat FalloffExponent;

/**
 *  Range of the attractor.
 */
var() interp matineerawdistributionfloat Range;

/**
 *  Strength of the attraction over time.
 */
var() interp matineerawdistributionfloat Strength;

/**
 *  Radius bounding the attraction point for use with collisions.
 */
var() interp float CollisionRadius;

/**
 *  Drag coefficient, a value of 1.0f means no drag, a value > 1.0f means accelerate.
 *  This value is multiplied with the DragCoefficient value in the attractor to get the
 *  resultant drag coefficient and generate the drag force.
 */
var() interp matineerawdistributionfloat DragCoefficient;

/**
 *  Apply the drag when the particle is within this radius.
 */
var() interp matineerawdistributionfloat DragRadius;

struct native WorldAttractorData
{
	var bool bEnabled;
	var vector Location;
	var EWorldAttractorFalloffType FalloffType;
	var float FalloffExponent;
	var float Range;
	var float Strength;
};

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

function OnSetWorldAttractorParam(SeqAct_SetWorldAttractorParam Action)
{
	if(Action.bEnabledField)
	{
		bEnabled = Action.bEnabled;
	}
	if(Action.bFalloffTypeField)
	{
		FalloffType = Action.FalloffType;
	}
	if(Action.bRangeField)
	{
		Range = Action.Range;
	}
	if(Action.bStrengthField)
	{
		Strength = Action.Strength;
	}
}

defaultproperties
{
   bEnabled=True
   FalloffExponent=(Distribution=DistributionFalloffExponent)
   Range=(Distribution=DistributionRange)
   Strength=(Distribution=DistributionStrength)
   DragCoefficient=(Distribution=DistributionDragCoefficient)
   DragRadius=(Distribution=DistributionDragRadius)
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_Pickup'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   CollisionType=COLLIDE_CustomDefault
   Name="Default__WorldAttractor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
