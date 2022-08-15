/*******************************************************************************
 * PrefabInstance generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PrefabInstance extends Actor
    native(Prefab)
    notplaceable
    hidecategories(Navigation);

var const Prefab TemplatePrefab;
var const int TemplateVersion;
var native const map<0, 0> ArchetypeToInstanceMap;
var const PrefabSequence SequenceInstance;
var const int PI_PackageVersion;
var const int PI_LicenseePackageVersion;
var const array<byte> PI_Bytes;
var const array<Object> PI_CompleteObjects;
var const array<Object> PI_ReferencedObjects;
var const array<string> PI_SavedNames;
var native const map<0, 0> PI_ObjectMap;

defaultproperties
{
    PI_PackageVersion=-1
    PI_LicenseePackageVersion=-1
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.PrefabSprite'
        bIsScreenSizeScaled=true
        ScreenSize=0.0025
        SpriteCategoryName=Prefabs
        ReplacementPrimitive=none
        HiddenGame=true
        AlwaysLoadOnClient=false
        AlwaysLoadOnServer=false
    object end
    // Reference: SpriteComponent'Default__PrefabInstance.Sprite'
    Components(0)=Sprite
    CollisionType=ECollisionType.COLLIDE_CustomDefault
}