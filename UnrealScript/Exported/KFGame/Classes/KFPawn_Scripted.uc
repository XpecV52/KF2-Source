//=============================================================================
// KFPawn_Scripted
//=============================================================================
// Pawn for scripted characters
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFPawn_Scripted extends KFPawn
	implements(KFInterface_TriggerOwner);

var localized string ScriptedPawnString;

// Character archetype for the pawn
var repnotify KFCharacterInfo_ScriptedPawn ScriptedCharArchTemplate;
var KFCharacterInfo_ScriptedPawn ScriptedCharArch;
var bool bCanCurrentlyBeTargetedByZeds;
var repnotify transient KFWeldableComponent WeldableComponent;
var repnotify transient KFWeldableTrigger WeldableTrigger;

var transient KFTrigger_NotifyOwner ProximityTrigger;
var transient bool bZedInProximity, bPlayerInProximity;

var repnotify byte CurrentState;
var byte PreviousState;

var transient repnotify bool bActive;
var transient bool bStartInactive;

var string IconPath;

delegate Delegate_OnReachedRouteMarker(int MarkerIdx, SplineActor Marker, int SubIdx);
delegate Delegate_OnEndedRoute(bool bSuccess);
delegate Delegate_OnTakeDamage();
delegate Delegate_OnChangeState(int CurrState, int PrevState);

replication
{
	if (bNetDirty)
		ScriptedCharArchTemplate, CurrentState, WeldableComponent, WeldableTrigger, bActive;
}

simulated event ReplicatedEvent(name VarName)
{
	switch (VarName)
	{
	case nameof(ScriptedCharArchTemplate):
		SetCharacterArch(ScriptedCharArchTemplate, true);

		// attempts to initialize weldable component will fail before we get our archetype
		InitializeWeldableComponent();
		break;

	case nameof(WeldableComponent):
		InitializeWeldableComponent();
		break;

	case nameof(WeldableTrigger):
		InitializeWeldableTrigger();
		break;

	case nameof(CurrentState):
		SetPawnState(CurrentState);
		break;

	case nameof(bActive):
		SetActive(bActive);
		break;

	default:
		super.ReplicatedEvent(VarName);
		break;
	}
}

function Initialize(KFCharacterInfo_ScriptedPawn InCharInfo, int InHealth, int InHealthMax)
{
	local int i;

	if (Role < ROLE_Authority)
	{
		return;
	}

	SetCharacterArch(InCharInfo, true);

	SetCollision(false, false);

	Health = Clamp(InHealth, 1, InHealthMax);
	HealthMax = InHealthMax;

	if (ScriptedCharArch.bPawnCanBeWelded || ScriptedCharArch.bPawnCanBeUnwelded)
	{
		InitializeWeldable();
	}

	// if pawn isn't allowed to die, then make sure any state set to a health percentage less than 1
	// gets set to something a little bit more than 1
	if (!ScriptedCharArch.bPawnCanBeKilled)
	{
		for (i = 0; i < ScriptedCharArch.States.Length; ++i)
		{
			ScriptedCharArch.States[i].HealthPctThreshold = FMax(ScriptedCharArch.States[i].HealthPctThreshold, (1.1f / float(HealthMax)));
		}
	}

	if (ScriptedCharArch.bUseZedProximityTrigger || ScriptedCharArch.bUsePlayerProximityTrigger)
	{
		InitializeProximityTrigger();
	}

	SetPawnState(0);
	UpdatePawnState();
	SetCanBeTargeted(false);

	if (ScriptedCharArch.bIsFlyingPawn)
	{
		SetPhysics(PHYS_Flying);
		bCollideWorld = false;
	}
	else
	{
		SetPhysics(PHYS_Walking);
		bCollideWorld = true; // must collide with world until it lands
	}
}

function InitializeWeldable()
{
	WeldableComponent = Spawn(class'KFWeldableComponent', self);
	InitializeWeldableComponent();

	WeldableTrigger = Spawn(class'KFWeldableTrigger', self);
	InitializeWeldableTrigger();

	WeldableTrigger.SetCollision(false, false);
	UpdateWeldIntegrity();
}

