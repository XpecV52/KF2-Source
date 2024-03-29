/*******************************************************************************
 * KFWeapAttach_GravityImploder generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeapAttach_GravityImploder extends KFWeaponAttachment
    hidecategories(Navigation,Object,Movement,Attachment,Collision,Physics,Advanced,Debug,Mobile);

var LinearColor DefaultFireMaterialColor;
var LinearColor AltFireMaterialColor;

simulated event PreBeginPlay()
{
    super.PreBeginPlay();
    if(WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    if((WeaponMIC == none) && WeapMesh != none)
    {
        WeaponMIC = WeapMesh.CreateAndSetMaterialInstanceConstant(1);
        WeaponMIC.SetVectorParameterValue('Vector_Center_Color_A', DefaultFireMaterialColor);
    }
}

simulated function bool ThirdPersonFireEffects(Vector HitLocation, KFPawn P, byte ThirdPersonAnimRateByte)
{
    local LinearColor MatColor;

    if(P.FiringMode == 0)
    {
        MatColor = DefaultFireMaterialColor;        
    }
    else
    {
        if(P.FiringMode == 1)
        {
            MatColor = AltFireMaterialColor;
        }
    }
    WeaponMIC.SetVectorParameterValue('Vector_Center_Color_A', MatColor);
    return super.ThirdPersonFireEffects(HitLocation, P, ThirdPersonAnimRateByte);
}

defaultproperties
{
    DefaultFireMaterialColor=(R=0.965,G=0.2972,B=0,A=1)
    AltFireMaterialColor=(R=0,G=0.9631,B=0.96581,A=1)
    begin object name=SkeletalMeshComponent0 class=SkeletalMeshComponent
        Animations=AnimNodeSequence'Default__KFWeapAttach_GravityImploder.SkeletalMeshComponent0.MeshSequenceA'
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFWeapAttach_GravityImploder.SkeletalMeshComponent0'
    WeapMesh=SkeletalMeshComponent0
}