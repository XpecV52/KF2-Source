/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SVehicleSimBase extends ActorComponent
	native(Physics);

// Engine Params
/** Maximum torque available to apply to the engine, specified in Nm.*/
var() float EnginePeakTorque;
/** Maximum rotation speed of the engine, specified in radians per second.*/
var() float EngineMaxRPM;

// Wheel params
// For more information, see https://udn.epicgames.com/Three/VehicleGuide

/** In PhysX 3, spring strength of suspension unit, specified in N m^-1. Its default value is 35000.0f */
var()	float				WheelSuspensionStiffness;
/** In PhysX 3, spring damper rate of suspension unit, specified in s^-1. Its default value is 4500.0 */
var()	float				WheelSuspensionDamping;
/** In PhysX 3, maximum compression allowed by suspension spring, specified in m. */
var()	float				WheelSuspensionBias;

var()	float				WheelLongExtremumSlip;
var()	float				WheelLongExtremumValue;
var()	float				WheelLongAsymptoteSlip;
var()	float				WheelLongAsymptoteValue;

var()	float				WheelLatExtremumSlip;
var()	float				WheelLatExtremumValue;
var()	float				WheelLatAsymptoteSlip;
var()	float				WheelLatAsymptoteValue;

/** In PhysX 3.2, this is WheelMass */
var()	float				WheelInertia;

var()   bool                bWheelSpeedOverride; // Allows you to set the axle speed directly

/** Friction model that clamps the frictional force applied by the wheels. Should be more realistic. */
var()	bool				bClampedFrictionModel;

var()	bool				bAutoDrive;
var()	float				AutoDriveSteer;

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

defaultproperties
{
   EnginePeakTorque=1000.000000
   EngineMaxRPM=600.000000
   WheelLongExtremumSlip=0.100000
   WheelLongExtremumValue=1.000000
   WheelLongAsymptoteSlip=2.000000
   WheelLongAsymptoteValue=0.600000
   WheelLatExtremumSlip=0.350000
   WheelLatExtremumValue=0.850000
   WheelLatAsymptoteSlip=1.400000
   WheelLatAsymptoteValue=0.700000
   WheelInertia=20.000000
   Name="Default__SVehicleSimBase"
   ObjectArchetype=ActorComponent'Engine.Default__ActorComponent'
}
