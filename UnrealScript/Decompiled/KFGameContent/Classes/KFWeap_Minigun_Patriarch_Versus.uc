/*******************************************************************************
 * KFWeap_Minigun_Patriarch_Versus generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Minigun_Patriarch_Versus extends KFWeap_Minigun_Patriarch
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

var KFPawn_ZedPatriarch_Versus MyPatPawn;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    if(Instigator != none)
    {
        MyPatPawn = KFPawn_ZedPatriarch_Versus(Instigator);
    }
}

simulated function bool ShouldWeaponIgnoreStartFire()
{
    return true;
}

defaultproperties
{
    PlayerIronSightFOV=60
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Minigun_Patriarch_Versus.MeleeHelper'
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Minigun_Patriarch_Versus.FirstPersonMesh'
    Mesh=FirstPersonMesh
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Minigun_Patriarch_Versus.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Minigun_Patriarch_Versus.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}