simulated function InitializeWeldableComponent()
{
	local float WeldCompRadius, WeldCompHeight;
	local KFGameReplicationInfo KFGRI;

	// If we don't have an archetype, wait for it
	// (InitializeWeldableComponent will be called from ReplicatedEvent)
	if (ScriptedCharArch != none && WeldableComponent != none)
	{
		KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

		WeldableComponent.SetOwner(self);
		WeldableComponent.SetBase(self);
		WeldableComponent.MaxWeldIntegrity = ScriptedCharArch.PawnMaxWeldIntegrityPerPlayer[KFGRI.GetNumPlayers()-1];
		if (Role == ROLE_Authority)
		{
			WeldableComponent.WeldIntegrity = WeldableComponent.MaxWeldIntegrity;
		}
		WeldableComponent.bWeldable = ScriptedCharArch.bPawnCanBeWelded;
		WeldableComponent.bUnweldable = ScriptedCharArch.bPawnCanBeUnwelded;
		WeldableComponent.Delegate_OnWeldIntegrityChanged = OnWelded;

		WeldCompRadius = WeldableComponent.GetCollisionCylinderRadius();
		WeldCompHeight = WeldableComponent.GetCollisionCylinderHeight();
		WeldableComponent.SetCollisionCylinderSize(WeldCompRadius * ScriptedCharArch.PawnWeldableComponentScale, WeldCompHeight);
		WeldableComponent.SetCollision(false, false);
	}
}

simulated function InitializeWeldableTrigger()
{
	if (WeldableTrigger != none)
	{
		WeldableTrigger.SetOwner(self);
		WeldableTrigger.SetBase(self);
		WeldableTrigger.WeldableComponent = WeldableComponent;
	}
}

simulated function InitializeProximityTrigger()
{
	local float TrigRadius, TrigHeight;

	ProximityTrigger = Spawn(class'KFTrigger_NotifyOwner', self);
	ProximityTrigger.SetOwner(self);
	ProximityTrigger.SetBase(self);

	TrigRadius = CylinderComponent(ProximityTrigger.CollisionComponent).CollisionRadius;
	TrigHeight = CylinderComponent(ProximityTrigger.CollisionComponent).CollisionHeight;
	CylinderComponent(ProximityTrigger.CollisionComponent).SetCylinderSize(TrigRadius * ScriptedCharArch.ProximityTriggerScale, TrigHeight);
}

simulated function OnWelded(int Amount, KFPawn Welder)
{
	local float WeldAmountPct;

	if (Role == ROLE_Authority && WeldableComponent != none)
	{
		WeldAmountPct = float(Amount) / float(WeldableComponent.MaxWeldIntegrity);
		Health += WeldAmountPct * float(HealthMax);

		UpdateWeldIntegrity();

		UpdatePawnState(1);
	}
}

simulated function UpdateWeldIntegrity()
{
	if (Role == ROLE_Authority && WeldableComponent != none)
	{
		// set weldintegrity based on current health, because health and weldintegrity can get out of sync due to rounding error
		WeldableComponent.SetWeldIntegrity((float(Health) / float(HealthMax)) * WeldableComponent.MaxWeldIntegrity);
	}
}

simulated function SetEscortPawnOnHud()
{
	local KFPlayerController KFPC;

	ForEach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		if (KFPC.MyGFxHUD != None && KFPC.MyGFxHUD.BossHealthBar != none)
		{
			KFPC.MyGFxHUD.BossHealthBar.SetEscortPawn(self);
		}
	}
}


simulated function RemoveEscortPawnOnHud()
{
	local KFPlayerController KFPC;

	ForEach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		if (KFPC.MyGFxHUD != None && KFPC.MyGFxHUD.BossHealthBar != none)
		{
			KFPC.MyGFxHUD.BossHealthBar.Deactivate();
		}
	}
}

/** Called from Possessed event when this controller has taken control of a Pawn */
function PossessedBy(Controller C, bool bVehicleTransition)
{
	Super.PossessedBy(C, bVehicleTransition);

	/** Set MyKFAIC for convenience to avoid casting */
	if (KFAIController(C) != none)
	{
		MyKFAIC = KFAIController(C);
	}

	KFGameInfo(WorldInfo.Game).Teams[0].AddToTeam(C);
}

