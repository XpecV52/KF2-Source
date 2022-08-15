/*******************************************************************************
 * KFHTTPImageDownloader generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFHTTPImageDownloader extends Object
    native;

var private native const noexport Pointer VfTable_FTickableObject;
var private delegate<OnDownloadComplete> DownloadCompleteDelegate;
var private native const Pointer HttpDownloader;
var Texture2D TheTexture;
var string ImageURL;
var delegate<OnDownloadComplete> __OnDownloadComplete__Delegate;

delegate OnDownloadComplete(bool bWasSuccessful);

// Export UKFHTTPImageDownloader::execDownloadImageFromURL(FFrame&, void* const)
native function bool DownloadImageFromURL(string ImgURL, delegate<OnDownloadComplete> CompleteDelegate);
