/**
 * Base class for FViewportClients that are also UObjects
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ScriptViewportClient extends Object
	transient
	native
	Inherits(FViewportClient);

defaultproperties
{
   Name="Default__ScriptViewportClient"
   ObjectArchetype=Object'Core.Default__Object'
}
