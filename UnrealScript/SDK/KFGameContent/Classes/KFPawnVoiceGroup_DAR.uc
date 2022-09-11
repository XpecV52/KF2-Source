class KFPawnVoiceGroup_DAR extends KFPawnVoiceGroup;

`include(KFGame/KFGameDialog.uci)

DefaultProperties
{
	EventDataClass = class'KFPawnVoiceGroupEventData_Player'

    DialogEvents[`COMM_GetToTrader]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_GoToTrader',TraderTimeAudioCue=none)
	DialogEvents[`COMM_FollowMe]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Follow_Me',TraderTimeAudioCue=none)
	DialogEvents[`COMM_InsultZeds]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_Insult',TraderTimeAudioCue=none)
	DialogEvents[`COMM_RequestDosh]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_REQUEST_Money',TraderTimeAudioCue=none)
	DialogEvents[`COMM_RequestDoshResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_GIVE_Money',TraderTimeAudioCue=none)
	DialogEvents[`COMM_RequestHeal]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_REQUEST_Health',TraderTimeAudioCue=none)
	DialogEvents[`COMM_RequestHealResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_REQUEST_Health',TraderTimeAudioCue=none)
	DialogEvents[`COMM_RequestHelp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Help',TraderTimeAudioCue=none)
	DialogEvents[`COMM_ConfirmGeneric]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_Confirm',TraderTimeAudioCue=none)
	DialogEvents[`COMM_DenyGeneric]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_Deny',TraderTimeAudioCue=none)
	DialogEvents[`COMM_ThankYou]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_Confirm',TraderTimeAudioCue=none)


	DialogEvents[`ACT_WeldDoor]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Welding',TraderTimeAudioCue=none)
	DialogEvents[`ACT_WeldDoorResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Help',TraderTimeAudioCue=none)
	DialogEvents[`ACT_WeldDoorUnderAttack]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_DoorAttacked',TraderTimeAudioCue=none)
	DialogEvents[`ACT_WeldDoorUnderAttackResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Help',TraderTimeAudioCue=none)
	DialogEvents[`ACT_WeldDoorAboutToBreak]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_DoorAttacked',TraderTimeAudioCue=none)
	DialogEvents[`ACT_WeldDoorAboutToBreakResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Help',TraderTimeAudioCue=none)
	DialogEvents[`ACT_WeldDoorFinish]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_WeldDone',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_UnweldDoor]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_Masterson.Play_Masterson_ACT_UnWeld_Base',TraderTimeAudioCue=none)
	DialogEvents[`ACT_UnweldDoorFinish]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_GenericBeep',TraderTimeAudioCue=none)
	DialogEvents[`ACT_SpotDoorAttacked]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_DoorAttacked',TraderTimeAudioCue=none)
	DialogEvents[`ACT_SpotDoorBreak]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_DoorBreak',TraderTimeAudioCue=none)
	DialogEvents[`ACT_HealSomeone]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_GIVE_Health',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_HealSomeoneRespLT50pct]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_Masterson.Play_Masterson_ACT_Heal_StillLow',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_HealSomeoneRespMT75pct]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_Masterson.Play_Masterson_ACT_Heal_GT75',TraderTimeAudioCue=none)
	DialogEvents[`ACT_HealMiss]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_GenericBeep',TraderTimeAudioCue=none)
	DialogEvents[`ACT_HealMissResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_GenericBeep',TraderTimeAudioCue=none)
	DialogEvents[`ACT_HealSelf]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_HealSelf',TraderTimeAudioCue=none)
	DialogEvents[`ACT_DoshAtSomeone]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_GIVE_Money',TraderTimeAudioCue=none)
	DialogEvents[`ACT_DoshAtSomeoneRespSome]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_GIVE_Money',TraderTimeAudioCue=none)
	DialogEvents[`ACT_DoshAtSomeoneRespLots]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_GIVE_Money',TraderTimeAudioCue=none)
	DialogEvents[`ACT_DoshAtGround]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_GIVE_Money',TraderTimeAudioCue=none)
	DialogEvents[`ACT_DoshTrain]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_GIVE_Money',TraderTimeAudioCue=none)
	DialogEvents[`ACT_Reload]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Reloading',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_ReloadUnderPres]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_Reloading_Pressure',TraderTimeAudioCue=none)
	DialogEvents[`ACT_DropWeap]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_GIVE_Weapon',TraderTimeAudioCue=none)
	DialogEvents[`ACT_SpotAmmo]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_GIVE_Ammo',TraderTimeAudioCue=none)
	DialogEvents[`ACT_SpotArmor]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_GIVE_Armor',TraderTimeAudioCue=none)
	DialogEvents[`ACT_SpotWeap]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_GIVE_Weapon',TraderTimeAudioCue=none)
	DialogEvents[`ACT_AmmoLow]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_REQUEST_Ammo',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_AmmoLowResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_REQUEST_Ammo',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_AttackHeavy]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_HardAttack_Base',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_AttackLight]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_LightAttack_Base',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_BerserkerRage]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_KZED_SprintTowardsZ_Base',TraderTimeAudioCue=none)

	DialogEvents[`ACT_SelectFaveWeap1]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_FavWeapon',TraderTimeAudioCue=none)
	DialogEvents[`ACT_SelectFaveWeap2]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_FavWeapon',TraderTimeAudioCue=none)
	DialogEvents[`ACT_SelectFaveWeap3]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_FavWeapon',TraderTimeAudioCue=none)
	DialogEvents[`ACT_SelectFaveWeap4]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_FavWeapon',TraderTimeAudioCue=none)
	DialogEvents[`ACT_SelectFaveWeap5]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_FavWeapon',TraderTimeAudioCue=none)
	DialogEvents[`ACT_SelectFaveWeap6]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_FavWeapon',TraderTimeAudioCue=none)
	DialogEvents[`ACT_SelectFaveWeap7]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_FavWeapon',TraderTimeAudioCue=none)
	DialogEvents[`ACT_SelectFaveWeap8]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_FavWeapon',TraderTimeAudioCue=none)

	//DialogEvents[`ACT_Sprint]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_Sprinting_Base',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_Jog]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_Jogging_Base',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_Ironsights]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_Ironsights_Base',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_Jump]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_Jumping_Base',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_CommentLvlLT10]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_PlayerL0_10_Base',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_CommentLvlLT25]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_PlayerL11_25_Base',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_CommentLvlLT50]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_PlayerL26_49_Base',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_CommentLvlMax]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_PlayerL50_Base',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_CommentLvlUpRespLower]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_PlayerL0_10_RtoLower',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_CommentLvlUpRespHigher]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_PlayerL0_10_RtoHigher',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_CommentResetOnce]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_PlayerReset1_Base',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_CommentResetMult]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_PlayerResetMult_Base',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_CommentResetMax]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_PlayerResetMax_Base',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_CommentResetRespLower]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_PlayerReset1_RtoLower',TraderTimeAudioCue=none)
	//DialogEvents[`ACT_CommentResetRespHigher]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_ACT_PlayerReset1_RtoHigher',TraderTimeAudioCue=none)


	DialogEvents[`KILL_Generic]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_KillZed',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Female]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_KillZed',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Boss]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_KillZed',TraderTimeAudioCue=none)
	DialogEvents[`KILL_BossResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_KillZed',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Massacre]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_KillZed',TraderTimeAudioCue=none)
	//DialogEvents[`KILL_MassacreResp]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_KZED_Massacre_Response',TraderTimeAudioCue=none)
	//DialogEvents[`KILL_BeatDeadHorse]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_KZED_HitDead_Base',TraderTimeAudioCue=none)
	//DialogEvents[`KILL_BeatDeadHorseResp]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_KZED_HitDead_Feeling',TraderTimeAudioCue=none)
	//DialogEvents[`KILL_OnARoll]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_KZED_OnARoll_Base',TraderTimeAudioCue=none)
	//DialogEvents[`KILL_OnARollResp]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_KZED_OnARoll_Comment',TraderTimeAudioCue=none)
	//DialogEvents[`KILL_CloseCall]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_KZED_KZedClose_Base',TraderTimeAudioCue=none)
	DialogEvents[`KILL_AsLastPlayer]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_KillZed_LastPLayer',TraderTimeAudioCue=none)
	DialogEvents[`KILL_KnockedDown]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Damage',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Slashing]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Damage',TraderTimeAudioCue=none)
	//DialogEvents[`KILL_SlashingResp]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_KZED_SlashDam_Comment',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Blunt]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Damage',TraderTimeAudioCue=none)
	//DialogEvents[`KILL_BluntResp]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_KZED_BluntDam_Comment',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Ballistic]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Damage',TraderTimeAudioCue=none)
	//DialogEvents[`KILL_BallisticResp]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_KZED_Ballistic_Comment',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Explosive]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Damage',TraderTimeAudioCue=none)
	//DialogEvents[`KILL_ExplosiveResp]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_KZED_Explosive_Comment',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Fire]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Burn',TraderTimeAudioCue=none)
	//DialogEvents[`KILL_FireResp]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_KZED_Fire_Comment',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Freeze]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Damage',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Electro]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Shock',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Toxic]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Poison',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Fave1]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_KillZed',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Fave2]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_KillZed',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Fave3]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_KillZed',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Fave4]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_KillZed',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Fave5]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_KillZed',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Fave6]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_KillZed',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Fave7]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_KillZed',TraderTimeAudioCue=none)
	DialogEvents[`KILL_Fave8]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_KillZed',TraderTimeAudioCue=none)


	DialogEvents[`DAMZ_Stun]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Damage',TraderTimeAudioCue=none)
	//DialogEvents[`DAMZ_Stumble]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_KZED_StumbleZed_Base',TraderTimeAudioCue=none)
	DialogEvents[`DAMZ_Knockdown]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Damage',TraderTimeAudioCue=none)
	DialogEvents[`DAMZ_Fire]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Burn',TraderTimeAudioCue=none)
	DialogEvents[`DAMZ_Freeze]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Damage',TraderTimeAudioCue=none)
	DialogEvents[`DAMZ_Electro]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Shock',TraderTimeAudioCue=none)
	DialogEvents[`DAMZ_Toxic]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Poison',TraderTimeAudioCue=none)
	DialogEvents[`DAMZ_Generic]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_INFO_Zed_Damage',TraderTimeAudioCue=none)
	//DialogEvents[`DAMZ_OverAndOver]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_KZED_DamageZedRpt_Base',TraderTimeAudioCue=none)
	//DialogEvents[`DAMZ_SprintToward]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_KZED_SprintTowardsZ_Base',TraderTimeAudioCue=none)


	DialogEvents[`DAMP_SpotTeamDeathM]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_TeammateDeath',TraderTimeAudioCue=none)
	DialogEvents[`DAMP_SpotTeamDeathMResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_TeammateDeath',TraderTimeAudioCue=none)
	DialogEvents[`DAMP_SpotTeamDeathF]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_TeammateDeath',TraderTimeAudioCue=none)
	DialogEvents[`DAMP_SpotTeamDeathFResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_TeammateDeath',TraderTimeAudioCue=none)
	DialogEvents[`DAMP_SpotTeamDeathLast]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_KillZed_LastPLayer',TraderTimeAudioCue=none)
	DialogEvents[`DAMP_Grunt]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_Grunt',TraderTimeAudioCue=none)
	//DialogEvents[`DAMP_Scream]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_PLAD_DamageScream_Base',TraderTimeAudioCue=none)
	DialogEvents[`DAMP_Fire]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_Grunt',TraderTimeAudioCue=none)
	DialogEvents[`DAMP_Sonic]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_Sound_Damage',TraderTimeAudioCue=none)
	DialogEvents[`DAMP_Ballistic]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_Grunt',TraderTimeAudioCue=none)
	DialogEvents[`DAMP_Toxic]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_Toxic_Damage',TraderTimeAudioCue=none)
	//DialogEvents[`DAMP_Blinded]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_PLAD_CantSeeDamage_Base',TraderTimeAudioCue=none)
	//DialogEvents[`DAMP_BlindedResp]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_PLAD_CantSeeDamage_Watch',TraderTimeAudioCue=none)
	DialogEvents[`DAMP_NearDeath]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_URGENT_NearDeath',TraderTimeAudioCue=none)
	DialogEvents[`DAMP_Dying]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_Dying',TraderTimeAudioCue=none)
	//DialogEvents[`DAMP_DyingResp]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_PLAD_Dying_Coward',TraderTimeAudioCue=none)


	DialogEvents[`SPOTZ_Generic]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_GenericThreats',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_BossFemale]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_Boss',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_BossGeneric]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_Boss',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_Siren]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_Siren',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_Scrake]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_Scrake',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_Fleshpound]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_Fleshpound',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_Horde]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_GenericThreats',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_GenericResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_GenericThreats',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_FemaleResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_GenericThreats',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_BigZedResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_GenericThreats',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_Cloaked]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_Cloaked',TraderTimeAudioCue=none)
	//DialogEvents[`SPOTZ_Surprise]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SPOT_Surprised_Base',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_Behind]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_Behind_You',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_Wall]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_On_Walls',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_Ceiling]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_On_Ceiling',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_EmergeVent]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_Out_Of_Vents',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_EmergeCeiling]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_On_Ceiling',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_EmergeFloor]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_Out_Of_Floors',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_JustCloaked]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_Cloaked',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_JustUncloaked]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_Uncloaked',TraderTimeAudioCue=none)
	//DialogEvents[`SPOTZ_AlmostDead]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SPOT_ZedAlmostDead_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SPOTZ_RunningAway]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SPOT_ZedRunAway_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SPOTZ_Found]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SPOT_ZedFound_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SPOTZ_NotSeen]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SPOT_ZedNotSeen_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SPOTZ_Healing]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SPOT_ZedHealing_Base',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_GrabbedMe]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Help',TraderTimeAudioCue=none)
	DialogEvents[`SPOTZ_PulledMeIn]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Help',TraderTimeAudioCue=none)
	//DialogEvents[`SPOTZ_ChargingAtMe]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SPOT_ChargingMe_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SPOTZ_RagingAtMe]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SPOT_Raging_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SPOTZ_ShootingAtMe]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SPOT_GettingShotAt_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SPOTZ_ShootingRockets]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SPOT_Rockets_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SPOTZ_ThrowGrenade]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SPOT_Grenade_Base',TraderTimeAudioCue=none)


	DialogEvents[`SITU_HealthCheck]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_CHECK_Health',TraderTimeAudioCue=none)
	DialogEvents[`SITU_HealthCheckRespLow]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_CHECK_Health',TraderTimeAudioCue=none)
	DialogEvents[`SITU_HealthCheckRespHigh]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_CHECK_Health',TraderTimeAudioCue=none)
	DialogEvents[`SITU_AmmoCheck]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_CHECK_Ammo',TraderTimeAudioCue=none)
	DialogEvents[`SITU_AmmoCheckRespLow]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_CHECK_Ammo',TraderTimeAudioCue=none)
	DialogEvents[`SITU_AmmoCheckRespHigh]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_CHECK_Ammo',TraderTimeAudioCue=none)
	DialogEvents[`SITU_General]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Idle',TraderTimeAudioCue=none)
	DialogEvents[`SITU_AllAlive]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Idle',TraderTimeAudioCue=none)
	DialogEvents[`SITU_AllAliveResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Idle',TraderTimeAudioCue=none)
	DialogEvents[`SITU_HalfAlive]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Idle_TeamHalfDead',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_HalfAliveResp]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_IdleHalfDead_Response',TraderTimeAudioCue=none)
	DialogEvents[`SITU_MostAlive]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Idle_TeamHalfDead',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_MostAliveResp]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_IdleFewDead_Response',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_LotsOfDosh]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_IdleLotsaDosh_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_LotsOfDoshRespLots]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_IdleLotsaDosh_LotsToo',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_LotsOfDoshRespLittle]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_IdleLotsaDosh_NotLots',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_LittleDosh]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_IdleLittleDosh_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_LittleDoshResp]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_IdleLittleDosh_NotLots',TraderTimeAudioCue=none)
	DialogEvents[`SITU_TalkSelf]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Idle_LastAlive',TraderTimeAudioCue=none)
	DialogEvents[`SITU_WaveStartGeneral]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Idle',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_WaveStartGoodLast]=()
	//DialogEvents[`SITU_WaveStartGoodSeveral]=()
	DialogEvents[`SITU_WaveStartBoss]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_SPOT_Boss',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_DarkOutside]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_DarkOutside_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_DarkInside]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_DarkInside_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_Raining]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_Raining_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_ColdInside]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_ColdInside_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_ColdOutside]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_ColdOutside_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_HotInside]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_HotInside_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_HotOutside]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_HotOutside_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_Foggy]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_Foggy_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_Snow]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_Snow_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_Gross]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_SeeGross_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_Smelly]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_SeeSmelly_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_HighTech]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_SeeHiTech_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_OldSchoolHighTech]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_SeeOldSchoolHiTech_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_Cloning]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_SeeCloning_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_Experiments]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_SeeScience_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_Torture]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_SeeTorture_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_BioMatter]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_SeeBioMatter_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_Aftermath]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_SeeBLOOD_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_Cave]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_Cave_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_Underground]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_Underground_Base',TraderTimeAudioCue=none)
	//DialogEvents[`SITU_CharSpecific]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_SITU_CharacterSpecific_Base',TraderTimeAudioCue=none)


	DialogEvents[`OBJ_Win]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_GenericBeep',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_WinResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_GenericBeep',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_Lose]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_GenericBeep',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_LoseResp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_GenericBeep',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_Decline]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_Deny',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_Accept]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_GenericBeep',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_DefendAStart]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_OBJ_Defend_Area',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_DefendAAlmostSecured]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_OBJ_GenericAlmosts',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_DefendAGetIn]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_OBJ_NobodyInArea',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_DefendTStart]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_OBJ_Defend_Area',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_DefendTAlmostSecured]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_OBJ_GenericAlmosts',TraderTimeAudioCue=none)
	//DialogEvents[`OBJ_DefendTAttacked]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_OBJE_TargetGettingHit_Base',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_DefendTDestroyed]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_OBJ_Target_Destroyed',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_HackStart]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_OBJ_Hack_Started',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_HackAlmostSecured]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_OBJ_GenericAlmosts',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_HackNeedHelp]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_Help',TraderTimeAudioCue=none)
	//DialogEvents[`OBJ_RepairStart]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_OBJE_StartRepair_Base',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_RepairAlmostDone]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_OBJ_GenericAlmosts',TraderTimeAudioCue=none)
	//DialogEvents[`OBJ_RepairTakeDamage]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_OBJE_HitWhileRepairing_Base',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_RepairFinish]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_GenericBeep',TraderTimeAudioCue=none)
	//DialogEvents[`OBJ_DestroyStart]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_OBJE_StartDestroy_Base',TraderTimeAudioCue=none)
	//DialogEvents[`OBJ_DestroyFinish]=(DefaultAudioCue=AkEvent'ww_vox_chr_Masterson.Play_Masterson_OBJE_TargetWeDestroyed_Base',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_EscortPackAcquire]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_GenericBeep',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_EscortPackDamaged]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_GenericBeep',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_EscortPackDestroyed]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_GenericBeep',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_EscortPackDead]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_GenericBeep',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_EscortPlayerDied]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_NEGATIVE_GenericBeep',TraderTimeAudioCue=none)
	DialogEvents[`OBJ_EscortPackSecured]=(DefaultAudioCue=AkEvent'WW_VOX_CHR_DAR.Play_DAR_POSITIVE_GenericBeep',TraderTimeAudioCue=none)

`if(`notdefined(ShippingPC))
	DialogEventNames[`COMM_GetToTrader]					=COMM_GetToTrader
	DialogEventNames[`COMM_FollowMe]                     =COMM_FollowMe
	DialogEventNames[`COMM_InsultZeds]                   =COMM_InsultZeds
	DialogEventNames[`COMM_RequestDosh]                  =COMM_RequestDosh
	DialogEventNames[`COMM_RequestDoshResp]              =COMM_RequestDoshResp
	DialogEventNames[`COMM_RequestHeal]                  =COMM_RequestHeal
	DialogEventNames[`COMM_RequestHealResp]              =COMM_RequestHealResp
	DialogEventNames[`COMM_RequestHelp]                  =COMM_RequestHelp
	DialogEventNames[`COMM_ConfirmGeneric]               =COMM_ConfirmGeneric
	DialogEventNames[`COMM_DenyGeneric]                  =COMM_DenyGeneric
	DialogEventNames[`ACT_WeldDoor]                      =ACT_WeldDoor
	DialogEventNames[`ACT_WeldDoorResp]                  =ACT_WeldDoorResp
	DialogEventNames[`ACT_WeldDoorUnderAttack]           =ACT_WeldDoorUnderAttack
	DialogEventNames[`ACT_WeldDoorUnderAttackResp]       =ACT_WeldDoorUnderAttackResp
	DialogEventNames[`ACT_WeldDoorAboutToBreak]          =ACT_WeldDoorAboutToBreak
	DialogEventNames[`ACT_WeldDoorAboutToBreakResp]      =ACT_WeldDoorAboutToBreakResp
	DialogEventNames[`ACT_WeldDoorFinish]                =ACT_WeldDoorFinish
	DialogEventNames[`ACT_UnweldDoor]                    =ACT_UnweldDoor
	DialogEventNames[`ACT_UnweldDoorFinish]              =ACT_UnweldDoorFinish
	DialogEventNames[`ACT_SpotDoorAttacked]              =ACT_SpotDoorAttacked
	DialogEventNames[`ACT_SpotDoorBreak]                 =ACT_SpotDoorBreak
	DialogEventNames[`ACT_HealSomeone]                   =ACT_HealSomeone
	DialogEventNames[`ACT_HealSomeoneRespLT50pct]        =ACT_HealSomeoneRespLT50pct
	DialogEventNames[`ACT_HealSomeoneRespMT75pct]        =ACT_HealSomeoneRespMT75pct
	DialogEventNames[`ACT_HealMiss]                      =ACT_HealMiss
	DialogEventNames[`ACT_HealMissResp]                  =ACT_HealMissResp
	DialogEventNames[`ACT_HealSelf]                      =ACT_HealSelf
	DialogEventNames[`ACT_DoshAtSomeone]                 =ACT_DoshAtSomeone
	DialogEventNames[`ACT_DoshAtSomeoneRespSome]         =ACT_DoshAtSomeoneRespSome
	DialogEventNames[`ACT_DoshAtSomeoneRespLots]         =ACT_DoshAtSomeoneRespLots
	DialogEventNames[`ACT_DoshAtGround]                  =ACT_DoshAtGround
	DialogEventNames[`ACT_DoshTrain]                     =ACT_DoshTrain
	DialogEventNames[`ACT_Reload]                        =ACT_Reload
	DialogEventNames[`ACT_ReloadUnderPres]               =ACT_ReloadUnderPres
	DialogEventNames[`ACT_DropWeap]                      =ACT_DropWeap
	DialogEventNames[`ACT_SpotAmmo]                      =ACT_SpotAmmo
	DialogEventNames[`ACT_SpotArmor]                     =ACT_SpotArmor
	DialogEventNames[`ACT_SpotWeap]                      =ACT_SpotWeap
	DialogEventNames[`ACT_AmmoLow]                       =ACT_AmmoLow
	DialogEventNames[`ACT_AmmoLowResp]                   =ACT_AmmoLowResp
	DialogEventNames[`ACT_AttackHeavy]                   =ACT_AttackHeavy
	DialogEventNames[`ACT_AttackLight]                   =ACT_AttackLight
	DialogEventNames[`ACT_SelectFaveWeap1]               =ACT_SelectFaveWeap1
	DialogEventNames[`ACT_SelectFaveWeap2]               =ACT_SelectFaveWeap2
	DialogEventNames[`ACT_SelectFaveWeap3]               =ACT_SelectFaveWeap3
	DialogEventNames[`ACT_SelectFaveWeap4]               =ACT_SelectFaveWeap4
	DialogEventNames[`ACT_SelectFaveWeap5]               =ACT_SelectFaveWeap5
	DialogEventNames[`ACT_SelectFaveWeap6]               =ACT_SelectFaveWeap6
	DialogEventNames[`ACT_SelectFaveWeap7]               =ACT_SelectFaveWeap7
	DialogEventNames[`ACT_SelectFaveWeap8]               =ACT_SelectFaveWeap8
	DialogEventNames[`ACT_Sprint]                        =ACT_Sprint
	DialogEventNames[`ACT_Jog]                           =ACT_Jog
	DialogEventNames[`ACT_Ironsights]                    =ACT_Ironsights
	DialogEventNames[`ACT_Jump]                          =ACT_Jump
	DialogEventNames[`ACT_CommentLvlLT10]                =ACT_CommentLvlLT10
	DialogEventNames[`ACT_CommentLvlLT25]                =ACT_CommentLvlLT25
	DialogEventNames[`ACT_CommentLvlLT50]                =ACT_CommentLvlLT50
	DialogEventNames[`ACT_CommentLvlMax]                 =ACT_CommentLvlMax
	DialogEventNames[`ACT_CommentLvlUpRespLower]         =ACT_CommentLvlUpRespLower
	DialogEventNames[`ACT_CommentLvlUpRespHigher]        =ACT_CommentLvlUpRespHigher
	DialogEventNames[`ACT_CommentResetOnce]              =ACT_CommentResetOnce
	DialogEventNames[`ACT_CommentResetMult]              =ACT_CommentResetMult
	DialogEventNames[`ACT_CommentResetMax]               =ACT_CommentResetMax
	DialogEventNames[`ACT_CommentResetRespLower]         =ACT_CommentResetRespLower
	DialogEventNames[`ACT_CommentResetRespHigher]        =ACT_CommentResetRespHigher
	DialogEventNames[`KILL_Generic]                      =KILL_Generic
	DialogEventNames[`KILL_Female]                       =KILL_Female
	DialogEventNames[`KILL_Boss]                         =KILL_Boss
	DialogEventNames[`KILL_BossResp]                     =KILL_BossResp
	DialogEventNames[`KILL_Massacre]                     =KILL_Massacre
	DialogEventNames[`KILL_MassacreResp]                 =KILL_MassacreResp
	DialogEventNames[`KILL_BeatDeadHorse]                =KILL_BeatDeadHorse
	DialogEventNames[`KILL_BeatDeadHorseResp]            =KILL_BeatDeadHorseResp
	DialogEventNames[`KILL_OnARoll]                      =KILL_OnARoll
	DialogEventNames[`KILL_OnARollResp]                  =KILL_OnARollResp
	DialogEventNames[`KILL_CloseCall]                    =KILL_CloseCall
	DialogEventNames[`KILL_AsLastPlayer]                 =KILL_AsLastPlayer
	DialogEventNames[`KILL_KnockedDown]                  =KILL_KnockedDown
	DialogEventNames[`KILL_Slashing]                     =KILL_Slashing
	DialogEventNames[`KILL_SlashingResp]                 =KILL_SlashingResp
	DialogEventNames[`KILL_Blunt]                        =KILL_Blunt
	DialogEventNames[`KILL_BluntResp]                    =KILL_BluntResp
	DialogEventNames[`KILL_Ballistic]                    =KILL_Ballistic
	DialogEventNames[`KILL_BallisticResp]                =KILL_BallisticResp
	DialogEventNames[`KILL_Explosive]                    =KILL_Explosive
	DialogEventNames[`KILL_ExplosiveResp]                =KILL_ExplosiveResp
	DialogEventNames[`KILL_Fire]                         =KILL_Fire
	DialogEventNames[`KILL_FireResp]                     =KILL_FireResp
	DialogEventNames[`KILL_Freeze]                       =KILL_Freeze
	DialogEventNames[`KILL_Electro]                      =KILL_Electro
	DialogEventNames[`KILL_Toxic]                        =KILL_Toxic
	DialogEventNames[`KILL_Fave1]                        =KILL_Fave1
	DialogEventNames[`KILL_Fave2]                        =KILL_Fave2
	DialogEventNames[`KILL_Fave3]                        =KILL_Fave3
	DialogEventNames[`KILL_Fave4]                        =KILL_Fave4
	DialogEventNames[`KILL_Fave5]                        =KILL_Fave5
	DialogEventNames[`KILL_Fave6]                        =KILL_Fave6
	DialogEventNames[`KILL_Fave7]                        =KILL_Fave7
	DialogEventNames[`KILL_Fave8]                        =KILL_Fave8
	DialogEventNames[`DAMZ_Stun]                         =DAMZ_Stun
	DialogEventNames[`DAMZ_Stumble]                      =DAMZ_Stumble
	DialogEventNames[`DAMZ_Knockdown]                    =DAMZ_Knockdown
	DialogEventNames[`DAMZ_Fire]                         =DAMZ_Fire
	DialogEventNames[`DAMZ_Freeze]                       =DAMZ_Freeze
	DialogEventNames[`DAMZ_Electro]                      =DAMZ_Electro
	DialogEventNames[`DAMZ_Toxic]                        =DAMZ_Toxic
	DialogEventNames[`DAMZ_Generic]                      =DAMZ_Generic
	DialogEventNames[`DAMZ_OverAndOver]                  =DAMZ_OverAndOver
	DialogEventNames[`DAMZ_SprintToward]                 =DAMZ_SprintToward
	DialogEventNames[`DAMP_SpotTeamDeathM]               =DAMP_SpotTeamDeathM
	DialogEventNames[`DAMP_SpotTeamDeathMResp]           =DAMP_SpotTeamDeathMResp
	DialogEventNames[`DAMP_SpotTeamDeathF]               =DAMP_SpotTeamDeathF
	DialogEventNames[`DAMP_SpotTeamDeathFResp]           =DAMP_SpotTeamDeathFResp
	DialogEventNames[`DAMP_SpotTeamDeathLast]            =DAMP_SpotTeamDeathLast
	DialogEventNames[`DAMP_Grunt]                        =DAMP_Grunt
	DialogEventNames[`DAMP_Scream]                       =DAMP_Scream
	DialogEventNames[`DAMP_Fire]                         =DAMP_Fire
	DialogEventNames[`DAMP_Sonic]                        =DAMP_Sonic
	DialogEventNames[`DAMP_Ballistic]                    =DAMP_Ballistic
	DialogEventNames[`DAMP_Toxic]                        =DAMP_Toxic
	DialogEventNames[`DAMP_Blinded]                      =DAMP_Blinded
	DialogEventNames[`DAMP_BlindedResp]                  =DAMP_BlindedResp
	DialogEventNames[`DAMP_NearDeath]                    =DAMP_NearDeath
	DialogEventNames[`DAMP_Dying]                        =DAMP_Dying
	DialogEventNames[`DAMP_DyingResp]                    =DAMP_DyingResp
	DialogEventNames[`SPOTZ_Generic]                     =SPOTZ_Generic
	DialogEventNames[`SPOTZ_BossFemale]                  =SPOTZ_BossFemale
	DialogEventNames[`SPOTZ_BossGeneric]                 =SPOTZ_BossGeneric
	DialogEventNames[`SPOTZ_Siren]                       =SPOTZ_Siren
	DialogEventNames[`SPOTZ_Scrake]                      =SPOTZ_Scrake
	DialogEventNames[`SPOTZ_Fleshpound]                  =SPOTZ_Fleshpound
	DialogEventNames[`SPOTZ_Horde]                       =SPOTZ_Horde
	DialogEventNames[`SPOTZ_GenericResp]                 =SPOTZ_GenericResp
	DialogEventNames[`SPOTZ_FemaleResp]                  =SPOTZ_FemaleResp
	DialogEventNames[`SPOTZ_BigZedResp]                  =SPOTZ_BigZedResp
	DialogEventNames[`SPOTZ_Cloaked]                     =SPOTZ_Cloaked
	DialogEventNames[`SPOTZ_Surprise]                    =SPOTZ_Surprise
	DialogEventNames[`SPOTZ_Behind]                      =SPOTZ_Behind
	DialogEventNames[`SPOTZ_Wall]                        =SPOTZ_Wall
	DialogEventNames[`SPOTZ_Ceiling]                     =SPOTZ_Ceiling
	DialogEventNames[`SPOTZ_EmergeVent]                  =SPOTZ_EmergeVent
	DialogEventNames[`SPOTZ_EmergeCeiling]               =SPOTZ_EmergeCeiling
	DialogEventNames[`SPOTZ_EmergeFloor]                 =SPOTZ_EmergeFloor
	DialogEventNames[`SPOTZ_JustCloaked]                 =SPOTZ_JustCloaked
	DialogEventNames[`SPOTZ_JustUncloaked]               =SPOTZ_JustUncloaked
	DialogEventNames[`SPOTZ_AlmostDead]                  =SPOTZ_AlmostDead
	DialogEventNames[`SPOTZ_RunningAway]                 =SPOTZ_RunningAway
	DialogEventNames[`SPOTZ_Found]                       =SPOTZ_Found
	DialogEventNames[`SPOTZ_NotSeen]                     =SPOTZ_NotSeen
	DialogEventNames[`SPOTZ_Healing]                     =SPOTZ_Healing
	DialogEventNames[`SPOTZ_GrabbedMe]                   =SPOTZ_GrabbedMe
	DialogEventNames[`SPOTZ_PulledMeIn]                  =SPOTZ_PulledMeIn
	DialogEventNames[`SPOTZ_ChargingAtMe]                =SPOTZ_ChargingAtMe
	DialogEventNames[`SPOTZ_RagingAtMe]                  =SPOTZ_RagingAtMe
	DialogEventNames[`SPOTZ_ShootingAtMe]                =SPOTZ_ShootingAtMe
	DialogEventNames[`SPOTZ_ShootingRockets]             =SPOTZ_ShootingRockets
	DialogEventNames[`SPOTZ_ThrowGrenade]                =SPOTZ_ThrowGrenade
	DialogEventNames[`SITU_HealthCheck]                  =SITU_HealthCheck
	DialogEventNames[`SITU_HealthCheckRespLow]           =SITU_HealthCheckRespLow
	DialogEventNames[`SITU_HealthCheckRespHigh]          =SITU_HealthCheckRespHigh
	DialogEventNames[`SITU_AmmoCheck]                    =SITU_AmmoCheck
	DialogEventNames[`SITU_AmmoCheckRespLow]             =SITU_AmmoCheckRespLow
	DialogEventNames[`SITU_AmmoCheckRespHigh]            =SITU_AmmoCheckRespHigh
	DialogEventNames[`SITU_General]                      =SITU_General
	DialogEventNames[`SITU_AllAlive]                     =SITU_AllAlive
	DialogEventNames[`SITU_AllAliveResp]                 =SITU_AllAliveResp
	DialogEventNames[`SITU_HalfAlive]                    =SITU_HalfAlive
	DialogEventNames[`SITU_HalfAliveResp]                =SITU_HalfAliveResp
	DialogEventNames[`SITU_MostAlive]                    =SITU_MostAlive
	DialogEventNames[`SITU_MostAliveResp]                =SITU_MostAliveResp
	DialogEventNames[`SITU_LotsOfDosh]                   =SITU_LotsOfDosh
	DialogEventNames[`SITU_LotsOfDoshRespLots]           =SITU_LotsOfDoshRespLots
	DialogEventNames[`SITU_LotsOfDoshRespLittle]         =SITU_LotsOfDoshRespLittle
	DialogEventNames[`SITU_LittleDosh]                   =SITU_LittleDosh
	DialogEventNames[`SITU_LittleDoshResp]               =SITU_LittleDoshResp
	DialogEventNames[`SITU_TalkSelf]                     =SITU_TalkSelf
	DialogEventNames[`SITU_WaveStartGeneral]             =SITU_WaveStartGeneral
	DialogEventNames[`SITU_WaveStartGoodLast]            =SITU_WaveStartGoodLast
	DialogEventNames[`SITU_WaveStartGoodSeveral]         =SITU_WaveStartGoodSeveral
	DialogEventNames[`SITU_WaveStartBoss]                =SITU_WaveStartBoss
	DialogEventNames[`SITU_DarkOutside]                  =SITU_DarkOutside
	DialogEventNames[`SITU_DarkInside]                   =SITU_DarkInside
	DialogEventNames[`SITU_Raining]                      =SITU_Raining
	DialogEventNames[`SITU_ColdInside]                   =SITU_ColdInside
	DialogEventNames[`SITU_ColdOutside]                  =SITU_ColdOutside
	DialogEventNames[`SITU_HotInside]                    =SITU_HotInside
	DialogEventNames[`SITU_HotOutside]                   =SITU_HotOutside
	DialogEventNames[`SITU_Foggy]                        =SITU_Foggy
	DialogEventNames[`SITU_Snow]                         =SITU_Snow
	DialogEventNames[`SITU_Gross]                        =SITU_Gross
	DialogEventNames[`SITU_Smelly]                       =SITU_Smelly
	DialogEventNames[`SITU_HighTech]                     =SITU_HighTech
	DialogEventNames[`SITU_OldSchoolHighTech]            =SITU_OldSchoolHighTech
	DialogEventNames[`SITU_Cloning]                      =SITU_Cloning
	DialogEventNames[`SITU_Experiments]                  =SITU_Experiments
	DialogEventNames[`SITU_Torture]                      =SITU_Torture
	DialogEventNames[`SITU_BioMatter]                    =SITU_BioMatter
	DialogEventNames[`SITU_Aftermath]                    =SITU_Aftermath
	DialogEventNames[`SITU_Cave]                         =SITU_Cave
	DialogEventNames[`SITU_Underground]                  =SITU_Underground
	DialogEventNames[`SITU_CharSpecific]                 =SITU_CharSpecific
	DialogEventNames[`OBJ_Win]                           =OBJ_Win
	DialogEventNames[`OBJ_WinResp]                       =OBJ_WinResp
	DialogEventNames[`OBJ_Lose]                          =OBJ_Lose
	DialogEventNames[`OBJ_LoseResp]                      =OBJ_LoseResp
	DialogEventNames[`OBJ_Decline]                       =OBJ_Decline
	DialogEventNames[`OBJ_Accept]                        =OBJ_Accept
	DialogEventNames[`OBJ_DefendAStart]                  =OBJ_DefendAStart
	DialogEventNames[`OBJ_DefendAAlmostSecured]          =OBJ_DefendAAlmostSecured
	DialogEventNames[`OBJ_DefendAGetIn]                  =OBJ_DefendAGetIn
	DialogEventNames[`OBJ_DefendTStart]                  =OBJ_DefendTStart
	DialogEventNames[`OBJ_DefendTAlmostSecured]          =OBJ_DefendTAlmostSecured
	DialogEventNames[`OBJ_DefendTAttacked]               =OBJ_DefendTAttacked
	DialogEventNames[`OBJ_DefendTDestroyed]              =OBJ_DefendTDestroyed
	DialogEventNames[`OBJ_HackStart]                     =OBJ_HackStart
	DialogEventNames[`OBJ_HackAlmostSecured]             =OBJ_HackAlmostSecured
	DialogEventNames[`OBJ_HackNeedHelp]                  =OBJ_HackNeedHelp
	DialogEventNames[`OBJ_RepairStart]                   =OBJ_RepairStart
	DialogEventNames[`OBJ_RepairAlmostDone]              =OBJ_RepairAlmostDone
	DialogEventNames[`OBJ_RepairTakeDamage]              =OBJ_RepairTakeDamage
	DialogEventNames[`OBJ_RepairFinish]                  =OBJ_RepairFinish
	DialogEventNames[`OBJ_DestroyStart]                  =OBJ_DestroyStart
	DialogEventNames[`OBJ_DestroyFinish]                 =OBJ_DestroyFinish
	DialogEventNames[`OBJ_EscortPackAcquire]             =OBJ_EscortPackAcquire
	DialogEventNames[`OBJ_EscortPackDamaged]             =OBJ_EscortPackDamaged
	DialogEventNames[`OBJ_EscortPackDestroyed]           =OBJ_EscortPackDestroyed
	DialogEventNames[`OBJ_EscortPackDead]                =OBJ_EscortPackDead
	DialogEventNames[`OBJ_EscortPlayerDied]              =OBJ_EscortPlayerDied
	DialogEventNames[`OBJ_EscortPackSecured]             =OBJ_EscortPackSecured
`endif
}