//=============================================================================
// KFMapInfo
//=============================================================================
// The Killing Floor 2 mapinfo
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFMapInfo extends MapInfo
	native;

/** Base value to use for how long to wait between spawning groups of AI. Turn this number down to make zeds spawn faster and the map harder, turn it up to make zeds spawn slower and the map easier  */
var(Spawning)	float						WaveSpawnPeriod;

/** list of destructibles that require replicated damage states in this map */
var()			array<KFDestructibleActor> 	DestructibleActors;

/** list of music tracks played when a wave is active */
// @todo: make these not editconst when we're ready to have mappers or whomever change them
var(Music) editconst array< KFMusicTrackInfo > 	ActionMusicTracks;
/** List of random indices into the ActionMusicTracks array */
var transient array< byte > 				ShuffledActionMusicTrackIdxes;
/** Current position within the ShuffledActionMusicTrackIdxes array */
var transient byte							CurrShuffledActionMusicTrackIdx;

/** list of music tracks played during trader time */
// @todo: make these not editconst when we're ready to have mappers or whomever change them
var(Music) editconst array< KFMusicTrackInfo > 	AmbientMusicTracks;
/** List of random indices into the AmbientMusicTracks array */
var transient array< byte > 	 			ShuffledAmbientMusicTrackIdxes;
/** Current position within the ShuffledAmbientMusicTrackIdxes array */
var transient byte							CurrShuffledAmbientMusicTrackIdx;

enum ECollectibleType
{
	ECT_DoshBling,
	ECT_ClotMotherBaby
};

/** Type of collectible in this map (used for collectible text/localization) */
var/*(Collectibles)*/ const ECollectibleType CollectibleType;
/** How many collectibles players need to find in this map to unlock the achievement */
var(Collectibles) const int	CollectiblesToFind;
/** How many collectibles players have found */
var const transient int		CollectiblesFound;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/********************************************************************************************
*
* GetNextMusicTrackStruct and StaticGetNextMusicTrackStruct have been reduced to stubs due to a music refactor
*
********************************************************************************************/

/* (NOT FUNCTIONAL BUT STILL NEEDED FOR LEGACY) Returns a randomly chosen song from the trackstruct array */
function MusicTrackStruct GetNextMusicTrackStruct(bool bActionTrack = true);

/* (NOT FUNCTIONAL BUT STILL NEEDED FOR LEGACY) Returns a randomly chosen song from the trackstruct array */
static function MusicTrackStruct StaticGetNextMusicTrackStruct(bool bActionTrack = true);

/** Returns a music track based on wave activity and game progress */
function KFMusicTrackInfo GetNextMusicTrackByGameIntensity( bool bPlayActionTrack, byte GameIntensity )
{
	if( bPlayActionTrack )
	{
		if( ActionMusicTracks.length == 0 )
		{
			LogInternal("KFMapInfo::GetNextMusicTrackByGameIntensity - NO ACTION MUSIC TRACKS TO PICK FROM");
			return none;
		}

		// initialize shuffled tracks
		if( ShuffledActionMusicTrackIdxes.length == 0 )
		{
			ShuffleTracks( ShuffledActionMusicTrackIdxes, CurrShuffledActionMusicTrackIdx, ActionMusicTracks.length );
		}

		return GetRandomTrack( GameIntensity, ActionMusicTracks, ShuffledActionMusicTrackIdxes, CurrShuffledActionMusicTrackIdx );
	}
	else
	{
		if( AmbientMusicTracks.length == 0 )
		{
			LogInternal("KFMapInfo::GetNextMusicTrackByGameIntensity - NO AMBIENT MUSIC TRACKS TO PICK FROM");
			return none;
		}

		// initialize shuffled tracks
		if( ShuffledAmbientMusicTrackIdxes.length == 0 )
		{
			ShuffleTracks( ShuffledAmbientMusicTrackIdxes, CurrShuffledAmbientMusicTrackIdx, AmbientMusicTracks.length );
		}

		return GetRandomTrack( GameIntensity, AmbientMusicTracks, ShuffledAmbientMusicTrackIdxes, CurrShuffledAmbientMusicTrackIdx );
	}
}

/** Returns a random music track from the specified track list and re-shuffles the list if necessary */
function KFMusicTrackInfo GetRandomTrack( byte GameIntensity, const out array<KFMusicTrackInfo> Tracks, out array< byte > ShuffledTrackIdxes, out byte CurrShuffledTrackIdx )
{
	local KFMusicTrackInfo CheckTrack;
	local byte ShuffleCount;

	while( ShuffleCount <= 1 )
	{
		// iterate through the list starting with our previous position
		while( CurrShuffledTrackIdx < ShuffledTrackIdxes.length )
		{
			CheckTrack = Tracks[ ShuffledTrackIdxes[CurrShuffledTrackIdx++] ];

			// check if this track is allowed to be played for the specified game progression
			if( GameIntensity == 255 || (GameIntensity >= CheckTrack.MinGameIntensityLevel && GameIntensity <= CheckTrack.MaxGameIntensityLevel) )
			{
				return CheckTrack;
			}
		}

		// when we reach the last element, reshuffle ONE TIME
		if( CurrShuffledTrackIdx == ShuffledTrackIdxes.length )
		{
			if( ShuffleCount > 0 )
			{
				WarnInternal("KFMapInfo::GetRandomTrack - no suitable track found!");
				return none;
			}

			ShuffleTracks( ShuffledTrackIdxes, CurrShuffledTrackIdx );
			ShuffleCount++;
		}
	}

	return none;
}

