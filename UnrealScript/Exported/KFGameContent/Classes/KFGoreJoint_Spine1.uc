//=============================================================================
// KFGoreJoint_Spine1
//=============================================================================
// Preset for Spine1 gore joint
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 6/6/2014
//=============================================================================

class KFGoreJoint_Spine1 extends KFGoreJointInfo;

defaultproperties
{
   HitBoneName="Spine1"
   BoneShrinkGore(0)=(PartialBreakBones=((BoneName="Gore_Abdomen",BloodMICParamName=("abdomen"))),ConstrainToDamageGroups=(DGT_Shotgun))
   HitExplosionGore(0)=(BreakBones=((BoneName="LeftShoulder",BloodTrails=((ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_CH_Blood_Dismemberment_Trail')),BloodMICParamName=("VerticleSlice")),(BoneName="Gore_Abdomen",BloodTrails=((ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_CH_Blood_Dismemberment_Trail')),BloodMICParamName=("abdomen"))),ConstrainToDamageGroups=(DGT_Shotgun,DGT_Explosive))
   DependentBreakGore(0)=(DependentBones=((BoneName="Gore_Abdomen",BloodTrails=((ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_CH_Blood_Dismemberment_Trail')),BloodMICParamName=("abdomen"))),ConstrainToDamageGroups=(DGT_MeleeSlash))
   BloodJets(0)=(ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_Spine_Jet_01')
   BloodTrails(0)=(ParticleSystemTemplate=ParticleSystem'FX_Gore_EMIT.FX_CH_Blood_Dismemberment_Trail')
   BloodMICParamName(0)="abdomen"
   Name="Default__KFGoreJoint_Spine1"
   ObjectArchetype=KFGoreJointInfo'KFGame.Default__KFGoreJointInfo'
}
