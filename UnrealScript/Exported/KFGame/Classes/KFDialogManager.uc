//=============================================================================
// KFDialogManager
//=============================================================================
// Manager class for player dialog. Tracks delays, cooldowns, active dialog, etc.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================

class KFDialogManager extends Actor
    dependson(KFPawnVoiceGroupEventData)
    config(Game);







































































































































































































































































































































































	




	




	




	














	




	














	












































































#linenumber 15

var bool bEnabled;
var config bool bLogDialog;

/** Information about dialog that has been spoken and is cooling down */
struct DialogCoolDownInfo
{
    var int     EventID;
    var KFPawn  Speaker;
    var float   EndTime;
    var vector  Location;
};

/** Event info for events that are cooling down */
var array< DialogCoolDownInfo >     CoolDowns;

/** We only update one player pawn per "spotted" update, so we need to remember who's next */
var transient Pawn NextSpotterPawn;

/** Last time we checked if there should be "spotted" dialog */
var transient float LastSpotUpdateTime;

struct DelayedDialogInfo
{
    var KFPawn          Speaker;
    var int             EventID;
    var float           EndTime;
};

/** Event info for events that have a delay */
var array< DelayedDialogInfo > DelayedDialog;

/** Last time we checked if there should be idle dialog */
var float               LastIdleUpdateTime;

/** Dialog at this priority level and above are considered "urgent" and will interrupt dialog of lower priority */
var byte                InterruptPriorityThreshold;
/** Dialog at this priority level and below can be interrupted by any higher-priority dialog, disregarding InterruptPriorityThreshold */
var byte                InterruptedByAnyPriorityThreshold;

/** Set at beginning of wave and beginning of trader time */
var bool                bIsTraderTime;


// Variables to control dialog

// welding
var int     WeldAboutToBreakThreshold;

// healing
var float   NeedMoreHealingPctThreshold;
var float   NeedNoMoreHealingPctThreshold;

// dosh
var int     CaughtSomeDoshAmt;
var int     CaughtMuchDoshAmt;

// reload/ammo
var int     NumZedsForPressureReload;
var float   LowSpareAmmoPctThreshold;

// kill zed
var int     NumKillsForOnARoll;
var float   CloseCallKillHealthPctThreshold;

var int     NumZedsInAreaForMassacre;
var float   AreaRadiusForMassacre;
var float   TimeLimitForMassacre;

// zed damage
var int     NumHitsForDeadHorse;
var float   TimeBetweenHitsForDeadHorse;

var float   TimeForContinuousDamageThreshold;
var float   TimeBetweenHitsForContinuousDamage;

// player damage
var float   PlayerHealthPctForNearDeath;
var float   PlayerTakeDamageStreakInterval;
var float   PlayerTakeDamageStreakPctForScream;

// spot zed
var float   IdleTimeforSpottingZed;
var int     SpotLargeHordeNumZeds;

var float   ZedAlmostDeadHealthPctThreshold;

var float   SprintTowardZedDuration;

// situational/idle
var float   IdleTimeForSituationalDialog;
var int     IdleLowDoshThreshold;
var int     IdleHighDoshThreshold;

var int     IdleLowAmmoPctThreshold;
var int     IdleHighAmmoPctThreshold;

// sprinting
var float   TimeUntilStartSprintPanting;

// global AkEvents
var AkEvent StopBreathingAkEvent;

/** Same as defined in KFPawn_HUman. This one should always match that one. */
delegate OnFinishedDialog( const out DialogResponseInfo ResponseInfo );

/*****************************************************************************
* Utility functions for getting event data
*****************************************************************************/

/** Gets the radius within which the event can occur */
function float GetEventRadius( int EventID, class< KFPawnVoiceGroupEventData > EventDataClass )
{
    if( EventDataClass != none )
    {
        return EventDataClass.default.Events[EventID].Radius;
    }

    WarnInternal("KFDialogManager::GetEventRadius - EventDataClass is none, using probably useless default value");
    return 0.f;
}

/** Get the event radius squared */
function float GetEventRadiusSq( int EventID, class< KFPawnVoiceGroupEventData > EventDataClass )
{
    local float Rad;

    Rad = GetEventRadius( EventID, EventDataClass );

    return Rad * Rad;
}

/** Gets the field-of-view within which the event can occur */
function float GetEventFOV( int EventID, class< KFPawnVoiceGroupEventData > EventDataClass )
{
    if( EventDataClass != none )
    {
        return EventDataClass.default.Events[EventID].FOV;
    }

    WarnInternal("KFDialogManager::GetEventFOV - EventDataClass is none, using probably useless default value");
    return 0.f;
}

/** Gets the priority of the event */
function byte GetEventPriority( int EventID, class< KFPawnVoiceGroupEventData > EventDataClass )
{
    if( EventDataClass != none )
    {
        return EventDataClass.default.Events[EventID].Priority;
    }

    WarnInternal("KFDialogManager::GetEventPriority - EventDataClass is none, using probably useless default value");
    return 255;
}

/** Gets the cooldown of the event */
function float GetEventCoolDownTime( int EventID, class< KFPawnVoiceGroupEventData > EventDataClass )
{
    if( EventDataClass != none )
    {
        return EventDataClass.default.Events[EventID].CoolDownTime;
    }

    WarnInternal("KFDialogManager::GetEventCoolDownTime - EventDataClass is none, using probably useless default value");
    return 0.f;
}

/** Gets the radius of effect of the cooldown of the event */
function float GetEventCoolDownRadius( int EventID, class< KFPawnVoiceGroupEventData > EventDataClass )
{
    if( EventDataClass != none )
    {
        return EventDataClass.default.Events[EventID].CoolDownRadius;
    }

    WarnInternal("KFDialogManager::GetEventCoolDownRadius - EventDataClass is none, using probably useless default value");
    return 0.f;
}

/** Gets the cooldown radius squared */
function float GetEventCoolDownRadiusSq( int EventID, class< KFPawnVoiceGroupEventData > EventDataClass )
{
    local float CoolDownRadius;

    CoolDownRadius = GetEventCoolDownRadius( EventID, EventDataClass );

    return CoolDownRadius * CoolDownRadius;
}

/** Gets the cooldown category of the event */
function int GetEventCoolDownCategory( int EventID, class< KFPawnVoiceGroupEventData > EventDataClass )
{
    if( EventDataClass != none )
    {
        if( EventDataClass.default.Events.Length > EventID )
        {
            return EventDataClass.default.Events[EventID].CoolDownCategory;
        }
        else
        {
            return 255;
        }
    }

    WarnInternal("KFDialogManager::GetEventCoolDownCategory - EventDataClass is none, using probably useless default value");
    return 255;
}

/** Gets the cooldown category of the event */
function bool GetEventIsOnlyPlayedLocally( int EventID, class< KFPawnVoiceGroupEventData > EventDataClass )
{
    if( EventDataClass != none )
    {
        return EventDataClass.default.Events[EventID].bOnlyPlayLocally;
    }

    WarnInternal("KFDialogManager::GetEventIsOnlyPlayedLocally - EventDataClass is none, using probably useless default value");
    return true;
}

/*****************************************************************************
* Utility functions for checking pawn validigy, proximity, FOV, and LOS
*****************************************************************************/

function bool PawnIsValidPlayer( KFPawn_Human KFPH )
{
    // gotta be human!
    if( KFPH.GetTeamNum() != 0 )
    {
        return false;
    }

    // gotta be alive!
    if( !KFPH.IsAliveAndWell() )
    {
        return false;
    }

    if( KFPH.VoiceGroupArch == none || KFPH.VoiceGroupArch.default.EventDataClass == none )
    {
        return false;
    }

    return true;
}

function bool PawnCanSpotPawn( Pawn P1, Pawn P2, float MaxDistanceSq, float FOVCosine, optional bool CheckLOS, optional bool DoubleCheckLOS )
{
    // check distance
    if( VSizeSq(P2.Location - P1.Location) >= MaxDistanceSq )
    {
        return false;
    }

    if( !ActorWithinPawnFOV(P2, P1, FOVCosine) )
    {
        return false;
    }

    // check LOS
    return !CheckLOS || PawnWithinPawnLOS(P2, P1, DoubleCheckLOS);
}

function bool PawnCanSpotActor( Pawn P, Actor A, float MaxDistanceSq, float FOVCosine, optional bool CheckLOS )
{
    // check distance
    if( VSizeSq(A.Location - P.Location) >= MaxDistanceSq )
    {
        return false;
    }

    if( !ActorWithinPawnFOV(A, P, FOVCosine) )
    {
        return false;
    }

    // check LOS
    if( CheckLOS && !FastTrace(P.GetPawnViewLocation(), A.Location) )
    {
        return false;
    }

    return true;
}

function bool ActorWithinPawnFOV( Actor A, Pawn P, float FOVCosine )
{
    local vector PtoA, PFacing;

    PFacing = vector( P.GetViewRotation() );
    PtoA = Normal( A.Location - P.Location );

    // check FOV
    if( PtoA dot PFacing < FOVCosine )
    {
        return false;
    }

    return true;
}

function bool ActorWithinPawnRadius( Actor A, Pawn P, float Radius )
{
    if( VSizeSq(A.Location - P.Location) > (Radius * Radius) )
    {
        return false;
    }

    return true;
}

function bool PawnWithinPawnLOS( Pawn P1, Pawn P2, optional bool bDoubleCheckLOS )
{
    if( !FastTrace(P2.GetPawnViewLocation(), P1.GetPawnViewLocation()) )
    {
        if( !bDoubleCheckLOS || !FastTrace(P1.GetPawnViewLocation(), P2.Location) )
        {
            return false;
        }
    }

    return true;
}

function bool PlayerCanSpotEnemy( KFPawn_Human Player, KFPawn_Monster Enemy, optional float RadiusSq = -1.f, optional float FOVCosine = -1.f )
{
    local class< KFPawnVoiceGroupEventData > EventDataClass;

    EventDataClass = Player.GetVoiceGroupEventDataClass();

    if( RadiusSq < 0 )
    {
        RadiusSq = GetEventRadiusSq(125, EventDataClass);
    }

    if( FOVCosine < 0 )
    {
        FOVCosine = GetEventFOV(125, EventDataClass);
    }

    return PawnCanSpotPawn(Player, Enemy, RadiusSq, FOVCosine, true, true );
}

/*****************************************************************************
* Start real dialog manager functionality
*****************************************************************************/

function SetTraderTime( bool bTraderTime )
{
    bIsTraderTime = bTraderTime;
}

event Tick( float DeltaTime )
{
    if( !bEnabled || !WorldInfo.GRI.bMatchHasBegun )
    {
        return;
    }

    if( DelayedDialog.Length > 0 )
    {
        UpdateDelayedDialog();
    }

    if( (WorldInfo.TimeSeconds - LastSpotUpdateTime) > 0.25 )
    {
        CheckSpottedDialog();
        LastSpotUpdateTime = WorldInfo.TimeSeconds;
    }

    if( (WorldInfo.TimeSeconds - LastIdleUpdateTime) > 0.5 )
    {
        CheckIdleDialog();
        LastIdleUpdateTime = WorldInfo.TimeSeconds;
    }
}

