//=============================================================================
// KFPawnBlockingVolume
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawnBlockingVolume extends BlockingVolume
	native(Pawn)
	placeable;

/** whether to block PCs */
var() bool bBlockPlayers;
/** whether to block NPCs */
var() bool bBlockMonsters;

cpptext
{
	// Since we use Actor::IsPlayerOwned, ShouldTrace will only work properly on
	// Role > ROLE_SimulatedProxy which is good enough for us.  To use IgnoreBlockingBy
	// we would need to set bWorldGeometry=FALSE and use a const_cast.
	UBOOL ShouldTrace( UPrimitiveComponent* Primitive, AActor* SourceActor, DWORD TraceFlags );
}

defaultproperties
{
	bBlockPlayers=true
	bBlockMonsters=false

	BlockRigidBody=false
}