simulated event byte ScriptGetTeamNum()
{
	return 0;
}

function AdjustDamage(out int InDamage, out vector Momentum, Controller InstigatedBy, vector HitLocation, class<DamageType> DamageType, TraceHitInfo HitInfo, Actor DamageCauser)
{
	if (InstigatedBy.GetTeamNum() == GetTeamNum() || !bCanCurrentlyBeTargetedByZeds || !bActive)
	{
		InDamage = 0;
	}
	else
	{
		super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);

		if (InDamage >= Health && !ScriptedCharArch.bPawnCanBeKilled)
		{
			InDamage = Max(Health - 1, 0);
		}
	}
}

event TakeDamage(int Damage, Controller InstigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local int OldHealth, ActualDamage;

	OldHealth = Health;
	Super.TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
	ActualDamage = OldHealth - Health;

	if (ActualDamage > 0)
	{
		if (WeldableComponent != none)
		{
			UpdateWeldIntegrity();
		}

		UpdatePawnState(-1);

		if (Delegate_OnTakeDamage != none)
		{
			Delegate_OnTakeDamage();
		}
	}
}

simulated function PlayTakeHitEffects(vector HitDirection, vector HitLocation, optional bool bUseHitImpulse = true)
{
	TryPlayHitReactionAnim(HitDirection, HitFxInfo.DamageType, HitFxInfo.HitBoneIndex);
}

/** Calculate type of hit reaction animation from damage info */
simulated function bool TryPlayHitReactionAnim(vector HitDirection, class<KFDamageType> damageType, byte HitZoneIdx)
{
	local EPawnOctant AnimDir;
	local EHitReactionAnimType HitReactionType;
	local EHitZoneBodyPart BodyPart;
	local bool bOnlyAdditiveHits;

	if( damageType == none || ActorTimeSince(NextHitReactionAnim_ActorTime) < 0 )
	{
		return false;
	}

	// cannot play hit reaction anims during special moves
	if ( IsDoingSpecialMove() )
	{
		bOnlyAdditiveHits = true;
		if ( !SpecialMoves[SpecialMove].bAllowHitReactions )
		{
			return false;
		}
	}

	// Set the limb used for incap effects
	BodyPart = (HitZoneIdx != 255 && HitZoneIdx < HitZones.Length) ? HitZones[HitZoneIdx].Limb : BP_Torso;

	HitReactionType = HIT_Light;
	// If we're moving (e.g. DoPauseAI wasn't called because of incap cooldown) don't try hard/medium
	// This is not 100% reliable, but worst case we get a reasonable upper body blend while moving
	bOnlyAdditiveHits = bOnlyAdditiveHits || VSizeSq(Velocity) > 50.f;

	if ( !bOnlyAdditiveHits )
	{
		HitReactionType = EHitReactionAnimType(AfflictionHandler.GetPredictedHitReaction(DamageType, BodyPart));
	}

	switch (BodyPart)
	{
	case BP_LeftArm:
		AnimDir = CalcOctagonRegion(Rotation, -HitDirection);
		if ( AnimDir == DIR_Forward || AnimDir == DIR_ForwardLeft || AnimDir == DIR_ForwardRight )
			AnimDir = DIR_ForwardLeft;
		else
			AnimDir = DIR_BackwardLeft;
		break;
	case BP_RightArm:
		AnimDir = CalcOctagonRegion(Rotation, -HitDirection);
		if ( AnimDir == DIR_Forward || AnimDir == DIR_ForwardLeft || AnimDir == DIR_ForwardRight )
			AnimDir = DIR_ForwardRight;
		else
			AnimDir = DIR_BackwardRight;
		break;
	default:
		AnimDir = CalcOctagonRegion(Rotation, -HitDirection);
		break;
	}

	// Play animation
	return PawnAnimInfo.PlayHitReactionAnim(self, HitReactionType, AnimDir);
}

simulated function bool CanBeHealed()
{
	return ScriptedCharArch.bPawnCanBeHealed;
}

event bool HealDamage(int Amount, Controller Healer, class<DamageType> DamageType, optional bool bRepairArmor=true, optional bool bMessageHealer=true)
{
	local bool result;

	if (!bActive || !ScriptedCharArch.bPawnCanBeHealed)
	{
		return false;
	}

	result = Super.HealDamage(Amount, Healer, DamageType, bRepairArmor, bMessageHealer);

	UpdateWeldIntegrity();
	UpdatePawnState(1);

	return result;
}

