//=============================================================================
// KFLocalMessage_Game
//=============================================================================
// Message class for general gam play messages
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFLocalMessage_Game extends KFLocalMessage;

enum EGameMessageType
{
	GMT_ReceivedAmmoFrom,
	GMT_GaveAmmoTo,
	GMT_HealedBy,
	GMT_HealedPlayer,
	GMT_HealedSelf,
	GMT_Equipped,
	GMT_PickedupArmor,
	GMT_FullArmor,
	GMT_Ammo,
	GMT_PickedupWeaponAmmo,
	GMT_AmmoIsFull,
	GMT_AlreadyCarryingWeapon,
	GMT_PickedupItem,
	GMT_TooMuchWeight,
	GMT_PendingPerkChangesSet,
    GMT_PendingPerkChangesApplied,
    GMT_FailedDropInventory,
    GMT_ReceivedGrenadesFrom,
	GMT_GaveGrenadesTo,

    GMT_FoundCollectible,
    GMT_FoundAllCollectibles,
    GMT_UserSharingContent,

	KMT_Killed,
	KMT_Suicide

};

var localized string 			ReceivedAmmoFromMessage;
var localized string 			GaveAmmoToMessage;
var localized string 			HealedByMessage;
var localized string			HealedMessage;
var localized string			PickedupArmorMessage;
var localized string			FullArmorMessage;
var localized string			PickupAmmoMessage;
var localized string 			AmmoFullMessage;
var localized string			AlreadyCarryingWeaponMessage;
var localized string			PickupWeaponAmmoMessage;
var localized string			PickupMessage;
var localized string			TooMuchWeightMessage;
var localized string 			ReceivedGrenadesFromMessage;
var localized string 			GaveGrenadesToMessage;
var localized string 			YourselfString;

var localized string			FailedDropInventoryMessage;
var localized string 			PendingPerkChangesSet;
var localized string 			PendingPerkChangesApplied;

var localized string			KilledMessage;
var localized string			SuicideMessage;

var localized string 			KillzedBy_PatriarchString;
var localized string 			KillzedBy_HansString;
var localized string 			KillzedBy_ZedCrawlerString;
var localized string 			KillzedBy_ZedBloatString;
var localized string 			KillzedBy_ZedFleshpoundString;
var localized string 			KillzedBy_ZedGorefastString;
var localized string 			KillzedBy_ZedHuskString;
var localized string 			KillzedBy_ZedScrakeString;
var localized string 			KillzedBy_ZedSirenString;
var localized string 			KillzedBy_ZedStalkerString;
var localized string 			KillzedBy_ZedClot_CystString;
var localized string 			KillzedBy_ZedClot_AlphaString;
var localized string 			KillzedBy_ZedClot_SlasherString;

var localized string 			FoundAMapCollectibleMessage;
var localized string			FoundAllMapCollectiblesMessage;
var localized string 			MapCollectibleName;
var localized string 			SharingContentString;

var localized string 			HeadShotAddedString;
var localized string 			HeadShotMaxString;
var localized string 			HeadShotResetString;

// Returns a hex color code for the supplied message type
static function string GetHexColor(int Switch)
{
    switch ( Switch )
	{
		case GMT_GaveAmmoTo:
		case GMT_ReceivedAmmoFrom:
		case GMT_HealedBy:
        case GMT_HealedPlayer:
        case GMT_HealedSelf:
        case GMT_PickedupArmor:
        case GMT_FullArmor:
        case GMT_Ammo:
        case GMT_AmmoIsFull:
        case GMT_PickedupWeaponAmmo:
        case GMT_AlreadyCarryingWeapon:
        case GMT_PickedupItem:
        case GMT_PendingPerkChangesSet:
		case GMT_PendingPerkChangesApplied:
		case GMT_ReceivedGrenadesFrom:
		case GMT_GaveGrenadesTo:
             return default.GameColor;
	}

	return "00FF00";
}

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local string TempString;

	switch ( Switch )
	{
		case GMT_GaveAmmoTo:
			return default.GaveAmmoToMessage @RelatedPRI_1.PlayerName;
		case GMT_ReceivedAmmoFrom:
			return default.ReceivedAmmoFromMessage @RelatedPRI_1.PlayerName;
		case GMT_HealedBy:
			return default.HealedByMessage @RelatedPRI_1.PlayerName;
		case GMT_PendingPerkChangesSet:
			return default.PendingPerkChangesSet;
		case GMT_PendingPerkChangesApplied:
			return default.PendingPerkChangesApplied;
		case GMT_HealedPlayer:
			return default.HealedMessage@ RelatedPRI_1.PlayerName;
		case GMT_HealedSelf:
			return default.HealedMessage@ default.YourselfString;
		case GMT_PickedupArmor:
			return default.PickedupArmorMessage;
		case GMT_FullArmor:
			return default.FullArmorMessage;
		case GMT_Ammo:
			return default.PickupAmmoMessage;
		case GMT_AmmoIsFull:
			return default.AmmoFullMessage;
		case GMT_PickedupWeaponAmmo:
			TempString = Repl(default.PickupWeaponAmmoMessage, "%x%", class<Inventory>( OptionalObject ).default.ItemName, true);
			return TempString;
		case GMT_AlreadyCarryingWeapon:
			return default.AlreadyCarryingWeaponMessage;
		case GMT_PickedupItem:
			return default.PickupMessage@ Inventory( OptionalObject).ItemName;
		case GMT_TooMuchWeight:
			return default.TooMuchWeightMessage;
		case GMT_FailedDropInventory:
			return default.FailedDropInventoryMessage;
		case GMT_GaveGrenadesTo:
			return default.GaveGrenadesToMessage @RelatedPRI_1.PlayerName;
		case GMT_ReceivedGrenadesFrom:
			return default.ReceivedGrenadesFromMessage @RelatedPRI_1.PlayerName;
		case GMT_FoundCollectible:
			return default.FoundAMapCollectibleMessage;
		case GMT_FoundAllCollectibles:
			return default.FoundAllMapCollectiblesMessage;
		case GMT_UserSharingContent:
            return RelatedPRI_1.PlayerName @Default.SharingContentString;
		case KMT_Killed:
			return	RelatedPRI_1.PlayerName$GetKilledByZedMessage( OptionalObject );
		case KMT_Suicide:
			return	RelatedPRI_1.PlayerName@ default.SuicideMessage;
		default:
			return "";
	}
}

