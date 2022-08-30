//=============================================================================
// KFPawn_ZedFleshpoundKing
//=============================================================================
// Fleshpound King pawn class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//  - Matt 'Squirrlz' Farber
//=============================================================================
class KFPawn_ZedFleshpoundKing extends KFPawn_ZedFleshpound
    implements(KFInterface_MonsterBoss);

/** Explosion templates for our rage pound */
var protected KFGameExplosion RagePoundExplosionTemplate, RagePoundFinalExplosionTemplate;

/** Additional chest plate/lighting/FX settings for beam attack state */
var const LinearColor BeamAttackGlowColor;
var transient PointLightComponent BattlePhaseLightTemplateBlue;

/** Current phase of battle */
var int CurrentPhase;

/** Min phase at which the rage explosions can occur */
var const int RageExplosionMinPhase;

/** Waves to summon at each stage by difficulty level*/
var	BossMinionWaveInfo				SummonWaves[4];

/** The base amount of minions to spawn when boss goes into hunt and heal mode */
var vector2D                        NumMinionsToSpawn;

/** Component used by the beam special move to play a hit location sound effect */
var AkComponent                     BeamHitAC;

/** Shield Vars */
/** Amount of health shield has remaining */
var float                           ShieldHealth;
var float                           ShieldHealthMax;
var const array<float>              ShieldHealthMaxDefaults;
var float							ShieldHealthScale;

/** Replicated shield health percentage */
var repnotify   byte                ShieldHealthPctByte;

var float LastShieldHealthPct;
var ParticleSystem InvulnerableShieldFX;
var ParticleSystemComponent InvulnerableShieldPSC;
var name ShieldSocketName;

var KFSkinTypeEffects ShieldImpactEffects;
var KFGameExplosion ShieldShatterExplosionTemplate;

var const color ShieldColorGreen;
var const color ShieldCoreColorGreen;
var const color ShieldColorYellow;
var const color ShieldCoreColorYellow;
var const color ShieldColorOrange;
var const color ShieldCoreColorOrange;
var const color ShieldColorRed;
var const color ShieldCoreColorRed;

//Localization
var localized array<string> BossCaptionStrings;

//Intro Camera
var bool bUseAnimatedCamera;
var vector AnimatedBossCameraOffset;

replication
{
    if (bNetDirty)
        CurrentPhase, ShieldHealthPctByte;
}

/************************************
* @name	KFInterface_MonsterBoss
************************************/
//Quick access to a pawn reference
simulated function KFPawn_Monster GetMonsterPawn()
{
    return self;
}

//Localization Accessors
simulated function string GetRandomBossCaption()
{
    if (default.BossCaptionStrings.Length <= 0)
    {
        return "";
    }

    return default.BossCaptionStrings[Rand(default.BossCaptionStrings.Length)];
}

//Status Accessors
static simulated event bool IsABoss()
{
    return true;
}

simulated function float GetHealthPercent()
{
    return float(Health) / float(HealthMax);
}

//Intro functionality
/** Turn on the boss camera animation mode */
simulated function SetAnimatedBossCamera(bool bEnable, optional vector CameraOffset)
{
    bUseAnimatedCamera = bEnable;
    if (bUseAnimatedCamera)
    {
        AnimatedBossCameraOffset = CameraOffset;
    }
    else
    {
        AnimatedBossCameraOffset = vect(0, 0, 0);
    }
}

/** Whether this pawn is in theatric camera mode */
simulated function bool UseAnimatedBossCamera()
{
    return bUseAnimatedCamera;
}

/** The name of the socket to use as a camera base for theatric sequences */
simulated function name GetBossCameraSocket()
{
    return 'TheatricCameraRootSocket';
}

/** The relative offset to use for the cinematic camera */
simulated function vector GetBossCameraOffset()
{
    return AnimatedBossCameraOffset;
}

function OnZedDied(Controller Killer)
{
    super.OnZedDied(Killer);

	StopBossWave();
    KFGameInfo(WorldInfo.Game).BossDied(Killer);
}

