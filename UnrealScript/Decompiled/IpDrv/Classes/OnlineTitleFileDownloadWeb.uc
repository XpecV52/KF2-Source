/*******************************************************************************
 * OnlineTitleFileDownloadWeb generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class OnlineTitleFileDownloadWeb extends OnlineTitleFileDownloadBase
    native
    config(Engine);

var private array<TitleFileWeb> TitleFiles;

// Export UOnlineTitleFileDownloadWeb::execUncompressTitleFileContents(FFrame&, void* const)
native function bool UncompressTitleFileContents(OnlineTitleFileDownloadBase.EMcpFileCompressionType FileCompressionType, const out array<byte> CompressedFileContents, out array<byte> UncompressedFileContents);

function bool ReadTitleFile(string FileToRead, optional Engine.OnlineSubsystem.EOnlineFileType FileType)
{
    local int FileIndex, Idx;
    local string URL;

    FileType = 1;
    FileIndex = -1;
    Idx = 0;
    J0x20:

    if(Idx < TitleFiles.Length)
    {
        if(InStr(TitleFiles[Idx].Filename, FileToRead, true, false) != -1)
        {
            FileIndex = Idx;
            goto J0x9A;
        }
        ++ Idx;
        goto J0x20;
    }
    J0x9A:

    if(FileIndex == -1)
    {
        FileIndex = TitleFiles.Length;
        TitleFiles.Length = TitleFiles.Length + 1;
        TitleFiles[FileIndex].Filename = FileToRead;
        TitleFiles[FileIndex].AsyncState = 0;
    }
    if(TitleFiles[FileIndex].AsyncState == 2)
    {
        TriggerDelegates(true, FileToRead);        
    }
    else
    {
        if(TitleFiles[FileIndex].AsyncState == 3)
        {
            TriggerDelegates(false, FileToRead);
            return false;            
        }
        else
        {
            if(TitleFiles[FileIndex].AsyncState != 1)
            {
                TitleFiles[FileIndex].AsyncState = 1;
                URL = (GetUrlForFile(FileToRead)) $ FileToRead;
                LogInternal(((((((("(" $ string(Name)) $ ") OnlineTitleFileDownloadWeb::") $ string(GetStateName())) $ ":") $ string(GetFuncName())) @ "starting read for title file") @ "url=") $ URL);
                TitleFiles[FileIndex].HTTPRequest = Class'HttpFactory'.static.CreateRequest();
                if(TitleFiles[FileIndex].HTTPRequest != none)
                {
                    TitleFiles[FileIndex].HTTPRequest.__OnProcessRequestComplete__Delegate = OnFileDownloadComplete;
                    TitleFiles[FileIndex].HTTPRequest.SetVerb("GET");
                    TitleFiles[FileIndex].HTTPRequest.SetURL(URL);
                    TitleFiles[FileIndex].HTTPRequest.ProcessRequest();
                }
            }
        }
    }
    return true;
}

private final function OnFileDownloadComplete(HttpRequestInterface Request, HttpResponseInterface Response, bool bDidSucceed)
{
    local bool bSuccess;
    local int FileIndex, Idx;
    local string Filename;
    local array<byte> BinaryData;
    local string FileCompressionTypeString;

    if(bDidSucceed)
    {
        FileIndex = -1;
        Idx = 0;
        J0x27:

        if(Idx < TitleFiles.Length)
        {
            if(TitleFiles[Idx].HTTPRequest == Request)
            {
                FileIndex = Idx;
                goto J0x97;
            }
            ++ Idx;
            goto J0x27;
        }
        J0x97:

        LogInternal(((((((((((((("(" $ string(Name)) $ ") OnlineTitleFileDownloadWeb::") $ string(GetStateName())) $ ":") $ string(GetFuncName())) @ "") @ "FileIndex=") $ string(FileIndex)) @ "OriginalURL=") $ Request.GetURL()) @ "ResponseCode=") $ string(Response.GetResponseCode())) @ "ContentLength=") $ string(Response.GetContentLength()));
        if(FileIndex != -1)
        {
            Filename = TitleFiles[FileIndex].Filename;
            TitleFiles[FileIndex].HTTPRequest = none;
            TitleFiles[FileIndex].AsyncState = 3;
            if(Response.GetResponseCode() == 200)
            {
                bSuccess = true;
                Response.GetContent(BinaryData);
                TitleFiles[FileIndex].Data = BinaryData;
                FileCompressionTypeString = Response.GetHeader("Mcp-Content-Encoding");
                switch(FileCompressionTypeString)
                {
                    case "MFCT_ZLIB":
                        TitleFiles[FileIndex].FileCompressionType = 1;
                        break;
                    default:
                        TitleFiles[FileIndex].FileCompressionType = 0;
                        break;
                }
                TitleFiles[FileIndex].AsyncState = 2;                
            }
            else
            {
                TitleFiles[FileIndex].AsyncState = 3;
                TitleFiles[FileIndex].Data.Length = 0;
            }            
        }
        else
        {
            LogInternal(((((((("(" $ string(Name)) $ ") OnlineTitleFileDownloadWeb::") $ string(GetStateName())) $ ":") $ string(GetFuncName())) @ "No entry found for") @ "FileIndex=") $ string(FileIndex));
        }        
    }
    else
    {
        LogInternal(((((("(" $ string(Name)) $ ") OnlineTitleFileDownloadWeb::") $ string(GetStateName())) $ ":") $ string(GetFuncName())) @ "web request for file download failed");
    }
    TriggerDelegates(bSuccess, Filename);
}

// Export UOnlineTitleFileDownloadWeb::execTriggerDelegates(FFrame&, void* const)
private native final function TriggerDelegates(bool bSuccess, string FileRead);

// Export UOnlineTitleFileDownloadWeb::execGetTitleFileContents(FFrame&, void* const)
native function bool GetTitleFileContents(string Filename, out array<byte> FileContents);

function Engine.OnlineSubsystem.EOnlineEnumerationReadState GetTitleFileState(string Filename)
{
    local int FileIndex;

    FileIndex = TitleFiles.Find('Filename', Filename;
    if(FileIndex != -1)
    {
        return TitleFiles[FileIndex].AsyncState;
    }
    return 3;
}

// Export UOnlineTitleFileDownloadWeb::execClearDownloadedFiles(FFrame&, void* const)
native function bool ClearDownloadedFiles();

// Export UOnlineTitleFileDownloadWeb::execClearDownloadedFile(FFrame&, void* const)
native function bool ClearDownloadedFile(string Filename);

function bool RequestTitleFileList()
{
    local HttpRequestInterface HTTPRequest;
    local string URL;

    HTTPRequest = Class'HttpFactory'.static.CreateRequest();
    if(HTTPRequest != none)
    {
        URL = ((GetBaseURL()) $ RequestFileListURL) $ (GetAppAccessURL());
        HTTPRequest.__OnProcessRequestComplete__Delegate = OnFileListReceived;
        HTTPRequest.SetVerb("GET");
        HTTPRequest.SetURL(URL);
        HTTPRequest.ProcessRequest();        
    }
    else
    {
        LogInternal(((((("(" $ string(Name)) $ ") OnlineTitleFileDownloadWeb::") $ string(GetStateName())) $ ":") $ string(GetFuncName())) @ "HTTPRequest object missing");
    }
    return true;
}

function OnFileListReceived(HttpRequestInterface Request, HttpResponseInterface Response, bool bDidSucceed)
{
    local int Index;
    local delegate<OnRequestTitleFileListComplete> RequestTitleFileListDelegate;
    local array<string> ResponseStr;
    local bool bSuccess;

    ResponseStr.Length = 0;
    if(bDidSucceed)
    {
        if((Response != none) && Response.GetResponseCode() == 200)
        {
            ResponseStr.AddItem(Response.GetContentAsString();
            bSuccess = true;            
        }
        else
        {
            LogInternal(((((((((("(" $ string(Name)) $ ") OnlineTitleFileDownloadWeb::") $ string(GetStateName())) $ ":") $ string(GetFuncName())) @ "Download of file list failed. Bad response.") @ "ResponseCode=") $ string(Response.GetResponseCode())) @ "URL=") $ Request.GetURL());
        }        
    }
    else
    {
        LogInternal(((((("(" $ string(Name)) $ ") OnlineTitleFileDownloadWeb::") $ string(GetStateName())) $ ":") $ string(GetFuncName())) @ "Download of file list failed.");
    }
    Index = 0;
    J0x1E4:

    if(Index < RequestTitleFileListCompleteDelegates.Length)
    {
        RequestTitleFileListDelegate = RequestTitleFileListCompleteDelegates[Index];
        if(RequestTitleFileListDelegate != none)
        {
            OnRequestTitleFileListComplete(bSuccess, ResponseStr);
        }
        ++ Index;
        goto J0x1E4;
    }
}

function string GetUrlForFile(string Filename)
{
    local string URL;

    URL = (((GetBaseURL()) $ RequestFileURL) $ (GetAppAccessURL())) $ "&dlName=";
    return URL;
}

defaultproperties
{
    RequestFileListURL="/listfiles"
    RequestFileURL="/downloadfile"
    TimeOut=10
}