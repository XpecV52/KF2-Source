/*******************************************************************************
 * MaterialExpressionParticleMacroUV generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MaterialExpressionParticleMacroUV extends MaterialExpression
    native(Material)
    hidecategories(Object);

/** Whether to calculate the UVs in View space, which gives a slightly different UV position based on depth and creates a parallax effect, at the cost of texture swimming. */
var() bool bUseViewSpace;

defaultproperties
{
    MenuCategories(0)=Particles
}