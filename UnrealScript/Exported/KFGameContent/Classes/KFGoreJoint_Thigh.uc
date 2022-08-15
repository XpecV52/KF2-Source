//=============================================================================
// KFGoreJoint_Thigh
//=============================================================================
// Preset for Thigh gore joint
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 6/6/2014
//=============================================================================

class KFGoreJoint_Thigh extends KFGoreJointInfo;

defaultproperties
{
   HitBoneName="LeftUpLeg"
   BloodJets(0)=(bAttachToSocket=True,SocketName="Hipsleftsocket",ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_CH_Blood_stream_01')
   BloodTrails(0)=(ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_CH_Blood_Dismemberment_Trail')
   BloodMICParamName(0)="LLegUpper"
   Name="Default__KFGoreJoint_Thigh"
   ObjectArchetype=KFGoreJointInfo'KFGame.Default__KFGoreJointInfo'
}
