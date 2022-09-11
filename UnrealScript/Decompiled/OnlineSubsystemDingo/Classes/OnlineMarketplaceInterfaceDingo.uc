/*******************************************************************************
 * OnlineMarketplaceInterfaceDingo generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class OnlineMarketplaceInterfaceDingo extends Object within onlinesubsystemdingo
    native
    implements(OnlineMarketplaceInterface);

struct native PerUserMarketplaceDelegates
{
    var array< delegate<OnReadAvailableProductsComplete> > AvailableProductReadDelegates;
    var array< delegate<OnReadAdditionalProductDetailsComplete> > AdditionalProductDetailsReadDelegates;
    var array< delegate<OnReadInventoryItemsComplete> > InventoryItemReadDelegates;
    var array< delegate<OnConsumeInventoryItemComplete> > ConsumeInventoryItemDelegates;

    structdefaultproperties
    {
        AvailableProductReadDelegates=none
        AdditionalProductDetailsReadDelegates=none
        InventoryItemReadDelegates=none
        ConsumeInventoryItemDelegates=none
    }
};

struct native CachedMarketplaceProducts
{
    var init array<init MarketplaceProductDetails> Products;
    var Engine.OnlineSubsystem.EOnlineEnumerationReadState ReadState;

    structdefaultproperties
    {
        Products=none
        ReadState=EOnlineEnumerationReadState.OERS_NotStarted
    }
};

struct native UserMarketplaceCache
{
    var CachedMarketplaceProducts ProductCaches[EMediaItemType];

    structdefaultproperties
    {
        ProductCaches[0]=(Products=none,ReadState=EOnlineEnumerationReadState.OERS_NotStarted)
        ProductCaches[1]=(Products=none,ReadState=EOnlineEnumerationReadState.OERS_NotStarted)
        ProductCaches[2]=(Products=none,ReadState=EOnlineEnumerationReadState.OERS_NotStarted)
        ProductCaches[3]=(Products=none,ReadState=EOnlineEnumerationReadState.OERS_NotStarted)
        ProductCaches[4]=(Products=none,ReadState=EOnlineEnumerationReadState.OERS_NotStarted)
        ProductCaches[5]=(Products=none,ReadState=EOnlineEnumerationReadState.OERS_NotStarted)
        ProductCaches[6]=(Products=none,ReadState=EOnlineEnumerationReadState.OERS_NotStarted)
    }
};

struct native CachedInventoryItems
{
    var init array<init MarketplaceInventoryItem> Items;
    var native Pointer PlatformItems;
    var Engine.OnlineSubsystem.EOnlineEnumerationReadState ReadState;

    structdefaultproperties
    {
        Items=none
        ReadState=EOnlineEnumerationReadState.OERS_NotStarted
    }
};

struct native UserInventoryCache
{
    var CachedInventoryItems InventoryCaches[EMediaItemType];

    structdefaultproperties
    {
        InventoryCaches[0]=(Items=none,ReadState=EOnlineEnumerationReadState.OERS_NotStarted)
        InventoryCaches[1]=(Items=none,ReadState=EOnlineEnumerationReadState.OERS_NotStarted)
        InventoryCaches[2]=(Items=none,ReadState=EOnlineEnumerationReadState.OERS_NotStarted)
        InventoryCaches[3]=(Items=none,ReadState=EOnlineEnumerationReadState.OERS_NotStarted)
        InventoryCaches[4]=(Items=none,ReadState=EOnlineEnumerationReadState.OERS_NotStarted)
        InventoryCaches[5]=(Items=none,ReadState=EOnlineEnumerationReadState.OERS_NotStarted)
        InventoryCaches[6]=(Items=none,ReadState=EOnlineEnumerationReadState.OERS_NotStarted)
    }
};

var onlinesubsystemdingo OwningSubsystem;
var PerUserMarketplaceDelegates PerUserDelegates[24];
var native map<0, 0> MarketplaceProductsCache;
var native map<0, 0> InventoryItemsCache;
var array< delegate<OnMarketplaceItemPurchased> > OnMarketplaceItemPurchasedDelegates;
var int ConsumablesCount;
var int DurablesCount;
var delegate<OnReadAvailableProductsComplete> __OnReadAvailableProductsComplete__Delegate;
var delegate<OnReadAdditionalProductDetailsComplete> __OnReadAdditionalProductDetailsComplete__Delegate;
var delegate<OnReadInventoryItemsComplete> __OnReadInventoryItemsComplete__Delegate;
var delegate<OnConsumeInventoryItemComplete> __OnConsumeInventoryItemComplete__Delegate;
var delegate<OnMarketplaceItemPurchased> __OnMarketplaceItemPurchased__Delegate;

// Export UOnlineMarketplaceInterfaceDingo::execReadAvailableProducts(FFrame&, void* const)
native function bool ReadAvailableProducts(byte LocalUserNum, string ParentId, optional Engine.OnlineSubsystem.EMediaItemType ParentMediaType, optional Engine.OnlineSubsystem.EMediaItemType ChildMediaType, optional Engine.OnlineSubsystem.ECatalogSortOrder SortOrder)
{
    ParentMediaType = 1;
    ChildMediaType = 1;
    SortOrder = 0;                            
}

delegate OnReadAvailableProductsComplete(Engine.OnlineSubsystem.EMediaItemType MediaType);

function AddReadAvailableProductsCompleteDelegate(byte LocalUserNum, delegate<OnReadAvailableProductsComplete> ReadAvailableProductsCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        if(PerUserDelegates[LocalUserNum].AvailableProductReadDelegates.Find(ReadAvailableProductsCompleteDelegate == -1)
        {
            PerUserDelegates[LocalUserNum].AvailableProductReadDelegates.AddItem(ReadAvailableProductsCompleteDelegate;
        }        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to AddReadAvailableProductsCompleteDelegate()");
    }
}

function ClearReadAvailableProductsCompleteDelegate(byte LocalUserNum, delegate<OnReadAvailableProductsComplete> ReadAvailableProductsCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        PerUserDelegates[LocalUserNum].AvailableProductReadDelegates.RemoveItem(ReadAvailableProductsCompleteDelegate;        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to ClearReadAvailableProductsCompleteDelegate()");
    }
}

// Export UOnlineMarketplaceInterfaceDingo::execGetAvailableProducts(FFrame&, void* const)
native function Engine.OnlineSubsystem.EOnlineEnumerationReadState GetAvailableProducts(byte LocalUserNum, Engine.OnlineSubsystem.EMediaItemType MediaType, out array<MarketplaceProductDetails> AvailableProducts);

// Export UOnlineMarketplaceInterfaceDingo::execResetAvailableProducts(FFrame&, void* const)
native function ResetAvailableProducts(byte LocalUserNum, Engine.OnlineSubsystem.EMediaItemType MediaType);

// Export UOnlineMarketplaceInterfaceDingo::execReadAdditionalDetailsForProducts(FFrame&, void* const)
native function bool ReadAdditionalDetailsForProducts(byte LocalUserNum, Engine.OnlineSubsystem.EMediaItemType MediaType);

delegate OnReadAdditionalProductDetailsComplete(Engine.OnlineSubsystem.EMediaItemType MediaType);

function AddReadAdditionalProductDetailsCompleteDelegate(byte LocalUserNum, delegate<OnReadAdditionalProductDetailsComplete> ReadAdditionalProductDetailsCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        if(PerUserDelegates[LocalUserNum].AdditionalProductDetailsReadDelegates.Find(ReadAdditionalProductDetailsCompleteDelegate == -1)
        {
            PerUserDelegates[LocalUserNum].AdditionalProductDetailsReadDelegates.AddItem(ReadAdditionalProductDetailsCompleteDelegate;
        }        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to AddReadAdditionalProductDetailsCompleteDelegate()");
    }
}

function ClearReadAdditionalProductDetailsCompleteDelegate(byte LocalUserNum, delegate<OnReadAdditionalProductDetailsComplete> ReadAdditionalProductDetailCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        PerUserDelegates[LocalUserNum].AdditionalProductDetailsReadDelegates.RemoveItem(ReadAdditionalProductDetailCompleteDelegate;        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to ClearReadAdditionalProductDetailsCompleteDelegate()");
    }
}

// Export UOnlineMarketplaceInterfaceDingo::execReadInventoryItems(FFrame&, void* const)
native function bool ReadInventoryItems(byte LocalUserNum, optional Engine.OnlineSubsystem.EMediaItemType MediaType)
{
    MediaType = 4;                
}

delegate OnReadInventoryItemsComplete(Engine.OnlineSubsystem.EMediaItemType MediaType);

function AddReadInventoryItemsCompleteDelegate(byte LocalUserNum, delegate<OnReadInventoryItemsComplete> ReadInventoryItemsCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        if(PerUserDelegates[LocalUserNum].InventoryItemReadDelegates.Find(ReadInventoryItemsCompleteDelegate == -1)
        {
            PerUserDelegates[LocalUserNum].InventoryItemReadDelegates.AddItem(ReadInventoryItemsCompleteDelegate;
        }        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to AddReadInventoryItemsCompleteDelegate()");
    }
}

function ClearReadInventoryItemsCompleteDelegate(byte LocalUserNum, delegate<OnReadInventoryItemsComplete> ReadInventoryItemsCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        PerUserDelegates[LocalUserNum].InventoryItemReadDelegates.RemoveItem(ReadInventoryItemsCompleteDelegate;        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to ClearReadInventoryItemsCompleteDelegate()");
    }
}

// Export UOnlineMarketplaceInterfaceDingo::execGetInventoryItems(FFrame&, void* const)
native function Engine.OnlineSubsystem.EOnlineEnumerationReadState GetInventoryItems(byte LocalUserNum, Engine.OnlineSubsystem.EMediaItemType MediaType, out array<MarketplaceInventoryItem> InventoryItems);

// Export UOnlineMarketplaceInterfaceDingo::execResetInventoryItems(FFrame&, void* const)
native function ResetInventoryItems(byte LocalUserNum, Engine.OnlineSubsystem.EMediaItemType MediaType);

// Export UOnlineMarketplaceInterfaceDingo::execConsumeInventoryItem(FFrame&, void* const)
native function bool ConsumeInventoryItem(byte LocalUserNum, string ProductID, int Quantity, string TransactionId);

delegate OnConsumeInventoryItemComplete(string ProductID, bool bDidSucceed, int NewQuantity);

function AddConsumeInventoryItemCompleteDelegate(byte LocalUserNum, delegate<OnConsumeInventoryItemComplete> ConsumeInventoryItemCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        if(PerUserDelegates[LocalUserNum].ConsumeInventoryItemDelegates.Find(ConsumeInventoryItemCompleteDelegate == -1)
        {
            PerUserDelegates[LocalUserNum].ConsumeInventoryItemDelegates.AddItem(ConsumeInventoryItemCompleteDelegate;
        }        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to AddConsumeInventoryItemCompleteDelegate()");
    }
}

function ClearConsumeInventoryItemCompleteDelegate(byte LocalUserNum, delegate<OnConsumeInventoryItemComplete> ConsumeInventoryItemCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        PerUserDelegates[LocalUserNum].ConsumeInventoryItemDelegates.RemoveItem(ConsumeInventoryItemCompleteDelegate;        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to ClearConsumeInventoryItemCompleteDelegate()");
    }
}

delegate OnMarketplaceItemPurchased();

function AddMarketplaceItemPurchasedDelegate(delegate<OnMarketplaceItemPurchased> InDelegate)
{
    if(OnMarketplaceItemPurchasedDelegates.Find(InDelegate == -1)
    {
        OnMarketplaceItemPurchasedDelegates.AddItem(InDelegate;
    }
}

function ClearMarketplaceItemPurchasedDelegate(delegate<OnMarketplaceItemPurchased> InDelegate)
{
    OnMarketplaceItemPurchasedDelegates.RemoveItem(InDelegate;
}

defaultproperties
{
    ConsumablesCount=80
    DurablesCount=49
}