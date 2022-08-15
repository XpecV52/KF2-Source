/*******************************************************************************
 * FlexActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class FlexActor extends InterpActor
    native
    placeable
    hidecategories(Navigation);

defaultproperties
{
    begin object name=FlexComponent0 class=FlexComponent
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__FlexActor.MyLightEnvironment'
        BlockRigidBody=false
    object end
    // Reference: FlexComponent'Default__FlexActor.FlexComponent0'
    StaticMeshComponent=FlexComponent0
    LightEnvironment=DynamicLightEnvironmentComponent'Default__FlexActor.MyLightEnvironment'
    Components(0)=DynamicLightEnvironmentComponent'Default__FlexActor.MyLightEnvironment'
    begin object name=FlexComponent0 class=FlexComponent
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__FlexActor.MyLightEnvironment'
        BlockRigidBody=false
    object end
    // Reference: FlexComponent'Default__FlexActor.FlexComponent0'
    Components(1)=FlexComponent0
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    begin object name=StaticMeshComponent0 class=StaticMeshComponent
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__FlexActor.MyLightEnvironment'
    object end
    // Reference: StaticMeshComponent'Default__FlexActor.StaticMeshComponent0'
    CollisionComponent=StaticMeshComponent0
}