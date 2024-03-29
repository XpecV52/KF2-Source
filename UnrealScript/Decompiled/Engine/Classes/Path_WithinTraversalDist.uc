/*******************************************************************************
 * Path_WithinTraversalDist generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Path_WithinTraversalDist extends PathConstraint
    native(AI);

/** Maximum distance to traverse along a branch */
var() float MaxTraversalDist;
/** if this is on instead of throwing out nodes outside traversal distance they will be gradiently penalized the further out they are */
var() bool bSoft;
/** when a path exceeds specified traversal distance this penantly will be applied, and scaled up depending on how far outside the dist it is */
var() float SoftStartPenalty;

static function bool DontExceedMaxDist(Pawn P, float InMaxTraversalDist, optional bool bInSoft)
{
    local Path_WithinTraversalDist Con;

    bInSoft = true;
    if((P != none) && InMaxTraversalDist > 0)
    {
        Con = Path_WithinTraversalDist(P.CreatePathConstraint(default.Class));
        if(Con != none)
        {
            Con.MaxTraversalDist = InMaxTraversalDist;
            Con.bSoft = bInSoft;
            P.AddPathConstraint(Con);
            return true;
        }
    }
    return false;
}

function Recycle()
{
    super.Recycle();
    MaxTraversalDist = default.MaxTraversalDist;
    bSoft = default.bSoft;
    SoftStartPenalty = default.SoftStartPenalty;
}

defaultproperties
{
    bSoft=true
    SoftStartPenalty=320
    CacheIdx=4
}