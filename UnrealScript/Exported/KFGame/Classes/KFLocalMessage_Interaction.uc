//=============================================================================
// KFLocalMessage_Interaction
//=============================================================================
// Message class for world interaction messages
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFLocalMessage_Interaction extends KFLocalMessage;

enum EInteractionMessageType
{
	IMT_None,
	IMT_UseTrader,
	IMT_UseDoor,	
	IMT_AcceptObjective,
	IMT_ReceiveAmmo,
	IMT_HealSelfWarning,
	IMT_ClotGrabWarning,
	IMT_ReceiveGrenades
};

var localized string			UseTraderMessage;
var localized string			UseDoorMessage;
var localized string			AcceptObjectiveMessage;
var localized string			ReceiveAmmoMessage;
var localized string			ReceiveGrenadesMessage;
var localized string			HealSelfWarning;
var localized string 			PressToBashWarning;

var const string USE_COMMAND;
var const string HEAL_COMMAND;
var const string HEAL_COMMAND_CONTROLLER;
var const string BASH_COMMAND_CONTROLLER;
var const string BASH_COMMAND;


static function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local string MessageString;
	local KFGFxMoviePlayer_HUD GFxHud;

	if ( KFGFxHudWrapper(P.myHUD) != none )
	{
	    GFxHud = KFGFxHudWrapper(P.myHUD).HudMovie;
		if ( GFxHud != None )
		{
			MessageString = static.GetString( Switch, (RelatedPRI_1 == P.PlayerReplicationInfo), RelatedPRI_1, RelatedPRI_2, OptionalObject );
            GFxHud.DisplayInteractionMessage( MessageString, Switch,  GetKeyBind(P, Switch));
		}
	}
}

static function string GetKeyBind( PlayerController P, optional int Switch )
{
	local KFPlayerInput KFInput;
	local KeyBind BoundKey;
	local string KeyString;

	KFInput = KFPlayerInput(P.PlayerInput);	
	if( KFInput == none )
	{
		return "";
	}

	switch ( Switch )
	{
		// Use binding
		case IMT_UseTrader:
		case IMT_UseDoor:
		case IMT_AcceptObjective:
		case IMT_ReceiveAmmo:
		case IMT_ReceiveGrenades:
			KFInput.GetKeyBindFromCommand(BoundKey, default.USE_COMMAND, false);
			KeyString = KFInput.GetBindDisplayName(BoundKey);
			break;
		case IMT_HealSelfWarning:
			//Something about the gamepad and the fact that these butons are not treated as the other breaks this functionality.  
			//Adding a none check to ensure that a button is passed in
			KFInput.GetKeyBindFromCommand(BoundKey, default.HEAL_COMMAND, false);
			if(BoundKey.Name == 'None')
			{
				KFInput.GetKeyBindFromCommand(BoundKey, default.HEAL_COMMAND_CONTROLLER, false);
			}
			
			KeyString = KFInput.GetBindDisplayName(BoundKey);

			break;
		case IMT_ClotGrabWarning:
			KFInput.GetKeyBindFromCommand(BoundKey, default.BASH_COMMAND, false);
			KeyString = KFInput.GetBindDisplayName(BoundKey);
			break;
	}

	return KeyString;
}

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	switch ( Switch )
	{
		case IMT_UseTrader:
			return default.UseTraderMessage;
		case IMT_UseDoor:
			return default.UseDoorMessage;
		case IMT_AcceptObjective:
			return default.AcceptObjectiveMessage;
		case IMT_ReceiveAmmo:
			return default.ReceiveAmmoMessage;
		case IMT_ReceiveGrenades:
			return default.ReceiveGrenadesMessage;
		case IMT_HealSelfWarning:
			return default.HealSelfWarning;
		case IMT_ClotGrabWarning:
			return default.PressToBashWarning;
		default:
			return "";
	}
}

static function float GetPos( int Switch, HUD myHUD )
{
    return 0.8;
}

// Returns a hex color code for the supplied message type
static function string GetHexColor(int Switch)
{
    return default.InteractionColor;
}

defaultproperties
{
   UseTraderMessage="Press <%x%> to trade"
   UseDoorMessage="PRESS <%x%> to use, HOLD to equip welder"
   AcceptObjectiveMessage="Press <%x%> to accept objective"
   ReceiveAmmoMessage="Press <%x%> to receive ammo from supplier"
   ReceiveGrenadesMessage="Press <%x%> to receive grenades from supplier"
   HealSelfWarning="Press <%x%> to heal yourself."
   PressToBashWarning="Press <%x%> to melee bash."
   USE_COMMAND="GBA_Use"
   HEAL_COMMAND="GBA_QuickHeal"
   HEAL_COMMAND_CONTROLLER="GBA_DPad_Down_Gamepad"
   BASH_COMMAND="GBA_TertiaryFire"
   bIsUnique=True
   bIsConsoleMessage=False
   bBeep=True
   Lifetime=5.000000
   Name="Default__KFLocalMessage_Interaction"
   ObjectArchetype=KFLocalMessage'KFGame.Default__KFLocalMessage'
}
