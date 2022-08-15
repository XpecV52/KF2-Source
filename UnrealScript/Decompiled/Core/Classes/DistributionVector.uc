/*******************************************************************************
 * DistributionVector generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DistributionVector extends Component
    abstract
    native
    editinlinenew
    collapsecategories
    hidecategories(Object);

enum EDistributionVectorLockFlags
{
    EDVLF_None,
    EDVLF_XY,
    EDVLF_XZ,
    EDVLF_YZ,
    EDVLF_XYZ,
    EDVLF_MAX
};

enum EDistributionVectorMirrorFlags
{
    EDVMF_Same,
    EDVMF_Different,
    EDVMF_Mirror,
    EDVMF_MAX
};

struct native RawDistributionVector extends RawDistribution
{
    var() noclear export editinline DistributionVector Distribution;
};

var private native const noexport Pointer VfTable_FCurveEdInterface;
/** Can this variable be baked out to a FRawDistribution? Should be TRUE 99% of the time */
var(Baked) bool bCanBeBaked;
var bool bIsDirty;

// Export UDistributionVector::execGetVectorValue(FFrame&, void* const)
native function Vector GetVectorValue(optional float F, optional int LastExtreme)
{
    F = 0;
    LastExtreme = 0;                
}

defaultproperties
{
    bCanBeBaked=true
    bIsDirty=true
}