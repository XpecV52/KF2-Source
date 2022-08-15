/*******************************************************************************
 * RB_Spring generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class RB_Spring extends ActorComponent
    native(Physics);

var const export editinline PrimitiveComponent Component1;
var const name BoneName1;
var const export editinline PrimitiveComponent Component2;
var const name BoneName2;
var native const int SceneIndex;
var native const bool bInHardware;
/** Allows you to limit the maximum force applied by spring based on MinBodyMass. */
var() bool bEnableForceMassRatio;
var native const Pointer SpringData;
var native const float TimeSinceActivation;
var const float MinBodyMass;
/** Spring extension at which maximum spring force is applied. Force linear ramps up to this point and is constant beyond it. */
var() float SpringSaturateDist;
/** Max linear force applied by spring. Multiplied by SpringMaxForceTimeScale before being passed to simulation. */
var() float SpringMaxForce;
/** If bEnableForceMassRatio is true, this is maximum allowed ratio between MinBodyMass and the applied spring force. */
var() float MaxForceMassRatio;
/**  
 *Allows scaling of spring force over time. Time is zeroed when SetComponents is called,
 *       and this curve is a scaling of SpringMaxForce over time from then (in seconds).
 */
var() InterpCurveFloat SpringMaxForceTimeScale;
/** Linear velocity (along spring direction) at which damping force is maximum. */
var() float DampSaturateVel;
/** Maximum velocity damping force applied between sprung bodies. */
var() float DampMaxForce;

// Export URB_Spring::execSetComponents(FFrame&, void* const)
native function SetComponents(PrimitiveComponent InComponent1, name InBoneName1, Vector Position1, PrimitiveComponent InComponent2, name InBoneName2, Vector Position2);

// Export URB_Spring::execClear(FFrame&, void* const)
native function Clear();

defaultproperties
{
    SpringMaxForceTimeScale=(Points=/* Array type was not detected. */,InVal=0,OutVal=1,ArriveTangent=0,LeaveTangent=0,InterpMode=EInterpCurveMode.CIM_Linear)
    TickGroup=ETickingGroup.TG_PreAsyncWork
}