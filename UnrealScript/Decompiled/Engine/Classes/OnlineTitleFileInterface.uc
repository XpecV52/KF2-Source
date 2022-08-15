/*******************************************************************************
 * OnlineTitleFileInterface generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
interface OnlineTitleFileInterface extends Interface
    abstract;

delegate OnReadTitleFileComplete(bool bWasSuccessful, string Filename);

function bool ReadTitleFile(string FileToRead);

function AddReadTitleFileCompleteDelegate(delegate<OnReadTitleFileComplete> ReadTitleFileCompleteDelegate);

function ClearReadTitleFileCompleteDelegate(delegate<OnReadTitleFileComplete> ReadTitleFileCompleteDelegate);

function bool GetTitleFileContents(string Filename, out array<byte> FileContents);

function OnlineSubsystem.EOnlineEnumerationReadState GetTitleFileState(string Filename);

function bool ClearDownloadedFiles();

function bool ClearDownloadedFile(string Filename);

function RequestTitleFileList();

delegate OnRequestTitleFileListComplete(bool bWasSuccessful, string ResultStr);

function AddRequestTitleFileListCompleteDelegate(delegate<OnRequestTitleFileListComplete> RequestTitleFileListDelegate);

function ClearRequestTitleFileListCompleteDelegate(delegate<OnRequestTitleFileListComplete> RequestTitleFileListDelegate);
