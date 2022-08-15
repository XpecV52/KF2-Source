/*******************************************************************************
 * McpServiceConfig generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class McpServiceConfig extends Object
    config(Engine);

var config string Protocol;
var config string Domain;
var string AppKey;
var string AppSecret;

function string GetUserAuthTicket(string McpId);

defaultproperties
{
    Protocol="http"
    Domain="localhost:8888"
}