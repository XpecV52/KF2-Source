//=============================================================================
// KFSeqAct_MinigameActivateGenerator
//=============================================================================
// Action for starting the minigame generator via Kismet, rather than through
//      user interaction.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

class KFSeqAct_MinigameActivateGenerator extends SequenceAction;

var() KFTrigger_MinigameGenerator Generator;

event Activated()
{
    if (Generator != none)
    {
        if (InputLinks[0].bHasImpulse)
        {
            Generator.UsedBy(none);
        }
        else if (InputLinks[1].bHasImpulse)
        {
            Generator.DeactivateMinigames();
        }
    }    
}

defaultproperties
{
   InputLinks(0)=(LinkDesc="Activate")
   InputLinks(1)=(LinkDesc="Deactivate")
   VariableLinks(0)=(LinkDesc="Generator",PropertyName="Generator")
   ObjName="Activate Generator"
   ObjCategory="Killing Floor"
   Name="Default__KFSeqAct_MinigameActivateGenerator"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
