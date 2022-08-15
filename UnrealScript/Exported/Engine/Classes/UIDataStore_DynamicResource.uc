/**
 * This data store can be used for cases where both static and dynamic information about a particular game concept must be displayed together.
 * For example, this data store could be used to display a list of levels which have been unlocked by the player.  The information about the
 * levels themselves would probably be exposed by a UIResourceDataProvider, but resource data providers cannot provide data about the player's
 * progress since they are static by nature.  The player's progress must come from something like a profile data provider that can provide
 * information about which of the levels have been unlocked.  This data store brings these two types of information together in order to
 * provide a combination of static and dynamic information about a game resource from a single location.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class UIDataStore_DynamicResource extends UIDataStore
	native(UIPrivate)
	config(Game);

/** Provides access to the player's profile data */
var transient	UIDataProvider_OnlineProfileSettings	ProfileProvider;
var	transient	UIDataStore_GameResource				GameResourceDataStore;


struct native DynamicResourceProviderDefinition
{
	/**
	 * the tag that is used to access this provider, i.e. Players, Teams, etc.; should be the same value as the ProviderTag for the
	 * static resource this provider type is associated with.
	 */
	var	config		name									ProviderTag;

	/** the name of the class associated with this data provider */
	var	config		string									ProviderClassName;

	/** the UIDataProvider class that exposes the data for this data field tag */
	var	transient	class<UIResourceCombinationProvider>	ProviderClass;
};

/** the list of data providers supported by this data store that correspond to list element data */
var	config								array<DynamicResourceProviderDefinition>		ResourceProviderDefinitions;

/** collection of list element provider instances that are associated with each ElementProviderType */
var	const	private	native	transient	MultiMap_Mirror									ResourceProviders{TMultiMap<FName,class UUIResourceCombinationProvider*>};

/*
- init the profile provider ref
- init the game resource ds ref
- create all resource providers
- initialize all resource providers
- implement all methods, just like game resource ds
*/

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
native final function bool GetResourceProviders( name ProviderTag, out array<UIResourceCombinationProvider> out_Providers ) const;

/**
 * Re-initializes all dynamic providers.
 *
 * @param LocalUserNum the player that had a login change
 */
native final function OnLoginChange(byte LocalUserNum);

/**
 * Called when this data store is added to the data store manager's list of active data stores.
 *
 * @param	PlayerOwner		the player that will be associated with this DataStore.  Only relevant if this data store is
 *							associated with a particular player; NULL if this is a global data store.
 */
event Registered( LocalPlayer PlayerOwner )
{
	local OnlineSubsystem OnlineSub;
	local OnlinePlayerInterface PlayerInterface;
	local UIDataStore_OnlinePlayerData PlayerProfileDS;

	Super.Registered(PlayerOwner);

	PlayerProfileDS = UIDataStore_OnlinePlayerData(class'UIRoot'.static.StaticResolveDataStore(class'UIDataStore_OnlinePlayerData'.default.Tag, PlayerOwner));
	if ( PlayerProfileDS != None )
	{
		ProfileProvider = PlayerProfileDS.ProfileProvider;
	}

	GameResourceDataStore = UIDataStore_GameResource(class'UIRoot'.static.StaticResolveDataStore(class'UIDataStore_GameResource'.default.Tag, PlayerOwner));

	// Figure out if we have an online subsystem registered
	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
	if (OnlineSub != None)
	{
		// Grab the player interface to verify the subsystem supports it
		PlayerInterface = OnlineSub.PlayerInterface;
		if (PlayerInterface != None)
		{
			// We need to know when the player's login changes
			PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
		}
	}
}

/**
 * Called when this data store is removed from the data store manager's list of active data stores.
 *
 * @param	PlayerOwner		the player that will be associated with this DataStore.  Only relevant if this data store is
 *							associated with a particular player; NULL if this is a global data store.
 */
event Unregistered( LocalPlayer PlayerOwner )
{
	local int TypeIndex, ProviderIndex;
	local array<UIResourceCombinationProvider> ProviderInstances;
	local OnlineSubsystem OnlineSub;
	local OnlinePlayerInterface PlayerInterface;

	Super.Unregistered(PlayerOwner);

/*	if ( ProfileProvider.Player == PlayerOwner || ProfileProvider.Player == None )
	{
		ProfileProvider = None;
	}*/

	GameResourceDataStore = None;

	// now tell all our providers to clear their profile reference as well....
	for ( TypeIndex = 0; TypeIndex < ResourceProviderDefinitions.Length; TypeIndex++ )
	{
		if ( GetResourceProviders(ResourceProviderDefinitions[TypeIndex].ProviderTag, ProviderInstances) )
		{
			for ( ProviderIndex = 0; ProviderIndex < ProviderInstances.Length; ProviderIndex++ )
			{
				ProviderInstances[ProviderIndex].ClearProviderReferences();
			}
		}
	}

	// Figure out if we have an online subsystem registered
	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
	if (OnlineSub != None)
	{
		// Grab the player interface to verify the subsystem supports it
		PlayerInterface = OnlineSub.PlayerInterface;
		if (PlayerInterface != None)
		{
			// Clear our delegate
			PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
		}
	}
}

defaultproperties
{
   Tag="DynamicGameResource"
   Name="Default__UIDataStore_DynamicResource"
   ObjectArchetype=UIDataStore'Engine.Default__UIDataStore'
}
