/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
/** Container class for LightingChannelContainer, so they can be edited in an editor property window. */
class LightingChannelsObject extends Object
	native
	hidecategories(Object);

/** The edited lighting channels. */
var() const LightingChannelContainer LightingChannels;

defaultproperties
{
   LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
   Name="Default__LightingChannelsObject"
   ObjectArchetype=Object'Core.Default__Object'
}
