//=============================================================================
// KFGoreJoint_Leg
//=============================================================================
// Preset for Leg gore joint
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 6/6/2014
//=============================================================================

class KFGoreJoint_Leg extends KFGoreJointInfo;

defaultproperties
{
   HitBoneName="LeftLeg"
   BloodJets(0)=(ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_CH_Blood_stream_01')
   BloodTrails(0)=(ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_CH_Blood_Dismemberment_Trail')
   BloodMICParamName(0)="LLegMid"
   Name="Default__KFGoreJoint_Leg"
   ObjectArchetype=KFGoreJointInfo'KFGame.Default__KFGoreJointInfo'
}