function UpdatePawnState(optional int HealthDelta = 0)
{
	local int i;
	local float HealthPct;

	HealthPct = float(Health) / float(HealthMax);

	if (HealthDelta > 0)
	{
		for (i = 0; i < CurrentState; ++i)
		{
			if (HealthPct >= ScriptedCharArch.States[i].HealthPctThreshold)
			{
				break;
			}
		}
	}
	else
	{
		for (i = CurrentState; i < ScriptedCharArch.States.Length - 1; ++i)
		{
			if (HealthPct >= ScriptedCharArch.States[i + 1].HealthPctThreshold)
			{
				break;
			}
		}
	}

	SetPawnState(i);
}

simulated function SetPawnState(int InState)
{
	if (Role == ROLE_Authority && InState == CurrentState)
	{
		return;
	}

	if (ScriptedCharArchTemplate != none)
	{
		if (CharacterArch == none)
		{
			// Make sure arch is set because this function could be called after ScriptedCharArchTemplate is
			// replicated but before ScriptedCharArchTemplate is repnotified
			SetCharacterArch(ScriptedCharArchTemplate, true);
		}

		if (Role == ROLE_Authority)
		{
			CurrentState = InState;
			SetCanBeTargeted(ScriptedCharArch.States[InState].bCanBeTargetedByZeds);
		}

		if (CurrentState != PreviousState)
		{
			UpdatePawnSpeed();

			StopExtraVFX(Name("EnterState"$PreviousState));
			PlayExtraVFX(Name("ExitState"$PreviousState));
			PlayExtraVFX(Name("EnterState"$CurrentState));

			DoSpecialMove(SM_ScriptedPawnStateChange, true);
		}

		if (Delegate_OnChangeState != none)
		{
			Delegate_OnChangeState(CurrentState, PreviousState);
		}

		PreviousState = CurrentState;
	}
}

function UpdatePawnSpeed()
{
	GroundSpeed = ScriptedCharArch.PawnSpeed * ScriptedCharArch.States[CurrentState].SpeedScalar;

	if (ScriptedCharArch.bUseZedProximityTrigger && bZedInProximity)
	{
		GroundSpeed *= ScriptedCharArch.SpeedScalarForZedProximity;
	}

	if (ScriptedCharArch.bUsePlayerProximityTrigger && bPlayerInProximity)
	{
		GroundSpeed *= ScriptedCharArch.SpeedScalarForPlayerProximity;
	}
}

simulated function bool IsInCriticalCondition()
{
	return CurrentState == ScriptedCharArch.States.Length - 1;
}

simulated function name GetStateTransitionAnim()
{
	if (CurrentState != PreviousState)
	{
		if (ScriptedCharArch.States[CurrentState].EnterAnim != '')
		{
			return ScriptedCharArch.States[CurrentState].EnterAnim;
		}
		else if (PreviousState != 255 && ScriptedCharArch.States[PreviousState].ExitAnim != '')
		{
			return ScriptedCharArch.States[PreviousState].ExitAnim;
		}
	}

	return '';
}

