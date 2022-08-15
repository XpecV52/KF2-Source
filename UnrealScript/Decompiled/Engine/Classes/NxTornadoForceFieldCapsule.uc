/*******************************************************************************
 * NxTornadoForceFieldCapsule generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class NxTornadoForceFieldCapsule extends NxTornadoForceField
    native(ForceField)
    placeable
    hidecategories(Navigation);

/** Used to preview the radius of the force. */
var() export editinline DrawCapsuleComponent RenderComponent;

defaultproperties
{
    begin object name=DrawCapsule0 class=DrawCapsuleComponent
        ReplacementPrimitive=none
    object end
    // Reference: DrawCapsuleComponent'Default__NxTornadoForceFieldCapsule.DrawCapsule0'
    RenderComponent=DrawCapsule0
    ForceHeight=200
    begin object name=DrawCapsule0 class=DrawCapsuleComponent
        ReplacementPrimitive=none
    object end
    // Reference: DrawCapsuleComponent'Default__NxTornadoForceFieldCapsule.DrawCapsule0'
    Components(0)=DrawCapsule0
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.S_RadForce'
        SpriteCategoryName=Physics
        ReplacementPrimitive=none
        HiddenGame=true
        AlwaysLoadOnClient=false
        AlwaysLoadOnServer=false
    object end
    // Reference: SpriteComponent'Default__NxTornadoForceFieldCapsule.Sprite'
    Components(1)=Sprite
}