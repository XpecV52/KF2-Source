//=============================================================================
// KFGFxWidget_VOIPNotification
//=============================================================================
// HUD Widget that displays when a user is talking over Voip
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 07/07/2014
//=============================================================================

class KFGFxWidget_VOIPNotification extends GFxObject;

var array<KFPlayerReplicationInfo>	TalkerPRIs;


function VOIPEventTriggered(PlayerReplicationInfo TalkerPRI, bool bIsTalking)
{
	local KFPlayerReplicationInfo KFPRI;
	KFPRI = KFPlayerReplicationInfo(TalkerPRI);
	
	if ( KFPRI == none )
	{
		return;
	}

	if ( !bIsTalking )
	{
		TalkerPRIs.RemoveItem(KFPRI);
	}
	else
	{
		if(TalkerPRIs.Find(KFPRI) != INDEX_NONE)
		{
			TalkerPRIs.RemoveItem(KFPRI);
		}
		if(!GetPC().IsPlayerMuted(KFPRI.UniqueId))
		{
			TalkerPRIs.AddItem(KFPRI);
		}
	}
	UpdateWidget();
}

function UpdateWidget()
{
	local int i;
	local GFxObject DataProvider, TempObj;
	
	DataProvider = CreateArray();

	for ( i = 0; i < TalkerPRIs.length; i++ )
	{
		TempObj = CreateObject( "Object" );
		TempObj.SetString( "label", TalkerPRIs[i].PlayerName );
		DataProvider.SetElementObject( i, TempObj );
	}

	SetObject( "voipActiveList", DataProvider );
}

defaultproperties
{
   Name="Default__KFGFxWidget_VOIPNotification"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
