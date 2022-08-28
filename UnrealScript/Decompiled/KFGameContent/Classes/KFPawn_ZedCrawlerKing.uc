/*******************************************************************************
 * KFPawn_ZedCrawlerKing generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedCrawlerKing extends KFPawn_ZedCrawler
    config(Game)
    hidecategories(Navigation);

var protected bool bShouldExplode;

replication
{
     if(bTearOff)
        bShouldExplode;
}

function CauseHeadTrauma(optional float BleedOutTime)
{
    BleedOutTime = 5;
    super(KFPawn_Monster).CauseHeadTrauma(BleedOutTime);
    CancelExplosion();
}

simulated function PlayHeadAsplode()
{
    super(KFPawn_Monster).PlayHeadAsplode();
    CancelExplosion();
}

function bool Died(Controller Killer, class<DamageType> DamageType, Vector HitLocation)
{
    if(!bPlayedDeath && DamageType != Class'KFSM_PlayerCrawler_Suicide'.default.SuicideDamageType)
    {
        bShouldExplode = true;
    }
    return super(KFPawn_Monster).Died(Killer, DamageType, HitLocation);
}

simulated function PlayDying(class<DamageType> DamageType, Vector HitLoc)
{
    super(KFPawn_Monster).PlayDying(DamageType, HitLoc);
    if(bShouldExplode)
    {
        SetTimer(WorldInfo.DeltaSeconds, false, 'Timer_CheckForExplode');
    }
}

simulated function CancelExplosion()
{
    bShouldExplode = false;
    if(IsTimerActive('Timer_CheckForExplode'))
    {
        ClearTimer('Timer_CheckForExplode');
    }
}

simulated function Timer_CheckForExplode()
{
    local KFGoreManager GoreManager;
    local array<name> OutGibBoneList;
    local int NumGibs;
    local Vector Impulse;

    if(bShouldExplode)
    {
        Class'KFSM_PlayerCrawler_Suicide'.static.TriggerExplosion(self, DeathExplosionTemplate, true);
        if(WorldInfo.NetMode != NM_DedicatedServer)
        {
            GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);
            if((GoreManager != none) && GoreManager.AllowMutilation())
            {
                if(!bIsGoreMesh)
                {
                    SwitchToGoreMesh();
                }
                if(bIsGoreMesh)
                {
                    NumGibs = 10 + Rand(4);
                    NumGibs *= GetCharacterMonsterInfo().ExplosionGibScale;
                    GetClosestHitBones(NumGibs, Location, OutGibBoneList);
                    GoreManager.CauseGibsAndApplyImpulse(self, Class'KFSM_PlayerCrawler_Suicide'.default.SuicideDamageType, Location, OutGibBoneList, none, Mesh.GetBoneLocation(Mesh.GetBoneName(0)));
                    return;
                }
            }
            if((NumGibs == 0) && Physics == 10)
            {
                Impulse = (vect(0, 0, 1) * LowGoreExplosionImpulse) * PhysRagdollImpulseScale;
                Mesh.AddImpulse(Impulse, Location);
            }
        }
    }
}

defaultproperties
{
    DeathExplosionTemplate=KFGameExplosion'Default__KFPawn_ZedCrawlerKing.ExploTemplate0'
    MonsterArchPath="ZED_ARCH.ZED_CrawlerKing_Archetype"
    MeleeAttackHelper=KFMeleeHelperAI'Default__KFPawn_ZedCrawlerKing.MeleeHelper'
    DifficultySettings=Class'KFDifficulty_CrawlerKing'
    SprintAkComponent=AkComponent'Default__KFPawn_ZedCrawlerKing.SprintAkComponent0'
    LocalizationKey=KFPawn_ZedCrawlerKing
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedCrawlerKing.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedCrawlerKing.Afflictions'
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedCrawlerKing.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    SpecialMoveHandler=KFSpecialMoveHandler'Default__KFPawn_ZedCrawlerKing.SpecialMoveHandler'
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedCrawlerKing.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedCrawlerKing.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedCrawlerKing.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedCrawlerKing.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedCrawlerKing.DialogAkSoundComponent'
    ControllerClass=Class'KFAIController_ZedCrawlerKing'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedCrawlerKing.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedCrawlerKing.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedCrawlerKing.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedCrawlerKing.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedCrawlerKing.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedCrawlerKing.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedCrawlerKing.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedCrawlerKing.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedCrawlerKing.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedCrawlerKing.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedCrawlerKing.SprintAkComponent0'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedCrawlerKing.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}