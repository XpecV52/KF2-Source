/*******************************************************************************
 * KFGoreJointInfo generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGoreJointInfo extends Object
    editinlinenew
    hidecategories(Object);

struct BloodJetSettings
{
    /**  
     *Whether this attaches to a specific socket. Otherwise, it will attach to
     *               the parent bone of the dismembered bone
     */
    var() bool bAttachToSocket;
    /** Socket name if bAttachToSocket is TRUE */
    var() name SocketName<EditCondition=bAttachToSocket>;
    /** The particle system to use */
    var() ParticleSystem ParticleSystemTemplate;
    /** If specified, constrain the template the specific damage groups only */
    var() array<KFDamageType.EGoreDamageGroup> ConstrainToDamageGroups;

    structdefaultproperties
    {
        bAttachToSocket=false
        SocketName=None
        ParticleSystemTemplate=none
        ConstrainToDamageGroups=none
    }
};

struct BloodTrailSettings
{
    /** Whether this attaches to a specific socket. Otherwise, it will attach to the dismembered bone */
    var() bool bAttachToSocket;
    /** Socket name if bAttachToSocket is TRUE */
    var() name SocketName<EditCondition=bAttachToSocket>;
    /** The particle system to use */
    var() ParticleSystem ParticleSystemTemplate;
    /** If specified, constrain the template the specific damage groups only */
    var() array<KFDamageType.EGoreDamageGroup> ConstrainToDamageGroups;

    structdefaultproperties
    {
        bAttachToSocket=false
        SocketName=None
        ParticleSystemTemplate=none
        ConstrainToDamageGroups=none
    }
};

struct PartialBreakBone
{
    /** Name of the bone to be shrunk */
    var() name BoneName;
    /** Blood jet to attach to the parent of the partial break bone */
    var() editinline array<editinline BloodJetSettings> BloodJets;
    /** Name of the blood parameter to activate when the bone is dismembered or gibbed */
    var() array<name> BloodMICParamName;
    /**  
     *Particle effect to be spawned for this partial break.
     *               Note: This is different from the blood jet
     */
    var() ParticleSystem ParticleSystemTemplate;

    structdefaultproperties
    {
        BoneName=None
        BloodJets=none
        BloodMICParamName=none
        ParticleSystemTemplate=none
    }
};

struct PartialBreakSettings
{
    /**  
     *List of child bones that can be shrunk when the bone is hit. If the array contains
     *               more than 1 bone, the bone that is closest to the HitBone will be selected
     */
    var() editinline array<editinline PartialBreakBone> PartialBreakBones<DisplayName=Shrink Bones>;
    /**  
     *If specified, constrain partial break to the specific damage groups only.
     *               Otherwise, all damage types can cause this partial break.
     */
    var() array<KFDamageType.EGoreDamageGroup> ConstrainToDamageGroups;
    /** Additional DamageGroups that can cause this break only on the killing blow */
    var() array<KFDamageType.EGoreDamageGroup> KillingBlowDamageGroups;

    structdefaultproperties
    {
        PartialBreakBones=none
        ConstrainToDamageGroups=none
        KillingBlowDamageGroups=none
    }
};

struct ExplosionBreakBone
{
    /** Name of the bone to be dismembered */
    var() name BoneName;
    /** Blood jet to attach to the parent of the dismembered bone */
    var() editinline array<editinline BloodJetSettings> BloodJets;
    /** Blood trails to attach to the dismembered bone */
    var() array<BloodTrailSettings> BloodTrails;
    /** Name of the blood parameter to activate when the bone is gibbed */
    var() array<name> BloodMICParamName;

    structdefaultproperties
    {
        BoneName=None
        BloodJets=none
        BloodTrails=none
        BloodMICParamName=none
    }
};

