//=============================================================================
// KFSkeletalMeshComponent
//=============================================================================
// SMC with FOV settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Based on UDKSkeletalMeshComponent Copyright 1998-2012 Epic Games, Inc.
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFSkeletalMeshComponent extends SkeletalMeshComponent
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** This changes the FOV used for rendering the skeletal mesh component. A value of 0 means to use the default. */
var() const float FOV;

/** whether textures are currently forced loaded */
var		bool		bForceLoadTextures;

/** when to clear forced streaming */
var		float		ClearStreamingTime;

/** 
 * If > 0, ensure the DeltaTime does not go above this value.
 * Useful when issuing tick notifies (e.g. Hitbox collision) is critical
 */
var() float MinTickTimeStep;

/**
  * Force streamed textures to be loaded.  Used to get MIPS streamed in before weapon comes up
  * @PARAM bForcePreload if true causes streamed textures to be force loaded, if false, clears force loading
  */
simulated event PreloadTextures(bool bForcePreload, float ClearTime)
{
	local int idx;

	bForceLoadTextures = bForcePreload;
	ClearStreamingTime = ClearTime;

	for (Idx = 0; Idx < Materials.Length; Idx++)
	{
		if (Materials[Idx] != None)
		{
			Materials[Idx].SetForceMipLevelsToBeResident(true, bForcePreload, -1.0f);
		}
	}
}

/** changes the value of FOV */
native final function SetFOV(float NewFOV);

/** Returns the duration (in seconds) for a named AnimSequence. Returns 0.f if no animation. */
final function float GetAnimInterruptTime(Name AnimSeqName)
{
	return GetAnimNotifyTime(AnimSeqName, class'KFAnimNotify_Interrupt');
}

/** Returns the duration (in seconds) for a named AnimSequence. Returns 0.f if no animation. */
final function float GetReloadAmmoTime(Name AnimSeqName)
{
	return GetAnimNotifyTime(AnimSeqName, class'KFAnimNotify_ReloadAmmo');
}

/** Returns the duration (in seconds) for a named AnimSequence. Returns 0.f if no animation. */
final function float GetAnimNotifyTime(Name AnimSeqName, class<AnimNotify> NotifyClass)
{
	local int i;
	local AnimSequence AnimSeq;

	AnimSeq = FindAnimSequence(AnimSeqName);
	if( AnimSeq == None || AnimSeq.RateScale <= 0.f )
	{
		return 0.f;
	}

	for(i=0; i<AnimSeq.Notifies.length; i++)
	{
		if(ClassIsChildOf(AnimSeq.Notifies[i].Notify.Class, NotifyClass))
		{
			return (AnimSeq.Notifies[i].Time / AnimSeq.RateScale);
		}
	}

	// see SkeletalMeshComponent::GetAnimLength
	return (AnimSeq.SequenceLength / AnimSeq.RateScale);
}

defaultproperties
{
   ReplacementPrimitive=None
   Name="Default__KFSkeletalMeshComponent"
   ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
}