simulated function SetCharacterArch(KFCharacterInfoBase Info, optional bool bForce)
{
	local int i, j;
	local ExtraVFXInfo FX;

	super.SetCharacterArch(Info, bForce);

	// SetCharacterArch sets CharacterArch, which is an instance of Info and can't be replicated,
	// so replicate the template (Info) instead
	if (Role == ROLE_Authority)
	{
		ScriptedCharArchTemplate = KFCharacterInfo_ScriptedPawn(Info);
	}

	ScriptedCharArch = KFCharacterInfo_ScriptedPawn(CharacterArch);

	// copy state effects to ExtraVFX array so we can use that system
	// must be setup before updating pawn state

	// normally ExtraVFX has start and stop SFX events, but EnterFX will handle the start and ExitFX
	// will handle the stop
	for (i = 0; i < ScriptedCharArch.States.Length; ++i)
	{
		for (j = 0; j < ScriptedCharArch.States[i].EnterFX.Length; ++j)
		{
			FX.VFX = ScriptedCharArch.States[i].EnterFX[j].VFX;
			FX.SFXStartEvent = ScriptedCharArch.States[i].EnterFX[j].SFX;
			FX.SocketName = ScriptedCharArch.States[i].EnterFX[j].SocketName;
			FX.Label = Name("EnterState"$i);
			CharacterArch.ExtraVFX.AddItem(FX);
		}

		for (j = 0; j < ScriptedCharArch.States[i].ExitFX.Length; ++j)
		{
			FX.VFX = ScriptedCharArch.States[i].ExitFX[j].VFX;
			FX.SFXStartEvent = ScriptedCharArch.States[i].ExitFX[j].SFX;
			FX.SocketName = ScriptedCharArch.States[i].ExitFX[j].SocketName;
			FX.Label = Name("ExitState"$i);
			CharacterArch.ExtraVFX.AddItem(FX);
		}
	}
}

function bool Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
	local KFAIController KFAIC;

	KFAIC = KFAIController(Controller);
	if (KFAIC != none && KFAIC.CommandList != none)
	{
		KFAIC.AbortCommand(KFAIC.CommandList);
	}

	return super.Died(Killer, damageType, HitLocation);
}

function HandleMomentum(vector Momentum, Vector HitLocation, class<DamageType> DamageType, optional TraceHitInfo HitInfo)
{
	if (ScriptedCharArch.bPawnHandlesMomentum)
	{
		super.HandleMomentum(Momentum, HitLocation, DamageType, HitInfo);
	}
}

function bool CanBeGrabbed(KFPawn GrabbingPawn, optional bool bIgnoreFalling, optional bool bAllowSameTeamGrab)
{
	return ScriptedCharArch.bPawnCanBeGrabbed;
}

event Landed(vector HitNormal, Actor FloorActor)
{
	super.Landed(HitNormal, FloorActor);
	bCollideWorld = false;
}

function StartRoute(SplineActor SplineStart, SplineActor SplineEnd, int SegmentGranularity)
{
	class'AICommand_ScriptedPawn_TraverseSpline'.static.TraverseSpline(MyKFAIC, SplineStart, SplineEnd, SegmentGranularity);
}

function ReachedRouteMarker(int MarkerIdx, SplineActor Marker, int SubIdx)
{
	if (Delegate_OnReachedRouteMarker != none)
	{
		Delegate_OnReachedRouteMarker(MarkerIdx, Marker, SubIdx);
	}
}

// ReachedGoal is called when the pawn successfully completes its scripted route
function ReachedGoal()
{
	FinishSequence();
	Finish(false);
}

// EndedRoute is called when the pawn either reaches the last node in the route (and should disappear)
// or dies and does not reach its goal
function EndedRoute(bool bSuccess)
{
	FinishSequence();

	if (bSuccess)
	{
		Finish(true);
	}

	if (Delegate_OnEndedRoute != none)
	{
		Delegate_OnEndedRoute(bSuccess);
	}
}

// Allow the sequence action to resolve itself
// NOTE: Must be called before "Finish"
function FinishSequence()
{
	local int i;
	local Sequence GameSeq;
	local array<SequenceObject> AllPawnStartActions;

	GameSeq = WorldInfo.GetGameSequence();
	if (GameSeq != None)
	{
		// find any matinee actions that exist
		GameSeq.FindSeqObjectsByClass(class'KFSeqAct_StartScriptedPawn', true, AllPawnStartActions);
		for (i = 0; i < AllPawnStartActions.Length; i++)
		{
			KFSeqAct_StartScriptedPawn(AllPawnStartActions[i]).CheckPawnFinished(self);
		}
	}
}

// Stuff that happens when the pawn starts its route
function Start()
{
	SetCollision(true, true);

	if (WeldableComponent != none)
	{
		WeldableComponent.SetCollision(bActive, false);
	}

	if (WeldableTrigger != none)
	{
		WeldableTrigger.SetCollision(bActive, false);
	}

	UpdatePawnState();

	if (bStartInactive)
	{
		SetActive(false);
	}
}

