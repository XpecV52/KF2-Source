/*******************************************************************************
 * AnimTreeEdSkelComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AnimTreeEdSkelComponent extends SkeletalMeshComponent
    native
    editinlinenew
    hidecategories(Object);

cpptext
{
	// UPrimitiveComponent interface.
	virtual void Render(const FSceneView* View, class FPrimitiveDrawInterface* PDI);

	// USkeletalMeshComponent interface.
	virtual UBOOL LegLineCheck(const FVector& Start, const FVector& End, FVector& HitLocation, FVector& HitNormal, const FVector& Extent = FVector(0.f));

}

var native const transient Pointer AnimTreeEdPtr;

defaultproperties
{
    ReplacementPrimitive=none
}