/*******************************************************************************
 * ActorFactorySkeletalMesh generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ActorFactorySkeletalMesh extends ActorFactory
    native
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var() SkeletalMesh SkeletalMesh;
var() AnimSet AnimSet;
var() name AnimSequenceName;

defaultproperties
{
    GameplayActorClass=Class'SkeletalMeshActorSpawnable'
    MenuName="Add SkeletalMesh"
    MenuPriority=13
    NewActorClass=Class'SkeletalMeshActor'
}