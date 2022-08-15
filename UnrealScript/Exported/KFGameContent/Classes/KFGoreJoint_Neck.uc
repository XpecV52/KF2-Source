//=============================================================================
// KFGoreJoint_Neck
//=============================================================================
// Preset for Neck gore joint
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 6/6/2014
//=============================================================================

class KFGoreJoint_Neck extends KFGoreJointInfo;

defaultproperties
{
   HitBoneName="neck"
   BloodJets(0)=(bAttachToSocket=True,SocketName="necksocket",ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_Gore_neck_01')
   BloodTrails(0)=(ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_CH_Blood_Dismemberment_Trail')
   BloodMICParamName(0)="Decap"
   Name="Default__KFGoreJoint_Neck"
   ObjectArchetype=KFGoreJointInfo'KFGame.Default__KFGoreJointInfo'
}
