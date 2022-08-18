/*******************************************************************************
 * KFLocalMessage_ServerNotification generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFLocalMessage_ServerNotification extends KFLocalMessage;

enum EServerMessageType
{
    SMT_None,
    SMT_TeamsPendingBalance,
    SMT_MAX
};

var const localized string TeamPendingBalanceMessage;

static function string GetString(optional int Switch, optional bool bPRI1HUD, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        case 1:
            return default.TeamPendingBalanceMessage;
            break;
        default:
            return "";
            break;
    }
}

defaultproperties
{
    TeamPendingBalanceMessage="Teams are unbalanced and will be adjusted"
}