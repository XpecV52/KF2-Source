/*******************************************************************************
 * KFHUDTimerHelper generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFHUDTimerHelper extends Actor
    notplaceable
    hidecategories(Navigation);

function UpdateTickDisabled(bool bInDisabled)
{
    SetTickIsDisabled(bInDisabled);
}

defaultproperties
{
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    bAlwaysTick=true
}