function KFAIWaveInfo GetWaveInfo(int BattlePhase, int Difficulty)
{
    switch (BattlePhase)
    {
    case 1:
        return SummonWaves[Difficulty].PhaseTwoWave;
        break;
    case 2:
        return SummonWaves[Difficulty].PhaseThreeWave;
        break;
    case 3:
        return SummonWaves[Difficulty].PhaseFourWave;
        break;
    case 0:
    default:
        return SummonWaves[Difficulty].PhaseOneWave;
    }

    return none;
}

/** Returns the number of minions to spawn based on number of players */
function byte GetNumMinionsToSpawn()
{
    if (KFGameInfo(WorldInfo.Game) != none)
    {
        return byte(Lerp(NumMinionsToSpawn.X, NumMinionsToSpawn.Y, KFGameInfo(WorldInfo.Game).GetLivingPlayerCount() / float(WorldInfo.Game.MaxPlayers)));
    }

    //Backup if we're in a weird state
    return byte(Lerp(NumMinionsToSpawn.X, NumMinionsToSpawn.Y, fMax(WorldInfo.Game.NumPlayers, 1) / float(WorldInfo.Game.MaxPlayers)));
}

//
simulated event ReplicatedEvent(name VarName)
{
    if (VarName == nameof(ShieldHealthPctByte))
    {
        UpdateShield();
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
}

/** Called from Possessed event when this controller has taken control of a Pawn */
function PossessedBy(Controller C, bool bVehicleTransition)
{
    Super.PossessedBy(C, bVehicleTransition);

    PlayBossMusic();
    class'KFPawn_MonsterBoss'.static.PlayBossEntranceTheatrics(self);
}

/** Play music for this boss (overridden for each boss) */
function PlayBossMusic()
{
    if (KFGameInfo(WorldInfo.Game) != none)
    {
        KFGameInfo(WorldInfo.Game).ForceKingFPMusicTrack();
    }
}

//Skip for boss
function CauseHeadTrauma(float BleedOutTime = 5.f)
{
    return;
}

simulated function bool PlayDismemberment(int InHitZoneIndex, class<KFDamageType> InDmgType, optional vector HitDirection)
{
    return false;
}

//Skip if boss
simulated function PlayHeadAsplode()
{
    return;
}

//Skip if boss
simulated function ApplyHeadChunkGore(class<KFDamageType> DmgType, vector HitLocation, vector HitDirection)
{
    return;
}

/** Turns the chest beam ON */
simulated function ANIMNOTIFY_ChestBeamStart()
{
    ToggleSMBeam( true );
}

/** Turns the chest beam OFF */
simulated function ANIMNOTIFY_ChestBeamEnd()
{
	ToggleSMBeam( false );
}

/** Toggles chest beam while special move active */
simulated function ToggleSMBeam( bool bEnable )
{
	local KFSM_FleshpoundKing_ChestBeam BeamSM;

	if( SpecialMove != SM_HoseWeaponAttack )
	{
		return;
	}

	BeamSM = KFSM_FleshpoundKing_ChestBeam( SpecialMoves[SpecialMove] );
	if( BeamSM != none )
	{
		BeamSM.ToggleBeam( bEnable );
	}
}

/** Use our custom glow for the chestbeam attack when necessary */
simulated function UpdateGameplayMICParams()
{
	local MaterialInstanceConstant MIC;

	// If dead just go with the super
    if( !IsAliveAndWell() )
    {
    	super.UpdateGameplayMICParams();
    	return;
    }

	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		// We're using our chest beam attack, apply our custom color
		if( IsDoingSpecialMove(SM_HoseWeaponAttack) )
		{
			super(KFPawn_Monster).UpdateGameplayMICParams();
			UpdateBattlePhaseLights();

			MIC = CharacterMICs[0];
			MIC.SetVectorParameterValue( 'Vector_GlowColor', BeamAttackGlowColor );
			return;
		}
	}

    super.UpdateGameplayMICParams();
}

