/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
//=============================================================================
// GenericBrowserType_SoundMode: Sound modes
//=============================================================================

class GenericBrowserType_SoundMode
	extends GenericBrowserType_Sounds
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
	

cpptext
{
	virtual void Init();
	virtual UBOOL NotifyPreDeleteObject( UObject* ObjectToDelete );
	virtual void NotifyPostDeleteObject();

}


defaultproperties
{
   Description="Sound Modes"
   Name="Default__GenericBrowserType_SoundMode"
   ObjectArchetype=GenericBrowserType_Sounds'UnrealEd.Default__GenericBrowserType_Sounds'
}
