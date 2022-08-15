/*=============================================================================
	ApexAsset.uc: Wrapper for an NxApexAsset, an APEX base class. Apex Asset
	Copyright 2008-2009 NVIDIA corporation.
=============================================================================*/

/****
* This is the base class for ApexAssets
*
**/
class ApexAsset extends Object
	hidecategories(Object)
	native(Mesh);

var const editinline string OriginalApexName;
var native transient const array<ApexComponentBase> ApexComponents;
var() const editinlineuse editoronly array<ApexAsset>	NamedReferences;
var() const editconst editoronly string SourceFilePath;
var() const editconst editoronly string	SourceFileTimestamp;

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
   Name="Default__ApexAsset"
   ObjectArchetype=Object'Core.Default__Object'
}