/** Use our custom glow for the chestbeam attack when necessary */
simulated function UpdateBattlePhaseLights()
{
    local PointLightComponent LightTemplate;

	// If dead just go with the super
    if( !IsAliveAndWell() )
    {
    	super.UpdateBattlePhaseLights();
    	return;
    }

    if( IsDoingSpecialMove(SM_HoseWeaponAttack) )
    {
	    if( BattlePhaseLightFront != none )
	    {
	        BattlePhaseLightFront.DetachFromAny();
	        BattlePhaseLightFront = none;
	    }

	    LightTemplate = BattlePhaseLightTemplateBlue;

        if( LightTemplate != none )
        {
    	    BattlePhaseLightFront = new(self) class'PointLightComponent'( LightTemplate );
    	}

        if( BattlePhaseLightFront != none )
        {
            Mesh.AttachComponentToSocket( BattlePhaseLightFront, BattlePhaseLightFrontSocketName );
            BattlePhaseLightFront.SetEnabled( true );
        }
        return;
    }

    super.UpdateBattlePhaseLights();
}

/** Do our radial stumble on the first few pounds */
simulated function ANIMNOTIFY_RagePoundLeft()
{
	local vector ExploLocation;

    if (CurrentPhase < RageExplosionMinPhase)
    {
        return;
    }

	Mesh.GetSocketWorldLocationAndRotation( 'FX_Root', ExploLocation );
	TriggerRagePoundExplosion( ExploLocation );
}

/** Do our radial stumble on the first few pounds */
simulated function ANIMNOTIFY_RagePoundRight()
{
	local vector ExploLocation;

    if (CurrentPhase < RageExplosionMinPhase)
    {
        return;
    }

	Mesh.GetSocketWorldLocationAndRotation( 'FX_Root', ExploLocation );
	TriggerRagePoundExplosion( ExploLocation );
}

/** Do our radial knockdown on the final pound */
simulated function ANIMNOTIFY_RagePoundRightFinal()
{
	local vector ExploLocation;

    if (CurrentPhase < RageExplosionMinPhase)
    {
        return;
    }

	Mesh.GetSocketWorldLocationAndRotation( 'FX_Root', ExploLocation );
	TriggerRagePoundExplosion( ExploLocation, true );
}

function SpawnSubWave()
{
    local KFAIWaveInfo SpawnInfo;
    local KFGameInfo KFGI;

    KFGI = KFGameInfo(WorldInfo.Game);

    SpawnInfo = GetWaveInfo(CurrentPhase, KFGI.GetModifiedGameDifficulty());
    KFGI.SpawnManager.SummonBossMinions(SpawnInfo.Squads, GetNumMinionsToSpawn(), false);

    //King fleshpound summons once and stops.  Force the stop a couple seconds after spawn.
    SetTimer(2.f, true, nameof(PauseBossWave));
}

function PauseBossWave()
{
    local KFGameInfo KFGI;

    KFGI = KFGameInfo(WorldInfo.Game);

    if (KFGI.SpawnManager.GetNumAINeeded() <= 0)
    {
		StopBossWave();
    }
}

function StopBossWave()
{
	local KFGameInfo KFGI;

	KFGI = KFGameInfo(WorldInfo.Game);

	Cleartimer(nameof(PauseBossWave));
	KFGI.SpawnManager.StopSummoningBossMinions();
}

simulated function TriggerRagePoundExplosion( vector ExploLocation, optional bool bIsFinalPound=false )
{
	local KFExplosionActor ExploActor;

	// Boom
	ExploActor = Spawn( class'KFExplosionActor', self,, ExploLocation );
	ExploActor.InstigatorController = Controller;
	ExploActor.Instigator = self;
	ExploActor.Explode( bIsFinalPound ? RagePoundFinalExplosionTemplate : RagePoundExplosionTemplate, vect(0,0,1) );
}

/** Reduce damage when in hunt and heal mode */
function AdjustDamage(out int InDamage, out vector Momentum, Controller InstigatedBy, vector HitLocation, class<DamageType> DamageType, TraceHitInfo HitInfo, Actor DamageCauser)
{
    super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);

    if (ShieldHealth > 0)
    {
        ShieldHealth -= InDamage;

        if (ShieldHealth < 0)
        {
            InDamage = Abs(ShieldHealth);
            ShieldHealth = 0;
        }
        else
        {
            InDamage = 0;
        }

        ShieldHealthPctByte = FloatToByte(FClamp(ShieldHealth / ShieldHealthMax, 0.f, 1.f));
        UpdateShield();
    }
}

