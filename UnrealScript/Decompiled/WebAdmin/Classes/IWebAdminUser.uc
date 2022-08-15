/*******************************************************************************
 * IWebAdminUser generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
interface IWebAdminUser extends Interface
    abstract;

struct MessageEntry
{
    var int Counter;
    var PlayerReplicationInfo Sender;
    var string senderName;
    var string Message;
    var name Type;
    var string TeamName;
    var Color TeamColor;
    var int TeamID;

    structdefaultproperties
    {
        Counter=0
        Sender=none
        senderName=""
        Message=""
        Type=None
        TeamName=""
        TeamColor=(B=0,G=0,R=0,A=0)
        TeamID=0
    }
};

function string getUsername();

function string getUserid();

function bool canPerform(string URL);

function array<string> getCheckedPrivileges();

function clearCheckedPrivileges();

function PlayerController GetPC();

function messageHistory(out array<MessageEntry> History, optional int startingFrom);

function Logout();

function ISettingsPrivileges getSettingsPrivileges();
