/*******************************************************************************
 * ApexDestructibleDamageParameters generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ApexDestructibleDamageParameters extends Object
    native(Physics)
    hidecategories(Object);

enum EDamageParameterOverrideMode
{
    DPOM_Absolute,
    DPOM_Multiplier,
    DPOM_MAX
};

struct native DamageParameters
{
    var() ApexDestructibleDamageParameters.EDamageParameterOverrideMode OverrideMode;
    var() float BaseDamage;
    var() float Radius;
    var() float Momentum;

    structdefaultproperties
    {
        OverrideMode=EDamageParameterOverrideMode.DPOM_Absolute
        BaseDamage=0
        Radius=0
        Momentum=0
    }
};

struct native DamagePair
{
    var() name DamageCauserName;
    var() DamageParameters Params;

    structdefaultproperties
    {
        DamageCauserName=None
        Params=(OverrideMode=EDamageParameterOverrideMode.DPOM_Absolute,BaseDamage=0,Radius=0,Momentum=0)
    }
};

var() array<DamagePair> DamageMap;
