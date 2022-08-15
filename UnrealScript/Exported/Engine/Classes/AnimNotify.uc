/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class AnimNotify extends Object
	native(Anim)
	abstract
	editinlinenew
	hidecategories(Object)
	collapsecategories;

/** Color of Notify in editor */
var editoronly Color NotifyColor;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated function bool FindNextNotifyOfClass(AnimNodeSequence AnimSeqInstigator, class<AnimNotify> NotifyClass, out AnimNotifyEvent OutEvent)
{
	local AnimSequence Seq;
	local int i;
	local bool bFoundThis;

	if(AnimSeqInstigator.AnimSeq != None)
	{
		// we look through the notifies to find the end that corresponds to this start
		Seq = AnimSeqInstigator.AnimSeq;
		for(i=0; i<Seq.Notifies.length; i++)
		{
			// Found us - remember the time
			if(Seq.Notifies[i].Notify == self)
			{
				bFoundThis = TRUE;
			}

			// First notify of desired class after this 'start'
			if(bFoundThis && ClassIsChildOf(Seq.Notifies[i].Notify.Class, NotifyClass))
			{
				// Copy info from event
				OutEvent = Seq.Notifies[i];
				// and set bool
				return TRUE;
			}
		}
	}
	
	return false;
}

defaultproperties
{
   NotifyColor=(B=200,G=200,R=255,A=255)
   Name="Default__AnimNotify"
   ObjectArchetype=Object'Core.Default__Object'
}
