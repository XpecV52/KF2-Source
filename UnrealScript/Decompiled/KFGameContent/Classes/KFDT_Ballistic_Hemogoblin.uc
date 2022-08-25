/*******************************************************************************
 * KFDT_Ballistic_Hemogoblin generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Ballistic_Hemogoblin extends KFDT_Ballistic_Rifle
    abstract;

var class<Actor> TubeAttachClass;

static simulated function bool CanDismemberHitZone(name InHitZoneName)
{
    if(super(KFDT_Ballistic).CanDismemberHitZone(InHitZoneName))
    {
        return true;
    }
    switch(InHitZoneName)
    {
        case 'lupperarm':
        case 'rupperarm':
        case 'chest':
        case 'heart':
            return true;
        default:
            return false;
            break;
    }
}

static simulated function bool CanDismemberHitZoneWhileAlive(name InHitZoneName)
{
    return false;
}

static function PlayImpactHitEffects(KFPawn P, Vector HitLocation, Vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator)
{
    local Actor TubeAttachment;
    local Vector StickLocation;
    local Rotator StickRotation;
    local name BoneName;
    local WorldInfo WI;
    local KFPawn RetracePawn;
    local Vector RetraceLocation, RetraceNormal;
    local TraceHitInfo HitInfo;

    WI = Class'WorldInfo'.static.GetWorldInfo();
    if(((((P != none) && HitZoneIndex > 0) && HitZoneIndex < P.HitZones.Length) && WI != none) && WI.NetMode != NM_DedicatedServer)
    {
        foreach WI.TraceActors(Class'KFPawn', RetracePawn, RetraceLocation, RetraceNormal, HitLocation + (HitDirection * float(50)), HitLocation - (HitDirection * float(50)), vect(0, 0, 0), HitInfo, 1)
        {
            if(P == RetracePawn)
            {
                HitLocation = RetraceLocation;
                HitDirection = -RetraceNormal;
                break;
            }            
        }        
        TubeAttachment = P.Spawn(default.TubeAttachClass, P,, HitLocation, rotator(HitDirection));
        if(TubeAttachment != none)
        {
            BoneName = P.HitZones[HitZoneIndex].BoneName;
            P.Mesh.TransformToBoneSpace(BoneName, TubeAttachment.Location, TubeAttachment.Rotation, StickLocation, StickRotation);
            TubeAttachment.SetBase(P,, P.Mesh, BoneName);
            TubeAttachment.SetRelativeLocation(StickLocation);
            TubeAttachment.SetRelativeRotation(StickRotation);
        }
    }
}

static function ApplySecondaryDamage(KFPawn Victim, int DamageTaken, optional Controller InstigatedBy)
{
    local class<KFDamageType> ToxicDT;
    local int ToxicDamageTaken;

    ToxicDamageTaken = DamageTaken;
    ToxicDT = Class'KFDT_Ballistic_Assault_Medic'.static.GetMedicToxicDmgType(ToxicDamageTaken, InstigatedBy);
    if(ToxicDT != none)
    {
        Victim.ApplyDamageOverTime(ToxicDamageTaken, InstigatedBy, ToxicDT);
    }
    super(KFDamageType).ApplySecondaryDamage(Victim, DamageTaken, InstigatedBy);
}

defaultproperties
{
    TubeAttachClass=Class'KFWeapActor_Hemogoblin_Tube'
    WeaponDef=Class'KFGame.KFWeapDef_Hemogoblin'
    bStackDoT=true
    DoT_Type=EDamageOverTimeGroup.DOT_Bleeding
    DoT_Duration=5
    DoT_Interval=1
    DoT_DamageScale=0.5
    StumblePower=200
    GunHitPower=0
    BleedPower=50
    ModifierPerkList=/* Array type was not detected. */
    KDamageImpulse=0
}