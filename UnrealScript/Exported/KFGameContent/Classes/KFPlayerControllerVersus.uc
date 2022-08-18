//=============================================================================
// KFPlayerControllerVersus
//=============================================================================
// Versus playercontroller class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFPlayerControllerVersus extends KFPlayerController;

var string BossName;

/** Puke mines spawned by this player */
var transient protected array<KFProj_BloatPukeMine> MyActivePukeMines;

/** Array of zed classes spawned by this player */
var array<bool> HasSpawnedZeds;

/************************************
* Zed XP
************************************/
var					int							ZedXPAmount;
var					byte						ZedXPLevel;

/************************************
*  Replication
************************************/
replication
{
	if ( bNetDirty )
		ZedXPAmount, ZedXPLevel;
}

function Restart(bool bVehicleTransition)
{
	super.Restart( bVehicleTransition );

	if( GetTeamNum() == 255 )
	{
	    KFThirdPersonCamera(KFPlayerCamera(PlayerCamera).ThirdPersonCam).SetViewOffset( KFPawn_Monster(Pawn).ThirdPersonViewOffset );

		if( PlayerCamera.CameraStyle != 'Boss' )
		{
			ServerCamera('ThirdPerson');
		}
	}
}

reliable client function ClientRestart(Pawn NewPawn)
{
	local KFGFxHudWrapper GFxHUDWrapper;
	Super.ClientRestart(NewPawn);

	if(NewPawn == none)
	{
		return;
	}

	if( Role < ROLE_Authority && GetTeamNum() == 255 )
	{
	    KFThirdPersonCamera(KFPlayerCamera(PlayerCamera).ThirdPersonCam).SetViewOffset( KFPawn_Monster(Pawn).ThirdPersonViewOffset );

		if( PlayerCamera.CameraStyle != 'Boss' )
		{
			SetCameraMode('ThirdPerson');
		}
	}

	    //Spawn hud here
    GFxHUDWrapper = KFGFxHudWrapper(myHUD);
    if( GFxHUDWrapper != none )
    {
        GFxHUDWrapper.CreateHUDMovie();
    }
}

/** GBA_SwitchAltFire */
exec function StartAltFire(optional Byte FireModeNum )
{
	if( Pawn != none && (Pawn.Weapon == none || Pawn.Weapon.ShouldWeaponIgnoreStartFire()) )
	{
		Pawn.StartFire(4);
		return;
	}

	super.StartAltFire();
}

/** GBA_SwitchAltFire
 * Weapons that override AltFireMode (e.g. welder) and call StartFire
 * also need to call StopFire.  For most weapons this is unnecessary.
 */
exec function StopAltFire(optional Byte FireModeNum )
{
	if( Pawn != none && (Pawn.Weapon == none || Pawn.Weapon.ShouldWeaponIgnoreStartFire()) )
	{
		Pawn.StopFire(4);
		return;
	}

	super.StopAltFire();
}

function AwardZedDamage( int DamageAmount, bool bDamagerIsMe )
{
	// Ramm Versus TODO: Finish this zed damage reward stuff
	ZedXPAmount += DamageAmount;
	//SetRTPCValue( 'R_Method', 7, true );
	//PlayAKEvent( AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Top' );

//
//    if( !bDamagerIsMe )
//    {
//	   ClientMessage("Got ZedXP for nearby zed damage. ZedXP = "$ZedXPAmount);
//	}
//	else
//	{
//	   ClientMessage("Got ZedXP for my zed damage. ZedXP = "$ZedXPAmount);
//	}
//
//	if( ZedXPAmount > 50 && ZedXPLevel < 1 )
//	{
//	   ZedXPLevel = 1;
//	   class'KFMusicStingerHelper'.static.PlayLevelUpStinger( self );
//	   ClientMessage("Unlocked Level 1 Zeds!!!");
//	}
//
//    `log("ZedXPAmount = "$ZedXPAmount$" ZedXPLevel = "$ZedXPLevel);
}

/** @return TRUE if any of the gameplay post process effects have a strength greater than 0.
	Append to this list if additional effects are added. */
function bool ShouldDisplayGameplayPostProcessFX()
{
    // Overridden because the zeds health vary so much, it needs to be a percentage of max health - Ramm
	return super.ShouldDisplayGameplayPostProcessFX()
			|| (GetTeamNum() == 255 && Pawn != none && (Pawn.Health / float(Pawn.HealthMax)) * 100.f <= default.LowHealthThreshold);
}

