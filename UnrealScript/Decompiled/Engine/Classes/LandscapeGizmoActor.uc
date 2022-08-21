/*******************************************************************************
 * LandscapeGizmoActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class LandscapeGizmoActor extends Actor
    native(Terrain)
    notplaceable
    hidecategories(Navigation);

var(Gizmo) editoronly float Width;
var(Gizmo) editoronly float Height;
var(Gizmo) editoronly float LengthZ;
var(Gizmo) editoronly float MarginZ;
var(Gizmo) editoronly float MinRelativeZ;
var(Gizmo) editoronly float RelativeScaleZ;
var(Gizmo) editoronly editconst transient LandscapeInfo TargetLandscapeInfo;

defaultproperties
{
    Width=1280
    Height=1280
    LengthZ=1280
    MarginZ=512
    RelativeScaleZ=1
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.S_DecalActorIcon'
        ReplacementPrimitive=none
        HiddenGame=true
        AlwaysLoadOnClient=false
        AlwaysLoadOnServer=false
        Scale=0.3
    object end
    // Reference: SpriteComponent'Default__LandscapeGizmoActor.Sprite'
    Components(0)=Sprite
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bStatic=true
    bMovable=false
    bEditable=false
}