// Stuff that happens when the pawn ends its route
function Finish(bool bHide)
{
	if (bHide)
	{
		SetPhysics(PHYS_None);
		SetHidden(true);
	}

	SetCollision(false, false);
	bPlayedDeath = true; // forces zeds to find a new target
	SetCanBeTargeted(false); // prevents zeds from re-targeting

	if (WeldableComponent != none)
	{
		WeldableComponent.SetCollision(false, false);
	}

	if (WeldableTrigger != none)
	{
		WeldableTrigger.SetCollision(false, false);
	}

	SetActive(false);
}

simulated event Bump(Actor Other, PrimitiveComponent OtherComp, Vector HitNormal)
{
	local vector ToOther;
	if (KFPawn(Other) != none)
	{
		ToOther = Normal(Other.Location - Location);
		if ((ToOther Dot HitNormal) < 0)
		{
			// This is the case where the scripted pawn bumps into another pawn.
			// Move the pawn.
			KFPawn(Other).AddVelocity(HitNormal*(-ScriptedCharArch.PawnBumpImpulse), vect(0,0,0), none);
		}
		else
		{
			// This is the case where another pawn bumps into the scripted pawn.
			// Probably don't need to do anything.
		}
	}
}

function bool CanAITargetThisPawn(Controller TargetingController)
{
    return bCanCurrentlyBeTargetedByZeds;
}

function SetCanBeTargeted(bool InCanBeTargeted)
{
	local bool bCouldPreviouslyBeTargetedByZeds;
	local KFPawn_Monster KFPM;

	bCouldPreviouslyBeTargetedByZeds = bCanCurrentlyBeTargetedByZeds;
	bCanCurrentlyBeTargetedByZeds = ScriptedCharArch != none && ScriptedCharArch.States[CurrentState].bCanBeTargetedByZeds && InCanBeTargeted;
	if (bCouldPreviouslyBeTargetedByZeds && !bCanCurrentlyBeTargetedByZeds)
	{
		foreach WorldInfo.AllPawns(class'KFPawn_Monster', KFPM)
		{
			if (KFPM.GetEnemy() == self)
			{
				KFAIController(KFPM.Controller).FindNewEnemy();
			}
		}
	}
}

simulated function Texture2D GetStateIconTexture()
{
	if (CurrentState == 255)
	{
		return none;
	}

	return ScriptedCharArch.States[CurrentState].Icon;
}

function NotifyTriggerTouch(KFTrigger_NotifyOwner Sender, Actor Toucher, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	local KFPawn_Monster Zed;
	local KFPawn_Human Player;

	if (Sender == ProximityTrigger)
	{
		if (ScriptedCharArch.bUseZedProximityTrigger)
		{
			Zed = KFPawn_Monster(Toucher);
			if (Zed != none)
			{
				bZedInProximity = true;

				// aggro
				if (bCanCurrentlyBeTargetedByZeds && KFAIController(Zed.Controller) != none)
				{
					KFAIController(Zed.Controller).SetEnemy(self);
				}
			}
		}

		if (ScriptedCharArch.bUsePlayerProximityTrigger)
		{
			Player = KFPawn_Human(Toucher);
			if (Player != none)
			{
				bPlayerInProximity = true;
			}
		}

		UpdatePawnSpeed();
	}
}

function NotifyTriggerUnTouch(KFTrigger_NotifyOwner Sender, Actor UnToucher)
{
	local KFPawn_Monster Zed;
	local KFPawn_Human Player;

	if (Sender == ProximityTrigger)
	{
		if (ScriptedCharArch.bUseZedProximityTrigger)
		{
			Zed = KFPawn_Monster(UnToucher);
			if (Zed != none)
			{
				bZedInProximity = false;
				foreach ProximityTrigger.TouchingActors(class'KFPawn_Monster', Zed)
				{
					if (Zed != UnToucher)
					{
						bZedInProximity = true;
						break;
					}
				}
			}
		}

		if (ScriptedCharArch.bUsePlayerProximityTrigger)
		{
			Player = KFPawn_Human(UnToucher);
			if (Player != none)
			{
				bPlayerInProximity = false;
				foreach ProximityTrigger.TouchingActors(class'KFPawn_Human', Player)
				{
					if (Player != UnToucher)
					{
						bPlayerInProximity = true;
						break;
					}
				}
			}
		}

		UpdatePawnSpeed();
	}
}