/** Add a puke mine to the pool, removing the oldest if we are at the pool limit */
function AddPukeMineToPool( KFProj_BloatPukeMine PukeMine )
{
	local KFGameInfo_VersusSurvival KFGIVS;
	local KFProj_BloatPukeMine OldestMine;

	KFGIVS = KFGameInfo_VersusSurvival( WorldInfo.Game );
	if( KFGIVS != none )
	{
		if( KFGIVS.ActivePukeMines.Length >= KFGIVS.MaxActivePukeMines )
		{
			if( MyActivePukeMines.Length > 0 && MyActivePukeMines[0] != none )
			{
				OldestMine = MyActivePukeMines[0];
				MyActivePukeMines.Remove( 0, 1 );
				KFGIVS.ActivePukeMines.Remove( KFGIVS.ActivePukeMines.Find(OldestMine), 1 );
			}
			else
			{
				OldestMine = KFGIVS.ActivePukeMines[0];
				KFGIVS.ActivePukeMines.Remove( 0, 1 );
			}
		}
		else if( MyActivePukeMines.Length >= GetMaxPlayerPukeMineNum() )
		{
			OldestMine = MyActivePukeMines[0];
			MyActivePukeMines.Remove( 0, 1 );
			KFGIVS.ActivePukeMines.Remove( KFGIVS.ActivePukeMines.Find(OldestMine), 1 );
		}

		// Blow up our oldest puke mine 
		if( OldestMine != none )
		{
			OldestMine.TriggerExplosion( OldestMine.Location, vect(0,0,1), none );
		}

		// Add to pool arrays
		MyActivePukeMines[MyActivePukeMines.Length] = PukeMine;
		KFGIVS.ActivePukeMines[KFGIVS.ActivePukeMines.Length] = PukeMine;
	}
}

/** Remove a puke mine from the pool (it's been destroyed) */
function RemovePukeMineFromPool( KFProj_BloatPukeMine PukeMine )
{
	local KFGameInfo_VersusSurvival KFGIVS;
	local int PukeMineIndex;

	PukeMineIndex = MyActivePukeMines.Find( PukeMine );
	MyActivePukeMines.Remove( PukeMineIndex, 1 );
	KFGIVS = KFGameInfo_VersusSurvival( WorldInfo.Game );
	if( KFGIVS != none )
	{
		PukeMineIndex = KFGIVS.ActivePukeMines.Find( PukeMine );
		if( PukeMineIndex != INDEX_NONE )
		{
			KFGIVS.ActivePukeMines.Remove( PukeMineIndex, 1 );
		}
	}
}

/** Returns the number of active puke mines each player is allowed to have */
function int GetMaxPlayerPukeMineNum()
{
	local KFGameInfo_VersusSurvival KFGIVS;
	local KFPawn_ZedBloat_Versus BloatPawn;
	local int NumBloatPlayers;

	KFGIVS = KFGameInfo_VersusSurvival( WorldInfo.Game );
	foreach WorldInfo.AllPawns( class'KFPawn_ZedBloat_Versus', BloatPawn )
	{
		++NumBloatPlayers;
	}

	// Shouldn't happen, but just in case...
	NumBloatPlayers = NumBloatPlayers == 0 ? 1 : NumBloatPlayers;
	
	return KFGIVS.MaxActivePukeMines / NumBloatPlayers;
}

function string GetTeamTag(PlayerReplicationInfo PRI)
{
	if(PRI == none)
	{
		return "";
	}
	if(!PRI.bOnlySpectator)
	{
		if(PRI.GetTeamNum() == 255)
		{
			return "<"$class'KFCommon_LocalizedStrings'.default.ZedString$">";
		}
		else
		{
			return "<"$class'KFCommon_LocalizedStrings'.default.HumanString$">";
		}
		
	}
	else
	{
		return "<"$class'KFCommon_LocalizedStrings'.default.SpectatorString$">";
	}
}

function RecieveChatMessage(PlayerReplicationInfo PRI, string ChatMessage, name Type, optional float MsgLifeTime)
{
	if(PRI.bAdmin)
	{
		ChatMessage = class'KFLocalMessage'.default.AdminString$ChatMessage;
		MyGFxHUD.HudChatBox.AddChatMessage(ChatMessage, class 'KFLocalMessage'.default.PriorityColor);
	}
	else
	{
		if(Type == 'TeamSay')
		{
			MyGFxHUD.HudChatBox.AddChatMessage(ChatMessage, class 'KFLocalMessage'.default.TeamSayColor);
		}
		else
		{
			MyGFxHUD.HudChatBox.AddChatMessage(ChatMessage, class 'KFLocalMessage'.default.SayColor);
		}
	}
}

