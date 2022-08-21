//=============================================================================
// KFGameplayPoolManager
//=============================================================================
// Manages pools for puke mines, c4, etc
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//  - Matt 'Squirrlz' Farber
//=============================================================================
class KFGameplayPoolManager extends Object
	native;

enum eProjectilePoolType
{
	PPT_C4,
	PPT_PukeMine
};

struct native sProjectilePoolInfo
{
	// Player owning the projectiles
	var KFPlayerController ProjController;

	// Projectiles owned by this player
	var array<KFProjectile> Projectiles;
};

/** The maximum global number of C4 that can be active in play */
var protected byte MAX_ACTIVE_C4;

/** The maximum number of C4 each player can place */
var protected byte MAX_C4_PER_PLAYER;

/** The maximum global number of puke mines that can be active in play */
var protected byte MAX_ACTIVE_PUKE_MINES;

/** C4 spawned by players */
var transient protected array<sProjectilePoolInfo> ActiveC4Infos;

/** Puke mines spawned by players */
var transient protected array<sProjectilePoolInfo> ActivePukeMineInfos;

/** Returns the default instance of the pool manager */
native static function KFGameplayPoolManager GetPoolManager();

/** Determines the pool type and adds a new projectile to that pool */
function AddProjectileToPool( KFProjectile Proj, eProjectilePoolType PoolType )
{
	switch( PoolType )
	{
		case PPT_C4:
			AddProjectileToPool_Internal( ActiveC4Infos, Proj, MAX_ACTIVE_C4, MAX_C4_PER_PLAYER );
			break;

		case PPT_PukeMine:
			AddProjectileToPool_Internal( ActivePukeMineInfos, Proj, MAX_ACTIVE_PUKE_MINES, GetMaxPlayerPukeMineNum() );
			break;
	}
}

/** Determines the pool type and removes a projectile from the pool */
function RemoveProjectileFromPool( KFProjectile Proj, eProjectilePoolType PoolType )
{
	switch( PoolType )
	{
		case PPT_C4:
			RemoveProjectileFromPool_Internal( ActiveC4Infos, Proj );
			break;

		case PPT_PukeMine:
			RemoveProjectileFromPool_Internal( ActivePukeMineInfos, Proj );
			break;
	}
}

/** Add a projectile to its respective pool, removing the oldest if we are at the pool limit */
private function AddProjectileToPool_Internal( out array<sProjectilePoolInfo> PoolInfos, KFProjectile Proj,	byte MaxActiveProjectiles, byte MaxProjectilesPerPlayer )
{
	local int TotalProjectiles, Idx, i, j;
	local KFProjectile OldestProj;
	local float OldestProjCreationTime;
	local int OldestProjInfoIdx;

	Idx = -1;
	for( i = 0; i < PoolInfos.Length; ++i )
	{
		// If a player has left, reabsorb projectile slots into pool
		if( PoolInfos[i].ProjController == none || PoolInfos[i].ProjController.bDeleteMe )
		{
			for( j = 0; j < PoolInfos[i].Projectiles.Length; ++j )
			{
				PoolInfos[i].Projectiles[j].SetTimer( 1.f + Rand(5) + fRand(), false, nameOf(PoolInfos[i].Projectiles[j].Timer_Explode) );
			}
			PoolInfos.Remove( i, 1 );
			--i;
			continue;
		}
		else if( PoolInfos[i].ProjController == Proj.InstigatorController )
		{
			// Get our controller index in the array
			Idx = i;
		}

		// Count the total number of projectiles
		TotalProjectiles += PoolInfos[i].Projectiles.Length;

		// Get the index of the oldest projectile
		if( OldestProjCreationTime == 0.f || PoolInfos[i].Projectiles[0].CreationTime < OldestProjCreationTime )
		{
			OldestProjCreationTime = PoolInfos[i].Projectiles[0].CreationTime;
			OldestProj = PoolInfos[i].Projectiles[0];
			OldestProjInfoIdx = i;
		}
	}

	// Pick the end of the pool info array if the player doesn't exist in it yet
	if( Idx == INDEX_NONE )
	{
		Idx = PoolInfos.Length;
		PoolInfos.Insert( Idx, 1 );
		PoolInfos[Idx].ProjController = KFPlayerController(Proj.InstigatorController);
	}

	// Make sure we exceed neither mine limit
	if( TotalProjectiles >= MaxActiveProjectiles )
	{
		PoolInfos[OldestProjInfoIdx].Projectiles.Remove( 0, 1 );
	}
	else if( PoolInfos[Idx].Projectiles.Length >= MaxProjectilesPerPlayer )
	{
		OldestProj = PoolInfos[Idx].Projectiles[0];
		PoolInfos[Idx].Projectiles.Remove( 0, 1 );
	}
	else
	{
		OldestProj = none;
	}

	// Detonate our oldest projectile
	if( OldestProj != none )
	{
		OldestProj.Detonate();
	}

	// Add to pool array
	PoolInfos[Idx].Projectiles.AddItem( Proj );
}

/** Remove a projectile from the pool (it's been destroyed) */
private function RemoveProjectileFromPool_Internal( out array<sProjectilePoolInfo> PoolInfos, KFProjectile Proj )
{
	local int Idx, ProjIdx;

	Idx = PoolInfos.Find( 'ProjController', KFPlayerController(Proj.InstigatorController) );
	if( Idx != INDEX_NONE )
	{
		ProjIdx = PoolInfos[Idx].Projectiles.Find( Proj );
		if( ProjIdx != INDEX_NONE )
		{
			PoolInfos[Idx].Projectiles.Remove( ProjIdx, 1 );
		}
	}
}

/** Returns the number of active puke mines each player is allowed to have */
protected function int GetMaxPlayerPukeMineNum()
{
	local KFPawn BloatPawn;
	local byte NumBloats;

	foreach class'WorldInfo'.static.GetWorldInfo().AllPawns( class'KFPawn', BloatPawn )
	{
		if( BloatPawn.IsAliveAndWell() && BloatPawn.IsA('KFPawn_ZedBloat_Versus') )
		{
			++NumBloats;
		}
	}

	return MAX_ACTIVE_PUKE_MINES / Max( NumBloats, 1 );
}

/** Clears the pool arrays */
event Reset()
{
	ActivePukeMineInfos.Remove( 0, ActivePukeMineInfos.Length );
	ActiveC4Infos.Remove( 0, ActiveC4Infos.Length );
}

defaultproperties
{
	MAX_ACTIVE_C4=40
	MAX_C4_PER_PLAYER=10
	MAX_ACTIVE_PUKE_MINES=30
}