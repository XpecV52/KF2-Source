/*******************************************************************************
 * OnlineContentInterfaceDingo generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class OnlineContentInterfaceDingo extends Object within onlinesubsystemdingo
    native
    implements(OnlineContentInterface);

struct native OnlineSaveGame extends OnlineContent
{
    var init array<init byte> SaveGameData;
    var Engine.OnlineSubsystem.EOnlineEnumerationReadState ReadWriteState;
};

struct native OnlineDownloadableContent extends OnlineContent
{
    var native HatPointer DLCPackage;
    var native QWord LicenseTerminatedTokenKey;
    var native bool bHasEnumeratedContent;
};

struct native OnlineCrossTitleDownloadableContent extends OnlineCrossTitleContent
{
    var native HatPointer DLCPackage;
    var native QWord LicenseTerminatedTokenKey;
    var native bool bHasEnumeratedContent;
};

struct native OnlineContentCache
{
    var native HatPointer UserConnectedStorageSpace;
    var init array<init OnlineSaveGame> SaveGameContent;

    structdefaultproperties
    {
        SaveGameContent=none
    }
};

struct native PerUserOnlineContentDelegates
{
    var array< delegate<OnContentChange> > ContentChangeDelegates;
    var array< delegate<OnReadDownloadableContentComplete> > ReadDLCDelegates;
    var array< delegate<OnReadCrossTitleDownloadableContentComplete> > ReadCrossTitleDLCDelegates;
    var array< delegate<OnReadSaveGameDataComplete> > ReadSaveGameDelegates;
    var array< delegate<OnWriteSaveGameDataComplete> > WriteSaveGameDelegates;
    var array< delegate<OnDeleteSaveGameDataComplete> > DeleteSaveGameDelegates;

    structdefaultproperties
    {
        ContentChangeDelegates=none
        ReadDLCDelegates=none
        ReadCrossTitleDLCDelegates=none
        ReadSaveGameDelegates=none
        WriteSaveGameDelegates=none
        DeleteSaveGameDelegates=none
    }
};

var onlinesubsystemdingo OwningSubsystem;
var native map<0, 0> ContentCache;
var init array<init OnlineDownloadableContent> DLCContent;
var init array<init OnlineCrossTitleDownloadableContent> CrossTitleDLCContent;
var init array<init OnlineCrossTitleContent> CrossTitleContent;
var array< delegate<OnContentChange> > ContentChangeDelegates;
var array< delegate<OnReadCrossTitleContentComplete> > CrossTitleContentChangeDelegates;
var bool bHasEnumeratedCrossTitleContent;
var PerUserOnlineContentDelegates PerUserDelegates[24];
var delegate<OnContentChange> __OnContentChange__Delegate;
var delegate<OnReadDownloadableContentComplete> __OnReadDownloadableContentComplete__Delegate;
var delegate<OnReadCrossTitleDownloadableContentComplete> __OnReadCrossTitleDownloadableContentComplete__Delegate;
var delegate<OnReadCrossTitleSaveGameDataComplete> __OnReadCrossTitleSaveGameDataComplete__Delegate;
var delegate<OnQueryAvailableDownloadsComplete> __OnQueryAvailableDownloadsComplete__Delegate;
var delegate<OnReadSaveGameDataComplete> __OnReadSaveGameDataComplete__Delegate;
var delegate<OnWriteSaveGameDataComplete> __OnWriteSaveGameDataComplete__Delegate;
var delegate<OnDeleteSaveGameDataComplete> __OnDeleteSaveGameDataComplete__Delegate;
var delegate<OnReadContentComplete> __OnReadContentComplete__Delegate;
var delegate<OnReadCrossTitleContentComplete> __OnReadCrossTitleContentComplete__Delegate;

delegate OnContentChange();

function AddContentChangeDelegate(delegate<OnContentChange> ContentDelegate, optional byte LocalUserNum)
{
    LocalUserNum = 255;
    if(LocalUserNum == 255)
    {
        if(ContentChangeDelegates.Find(ContentDelegate == -1)
        {
            ContentChangeDelegates.AddItem(ContentDelegate;
        }        
    }
    else
    {
        if((LocalUserNum >= 0) && LocalUserNum < 24)
        {
            if(PerUserDelegates[LocalUserNum].ContentChangeDelegates.Find(ContentDelegate == -1)
            {
                PerUserDelegates[LocalUserNum].ContentChangeDelegates.AddItem(ContentDelegate;
            }            
        }
        else
        {
            WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to AddContentChangeDelegate()");
        }
    }
}

function ClearContentChangeDelegate(delegate<OnContentChange> ContentDelegate, optional byte LocalUserNum)
{
    LocalUserNum = 255;
    if(LocalUserNum == 255)
    {
        ContentChangeDelegates.RemoveItem(ContentDelegate;        
    }
    else
    {
        if((LocalUserNum >= 0) && LocalUserNum < 24)
        {
            PerUserDelegates[LocalUserNum].ContentChangeDelegates.RemoveItem(ContentDelegate;            
        }
        else
        {
            WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to ClearContentChangeDelegate()");
        }
    }
}

delegate OnReadDownloadableContentComplete(bool bWasSuccessful);

function AddReadDownloadableContentComplete(byte LocalUserNum, delegate<OnReadDownloadableContentComplete> ReadDLCCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        if(PerUserDelegates[LocalUserNum].ReadDLCDelegates.Find(ReadDLCCompleteDelegate == -1)
        {
            PerUserDelegates[LocalUserNum].ReadDLCDelegates.AddItem(ReadDLCCompleteDelegate;
        }        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to AddReadDownloadableContentComplete()");
    }
}

function ClearReadDownloadableContentComplete(byte LocalUserNum, delegate<OnReadDownloadableContentComplete> ReadDLCCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        PerUserDelegates[LocalUserNum].ReadDLCDelegates.RemoveItem(ReadDLCCompleteDelegate;        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to ClearReadDownloadableContentComplete()");
    }
}

// Export UOnlineContentInterfaceDingo::execReadDownloadableContentList(FFrame&, void* const)
native function bool ReadDownloadableContentList(byte LocalUserNum);

// Export UOnlineContentInterfaceDingo::execClearDownloadableContentList(FFrame&, void* const)
native function ClearDownloadableContentList(byte LocalUserNum);

// Export UOnlineContentInterfaceDingo::execGetDownloadableContentList(FFrame&, void* const)
native function Engine.OnlineSubsystem.EOnlineEnumerationReadState GetDownloadableContentList(byte LocalUserNum, out array<OnlineContent> ContentList);

// Export UOnlineContentInterfaceDingo::execReadCrossTitleDownloadableContentList(FFrame&, void* const)
native function bool ReadCrossTitleDownloadableContentList(byte LocalUserNum, optional int TitleId)
{
    TitleId = 0;                
}

// Export UOnlineContentInterfaceDingo::execClearCrossTitleDownloadableContentList(FFrame&, void* const)
native function ClearCrossTitleDownloadableContentList(byte LocalUserNum);

// Export UOnlineContentInterfaceDingo::execGetCrossTitleDownloadableContentList(FFrame&, void* const)
native function Engine.OnlineSubsystem.EOnlineEnumerationReadState GetCrossTitleDownloadableContentList(byte LocalUserNum, out array<OnlineCrossTitleContent> ContentList);

delegate OnReadCrossTitleDownloadableContentComplete(bool bWasSuccessful);

function AddReadCrossTitleDownloadableContentComplete(byte LocalUserNum, delegate<OnReadCrossTitleDownloadableContentComplete> ReadCrossTitleDLCCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        if(PerUserDelegates[LocalUserNum].ReadCrossTitleDLCDelegates.Find(ReadCrossTitleDLCCompleteDelegate == -1)
        {
            PerUserDelegates[LocalUserNum].ReadCrossTitleDLCDelegates.AddItem(ReadCrossTitleDLCCompleteDelegate;
        }        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to AddReadCrossTitleContentCompleteDelegate()");
    }
}

function ClearReadCrossTitleDownloadableContentComplete(byte LocalUserNum, delegate<OnReadCrossTitleDownloadableContentComplete> ReadCrossTitleDLCCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        PerUserDelegates[LocalUserNum].ReadCrossTitleDLCDelegates.RemoveItem(ReadCrossTitleDLCCompleteDelegate;        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to ClearReadCrossTitleContentCompleteDelegate()");
    }
}

function bool ReadCrossTitleSaveGameData(byte LocalUserNum, int DeviceID, int TitleId, string FriendlyName, string Filename, string SaveFileName);

function bool GetCrossTitleSaveGameData(byte LocalUserNum, int DeviceID, int TitleId, string FriendlyName, string Filename, string SaveFileName, out byte bIsValid, out array<byte> SaveGameData);

delegate OnReadCrossTitleSaveGameDataComplete(bool bWasSuccessful, byte LocalUserNum, int DeviceID, int TitleId, string FriendlyName, string Filename, string SaveFileName);

function AddReadCrossTitleSaveGameDataComplete(byte LocalUserNum, delegate<OnReadCrossTitleSaveGameDataComplete> ReadSaveGameDataCompleteDelegate);

function ClearReadCrossTitleSaveGameDataComplete(byte LocalUserNum, delegate<OnReadCrossTitleSaveGameDataComplete> ReadSaveGameDataCompleteDelegate);

function bool ClearCrossTitleSaveGames(byte LocalUserNum);

function bool QueryAvailableDownloads(byte LocalUserNum, optional int CategoryMask)
{
    CategoryMask = -1;
}

delegate OnQueryAvailableDownloadsComplete(bool bWasSuccessful);

function AddQueryAvailableDownloadsComplete(byte LocalUserNum, delegate<OnQueryAvailableDownloadsComplete> QueryDownloadsDelegate);

function ClearQueryAvailableDownloadsComplete(byte LocalUserNum, delegate<OnQueryAvailableDownloadsComplete> QueryDownloadsDelegate);

function GetAvailableDownloadCounts(byte LocalUserNum, out int NewDownloads, out int TotalDownloads);

// Export UOnlineContentInterfaceDingo::execReadSaveGameData(FFrame&, void* const)
native function bool ReadSaveGameData(byte LocalUserNum, int DeviceID, string FriendlyName, string Filename, string SaveFileName);

// Export UOnlineContentInterfaceDingo::execGetSaveGameData(FFrame&, void* const)
native function bool GetSaveGameData(byte LocalUserNum, int DeviceID, string FriendlyName, string Filename, string SaveFileName, out byte bIsValid, out array<byte> SaveGameData);

delegate OnReadSaveGameDataComplete(bool bWasSuccessful, byte LocalUserNum, int DeviceID, string FriendlyName, string Filename, string SaveFileName);

function AddReadSaveGameDataComplete(byte LocalUserNum, delegate<OnReadSaveGameDataComplete> ReadSaveGameDataCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        if(PerUserDelegates[LocalUserNum].ReadSaveGameDelegates.Find(ReadSaveGameDataCompleteDelegate == -1)
        {
            PerUserDelegates[LocalUserNum].ReadSaveGameDelegates.AddItem(ReadSaveGameDataCompleteDelegate;
        }        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to AddReadSaveGameDataComplete()");
    }
}

function ClearReadSaveGameDataComplete(byte LocalUserNum, delegate<OnReadSaveGameDataComplete> ReadSaveGameDataCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        PerUserDelegates[LocalUserNum].ReadSaveGameDelegates.RemoveItem(ReadSaveGameDataCompleteDelegate;        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to ClearReadSaveGameDataComplete()");
    }
}

// Export UOnlineContentInterfaceDingo::execWriteSaveGameData(FFrame&, void* const)
native function bool WriteSaveGameData(byte LocalUserNum, int DeviceID, string FriendlyName, string Filename, string SaveFileName, const out array<byte> SaveGameData);

delegate OnWriteSaveGameDataComplete(bool bWasSuccessful, byte LocalUserNum, int DeviceID, string FriendlyName, string Filename, string SaveFileName);

function AddWriteSaveGameDataComplete(byte LocalUserNum, delegate<OnWriteSaveGameDataComplete> WriteSaveGameDataCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        if(PerUserDelegates[LocalUserNum].WriteSaveGameDelegates.Find(WriteSaveGameDataCompleteDelegate == -1)
        {
            PerUserDelegates[LocalUserNum].WriteSaveGameDelegates.AddItem(WriteSaveGameDataCompleteDelegate;
        }        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to AddWriteSaveGameDataComplete()");
    }
}

function ClearWriteSaveGameDataComplete(byte LocalUserNum, delegate<OnWriteSaveGameDataComplete> WriteSaveGameDataCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        PerUserDelegates[LocalUserNum].WriteSaveGameDelegates.RemoveItem(WriteSaveGameDataCompleteDelegate;        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to ClearWriteSaveGameDataComplete()");
    }
}

// Export UOnlineContentInterfaceDingo::execDeleteSaveGameData(FFrame&, void* const)
native function bool DeleteSaveGameData(byte LocalUserNum, string SaveFileName);

delegate OnDeleteSaveGameDataComplete(bool bWasSuccessful, byte LocalUserNum, string SaveFileName);

function AddDeleteSaveGameDataCompleteDelegate(byte LocalUserNum, delegate<OnDeleteSaveGameDataComplete> DeleteSaveGameDataCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        if(PerUserDelegates[LocalUserNum].DeleteSaveGameDelegates.Find(DeleteSaveGameDataCompleteDelegate == -1)
        {
            PerUserDelegates[LocalUserNum].DeleteSaveGameDelegates.AddItem(DeleteSaveGameDataCompleteDelegate;
        }        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to AddDeleteSaveGameDataComplete()");
    }
}

function ClearDeleteSaveGameDataCompleteDelegate(byte LocalUserNum, delegate<OnDeleteSaveGameDataComplete> DeleteSaveGameDataCompleteDelegate)
{
    if((LocalUserNum >= 0) && LocalUserNum < 24)
    {
        PerUserDelegates[LocalUserNum].DeleteSaveGameDelegates.RemoveItem(DeleteSaveGameDataCompleteDelegate;        
    }
    else
    {
        WarnInternal(("Invalid index (" $ string(LocalUserNum)) $ ") passed to ClearDeleteSaveGameDataComplete()");
    }
}

function bool DeleteSaveGame(byte LocalUserNum, int DeviceID, string FriendlyName, string Filename)
{
    return DeleteSaveGameData(LocalUserNum, Filename);
}

function bool ClearSaveGames(byte LocalUserNum);

// Export UOnlineContentInterfaceDingo::execClearCachedSaveGames(FFrame&, void* const)
native function bool ClearCachedSaveGames(byte LocalUserNum);

delegate OnReadContentComplete(bool bWasSuccessful);

function AddReadContentComplete(byte LocalUserNum, Engine.OnlineSubsystem.EOnlineContentType ContentType, delegate<OnReadContentComplete> ReadContentCompleteDelegate);

function ClearReadContentComplete(byte LocalUserNum, Engine.OnlineSubsystem.EOnlineContentType ContentType, delegate<OnReadContentComplete> ReadContentCompleteDelegate);

function bool ReadContentList(byte LocalUserNum, Engine.OnlineSubsystem.EOnlineContentType ContentType, optional int DeviceID)
{
    DeviceID = -1;
}

function ClearContentList(byte LocalUserNum, Engine.OnlineSubsystem.EOnlineContentType ContentType);

function Engine.OnlineSubsystem.EOnlineEnumerationReadState GetContentList(byte LocalUserNum, Engine.OnlineSubsystem.EOnlineContentType ContentType, out array<OnlineContent> ContentList);

// Export UOnlineContentInterfaceDingo::execReadCrossTitleContentList(FFrame&, void* const)
native function bool ReadCrossTitleContentList(byte LocalUserNum, Engine.OnlineSubsystem.EOnlineContentType ContentType, optional int TitleId, optional int DeviceID)
{
    TitleId = 0;
    DeviceID = -1;                        
}

// Export UOnlineContentInterfaceDingo::execClearCrossTitleContentList(FFrame&, void* const)
native function ClearCrossTitleContentList(byte LocalUserNum, Engine.OnlineSubsystem.EOnlineContentType ContentType);

// Export UOnlineContentInterfaceDingo::execGetCrossTitleContentList(FFrame&, void* const)
native function Engine.OnlineSubsystem.EOnlineEnumerationReadState GetCrossTitleContentList(byte LocalUserNum, Engine.OnlineSubsystem.EOnlineContentType ContentType, out array<OnlineCrossTitleContent> ContentList);

delegate OnReadCrossTitleContentComplete(bool bWasSuccessful);

function AddReadCrossTitleContentCompleteDelegate(byte LocalUserNum, Engine.OnlineSubsystem.EOnlineContentType ContentType, delegate<OnReadCrossTitleContentComplete> ReadContentCompleteDelegate)
{
    if(CrossTitleContentChangeDelegates.Find(ReadContentCompleteDelegate == -1)
    {
        CrossTitleContentChangeDelegates.AddItem(ReadContentCompleteDelegate;
    }
}

function ClearReadCrossTitleContentCompleteDelegate(byte LocalUserNum, Engine.OnlineSubsystem.EOnlineContentType ContentType, delegate<OnReadCrossTitleContentComplete> ReadContentCompleteDelegate)
{
    CrossTitleContentChangeDelegates.RemoveItem(ReadContentCompleteDelegate;
}
