/*******************************************************************************
 * UserCloudFileCloudSaveSystemDataBlobStore generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UserCloudFileCloudSaveSystemDataBlobStore extends Object
    implements(CloudSaveSystemDataBlobStoreInterface);

var private transient UserCloudFileInterface UserCloudFile;
var private transient delegate<GetDataBlobCallbackDelegate> GetDataBlobCallback;
var private transient delegate<SetDataBlobCallbackDelegate> SetDataBlobCallback;
var private transient delegate<DeleteDataBlobCallbackDelegate> DeleteDataBlobCallback;
var delegate<GetDataBlobCallbackDelegate> __GetDataBlobCallbackDelegate__Delegate;
var delegate<SetDataBlobCallbackDelegate> __SetDataBlobCallbackDelegate__Delegate;
var delegate<DeleteDataBlobCallbackDelegate> __DeleteDataBlobCallbackDelegate__Delegate;

delegate GetDataBlobCallbackDelegate(bool bWasSuccessful, string StorageID, string BlobName, out array<byte> DataBlob, string Error);

delegate SetDataBlobCallbackDelegate(bool bWasSucessfull, string StorageID, string BlobName, string Error);

private final delegate DeleteDataBlobCallbackDelegate(bool bWasSucessfull, string StorageID, string BlobName, string Error);

final function Init(UserCloudFileInterface InUserCloudFile)
{
    UserCloudFile = InUserCloudFile;
}

function GetDataBlob(string StorageID, string BlobName, delegate<GetDataBlobCallbackDelegate> InGetDataBlobCallback)
{
    local bool ErrorOccured;
    local string Error;
    local array<byte> EmptyBuffer;

    ErrorOccured = true;
    if(EqualEqual_InterfaceInterface(UserCloudFile, (none)))
    {
        Error = "GetDataBlob::UserCloudFileInterface instance is null";        
    }
    else
    {
        if(GetDataBlobCallback != none)
        {
            Error = "GetDataBlob::GetDataBlob operation already active";            
        }
        else
        {
            if(InGetDataBlobCallback == none)
            {
                Error = "GetDataBlob::InGetDataBlobCallback cannot be none";                
            }
            else
            {
                UserCloudFile.AddReadUserFileCompleteDelegate(OnReadUserFileComplete);
                GetDataBlobCallback = InGetDataBlobCallback;
                if(UserCloudFile.ReadUserFile(StorageID, BlobName))
                {
                    ErrorOccured = false;                    
                }
                else
                {
                    Error = "GetDataBlob::Unknown error starting read of user file from cloud";
                    GetDataBlobCallback = None;
                    UserCloudFile.ClearReadUserFileCompleteDelegate(OnReadUserFileComplete);
                }
            }
        }
    }
    if(ErrorOccured && InGetDataBlobCallback != none)
    {
        GetDataBlobCallbackDelegate(false, StorageID, BlobName, EmptyBuffer, Error);
    }
}

private final function OnReadUserFileComplete(bool bWasSuccessful, string UserId, string Filename)
{
    local delegate<GetDataBlobCallbackDelegate> Callback;
    local array<byte> FileContents;
    local bool LocalResult;

    UserCloudFile.ClearReadUserFileCompleteDelegate(OnReadUserFileComplete);
    LocalResult = bWasSuccessful;
    if(bWasSuccessful)
    {
        if(!UserCloudFile.GetFileContents(UserId, Filename, FileContents))
        {
            LocalResult = false;
        }
    }
    if(GetDataBlobCallback != none)
    {
        Callback = GetDataBlobCallback;
        GetDataBlobCallback = None;
        GetDataBlobCallbackDelegate(LocalResult, UserId, Filename, FileContents, "");
    }
}

function SetDataBlob(string StorageID, string BlobName, const out array<byte> DataBlob, delegate<SetDataBlobCallbackDelegate> InSetDataBlobCallback)
{
    local bool ErrorOccured;
    local string Error;

    ErrorOccured = true;
    if(EqualEqual_InterfaceInterface(UserCloudFile, (none)))
    {
        Error = "SetDataBlob::UserCloudFileInterface instance is null";        
    }
    else
    {
        if(SetDataBlobCallback != none)
        {
            Error = "SetDataBlob::SetDataBlob operation already active";            
        }
        else
        {
            if(InSetDataBlobCallback == none)
            {
                Error = "SetDataBlob::InSetDataBlobCallback cannot be none";                
            }
            else
            {
                UserCloudFile.AddWriteUserFileCompleteDelegate(OnWriteUserFileComplete);
                SetDataBlobCallback = InSetDataBlobCallback;
                if(UserCloudFile.WriteUserFile(StorageID, BlobName, DataBlob))
                {
                    ErrorOccured = false;                    
                }
                else
                {
                    Error = "SetDataBlob::Unknown error starting write of user file to cloud";
                    SetDataBlobCallback = None;
                    UserCloudFile.ClearWriteUserFileCompleteDelegate(OnWriteUserFileComplete);
                }
            }
        }
    }
    if(ErrorOccured && InSetDataBlobCallback != none)
    {
        SetDataBlobCallbackDelegate(false, StorageID, BlobName, Error);
    }
}

private final function OnWriteUserFileComplete(bool bWasSuccessful, string UserId, string Filename)
{
    local delegate<SetDataBlobCallbackDelegate> Callback;

    UserCloudFile.ClearWriteUserFileCompleteDelegate(OnWriteUserFileComplete);
    if(SetDataBlobCallback != none)
    {
        Callback = SetDataBlobCallback;
        SetDataBlobCallback = None;
        SetDataBlobCallbackDelegate(bWasSuccessful, UserId, Filename, "");
    }
}

function bool DeleteDataBlob(string StorageID, string BlobName, delegate<DeleteDataBlobCallbackDelegate> InDeleteDataBlobCallback)
{
    local bool RValue;

    RValue = false;
    if(NotEqual_InterfaceInterface(UserCloudFile, (none)) && DeleteDataBlobCallback == none)
    {
        UserCloudFile.AddDeleteUserFileCompleteDelegate(OnDeleteUserFileComplete);
        DeleteDataBlobCallback = InDeleteDataBlobCallback;
        RValue = UserCloudFile.DeleteUserFile(StorageID, BlobName, true, true);
        if(!RValue)
        {
            DeleteDataBlobCallback = None;
            UserCloudFile.ClearDeleteUserFileCompleteDelegate(OnDeleteUserFileComplete);
        }
    }
    return RValue;
}

private final function OnDeleteUserFileComplete(bool bWasSuccessful, string UserId, string Filename)
{
    local delegate<DeleteDataBlobCallbackDelegate> Callback;

    UserCloudFile.ClearDeleteUserFileCompleteDelegate(OnDeleteUserFileComplete);
    if(DeleteDataBlobCallback != none)
    {
        Callback = DeleteDataBlobCallback;
        DeleteDataBlobCallback = None;
        DeleteDataBlobCallbackDelegate(bWasSuccessful, UserId, Filename, "");
    }
}