/** Shuffles the given array of music tracks */
function ShuffleTracks( out array<byte> TrackIdxes, out byte TrackIdx, optional int InitLength )
{
	local int NumTracks, i, RandNum;
	local byte TempTrackIdx;

	// initialize shuffled array of indices if necessary
	if( InitLength > 0 )
	{
		TrackIdxes.length = InitLength;
		for( i = 0; i < InitLength; ++i )
		{
			TrackIdxes[i] = i;
		}
	}

	NumTracks = TrackIdxes.length;

	// shuffle!
	for( i = 0; i < NumTracks; ++i )
	{
		RandNum = Rand( NumTracks );
		TempTrackIdx = TrackIdxes[i];
		TrackIdxes[i] = TrackIdxes[ RandNum ];
		TrackIdxes[ RandNum ] = TempTrackIdx;
	}

	TrackIdx = 0;
}

static function KFMusicTrackInfo StaticGetRandomTrack( bool bPlayActionTrack )
{
	local int RandTrackIdx;
	local KFMusicTrackInfo RandTrackInfo;

    if( bPlayActionTrack )
    {
    	if( default.ActionMusicTracks.length == 0 )
		{
			LogInternal("KFMapInfo::StaticGetRandomTrack - NO DEFAULT ACTION MUSIC TRACKS TO PICK FROM");
			return none;
		}

    	RandTrackIdx = Rand(default.ActionMusicTracks.length);
    	RandTrackInfo = default.ActionMusicTracks[RandTrackIdx];
    }
    else
    {
    	if( default.AmbientMusicTracks.length == 0 )
		{
			LogInternal("KFMapInfo::StaticGetRandomTrack - NO DEFAULT AMBIENT MUSIC TRACKS TO PICK FROM");
			return none;
		}

    	RandTrackIdx = Rand(default.AmbientMusicTracks.length);
    	RandTrackInfo = default.AmbientMusicTracks[RandTrackIdx];
    }

    return RandTrackInfo;
}

/** Figures out if player has collected enough collectibles to unlock its related achievement */
native final function OnCollectibleFound( KFDestructibleActor Collectible, Controller Collecter );