function HandleAfflictionsOnHit(Controller DamageInstigator, vector HitDir, class<KFDamageType> DamageType, Actor DamageCauser)
{
	if (ShieldHealthPctByte == 0)
	{
		super.HandleAfflictionsOnHit(DamageInstigator, HitDir, DamageType, DamageCauser);
	}
}

function SetShieldScale(float InScale)
{
	ShieldHealthScale = InScale;
}

function ActivateShield()
{
    local KFGameInfo KFGI;
    local float HealthMod;
    local float HeadHealthMod;

    KFGI = KFGameInfo(WorldInfo.Game);
    if (KFGI != None)
    {
        HealthMod = 1.f;
        KFGI.DifficultyInfo.GetAIHealthModifier(self, KFGI.GetModifiedGameDifficulty(), KFGI.GetLivingPlayerCount(), HealthMod, HeadHealthMod);

        ShieldHealth = ShieldHealthMaxDefaults[KFGI.GetModifiedGameDifficulty()] * HealthMod * ShieldHealthScale;
        ShieldHealthMax = ShieldHealth;
        ShieldHealthPctByte = 1;
        UpdateShield();
    }
}

simulated function ActivateShieldFX()
{
    InvulnerableShieldPSC = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(InvulnerableShieldFX, Mesh, ShieldSocketName, true);
    InvulnerableShieldPSC.SetAbsolute(false, true, true);
}

simulated function UpdateShield()
{
    local float ShieldHealthPct;

    // Not on dedicated servers
    if (WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }

    ShieldHealthPct = ByteToFloat(ShieldHealthPctByte);

    if (ShieldHealthPct > 0.f && LastShieldHealthPct <= 0.f)
    {
        ActivateShieldFX();
    }

    // Break the shield if it has no health left
    if (ShieldHealthPct == 0.f
        && InvulnerableShieldPSC != none
        && InvulnerableShieldPSC.bIsActive
        && InvulnerableShieldPSC.bAttached)
    {
        BreakShield();
    }
    else if (InvulnerableShieldPSC != none)
    {
        if (ShieldHealthPct >= 0.75f) // Green
        {
            if (LastShieldHealthPct < 0.75f)
            {
                InvulnerableShieldPSC.SetVectorParameter('Shield_Color', MakeVectorFromColor(ShieldColorGreen));
                InvulnerableShieldPSC.SetVectorParameter('Shield_CoreColor', MakeVectorFromColor(ShieldCoreColorGreen));
            }
        }
        else if (ShieldHealthPct >= 0.5f) // Yellow
        {
            if (LastShieldHealthPct >= 0.75f || LastShieldHealthPct < 0.5f)
            {
                InvulnerableShieldPSC.SetVectorParameter('Shield_Color', MakeVectorFromColor(ShieldColorYellow));
                InvulnerableShieldPSC.SetVectorParameter('Shield_CoreColor', MakeVectorFromColor(ShieldCoreColorYellow));
            }
        }
        else if (ShieldHealthPct >= 0.25f) // Orange
        {
            if (LastShieldHealthPct >= 0.5f || LastShieldHealthPct < 0.25f)
            {
                InvulnerableShieldPSC.SetVectorParameter('Shield_Color', MakeVectorFromColor(ShieldColorOrange));
                InvulnerableShieldPSC.SetVectorParameter('Shield_CoreColor', MakeVectorFromColor(ShieldCoreColorOrange));
            }
        }
        else if (LastShieldHealthPct >= 0.25f) // Red
        {
            InvulnerableShieldPSC.SetVectorParameter('Shield_Color', MakeVectorFromColor(ShieldColorRed));
            InvulnerableShieldPSC.SetVectorParameter('Shield_CoreColor', MakeVectorFromColor(ShieldCoreColorRed));
        }

        // Scale the invulnerable material param
        CharacterMICs[0].SetScalarParameterValue('Scalar_DamageResist', ShieldHealthPct);

        // Cache off so we know whether the material params need to change
        LastShieldHealthPct = ShieldHealthPct;

        UpdateShieldUI();
    }
}

