/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
//=============================================================================
// GenericBrowserType_SoundCue: SoundCues
//=============================================================================

class GenericBrowserType_SoundCue
	extends GenericBrowserType_Sounds
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
	virtual void Init( void );
	
	/**
	 * Invokes a custom menu item command for every selected object
	 * of a supported class.
	 *
	 * @param InCommand		The command to execute
	 * @param InObjects		The objects to invoke the command against
	 */
	virtual void InvokeCustomCommand( INT InCommand, TArray<UObject*>& InObjects);

}


defaultproperties
{
   Description="Sound Cues"
   Name="Default__GenericBrowserType_SoundCue"
   ObjectArchetype=GenericBrowserType_Sounds'UnrealEd.Default__GenericBrowserType_Sounds'
}