defaultproperties
{
   WaveSpawnPeriod=2.000000
   ActionMusicTracks(0)=KFMusicTrackInfo'WW_MACT_Default.TI_BAJ_KF2_5_3'
   ActionMusicTracks(1)=KFMusicTrackInfo'WW_MACT_Default.TI_BAJ_KF2_8'
   ActionMusicTracks(2)=KFMusicTrackInfo'WW_MACT_Default.TI_D_Disunion'
   ActionMusicTracks(3)=KFMusicTrackInfo'WW_MACT_Default.TI_BTA_MountainOfSouls'
   ActionMusicTracks(4)=KFMusicTrackInfo'WW_MACT_Default.TI_DH_Collapsing'
   ActionMusicTracks(5)=KFMusicTrackInfo'WW_MACT_Default.TI_DH_CrossToBear'
   ActionMusicTracks(6)=KFMusicTrackInfo'WW_MACT_Default.TI_DH_Death'
   ActionMusicTracks(7)=KFMusicTrackInfo'WW_MACT_Default.TI_DH_FireToMySoul'
   ActionMusicTracks(8)=KFMusicTrackInfo'WW_MACT_Default.TI_DH_IHaveSeen'
   ActionMusicTracks(9)=KFMusicTrackInfo'WW_MACT_Default.TI_DH_Infected'
   ActionMusicTracks(10)=KFMusicTrackInfo'WW_MACT_Default.TI_DH_LifeWar'
   ActionMusicTracks(11)=KFMusicTrackInfo'WW_MACT_Default.TI_DH_NotI'
   ActionMusicTracks(12)=KFMusicTrackInfo'WW_MACT_Default.TI_DH_Ribcage'
   ActionMusicTracks(13)=KFMusicTrackInfo'WW_MACT_Default.TI_DH_SomeoneToHate'
   ActionMusicTracks(14)=KFMusicTrackInfo'WW_MACT_Default.TI_DH_ThisIKnow'
   ActionMusicTracks(15)=KFMusicTrackInfo'WW_MACT_Default.TI_DH_TurnYourBack'
   ActionMusicTracks(16)=KFMusicTrackInfo'WW_MACT_Default.TI_DH_WeDontCare'
   ActionMusicTracks(17)=KFMusicTrackInfo'WW_MACT_Default.TI_FFAK_BitterEnd'
   ActionMusicTracks(18)=KFMusicTrackInfo'WW_MACT_Default.TI_ID_DeathWillReign'
   ActionMusicTracks(19)=KFMusicTrackInfo'WW_MACT_Default.TI_ID_Murderer'
   ActionMusicTracks(20)=KFMusicTrackInfo'WW_MACT_Default.TI_ID_RavenousDisease'
   ActionMusicTracks(21)=KFMusicTrackInfo'WW_MACT_Default.TI_LS_Bloodwork'
   ActionMusicTracks(22)=KFMusicTrackInfo'WW_MACT_Default.TI_LS_DeathMachine'
   ActionMusicTracks(23)=KFMusicTrackInfo'WW_MACT_Default.TI_LS_Despair'
   ActionMusicTracks(24)=KFMusicTrackInfo'WW_MACT_Default.TI_LS_Flatline'
   ActionMusicTracks(25)=KFMusicTrackInfo'WW_MACT_Default.TI_LS_HandOfTheDead'
   ActionMusicTracks(26)=KFMusicTrackInfo'WW_MACT_Default.TI_LS_NotMyOwn'
   ActionMusicTracks(27)=KFMusicTrackInfo'WW_MACT_Default.TI_LS_SomethingMore'
   ActionMusicTracks(28)=KFMusicTrackInfo'WW_MACT_Default.TI_LS_TheReaping'
   ActionMusicTracks(29)=KFMusicTrackInfo'WW_MACT_Default.TI_LS_YourWar'
   ActionMusicTracks(30)=KFMusicTrackInfo'WW_MACT_Default.TI_RG_CloneMutation'
   ActionMusicTracks(31)=KFMusicTrackInfo'WW_MACT_Default.TI_RG_CreepingZed'
   ActionMusicTracks(32)=KFMusicTrackInfo'WW_MACT_Default.TI_RG_KillOrBeKilled'
   ActionMusicTracks(33)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action113'
   ActionMusicTracks(34)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action115'
   ActionMusicTracks(35)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action116'
   ActionMusicTracks(36)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action119'
   ActionMusicTracks(37)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action201'
   ActionMusicTracks(38)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action205'
   ActionMusicTracks(39)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action206'
   ActionMusicTracks(40)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action207'
   ActionMusicTracks(41)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action208'
   ActionMusicTracks(42)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action209'
   ActionMusicTracks(43)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action210'
   ActionMusicTracks(44)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action300'
   ActionMusicTracks(45)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action302'
   ActionMusicTracks(46)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action303'
   ActionMusicTracks(47)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action304'
   ActionMusicTracks(48)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action305'
   ActionMusicTracks(49)=KFMusicTrackInfo'WW_MACT_Default.TI_Z_Action306'
   AmbientMusicTracks(0)=KFMusicTrackInfo'WW_MAMB_Default.TI_RG_InTheDark'
   AmbientMusicTracks(1)=KFMusicTrackInfo'WW_MAMB_Default.TI_Z_Ambient200'
   AmbientMusicTracks(2)=KFMusicTrackInfo'WW_MAMB_Default.TI_Z_Ambient202'
   AmbientMusicTracks(3)=KFMusicTrackInfo'WW_MAMB_Default.TI_Z_Ambient203'
   AmbientMusicTracks(4)=KFMusicTrackInfo'WW_MAMB_Default.TI_Z_Ambient300'
   AmbientMusicTracks(5)=KFMusicTrackInfo'WW_MAMB_Default.TI_Z_Ambient301'
   AmbientMusicTracks(6)=KFMusicTrackInfo'WW_MAMB_Default.TI_Z_Ambient302'
   AmbientMusicTracks(7)=KFMusicTrackInfo'WW_MAMB_Default.TI_Z_Ambient303'
   AmbientMusicTracks(8)=KFMusicTrackInfo'WW_MAMB_Default.TI_Z_AssemblyLab'
   AmbientMusicTracks(9)=KFMusicTrackInfo'WW_MAMB_Default.TI_Z_Malformitate'
   AmbientMusicTracks(10)=KFMusicTrackInfo'WW_MAMB_Default.TI_Z_MomentaryReprieve'
   AmbientMusicTracks(11)=KFMusicTrackInfo'WW_MAMB_Default.TI_Z_PhantomSecurity'
   AmbientMusicTracks(12)=KFMusicTrackInfo'WW_MAMB_Default.TI_Z_RendezvousPoint'
   Name="Default__KFMapInfo"
   ObjectArchetype=MapInfo'Engine.Default__MapInfo'
}
