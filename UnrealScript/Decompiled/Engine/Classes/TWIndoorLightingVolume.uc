/*******************************************************************************
 * TWIndoorLightingVolume generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TWIndoorLightingVolume extends Volume
    native(TW)
    placeable
    hidecategories(Navigation,Object,Movement,Display);

var const LightingChannelContainer IndoorLightingChannel;
var const LightingChannelContainer OutdoorLightingChannel;

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, Vector HitLocation, Vector HitNormal)
{
    local Pawn P;

    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
    P = Pawn(Other);
    if(P != none)
    {
        ++ P.LightingVolumeEnterCount;
        P.SetMeshLightingChannels(IndoorLightingChannel);
    }
}

simulated event UnTouch(Actor Other)
{
    local Pawn P;

    super(Actor).UnTouch(Other);
    P = Pawn(Other);
    if(P != none)
    {
        if(P.LightingVolumeEnterCount > 0)
        {
            -- P.LightingVolumeEnterCount;
        }
        if(P.LightingVolumeEnterCount == 0)
        {
            P.SetMeshLightingChannels(OutdoorLightingChannel);
        }
    }
}

defaultproperties
{
    IndoorLightingChannel=(bInitialized=true,BSP=false,Static=false,Dynamic=false,CompositeDynamic=false,Skybox=false,Unnamed_1=false,Unnamed_2=false,Unnamed_3=false,Unnamed_4=false,Unnamed_5=false,Unnamed_6=false,Cinematic_1=false,Cinematic_2=false,Cinematic_3=false,Cinematic_4=false,Cinematic_5=false,Cinematic_6=false,Cinematic_7=false,Cinematic_8=false,Cinematic_9=false,Cinematic_10=false,Gameplay_1=false,Gameplay_2=false,Gameplay_3=false,Gameplay_4=false,Crowd=false,Indoor=true,Outdoor=false)
    OutdoorLightingChannel=(bInitialized=true,BSP=false,Static=false,Dynamic=false,CompositeDynamic=false,Skybox=false,Unnamed_1=false,Unnamed_2=false,Unnamed_3=false,Unnamed_4=false,Unnamed_5=false,Unnamed_6=false,Cinematic_1=false,Cinematic_2=false,Cinematic_3=false,Cinematic_4=false,Cinematic_5=false,Cinematic_6=false,Cinematic_7=false,Cinematic_8=false,Cinematic_9=false,Cinematic_10=false,Gameplay_1=false,Gameplay_2=false,Gameplay_3=false,Gameplay_4=false,Crowd=false,Indoor=false,Outdoor=true)
    bPawnsOnly=true
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__TWIndoorLightingVolume.BrushComponent0'
    BrushComponent=BrushComponent0
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__TWIndoorLightingVolume.BrushComponent0'
    Components(0)=BrushComponent0
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__TWIndoorLightingVolume.BrushComponent0'
    CollisionComponent=BrushComponent0
}