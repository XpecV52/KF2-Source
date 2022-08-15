/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactory extends Object
	native
	collapsecategories
	hidecategories(Object)
	editinlinenew
	config(Editor)
	abstract;

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
// (cpptext)
// (cpptext)
// (cpptext)

/** class to spawn during gameplay; only used if NewActorClass is left at the default */
var class<Actor> GameplayActorClass;

/** Name used as basis for 'New Actor' menu. */
var string			MenuName;

/** Indicates how far up the menu item should be. The higher the number, the higher up the list.*/
var config int		MenuPriority;

/** DEPRECATED - Alternate value for menu priority; Used to allow things like modifier keys to access items in a different order. */
var deprecated int	AlternateMenuPriority;


var string NewActorClassName;





/** Actor subclass this ActorFactory creates. */
var	class<Actor>	NewActorClass;

/** Whether to appear on menu (or this Factory only used through scripts etc.) */
var bool			bPlaceable;

/** Whether to appear in the editor add actor quick menu */
var bool			bShowInEditorQuickMenu;

/** Allows script to modify new actor */
simulated event PostCreateActor(Actor NewActor, optional const SeqAct_ActorFactory ActorFactoryData);

defaultproperties
{
   MenuName="Add Actor"
   MenuPriority=10
   bPlaceable=True
   Name="Default__ActorFactory"
   ObjectArchetype=Object'Core.Default__Object'
}