/** Creates a vector parameter from a standard color */
simulated function vector MakeVectorFromColor(color InColor)
{
    local LinearColor LinColor;
    local vector ColorVec;

    LinColor = ColorToLinearColor(InColor);
    ColorVec.X = LinColor.R;
    ColorVec.Y = LinColor.G;
    ColorVec.Z = LinColor.B;

    return ColorVec;
}

/** Breaks the shield */
simulated function BreakShield()
{
    local KFExplosionActor ExplosionActor;

    if (WorldInfo.NetMode != NM_DedicatedServer)
    {
        // Detach shield and zero out material params
        DetachShieldFX();
        CharacterMICs[0].SetScalarParameterValue('Scalar_DamageResist', 0.0);

        // Spawn a shatter explosion
        ExplosionActor = Spawn(class'KFExplosionActor', self, , Location, rotator(vect(0, 0, 1)));
        if (ExplosionActor != None)
        {
            ExplosionActor.Explode(ShieldShatterExplosionTemplate);
        }
    }
}

simulated function DetachShieldFX()
{
    LastShieldHealthPct = 0.f;
    DetachEmitter(InvulnerableShieldPSC);
    UpdateShieldUI();
}

simulated function UpdateShieldUI()
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(GetALocalPlayerController());
    if (KFPC != none && KFPC.IsLocalController())
    {
        if (KFPC.MyGFxHUD != none && KFPC.MyGFxHUD.bossHealthBar != none)
        {
            KFPC.MyGFxHUD.bossHealthBar.UpdateBossShield(LastShieldHealthPct);
        }
    }
}

simulated function string GetIconPath()
{
	return "ZED_Patriarch_UI.ZED-VS_Icon_Boss";
}

