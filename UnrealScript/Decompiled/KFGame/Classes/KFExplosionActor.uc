/*******************************************************************************
 * KFExplosionActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFExplosionActor extends GameExplosionActor
    config(Weapon)
    hidecategories(Navigation);

var MaterialImpactEffect MyImpactEffect;
var byte NumPawnsKilled;
var const KFLightPool.LightPoolPriority ExplosionLightPriority;
var const float DamageScalePerStack;

simulated function Explode(GameExplosion NewExplosionTemplate, optional Vector Direction)
{
    local ParticleSystem ParticleTemplateOverride;
    local KFGameExplosion TemplateExplosion;

    TemplateExplosion = KFGameExplosion(NewExplosionTemplate);
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if((!NewExplosionTemplate.bAllowPerMaterialFX && TemplateExplosion != none) && TemplateExplosion.ExplosionEffects != none)
        {
            ParticleTemplateOverride = TemplateExplosion.ExplosionEffects.DefaultImpactEffect.ParticleTemplate;
            if(ParticleTemplateOverride != none)
            {
                NewExplosionTemplate.ParticleEmitterTemplate = ParticleTemplateOverride;
            }
        }
    }
    super.Explode(NewExplosionTemplate, Direction);
    if(((TemplateExplosion != none) && TemplateExplosion.NumShards > 0) && TemplateExplosion.ShardClass != none)
    {
        SpawnShards(NewExplosionTemplate, TemplateExplosion.NumShards, TemplateExplosion.ShardClass);
    }
    if(((ExplosionLight != none) && ExplosionLight.bAttached) && ExplosionLight.bEnabled)
    {
        KFLightPool(WorldInfo.MyLightPool).RegisterPointLight(ExplosionLight, ExplosionLightPriority);
    }
}

simulated function SpawnShards(GameExplosion NewExplosionTemplate, int NumShards, class<Projectile> ShardClass, optional int PitchShardMin, optional int PitchShardMax)
{
    local Vector SpawnPos;
    local Actor HitActor;
    local Rotator Rot;
    local int I;
    local Projectile NewChunk;
    local Vector HitLocation, HitNormal;
    local int YawShardPosition, YawShardIncrement;

    PitchShardMin = 10;
    PitchShardMax = 35;
    YawShardIncrement = 360 / NumShards;
    SpawnPos = NewExplosionTemplate.HitLocation + (float(10) * NewExplosionTemplate.HitNormal);
    HitActor = Trace(HitLocation, HitNormal, SpawnPos, NewExplosionTemplate.HitLocation, false);
    if(HitActor != none)
    {
        SpawnPos = HitLocation;        
    }
    else
    {
        HitNormal = NewExplosionTemplate.HitNormal;
    }
    if((Instigator != none) && Instigator.Role == ROLE_Authority)
    {
        if(bDrawDebug)
        {
            DrawDebugLine(SpawnPos, SpawnPos + (HitNormal * 1000), 0, 255, 0, true);
        }
        I = 0;
        J0x192:

        if(I < NumShards)
        {
            Rot.Pitch = int(RandRange(float(PitchShardMin), float(PitchShardMax)) * 182.0444);
            YawShardPosition += YawShardIncrement;
            Rot.Yaw = int(float(YawShardPosition) * 182.0444);
            NewChunk = Spawn(ShardClass, ((Instigator != none) ? Instigator.Weapon : self),, SpawnPos, Rot);
            if(bDrawDebug)
            {
                DrawDebugLine(SpawnPos, SpawnPos + (Normal(vector(Rot)) * 500), 255, 0, 0, true);
            }
            if(NewChunk != none)
            {
                NewChunk.Init(vector(Rot));
            }
            ++ I;
            goto J0x192;
        }
    }
}

protected simulated function UpdateExplosionTemplateWithPerMaterialFX(PhysicalMaterial PhysMaterial)
{
    if(PhysMaterial == none)
    {
        MyImpactEffect = KFGameExplosion(ExplosionTemplate).ExplosionEffects.DefaultImpactEffect;        
    }
    else
    {
        if(WorldInfo.MyImpactEffectManager != none)
        {
            KFImpactEffectManager(WorldInfo.MyImpactEffectManager).GetImpactEffect(PhysMaterial, MyImpactEffect, KFGameExplosion(ExplosionTemplate).ExplosionEffects);
        }
    }
    if(MyImpactEffect.ParticleTemplate != none)
    {
        ExplosionTemplate.ParticleEmitterTemplate = MyImpactEffect.ParticleTemplate;
    }
}

simulated function SpawnExplosionParticleSystem(ParticleSystem Template)
{
    if(!ExplosionTemplate.bAllowPerMaterialFX && Template == none)
    {
        Template = KFGameExplosion(ExplosionTemplate).ExplosionEffects.DefaultImpactEffect.ParticleTemplate;
    }
    WorldInfo.MyEmitterPool.SpawnEmitter(Template, Location, rotator(ExplosionTemplate.HitNormal), none);
}

simulated function SpawnExplosionDecal()
{
    local MaterialInterface MI;
    local MaterialInstanceTimeVarying MITV_Decal;
    local int DecalMaterialsLength;
    local float DecalSize, DecalThickness;
    local KFGameExplosion KFExplosionTemplate;

    if(WorldInfo.bDropDetail)
    {
        return;
    }
    if(!ExplosionTemplate.bAllowPerMaterialFX)
    {
        KFExplosionTemplate = KFGameExplosion(ExplosionTemplate);
        if((KFExplosionTemplate == none) || KFExplosionTemplate.ExplosionEffects == none)
        {
            return;
        }
        MyImpactEffect = KFExplosionTemplate.ExplosionEffects.DefaultImpactEffect;
    }
    DecalMaterialsLength = MyImpactEffect.DecalMaterials.Length;
    if(DecalMaterialsLength > 0)
    {
        MI = MyImpactEffect.DecalMaterials[Rand(DecalMaterialsLength)];
        if(MI != none)
        {
            DecalSize = RandRange(MyImpactEffect.DecalMinSize, MyImpactEffect.DecalMaxSize);
            DecalThickness = DecalSize * 2;
            if(MaterialInstanceTimeVarying(MI) != none)
            {
                MITV_Decal = new (self) Class'MaterialInstanceTimeVarying';
                MITV_Decal.SetParent(MI);
                WorldInfo.ExplosionDecalManager.SpawnDecal(MITV_Decal, ExplosionTemplate.HitLocation, rotator(-ExplosionTemplate.HitNormal), DecalSize, DecalSize, DecalThickness, false, ((MyImpactEffect.bNoDecalRotation) ? 0 : FRand() * 360));
                MITV_Decal.SetScalarStartTime(MyImpactEffect.DecalDissolveParamName, MyImpactEffect.DecalDuration);                
            }
            else
            {
                WorldInfo.ExplosionDecalManager.SpawnDecal(MI, ExplosionTemplate.HitLocation, rotator(-ExplosionTemplate.HitNormal), DecalSize, DecalSize, DecalThickness, true, ((MyImpactEffect.bNoDecalRotation) ? 0 : FRand() * 360),,,,,,, MyImpactEffect.DecalDuration);
            }
        }
    }
}

protected function SpecialPawnEffectsFor(GamePawn VictimPawn, float VictimDist)
{
    if(VictimPawn.bRespondToExplosions && VictimPawn.Health > 0)
    {
    }
    if(VictimPawn != none)
    {
        if(VictimPawn.bPlayedDeath && KFPawn(VictimPawn).TimeOfDeath == WorldInfo.TimeSeconds)
        {
            ++ NumPawnsKilled;
        }
    }
}

protected function bool KnockdownPawn(BaseAIPawn Victim, float DistFromExplosion)
{
    local KFPawn KFP;

    KFP = KFPawn(Victim);
    if(KFP != none)
    {
        KFP.LastHitBy = InstigatorController;
        KFP.Knockdown(,, vect(1, 1, 1), Location, ExplosionTemplate.DamageRadius * 2, ExplosionTemplate.KnockDownStrength);
    }
    return Victim.Physics == 10;
}

protected function bool StumblePawn(BaseAIPawn Victim, float DistFromExplosion)
{
    local KFPawn KFP;

    KFP = KFPawn(Victim);
    if(KFP != none)
    {
        KFP.DoSpecialMove(4,,, Class'KFSM_Stumble'.static.PackBodyHitSMFlags(KFP, Normal(KFP.Location - ExplosionTemplate.HitLocation)));
        return KFP.IsDoingSpecialMove(4);
    }
    return false;
}

protected simulated function bool DoExplosionDamage(bool bCauseDamage, bool bCauseEffects)
{
    local bool bReturn;

    NumPawnsKilled = 0;
    bReturn = super.DoExplosionDamage(bCauseDamage, bCauseEffects);
    if((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none)
    {
        if(NumPawnsKilled >= 4)
        {
            KFGameInfo(WorldInfo.Game).DramaticEvent(0.05);            
        }
        else
        {
            if(NumPawnsKilled >= 2)
            {
                KFGameInfo(WorldInfo.Game).DramaticEvent(0.03);
            }
        }
    }
    return bReturn;
}

simulated function DrawDebug()
{
    local Color C;
    local float Angle, ClotKillRadius, HalfFalloffRadius;

    FlushPersistentDebugLines();
    if(ExplosionTemplate.bDirectionalExplosion)
    {
        C.R = 255;
        C.G = 128;
        C.B = 16;
        C.A = 255;
        Angle = ExplosionTemplate.DirectionalExplosionAngleDeg * 0.01745329;
        DrawDebugCone(Location, ExplosionDirection, ExplosionTemplate.DamageRadius, Angle, Angle, 8, C, true);        
    }
    else
    {
        DrawDebugSphere(Location, ExplosionTemplate.DamageRadius, 10, 255, 128, 16, true);
        ClotKillRadius = ExplosionTemplate.DamageRadius * (1 - FClamp((100 / ExplosionTemplate.Damage) ** (float(1) / ExplosionTemplate.DamageFalloffExponent), 0, 1));
        DrawDebugSphere(Location, ClotKillRadius, 10, 255, 0, 0, true);
        HalfFalloffRadius = ExplosionTemplate.DamageRadius * (1 - FClamp(0.5 ** (1 / ExplosionTemplate.DamageFalloffExponent), 0, 1));
        DrawDebugSphere(Location, HalfFalloffRadius, 10, 255, 63, 0, true);
    }
}

simulated function float CalcStackingDamageScale(KFPawn Victim, float MinDamageInterval)
{
    local int I, ExistingIdx;
    local float DamageMod;
    local GameExplosionActor OtherExplosion;
    local ExplosiveStackInfo NewStackInfo;

    if((DamageScalePerStack >= 1) || Victim == none)
    {
        return 1;
    }
    DamageMod = 1;
    ExistingIdx = -1;
    I = Victim.RecentExplosiveStacks.Length - 1;
    J0x74:

    if(I >= 0)
    {
        OtherExplosion = Victim.RecentExplosiveStacks[I].Explosion;
        if(OtherExplosion == self)
        {
            ExistingIdx = I;
        }
        if(OtherExplosion == none)
        {
            Victim.RecentExplosiveStacks.Remove(I, 1;
            if((ExistingIdx != -1) && ExistingIdx > I)
            {
                -- ExistingIdx;
            }            
        }
        else
        {
            if((OtherExplosion.ExplosionTemplate.MyDamageType == ExplosionTemplate.MyDamageType) && (WorldInfo.TimeSeconds - Victim.RecentExplosiveStacks[I].LastHitTime) < MinDamageInterval)
            {
                DamageMod *= DamageScalePerStack;
            }
        }
        -- I;
        goto J0x74;
    }
    if(DamageMod > 0)
    {
        if(ExistingIdx != -1)
        {
            Victim.RecentExplosiveStacks[ExistingIdx].LastHitTime = WorldInfo.TimeSeconds;            
        }
        else
        {
            NewStackInfo.Explosion = self;
            NewStackInfo.LastHitTime = WorldInfo.TimeSeconds;
            Victim.RecentExplosiveStacks.AddItem(NewStackInfo;
        }
    }
    return DamageMod;
}

protected simulated function bool IsBehindExplosion(Actor A)
{
    local KFPawn P;
    local Vector TorsoLoc;

    if(ExplosionTemplate.bDirectionalExplosion && !IsZero(ExplosionDirection))
    {
        if(!super.IsBehindExplosion(A))
        {
            return false;
        }
        P = KFPawn(A);
        if((P != none) && P.TorsoBoneName != 'None')
        {
            TorsoLoc = P.Mesh.GetBoneLocation(P.TorsoBoneName);
            return (ExplosionDirection Dot Normal(TorsoLoc - Location)) < DirectionalExplosionMinDot;
        }
    }
    return false;
}

function Reset()
{
    Destroy();
}

defaultproperties
{
    MyImpactEffect=(MaterialType=EMaterialTypes.EMT_None,Sound=none,StopSoundEvent=none,ParticleTemplate=none,DecalMaterials=none,DecalDissolveParamName=DissolveAmount,DecalDuration=24,DecalMinSize=16,DecalMaxSize=16,bNoDecalRotation=false)
    ExplosionLightPriority=LightPoolPriority.LPP_High
    DamageScalePerStack=1
    RadialImpulseComponent=none
    Components=none
}