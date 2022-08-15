/*******************************************************************************
 * SVehicleSimCar generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SVehicleSimCar extends SVehicleSimBase
    native(Physics);

/** Vehicle params */
var() float ChassisTorqueScale;
/** degrees based on velocity */
var() InterpCurveFloat MaxSteerAngleCurve;
/** degrees per second */
var() float SteerSpeed;
/** How much throttle when in reverse */
var() float ReverseThrottle;
/** How much the engine slows down when not applying throttle */
var() float EngineBrakeFactor;
/** Amount of stopping torque applied when applying the brakes */
var() float MaxBrakeTorque;
/** Speed at which the vehicle will stop simulating Internal */
var() float StopThreshold;
var bool bIsDriving;
var float ActualSteering;
var float TimeSinceThrottle;

defaultproperties
{
    ReverseThrottle=-1
}