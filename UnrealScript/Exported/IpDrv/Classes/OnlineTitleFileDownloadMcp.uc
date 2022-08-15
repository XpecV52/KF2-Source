/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

/**
 * Provides a mechanism for downloading arbitrary files from the MCP server
 */
class OnlineTitleFileDownloadMcp extends OnlineTitleFileDownloadBase
	native;

/** Struct that matches one download object per file for parallel downloading */
struct native TitleFileMcp extends OnlineSubsystem.TitleFile
{
	/** The class that will communicate with backend to download the file */
	var private native const pointer HttpDownloader{class FHttpDownloadBinary};
};

/** The list of title files that have been read or are being read */
var private array<TitleFileMcp> TitleFiles;

/** The number of files in the array being processed */
var transient int DownloadCount;

/**
 * Starts an asynchronous read of the specified file from the network platform's
 * title specific file store
 *
 * @param FileToRead the name of the file to read
 *
 * @return true if the calls starts successfully, false otherwise
 */
native function bool ReadTitleFile(string FileToRead);

/**
 * Copies the file data into the specified buffer for the specified file
 *
 * @param FileName the name of the file to read
 * @param FileContents the out buffer to copy the data into
 *
 * @return true if the data was copied, false otherwise
 */
native function bool GetTitleFileContents(string FileName,out array<byte> FileContents);

/**
 * Determines the async state of the tile file read operation
 *
 * @param FileName the name of the file to check on
 *
 * @return the async state of the file read
 */
function EOnlineEnumerationReadState GetTitleFileState(string FileName)
{
	local int FileIndex;

	FileIndex = TitleFiles.Find('FileName',FileName);
	if (FileIndex != INDEX_NONE)
	{
		return TitleFiles[FileIndex].AsyncState;
	}
	return OERS_Failed;
}

/**
 * Empties the set of downloaded files if possible (no async tasks outstanding)
 *
 * @return true if they could be deleted, false if they could not
 */
native function bool ClearDownloadedFiles();

/**
 * Empties the cached data for this file if it is not being downloaded currently
 *
 * @param FileName the name of the file to remove from the cache
 *
 * @return true if it could be deleted, false if it could not
 */
native function bool ClearDownloadedFile(string FileName);

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__OnlineTitleFileDownloadMcp"
   ObjectArchetype=OnlineTitleFileDownloadBase'IpDrv.Default__OnlineTitleFileDownloadBase'
}
