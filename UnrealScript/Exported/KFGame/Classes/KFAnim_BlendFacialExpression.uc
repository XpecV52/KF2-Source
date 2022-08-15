//=============================================================================
// KFAnim_BlendFacialExpression
//=============================================================================
// Facial expression blend node. Could be modified to extend
// AnimNode_MultiBlendPerBone which would add several features without a
// significant performance cost. For now just use the lightweight version.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFAnim_BlendFacialExpression extends AnimNodeBlendPerBone
	native(Anim);

/** If the LOD of this skeletal mesh is at or above this LOD, then this BlendNode will not be applied. */
var(Performance) int IgnoreAtOrAboveLOD;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   IgnoreAtOrAboveLOD=2
   bForceLocalSpaceBlend=True
   BranchStartBoneName(0)="Center_Lip_Upper"
   BranchStartBoneName(1)="Left_Eyebrow"
   BranchStartBoneName(2)="Right_Eyebrow"
   BranchStartBoneName(3)="Left_Lip_Corner"
   BranchStartBoneName(4)="Right_Lip_Corner"
   BranchStartBoneName(5)="Eyelid_Lower"
   BranchStartBoneName(6)="Eyelid_Upper"
   BranchStartBoneName(7)="Jaw"
   Children(1)=(Name="Face")
   NodeName="Blend Facial Expression"
   Name="Default__KFAnim_BlendFacialExpression"
   ObjectArchetype=AnimNodeBlendPerBone'Engine.Default__AnimNodeBlendPerBone'
}
