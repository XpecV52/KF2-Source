//=============================================================================
// KFSeqAct_RestartScriptedPawn
//=============================================================================
// Action that takes an existing scripted pawn and starts it on a new path
// Based on KFSeqAct_StartScriptedPawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFSeqAct_RestartScriptedPawn extends SeqAct_Latent;

// Whether pawn should be spawned in an inactive state
var() bool bSpawnInactivePawn;

event Activated()
{
	local SequenceVariable SeqVar;
	local SeqVar_Object ObjVar;
	local KFScriptedPawnSpawner OldPawnSpawner, NewPawnSpawner;
	
	if (InputLinks[0].bHasImpulse)
	{
		// Grab our pawn start
		foreach LinkedVariables(class'SeqVar_Object', ObjVar, "Old KF Scripted Pawn Spawner")
		{
			OldPawnSpawner = KFScriptedPawnSpawner(ObjVar.GetObjectValue());
			break;
		}

		foreach LinkedVariables(class'SeqVar_Object', ObjVar, "New KF Scripted Pawn Spawner")
		{
			NewPawnSpawner = KFScriptedPawnSpawner(ObjVar.GetObjectValue());
			break;
		}
		
		// Sanity
		if (OldPawnSpawner == none || NewPawnSpawner == none)
		{
			return;
		}

		// Grab our health
		foreach LinkedVariables(class'SequenceVariable', SeqVar, "Set Initial Health From")
		{
			if (SeqVar_Float(SeqVar) != none)
			{
				NewPawnSpawner.PawnHealth = SeqVar_Float(SeqVar).FloatValue;
				break;
			}

			WarnInternal(self$"::Activated - 'Set Initial Health From' not set to a valid object (Float or KFScriptedPawnSpawner)");
			break;
		}

		// Grab our health
		foreach LinkedVariables(class'SequenceVariable', SeqVar, "Set Maximum Health From")
		{
			if (SeqVar_Float(SeqVar) != none)
			{
				NewPawnSpawner.PawnHealthMax = SeqVar_Float(SeqVar).FloatValue;
				break;
			}

			WarnInternal(self$"::Activated - 'Set Maximum Health From' not set to a valid object (Float or KFScriptedPawnSpawner)");
			break;
		}

		NewPawnSpawner.StartPawn(bSpawnInactivePawn, OldPawnSpawner.Pawn);

		// Because we want to pulse an output sometime in the future, this needs to be a latent action.
		// However, for latent actions to stay active, they need latent actors, and their latent actors
		// need to reference them. There are several ways to accomplish this, but some require native code
		// (which I want to avoid) and some require using Kismet differently than we currently do
		// (which I want to avoid). This is the slightly hacky way to get this action to stay active
		// until the pawn finishes its route, at which point an output is pulsed depending on the success
		// of the pawn.
		LatentActors.AddItem(NewPawnSpawner);
		NewPawnSpawner.LatentActions.AddItem(self);
		bAborted = false;
	}
}

function CheckPawnFinished(Pawn P)
{
	local SeqVar_Object ObjVar;
	local KFScriptedPawnSpawner PawnStart;

	foreach LinkedVariables(class'SeqVar_Object', ObjVar, "New KF Scripted Pawn Spawner")
	{
		PawnStart = KFScriptedPawnSpawner(ObjVar.GetObjectValue());
		break;
	}

	if (PawnStart != none)
	{
		if (PawnStart.Pawn == P)
		{
			if (!PawnStart.Pawn.IsAliveAndWell())
			{
				bAborted = true;
			}

			PawnStart.LatentActions.RemoveItem(self);

			// Removing latent actors is what causes this latent action to end and be deactivated
			LatentActors.RemoveItem(PawnStart);
		}
	}
}

defaultproperties
{
   bCallHandler=False
   bAutoActivateOutputLinks=False
   InputLinks(0)=(LinkDesc="Start")
   OutputLinks(0)=(LinkDesc="Finish")
   OutputLinks(1)=(LinkDesc="Fail")
   VariableLinks(0)=(LinkDesc="Old KF Scripted Pawn Spawner",PropertyName=,MaxVars=1)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="New KF Scripted Pawn Spawner",MaxVars=1)
   VariableLinks(2)=(LinkDesc="Set Initial Health From",MaxVars=1)
   VariableLinks(3)=(LinkDesc="Set Maximum Health From",MaxVars=1)
   ObjName="Restart Existing Scripted Pawn"
   ObjCategory="Killing Floor"
   Name="Default__KFSeqAct_RestartScriptedPawn"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
