/*******************************************************************************
 * OnlineTitleFileInterfaceDingo generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class OnlineTitleFileInterfaceDingo extends Object within onlinesubsystemdingo
    native
    implements(OnlineTitleFileInterface);

struct native TitleFileDingo extends TitleFile
{
    var int FileSize;
};

var onlinesubsystemdingo OwningSubsystem;
var array< delegate<OnReadTitleFileComplete> > ReadTitleFileCompleteDelegates;
var array< delegate<OnRequestTitleFileListComplete> > RequestTitleFileListCompleteDelegates;
var array<TitleFileDingo> TitleManagedFiles;
var delegate<OnReadTitleFileComplete> __OnReadTitleFileComplete__Delegate;
var delegate<OnRequestTitleFileListComplete> __OnRequestTitleFileListComplete__Delegate;

delegate OnReadTitleFileComplete(bool bWasSuccessful, string Filename);

// Export UOnlineTitleFileInterfaceDingo::execReadTitleFile(FFrame&, void* const)
native function bool ReadTitleFile(string FileToRead, optional Engine.OnlineSubsystem.EOnlineFileType FileType)
{
    FileType = 1;                
}

function AddReadTitleFileCompleteDelegate(delegate<OnReadTitleFileComplete> ReadTitleFileCompleteDelegate)
{
    if(ReadTitleFileCompleteDelegates.Find(ReadTitleFileCompleteDelegate == -1)
    {
        ReadTitleFileCompleteDelegates.AddItem(ReadTitleFileCompleteDelegate;
    }
}

function ClearReadTitleFileCompleteDelegate(delegate<OnReadTitleFileComplete> ReadTitleFileCompleteDelegate)
{
    ReadTitleFileCompleteDelegates.RemoveItem(ReadTitleFileCompleteDelegate;
}

// Export UOnlineTitleFileInterfaceDingo::execGetTitleFileContents(FFrame&, void* const)
native function bool GetTitleFileContents(string Filename, out array<byte> FileContents);

function Engine.OnlineSubsystem.EOnlineEnumerationReadState GetTitleFileState(string Filename)
{
    local int FileIndex;

    FileIndex = TitleManagedFiles.Find('Filename', Filename;
    if(FileIndex != -1)
    {
        return TitleManagedFiles[FileIndex].AsyncState;
    }
    return 3;
}

// Export UOnlineTitleFileInterfaceDingo::execClearDownloadedFiles(FFrame&, void* const)
native function bool ClearDownloadedFiles();

// Export UOnlineTitleFileInterfaceDingo::execClearDownloadedFile(FFrame&, void* const)
native function bool ClearDownloadedFile(string Filename);

// Export UOnlineTitleFileInterfaceDingo::execRequestTitleFileList(FFrame&, void* const)
native function bool RequestTitleFileList();

delegate OnRequestTitleFileListComplete(bool bWasSuccessful, array<string> FilePaths);

function AddRequestTitleFileListCompleteDelegate(delegate<OnRequestTitleFileListComplete> RequestTitleFileListDelegate)
{
    if(RequestTitleFileListCompleteDelegates.Find(RequestTitleFileListDelegate == -1)
    {
        RequestTitleFileListCompleteDelegates.AddItem(RequestTitleFileListDelegate;
    }
}

function ClearRequestTitleFileListCompleteDelegate(delegate<OnRequestTitleFileListComplete> RequestTitleFileListDelegate)
{
    RequestTitleFileListCompleteDelegates.RemoveItem(RequestTitleFileListDelegate;
}
