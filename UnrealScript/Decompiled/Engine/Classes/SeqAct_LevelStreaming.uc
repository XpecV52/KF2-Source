/*******************************************************************************
 * SeqAct_LevelStreaming generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SeqAct_LevelStreaming extends SeqAct_LevelStreamingBase
    native(Sequence)
    hidecategories(Object);

var const LevelStreaming Level;
/** LevelStreaming object name */
var() const name LevelName<autocomment=true>;
var transient bool bStatusIsOk;

defaultproperties
{
    ObjName="Stream Level"
    bSuppressAutoComment=false
}