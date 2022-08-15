/*******************************************************************************
 * MaterialExpressionTerrainLayerWeight generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MaterialExpressionTerrainLayerWeight extends MaterialExpression
    native(Material)
    collapsecategories
    hidecategories(Object,Object);

var native const transient Pointer InstanceOverride;
var ExpressionInput Base;
var ExpressionInput Layer;
var() name ParameterName;
var() float PreviewWeight;
var const Guid ExpressionGUID;

defaultproperties
{
    bIsParameterExpression=true
    bUsedByStaticParameterSet=true
    MenuCategories(0)=Terrain
    MenuCategories(1)=WorldPosOffset
}