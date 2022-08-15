/*******************************************************************************
 * MaterialExpressionFontSampleParameter generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MaterialExpressionFontSampleParameter extends MaterialExpressionFontSample
    native(Material)
    collapsecategories
    hidecategories(Object,Object,Object);

/** name to be referenced when we want to find and set thsi parameter */
var() name ParameterName;
var const Guid ExpressionGUID;
/** The name of the parameter Group to display in MaterialInstance Editor. Default is None group */
var() name Group;

defaultproperties
{
    bIsParameterExpression=true
    MenuCategories(0)=Font
    MenuCategories(1)=Parameters
}