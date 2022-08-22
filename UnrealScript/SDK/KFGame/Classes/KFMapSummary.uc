//=============================================================================
// KFMapSummary
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 11/25/2013
//=============================================================================

class KFMapSummary extends UIMapSummary;

enum EAssociationIdentifier
{
	EAI_Custom,
	EAI_OfficialCustom,
	EAI_TripwireOfficial,
};

var	config EAssociationIdentifier MapAssociation;

defaultproperties
{

}
