/*******************************************************************************
 * ActorFactoryDecal generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ActorFactoryDecal extends ActorFactory
    native(Decal)
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var() MaterialInterface DecalMaterial;

defaultproperties
{
    MenuName="Add Decal"
    MenuPriority=15
    NewActorClass=Class'DecalActor'
}