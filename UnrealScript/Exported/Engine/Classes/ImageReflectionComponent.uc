/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ImageReflectionComponent extends ActorComponent
	native(Mesh)
	hidecategories(Object)
	deprecated
	editinlinenew;

var() Texture2D ReflectionTexture;

defaultproperties
{
   Name="Default__ImageReflectionComponent"
   ObjectArchetype=ActorComponent'Engine.Default__ActorComponent'
}
