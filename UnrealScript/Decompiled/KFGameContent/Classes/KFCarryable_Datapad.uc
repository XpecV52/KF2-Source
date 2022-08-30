/*******************************************************************************
 * KFCarryable_Datapad generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFCarryable_Datapad extends KFCarryableObject_Collectible
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

var() AkEvent PersistentSoundLoop;
var() AkEvent PersistentSoundStop;

simulated state WeaponEquipping
{
    simulated event BeginState(name PreviousStateName)
    {
        local KFPawn InstigatorPawn;

        super.BeginState(PreviousStateName);
        if(Instigator != none)
        {
            InstigatorPawn = KFPawn(Instigator);
            if(InstigatorPawn != none)
            {
                InstigatorPawn.PlayWeaponSoundEvent(PersistentSoundLoop);
            }
        }
    }
    stop;    
}

simulated state Inactive
{
    simulated event BeginState(name PreviousStateName)
    {
        local KFPawn InstigatorPawn;

        super.BeginState(PreviousStateName);
        if(Instigator != none)
        {
            InstigatorPawn = KFPawn(Instigator);
            if(InstigatorPawn != none)
            {
                InstigatorPawn.PlayWeaponSoundEvent(PersistentSoundStop);
            }
        }
    }
    stop;    
}

defaultproperties
{
    PersistentSoundLoop=AkEvent'WW_WEP_Datapad.Play_WEP_Datapad_Hold_LP'
    PersistentSoundStop=AkEvent'WW_WEP_Datapad.Stop_WEP_Datapad_Hold_LP'
    PackageKey="Datapad"
    FirstPersonMeshName="WEP_1P_Datapad_MESH.WEP_1stP_Datapad_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_Datapad_MESH.Wep_3rdP_Horzine_Datapad_Static_Pickuo"
    AttachmentArchetypeName="WEP_Datapad_ARCH.Wep_Datapad_3P"
    WeaponSelectTexture=Texture2D'WEP_UI_Datapad_TEX.UI_WeaponSelect_Datapad'
    PlayerViewOffset=(X=0,Y=6,Z=0)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFCarryable_Datapad.MeleeHelper'
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFCarryable_Datapad.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Data Pad"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFCarryable_Datapad.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFCarryable_Datapad.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}