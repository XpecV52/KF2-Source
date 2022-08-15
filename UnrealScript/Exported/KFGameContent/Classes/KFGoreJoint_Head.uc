//=============================================================================
// KFGoreJoint_Head
//=============================================================================
// Preset for Head gore joint
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 6/6/2014
//=============================================================================

class KFGoreJoint_Head extends KFGoreJointInfo;

defaultproperties
{
   HitBoneName="head"
   BoneShrinkGore(0)=(PartialBreakBones=((BoneName="head",BloodJets=((bAttachToSocket=True,SocketName="necksocket",ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_Gore_neck_01')),BloodMICParamName=("Decap"),ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_HeadExplode_01')),ConstrainToDamageGroups=(DGT_Shotgun),KillingBlowDamageGroups=(DGT_AssaultRifle,DGT_Rifle,DGT_Submachinegun,DGT_Handgun))
   BoneShrinkGore(1)=(PartialBreakBones=((BoneName="Gore_FrontL",BloodJets=((bAttachToSocket=True,SocketName="Gore_FrontLsocket",ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_Gore_chunk_01')),BloodMICParamName=("FaceChunk"),ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_Blood_hit_01_mic'),(BoneName="Gore_FrontR",BloodJets=((bAttachToSocket=True,SocketName="Gore_FrontRsocket",ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_Gore_chunk_01')),BloodMICParamName=("FaceChunk"),ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_Blood_hit_01_mic'),(BoneName="Gore_BackR",BloodJets=((bAttachToSocket=True,SocketName="Gore_BackRsocket",ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_Gore_chunk_01')),BloodMICParamName=("FaceChunk","Decap"),ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_Blood_hit_01_mic'),(BoneName="Gore_BackL",BloodJets=((bAttachToSocket=True,SocketName="Gore_BackLsocket",ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_Gore_chunk_01')),BloodMICParamName=("FaceChunk","Decap"),ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_Blood_hit_01_mic'),(BoneName="gore_jaw",BloodJets=((bAttachToSocket=True,SocketName="Gore_Jawsocket",ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_Gore_Jaw_01')),BloodMICParamName=("FaceChunk","Decap"),ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_Blood_hit_01_mic')),ConstrainToDamageGroups=(DGT_AssaultRifle,DGT_Rifle,DGT_Submachinegun,DGT_Handgun))
   BloodJets(0)=(bAttachToSocket=True,SocketName="necksocket",ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_Gore_neck_01')
   BloodTrails(0)=(ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_CH_Blood_Dismemberment_Trail')
   BloodMICParamName(0)="Decap"
   Name="Default__KFGoreJoint_Head"
   ObjectArchetype=KFGoreJointInfo'KFGame.Default__KFGoreJointInfo'
}