/** Updates delayed dialog, plays delayed dialog when delay time has elapsed */
function UpdateDelayedDialog()
{
    local int i;

    for( i = 0; i < DelayedDialog.Length; ++i )
    {
        if( DelayedDialog[i].EndTime < WorldInfo.TimeSeconds )
        {
            PlayDialogEvent( DelayedDialog[i].Speaker, DelayedDialog[i].EventID );
            DelayedDialog.Remove( i--, 1 );
        }
    }
}

/** Checks if dialog should be considered to be "cooling down" */
function bool DialogIsCoolingDown( KFPawn KFP, int EventID, int EventCoolDownCategory )
{
    local int i, CoolDownID, iCoolDownCategory;
    local class< KFPawnVoiceGroupEventData > EventDataClass;

    EventDataClass = KFP.GetVoiceGroupEventDataClass();

    for( i = 0; i < CoolDowns.Length; ++i )
    {
        CoolDownID = CoolDowns[i].EventID;
        iCoolDownCategory = GetEventCoolDownCategory(CoolDownID, EventDataClass);

        // check cooldown for:
        // - same event
        // - any event, in the case that EventID is an idle/situational event (don't remark about the weather unless no one around you has talked for a while)
        // - any event, in the case that CoolDownID is a response event (don't talk over responses... it gets confusing)
        // - any event in the same cooldown category
        if( EventID == CoolDownID ||
            EventCoolDownCategory == ECC_Situ ||
            iCoolDownCategory == ECC_Resp ||
            (EventCoolDownCategory != 255 && EventCoolDownCategory == iCoolDownCategory) )
        {
            // instead of removing on tick, remove on demand
            if( CoolDowns[i].EndTime <= WorldInfo.TimeSeconds )
            {
                CoolDowns.Remove( i--, 1 );
                continue;
            }

            if( KFP == Cooldowns[i].Speaker )
            {
                return true;
            }

            if( VSizeSq(CoolDowns[i].Location - KFP.Location) < GetEventCoolDownRadiusSq(CoolDownID, EventDataClass) )
            {
                return true;
            }
        }
    }

    return false;
}

/** Checks if a dialog event can be played based on priority, cooldown, etc. */
function bool DialogEventCanBePlayed( KFPawn KFP, const out DialogEventInfo EventInfo )
{
    if( KFP.IsSpeaking() )
    {
        // event isn't allowed to interrupt anything
        if( EventInfo.Priority > InterruptPriorityThreshold && KFP.CurrDialogPriority < InterruptedByAnyPriorityThreshold )
        {
            if (bLogDialog) LogInternal(KFP.VoiceGroupArch.static.GetEventName(EventInfo.EventID)$" can't be played for "$Right(KFP.VoiceGroupArch.Name,Len(KFP.VoiceGroupArch.Name)-InStr(KFP.VoiceGroupArch.Name, "_")-1)$" - Already speaking "$KFP.VoiceGroupArch.static.GetEventName(KFP.CurrDialogEventID)$" (priority too low to cause interupt)",'BattleChatter');
            return false;
        }

        // event is lower priority than dialog being spoken, so it can't interrupt it
        if( EventInfo.Priority > KFP.CurrDialogPriority )
        {
            if (bLogDialog) LogInternal(KFP.VoiceGroupArch.static.GetEventName(EventInfo.EventID)$" can't be played for "$Right(KFP.VoiceGroupArch.Name,Len(KFP.VoiceGroupArch.Name)-InStr(KFP.VoiceGroupArch.Name, "_")-1)$" - Already speaking "$KFP.VoiceGroupArch.static.GetEventName(KFP.CurrDialogEventID)$" (lower priority)",'BattleChatter');
            return false;
        }

        // event is same priority and isn't allowed to interrupt equal priority dialog
        if( EventInfo.Priority == KFP.CurrDialogPriority && !EventInfo.bCanInterruptEqualPriority )
        {
            if (bLogDialog) LogInternal(KFP.VoiceGroupArch.static.GetEventName(EventInfo.EventID)$" can't be played for "$Right(KFP.VoiceGroupArch.Name,Len(KFP.VoiceGroupArch.Name)-InStr(KFP.VoiceGroupArch.Name, "_")-1)$" - Already speaking "$KFP.VoiceGroupArch.static.GetEventName(KFP.CurrDialogEventID)$" (same priority, not allowed to interrupt same priority)",'BattleChatter');
            return false;
        }
    }

    // don't re-play dialog in cool-down
    if( DialogIsCoolingDown(KFP, EventInfo.EventID, EventInfo.CoolDownCategory) )
    {
        if (bLogDialog) LogInternal(KFP.VoiceGroupArch.static.GetEventName(EventInfo.EventID)$" can't be played for "$Right(KFP.VoiceGroupArch.Name,Len(KFP.VoiceGroupArch.Name)-InStr(KFP.VoiceGroupArch.Name, "_")-1)$" - Cooling down",'BattleChatter');
        return false;
    }

    // don't play if it would be out of context with respect to number of players in the game
    if( !EventInfo.bCanPlayAlone && KFGameInfo(WorldInfo.Game).GetLivingPlayerCount() < 2 )
    {
        if (bLogDialog) LogInternal(KFP.VoiceGroupArch.static.GetEventName(EventInfo.EventID)$" can't be played for "$Right(KFP.VoiceGroupArch.Name,Len(KFP.VoiceGroupArch.Name)-InStr(KFP.VoiceGroupArch.Name, "_")-1)$" - Alone",'BattleChatter');
        return false;
    }

    // only allow dialog in the ECC_TTime category to be played during trader time
    if( EventInfo.CoolDownCategory == ECC_TTime && !bIsTraderTime )
    {
        if (bLogDialog) LogInternal(KFP.VoiceGroupArch.static.GetEventName(EventInfo.EventID)$" can't be played for "$Right(KFP.VoiceGroupArch.Name,Len(KFP.VoiceGroupArch.Name)-InStr(KFP.VoiceGroupArch.Name, "_")-1)$" - Trader time only",'BattleChatter');
        return false;
    }

    // only allow high-pri dialog (mostly pain/damages sounds) if being grabbed by Hans
    if( KFP.SpecialMove == SM_HansGrappleVictim && EventInfo.Priority > InterruptPriorityThreshold )
    {
        if (bLogDialog) LogInternal(KFP.VoiceGroupArch.static.GetEventName(EventInfo.EventID)$" can't be played for "$Right(KFP.VoiceGroupArch.Name,Len(KFP.VoiceGroupArch.Name)-InStr(KFP.VoiceGroupArch.Name, "_")-1)$" - Being grabbed by Hans",'BattleChatter');
        return false;
    }

    return true;
}

/** Play dialog from given speaker and dialog anim on given speaker */
function PlayDialogEvent( KFPawn Speaker, int EventID )
{
    local DialogCoolDownInfo CoolDownInfo;
    local DialogEventInfo EventInfo;
    local AkEvent EventAudioCue;
    local name SpeakerName;

    if( !bEnabled || Speaker == none )
    {
        return;
    }

    if( EventID < 0 || Speaker.VoiceGroupArch == none )
    {
        return;
    }

    EventInfo = Speaker.VoiceGroupArch.static.GetDialogEventInfo(EventID);

    if( EventInfo.Delay > 0 )
    {
        if( AddDelayedDialogEvent(Speaker, EventID, EventInfo.Delay) )
        {
            return;
        }
    }

    if( !DialogEventCanBePlayed(Speaker, EventInfo) )
    {
        return;
    }

    if( FRand() > EventInfo.Chance )
    {
        return;
    }

    EventAudioCue = Speaker.VoiceGroupArch.static.GetDialogAkEvent( EventID, bIsTraderTime );
    if( EventAudioCue == none )
    {
        if (bLogDialog) LogInternal("KFDialogManager::PlayDialogEvent - event "$Speaker.VoiceGroupArch.static.GetEventName(EventInfo.EventID)$" for speaker "$Speaker$" has no audio, bailing out");
        return;
    }

    if( EventAudioCue.Duration <= 0 )
    {
        if (bLogDialog) LogInternal("KFDialogManager::PlayDialogEvent - event "$Speaker.VoiceGroupArch.static.GetEventName(EventInfo.EventID)$" for speaker "$Speaker$" has invalid duration, bailing out");
        return;
    }

    SpeakerName = Speaker.VoiceGroupArch.Name;

    if( Speaker.IsSpeaking() )
    {
        if (bLogDialog) LogInternal("Interrupting "$Speaker.VoiceGroupArch.static.GetEventName(Speaker.CurrDialogEventID)$" for "$Right(SpeakerName,Len(SpeakerName)-InStr(SpeakerName, "_")-1),'BattleChatter');

        // interrupt current dialog
        Speaker.StopDialog();
    }

    if (bLogDialog) LogInternal("Playing "$Speaker.VoiceGroupArch.static.GetEventName(EventInfo.EventID)$" for "$Right(SpeakerName,Len(SpeakerName)-InStr(SpeakerName, "_")-1),'BattleChatter');

    Speaker.CurrDialogEventID = EventInfo.EventID;
    Speaker.CurrDialogPriority = EventInfo.Priority;

    // manage cool down info
    if( EventInfo.CoolDownTime > 0.f )
    {
        CoolDownInfo.EventID = EventInfo.EventID;
        CoolDownInfo.Speaker = Speaker;
        CoolDownInfo.Location = Speaker.Location;
        CoolDownInfo.EndTime = WorldInfo.TimeSeconds + EventInfo.CoolDownTime;
        CoolDowns.AddItem( CoolDownInfo );
    }

    if( EventInfo.bOnlyPlayLocally )
    {
        if( Speaker.IsLocallyControlled() )
        {
            KFPlayerController(Speaker.Controller).ClientHearDialog( Speaker, EventAudioCue, EventInfo.bCanBeMinimized );
        }
    }
    else
    {
        Speaker.PlayDialog( EventAudioCue, EventInfo.bCanBeMinimized );
    }

	// keep track of end-of-event with a timer (duration is max duration of all permutations of dialog)
    SetTimer( EventAudioCue.Duration, false, nameof(Speaker.EndOfDialogTimer), Speaker );
}

/** Checks if a given player is speaking or is set to speak a given line of dialog */
function bool PlayerIsPlayingDialogEvent( KFPawn_Human Player, int EventID )
{
    local int DelayedDialogIdx;

    if( Player.IsPlayingDialogEvent(EventiD) )
    {
        // the player is currently saying the line
        return true;
    }

    DelayedDialogIdx = DelayedDialog.Find('EventID', EventID);
    if( DelayedDialogIdx != INDEX_NONE && DelayedDialog[DelayedDialogIdx].Speaker == Player )
    {
        // the player will start saying the line soon, so consider him to be speaking already
        return true;
    }

    return false;
}

/** Delegate for all responses that only require basic information and logic */
function BasicResponseDelegate( const out DialogResponseInfo RespInfo )
{
    if( !RespInfo.Speaker.bDeleteMe && RespInfo.Speaker.IsAliveAndWell() )
    {
        PlayDialogEvent( RespInfo.Speaker, RespInfo.EventID );
    }
}

