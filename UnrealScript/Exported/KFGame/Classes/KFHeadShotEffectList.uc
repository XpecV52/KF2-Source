//=============================================================================
// KFHeadShotEffectList
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFHeadShotEffectList extends Object
	abstract
    native;

struct native HeadshotEffect
{
	var int Id;
	var string ItemName;
	var ParticleSystem EffectPS;
	var string IconPath;
	var AkEvent HeadshotSoundEffect;
	StructDefaultProperties
	{
		IconPath=""
		Id=INDEX_NONE
	}
};

var private const array<HeadshotEffect> HeadShotEffects;

/** Cached Emote ID */
var private const int EquippedHeadshotId;

/** Debugging */
var private const bool bDebugEffects;

/** Helper functions for UI and special move */
static native final function HeadshotEffect GetUnlockedHeadshotEffect( int ItemId );
static native final function byte GetHeadShotEffectIndex( int ItemId );
static native final function HeadshotEffect GetHeadShotEffectFromIndex( byte HeadShotIndex );
static native final function bool IsHeadShotEffectEquipped( int ItemId );
static native final function int GetEquippedHeadShotEffectId();

/** Save equipped emote using profile */
static native final function SaveEquippedHeadShotEffect( int ItemId );

/** Refreshes the equipped emote from profile data */
static native final function RefreshCachedHeadShotEffectId();

defaultproperties
{
   HeadShotEffects(0)=(ItemName="Dummy")
   HeadShotEffects(1)=(Id=6260,ItemName="LetsGetCrazy",EffectPS=ParticleSystem'FX_Headshot_Alt_EMIT.FX_Headshot_Alt_Dosh_01',IconPath="EMOTE_TEX.Emote_LetsGoCrazy_512",HeadshotSoundEffect=AkEvent'WW_Headshot_Packs.Play_WEP_Dosh_Headshot')
   HeadShotEffects(2)=(Id=6261,ItemName="LetsGetCrazy",EffectPS=ParticleSystem'FX_Headshot_Alt_EMIT.FX_Headshot_Alt_Confetti_01',IconPath="EMOTE_TEX.Emote_LetsGoCrazy_512",HeadshotSoundEffect=AkEvent'WW_Headshot_Packs.Play_WEP_Confetti_Headshot')
   HeadShotEffects(3)=(Id=6262,ItemName="LetsGetCrazy",EffectPS=ParticleSystem'FX_Headshot_Alt_EMIT.FX_Headshot_Alt_Ghost_01',IconPath="EMOTE_TEX.Emote_LetsGoCrazy_512",HeadshotSoundEffect=AkEvent'WW_Headshot_Packs.Play_WEP_Ghost_Headshot')
   HeadShotEffects(4)=(Id=6263,ItemName="LetsGetCrazy",EffectPS=ParticleSystem'FX_Headshot_Alt_EMIT.FX_Headshot_Alt_Hearts_01',IconPath="EMOTE_TEX.Emote_LetsGoCrazy_512",HeadshotSoundEffect=AkEvent'WW_Headshot_Packs.Play_WEP_Hearts_Headshot')
   HeadShotEffects(5)=(Id=6264,ItemName="LetsGetCrazy",EffectPS=ParticleSystem'FX_Headshot_Alt_EMIT.FX_Headshot_Alt_Comic_01',IconPath="EMOTE_TEX.Emote_LetsGoCrazy_512",HeadshotSoundEffect=AkEvent'WW_Headshot_Packs.Play_WEP_Pixel_Headshot')
   HeadShotEffects(6)=(Id=7042,ItemName="LetsGetCrazy",EffectPS=ParticleSystem'FX_Headshot_Alt_EMIT.HeadShot_Pack_2.FX_Headshot_Alt2_Flower_01',IconPath="EMOTE_TEX.Emote_LetsGoCrazy_512",HeadshotSoundEffect=AkEvent'WW_Headshot_Packs.Play_WEP_Flower_Headshot')
   HeadShotEffects(7)=(Id=7043,ItemName="LetsGetCrazy",EffectPS=ParticleSystem'FX_Headshot_Alt_EMIT.HeadShot_Pack_2.FX_Headshot_Alt2_Splatter_01',IconPath="EMOTE_TEX.Emote_LetsGoCrazy_512",HeadshotSoundEffect=AkEvent'WW_Headshot_Packs.Play_WEP_Splatter_A_Headshot')
   HeadShotEffects(8)=(Id=7044,ItemName="LetsGetCrazy",EffectPS=ParticleSystem'FX_Headshot_Alt_EMIT.HeadShot_Pack_2.FX_Headshot_Alt2_Gameover_01',IconPath="EMOTE_TEX.Emote_LetsGoCrazy_512",HeadshotSoundEffect=AkEvent'WW_Headshot_Packs.Play_WEP_Gameover_Headshot')
   HeadShotEffects(9)=(Id=7045,ItemName="LetsGetCrazy",EffectPS=ParticleSystem'FX_Headshot_Alt_EMIT.HeadShot_Pack_2.FX_Headshot_Alt2_Glitch_01',IconPath="EMOTE_TEX.Emote_LetsGoCrazy_512",HeadshotSoundEffect=AkEvent'WW_Headshot_Packs.Play_WEP_Glitch_Headshot')
   HeadShotEffects(10)=(Id=7046,ItemName="LetsGetCrazy",EffectPS=ParticleSystem'FX_Headshot_Alt_EMIT.HeadShot_Pack_2.FX_Headshot_Alt2_Headscan_01',IconPath="EMOTE_TEX.Emote_LetsGoCrazy_512",HeadshotSoundEffect=AkEvent'WW_Headshot_Packs.Play_WEP_Headscan_Headshot')
   EquippedHeadshotId=-1
   Name="Default__KFHeadShotEffectList"
   ObjectArchetype=Object'Core.Default__Object'
}