unreliable client function NotifyOfAutoBalance()
{
	MyGFxManager.OpenPopup(ENotification, "NOTICE", "You have been team swapped", "OK");
	MyGFxHUD.ShowNonCriticalMessage("You have been team swapped");
}

exec function RequestSwitchTeam()
{
    local KFPlayerReplicationInfo KFPRI;
    
    KFPRI = KFPlayerReplicationInfo(PlayerReplicationInfo);
    if ( KFPRI != None && !KFPRI.bOnlySpectator )
    {
        KFPRI.ServerSwitchTeam();
    }
}

/** We have to change perks when players team switch */
function ServerNotifyTeamChanged()
{
	if( Role == ROLE_Authority && MonsterPerkClass != None )
	{
		if ( CurrentPerk == None )
		{
			// If we get here without a perk via the normal path, we're in trouble.
			// SavedPerkIndex may not have been updated (config loaded) which will cause
			// team switch to get you the wrong perk.
			WarnInternal("Versus - ServerNotifyTeamChanged called with no initial perk! Team switch errors will follow");
		}

		if( GetTeamNum() > 0 )
		{
			ServerSelectPerk( 255, 0, true );
		}
		else if( CurrentPerk != none && CurrentPerk.Class == MonsterPerkClass )
		{
			ServerSelectPerk( SavedPerkIndex, Perklist[SavedPerkIndex].PerkLevel, true );
		}
	}
}

function ClientRecieveNewTeam()
{
	if(MyGFxManager != none)
	{
		MyGFxManager.ClientRecieveNewTeam();
	}
}

state Dead
{
	event BeginState(Name PreviousStateName)
	{
		local ViewOffsetData DefaultViewOffset;

		super.BeginState( PreviousStateName );

		// Reset camera offset
		if( GetTeamNum() == 255 )
		{
		    KFThirdPersonCamera(KFPlayerCamera(PlayerCamera).ThirdPersonCam).SetViewOffset( DefaultViewOffset );
		}
	}
}

simulated event Destroyed()
{
	local int i;

	super.Destroyed();

	for( i = 0; i < MyActivePukeMines.Length; ++i )
	{
		if( MyActivePukeMines[i] != none )
		{
			MyActivePukeMines[i].SetTimer( 1 + Rand(5) + fRand(), false, nameOf(MyActivePukeMines[i].Timer_Explode) );
		}
	}

	MyActivePukeMines.Length = 0;
}

defaultproperties
{
   MonsterPerkClass=Class'KFGame.KFPerk_Monster'
   Begin Object Class=AkComponent Name=AkComponent_0 Archetype=AkComponent'KFGame.Default__KFPlayerController:AkComponent_0'
      BoneName="Root"
      bStopWhenOwnerDestroyed=True
      Name="AkComponent_0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPlayerController:AkComponent_0'
   End Object
   StingerAkComponent=AkComponent_0
   Begin Object Class=PointLightComponent Name=AmplificationLightTemplate_0 Archetype=PointLightComponent'KFGame.Default__KFPlayerController:AmplificationLightTemplate_0'
      Radius=200.000000
      bAIIgnoreLuminosity=True
      Brightness=0.020000
      CastShadows=False
      CastStaticShadows=False
      bDisableSpecular=True
      LightingChannels=(Outdoor=True)
      Name="AmplificationLightTemplate_0"
      ObjectArchetype=PointLightComponent'KFGame.Default__KFPlayerController:AmplificationLightTemplate_0'
   End Object
   AmplificationLightTemplate=AmplificationLightTemplate_0
   Begin Object Class=PointLightComponent Name=NVGLightTemplate_0 Archetype=PointLightComponent'KFGame.Default__KFPlayerController:NVGLightTemplate_0'
      Radius=800.000000
      bAIIgnoreLuminosity=True
      Brightness=0.050000
      bEnabled=False
      CastShadows=False
      CastStaticShadows=False
      bDisableSpecular=True
      LightingChannels=(Outdoor=True)
      Name="NVGLightTemplate_0"
      ObjectArchetype=PointLightComponent'KFGame.Default__KFPlayerController:NVGLightTemplate_0'
   End Object
   NVGLightTemplate=NVGLightTemplate_0
   CameraClass=Class'kfgamecontent.KFPlayerCamera_Versus'
   InputClass=Class'kfgamecontent.KFPlayerInputVersus'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPlayerController:CollisionCylinder'
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPlayerController:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AkComponent_0
   CollisionComponent=CollisionCylinder
   Name="Default__KFPlayerControllerVersus"
   ObjectArchetype=KFPlayerController'KFGame.Default__KFPlayerController'
}