/** Plays or sets up a basic (requires no special information or logic) response to a given line of dialog */
function PlayBasicDialogResponse( KFPawn_Human RespondToPawn, int RespondingToID, int ResponseID, optional KFPawn_Human Responder, optional KFPawn Target, optional bool bPlayOnlyAsResponse )
{
    if( Responder == none )
    {
        Responder = FindPlayerResponder( RespondToPawn, ResponseID, Target );
    }

    if( Responder == none )
    {
        return;
    }

    // if Speaker is speaking the dialog Responder is waiting for, then wait for it to finish
    if( PlayerIsPlayingDialogEvent(RespondToPawn, RespondingToID) )
    {
        RespondToPawn.SetDialogResponseDelegate( Responder, BasicResponseDelegate, ResponseID, RespondingToID );
    }
    // otherwise just play the "response" right away, if we're allowed to do so
    else if( !bPlayOnlyAsResponse )
    {
        PlayDialogEvent( Responder, ResponseID );
    }
}

/** Finds a nearby player to respond to a given line of dialog */
function KFPawn_Human FindPlayerResponder( KFPawn_Human Speaker, int ResponseEventID, optional KFPawn Target )
{
    local KFPawn_Human Responder;
    local class< KFPawnVoiceGroupEventData > EventDataClass;

    EventDataClass = Speaker.GetVoiceGroupEventDataClass();

    foreach WorldInfo.AllPawns( class'KFPawn_Human', Responder )
    {
        if( Responder == Speaker || !PawnIsValidPlayer(Responder) )
        {
            continue;
        }

        if( ActorWithinPawnRadius(Speaker, Responder, GetEventRadius(ResponseEventID, EventDataClass))
            && (Target == none || (ActorWithinPawnFOV(Target, Responder, GetEventFOV(ResponseEventID, EventDataClass)) && PawnWithinPawnLOS(Target, Responder)))
          )
        {
            return Responder;
        }
    }

    return none;
}

/** Plays or sets up a response that requires customized information or logic */
function PlayCustomDialogResponse( KFPawn_Human Speaker, KFPawn Responder, int RespondingToID, delegate<OnFinishedDialog> CustomDelegate, optional bool bPlayOnlyAsResponse )
{
    // if Speaker is speaking the dialog Responder is waiting for, then wait for it to finish
    if( PlayerIsPlayingDialogEvent(Speaker, RespondingToID) )
    {
        Speaker.SetDialogResponseDelegate( Responder, CustomDelegate, -1, RespondingToID );
    }
    // otherwise just play the "response" right away, if we're allowed to do so
    else if( !bPlayOnlyAsResponse )
    {
        Speaker.SetDialogResponseDelegate( Responder, none, -1, RespondingToID );
        CustomDelegate( Speaker.DlgRespInfo );
    }
}

/** Simulates adding elements to an array and picking a random element (without using an array) */
function AddRandomDialogOption( KFPawn Speaker, int OptionID, out int NumOptions, out int BestOptionID )
{
    local DialogEventInfo NewOptionEventInfo, BestOptionEventInfo;
    local int WeightCount;

    if( OptionID < 0 || Speaker.VoiceGroupArch == none )
    {
        return;
    }

    if( BestOptionID >= 0 )
    {
        NewOptionEventInfo = Speaker.VoiceGroupArch.static.GetDialogEventInfo(OptionID);
        BestOptionEventInfo = Speaker.VoiceGroupArch.static.GetDialogEventInfo(BestOptionID);
        if( NewOptionEventInfo.Priority < BestOptionEventInfo.Priority )
        {
            NumOptions = 0;
        }
        else if( NewOptionEventInfo.Priority > BestOptionEventInfo.Priority )
        {
            return;
        }
    }

    NumOptions++;
    WeightCount = NewOptionEventInfo.Weight;
    while( WeightCount-- > 0 )
    {
        if( Frand() <= 1.f / float(NumOptions) )
        {
            BestOptionID = OptionID;
        }
    }
}

/** Adds an entry to the delayed dialog array */
function bool AddDelayedDialogEvent( KFPawn Speaker, int EventID, float Delay )
{
    local int DelayedDialogIdx;

    DelayedDialogIdx = DelayedDialog.Find('EventID', EventID);
    if( DelayedDialogIdx == INDEX_NONE )
    {
        DelayedDialog.Add( 1 );
        DelayedDialog[ DelayedDialog.Length - 1 ].Speaker = Speaker;
        DelayedDialog[ DelayedDialog.Length - 1 ].EventID = EventID;
        DelayedDialog[ DelayedDialog.Length - 1 ].EndTime = WorldInfo.TimeSeconds + Delay;
        return true;
    }
    else if( DelayedDialog[DelayedDialogIdx].Speaker != Speaker )
    {
        return true;
    }

    return false;
}

