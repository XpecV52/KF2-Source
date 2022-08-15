/*******************************************************************************
 * AICommandBase generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommandBase extends Object within AIController
    abstract
    native(AI);

static event int GetUtility(AIController InAI)
{
    WarnInternal("AICommandBase Base Class GetUtility was called.  Please have your Parent Type or your indiv AICmd implement this function");
    ScriptTrace();
    return -1;
}
