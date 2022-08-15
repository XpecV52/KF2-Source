class KFSkinTypeEffects_HansShield extends KFSkinTypeEffects;

/** Overriden to orient the effect toward in the direction of the hit and not attach it to a specific bone */
simulated function AttachEffectToHitLocation( KFPawn P, ParticleSystem ParticleTemplate, int HitZoneIndex, vector HitLocation, vector HitDirection )
{
	local name HitBoneName;
	local int HitBoneIdx;

	local ParticleSystemComponent PSC;
	
	// HitZone==255 is unsupported for this type
	if ( HitZoneIndex != 255 )
	{
		HitBoneName = P.HitZones[HitZoneIndex].BoneName;
		HitBoneIdx = P.Mesh.MatchRefBone(HitBoneName);

		if( HitBoneIdx != INDEX_NONE )
		{
			PSC = P.WorldInfo.ImpactFXEmitterPool.SpawnEmitter(ParticleTemplate, HitLocation, rotator(-HitDirection), P);
			PSC.SetLightingChannels(P.PawnLightingChannel);

			P.LastImpactParticleEffectTime = P.WorldInfo.TimeSeconds;

			// Make the particle system ignore bone rotation
			PSC.SetAbsolute(false, true, true);
		}
	}
}

defaultproperties
{
   ImpactFX(0)=(DefaultParticle=ParticleSystem'ZED_Hans_EMIT.FX_Hans_invulnerable_Hit',bAttachToHitLocation=True,DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')
   ImpactFX(1)=(Type=FXG_Bludgeon,DefaultParticle=ParticleSystem'ZED_Hans_EMIT.FX_Hans_invulnerable_Hit',bAttachToHitLocation=True,DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')
   ImpactFX(2)=(Type=FXG_Piercing,DefaultParticle=ParticleSystem'ZED_Hans_EMIT.FX_Hans_invulnerable_Hit',bAttachToHitLocation=True,DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')
   ImpactFX(3)=(Type=FXG_Slashing,DefaultParticle=ParticleSystem'ZED_Hans_EMIT.FX_Hans_invulnerable_Hit',bAttachToHitLocation=True,DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')
   ImpactFX(4)=(Type=FXG_Fire,DefaultParticle=ParticleSystem'ZED_Hans_EMIT.FX_Hans_invulnerable_Hit',bAttachToHitLocation=True,DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')
   ImpactFX(5)=(Type=FXG_Toxic,DefaultParticle=ParticleSystem'ZED_Hans_EMIT.FX_Hans_invulnerable_Hit',bAttachToHitLocation=True,DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')
   ImpactFX(6)=(Type=FXG_Healing,DefaultParticle=ParticleSystem'ZED_Hans_EMIT.FX_Hans_invulnerable_Hit',bAttachToHitLocation=True,DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')
   ImpactFX(7)=(Type=FXG_Sawblade,DefaultParticle=ParticleSystem'ZED_Hans_EMIT.FX_Hans_invulnerable_Hit',bAttachToHitLocation=True,DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')
   ImpactFX(8)=(Type=FXG_DrainLife,DefaultParticle=ParticleSystem'ZED_Hans_EMIT.FX_Hans_invulnerable_Hit',bAttachToHitLocation=True,DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')
   ImpactFX(9)=(Type=FXG_IncendiaryRound,DefaultParticle=ParticleSystem'ZED_Hans_EMIT.FX_Hans_invulnerable_Hit',bAttachToHitLocation=True,DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')
   ImpactFX(10)=(Type=FXG_UnexplodedGrenade,DefaultParticle=ParticleSystem'ZED_Hans_EMIT.FX_Hans_invulnerable_Hit',bAttachToHitLocation=True,DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')
   ImpactFX(11)=(Type=FXG_MicrowaveBlast,DefaultParticle=ParticleSystem'ZED_Hans_EMIT.FX_Hans_invulnerable_Hit',bAttachToHitLocation=True,DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')
   Name="Default__KFSkinTypeEffects_HansShield"
   ObjectArchetype=KFSkinTypeEffects'KFGame.Default__KFSkinTypeEffects'
}