defaultproperties
{
   RagePoundExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedFleshpoundKing:ExploTemplate0'
   RagePoundFinalExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedFleshpoundKing:ExploTemplate1'
   BeamAttackGlowColor=(R=0.170000,G=0.220000,B=1.000000,A=1.000000)
   RageExplosionMinPhase=1
   SummonWaves(0)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave',PhaseFourWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave')
   SummonWaves(1)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave',PhaseFourWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave')
   SummonWaves(2)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave',PhaseFourWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave')
   SummonWaves(3)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave',PhaseFourWave=KFAIWaveInfo'GP_Spawning_ARCH.Outbreak.KingFleshpoundSubWave')
   NumMinionsToSpawn=(X=1.000000,Y=6.000000)
   Begin Object Class=AkComponent Name=BeamHitAC0
      bStopWhenOwnerDestroyed=True
      Name="BeamHitAC0"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   BeamHitAC=BeamHitAC0
   ShieldHealthMaxDefaults(0)=1800.000000
   ShieldHealthMaxDefaults(1)=2700.000000
   ShieldHealthMaxDefaults(2)=4000.000000
   ShieldHealthMaxDefaults(3)=5000.000000
   ShieldHealthScale=1.000000
   InvulnerableShieldFX=ParticleSystem'zed_fleshpound_king_emit.FX_King_Fleshpound_Shield'
   ShieldSocketName="hips"
   ShieldImpactEffects=KFSkinTypeEffects_HansShield'kfgamecontent.Default__KFPawn_ZedFleshpoundKing:ShieldEffects'
   ShieldShatterExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedFleshpoundKing:ShatterExploTemplate0'
   ShieldColorGreen=(B=50,G=255,R=50,A=0)
   ShieldCoreColorGreen=(B=0,G=255,R=0,A=0)
   ShieldColorYellow=(B=20,G=255,R=255,A=0)
   ShieldCoreColorYellow=(B=0,G=255,R=255,A=0)
   ShieldColorOrange=(B=10,G=110,R=255,A=0)
   ShieldCoreColorOrange=(B=0,G=105,R=255,A=0)
   ShieldColorRed=(B=20,G=20,R=255,A=0)
   ShieldCoreColorRed=(B=10,G=10,R=255,A=0)
   BossCaptionStrings(0)="The more you hurt the King Fleshpound, the faster he calls in more Quarter Pounds. Pace yourself, don’t get overwhelmed!"
   BossCaptionStrings(1)="Get down! The King Fleshpound’s chest beam has trouble hitting targets low to the ground."
   BossCaptionStrings(2)="Don’t think the fight is almost over just because the King Fleshpound is badly hurt. He activates a shield when low on Health. "
   BossCaptionStrings(3)="The King Fleshpound’s chest beam can hurt other Zeds if you can get them into his line of fire."
   BossCaptionStrings(4)="The King Fleshpound has the same weakpoints as normal fleshpounds, just bigger."
   BossCaptionStrings(5)="The King Fleshpound always has more Quarter Pounds. Ignore them at your peril!"
   Begin Object Class=AkComponent Name=RageAkComponent0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:RageAkComponent0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="RageAkComponent0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:RageAkComponent0'
   End Object
   RageAkComponent=RageAkComponent0
   MonsterArchPath="ZED_ARCH.ZED_FleshpoundKing_Archetype"
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedFleshpound:MeleeHelper_0'
      BaseDamage=75.000000
      MyDamageType=Class'kfgamecontent.KFDT_Bludgeon_Fleshpound'
      MomentumTransfer=55000.000000
      MaxHitRange=250.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedFleshpound:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedFleshpoundKing:MeleeHelper_0'
   DoshValue=2500
   XPValues(0)=1291.000000
   XPValues(1)=1694.000000
   XPValues(2)=1790.000000
   XPValues(3)=1843.000000
   WeakSpotSocketNames(2)="WeakPointSocket1"
   DamageTypeModifiers(13)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(0.500000))
   DamageTypeModifiers(14)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle',DamageScale=(0.500000))
   DamageTypeModifiers(15)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun',DamageScale=(0.750000))
   DamageTypeModifiers(16)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun',DamageScale=(0.750000))
   DamageTypeModifiers(17)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle',DamageScale=(0.750000))
   DamageTypeModifiers(18)=(DamageType=Class'KFGame.KFDT_Slashing',DamageScale=(0.500000))
   DamageTypeModifiers(19)=(DamageType=Class'KFGame.KFDT_Bludgeon',DamageScale=(0.600000))
   DamageTypeModifiers(20)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(0.300000))
   DamageTypeModifiers(21)=(DamageType=Class'KFGame.KFDT_Microwave',DamageScale=(0.900000))
   DamageTypeModifiers(22)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=(0.800000))
   DamageTypeModifiers(23)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=(0.750000))
   DamageTypeModifiers(24)=(DamageType=Class'KFGame.KFDT_Toxic',DamageScale=(0.250000))
   DifficultySettings=Class'kfgamecontent.KFDifficulty_FleshpoundKing'
   MinBlockFOV=0.200000
   FootstepCameraShake=CameraShake'kfgamecontent.Default__KFPawn_ZedFleshpoundKing:FootstepCameraShake0'
   Begin Object Class=AkComponent Name=SprintAkComponent0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:SprintAkComponent0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="SprintAkComponent0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:SprintAkComponent0'
   End Object
   SprintAkComponent=SprintAkComponent0
   Begin Object Class=AkComponent Name=HeadshotAkComponent0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:HeadshotAkComponent0'
      Name="HeadshotAkComponent0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:HeadshotAkComponent0'
   End Object
   HeadShotAkComponent=HeadshotAkComponent0
   PawnAnimInfo=KFPawnAnimInfo'ZED_Fleshpound_ANIM.King_Fleshpound_AnimGroup'
   LocalizationKey="KFPawn_ZedFleshpoundKing"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bCanBePinned=False
   HitZones(0)=(GoreHealth=2147483647)
   HitZones(1)=()
   HitZones(2)=()
   HitZones(3)=()
   HitZones(4)=()
   HitZones(5)=()
   HitZones(6)=()
   HitZones(7)=()
   HitZones(8)=()
   HitZones(9)=()
   HitZones(10)=()
   HitZones(11)=()
   HitZones(12)=()
   HitZones(13)=()
   HitZones(14)=()
   HitZones(15)=()
   HitZones(16)=()
   HitZones(17)=()
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedFleshpound:Afflictions_0'
      AfflictionClasses(0)=Class'KFGame.KFAffliction_EMPDisrupt'
      AfflictionClasses(1)=()
      AfflictionClasses(2)=()
      AfflictionClasses(3)=()
      AfflictionClasses(4)=()
      AfflictionClasses(5)=()
      AfflictionClasses(6)=()
      AfflictionClasses(7)=()
      AfflictionClasses(8)=()
      AfflictionClasses(9)=()
      AfflictionClasses(10)=()
      AfflictionClasses(11)=()
      FireFullyCharredDuration=5.000000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedFleshpound:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedFleshpoundKing:Afflictions_0'
   IncapSettings(0)=(Vulnerability=(0.710000))
   IncapSettings(1)=(Duration=1.200000,Cooldown=15.000000,Vulnerability=(0.480000))
   IncapSettings(2)=(Cooldown=2.000000,Vulnerability=(0.070000,0.710000,0.070000,0.070000,0.560000))
   IncapSettings(3)=(Vulnerability=(0.070000,0.070000,0.070000,0.070000,0.500000))
   IncapSettings(4)=(Cooldown=10.000000,Vulnerability=(0.070000,0.220000,0.070000,0.070000,0.300000))
   IncapSettings(5)=(Duration=1.250000,Cooldown=17.000000,Vulnerability=(0.070000,0.410000,0.070000,0.070000,0.410000))
   IncapSettings(6)=(Vulnerability=(0.000000))
   IncapSettings(7)=(Duration=3.000000,Cooldown=10.500000,Vulnerability=(0.750000,1.500000,0.750000,0.750000,1.500000))
   IncapSettings(8)=(Cooldown=20.000000,Vulnerability=(0.070000,0.300000,0.070000,0.070000,0.180000))
   IncapSettings(9)=(Cooldown=10.000000,Vulnerability=(0.370000))
   IncapSettings(10)=(Duration=3.000000,Cooldown=10.000000,Vulnerability=(0.060000))
   IncapSettings(11)=(Cooldown=10.000000,Vulnerability=(0.200000))
   SprintSpeed=700.000000
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedFleshpound:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=Class'KFGame.KFSM_MeleeAttack'
      SpecialMoveClasses(2)=Class'KFGame.KFSM_DoorMeleeAttack'
      SpecialMoveClasses(3)=Class'KFGame.KFSM_GrappleCombined'
      SpecialMoveClasses(4)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(10)=None
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=None
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(15)=Class'KFGame.KFSM_Evade'
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=Class'KFGame.KFSM_Block'
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=None
      SpecialMoveClasses(21)=None
      SpecialMoveClasses(22)=None
      SpecialMoveClasses(23)=Class'kfgamecontent.KFSM_FleshpoundKing_ChestBeam'
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
      SpecialMoveClasses(37)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedFleshpound:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedFleshpoundKing:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedFleshpound:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedFleshpound:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedFleshpoundKing:WeaponAmbientEchoHandler_0'
   FootstepAkComponent=BeamHitAC0
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   GroundSpeed=300.000000
   Health=8750
   ControllerClass=Class'kfgamecontent.KFAIController_ZedFleshpoundKing'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:KFPawnSkeletalMeshComponent'
      WireframeColor=(B=0,G=255,R=255,A=255)
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
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
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=55.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:FootstepAkSoundComponent'
   End Object
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   Components(8)=SprintAkComponent0
   Components(9)=HeadshotAkComponent0
   Components(10)=RageAkComponent0
   Components(11)=BeamHitAC0
   bAlwaysRelevant=True
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_ZedFleshpoundKing"
   ObjectArchetype=KFPawn_ZedFleshpound'kfgamecontent.Default__KFPawn_ZedFleshpound'
}
