/*******************************************************************************
 * RB_LineImpulseActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class RB_LineImpulseActor extends RigidBodyBase
    native(Physics)
    placeable
    hidecategories(Navigation);

/** Strength of impulse to apply to actors hit by the line check. */
var() interp float ImpulseStrength;
/** Length of line to check along. */
var() float ImpulseRange;
/** If true, the Strength is taken as a change in velocity instead of an impulse (ie. mass will have no affect). */
var() bool bVelChange;
/** If an impulse should only be applied to the first thing the line hits, or all things in the lines path. */
var() bool bStopAtFirstHit;
/** If true, will cause FracturedStaticMeshActor fragment hit by ray to break. */
var() bool bCauseFracture;
var export editinline ArrowComponent Arrow;
var repnotify byte ImpulseCount;

replication
{
     if(bNetDirty)
        ImpulseCount;
}

// Export URB_LineImpulseActor::execFireLineImpulse(FFrame&, void* const)
native final function FireLineImpulse();

simulated function OnToggle(SeqAct_Toggle inAction)
{
    if(inAction.InputLinks[0].bHasImpulse)
    {
        FireLineImpulse();
        ++ ImpulseCount;
        bForceNetUpdate = true;
    }
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'ImpulseCount')
    {
        FireLineImpulse();
    }
}

defaultproperties
{
    ImpulseStrength=900
    ImpulseRange=200
    begin object name=ArrowComponent0 class=ArrowComponent
        ArrowSize=4.16667
        bTreatAsASprite=true
        SpriteCategoryName=Physics
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__RB_LineImpulseActor.ArrowComponent0'
    Arrow=ArrowComponent0
    begin object name=ArrowComponent0 class=ArrowComponent
        ArrowSize=4.16667
        bTreatAsASprite=true
        SpriteCategoryName=Physics
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__RB_LineImpulseActor.ArrowComponent0'
    Components(0)=ArrowComponent0
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.S_LineImpulse'
        SpriteCategoryName=Physics
        ReplacementPrimitive=none
        HiddenGame=true
        AlwaysLoadOnClient=false
        AlwaysLoadOnServer=false
    object end
    // Reference: SpriteComponent'Default__RB_LineImpulseActor.Sprite'
    Components(1)=Sprite
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNoDelete=true
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    bEdShouldSnap=true
    NetUpdateFrequency=0.1
}