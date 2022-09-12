//=============================================================================
// KFWeapAttach_GravityImploder
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================

class KFWeapAttach_GravityImploder extends KFWeaponAttachment;



/** Weapons material colors for each fire mode. */
var LinearColor DefaultFireMaterialColor;
var LinearColor AltFireMaterialColor;

simulated event PreBeginPlay()
{
	Super.PreBeginPlay();

	if ( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	if ( WeaponMIC == None && WeapMesh != None )
	{
		WeaponMIC = WeapMesh.CreateAndSetMaterialInstanceConstant(1);
        WeaponMIC.SetVectorParameterValue('Vector_Center_Color_A', DefaultFireMaterialColor);
	}
}

simulated function bool ThirdPersonFireEffects(vector HitLocation, KFPawn P, byte ThirdPersonAnimRateByte )
{
	local LinearColor MatColor;
    if(P.FiringMode == 0) // DEFAULT_FIREMODE
    {
        MatColor = DefaultFireMaterialColor;
    }
    else if (P.FiringMode == 1) // ALTFIRE_FIREMODE
    {
        MatColor = AltFireMaterialColor;
    }

    WeaponMIC.SetVectorParameterValue('Vector_Center_Color_A', MatColor);
    return super.ThirdPersonFireEffects(HitLocation, P, ThirdPersonAnimRateByte);
}

defaultproperties
{
   DefaultFireMaterialColor=(R=0.965000,G=0.297200,B=0.000000,A=1.000000)
   AltFireMaterialColor=(R=0.000000,G=0.963100,B=0.965810,A=1.000000)
   Name="Default__KFWeapAttach_GravityImploder"
   ObjectArchetype=KFWeaponAttachment'KFGame.Default__KFWeaponAttachment'
}
