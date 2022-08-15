/*******************************************************************************
 * MaterialExpressionDepthOfFieldFunction generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MaterialExpressionDepthOfFieldFunction extends MaterialExpression
    native(Material)
    hidecategories(Object);

enum EDepthOfFieldFunctionValue
{
    TDOF_NearAndFarMask,
    TDOF_NearMask,
    TDOF_FarMask,
    TDOF_MAX
};

/** Determines the mapping place to use on the terrain. */
var() MaterialExpressionDepthOfFieldFunction.EDepthOfFieldFunctionValue FunctionValue;
var ExpressionInput Depth;

defaultproperties
{
    MenuCategories(0)=Utility
}