static function string GetKilledByZedMessage( Object KillerClass )
{
	if( KillerClass != none )
	{
		switch ( KillerClass.Name )
		{
			case 'KFAIController_ZedPatriarch':
				return default.KillzedBy_PatriarchString;
			case 'KFAIController_Hans':
				return default.KillzedBy_HansString;
			case 'KFAIController_ZedCrawler':
				return default.KillzedBy_ZedCrawlerString;
			case 'KFAIController_ZedBloat':
				return default.KillzedBy_ZedBloatString;
			case 'KFAIController_ZedFleshpound':
				return default.KillzedBy_ZedFleshpoundString;
			case 'KFAIController_ZedGorefast':
				return default.KillzedBy_ZedGorefastString;
			case 'KFAIController_ZedHusk':
				return default.KillzedBy_ZedHuskString;
			case 'KFAIController_ZedScrake':
				return default.KillzedBy_ZedScrakeString;
			case 'KFAIController_ZedSiren':
				return default.KillzedBy_ZedSirenString;
			case 'KFAIController_ZedStalker':
				return default.KillzedBy_ZedStalkerString;
			case 'KFAIController_ZedClot_Cyst':
				return default.KillzedBy_ZedClot_CystString;
			case 'KFAIController_ZedClot_Alpha':
				return default.KillzedBy_ZedClot_AlphaString;
			case 'KFAIController_ZedClot_Slasher':
				return default.KillzedBy_ZedClot_SlasherString;
			
		}
	}

	return default.KilledMessage;
} 

static function float GetPos( int Switch, HUD myHUD )
{
	switch ( Switch )
	{
		case KMT_Killed:
		case KMT_Suicide:
			return 0.1;
	}

    return 0.8;
}

defaultproperties
{
   ReceivedAmmoFromMessage="You received ammo from"
   GaveAmmoToMessage="You gave ammo to"
   HealedByMessage="You were healed by"
   HealedMessage="You healed"
   PickedupArmorMessage="You picked up armor"
   FullArmorMessage="Your armor is already full"
   PickupAmmoMessage="You picked up ammo"
   AmmoFullMessage="Your ammo is full"
   AlreadyCarryingWeaponMessage="You already have this weapon"
   PickupWeaponAmmoMessage="You picked up %x% ammo"
   PickupMessage="You picked up a"
   TooMuchWeightMessage="This weapon is too heavy. Try dropping or selling a weapon."
   ReceivedGrenadesFromMessage="You received grenades from"
   GaveGrenadesToMessage="You gave grenades to"
   YourselfString="yourself."
   FailedDropInventoryMessage="You can't drop that here"
   PendingPerkChangesSet="Perk changes will be applied at the end of the wave."
   PendingPerkChangesApplied="Perk changes applied!"
   KilledMessage=" was eaten alive"
   SuicideMessage=" just gave up on life..."
   KillzedBy_PatriarchString=" can't hurt Kevin's children anymore"
   KillzedBy_HansString="'s body has been removed for further experimentation"
   KillzedBy_ZedCrawlerString="'s ankles have been chewed off"
   KillzedBy_ZedBloatString=" has drowned in bodily fluids"
   KillzedBy_ZedFleshpoundString=" has been ground to a pulp"
   KillzedBy_ZedGorefastString=" was skinned alive"
   KillzedBy_ZedHuskString=" has been charred to death"
   KillzedBy_ZedScrakeString=" was cut down in their prime"
   KillzedBy_ZedSirenString="'s ears have blown out - fatally"
   KillzedBy_ZedStalkerString=" didn't see it coming"
   KillzedBy_ZedClot_CystString=" has suffered an underwhelming death"
   KillzedBy_ZedClot_AlphaString=" was grabbed inappropriately"
   KillzedBy_ZedClot_SlasherString=" no longer likes slasher flicks"
   FoundAMapCollectibleMessage="%x% found a %y%. %z% left..."
   FoundAllMapCollectiblesMessage="Every %x% has been found!"
   MapCollectibleName="piece of dosh bling"
   SharingContentString="is sharing content."
   HeadShotAddedString="%x Headshot(s) - %y% Extra Damage!"
   HeadShotMaxString="Headshot! %x% Extra Damage!"
   HeadShotResetString="Missed Headshot. Normal Damage!"
   bIsUnique=True
   bIsConsoleMessage=False
   bBeep=True
   Lifetime=5.000000
   DrawColor=(B=0,G=0,R=255,A=255)
   FontSize=20
   Name="Default__KFLocalMessage_Game"
   ObjectArchetype=KFLocalMessage'KFGame.Default__KFLocalMessage'
}
