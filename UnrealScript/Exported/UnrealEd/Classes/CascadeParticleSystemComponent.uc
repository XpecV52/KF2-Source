/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

// Used to provide an extended PSysComponent to allow collision to function in the preview window.
class CascadeParticleSystemComponent extends ParticleSystemComponent
	native(Cascade)
	hidecategories(Object)
	hidecategories(Physics)
	hidecategories(Collision)
	editinlinenew;

var		native		const	pointer									CascadePreviewViewportPtr{class FCascadePreviewViewportClient};

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	// Collision Handling...
	virtual UBOOL SingleLineCheck(FCheckResult& Hit, AActor* SourceActor, const FVector& End, const FVector& Start, DWORD TraceFlags, const FVector& Extent);

protected:
	virtual void UpdateLODInformation();

}


defaultproperties
{
   ReplacementPrimitive=None
   Name="Default__CascadeParticleSystemComponent"
   ObjectArchetype=ParticleSystemComponent'Engine.Default__ParticleSystemComponent'
}
