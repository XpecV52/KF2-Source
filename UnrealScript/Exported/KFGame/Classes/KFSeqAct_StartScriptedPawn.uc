//=============================================================================
// KFSeqAct_StartScriptedPawn
//=============================================================================
// Action that activates a scripted pawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFSeqAct_StartScriptedPawn extends SeqAct_Latent;

// Whether pawn should be spawned in an inactive state
var() bool bSpawnInactivePawn;

static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

event VersionUpdated(int OldVersion, int NewVersion)
{
	local SeqVarLink UpdatedLink;

	if (OldVersion == 1 && NewVersion == 2)
	{
		UpdatedLink.ExpectedType = class'SeqVar_Object';
		UpdatedLink.LinkDesc = "KF Scripted Pawn Start";
		UpdatedLink.PropertyName = '';
		UpdatedLink.MaxVars = 1;
		VariableLinks[0] = UpdatedLink;

		UpdatedLink.ExpectedType = class'SequenceVariable';
		UpdatedLink.LinkDesc = "Set Initial Health From";
		UpdatedLink.PropertyName = '';
		UpdatedLink.MaxVars = 1;
		VariableLinks[1] = UpdatedLink;

		UpdatedLink.ExpectedType = class'SequenceVariable';
		UpdatedLink.LinkDesc = "Set Maximum Health From";
		UpdatedLink.PropertyName = '';
		UpdatedLink.MaxVars = 1;
		VariableLinks[2] = UpdatedLink;
	}
}

event Activated()
{
	local SequenceVariable SeqVar;
	local SeqVar_Object ObjVar;
	local KFScriptedPawnSpawner PawnStart, ReferencePawnStart;
	
	if (InputLinks[0].bHasImpulse)
	{
		// Grab our pawn start
		foreach LinkedVariables(class'SeqVar_Object', ObjVar, "KF Scripted Pawn Spawner")
		{
			PawnStart = KFScriptedPawnSpawner(ObjVar.GetObjectValue());
			break;
		}

		// Sanity
		if (PawnStart == none)
		{
			return;
		}

		// Grab our health
		foreach LinkedVariables(class'SequenceVariable', SeqVar, "Set Initial Health From")
		{
			if (SeqVar_Float(SeqVar) != none)
			{
				PawnStart.PawnHealth = SeqVar_Float(SeqVar).FloatValue;
				break;
			}
			else if (SeqVar_Object(SeqVar) != none)
			{
				ReferencePawnStart = KFScriptedPawnSpawner(SeqVar_Object(SeqVar).GetObjectValue());
				if (ReferencePawnStart != none)
				{
					if (ReferencePawnStart.Pawn != none)
					{
						PawnStart.ReferencePawn = ReferencePawnStart.Pawn;
						PawnStart.bUseReferencePawnHealth = true;
						break;
					}
				}
			}

			WarnInternal(self$"::Activated - 'Set Initial Health From' not set to a valid object (Float or KFScriptedPawnSpawner)");
			break;
		}

		// Grab our health
		foreach LinkedVariables(class'SequenceVariable', SeqVar, "Set Maximum Health From")
		{
			if (SeqVar_Float(SeqVar) != none)
			{
				PawnStart.PawnHealthMax = SeqVar_Float(SeqVar).FloatValue;
				break;
			}
			else if (SeqVar_Object(SeqVar) != none)
			{
				if (ReferencePawnStart == none)
				{
					ReferencePawnStart = KFScriptedPawnSpawner(SeqVar_Object(SeqVar).GetObjectValue());
				}

				if (ReferencePawnStart != none)
				{
					if (ReferencePawnStart.Pawn != none)
					{
						PawnStart.ReferencePawn = ReferencePawnStart.Pawn;
						PawnStart.bUseReferencePawnHealthMax = true;
						break;
					}
				}
			}

			WarnInternal(self$"::Activated - 'Set Maximum Health From' not set to a valid object (Float or KFScriptedPawnSpawner)");
			break;
		}

		PawnStart.StartPawn(bSpawnInactivePawn);

		// Because we want to pulse an output sometime in the future, this needs to be a latent action.
		// However, for latent actions to stay active, they need latent actors, and their latent actors
		// need to reference them. There are several ways to accomplish this, but some require native code
		// (which I want to avoid) and some require using Kismet differently than we currently do
		// (which I want to avoid). This is the slightly hacky way to get this action to stay active
		// until the pawn finishes its route, at which point an output is pulsed depending on the success
		// of the pawn.
		LatentActors.AddItem(PawnStart);
		PawnStart.LatentActions.AddItem(self);
		bAborted = false;
	}
}

function CheckPawnFinished(Pawn P)
{
	local SeqVar_Object ObjVar;
	local KFScriptedPawnSpawner PawnStart;

	foreach LinkedVariables(class'SeqVar_Object', ObjVar, "KF Scripted Pawn Spawner")
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
   VariableLinks(0)=(LinkDesc="KF Scripted Pawn Spawner",PropertyName=,MaxVars=1)
   VariableLinks(1)=(LinkDesc="Set Initial Health From",MaxVars=1)
   VariableLinks(2)=(LinkDesc="Set Maximum Health From",MaxVars=1)
   ObjName="Spawn Scripted Pawn"
   ObjCategory="Killing Floor"
   Name="Default__KFSeqAct_StartScriptedPawn"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
