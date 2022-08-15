/*******************************************************************************
 * PBRuleNodeSize generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PBRuleNodeSize extends PBRuleNodeBase
    native(ProcBuilding)
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

/** Axis to check size of */
var() ProcBuildingRuleset.EProcBuildingAxis SizeAxis;
/** If size if less than this, fire < output, otherwise fire >= */
var() float DecisionSize;
/** If TRUE, uses the size of the entire building face, rather than just the area passed in to this rule */
var() bool bUseTopLevelScopeSize;

defaultproperties
{
    DecisionSize=512
    NextRules(0)=(NextRule=none,LinkName=Less,DrawY=0)
    NextRules(1)=(NextRule=none,LinkName=Greater/Equal,DrawY=0)
}