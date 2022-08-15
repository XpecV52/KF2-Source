/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryTrigger extends ActorFactory
	config(Editor)
	collapsecategories
	hidecategories(Object)
	native;

defaultproperties
{
   MenuName="Add Trigger"
   NewActorClass=Class'Engine.Trigger'
   bShowInEditorQuickMenu=True
   Name="Default__ActorFactoryTrigger"
   ObjectArchetype=ActorFactory'Engine.Default__ActorFactory'
}