struct ExplosionBreakSettings
{
    /**  
     *List of constraints that will be broken on an explosion. ALL of the break
     *               bones will be dismembered
     */
    var() array<ExplosionBreakBone> BreakBones<DisplayName=Break Bones>;
    /**  
     *Particle effect to be spawned. The effect will be spawned at the location
     *       of the hit bone that triggered this explosion
     */
    var() ParticleSystem ParticleSystemTemplate;
    /**  
     *If specified, constrain explosion to the specific damage groups only.
     *               Otherwise, all damage types can cause this explosion.
     */
    var() array<KFDamageType.EGoreDamageGroup> ConstrainToDamageGroups;

    structdefaultproperties
    {
        BreakBones=none
        ParticleSystemTemplate=none
        ConstrainToDamageGroups=none
    }
};

struct DependentBreakBone
{
    /** Name of the bone to be dismembered */
    var() name BoneName;
    /** Blood jet to attach to the parent of the dismembered bone */
    var() editinline array<editinline BloodJetSettings> BloodJets;
    /** Blood trails to attach to the dismembered bone */
    var() array<BloodTrailSettings> BloodTrails;
    /** Name of the blood parameter to activate when the bone is dismembered or gibbed */
    var() array<name> BloodMICParamName;
    /** Particle effect to be spawned specifically for this dependent break */
    var() ParticleSystem ParticleSystemTemplate;

    structdefaultproperties
    {
        BoneName=None
        BloodJets=none
        BloodTrails=none
        BloodMICParamName=none
        ParticleSystemTemplate=none
    }
};

struct DependentBreakSettings
{
    /** List of bones that need to get broken due to dependency */
    var() editinline array<editinline DependentBreakBone> DependentBones;
    /** If specified, constrain dependant breaks to the specific damage groups only */
    var() array<KFDamageType.EGoreDamageGroup> ConstrainToDamageGroups;

    structdefaultproperties
    {
        DependentBones=none
        ConstrainToDamageGroups=none
    }
};

struct DismembermentEffect
{
    /** Particle effect to be spawned */
    var() ParticleSystem ParticleSystemTemplate;
    /** If specified, constrain effect to the specific damage groups only */
    var() array<KFDamageType.EGoreDamageGroup> ConstrainToDamageGroups;

    structdefaultproperties
    {
        ParticleSystemTemplate=none
        ConstrainToDamageGroups=none
    }
};

/**  
 *Name of the bone that was hit (as per the hit detection system).
 *You only set up the bones that correspond to a hit zone in a physics asset.
 *ALL the hit zone bones must be set up here even if they don't dismember.
 */
var() name HitBoneName;
/** If TRUE, the joint cannot be dismembered. This applies to gibbing due to an explosion as well. */
var(PrimaryDismemberment) bool bNonBreakableJoint;
/** Use to specify bone shrinking gore */
var(AuxiliaryDismemberment) array<PartialBreakSettings> BoneShrinkGore;
/**  
 *Use to specify explosion effects for characters (such as the bloat) that
 *explode on death even when hit by a non-explosive weapon
 */
var(AuxiliaryDismemberment) array<ExplosionBreakSettings> HitExplosionGore;
/** Use to specify joints that have dependencies that need to be respected when breaking the mesh */
var(AuxiliaryDismemberment) array<DependentBreakSettings> DependentBreakGore;
/**  
 *Use to specify blood jet effects for this bone.
 *Blood jets are attached to the parent of the dismembered bone or a specified socket thereof.
 */
var(PrimaryDismemberment) array<BloodJetSettings> BloodJets;
/**  
 *Use to specify blood trail effects for this bone.
 *Blood trails are attached to the dismembered bone or a specified socket thereof.
 */
var(PrimaryDismemberment) array<BloodTrailSettings> BloodTrails;
/**  
 *Name of the blood parameter(s) to activate when the bone is dismembered or gibbed.
 *This is used to add a blood overlay to the dismembered mesh.
 */
var(PrimaryDismemberment) array<name> BloodMICParamName;
/**  
 *Particle effect settings when the bone is dismembered.
 *The effect is played at the location of the dismembered bone
 */
var(PrimaryDismemberment) array<DismembermentEffect> DismembermentEffects;
