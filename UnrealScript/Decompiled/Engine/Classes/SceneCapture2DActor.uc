/*******************************************************************************
 * SceneCapture2DActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SceneCapture2DActor extends SceneCaptureActor
    native
    placeable
    hidecategories(Navigation);

var const export editinline DrawFrustumComponent DrawFrustum;

defaultproperties
{
    begin object name=DrawFrust0 class=DrawFrustumComponent
        FrustumColor=(B=255,G=255,R=255,A=255)
        ReplacementPrimitive=none
    object end
    // Reference: DrawFrustumComponent'Default__SceneCapture2DActor.DrawFrust0'
    DrawFrustum=DrawFrust0
    SceneCapture=SceneCapture2DComponent'Default__SceneCapture2DActor.SceneCapture2DComponent0'
    Components(0)=SceneCapture2DComponent'Default__SceneCapture2DActor.SceneCapture2DComponent0'
    begin object name=CamMesh0 class=StaticMeshComponent
        StaticMesh=StaticMesh'EditorMeshes.MatineeCam_SM'
        ReplacementPrimitive=none
        HiddenGame=true
        CastShadow=false
        CollideActors=false
        AlwaysLoadOnClient=false
        AlwaysLoadOnServer=false
    object end
    // Reference: StaticMeshComponent'Default__SceneCapture2DActor.CamMesh0'
    Components(1)=CamMesh0
    begin object name=DrawFrust0 class=DrawFrustumComponent
        FrustumColor=(B=255,G=255,R=255,A=255)
        ReplacementPrimitive=none
    object end
    // Reference: DrawFrustumComponent'Default__SceneCapture2DActor.DrawFrust0'
    Components(2)=DrawFrust0
}