/**
 * Game resource data stores provide access to available game resources, such as the available gametypes, maps, or mutators
 * The data for each type of game resource is provided through a data provider and is specified in the .ini file for that
 * data provider class type using the PerObjectConfig paradigm.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class UIDataStore_GameResource extends UIDataStore
	native(inherit)
	Config(Game);

struct native GameResourceDataProvider
{
	/** the tag that is used to access this provider, i.e. Players, Teams, etc. */
	var	config		name							ProviderTag;

	/** the name of the class associated with this data provider */
	var	config		string							ProviderClassName;

	/**
	 * indicates that each provider instance should be displayed as an element in the list of tags, rather than
	 * displaying the ProviderTag itself
	 */
	var	config		bool							bExpandProviders;

	/** the UIDataProvider class that exposes the data for this data field tag */
	var	transient	class<UIResourceDataProvider>	ProviderClass;
};

/** the list of data providers supported by this data store that correspond to list element data */
var	config								array<GameResourceDataProvider>		ElementProviderTypes;

/** collection of list element provider instances that are associated with each ElementProviderType */
var	const	private	native	transient	MultiMap_Mirror						ListElementProviders{TMultiMap<FName,class UUIResourceDataProvider*>};

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * Finds the index for the GameResourceDataProvider with a tag matching ProviderTag.
 *
 * @return	the index into the ElementProviderTypes array for the GameResourceDataProvider element that has the
 *			tag specified, or INDEX_NONE if there are no elements of the ElementProviderTypes array that have that tag.
 */
native final function int FindProviderTypeIndex( name ProviderTag ) const;

/**
 * Get the UIResourceDataProvider instances associated with the tag.
 *
 * @param	ProviderTag		the tag to find instances for; should match the ProviderTag value of an element in the ElementProviderTypes array.
 * @param	out_Providers	receives the list of provider instances. this array is always emptied first.
 *
 * @return	the list of UIResourceDataProvider instances registered for ProviderTag.
 */
native final function bool GetResourceProviders( name ProviderTag, out array<UIResourceDataProvider> out_Providers ) const;

defaultproperties
{
   ElementProviderTypes(0)=(ProviderTag="GameTypes",ProviderClassName="KFGame.KFGameInfoSummary")
   ElementProviderTypes(1)=(ProviderTag="Maps",ProviderClassName="KFGame.KFMapSummary")
   ElementProviderTypes(2)=(ProviderTag="Mutators",ProviderClassName="KFGame.KFMutatorSummary")
   Tag="GameResources"
   Name="Default__UIDataStore_GameResource"
   ObjectArchetype=UIDataStore'Engine.Default__UIDataStore'
}
