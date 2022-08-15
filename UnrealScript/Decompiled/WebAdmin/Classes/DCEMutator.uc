/*******************************************************************************
 * DCEMutator generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DCEMutator extends DataStoreCacheEntry;

var string ClassName;
var KFMutatorSummary Data;

function Init(KFMutatorSummary Source)
{
    Data = Source;
    if(Data == none)
    {
        WarnInternal("No UIMutatorSummary");
        return;
    }
    FriendlyName = ensureFriendlyName(Data.FriendlyName, Data.ClassName, string(Data.Name));
    Description = Class'WebAdminUtils'.static.getLocalized(Data.Description);
    ClassName = Data.ClassName;
}
