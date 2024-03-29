/*******************************************************************************
 * ModelComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ModelComponent extends PrimitiveComponent
    native
    noexport;

var native const noexport transient Object Model;
var native const noexport transient int ZoneIndex;
var native const noexport transient int ComponentIndex;
var native const noexport transient array<Pointer> Nodes;
var native const noexport transient array<Pointer> Elements;

defaultproperties
{
    ReplacementPrimitive=none
    bUseAsOccluder=true
    bAcceptsStaticDecals=true
    CastShadow=true
    bAcceptsLights=true
    bUsePrecomputedShadows=true
    LightingChannels=(bInitialized=true,Indoor=true)
}