/************************************************
 * Door Dialog
 ************************************************/

 function PlayWeldDialog( KFPawn Speaker, KFDoorActor Door, KFPawn Welder )
 {
    local int WeldDialogID, WeldRespDialogID;

    if( Speaker.VoiceGroupArch == none || Speaker.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    if( Door.UnderAttack() )
    {
        WeldDialogID = 12;
        WeldRespDialogID = 13;
    }
    else
    {
        WeldDialogID = 10;
        WeldRespDialogID = 11;
    }

    if( Speaker == Welder )
    {
        // if door is now welded in full, play finished dialog
        if( Door.WeldIntegrity >= Door.MaxWeldIntegrity )
        {
            PlayDialogEvent( KFPawn_Human(Speaker), 16);
        }
        // else play general "welding" dialog, but only when the player first starts welding
        else if( !Door.BeingWelded() )
        {
            PlayDialogEvent( KFPawn_Human(Speaker), WeldDialogID );
        }
        // else if door is under attack and about to break, play "about to break" dialog
        else if( WeldDialogID == 12&& Door.WeldIntegrity < WeldAboutToBreakThreshold )
        {
            PlayDialogEvent( KFPawn_Human(Speaker), 14);
        }
    }
    else
    {
        PlayBasicDialogResponse( KFPawn_Human(Speaker), WeldDialogID, WeldRespDialogID, KFPawn_Human(Welder) );
    }
 }

function PlayUnweldDialog( KFPawn Speaker, KFDoorActor Door, KFPawn Unwelder )
{
    if( Speaker.VoiceGroupArch == none || Speaker.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    if( Speaker == Unwelder )
    {
        // if door is now unwelded in full, play finished dialog
        if( Door.WeldIntegrity <= 0 )
        {
            PlayDialogEvent( KFPawn_Human(Speaker), 18);
        }
        // else play unwelding dialog, but only when the player first starts unwelding
        else if( !Door.BeingUnwelded() )
        {
            PlayDialogEvent( KFPawn_Human(Speaker), 17);
        }
    }
}

function PlayDoorTakeDamageDialog( KFDoorActor Door )
{
    local KFPawn_Human KFPH;
    local bool bDoorWeldBroken;
    local class< KFPawnVoiceGroupEventData > EventDataClass;

    bDoorWeldBroken = Door.WeldIntegrity <= 0;

    foreach WorldInfo.AllPawns( class'KFPawn_Human', KFPH )
    {
        if( !PawnIsValidPlayer(KFPH) )
        {
            continue;
        }

        EventDataClass = KFPH.GetVoiceGroupEventDataClass();

        //@todo: should probably check LOS, but that doesn't seem to be reliable with door actors...
        if( !PawnCanSpotActor(KFPH, Door, GetEventRadiusSq(19, EventDataClass), GetEventFOV(19, EventDataClass)) )
        {
            continue;
        }

        if( bDoorWeldBroken )
        {
            PlayDialogEvent( KFPH, 20);
        }
        else
        {
            PlayDialogEvent( KFPH, 19);
        }
    }
}

/************************************************
 * Heal Dialog
 ************************************************/

function PlayHealMissDialog( KFPawn Healer, KFPawn IntendedHealee )
{
    local KFPawn_Human KFPH, KFPH_Healee;

    if( Healer.VoiceGroupArch == none || Healer.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    KFPH = KFPawn_Human(Healer);

    if( KFPH == none )
    {
        return;
    }

    KFPH_Healee = KFPawn_Human(IntendedHealee);

    if( KFPH_Healee == none )
    {
        return;
    }

    PlayDialogEvent( KFPH, 24);
    PlayCustomDialogResponse( KFPawn_Human(Healer), IntendedHealee, 24, PlayHealMissResponse, true );
}

function PlayHealMissResponse( const out DialogResponseInfo RespInfo )
{
    if( !RespInfo.Speaker.bIsMoving && ActorWithinPawnRadius(RespInfo.Speaker, RespInfo.RespondingToPawn, GetEventRadius(25, RespInfo.Speaker.GetVoiceGroupEventDataClass())) )
    {
        PlayDialogEvent( RespInfo.Speaker, 25);
    }
}

function PlayHealingDialog( KFPawn Healer, KFPawn Healee, float HealeeHealthPct )
{
    local KFPawn_Human KFPH;

    if( Healer.VoiceGroupArch == none || Healer.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    KFPH = KFPawn_Human(Healer);

    if( KFPH == none )
    {
        // not an act of healing by a player
        return;
    }

    if( KFPH != Healee )
    {
        PlayDialogEvent( KFPH, 21);

        if( HealeeHealthPct < NeedMoreHealingPctThreshold )
        {
            PlayBasicDialogResponse( KFPH, 21, 22, KFPawn_Human(Healee) );
        }
        else if( HealeeHealthPct >= NeedNoMoreHealingPctThreshold )
        {
            PlayBasicDialogResponse( KFPH, 21, 23, KFPawn_Human(Healee) );
        }
    }
    else
    {
        PlayDialogEvent( KFPH, 26);
    }
}

/************************************************
 * Dosh Dialog
 ************************************************/

function PlayDoshCaughtDialog( KFPawn_Human Speaker )
{
    if( Speaker.VoiceGroupArch == none || Speaker.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    if( Speaker.DoshCaughtStreakAmt >= CaughtMuchDoshAmt )
    {
        PlayDialogEvent( Speaker, 29);
    }
    else if( Speaker.DoshCaughtStreakAmt >= CaughtSomeDoshAmt )
    {
        PlayDialogEvent( Speaker, 28);
    }
}

function PlayDoshTossDialog( KFPawn Speaker )
{
    local Actor HitActor;
    local vector HitLocation, HitNormal;
    local vector TraceStart, TraceEnd;

    TraceEnd = Speaker.GetPawnViewLocation();
    TraceStart = TraceEnd + vector(Speaker.GetViewRotation()) * 500;
    HitActor = Trace( HitLocation, HitNormal, TraceEnd, TraceStart, true );
    if( HitActor != Speaker && KFPawn_Human(HitActor) != none )
    {
        PlayDialogEvent( Speaker, 27);
    }
    else
    {
        PlayDialogEvent( Speaker, 30);
    }
}

/************************************************
 * Weapon Dialog
 ************************************************/

function PlayReloadDialog( KFPawn Speaker )
{
    if( Speaker.VoiceGroupArch == none || Speaker.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    if( Speaker.IsSurrounded(true, NumZedsForPressureReload, GetEventRadius(33, Speaker.GetVoiceGroupEventDataClass())) )
    {
        PlayDialogEvent( Speaker, 33);
    }
    else
    {
        PlayDialogEvent( Speaker, 32);
    }
}

function PlayAmmoDialog( KFPawn Speaker, float SpareAmmoLeftPct )
{
    if( Speaker.VoiceGroupArch == none || Speaker.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    if( SpareAmmoLeftPct <= LowSpareAmmoPctThreshold )
    {
        PlayDialogEvent( Speaker, 38);
        PlayBasicDialogResponse( KFPawn_Human(Speaker), 38, 39, /*Responder*/, /*Target*/, true );
    }
}

function PlayDropWeaponDialog( KFPawn Speaker )
{
    if( Speaker.VoiceGroupArch == none || Speaker.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    PlayDialogEvent( Speaker, 34);
}

function PlayMeleeAttackDialog( KFPawn Speaker, bool bIsHeavyAttack )
{
    if( Speaker.VoiceGroupArch == none || Speaker.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    if( bIsHeavyAttack )
    {
        PlayDialogEvent( Speaker, 40);
    }
    else
    {
        PlayDialogEvent( Speaker, 41);
    }
}

function PlayIronsightsDialog( KFPawn Speaker )
{
    if( Speaker.VoiceGroupArch == none || Speaker.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    PlayDialogEvent( Speaker, 52);
}

function PlayJumpDialog( KFPawn Speaker )
{
    if( Speaker.VoiceGroupArch == none || Speaker.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    PlayDialogEvent( Speaker, 53);
}

/************************************************
 * Sprint Dialog
 ************************************************/

function PlaySprintPantingDialog( KFPawn_Human Speaker, bool bNewSprintStatus )
{
    if( bNewSprintStatus && !Speaker.bIsSprinting )
    {
        Speaker.SprintStartTime = WorldInfo.TimeSeconds;
    }
    else if ( !bNewSprintStatus )
    {
        StopBreathingDialog(Speaker);
    }

    if( (WorldInfo.TimeSeconds - Speaker.SprintStartTime) > TimeUntilStartSprintPanting )
    {
        Speaker.SprintStartTime = WorldInfo.TimeSeconds;
        PlayDialogEvent( Speaker, 50);
    }
}

/** 
 * A stop event for sprinting and ironsight breathing.  The breathing sounds also have a max duration,
 * so even though this event is not perfect (changing controllers, etc...) it won't break anything.
 */
function StopBreathingDialog(KFPawn Speaker)
{
    if( Speaker.IsSpeaking() )
    {
        if ( Speaker.CurrDialogEventID == 50|| Speaker.CurrDialogEventID == 52)
        {
            KFPlayerController(Speaker.Controller).ClientHearDialog( Speaker, StopBreathingAkEvent, 0 );
        }
    }
}

/************************************************
 * Level Up Dialog
 ************************************************/

function PlayLevelUpDialog( KFPlayerController LevellerKFPC )
{
    local KFPawn_Human Leveller, Commenter;
    local int CommentEventID;

    local int LevellerLevel, CommenterLevel;

    LevellerLevel = KFPlayerReplicationInfo( LevellerKFPC.PlayerReplicationInfo ).GetActivePerkLevel();

    if( LevellerLevel < 5 )
    {
        CommentEventID = 54;
    }
    else if( LevellerLevel < 15 )
    {
        CommentEventID = 55;
    }
    else if( LevellerLevel < 25 )
    {
        CommentEventID = 56;
    }
    else
    {
        CommentEventID = 57;
    }

    Leveller = KFPawn_Human( LevellerKFPC.Pawn );
    Commenter = FindPlayerResponder( Leveller, CommentEventID );

    if( Commenter != none )
    {
        PlayDialogEvent( Commenter, CommentEventID );

        CommenterLevel = KFPlayerReplicationInfo( KFPlayerController(Commenter.Controller).PlayerReplicationInfo ).GetActivePerkLevel();
        if( CommenterLevel > LevellerLevel )
        {
            PlayBasicDialogResponse( Commenter, CommentEventID, 59, Leveller, Commenter, true );
        }
        else if( CommenterLevel < LevellerLevel )
        {
            PlayBasicDialogResponse( Commenter, CommentEventID, 58, Leveller, Commenter, true );
        }
    }
}

/************************************************
 * KillZed Dialog
 ************************************************/

function PlayKilledZedDialog( KFPawn_Human Killer, KFPawn_Monster Zed, class<DamageType> DamageType, bool bWasKnockedDown )
{
    local int NumOptions, BestOptionID;

    if( Killer.VoiceGroupArch == none || Killer.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    BestOptionID = -1;

    CheckOnARollDialog( Killer, NumOptions, BestOptionID );
    CheckMassacreDialog( Killer, Zed, NumOptions, BestOptionID );
    CheckCloseCallKillDialog( Killer, Zed, NumOptions, BestOptionID );
    CheckKillAsLastAliveDialog( Killer, Zed, NumOptions, BestOptionID );
    CheckKilledWithFavoriteWeaponDialog( Killer, NumOptions, BestOptionID );

    AddRandomDialogOption( Killer, Zed.GetKillerDialogID(), NumOptions, BestOptionID );

    if( class<KFDamageType>(DamageType) != none )
    {
        AddRandomDialogOption( Killer, class<KFDamageType>(DamageType).static.GetKillerDialogID(), NumOptions, BestOptionID );
    }

    if( bWasKnockedDown )
    {
        AddRandomDialogOption( Killer, 77, NumOptions, BestOptionID );
    }

    PlayDialogEvent( Killer, BestOptionID );
    PlayBasicKilledResponse( Killer, Zed, BestOptionID );
}

/** Adds "on a roll" random dialog if player has killed enough zeds without taking damage */
function CheckOnARollDialog( KFPawn_Human Speaker, out int out_NumOptions, out int out_BestOptionID )
{
    Speaker.UpdateKillStreak();

    if( Speaker.ZedsKilledStreakAmt >= NumKillsForOnARoll )
    {
        AddRandomDialogOption( Speaker, 73, out_NumOptions, out_BestOptionID );
    }
}

/** Adds "massacre" random dialog if enough zeds have been killed in a certain amount of time and within a certain radius */
function CheckMassacreDialog( KFPawn_Human Killer, KFPawn_Monster KilledZed, out int out_NumOptions, out int out_BestOptionID )
{
    local int i, MassacreCount;
    local KFGoreManager KFGM;
    local KFPawn Corpse;
    local float AreaRadiusSq;

    KFGM = KFGoreManager(WorldInfo.MyGoreEffectManager);

    if( KFGM == none )
    {
        return;
    }

    AreaRadiusSq = AreaRadiusForMassacre * AreaRadiusForMassacre;

    // check corpses for proximity to KilledZed
    for( i = 0; i < KFGM.CorpsePool.Length && MassacreCount < NumZedsInAreaForMassacre; ++i )
    {
        Corpse = KFGM.CorpsePool[i];

        // don't count KilledZed toward massacre
        if( Corpse == KilledZed )
        {
            continue;
        }

        // only check zeds that have died within the time limit for a "massacre"
        if( (WorldInfo.TimeSeconds - Corpse.TimeOfDeath) > TimeLimitForMassacre )
        {
            continue;
        }

        // only check zeds that are within the radius limit for a "massacre"
        if( VSizeSq(Corpse.Location - KilledZed.Location) > AreaRadiusSq )
        {
            continue;
        }

        ++MassacreCount;
    }

    if( MassacreCount >= NumZedsInAreaForMassacre )
    {
        AddRandomDialogOption( Killer, 69, out_NumOptions, out_BestOptionID );
    }
}

/** Add "close call" random dialog if player killed zed right before zed killed him */
function CheckCloseCallKillDialog( KFPawn_Human Killer, KFPawn_Monster Zed, out int out_NumOptions, out int out_BestOptionID )
{
    if( Killer.LastHitBy == Zed.MyKFAIC
        && (float(Killer.Health) / float(Killer.HealthMax) <= CloseCallKillHealthPctThreshold) )
    {
        AddRandomDialogOption( Killer, 75, out_NumOptions, out_BestOptionID );
    }
}

function CheckKillAsLastAliveDialog( KFPawn_Human Killer, KFPawn_Monster Zed, out int out_NumOptions, out int out_BestOptionID )
{
    if( KFGameInfo(WorldInfo.Game).GetLivingPlayerCount() == 1 )
    {
        AddRandomDialogOption( Killer, 76, out_NumOptions, out_BestOptionID );
    }
}

function CheckKilledWithFavoriteWeaponDialog( KFPawn_Human Killer, out int out_NumOptions, out int out_BestOptionID )
{
    local int FavoriteWeaponIndex;
    local KFCharacterInfo_Human KFCI;

    KFCI = KFCharacterInfo_Human( Killer.CharacterArch );
    if( KFCI == none )
    {
        return;
    }

    FavoriteWeaponIndex = KFCI.GetFavoriteWeaponIndexOf( Killer.Weapon );
    if( FavoriteWeaponIndex < 0 )
    {
        return;
    }

    AddRandomDialogOption( Killer, 91+ FavoriteWeaponIndex, out_NumOptions, out_BestOptionID );
}

/** Set up response for selected "kill zed" dialog */
function PlayBasicKilledResponse( KFPawn_Human Killer, KFPawn_Monster KilledZed, int KilledEventID )
{
    local int ResponseEventID;
    local bool bPlayOnlyAsResponse;

    switch( KilledEventID )
    {
    case 73:
        ResponseEventID = 74;
        bPlayOnlyAsResponse = true;
        break;

    case 69:
        ResponseEventID = 70;
        bPlayOnlyAsResponse = true;
        break;

    case 78:
        ResponseEventID = 79;
        break;

    case 80:
        ResponseEventID = 81;
        break;

    case 82:
        ResponseEventID = 83;
        break;

    case 84:
        ResponseEventID = 85;
        break;

    case 86:
        ResponseEventID = 87;
        break;

    default:
        return; // do nothing
    };

    PlayBasicDialogResponse( Killer, KilledEventID, ResponseEventID, /*Responder*/, KilledZed, bPlayOnlyAsResponse );
}

/************************************************
 * Damage Zed Dialog
 ************************************************/

function PlayDamagedZedDialog( KFPawn_Human Damager, KFPawn_Monster Zed, class<DamageType> DamageType )
{
    local int NumOptions, BestOptionID;

    if( Damager.VoiceGroupArch == none || Damager.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    BestOptionID = -1;

    if( Zed.IsDoingSpecialMove(SM_Knockdown) )
    {
        AddRandomDialogOption( Damager, 101, NumOptions, BestOptionID );
    }
    else if( Zed.IsDoingSpecialMove(SM_Stumble) )
    {
        AddRandomDialogOption( Damager, 100, NumOptions, BestOptionID );
    }
    else if( Zed.IsDoingSpecialMove(SM_Stunned) )
    {
        AddRandomDialogOption( Damager, 99, NumOptions, BestOptionID );
    }

    if( class<KFDamageType>(DamageType) != none )
    {
        AddRandomDialogOption( Damager, class< KFDamageType >( DamageType ).static.GetDamagerDialogID(), NumOptions, BestOptionID );
    }

    PlayDialogEvent( Damager, BestOptionID );
}

/** Play "over and over" random dialog if player deals enough consecutive damage to a given zed 
  * NOTE: this needs to be called before zed's LastHitBy and LastPainTime are set for current hit */
function PlayDamageZedContinuousDialog( KFPawn_Human Damager, KFPawn_Monster Zed )
{
    Damager.UpdateContinuousDamage( Zed, TimeBetweenHitsForContinuousDamage );
    if( (WorldInfo.TimeSeconds - Damager.InitialContinousDamageTime) >= TimeForContinuousDamageThreshold )
    {
        PlayDialogEvent( Damager, 107);
    }
}

/** Add "dead horse" random dialog if player hits a corpse repeatedly */
function PlayBeatDeadHorseDialog( KFPawn_Human Speaker, KFPawn_Monster DeadZed )
{
    if( DeadZed.DeadHorseHitStreakAmt < NumHitsForDeadHorse && (WorldInfo.TimeSeconds - DeadZed.LastDeadHorseHitTime) < TimeBetweenHitsForDeadHorse )
    {
        DeadZed.UpdateDeadHorseStreak( true );
    }
    else
    {
        DeadZed.UpdateDeadHorseStreak( false );
    }

    if( DeadZed.DeadHorseHitStreakAmt >= NumHitsForDeadHorse )
    {
        PlayDialogEvent( Speaker, 71);
        PlayBasicDialogResponse( Speaker, 71, 72, /*Responder*/, DeadZed );
    }
}

/************************************************
 * Player Damage Dialog
 ************************************************/

function PlayPlayerDamageDialog( KFPawn_Human Player, class< DamageType > DamageType, int Damage )
{
    local int NumOptions, BestOptionID;

    if( Player.VoiceGroupArch == none || Player.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    BestOptionID = -1;

    if( (float(Player.Health) / float(Player.HealthMax) < PlayerHealthPctForNearDeath) )
    {
        AddRandomDialogOption( Player, 122, NumOptions, BestOptionID );
    }
    else
    {
        CheckPlayerDamageGeneric( Player, Damage, NumOptions, BestOptionID );
    }

    if( class<KFDamageType>(DamageType) != none )
    {
        AddRandomDialogOption( Player, class<KFDamageType>(DamageType).static.GetDamageeDialogID(), NumOptions, BestOptionID );

        // if player has been blinded (due to toxic damage, though berserker doesn't get blinded), add "blinded" random option
        if( ClassIsChildOf(DamageType, class'KFDT_Toxic') && !ClassIsChildOf(Player.GetPerk().Class, class'KFPerk_Berserker') )
        {
            AddRandomDialogOption( Player, 120, NumOptions, BestOptionID );
        }
    }

    PlayDialogEvent( Player, BestOptionID );

    // if playing "blinded" dialog, prepare for "blinded" dialog response
    if( BestOptionID == 120)
    {
        PlayBasicDialogResponse( Player, 120, 121, /*Responder*/, /*Target*/, true );
    }
}

/** Add generic damage vocalizations depending on how hard the player was hit */
function CheckPlayerDamageGeneric( KFPawn_Human Player, int Damage, out int out_NumOptions, out int out_BestOptionID )
{
    local float DamageTakenStreakPct;

    Player.UpdateDamageTakenStreak( Damage, PlayerTakeDamageStreakInterval );
    DamageTakenStreakPct = float( Player.DamageTakenStreakAmt ) / float( Player.HealthMax );
    if( DamageTakenStreakPct >= PlayerTakeDamageStreakPctForScream )
    {
        AddRandomDialogOption( Player, 115, out_NumOptions, out_BestOptionID );
    }
    else
    {
        AddRandomDialogOption( Player, 114, out_NumOptions, out_BestOptionID );
    }
}

function PlayPlayerGrabbedDialog( KFPawn_Human Speaker )
{
    if( Speaker != none )
    {
        PlayDialogEvent( Speaker, 150);
    }
}

function PlayPlayerGrabbedByPatriarchDialog( KFPawn_Human Speaker )
{
    if( Speaker != none )
    {
        PlayDialogEvent( Speaker, 151);
    }
}

/************************************************
 * Player Death Dialog
 ************************************************/

function PlayPlayerDeathDialog( KFPawn_Human Player )
{
    local KFPawn_Human KFPH;
    local float MaxDistanceSq;

    if( Player.VoiceGroupArch == none || Player.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    PlayDialogEvent( Player, 123);

    MaxDistanceSq = GetEventRadiusSq( 113, Player.GetVoiceGroupEventDataClass() );

    foreach WorldInfo.AllPawns( class'KFPawn_Human', KFPH )
    {
        if( !PawnIsValidPlayer(KFPH) )
        {
            continue;
        }

        if( PawnCanSpotPawn(KFPH, Player, MaxDistanceSq, GetEventFOV(113, KFPH.GetVoiceGroupEventDataClass()), true) )
        {
            // player just saw only other player die
            if( KFGameInfo(WorldInfo.Game).GetLivingPlayerCount() == 1 )
            {
                PlayDialogEvent( KFPH, 113);
            }
            // player just saw female teammate die
            else if( KFCharacterInfo_Human(KFPH.CharacterArch).bIsFemale )
            {
                PlayDialogEvent( KFPH, 111);
            }
            // player just saw male teammate die
            else
            {
                PlayDialogEvent( KFPH, 109);
            }
        }
    }
}

/************************************************
 * Spot Zed Dialog
 ************************************************/

/** Compares priority of two events */
function bool CheckSpottedDialogPriority( KFPawn_Human Spotter, int CheckEventID, int BestEventID )
{
    local DialogEventInfo CheckEventInfo, BestEventInfo;

    if( BestEventID < 0 )
    {
        return true;
    }

    CheckEventInfo = Spotter.VoiceGroupArch.static.GetDialogEventInfo(CheckEventID);
    BestEventInfo = Spotter.VoiceGroupArch.static.GetDialogEventInfo(BestEventID);

    if( CheckEventInfo.Priority > BestEventInfo.Priority )
    {
        return false;
    }
    else
    {
        return true;
    }
}

/** Called when a zed spots a player (line of sight check has already passed).
  * We use this in reverse... when a zed spots a player, then check if the player spots the zed
  */
function CheckSpotMonsterDialog( Pawn Spotter, KFPawn_Monster Spotted )
{
    local int SpottedDialogEventID, BestSpottedEventID;
    local KFPawn_Human KFPHSpotter;
    local class<KFPawnVoiceGroupEventData> EventDataClass;

    BestSpottedEventID = -1;

    Spotted.MyKFAIC.bWasVisibleToEnemy = Spotted.MyKFAIC.bIsVisibleToEnemy;

    KFPHSpotter = KFPawn_Human(Spotter);
    EventDataClass = KFPHSpotter.GetVoiceGroupEventDataClass();

    // if zed is within FOV
    if( ActorWithinPawnFOV(Spotted, Spotter, GetEventFOV(125, EventDataClass)) )
    {
        Spotted.MyKFAIC.bIsVisibleToEnemy = true;

        // if zed just entered a player's view
        if( !Spotted.MyKFAIC.bWasVisibleToEnemy && Spotted.MyKFAIC.bIsVisibleToEnemy )
        {
            // if zed is within "surprise" (really close) range
            if( ActorWithinPawnRadius(Spotted, Spotter, GetEventRadius(136, EventDataClass))  )
            {
                PlayDialogEvent( KFPHSpotter, 136);
            }
            else if( ActorWithinPawnRadius(Spotted, Spotter, GetEventRadius(125, EventDataClass))  )
            {
                SpottedDialogEventID = Spotted.GetSpotterDialogID();
                if( CheckSpottedDialogPriority(KFPHSpotter, SpottedDialogEventID, BestSpottedEventID) )
                {
                    BestSpottedEventID = SpottedDialogEventID;
                }
                PlayDialogEvent( KFPHSpotter, BestSpottedEventID );
            }
        }
    }
    else
    {
        Spotted.MyKFAIC.bIsVisibleToEnemy = false;
    }
}

/** Check all of the things that can be spotted and pick the best one to comment on.
  * Called from Tick.
  */
function CheckSpottedDialog()
{
    local Pawn P;
    local KFPawn_Human KFPH;
    local KFPawn_Monster BestMonster;
    local int SpottedCount, SpottedEventID;

    local int NumOptions, BestOptionID;

    SpottedEventID = -1;
    BestOptionID = -1;

    // we only check one human pawn per call to CheckSpottedDialog, so we cache the next pawn we need to check.
    // if that pawn is invalid, reset it.
    if( NextSpotterPawn == none || NextSpotterPawn.bDeleteMe || !NextSpotterPawn.IsAliveAndWell() )
    {
        NextSpotterPawn = WorldInfo.PawnList;
    }

    // check what each player can spot
    for( P = NextSpotterPawn; P != none; P = P.NextPawn )
    {
        KFPH = KFPawn_Human(P);
        if( KFPH == none || !PawnIsValidPlayer(KFPH) )
        {
            continue;
        }

        // only call out zeds if you haven't been engaged with zeds for a little while
        if( KFPH.TimeSpentIdling() > IdleTimeForSpottingZed )
        {
            // FindBestSpottedMonster checks proximity, FOV, and dialog priority, but NOT line-of-sight.
            // We check line of sight only against the BestMonster returned by FindBestSpottedMonster for performance's sake.
            BestMonster = FindBestSpottedMonster( KFPH, SpottedCount, SpottedEventID );
            if( BestMonster != none && FastTrace(KFPH.GetPawnViewLocation(), BestMonster.Location) )
            {
                AddRandomDialogOption( KFPH, SpottedEventID, NumOptions, BestOptionID );

                if( float(BestMonster.Health) / float(BestMonster.HealthMax) <= ZedAlmostDeadHealthPctThreshold )
                {
                    AddRandomDialogOption( KFPH, 145, NumOptions, BestOptionID );
                }

                if( SpottedCount >= SpotLargeHordeNumZeds )
                {
                    AddRandomDialogOption( KFPH, 131, NumOptions, BestOptionID );
                }

                // check if BestMonster is "behind" any teammates
                if( SpotEnemyBehindPlayer(KFPH, BestMonster) )
                {
                    AddRandomDialogOption( KFPH, 137, NumOptions, BestOptionID );
                }
            }
        }

        // SprintTowardZedStartTime is set/reset in FindBestSpottedMonster, called above
        if( KFPH.SprintTowardZedStartTime > 0 && (WorldInfo.TimeSeconds - KFPH.SprintTowardZedStartTime) >= SprintTowardZedDuration )
        {
            AddRandomDialogOption( KFPH, 108, NumOptions, BestOptionID );
        }

        // only check for SpotItem and SpotAmmo dialog if we haven't already added higher priority dialog (like SpotZed)
        if( BestOptionID < 0 || GetEventPriority(BestOptionID, KFPH.GetVoiceGroupEventDataClass()) >= 5 )
        {
            CheckSpotPickupsDialog( KFPH, NumOptions, BestOptionID );
        }

        PlayDialogEvent( KFPH, BestOptionID );
        PlayBasicSpottedResponse(KFPH, BestMonster, BestOptionID);

        // since we're only checking one pawn per call, cache the next pawn in line and break
        NextSpotterPawn = KFPH.NextPawn;
        break;
    }
}

/** Finds the best zed to comment on based on proximity, field of view, and zed dialog priority */
function KFPawn_Monster FindBestSpottedMonster( KFPawn_Human Spotter, out int NumSpotted, out int BestSpottedEventID )
{
    local Pawn MP;
    local KFPawn_Monster KFPM, BestMonster;
    local int SpottedDialogEventID;
    local bool bSprintingTowardZed;
    local class<KFPawnVoiceGroupEventData> EventDataClass;

    EventDataClass = Spotter.GetVoiceGroupEventDataClass();

    for( MP = WorldInfo.PawnList; MP != none; MP = MP.NextPawn )
    {
        if( !MP.IsAliveAndWell() || MP.GetTeamNum() == 0 )
        {
            continue;
        }

        KFPM = KFPawn_Monster( MP );
        if( KFPM == none )
        {
            // should never happen, right?
            continue;
        }

        if( KFPM.bIsHeadless )
        {
            continue;
        }

        if( VSizeSq(KFPM.Location - Spotter.Location) >= GetEventRadiusSq(125, EventDataClass) )
        {
            continue;
        }

        if( ActorWithinPawnFOV(KFPM, Spotter, GetEventFOV(125, EventDataClass)) )
        {
            NumSpotted++;

            SpottedDialogEventID = KFPM.GetSpotterDialogID();

            // check priority of spotted dialog event for this zed against priority of best-so-far zed
            if( CheckSpottedDialogPriority(Spotter, SpottedDialogEventID, BestSpottedEventID) )
            {
                BestSpottedEventID = SpottedDialogEventID;
                BestMonster = KFPM;
            }

            // check if player is charging toward a zed
            if( Spotter.bIsSprinting && !bSprintingTowardZed && ActorWithinPawnFOV(KFPM, Spotter, GetEventFOV(108, EventDataClass)) )
            {
                bSprintingTowardZed = true;
                if( Spotter.SprintTowardZedStartTime < 0 )
                {
                    Spotter.SprintTowardZedStartTime = WorldInfo.TimeSeconds;
                }
            }
        }
    }

    // reset sprint-toward-zed start time if not sprinting toward zed
    if( !bSprintingTowardZed )
    {
        Spotter.SprintTowardZedStartTime = -1;
    }

    return BestMonster;
}

/** Checks if given zed is within spotter's view and right behind another player */
function bool SpotEnemyBehindPlayer( KFPawn_Human Spotter, KFPawn_Monster Enemy )
{
    local Pawn OtherPlayer;
    local vector FacingDir, ToEnemyDir, ToPlayerDir;
    local float EventRadiusSq;
    local class<KFPawnVoiceGroupEventData> EventDataClass;

    EventDataClass = Spotter.GetVoiceGroupEventDataClass();

    for( OtherPlayer = WorldInfo.PawnList; OtherPlayer != none; OtherPlayer = OtherPlayer.NextPawn )
    {
        if( !OtherPlayer.IsAliveAndWell() || OtherPlayer.GetTeamNum() != 0 || OtherPlayer == Spotter )
        {
            continue;
        }

        // check if the player is within view
        ToPlayerDir = OtherPlayer.Location - Spotter.Location;
        if( VSizeSq(ToPlayerDir) >= GetEventRadiusSq(125, EventDataClass) )
        {
            continue;
        }

        FacingDir = vector( Spotter.Rotation );
        ToPlayerDir = Normal( ToPlayerDir );

        if( ToPlayerDir dot FacingDir < GetEventFOV(125, EventDataClass) )
        {
            continue;
        }

        EventRadiusSq = GetEventRadiusSq(137, EventDataClass);

        // check if Enemy is within "behind view" of the player
        ToEnemyDir = Enemy.Location - OtherPlayer.Location;
        if( VSizeSq(ToEnemyDir) >= EventRadiusSq )
        {
            continue;
        }

        FacingDir = vector( OtherPlayer.Rotation );
        ToEnemyDir = Normal( ToEnemyDir );

        if( ToEnemyDir dot FacingDir <= -GetEventFOV(137, EventDataClass) )
        {
            // only consider behind if we can actually see the player whom Enemy is behind
            if( FastTrace(Spotter.GetPawnViewLocation(), OtherPlayer.GetPawnViewLocation()) )
            {
                return true;
            }

            // for efficiency's sake, break out after we find one good candidate, even if we don't succeed trace
            break;
        }
    }

    return false;
}

/** Checks if Spotter can see any pickups in the map */
function CheckSpotPickupsDialog( KFPawn_Human Spotter, out int out_NumOptions, out int out_BestOptionID )
{
    local int i;
    local KFGameInfo KFGI;
    local bool bSpottedWeapon, bSpottedArmor, bSpottedAmmo;
    local class< KFPawnVoiceGroupEventData > EventDataClass;

    KFGI = KFGameInfo( WorldInfo.Game );

    if( KFGI == none )
    {
        // should never happen, right?
        return;
    }

    EventDataClass = Spotter.GetVoiceGroupEventDataClass();

    for( i = 0; i < KFGI.AllPickupFactories.Length; ++i )
    {
        // ignore factories without visible pickups
        if( KFGI.AllPickupFactories[i].bPickupHidden )
        {
            continue;
        }

        // ignore weapon factories if a weapon was already spotted
        if( KFGI.AllPickupFactories[i].CurrentPickupIsWeapon() && bSpottedWeapon )
        {
            continue;
        }

        // ignore armor factories if armor was already spotted
        if( KFGI.AllPickupFactories[i].CurrentPickupIsArmor() && bSpottedArmor )
        {
            continue;
        }

        // ignore ammo factories if ammo was already spotted
        if( KFGI.AllPickupFactories[i].CurrentPickupIsAmmo() && bSpottedAmmo )
        {
            continue;
        }

        if( !PawnCanSpotActor(Spotter, KFGI.AllPickupFactories[i], GetEventRadiusSq(37, EventDataClass), GetEventFOV(37, EventDataClass), true) )
        {
            continue;
        }

        if( KFGI.AllPickupFactories[i].CurrentPickupIsWeapon() )
        {
            AddRandomDialogOption( Spotter, 37, out_NumOptions, out_BestOptionID );
            bSpottedWeapon = true;
        }
        else if( KFGI.AllPickupFactories[i].CurrentPickupIsArmor() )
        {
            AddRandomDialogOption( Spotter, 36, out_NumOptions, out_BestOptionID );
            bSpottedArmor = true;
        }
        else if( KFGI.AllPickupFactories[i].CurrentPickupIsAmmo() )
        {
            AddRandomDialogOption( Spotter, 35, out_NumOptions, out_BestOptionID );
            bSpottedAmmo = true;
        }

        // break out early if we've added all possible random dialog for pickups
        if( bSpottedWeapon && bSpottedArmor && bSpottedAmmo )
        {
            break;
        }
    }
}

/** Checks if any player can spot a zed that just cloaked/uncloaked */
function PlaySpotCloakDialog( KFPawn_Monster Cloaker, bool bNewCloaking )
{
    local KFPawn_Human KFPH;

    foreach WorldInfo.AllPawns( class'KFPawn_Human', KFPH )
    {
        if( !PawnIsValidPlayer(KFPH) )
        {
            continue;
        }

        if( PlayerCanSpotEnemy(KFPH, Cloaker) )
        {
            if( bNewCloaking )
            {
                PlayDialogEvent( KFPH, 143);
            }
            else
            {
                PlayDialogEvent( KFPH, 144);
            }
        }
    }
}

/** Checks if any player can spot a zed that just became enraged */
function PlaySpotEnragedDialog( KFPawn_Monster EnragedEnemy )
{
    local KFPawn_Human KFPH;

    foreach WorldInfo.AllPawns( class'KFPawn_Human', KFPH )
    {
        if( !PawnIsValidPlayer(KFPH) )
        {
            continue;
        }

        if( PlayerCanSpotEnemy(KFPH, EnragedEnemy) )
        {
            PlayDialogEvent( KFPH, 153);
        }
    }
}

/** Checks if player being charged can spot the zed charging him */
function PlaySpotChargeDialog( KFPawn_Monster ChargingEnemy, KFPawn TargetPlayer )
{
    local KFPawn_Human KFPH;

    KFPH = KFPawn_Human( TargetPlayer );
    if( KFPH == none )
    {
        return;
    }

    if( KFPH.VoiceGroupArch == none || KFPH.VoiceGroupArch.default.EventDataClass == none )
    {
        return;
    }

    if( PlayerCanSpotEnemy(KFPH, ChargingEnemy) )
    {
        PlayDialogEvent( KFPH, 152);
    }
}

/** Checks if any player can spot a zed about to shoot a rocket */
function PlaySpotRocketsDialog( KFPawn_Monster Spotted )
{
    local KFPawn_Human KFPH;
    local class< KFPawnVoiceGroupEventData > EventDataClass;

    foreach WorldInfo.AllPawns( class'KFPawn_Human', KFPH )
    {
        if( !PawnIsValidPlayer(KFPH) )
        {
            continue;
        }

        EventDataClass = KFPH.GetVoiceGroupEventDataClass();

        if( PlayerCanSpotEnemy(KFPH, Spotted, GetEventRadiusSq(155, EventDataClass), GetEventFOV(155, EventDataClass)) )
        {
            PlayDialogEvent( KFPH, 155);
        }
    }
}

/** Checks if any player can spot a zed about to throw a grenade */
function PlaySpotGrenadeDialog( KFPawn_Monster Spotted )
{
    local KFPawn_Human KFPH;
    local class< KFPawnVoiceGroupEventData > EventDataClass;

    foreach WorldInfo.AllPawns( class'KFPawn_Human', KFPH )
    {
        if( !PawnIsValidPlayer(KFPH) )
        {
            continue;
        }

        EventDataClass = KFPH.GetVoiceGroupEventDataClass();

        if( PlayerCanSpotEnemy(KFPH, Spotted, GetEventRadiusSq(156, EventDataClass), GetEventFOV(156, EventDataClass)) )
        {
            PlayDialogEvent( KFPH, 156);
        }
    }
}

/** Checks if a player being shot at can see shooter */
function PlayBeingShotAtDialog( KFPawn_Human Target, KFPawn_Monster Shooter )
{
    local class< KFPawnVoiceGroupEventData > EventDataClass;

    if( Target == none )
    {
        return;
    }

    EventDataClass = Target.GetVoiceGroupEventDataClass();

    if( PlayerCanSpotEnemy(Target, Shooter, GetEventRadiusSq(154, EventDataClass), GetEventFOV(154, EventDataClass)) )
    {
        PlayDialogEvent( Target, 154);
    }
}

/** Checks if any player can spot a zed about to heal */
function PlaySpotZedHealingDialog( KFPawn_Monster Spotted )
{
    local KFPawn_Human KFPH;

    foreach WorldInfo.AllPawns( class'KFPawn_Human', KFPH )
    {
        if( !PawnIsValidPlayer(KFPH) )
        {
            continue;
        }

        if( PlayerCanSpotEnemy(KFPH, Spotted) )
        {
            PlayDialogEvent( KFPH, 149);
        }
    }
}

/** Checks if any player can spot a zed that is running away */
function PlaySpotRunAwayDialog( KFPawn_Monster Spotted )
{
    local KFPawn_Human KFPH;

    foreach WorldInfo.AllPawns( class'KFPawn_Human', KFPH )
    {
        if( !PawnIsValidPlayer(KFPH) )
        {
            continue;
        }

        if( PlayerCanSpotEnemy(KFPH, Spotted) )
        {
            PlayDialogEvent( KFPH, 146);
        }
    }
}

/** Checks if player who could see boss can no longer see boss */
function PlayLoseSightOfBossDialog( KFPawn_Monster Boss, KFPawn_Human Speaker )
{
    local class< KFPawnVoiceGroupEventData > EventDataClass;

    EventDataClass = Speaker.GetVoiceGroupEventDataClass();

    if( ActorWithinPawnFOV(Boss, Speaker, GetEventFOV(148, EventDataClass)) )
    {
        PlayDialogEvent( Speaker, 148);
    }
}

/** Sets up basic response for spoken "spotted" dialog */
function PlayBasicSpottedResponse( KFPawn_Human Spotter, KFPawn_Monster Spotted, int SpottedEventID )
{
    local int ResponseEventID;

    if( Spotted == none )
    {
        return;
    }

    switch( SpottedEventID )
    {
    case 128:
        ResponseEventID = 133;
        break;

    case 130:
    case 129:
    case 127: // ?
    case 126: // ?
        ResponseEventID = 134;
        break;

    case 125:
        ResponseEventID =132;
        break;

    default:
        return; // do nothing
    };

    PlayBasicDialogResponse( Spotter, SpottedEventID, ResponseEventID, /*Responder*/, Spotted, true );
}

/************************************************
 * Situational Dialog
 ************************************************/

/** Checks if any player should play idle dialog */
function CheckIdleDialog()
{
    local KFPawn_Human KFPH;

    foreach WorldInfo.AllPawns( class'KFPawn_Human', KFPH )
    {
        if( !PawnIsValidPlayer(KFPH) )
        {
            continue;
        }

        if( KFPH.TimeSpentIdling() > IdleTimeForSituationalDialog )
        {
            PlaySituationalDialog( KFPH );
        }
    }
}

/** Plays idle/situational dialog for a given speaker to a target player */
function PlaySituationalDialog( KFPawn_Human Speaker )
{
    local KFPawn_Human Target;
    local class< KFPawnVoiceGroupEventData > EventDataClass;

    EventDataClass = Speaker.GetVoiceGroupEventDataClass();

    foreach WorldInfo.AllPawns( class'KFPawn_Human', Target )
    {
        if( Target == Speaker || !PawnIsValidPlayer(Target) )
        {
            continue;
        }

        if( PawnCanSpotPawn(Speaker, Target, GetEventRadiusSq(163, EventDataClass), GetEventFOV(163, EventDataClass)) )
        {
            break;
        }
    }

    PlayRandomSituationalDialog( Speaker, Target );
}

/** Calculates situational dialog options, then plays a random one */
function PlayRandomSituationalDialog( KFPawn_Human Speaker, KFPawn_Human Target )
{
    local int NumPlayers, NumLivingPlayers;

    local int NumOptions, BestOptionID;

    NumPlayers = WorldInfo.Game.NumPlayers;
    NumLivingPlayers = KFGameInfo( WorldInfo.Game ).GetLivingPlayerCount();

    BestOptionID = -1;

    // add option for environmental dialog (dark, cold, etc.) if player is within certain volumes
    if( Speaker.EnvironmentDialogEventID > 0 )
    {
        AddRandomDialogOption( Speaker, Speaker.EnvironmentDialogEventID, NumOptions, BestOptionID );
    }

    // if speaker has someone to speak to, play conversational dialog
    if( Target != none )
    {
        if( Target.MyKFWeapon != none && Target.MyKFWeapon.GetMaxAmmoAmount(0) > 0 )
        {
            AddRandomDialogOption( Speaker, 160, NumOptions, BestOptionID );
        }
        AddRandomDialogOption( Speaker, 157, NumOptions, BestOptionID );
        AddRandomDialogOption( Speaker, 163, NumOptions, BestOptionID );

        if( NumLivingPlayers == NumPlayers )
        {
            AddRandomDialogOption( Speaker, 164, NumOptions, BestOptionID );
        }
        else if( NumLivingPlayers > NumPlayers / 2 )
        {
            AddRandomDialogOption( Speaker, 168, NumOptions, BestOptionID );
        }
        else if( NumLivingPlayers == NumPlayers / 2 )
        {
            AddRandomDialogOption( Speaker, 166, NumOptions, BestOptionID );
        }

        if( Speaker.PlayerReplicationInfo.Score >= IdleHighDoshThreshold )
        {
            AddRandomDialogOption( Speaker, 170, NumOptions, BestOptionID );
        }
        else if( Speaker.PlayerReplicationInfo.Score <= IdleLowDoshThreshold )
        {
            AddRandomDialogOption( Speaker, 173, NumOptions, BestOptionID );
        }

        PlayDialogEvent( Speaker, BestOptionID );
        PlayCustomDialogResponse( Speaker, Target, BestOptionID, PlayRandomSituationalResponse, true );
    }
    // otherwise talk to self
    else if( NumPlayers > 1 && NumLivingPlayers == 1 )
    {
        AddRandomDialogOption( Speaker, 175, NumOptions, BestOptionID );
    }

    PlayDialogEvent( Speaker, BestOptionID );
}

/** Plays response to random situational dialog */
function PlayRandomSituationalResponse( const out DialogResponseInfo RespInfo )
{
    local int ResponseID, ResponderDoshAmt;
    local float ResponderHealthPct, ResponderAmmoPCt;

    ResponseID = -1;

    switch( RespInfo.RespondingToID )
    {
    case 157:
        ResponderHealthPct = RespInfo.Speaker.GetHealthPercentage();
        if( ResponderHealthPct >= NeedNoMoreHealingPctThreshold )
        {
            ResponseID = 159;
        }
        else if( ResponderHealthPct < NeedMoreHealingPctThreshold )
        {
            ResponseID = 158;
        }
        break;

    case 160:
        ResponderAmmoPCt = RespInfo.Speaker.MyKFWeapon.GetAmmoPercentage();
        if( ResponderAmmoPct >= 0.f )
        {
            if( ResponderAmmoPct > IdleHighAmmoPctThreshold)
            {
                ResponseID = 162;
            }
            else if( ResponderAmmoPCt < IdleLowAmmoPctThreshold)
            {
                ResponseID = 161;
            }
        }
        break;

    case 164:
        ResponseID = 165;
        break;

    case 166:
        ResponseID = 167;
        break;

    case 168:
        ResponseID = 169;
        break;

    case 170:
        ResponderDoshAmt = RespInfo.Speaker.PlayerReplicationInfo.Score;
        if( ResponderDoshAmt > IdleHighDoshThreshold)
        {
            ResponseID = 171;
        }
        else if( ResponderDoshAmt < IdleLowDoshThreshold )
        {
            ResponseID = 172;
        }
        break;

    case 173:
        ResponderDoshAmt = RespInfo.Speaker.PlayerReplicationInfo.Score;
        if( ResponderDoshAmt < IdleLowDoshThreshold )
        {
            ResponseID = 174;
        }
        break;
    };

    if( ResponseID >= 0 )
    {
        PlayDialogEvent( RespInfo.Speaker, ResponseID );
    }
}

/** Plays the "wave start" dialog from a random pawn */
function PlayWaveStartDialog( bool bBossWave )
{
    local int RandomPlayer;
    local KFPawn_Human KFPH;

    RandomPlayer = rand( KFGameInfo(WorldInfo.Game).GetLivingPlayerCount() );

    foreach WorldInfo.AllPawns( class'KFPawn_Human', KFPH )
    {
        if( PawnIsValidPlayer(KFPH) && (RandomPlayer-- == 0) )
        {
            break;
        }
    }

    if( bBossWave )
    {
        PlayDialogEvent( KFPH, 179);
    }
    else
    {
        PlayDialogEvent( KFPH, 176);
    }
}

function PlayEnvironmentalDialog( KFPawn_Human Speaker, int EventID )
{
    PlayDialogEvent( Speaker, EventID );
}

/************************************************
 * Objective Dialog
 ************************************************/

function PlayAcceptObjectiveDialog( array<PlayerReplicationInfo> PRIsInObj )
{
    local array< KFPawn_Human > PawnsInObj;

    GetHumanPawnsInObj( PawnsInObj, PRIsInObj );
    PlayObjectiveDialogOnRandomPlayers( PawnsInObj, 206);
}

function PlayDeclineObjectiveDialog( array<PlayerReplicationInfo> PRIsInObj )
{
    local array< KFPawn_Human > PawnsInObj;

    GetHumanPawnsInObj( PawnsInObj, PRIsInObj );
    PlayObjectiveDialogOnRandomPlayers( PawnsInObj, 205);
}

function PlayWinObjectiveDialog( array<PlayerReplicationInfo> PRIsInObj )
{
    local array< KFPawn_Human > PawnsInObj;

    GetHumanPawnsInObj( PawnsInObj, PRIsInObj );
    PlayObjectiveDialogOnRandomPlayers( PawnsInObj, 201, 202);
}

function PlayLoseObjectiveDialog( array<PlayerReplicationInfo> PRIsInObj )
{
    local array< KFPawn_Human > PawnsInObj;

    GetHumanPawnsInObj( PawnsInObj, PRIsInObj );
    PlayObjectiveDialogOnRandomPlayers( PawnsInObj, 203, 204);
}

/** Fills an "out" array with pawns that are in an objective given the PRIs in the objective */
function GetHumanPawnsInObj( out array<KFPawn_Human> out_PawnsInObj, const out array<PlayerReplicationInfo> PRIsInObj )
{
    local KFPawn_Human KFPH;
    local int PRIIdx;

    foreach WorldInfo.AllPawns( class'KFPawn_Human', KFPH )
    {
        if( PawnIsValidPlayer(KFPH) )
        {
            PRIIdx = PRIsInObj.Find( KFPH.PlayerReplicationInfo );
            if( PRIIdx != INDEX_None )
            {
                out_PawnsInObj.AddItem( KFPH );
            }
        }
    }
}

/** Plays dialog for random player within an objective */
function PlayObjectiveDialogOnRandomPlayers( array<KFPawn_Human> PawnsInObj, int EventID, optional int ResponseID = -1 )
{
    local int RandIdx;
    local KFPawn_Human Speaker, Responder;

    RandIdx = Rand( PawnsInObj.Length );
    Speaker = PawnsInObj[RandIdx];
    PawnsInObj.Remove( RandIdx, 1 );
    if( Speaker != none )
    {
        PlayDialogEvent( Speaker, EventID );
    }

    if( ResponseID < 0 )
    {
        return;
    }

    RandIdx = Rand( PawnsInObj.Length );
    Responder = PawnsInObj[RandIdx];
    if( Responder != none )
    {
        PlayBasicDialogResponse( Speaker, EventID, ResponseID, Responder,, true );
    }
}

function PlayDefendObjDialog( byte PrevObjProgress, byte CurrObjProgress )
{
    local KFPawn_Human KFPH;

    // check obj progress
    foreach WorldInfo.AllPawns( class'KFPawn_Human', KFPH )
    {
        if( !PawnIsValidPlayer(KFPH) )
        {
            continue;
        }

        if( CurrObjProgress == 0 )
        {
            PlayDialogEvent( KFPH, 207);
        }
        else if( PrevObjProgress < 100 && CurrObjProgress >= 100 )
        {
            PlayDialogEvent( KFPH, 201);
        }
        else if( PrevObjProgress < 50 && CurrObjProgress >= 50 )
        {
            PlayDialogEvent( KFPH, 208);
        }
    }
}


/************************************************
 * Favorite Weapons Dialog
 ************************************************/

function PlaySwitchToFavoriteWeaponDialog( KFPawn_Human Speaker )
{
    local int FavoriteWeaponIndex;
    local KFCharacterInfo_Human KFCI;

    if( Speaker == none || Speaker.Weapon == none )
    {
        // wut?
        return;
    }

    KFCI = KFCharacterInfo_Human( Speaker.CharacterArch );
    if( KFCI == none )
    {
        return;
    }

    FavoriteWeaponIndex = KFCI.GetFavoriteWeaponIndexOf( Speaker.Weapon );
    if( FavoriteWeaponIndex < 0 )
    {
        return;
    }

    PlayDialogEvent( Speaker, 42+ FavoriteWeaponIndex );
}

/************************************************
 * Voice Command Dialog
 ************************************************/

function PlayVoiceCommandDialog( KFPawn Speaker, int CommandIndex )
{
    switch( CommandIndex )
    {
    case 0:
        PlayDialogEvent( Speaker,  5);
        break;

    case 1:
        PlayDialogEvent( Speaker,  3);
        break;
    case 2:
        PlayDialogEvent( Speaker,  7);
        break;
    case 3:
        PlayDialogEvent( Speaker,  2);
        break;
    case 4:
        PlayDialogEvent( Speaker,  1);
        break;
    case 5:
        PlayDialogEvent( Speaker,  0);
        break;
    case 6:
        PlayDialogEvent( Speaker,  8);
        break;
    case 7:
        PlayDialogEvent( Speaker,  9);
        break;
    };
}

/************************************************
 * Common Boss Dialog
 ************************************************/

function PlayBossMonologue( KFPawn Boss, byte MonologueType )
{
    if( ETheatricType(MonologueType) == THEATRIC_Entrance )
    {
        PlayDialogEvent( Boss, 0);
    }
    else if( ETheatricType(MonologueType) == THEATRIC_Victory )
    {
        PlayDialogEvent( Boss, 13);
    }
}

function PlayBossLoseSightOfDialog( KFPawn_Monster BossSpeaker, KFPawn_Human Target )
{
    local class< KFPawnVoiceGroupEventData > EventDataClass;

    EventDataClass = BossSpeaker.GetVoiceGroupEventDataClass();

    if( ActorWithinPawnFOV(Target, BossSpeaker, GetEventFOV(5, EventDataClass)) )
    {
        PlayDialogEvent( BossSpeaker, 5);
    }
}

function PlayBossChallengeDialog( KFPawn Boss )
{
    PlayDialogEvent( Boss, 4);
}

function PlayBossGrabDialog( KFPawn Boss )
{
    PlayDialogEvent( Boss, 7);
}

function PlayBossHealDialog( KFPawn Boss )
{
    PlayDialogEvent( Boss, 8);
}

function PlayBossTakeDamageDialog( KFPawn Boss )
{
    if( float(Boss.Health) / float(Boss.HealthMax) < 0.25f )
    {
        PlayDialogEvent( Boss, 10);
    }
    else
    {
        PlayDialogEvent( Boss, 9);
    }
}

function PlayBossDeathDialog( KFPawn Boss )
{
    PlayDialogEvent( Boss, 11);
}

function PlayBossLeapedDialog( KFPawn Boss )
{
    PlayDialogEvent( Boss, 14);
}

function PlayBossLandedDialog( KFPawn Boss )
{
    PlayDialogEvent( Boss, 15);
}

/************************************************
 * Hans Dialog
 ************************************************/

function PlayHansTickDialog( KFPawn Hans )
{
    local int NumPlayers, NumLivingPlayers, NumOptions, BestOptionID;
    local float PlayersAlivePct, DistToTargetSq, MaxDistToTargetSq;
    local KFPawn_ZedHansBase HansBase;

    BestOptionID = -1;

    if( Hans.bIsSprinting && Hans.MyKFAIC.Enemy != none )
    {
        DistToTargetSq = VSizeSq(Hans.Location - Hans.MyKFAIC.Enemy.Location);
        MaxDistToTargetSq = GetEventRadiusSq( 17, Hans.GetVoiceGroupEventDataClass() );
        if( DistToTargetSq <= MaxDistToTargetSq )
        {
            AddRandomDialogOption( Hans, 17, NumOptions, BestOptionID );
        }
    }

    NumPlayers = WorldInfo.Game.NumPlayers;
    NumLivingPlayers = KFGameInfo( WorldInfo.Game ).GetLivingPlayerCount();
    if( NumLivingPlayers > 0 )
    {
		HansBase = KFPawn_ZedHansBase( Hans );
        if( HansBase != none && HansBase.bInHuntAndHealMode )
        {
            AddRandomDialogOption( Hans, 28, NumOptions, BestOptionID );
        }

        PlayersAlivePct = float(NumLivingPlayers) / float(NumPlayers);

        if( PlayersAlivePct >= 0.5 )
        {
            AddRandomDialogOption( Hans, 1, NumOptions, BestOptionID );
        }
        else if( PlayersAlivePct >= 0.25 )
        {
            AddRandomDialogOption( Hans, 2, NumOptions, BestOptionID );
        }
        else
        {
            AddRandomDialogOption( Hans, 3, NumOptions, BestOptionID );

            // @todo: hook up taunt for unfrozen German soldier
        }
    }

    PlayDialogEvent( Hans, BestOptionID );
}

function PlayHansDrawGunsDialog( KFPawn Hans )
{
    PlayDialogEvent( Hans, 18);
}

function PlayHansNadeDialog( KFPawn Hans, bool bBarrage )
{
    if( bBarrage )
    {
        PlayDialogEvent( Hans, 30);
    }
    else
    {
        PlayDialogEvent( Hans, 29);
    }
}

function PlayHansSmokeDialog( KFPawn Hans, bool bBarrage )
{
    if( bBarrage )
    {
        PlayDialogEvent( Hans, 27);
    }
    else
    {
        PlayDialogEvent( Hans, 26);
    }
}

function PlayHansGasDialog( KFPawn Hans, bool bBarrage )
{
    if( bBarrage )
    {
        PlayDialogEvent( Hans, 24);
    }
    else
    {
        PlayDialogEvent( Hans, 23);
    }
}

function PlayHansKilledDialog( KFPawn Hans, class<DamageType> DmgType )
{
    local int NumOptions, BestOptionID;

    BestOptionID = -1;

    AddRandomDialogOption( Hans, 12, NumOptions, BestOptionID );

    if( class<KFDamageType>(DmgType) != none )
    {
        AddRandomDialogOption( Hans, class<KFDamageType>(DmgType).static.GetKillerDialogID(), NumOptions, BestOptionID );
    }

    // @todo: figure out a way to make this less hard-coded? (see also KFAIController::DoStrike)
    if( Hans.GetSpecialMoveTag() == 'Frenzy_Lunge' )
    {
        AddRandomDialogOption( Hans, 22, NumOptions, BestOptionID );
    }

    PlayDialogEvent( Hans, BestOptionID );
}

function PlayHansDamagePlayerDialog( KFPawn Hans, class<DamageType> DmgType )
{
    if( DmgType.Name == 'KFDT_Ballistic_HansAK12' ) // Hans' MkB42s use this damage type at the moment. @todo: fix this if/when necessary
    {
        PlayDialogEvent( Hans, 19);
    }
}

function PlayHansFrenzyDialog( KFPawn Hans )
{
    PlayDialogEvent( Hans, 21);
}

function PlayHansAOEDialog( KFPawn Hans )
{
    PlayDialogEvent( Hans, 37);
}

function PlayHansBattlePhaseDialog( KFPawn Hans, int CurrBattlePhase )
{
    if( !Hans.IsAliveAndWell() )
    {
        return;
    }

    switch( CurrBattlePhase )
    {
    case 2:
        PlayDialogEvent( Hans, 34);
        break;

    case 3:
        PlayDialogEvent( Hans, 35);
        break;

    case 4:
        PlayDialogEvent( Hans, 36);
        break;
    };
}

/************************************************
 * Patriarch Dialog
 ************************************************/

function PlayPattyMinigunWarnDialog( KFPawn Patty )
{
    PlayDialogEvent( Patty, 16);
}

function PlayPattyMinigunAttackDialog( KFPawn Patty )
{
    PlayDialogEvent( Patty, 17);
}

function PlayPattyTentaclePullDialog( KFPawn Patty )
{
    PlayDialogEvent( Patty, 21);
}

function PlayPattyChildKilledDialog( KFPawn Patty )
{
    PlayDialogEvent( Patty, 25);
}

function PlayPattyKilledDialog( KFPawn Patty, class<DamageType> DmgType )
{
    local int NumOptions, BestOptionID;

    BestOptionID = -1;

    AddRandomDialogOption( Patty, 12, NumOptions, BestOptionID );

    if( class<KFDamageType>(DmgType) != none )
    {
        AddRandomDialogOption( Patty, class<KFDamageType>(DmgType).static.GetKillerDialogID(), NumOptions, BestOptionID );
    }

    PlayDialogEvent( Patty, BestOptionID );
}

function PlayPattyBattlePhaseDialog( KFPawn Patty, int CurrBattlePhase )
{
    if( !Patty.IsAliveAndWell() )
    {
        return;
    }

    switch( CurrBattlePhase )
    {
    case 2:
        PlayDialogEvent( Patty, 26);
        break;

    case 3:
        PlayDialogEvent( Patty, 27);
        break;

    case 4:
        PlayDialogEvent( Patty, 28);
        break;
    };
}

function PlayPattyWhirlwindDialog( KFPawn Patty )
{
    PlayDialogEvent( Patty, 36);
}

defaultproperties
{
   bEnabled=True
   InterruptPriorityThreshold=2
   InterruptedByAnyPriorityThreshold=7
   WeldAboutToBreakThreshold=60
   NeedMoreHealingPctThreshold=0.750000
   NeedNoMoreHealingPctThreshold=0.750000
   CaughtSomeDoshAmt=50
   CaughtMuchDoshAmt=250
   NumZedsForPressureReload=1
   LowSpareAmmoPctThreshold=0.150000
   NumKillsForOnARoll=6
   CloseCallKillHealthPctThreshold=0.300000
   NumZedsInAreaForMassacre=9
   AreaRadiusForMassacre=2500.000000
   TimeLimitForMassacre=30.000000
   NumHitsForDeadHorse=3
   TimeBetweenHitsForDeadHorse=1.000000
   TimeForContinuousDamageThreshold=3.000000
   TimeBetweenHitsForContinuousDamage=0.750000
   PlayerHealthPctForNearDeath=0.200000
   PlayerTakeDamageStreakInterval=1.000000
   PlayerTakeDamageStreakPctForScream=0.250000
   IdleTimeforSpottingZed=5.000000
   SpotLargeHordeNumZeds=6
   ZedAlmostDeadHealthPctThreshold=0.300000
   SprintTowardZedDuration=1.500000
   IdleTimeForSituationalDialog=7.000000
   IdleLowDoshThreshold=350
   IdleHighDoshThreshold=3500
   TimeUntilStartSprintPanting=3.000000
   StopBreathingAkEvent=AkEvent'WW_GLO_Runtime.Stop_Breathing'
   CollisionType=COLLIDE_CustomDefault
   Name="Default__KFDialogManager"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
