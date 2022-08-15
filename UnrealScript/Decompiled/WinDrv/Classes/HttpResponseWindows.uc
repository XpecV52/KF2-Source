/*******************************************************************************
 * HttpResponseWindows generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class HttpResponseWindows extends HttpResponseInterface
    native;

var private native const transient Pointer Response;
var private native const array<byte> Payload;

// Export UHttpResponseWindows::execGetHeader(FFrame&, void* const)
native function string GetHeader(string HeaderName);

// Export UHttpResponseWindows::execGetHeaders(FFrame&, void* const)
native function array<string> GetHeaders();

// Export UHttpResponseWindows::execGetURLParameter(FFrame&, void* const)
native function string GetURLParameter(string ParameterName);

// Export UHttpResponseWindows::execGetContentType(FFrame&, void* const)
native function string GetContentType();

// Export UHttpResponseWindows::execGetContentLength(FFrame&, void* const)
native function int GetContentLength();

// Export UHttpResponseWindows::execGetURL(FFrame&, void* const)
native function string GetURL();

// Export UHttpResponseWindows::execGetContent(FFrame&, void* const)
native function GetContent(out array<byte> Content);

// Export UHttpResponseWindows::execGetContentAsString(FFrame&, void* const)
native function string GetContentAsString();

// Export UHttpResponseWindows::execGetResponseCode(FFrame&, void* const)
native function int GetResponseCode();
