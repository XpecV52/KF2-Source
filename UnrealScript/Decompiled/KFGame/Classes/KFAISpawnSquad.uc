/*******************************************************************************
 * KFAISpawnSquad generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAISpawnSquad extends Object
    hidecategories(Object);

struct AISquadElement
{
    /** Type and amount of AI and spawn behavior */
    var() KFAISpawnManager.EAIType Type;
    /** Type and amount of AI and spawn behavior */
    var() byte Num<ClampMin=1|ClampMax=6>;
    var class<KFPawn_Monster> CustomClass;

    structdefaultproperties
    {
        Type=EAIType.AT_Clot
        Num=1
        CustomClass=none
    }
};

var() KFSpawnVolume.ESquadType MinVolumeType;
var() const array<AISquadElement> MonsterList;

defaultproperties
{
    MinVolumeType=ESquadType.EST_Medium
}