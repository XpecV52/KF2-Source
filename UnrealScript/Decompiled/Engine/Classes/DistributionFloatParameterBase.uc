/*******************************************************************************
 * DistributionFloatParameterBase generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DistributionFloatParameterBase extends DistributionFloatConstant
    abstract
    native
    editinlinenew
    collapsecategories
    hidecategories(Object,Object,Object);

enum DistributionParamMode
{
    DPM_Normal,
    DPM_Abs,
    DPM_Direct,
    DPM_MAX
};

var() name ParameterName;
var() float MinInput;
var() float MaxInput;
var() float MinOutput;
var() float MaxOutput;
var() DistributionFloatParameterBase.DistributionParamMode ParamMode;

defaultproperties
{
    MaxInput=1
    MaxOutput=1
}