simulated function SetActive(bool InActive)
{
	if (Role == ROLE_Authority)
	{
		if (bActive == InActive)
		{
			// Don't retrigger activation events if we are already active/unactive.
			return;
		}

		bActive = InActive;
		SetCanBeTargeted(bActive);
		UpdateWeldIntegrity();
		UpdatePawnSpeed();
	}

	if (WeldableComponent != none)
	{
		WeldableComponent.SetCollision(bActive, false);
	}

	if (WeldableTrigger != none)
	{
		WeldableTrigger.SetCollision(bActive, false);
	}

	if (InActive)
	{
		SetEscortPawnOnHud();
	}
	else
	{
		//hide boss healthbar
		RemoveEscortPawnOnHud();
	}

}

simulated function bool ShouldShowOnHUD()
{
	return bActive;
}

simulated function float GetHealthPercent()
{
	return fclamp(float(Health) / float(HealthMax), 0.0f, 1.0f);
}

static function string GetLocalizedName()
{
	return default.ScriptedPawnString;
}

simulated function string GetIconPath()
{
	return IconPath;
}

defaultproperties
{
   ScriptedPawnString="V.I.P."
   CurrentState=255
   PreviousState=255
   IconPath="ZED_Patriarch_UI.ZED-VS_Icon_Boss"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   LeftFootBoneName=
   RightFootBoneName=
   LeftHandBoneName=
   RightHandBoneName=
   HeadBoneName=
   TorsoBoneName=
   PelvisBoneName=
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'KFGame.Default__KFPawn:Afflictions_0'
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'KFGame.Default__KFPawn:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'KFGame.Default__KFPawn_Scripted:Afflictions_0'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'KFGame.Default__KFPawn:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=None
      SpecialMoveClasses(2)=None
      SpecialMoveClasses(3)=None
      SpecialMoveClasses(4)=None
      SpecialMoveClasses(5)=None
      SpecialMoveClasses(6)=None
      SpecialMoveClasses(7)=None
      SpecialMoveClasses(8)=None
      SpecialMoveClasses(9)=None
      SpecialMoveClasses(10)=None
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=None
      SpecialMoveClasses(13)=None
      SpecialMoveClasses(14)=None
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=None
      SpecialMoveClasses(21)=None
      SpecialMoveClasses(22)=None
      SpecialMoveClasses(23)=None
      SpecialMoveClasses(24)=None
      SpecialMoveClasses(25)=None
      SpecialMoveClasses(26)=None
      SpecialMoveClasses(27)=None
      SpecialMoveClasses(28)=None
      SpecialMoveClasses(29)=None
      SpecialMoveClasses(30)=None
      SpecialMoveClasses(31)=None
      SpecialMoveClasses(32)=None
      SpecialMoveClasses(33)=None
      SpecialMoveClasses(34)=None
      SpecialMoveClasses(35)=None
      SpecialMoveClasses(36)=None
      SpecialMoveClasses(37)=None
      SpecialMoveClasses(38)=None
      SpecialMoveClasses(39)=None
      SpecialMoveClasses(40)=None
      SpecialMoveClasses(41)=None
      SpecialMoveClasses(42)=Class'KFGame.KFSM_PlaySingleAnim_ScriptedPawn'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'KFGame.Default__KFPawn_Scripted:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_Scripted:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   AccelRate=0.000000
   ControllerClass=Class'KFGame.KFAIController_ScriptedPawn'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:KFPawnSkeletalMeshComponent'
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bUpdateKinematicBonesFromAnimation=False
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      bChartDistanceFactor=True
      ReplacementPrimitive=None
      RBChannel=RBCC_Pawn
      RBDominanceGroup=20
      bOwnerNoSee=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      CollideActors=True
      BlockZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,Pawn=True,Vehicle=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-86.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=2500.000000
      bAllowPerObjectShadows=True
      TickGroup=TG_DuringAsyncWork
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPawn:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=36.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPawn:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPawn:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPawn:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPawn:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPawn:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   bAlwaysRelevant=True
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_Scripted"
   ObjectArchetype=KFPawn'KFGame.Default__KFPawn'
}