/*******************************************************************************
 * KFGoreChunkAttachment_Skull generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGoreChunkAttachment_Skull extends KFGoreChunkAttachmentInfo
    editinlinenew
    hidecategories(Object,Object);

simulated function bool ShouldAttachGoreChunk(KFPawn_Monster inPawn)
{
    return inPawn.NumHeadChunksRemoved < 3;
}

simulated function bool ShouldDetachGoreChunk(KFPawn_Monster inPawn)
{
    return (inPawn.NumHeadChunksRemoved >= 3) && inPawn.bPlayedDeath || inPawn.bIsHeadless;
}
