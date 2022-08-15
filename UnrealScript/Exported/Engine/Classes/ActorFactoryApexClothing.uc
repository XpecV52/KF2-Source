/*=============================================================================
	ActorFactoryApexClothing.uc: Implement APEX Clothing Actor Factory
	Copyright 2008-2009 NVIDIA corporation..
=============================================================================*/
class ActorFactoryApexClothing extends ActorFactorySkeletalMesh
	config(Editor)
	hidecategories(Object)
	native(Physics);
	
/** List of clothing assets associated with each material in this mesh. */	
var()	array<ApexClothingAsset>    ClothingAssets;

/** Allows setting the RBChannel flag on the spawned rigid body's StaticMeshComponent. */
var() const ERBCollisionChannel		ClothingRBChannel;

/** Define the channels with which this actor will collide. */
var() const RBCollisionChannelContainer ClothingRBCollideWithChannels;

// NVCHANGE_BEGIN: DJS - Add clothing wind support to clothing actor factory
/** If TRUE, WindVelocity is applied in the local space of the component, rather than world space. */
var() bool                  bLocalSpaceWind;

/** The Wind Velocity applied to Apex Clothing */
var() vector				WindVelocity;

/** Time taken for ApexClothing to reach WindVelocity */
var() float					WindVelocityBlendTime;
// NVCHANGE_END: DJS - Add clothing wind support to clothing actor factory

// NVCHANGE_BEGIN: hlanker - Add wind noise
/** Maximum noise amplitude */
var() float					WindStrengthNoiseBounds;

/** Maximum wind strength change per second */
var() float					WindStrengthNoiseStepSize;

/** Higher probability to stay around the center */
var() bool					bWindStrengthNoiseCentered;

/** Maximum angle (in radian) on direction noise*/
var() float					WindDirNoiseBounds;

/** Maximum angle change (in radian per second) */
var() float					WindDirNoiseStepSize;

/** Higher probability to stay around the center */
var() bool					bWindDirNoiseCentered;
// NVCHANGE_END: hlanker - Add wind noise

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   ClothingRBChannel=RBCC_Clothing
   ClothingRBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True,ClothingCollision=True)
   MenuName="Add Clothing"
   Name="Default__ActorFactoryApexClothing"
   ObjectArchetype=ActorFactorySkeletalMesh'Engine.Default__ActorFactorySkeletalMesh'
}
