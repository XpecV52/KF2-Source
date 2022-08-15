/*******************************************************************************
 * MobileTouchInputVolume generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MobileTouchInputVolume extends Volume
    hidecategories(Navigation,Object,Movement,Display)
    implements(TouchableElement3D);

var bool bEnabled;

simulated function OnToggle(SeqAct_Toggle inAction)
{
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            if(inAction.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    super.OnToggle(inAction);
}

function HandleClick()
{
    if(bEnabled)
    {
        TriggerEventClass(Class'SeqEvent_MobileTouchInputVolume', self, 1);
    }
}

function HandleDoubleClick()
{
    if(bEnabled)
    {
        TriggerEventClass(Class'SeqEvent_MobileTouchInputVolume', self, 2);
    }
}

function HandleDragOver()
{
    if(bEnabled)
    {
        TriggerEventClass(Class'SeqEvent_MobileTouchInputVolume', self, 0);
    }
}

defaultproperties
{
    bEnabled=true
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__MobileTouchInputVolume.BrushComponent0'
    BrushComponent=BrushComponent0
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__MobileTouchInputVolume.BrushComponent0'
    Components(0)=BrushComponent0
    bStatic=false
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__MobileTouchInputVolume.BrushComponent0'
    CollisionComponent=BrushComponent0
    SupportedEvents=/* Array type was not detected. */
}