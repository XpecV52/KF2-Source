/*******************************************************************************
 * SpeedTree generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SpeedTree extends Object
    native(SpeedTree);

var private const bool bLegacySpeedTree;
var duplicatetransient native const Pointer SRH;
/** The probability of a shadow ray being blocked by the leaf material. */
var(Lighting) float LeafStaticShadowOpacity;
/** Branch 1 material. */
var(Material) MaterialInterface Branch1Material;
/** Branch 2 material. */
var(Material) MaterialInterface Branch2Material;
/** Frond material. */
var(Material) MaterialInterface FrondMaterial;
/** Leaf card material. */
var(Material) MaterialInterface LeafCardMaterial;
/** Leaf mesh material. */
var(Material) MaterialInterface LeafMeshMaterial;
/** Billboard material. */
var(Material) MaterialInterface BillboardMaterial;
/** Wind variables */
var(Wind) float WindStrength;
var(Wind) Vector WindDirection;
var private editoronly const Guid LightingGuid;

defaultproperties
{
    LeafStaticShadowOpacity=0.5
    WindStrength=0.2
    WindDirection=(X=1,Y=0,Z=0)
}