//=============================================================================
// KFGoreJoint_ForeArm
//=============================================================================
// Preset for ForeArm gore joint
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 6/6/2014
//=============================================================================

class KFGoreJoint_ForeArm extends KFGoreJointInfo;

defaultproperties
{
   HitBoneName="LeftForearm"
   BloodTrails(0)=(ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_CH_Blood_Dismemberment_Trail')
   BloodMICParamName(0)="LArmMid"
   Name="Default__KFGoreJoint_ForeArm"
   ObjectArchetype=KFGoreJointInfo'KFGame.Default__KFGoreJointInfo'
}
