/*******************************************************************************
 * UIDataStore_DynamicResource generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UIDataStore_DynamicResource extends UIDataStore
    transient
    native(UIPrivate)
    config(Game)
    hidecategories(Object,UIRoot);

struct native DynamicResourceProviderDefinition
{
    var config name ProviderTag;
    var config string ProviderClassName;
    var transient class<UIResourceCombinationProvider> ProviderClass;

    structdefaultproperties
    {
        ProviderTag=None
        ProviderClassName=""
        ProviderClass=none
    }
};

var transient UIDataProvider_OnlineProfileSettings ProfileProvider;
var transient UIDataStore_GameResource GameResourceDataStore;
var config array<config DynamicResourceProviderDefinition> ResourceProviderDefinitions;
var private native const transient MultiMap_Mirror ResourceProviders;

// Export UUIDataStore_DynamicResource::execFindProviderTypeIndex(FFrame&, void* const)
native final function int FindProviderTypeIndex(name ProviderTag);

// Export UUIDataStore_DynamicResource::execGetResourceProviders(FFrame&, void* const)
native final function bool GetResourceProviders(name ProviderTag, out array<UIResourceCombinationProvider> out_Providers);

// Export UUIDataStore_DynamicResource::execOnLoginChange(FFrame&, void* const)
native final function OnLoginChange(byte LocalUserNum);

event Registered(LocalPlayer PlayerOwner)
{
    local OnlineSubsystem OnlineSub;
    local OnlinePlayerInterface PlayerInterface;
    local UIDataStore_OnlinePlayerData PlayerProfileDS;

    super.Registered(PlayerOwner);
    PlayerProfileDS = UIDataStore_OnlinePlayerData(Class'UIRoot'.static.StaticResolveDataStore(Class'UIDataStore_OnlinePlayerData'.default.Tag, PlayerOwner));
    if(PlayerProfileDS != none)
    {
        ProfileProvider = PlayerProfileDS.ProfileProvider;
    }
    GameResourceDataStore = UIDataStore_GameResource(Class'UIRoot'.static.StaticResolveDataStore(Class'UIDataStore_GameResource'.default.Tag, PlayerOwner));
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        if(NotEqual_InterfaceInterface(PlayerInterface, (none)))
        {
            PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
        }
    }
}

event Unregistered(LocalPlayer PlayerOwner)
{
    local int TypeIndex, ProviderIndex;
    local array<UIResourceCombinationProvider> ProviderInstances;
    local OnlineSubsystem OnlineSub;
    local OnlinePlayerInterface PlayerInterface;

    super.Unregistered(PlayerOwner);
    GameResourceDataStore = none;
    TypeIndex = 0;
    J0x29:

    if(TypeIndex < ResourceProviderDefinitions.Length)
    {
        if(GetResourceProviders(ResourceProviderDefinitions[TypeIndex].ProviderTag, ProviderInstances))
        {
            ProviderIndex = 0;
            J0x88:

            if(ProviderIndex < ProviderInstances.Length)
            {
                ProviderInstances[ProviderIndex].ClearProviderReferences();
                ++ ProviderIndex;
                goto J0x88;
            }
        }
        ++ TypeIndex;
        goto J0x29;
    }
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        if(NotEqual_InterfaceInterface(PlayerInterface, (none)))
        {
            PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
        }
    }
}

defaultproperties
{
    Tag=DynamicGameResource
}